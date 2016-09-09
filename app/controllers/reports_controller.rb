class ReportsController < ApplicationController
  def index
		require "date"
		youbi = %w[日 月 火 水 木 金 土]
		d = Date.today
		@youbi = youbi[d.wday]
		@end_time = Time.now.strftime('%H').to_i
		@start_time = 10
		@work_time = @end_time - @start_time
		@working_time = @work_time - 1
		@today = Time.now.strftime('%Y-%m-%d')
		@end   = Time.now.strftime('%H')
		@time  = '10:00-' + @end + ':00' 


  end
end
