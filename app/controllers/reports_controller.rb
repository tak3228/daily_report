class ReportsController < ApplicationController
	def index
		require "date"
		youbi = %w[日 月 火 水 木 金 土]
		d = Date.today
		@youbi = youbi[d.wday]
		@end_hour = Time.now.strftime('%H').to_i
		@end_minit = Time.now.strftime('%M').to_i
		@start_time = 10
		@today = Time.now.strftime('%Y-%m-%d')
		@end   = Time.now.strftime('%H')
		@end_minit = Time.now.strftime('%M').to_i
		#30分区切りにする
		if @end_minit > 30
			@time  = '10:00-' + @end + ':30'
			@work_time = @end_hour - @start_time + 0.5
		else
			@time  = '10:00-' + @end + ':00'
			@work_time = @end_hour - @start_time
		end
		@working_time = @work_time - 1
		#@report = Report.find_by(id: 1).body
	end


	def update
		@message.update(report_params)
		redirect_to root_path , notice: '編集しました '
	end

	private
	def report_params
		params.require(:report).permit(:body)
	end

end
