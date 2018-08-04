class VoteReset

    def initialize()
    end

    def call()
        Vote.all.each do |vote|
            puts vote.restaurant.name
        end
    end
end