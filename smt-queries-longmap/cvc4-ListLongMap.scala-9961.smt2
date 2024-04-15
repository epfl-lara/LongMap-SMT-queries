; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117622 () Bool)

(assert start!117622)

(declare-fun call!66395 () (_ BitVec 32))

(declare-fun bm!66390 () Bool)

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94094 0))(
  ( (array!94095 (arr!45440 (Array (_ BitVec 32) (_ BitVec 64))) (size!45992 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94094)

(declare-fun arrayCountValidKeys!0 (array!94094 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66390 (= call!66395 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380746 () Bool)

(declare-fun e!782554 () Bool)

(declare-fun call!66396 () (_ BitVec 32))

(assert (=> b!1380746 (= e!782554 (= (bvadd #b00000000000000000000000000000001 call!66395) call!66396))))

(declare-fun bm!66391 () Bool)

(assert (=> bm!66391 (= call!66396 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380747 () Bool)

(declare-fun e!782557 () Bool)

(declare-fun call!66393 () (_ BitVec 32))

(declare-fun call!66394 () (_ BitVec 32))

(assert (=> b!1380747 (= e!782557 (= call!66393 call!66394))))

(declare-fun b!1380748 () Bool)

(assert (=> b!1380748 (= e!782554 (= call!66395 call!66396))))

(declare-fun bm!66392 () Bool)

(assert (=> bm!66392 (= call!66393 (arrayCountValidKeys!0 a!3931 from!3309 (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380749 () Bool)

(assert (=> b!1380749 (= e!782557 (= (bvadd #b00000000000000000000000000000001 call!66393) call!66394))))

(declare-fun res!922685 () Bool)

(declare-fun e!782555 () Bool)

(assert (=> start!117622 (=> (not res!922685) (not e!782555))))

(assert (=> start!117622 (= res!922685 (and (bvslt (size!45992 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45992 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117622 e!782555))

(declare-fun array_inv!34673 (array!94094) Bool)

(assert (=> start!117622 (array_inv!34673 a!3931)))

(assert (=> start!117622 true))

(declare-fun b!1380750 () Bool)

(assert (=> b!1380750 (= e!782555 (not e!782557))))

(declare-fun c!128473 () Bool)

(declare-fun lt!607904 () Bool)

(assert (=> b!1380750 (= c!128473 lt!607904)))

(assert (=> b!1380750 e!782554))

(declare-fun c!128474 () Bool)

(assert (=> b!1380750 (= c!128474 lt!607904)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380750 (= lt!607904 (validKeyInArray!0 (select (arr!45440 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45860 0))(
  ( (Unit!45861) )
))
(declare-fun lt!607903 () Unit!45860)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94094 (_ BitVec 32) (_ BitVec 32)) Unit!45860)

(assert (=> b!1380750 (= lt!607903 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun bm!66393 () Bool)

(assert (=> bm!66393 (= call!66394 (arrayCountValidKeys!0 a!3931 from!3309 to!105))))

(assert (= (and start!117622 res!922685) b!1380750))

(assert (= (and b!1380750 c!128474) b!1380746))

(assert (= (and b!1380750 (not c!128474)) b!1380748))

(assert (= (or b!1380746 b!1380748) bm!66391))

(assert (= (or b!1380746 b!1380748) bm!66390))

(assert (= (and b!1380750 c!128473) b!1380749))

(assert (= (and b!1380750 (not c!128473)) b!1380747))

(assert (= (or b!1380749 b!1380747) bm!66393))

(assert (= (or b!1380749 b!1380747) bm!66392))

(declare-fun m!1265563 () Bool)

(assert (=> start!117622 m!1265563))

(declare-fun m!1265565 () Bool)

(assert (=> bm!66393 m!1265565))

(declare-fun m!1265567 () Bool)

(assert (=> bm!66391 m!1265567))

(declare-fun m!1265569 () Bool)

(assert (=> b!1380750 m!1265569))

(assert (=> b!1380750 m!1265569))

(declare-fun m!1265571 () Bool)

(assert (=> b!1380750 m!1265571))

(declare-fun m!1265573 () Bool)

(assert (=> b!1380750 m!1265573))

(declare-fun m!1265575 () Bool)

(assert (=> bm!66390 m!1265575))

(declare-fun m!1265577 () Bool)

(assert (=> bm!66392 m!1265577))

(push 1)

(assert (not bm!66390))

(assert (not bm!66393))

(assert (not start!117622))

(assert (not bm!66391))

(assert (not b!1380750))

(assert (not bm!66392))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1380816 () Bool)

(declare-fun e!782598 () (_ BitVec 32))

(declare-fun call!66429 () (_ BitVec 32))

(assert (=> b!1380816 (= e!782598 call!66429)))

(declare-fun b!1380817 () Bool)

(assert (=> b!1380817 (= e!782598 (bvadd #b00000000000000000000000000000001 call!66429))))

(declare-fun bm!66426 () Bool)

(assert (=> bm!66426 (= call!66429 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun d!148771 () Bool)

(declare-fun lt!607931 () (_ BitVec 32))

(assert (=> d!148771 (and (bvsge lt!607931 #b00000000000000000000000000000000) (bvsle lt!607931 (bvsub (size!45992 a!3931) (bvadd #b00000000000000000000000000000001 from!3309))))))

(declare-fun e!782599 () (_ BitVec 32))

(assert (=> d!148771 (= lt!607931 e!782599)))

(declare-fun c!128504 () Bool)

(assert (=> d!148771 (= c!128504 (bvsge (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (=> d!148771 (and (bvsle (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000) (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!45992 a!3931)))))

(assert (=> d!148771 (= (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)) lt!607931)))

(declare-fun b!1380818 () Bool)

(assert (=> b!1380818 (= e!782599 e!782598)))

(declare-fun c!128503 () Bool)

(assert (=> b!1380818 (= c!128503 (validKeyInArray!0 (select (arr!45440 a!3931) (bvadd #b00000000000000000000000000000001 from!3309))))))

(declare-fun b!1380819 () Bool)

(assert (=> b!1380819 (= e!782599 #b00000000000000000000000000000000)))

(assert (= (and d!148771 c!128504) b!1380819))

(assert (= (and d!148771 (not c!128504)) b!1380818))

(assert (= (and b!1380818 c!128503) b!1380817))

(assert (= (and b!1380818 (not c!128503)) b!1380816))

(assert (= (or b!1380817 b!1380816) bm!66426))

(declare-fun m!1265615 () Bool)

(assert (=> bm!66426 m!1265615))

(declare-fun m!1265617 () Bool)

(assert (=> b!1380818 m!1265617))

(assert (=> b!1380818 m!1265617))

(declare-fun m!1265619 () Bool)

(assert (=> b!1380818 m!1265619))

(assert (=> bm!66390 d!148771))

(declare-fun d!148777 () Bool)

(assert (=> d!148777 (= (array_inv!34673 a!3931) (bvsge (size!45992 a!3931) #b00000000000000000000000000000000))))

(assert (=> start!117622 d!148777))

(declare-fun b!1380820 () Bool)

(declare-fun e!782600 () (_ BitVec 32))

(declare-fun call!66430 () (_ BitVec 32))

(assert (=> b!1380820 (= e!782600 call!66430)))

(declare-fun b!1380821 () Bool)

(assert (=> b!1380821 (= e!782600 (bvadd #b00000000000000000000000000000001 call!66430))))

(declare-fun bm!66427 () Bool)

(assert (=> bm!66427 (= call!66430 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun d!148779 () Bool)

(declare-fun lt!607932 () (_ BitVec 32))

(assert (=> d!148779 (and (bvsge lt!607932 #b00000000000000000000000000000000) (bvsle lt!607932 (bvsub (size!45992 a!3931) from!3309)))))

(declare-fun e!782601 () (_ BitVec 32))

(assert (=> d!148779 (= lt!607932 e!782601)))

(declare-fun c!128506 () Bool)

(assert (=> d!148779 (= c!128506 (bvsge from!3309 (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (=> d!148779 (and (bvsle from!3309 (bvsub to!105 #b00000000000000000000000000000001)) (bvsge from!3309 #b00000000000000000000000000000000) (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!45992 a!3931)))))

(assert (=> d!148779 (= (arrayCountValidKeys!0 a!3931 from!3309 (bvsub to!105 #b00000000000000000000000000000001)) lt!607932)))

(declare-fun b!1380822 () Bool)

(assert (=> b!1380822 (= e!782601 e!782600)))

(declare-fun c!128505 () Bool)

(assert (=> b!1380822 (= c!128505 (validKeyInArray!0 (select (arr!45440 a!3931) from!3309)))))

(declare-fun b!1380823 () Bool)

(assert (=> b!1380823 (= e!782601 #b00000000000000000000000000000000)))

(assert (= (and d!148779 c!128506) b!1380823))

(assert (= (and d!148779 (not c!128506)) b!1380822))

(assert (= (and b!1380822 c!128505) b!1380821))

(assert (= (and b!1380822 (not c!128505)) b!1380820))

(assert (= (or b!1380821 b!1380820) bm!66427))

(declare-fun m!1265621 () Bool)

(assert (=> bm!66427 m!1265621))

(declare-fun m!1265623 () Bool)

(assert (=> b!1380822 m!1265623))

(assert (=> b!1380822 m!1265623))

(declare-fun m!1265625 () Bool)

(assert (=> b!1380822 m!1265625))

(assert (=> bm!66392 d!148779))

(declare-fun b!1380824 () Bool)

(declare-fun e!782602 () (_ BitVec 32))

(declare-fun call!66431 () (_ BitVec 32))

(assert (=> b!1380824 (= e!782602 call!66431)))

(declare-fun b!1380825 () Bool)

(assert (=> b!1380825 (= e!782602 (bvadd #b00000000000000000000000000000001 call!66431))))

(declare-fun bm!66428 () Bool)

(assert (=> bm!66428 (= call!66431 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) to!105))))

(declare-fun d!148781 () Bool)

(declare-fun lt!607933 () (_ BitVec 32))

(assert (=> d!148781 (and (bvsge lt!607933 #b00000000000000000000000000000000) (bvsle lt!607933 (bvsub (size!45992 a!3931) from!3309)))))

(declare-fun e!782603 () (_ BitVec 32))

(assert (=> d!148781 (= lt!607933 e!782603)))

(declare-fun c!128508 () Bool)

(assert (=> d!148781 (= c!128508 (bvsge from!3309 to!105))))

(assert (=> d!148781 (and (bvsle from!3309 to!105) (bvsge from!3309 #b00000000000000000000000000000000) (bvsle to!105 (size!45992 a!3931)))))

(assert (=> d!148781 (= (arrayCountValidKeys!0 a!3931 from!3309 to!105) lt!607933)))

(declare-fun b!1380826 () Bool)

(assert (=> b!1380826 (= e!782603 e!782602)))

(declare-fun c!128507 () Bool)

(assert (=> b!1380826 (= c!128507 (validKeyInArray!0 (select (arr!45440 a!3931) from!3309)))))

(declare-fun b!1380827 () Bool)

(assert (=> b!1380827 (= e!782603 #b00000000000000000000000000000000)))

(assert (= (and d!148781 c!128508) b!1380827))

(assert (= (and d!148781 (not c!128508)) b!1380826))

(assert (= (and b!1380826 c!128507) b!1380825))

(assert (= (and b!1380826 (not c!128507)) b!1380824))

(assert (= (or b!1380825 b!1380824) bm!66428))

(declare-fun m!1265627 () Bool)

(assert (=> bm!66428 m!1265627))

(assert (=> b!1380826 m!1265623))

(assert (=> b!1380826 m!1265623))

(assert (=> b!1380826 m!1265625))

(assert (=> bm!66393 d!148781))

(declare-fun d!148783 () Bool)

(assert (=> d!148783 (= (validKeyInArray!0 (select (arr!45440 a!3931) (bvsub to!105 #b00000000000000000000000000000001))) (and (not (= (select (arr!45440 a!3931) (bvsub to!105 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45440 a!3931) (bvsub to!105 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1380750 d!148783))

(declare-fun d!148785 () Bool)

(declare-fun e!782620 () Bool)

(assert (=> d!148785 e!782620))

(declare-fun res!922697 () Bool)

(assert (=> d!148785 (=> (not res!922697) (not e!782620))))

(declare-fun lt!607945 () (_ BitVec 32))

(assert (=> d!148785 (= res!922697 (and (bvsge lt!607945 #b00000000000000000000000000000000) (bvslt lt!607945 (size!45992 a!3931))))))

(assert (=> d!148785 (= lt!607945 (bvsub to!105 #b00000000000000000000000000000001))))

(declare-fun lt!607944 () Unit!45860)

(declare-fun choose!86 (array!94094 (_ BitVec 32) (_ BitVec 32)) Unit!45860)

(assert (=> d!148785 (= lt!607944 (choose!86 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(assert (=> d!148785 (and (bvslt (size!45992 a!3931) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000) (bvsgt to!105 (bvadd #b00000000000000000000000000000001 from!3309)) (bvsle to!105 (size!45992 a!3931)))))

(assert (=> d!148785 (= (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105) lt!607944)))

(declare-fun b!1380858 () Bool)

(declare-fun e!782621 () Bool)

(declare-fun call!66443 () (_ BitVec 32))

(declare-fun call!66442 () (_ BitVec 32))

(assert (=> b!1380858 (= e!782621 (= (bvadd call!66443 #b00000000000000000000000000000001) call!66442))))

(declare-fun bm!66439 () Bool)

(assert (=> bm!66439 (= call!66442 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun bm!66440 () Bool)

(assert (=> bm!66440 (= call!66443 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380859 () Bool)

(assert (=> b!1380859 (= e!782620 e!782621)))

(declare-fun c!128523 () Bool)

(assert (=> b!1380859 (= c!128523 (validKeyInArray!0 (select (arr!45440 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-fun b!1380860 () Bool)

(assert (=> b!1380860 (= e!782621 (= call!66443 call!66442))))

(assert (= (and d!148785 res!922697) b!1380859))

(assert (= (and b!1380859 c!128523) b!1380858))

(assert (= (and b!1380859 (not c!128523)) b!1380860))

(assert (= (or b!1380858 b!1380860) bm!66439))

(assert (= (or b!1380858 b!1380860) bm!66440))

(declare-fun m!1265645 () Bool)

(assert (=> d!148785 m!1265645))

(assert (=> bm!66439 m!1265567))

(assert (=> bm!66440 m!1265575))

(assert (=> b!1380859 m!1265569))

(assert (=> b!1380859 m!1265569))

(assert (=> b!1380859 m!1265571))

(assert (=> b!1380750 d!148785))

(declare-fun b!1380861 () Bool)

(declare-fun e!782622 () (_ BitVec 32))

(declare-fun call!66444 () (_ BitVec 32))

(assert (=> b!1380861 (= e!782622 call!66444)))

(declare-fun b!1380862 () Bool)

(assert (=> b!1380862 (= e!782622 (bvadd #b00000000000000000000000000000001 call!66444))))

(declare-fun bm!66441 () Bool)

(assert (=> bm!66441 (= call!66444 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309 #b00000000000000000000000000000001) to!105))))

(declare-fun d!148795 () Bool)

(declare-fun lt!607946 () (_ BitVec 32))

(assert (=> d!148795 (and (bvsge lt!607946 #b00000000000000000000000000000000) (bvsle lt!607946 (bvsub (size!45992 a!3931) (bvadd #b00000000000000000000000000000001 from!3309))))))

(declare-fun e!782623 () (_ BitVec 32))

(assert (=> d!148795 (= lt!607946 e!782623)))

(declare-fun c!128525 () Bool)

(assert (=> d!148795 (= c!128525 (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(assert (=> d!148795 (and (bvsle (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000) (bvsle to!105 (size!45992 a!3931)))))

(assert (=> d!148795 (= (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105) lt!607946)))

(declare-fun b!1380863 () Bool)

(assert (=> b!1380863 (= e!782623 e!782622)))

(declare-fun c!128524 () Bool)

(assert (=> b!1380863 (= c!128524 (validKeyInArray!0 (select (arr!45440 a!3931) (bvadd #b00000000000000000000000000000001 from!3309))))))

(declare-fun b!1380864 () Bool)

(assert (=> b!1380864 (= e!782623 #b00000000000000000000000000000000)))

(assert (= (and d!148795 c!128525) b!1380864))

(assert (= (and d!148795 (not c!128525)) b!1380863))

(assert (= (and b!1380863 c!128524) b!1380862))

(assert (= (and b!1380863 (not c!128524)) b!1380861))

(assert (= (or b!1380862 b!1380861) bm!66441))

(declare-fun m!1265647 () Bool)

(assert (=> bm!66441 m!1265647))

(assert (=> b!1380863 m!1265617))

(assert (=> b!1380863 m!1265617))

(assert (=> b!1380863 m!1265619))

(assert (=> bm!66391 d!148795))

(push 1)

(assert (not bm!66426))

(assert (not bm!66440))

(assert (not b!1380859))

(assert (not b!1380826))

(assert (not bm!66427))

(assert (not d!148785))

(assert (not bm!66439))

(assert (not bm!66428))

(assert (not b!1380822))

(assert (not b!1380818))

(assert (not bm!66441))

(assert (not b!1380863))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

