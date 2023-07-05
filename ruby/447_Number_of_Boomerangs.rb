def number_of_boomerangs(points)
    log = []
    ans = 0
    points.each_with_index do |p_l1, index_l1|
        logs = {}
        points.each_with_index do |p_l2, index_l2|
            next if index_l1 == index_l2
            dis = get_distance(p_l1, p_l2)

            unless logs.key?(dis)
                logs[dis] = 0
            else
                count = logs[dis]
                ans+=count + 1
                logs[dis] = count + 1
            end
        end
    end

    ans * 2
end

def get_distance(p1, p2)
    x = p1[0] - p2[0]
    y = p1[1] - p2[1]

    (x * x) + (y * y)
end

test_data = [[0,0],[1,0],[-1,0],[0,1],[0,-1]]
p number_of_boomerangs(test_data)
