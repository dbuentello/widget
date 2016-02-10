package com.ebillity.core.view.mediator.main
{

	import com.ebillity.core.model.modelinfo.BaseInfoModelLocator;
	import com.ebillity.core.view.ui.main.MainView;

	import org.robotlegs.mvcs.Mediator;



	public class MainViewMediator extends Mediator
	{

		[Inject]
		public var view:MainView;

		[Inject]
		public var baseInfoModel:BaseInfoModelLocator;

		override public function onRegister():void
		{
			super.onRegister();
			baseInfoModel.loggedInSignal.add( userLogin_signalHandler );
		}

		private function userLogin_signalHandler( isLogin:Boolean ):void
		{
			if ( isLogin )
				view.state = MainView.STATE_ADMIN;
		}

		override public function onRemove():void
		{
			super.onRemove();
			baseInfoModel.loggedInSignal.remove( userLogin_signalHandler );
		}
	}
}