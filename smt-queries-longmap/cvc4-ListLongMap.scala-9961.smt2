; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117628 () Bool)

(assert start!117628)

(declare-fun b!1380830 () Bool)

(declare-fun e!782600 () Bool)

(declare-fun call!66424 () (_ BitVec 32))

(declare-fun call!66425 () (_ BitVec 32))

(assert (=> b!1380830 (= e!782600 (= call!66424 call!66425))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun bm!66421 () Bool)

(declare-datatypes ((array!94146 0))(
  ( (array!94147 (arr!45466 (Array (_ BitVec 32) (_ BitVec 64))) (size!46016 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94146)

(declare-fun arrayCountValidKeys!0 (array!94146 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66421 (= call!66425 (arrayCountValidKeys!0 a!3931 from!3309 to!105))))

(declare-fun b!1380831 () Bool)

(declare-fun e!782598 () Bool)

(declare-fun call!66427 () (_ BitVec 32))

(declare-fun call!66426 () (_ BitVec 32))

(assert (=> b!1380831 (= e!782598 (= (bvadd #b00000000000000000000000000000001 call!66427) call!66426))))

(declare-fun b!1380832 () Bool)

(declare-fun e!782597 () Bool)

(assert (=> b!1380832 (= e!782597 (not e!782600))))

(declare-fun c!128498 () Bool)

(declare-fun lt!608093 () Bool)

(assert (=> b!1380832 (= c!128498 lt!608093)))

(assert (=> b!1380832 e!782598))

(declare-fun c!128499 () Bool)

(assert (=> b!1380832 (= c!128499 lt!608093)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380832 (= lt!608093 (validKeyInArray!0 (select (arr!45466 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!46021 0))(
  ( (Unit!46022) )
))
(declare-fun lt!608094 () Unit!46021)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94146 (_ BitVec 32) (_ BitVec 32)) Unit!46021)

(assert (=> b!1380832 (= lt!608094 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun bm!66422 () Bool)

(assert (=> bm!66422 (= call!66427 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun res!922714 () Bool)

(assert (=> start!117628 (=> (not res!922714) (not e!782597))))

(assert (=> start!117628 (= res!922714 (and (bvslt (size!46016 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46016 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117628 e!782597))

(declare-fun array_inv!34494 (array!94146) Bool)

(assert (=> start!117628 (array_inv!34494 a!3931)))

(assert (=> start!117628 true))

(declare-fun bm!66423 () Bool)

(assert (=> bm!66423 (= call!66424 (arrayCountValidKeys!0 a!3931 from!3309 (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380833 () Bool)

(assert (=> b!1380833 (= e!782598 (= call!66427 call!66426))))

(declare-fun b!1380834 () Bool)

(assert (=> b!1380834 (= e!782600 (= (bvadd #b00000000000000000000000000000001 call!66424) call!66425))))

(declare-fun bm!66424 () Bool)

(assert (=> bm!66424 (= call!66426 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(assert (= (and start!117628 res!922714) b!1380832))

(assert (= (and b!1380832 c!128499) b!1380831))

(assert (= (and b!1380832 (not c!128499)) b!1380833))

(assert (= (or b!1380831 b!1380833) bm!66424))

(assert (= (or b!1380831 b!1380833) bm!66422))

(assert (= (and b!1380832 c!128498) b!1380834))

(assert (= (and b!1380832 (not c!128498)) b!1380830))

(assert (= (or b!1380834 b!1380830) bm!66421))

(assert (= (or b!1380834 b!1380830) bm!66423))

(declare-fun m!1266083 () Bool)

(assert (=> bm!66421 m!1266083))

(declare-fun m!1266085 () Bool)

(assert (=> start!117628 m!1266085))

(declare-fun m!1266087 () Bool)

(assert (=> bm!66423 m!1266087))

(declare-fun m!1266089 () Bool)

(assert (=> bm!66422 m!1266089))

(declare-fun m!1266091 () Bool)

(assert (=> b!1380832 m!1266091))

(assert (=> b!1380832 m!1266091))

(declare-fun m!1266093 () Bool)

(assert (=> b!1380832 m!1266093))

(declare-fun m!1266095 () Bool)

(assert (=> b!1380832 m!1266095))

(declare-fun m!1266097 () Bool)

(assert (=> bm!66424 m!1266097))

(push 1)

(assert (not start!117628))

(assert (not bm!66421))

(assert (not bm!66423))

(assert (not bm!66424))

(assert (not b!1380832))

(assert (not bm!66422))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!148893 () Bool)

(declare-fun lt!608117 () (_ BitVec 32))

(assert (=> d!148893 (and (bvsge lt!608117 #b00000000000000000000000000000000) (bvsle lt!608117 (bvsub (size!46016 a!3931) (bvadd #b00000000000000000000000000000001 from!3309))))))

(declare-fun e!782636 () (_ BitVec 32))

(assert (=> d!148893 (= lt!608117 e!782636)))

(declare-fun c!128529 () Bool)

(assert (=> d!148893 (= c!128529 (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(assert (=> d!148893 (and (bvsle (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000) (bvsle to!105 (size!46016 a!3931)))))

(assert (=> d!148893 (= (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105) lt!608117)))

(declare-fun b!1380898 () Bool)

(declare-fun e!782635 () (_ BitVec 32))

(declare-fun call!66450 () (_ BitVec 32))

(assert (=> b!1380898 (= e!782635 (bvadd #b00000000000000000000000000000001 call!66450))))

(declare-fun b!1380899 () Bool)

(assert (=> b!1380899 (= e!782636 #b00000000000000000000000000000000)))

(declare-fun b!1380900 () Bool)

(assert (=> b!1380900 (= e!782635 call!66450)))

(declare-fun bm!66447 () Bool)

(assert (=> bm!66447 (= call!66450 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309 #b00000000000000000000000000000001) to!105))))

(declare-fun b!1380901 () Bool)

(assert (=> b!1380901 (= e!782636 e!782635)))

(declare-fun c!128530 () Bool)

(assert (=> b!1380901 (= c!128530 (validKeyInArray!0 (select (arr!45466 a!3931) (bvadd #b00000000000000000000000000000001 from!3309))))))

(assert (= (and d!148893 c!128529) b!1380899))

(assert (= (and d!148893 (not c!128529)) b!1380901))

(assert (= (and b!1380901 c!128530) b!1380898))

(assert (= (and b!1380901 (not c!128530)) b!1380900))

(assert (= (or b!1380898 b!1380900) bm!66447))

(declare-fun m!1266129 () Bool)

(assert (=> bm!66447 m!1266129))

(declare-fun m!1266131 () Bool)

(assert (=> b!1380901 m!1266131))

(assert (=> b!1380901 m!1266131))

(declare-fun m!1266133 () Bool)

(assert (=> b!1380901 m!1266133))

(assert (=> bm!66424 d!148893))

(declare-fun d!148899 () Bool)

(assert (=> d!148899 (= (validKeyInArray!0 (select (arr!45466 a!3931) (bvsub to!105 #b00000000000000000000000000000001))) (and (not (= (select (arr!45466 a!3931) (bvsub to!105 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45466 a!3931) (bvsub to!105 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1380832 d!148899))

(declare-fun call!66459 () (_ BitVec 32))

(declare-fun bm!66456 () Bool)

(assert (=> bm!66456 (= call!66459 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun bm!66457 () Bool)

(declare-fun call!66460 () (_ BitVec 32))

(assert (=> bm!66457 (= call!66460 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380919 () Bool)

(declare-fun e!782647 () Bool)

(assert (=> b!1380919 (= e!782647 (= (bvadd call!66459 #b00000000000000000000000000000001) call!66460))))

(declare-fun d!148901 () Bool)

(declare-fun e!782648 () Bool)

(assert (=> d!148901 e!782648))

(declare-fun res!922723 () Bool)

(assert (=> d!148901 (=> (not res!922723) (not e!782648))))

(declare-fun lt!608127 () (_ BitVec 32))

(assert (=> d!148901 (= res!922723 (and (bvsge lt!608127 #b00000000000000000000000000000000) (bvslt lt!608127 (size!46016 a!3931))))))

(assert (=> d!148901 (= lt!608127 (bvsub to!105 #b00000000000000000000000000000001))))

(declare-fun lt!608126 () Unit!46021)

(declare-fun choose!86 (array!94146 (_ BitVec 32) (_ BitVec 32)) Unit!46021)

(assert (=> d!148901 (= lt!608126 (choose!86 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(assert (=> d!148901 (and (bvslt (size!46016 a!3931) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000) (bvsgt to!105 (bvadd #b00000000000000000000000000000001 from!3309)) (bvsle to!105 (size!46016 a!3931)))))

(assert (=> d!148901 (= (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105) lt!608126)))

(declare-fun b!1380920 () Bool)

(assert (=> b!1380920 (= e!782648 e!782647)))

(declare-fun c!128538 () Bool)

(assert (=> b!1380920 (= c!128538 (validKeyInArray!0 (select (arr!45466 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-fun b!1380921 () Bool)

(assert (=> b!1380921 (= e!782647 (= call!66459 call!66460))))

(assert (= (and d!148901 res!922723) b!1380920))

(assert (= (and b!1380920 c!128538) b!1380919))

(assert (= (and b!1380920 (not c!128538)) b!1380921))

(assert (= (or b!1380919 b!1380921) bm!66457))

(assert (= (or b!1380919 b!1380921) bm!66456))

(assert (=> bm!66456 m!1266089))

(assert (=> bm!66457 m!1266097))

(declare-fun m!1266141 () Bool)

(assert (=> d!148901 m!1266141))

(assert (=> b!1380920 m!1266091))

(assert (=> b!1380920 m!1266091))

(assert (=> b!1380920 m!1266093))

(assert (=> b!1380832 d!148901))

(declare-fun d!148909 () Bool)

(assert (=> d!148909 (= (array_inv!34494 a!3931) (bvsge (size!46016 a!3931) #b00000000000000000000000000000000))))

(assert (=> start!117628 d!148909))

(declare-fun d!148911 () Bool)

(declare-fun lt!608128 () (_ BitVec 32))

(assert (=> d!148911 (and (bvsge lt!608128 #b00000000000000000000000000000000) (bvsle lt!608128 (bvsub (size!46016 a!3931) from!3309)))))

(declare-fun e!782650 () (_ BitVec 32))

(assert (=> d!148911 (= lt!608128 e!782650)))

(declare-fun c!128539 () Bool)

(assert (=> d!148911 (= c!128539 (bvsge from!3309 to!105))))

(assert (=> d!148911 (and (bvsle from!3309 to!105) (bvsge from!3309 #b00000000000000000000000000000000) (bvsle to!105 (size!46016 a!3931)))))

(assert (=> d!148911 (= (arrayCountValidKeys!0 a!3931 from!3309 to!105) lt!608128)))

(declare-fun b!1380922 () Bool)

(declare-fun e!782649 () (_ BitVec 32))

(declare-fun call!66461 () (_ BitVec 32))

(assert (=> b!1380922 (= e!782649 (bvadd #b00000000000000000000000000000001 call!66461))))

(declare-fun b!1380923 () Bool)

(assert (=> b!1380923 (= e!782650 #b00000000000000000000000000000000)))

(declare-fun b!1380924 () Bool)

(assert (=> b!1380924 (= e!782649 call!66461)))

(declare-fun bm!66458 () Bool)

(assert (=> bm!66458 (= call!66461 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) to!105))))

(declare-fun b!1380925 () Bool)

(assert (=> b!1380925 (= e!782650 e!782649)))

(declare-fun c!128540 () Bool)

(assert (=> b!1380925 (= c!128540 (validKeyInArray!0 (select (arr!45466 a!3931) from!3309)))))

(assert (= (and d!148911 c!128539) b!1380923))

(assert (= (and d!148911 (not c!128539)) b!1380925))

(assert (= (and b!1380925 c!128540) b!1380922))

(assert (= (and b!1380925 (not c!128540)) b!1380924))

(assert (= (or b!1380922 b!1380924) bm!66458))

(declare-fun m!1266143 () Bool)

(assert (=> bm!66458 m!1266143))

(declare-fun m!1266145 () Bool)

(assert (=> b!1380925 m!1266145))

(assert (=> b!1380925 m!1266145))

(declare-fun m!1266147 () Bool)

(assert (=> b!1380925 m!1266147))

(assert (=> bm!66421 d!148911))

(declare-fun d!148913 () Bool)

(declare-fun lt!608129 () (_ BitVec 32))

(assert (=> d!148913 (and (bvsge lt!608129 #b00000000000000000000000000000000) (bvsle lt!608129 (bvsub (size!46016 a!3931) from!3309)))))

(declare-fun e!782652 () (_ BitVec 32))

(assert (=> d!148913 (= lt!608129 e!782652)))

(declare-fun c!128541 () Bool)

(assert (=> d!148913 (= c!128541 (bvsge from!3309 (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (=> d!148913 (and (bvsle from!3309 (bvsub to!105 #b00000000000000000000000000000001)) (bvsge from!3309 #b00000000000000000000000000000000) (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!46016 a!3931)))))

(assert (=> d!148913 (= (arrayCountValidKeys!0 a!3931 from!3309 (bvsub to!105 #b00000000000000000000000000000001)) lt!608129)))

(declare-fun b!1380926 () Bool)

(declare-fun e!782651 () (_ BitVec 32))

(declare-fun call!66462 () (_ BitVec 32))

(assert (=> b!1380926 (= e!782651 (bvadd #b00000000000000000000000000000001 call!66462))))

(declare-fun b!1380927 () Bool)

(assert (=> b!1380927 (= e!782652 #b00000000000000000000000000000000)))

(declare-fun b!1380928 () Bool)

(assert (=> b!1380928 (= e!782651 call!66462)))

(declare-fun bm!66459 () Bool)

(assert (=> bm!66459 (= call!66462 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380929 () Bool)

(assert (=> b!1380929 (= e!782652 e!782651)))

(declare-fun c!128542 () Bool)

(assert (=> b!1380929 (= c!128542 (validKeyInArray!0 (select (arr!45466 a!3931) from!3309)))))

(assert (= (and d!148913 c!128541) b!1380927))

(assert (= (and d!148913 (not c!128541)) b!1380929))

(assert (= (and b!1380929 c!128542) b!1380926))

(assert (= (and b!1380929 (not c!128542)) b!1380928))

(assert (= (or b!1380926 b!1380928) bm!66459))

(declare-fun m!1266149 () Bool)

(assert (=> bm!66459 m!1266149))

(assert (=> b!1380929 m!1266145))

(assert (=> b!1380929 m!1266145))

(assert (=> b!1380929 m!1266147))

(assert (=> bm!66423 d!148913))

(declare-fun d!148915 () Bool)

(declare-fun lt!608130 () (_ BitVec 32))

(assert (=> d!148915 (and (bvsge lt!608130 #b00000000000000000000000000000000) (bvsle lt!608130 (bvsub (size!46016 a!3931) (bvadd #b00000000000000000000000000000001 from!3309))))))

(declare-fun e!782654 () (_ BitVec 32))

(assert (=> d!148915 (= lt!608130 e!782654)))

(declare-fun c!128543 () Bool)

(assert (=> d!148915 (= c!128543 (bvsge (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (=> d!148915 (and (bvsle (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000) (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!46016 a!3931)))))

(assert (=> d!148915 (= (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)) lt!608130)))

(declare-fun b!1380930 () Bool)

(declare-fun e!782653 () (_ BitVec 32))

(declare-fun call!66463 () (_ BitVec 32))

(assert (=> b!1380930 (= e!782653 (bvadd #b00000000000000000000000000000001 call!66463))))

(declare-fun b!1380931 () Bool)

(assert (=> b!1380931 (= e!782654 #b00000000000000000000000000000000)))

(declare-fun b!1380932 () Bool)

(assert (=> b!1380932 (= e!782653 call!66463)))

(declare-fun bm!66460 () Bool)

(assert (=> bm!66460 (= call!66463 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380933 () Bool)

(assert (=> b!1380933 (= e!782654 e!782653)))

(declare-fun c!128544 () Bool)

(assert (=> b!1380933 (= c!128544 (validKeyInArray!0 (select (arr!45466 a!3931) (bvadd #b00000000000000000000000000000001 from!3309))))))

(assert (= (and d!148915 c!128543) b!1380931))

(assert (= (and d!148915 (not c!128543)) b!1380933))

(assert (= (and b!1380933 c!128544) b!1380930))

(assert (= (and b!1380933 (not c!128544)) b!1380932))

(assert (= (or b!1380930 b!1380932) bm!66460))

(declare-fun m!1266151 () Bool)

(assert (=> bm!66460 m!1266151))

(assert (=> b!1380933 m!1266131))

(assert (=> b!1380933 m!1266131))

(assert (=> b!1380933 m!1266133))

(assert (=> bm!66422 d!148915))

(push 1)

(assert (not b!1380933))

(assert (not bm!66457))

(assert (not bm!66447))

(assert (not b!1380901))

(assert (not b!1380929))

(assert (not bm!66460))

(assert (not bm!66456))

(assert (not bm!66459))

(assert (not bm!66458))

(assert (not b!1380925))

(assert (not d!148901))

(assert (not b!1380920))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

