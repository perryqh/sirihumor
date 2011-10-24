require 'spec_helper'

describe ThankYouMailer do
  it 'should send success' do
    email = ThankYouMailer.success('from@me.com')
    email.subject.should == "Thank you for your sirihumor.me screenshot"
    email.from.should == ['do-not-respond@mail.sirihumor.me']
    email.to.should == ['from@me.com']
  end

  it 'should send failure' do
    email = ThankYouMailer.failure('from@me.com', "error 1. error 2.")
    email.subject.should == "sirihumor.me Attachment Error"
    email.from.should == ['do-not-respond@mail.sirihumor.me']
    email.to.should == ['from@me.com']
  end
end
