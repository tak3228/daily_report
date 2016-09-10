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
		@end_minit = Time.now.strftime('%M').to_i
		if @end_minit.to_i > 30
			@time  = '10:00-' + @end + ':30'
		else
			@time  = '10:00-' + @end + ':00'
		end
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
