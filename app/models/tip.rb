class Tip < ApplicationRecord
    def self.values_sum
        Tip.all.pluck(:value).sum
    end

    def brt_time_zone
        Time.use_zone("America/Sao_Paulo") do
            Time.zone.parse(self.created_at.to_s).strftime("%d/%m/%Y - %H:%M:%S") 
        end
    end
end
