class Member < ApplicationRecord

    has_many :friendships, dependent: :destroy
    has_many :friends, through: :friendships
    has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
    has_many :inverse_friends, through: :inverse_friendships, source: :member

    validates :first_name, :last_name, :url, presence: true

    before_save do
        self.shortened_url = UrlService.shorten(self.url)
    end

    attribute :my_friends

    def my_friends
        friends.count + inverse_friends.count
    end

    def full_name
        first_name + ' ' + last_name
    end

    def self.search(source, dest)
        route = ''
        nodes = {}
        graph = Graph.new

        # Loop through all members and create nodes
        Member.all.each do |member|
            node_key  =  "node_#{member.id}"
            nodes.merge!(node_key => Node.new(member.full_name))
        end

        # Loop through all friendships and create edges
        Friendship.all.each do |friendship|
            # Get the source and destination nodes
            member_node = nodes["node_#{friendship.member_id}"]
            friend_node = nodes["node_#{friendship.friend_id}"]
            # Add the edge relation in the members graph
            graph.add_edge(member_node, friend_node)
        end

        # Get source and dest nodes
        source_node = nodes["node_#{source}"]
        dest_node   = nodes["node_#{dest}"]

        # Find shortest path between source and dest
        path = SearchService.new(graph, source_node).shortest_path_to(dest_node)

        # Create shortest path string result
        path.each_with_index do |p, index|
            if index == path.size - 1
                route += p.name
            else
                route += p.name + ' -> '
            end
        end

        route

    end

end
