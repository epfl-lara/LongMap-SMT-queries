; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117626 () Bool)

(assert start!117626)

(declare-fun res!922711 () Bool)

(declare-fun e!782588 () Bool)

(assert (=> start!117626 (=> (not res!922711) (not e!782588))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94144 0))(
  ( (array!94145 (arr!45465 (Array (_ BitVec 32) (_ BitVec 64))) (size!46015 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94144)

(assert (=> start!117626 (= res!922711 (and (bvslt (size!46015 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46015 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117626 e!782588))

(declare-fun array_inv!34493 (array!94144) Bool)

(assert (=> start!117626 (array_inv!34493 a!3931)))

(assert (=> start!117626 true))

(declare-fun bm!66409 () Bool)

(declare-fun call!66414 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!94144 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66409 (= call!66414 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun bm!66410 () Bool)

(declare-fun call!66413 () (_ BitVec 32))

(assert (=> bm!66410 (= call!66413 (arrayCountValidKeys!0 a!3931 from!3309 to!105))))

(declare-fun b!1380815 () Bool)

(declare-fun e!782586 () Bool)

(declare-fun call!66412 () (_ BitVec 32))

(assert (=> b!1380815 (= e!782586 (= call!66412 call!66413))))

(declare-fun b!1380816 () Bool)

(declare-fun e!782585 () Bool)

(declare-fun call!66415 () (_ BitVec 32))

(assert (=> b!1380816 (= e!782585 (= call!66415 call!66414))))

(declare-fun b!1380817 () Bool)

(assert (=> b!1380817 (= e!782588 (not e!782586))))

(declare-fun c!128492 () Bool)

(declare-fun lt!608087 () Bool)

(assert (=> b!1380817 (= c!128492 lt!608087)))

(assert (=> b!1380817 e!782585))

(declare-fun c!128493 () Bool)

(assert (=> b!1380817 (= c!128493 lt!608087)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380817 (= lt!608087 (validKeyInArray!0 (select (arr!45465 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!46019 0))(
  ( (Unit!46020) )
))
(declare-fun lt!608088 () Unit!46019)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94144 (_ BitVec 32) (_ BitVec 32)) Unit!46019)

(assert (=> b!1380817 (= lt!608088 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380818 () Bool)

(assert (=> b!1380818 (= e!782585 (= (bvadd #b00000000000000000000000000000001 call!66415) call!66414))))

(declare-fun b!1380819 () Bool)

(assert (=> b!1380819 (= e!782586 (= (bvadd #b00000000000000000000000000000001 call!66412) call!66413))))

(declare-fun bm!66411 () Bool)

(assert (=> bm!66411 (= call!66412 (arrayCountValidKeys!0 a!3931 from!3309 (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun bm!66412 () Bool)

(assert (=> bm!66412 (= call!66415 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (= (and start!117626 res!922711) b!1380817))

(assert (= (and b!1380817 c!128493) b!1380818))

(assert (= (and b!1380817 (not c!128493)) b!1380816))

(assert (= (or b!1380818 b!1380816) bm!66409))

(assert (= (or b!1380818 b!1380816) bm!66412))

(assert (= (and b!1380817 c!128492) b!1380819))

(assert (= (and b!1380817 (not c!128492)) b!1380815))

(assert (= (or b!1380819 b!1380815) bm!66410))

(assert (= (or b!1380819 b!1380815) bm!66411))

(declare-fun m!1266067 () Bool)

(assert (=> bm!66412 m!1266067))

(declare-fun m!1266069 () Bool)

(assert (=> bm!66409 m!1266069))

(declare-fun m!1266071 () Bool)

(assert (=> bm!66411 m!1266071))

(declare-fun m!1266073 () Bool)

(assert (=> bm!66410 m!1266073))

(declare-fun m!1266075 () Bool)

(assert (=> start!117626 m!1266075))

(declare-fun m!1266077 () Bool)

(assert (=> b!1380817 m!1266077))

(assert (=> b!1380817 m!1266077))

(declare-fun m!1266079 () Bool)

(assert (=> b!1380817 m!1266079))

(declare-fun m!1266081 () Bool)

(assert (=> b!1380817 m!1266081))

(check-sat (not bm!66410) (not bm!66412) (not bm!66409) (not start!117626) (not b!1380817) (not bm!66411))
(check-sat)
(get-model)

(declare-fun b!1380843 () Bool)

(declare-fun e!782606 () (_ BitVec 32))

(assert (=> b!1380843 (= e!782606 #b00000000000000000000000000000000)))

(declare-fun b!1380844 () Bool)

(declare-fun e!782605 () (_ BitVec 32))

(declare-fun call!66430 () (_ BitVec 32))

(assert (=> b!1380844 (= e!782605 (bvadd #b00000000000000000000000000000001 call!66430))))

(declare-fun b!1380845 () Bool)

(assert (=> b!1380845 (= e!782605 call!66430)))

(declare-fun bm!66427 () Bool)

(assert (=> bm!66427 (= call!66430 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380846 () Bool)

(assert (=> b!1380846 (= e!782606 e!782605)))

(declare-fun c!128505 () Bool)

(assert (=> b!1380846 (= c!128505 (validKeyInArray!0 (select (arr!45465 a!3931) (bvadd #b00000000000000000000000000000001 from!3309))))))

(declare-fun d!148875 () Bool)

(declare-fun lt!608097 () (_ BitVec 32))

(assert (=> d!148875 (and (bvsge lt!608097 #b00000000000000000000000000000000) (bvsle lt!608097 (bvsub (size!46015 a!3931) (bvadd #b00000000000000000000000000000001 from!3309))))))

(assert (=> d!148875 (= lt!608097 e!782606)))

(declare-fun c!128504 () Bool)

(assert (=> d!148875 (= c!128504 (bvsge (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (=> d!148875 (and (bvsle (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000) (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!46015 a!3931)))))

(assert (=> d!148875 (= (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)) lt!608097)))

(assert (= (and d!148875 c!128504) b!1380843))

(assert (= (and d!148875 (not c!128504)) b!1380846))

(assert (= (and b!1380846 c!128505) b!1380844))

(assert (= (and b!1380846 (not c!128505)) b!1380845))

(assert (= (or b!1380844 b!1380845) bm!66427))

(declare-fun m!1266099 () Bool)

(assert (=> bm!66427 m!1266099))

(declare-fun m!1266101 () Bool)

(assert (=> b!1380846 m!1266101))

(assert (=> b!1380846 m!1266101))

(declare-fun m!1266103 () Bool)

(assert (=> b!1380846 m!1266103))

(assert (=> bm!66412 d!148875))

(declare-fun b!1380847 () Bool)

(declare-fun e!782608 () (_ BitVec 32))

(assert (=> b!1380847 (= e!782608 #b00000000000000000000000000000000)))

(declare-fun b!1380848 () Bool)

(declare-fun e!782607 () (_ BitVec 32))

(declare-fun call!66431 () (_ BitVec 32))

(assert (=> b!1380848 (= e!782607 (bvadd #b00000000000000000000000000000001 call!66431))))

(declare-fun b!1380849 () Bool)

(assert (=> b!1380849 (= e!782607 call!66431)))

(declare-fun bm!66428 () Bool)

(assert (=> bm!66428 (= call!66431 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) to!105))))

(declare-fun b!1380850 () Bool)

(assert (=> b!1380850 (= e!782608 e!782607)))

(declare-fun c!128507 () Bool)

(assert (=> b!1380850 (= c!128507 (validKeyInArray!0 (select (arr!45465 a!3931) from!3309)))))

(declare-fun d!148877 () Bool)

(declare-fun lt!608098 () (_ BitVec 32))

(assert (=> d!148877 (and (bvsge lt!608098 #b00000000000000000000000000000000) (bvsle lt!608098 (bvsub (size!46015 a!3931) from!3309)))))

(assert (=> d!148877 (= lt!608098 e!782608)))

(declare-fun c!128506 () Bool)

(assert (=> d!148877 (= c!128506 (bvsge from!3309 to!105))))

(assert (=> d!148877 (and (bvsle from!3309 to!105) (bvsge from!3309 #b00000000000000000000000000000000) (bvsle to!105 (size!46015 a!3931)))))

(assert (=> d!148877 (= (arrayCountValidKeys!0 a!3931 from!3309 to!105) lt!608098)))

(assert (= (and d!148877 c!128506) b!1380847))

(assert (= (and d!148877 (not c!128506)) b!1380850))

(assert (= (and b!1380850 c!128507) b!1380848))

(assert (= (and b!1380850 (not c!128507)) b!1380849))

(assert (= (or b!1380848 b!1380849) bm!66428))

(declare-fun m!1266105 () Bool)

(assert (=> bm!66428 m!1266105))

(declare-fun m!1266107 () Bool)

(assert (=> b!1380850 m!1266107))

(assert (=> b!1380850 m!1266107))

(declare-fun m!1266109 () Bool)

(assert (=> b!1380850 m!1266109))

(assert (=> bm!66410 d!148877))

(declare-fun b!1380851 () Bool)

(declare-fun e!782610 () (_ BitVec 32))

(assert (=> b!1380851 (= e!782610 #b00000000000000000000000000000000)))

(declare-fun b!1380852 () Bool)

(declare-fun e!782609 () (_ BitVec 32))

(declare-fun call!66432 () (_ BitVec 32))

(assert (=> b!1380852 (= e!782609 (bvadd #b00000000000000000000000000000001 call!66432))))

(declare-fun b!1380853 () Bool)

(assert (=> b!1380853 (= e!782609 call!66432)))

(declare-fun bm!66429 () Bool)

(assert (=> bm!66429 (= call!66432 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380854 () Bool)

(assert (=> b!1380854 (= e!782610 e!782609)))

(declare-fun c!128509 () Bool)

(assert (=> b!1380854 (= c!128509 (validKeyInArray!0 (select (arr!45465 a!3931) from!3309)))))

(declare-fun d!148879 () Bool)

(declare-fun lt!608099 () (_ BitVec 32))

(assert (=> d!148879 (and (bvsge lt!608099 #b00000000000000000000000000000000) (bvsle lt!608099 (bvsub (size!46015 a!3931) from!3309)))))

(assert (=> d!148879 (= lt!608099 e!782610)))

(declare-fun c!128508 () Bool)

(assert (=> d!148879 (= c!128508 (bvsge from!3309 (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (=> d!148879 (and (bvsle from!3309 (bvsub to!105 #b00000000000000000000000000000001)) (bvsge from!3309 #b00000000000000000000000000000000) (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!46015 a!3931)))))

(assert (=> d!148879 (= (arrayCountValidKeys!0 a!3931 from!3309 (bvsub to!105 #b00000000000000000000000000000001)) lt!608099)))

(assert (= (and d!148879 c!128508) b!1380851))

(assert (= (and d!148879 (not c!128508)) b!1380854))

(assert (= (and b!1380854 c!128509) b!1380852))

(assert (= (and b!1380854 (not c!128509)) b!1380853))

(assert (= (or b!1380852 b!1380853) bm!66429))

(declare-fun m!1266111 () Bool)

(assert (=> bm!66429 m!1266111))

(assert (=> b!1380854 m!1266107))

(assert (=> b!1380854 m!1266107))

(assert (=> b!1380854 m!1266109))

(assert (=> bm!66411 d!148879))

(declare-fun b!1380855 () Bool)

(declare-fun e!782612 () (_ BitVec 32))

(assert (=> b!1380855 (= e!782612 #b00000000000000000000000000000000)))

(declare-fun b!1380856 () Bool)

(declare-fun e!782611 () (_ BitVec 32))

(declare-fun call!66433 () (_ BitVec 32))

(assert (=> b!1380856 (= e!782611 (bvadd #b00000000000000000000000000000001 call!66433))))

(declare-fun b!1380857 () Bool)

(assert (=> b!1380857 (= e!782611 call!66433)))

(declare-fun bm!66430 () Bool)

(assert (=> bm!66430 (= call!66433 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309 #b00000000000000000000000000000001) to!105))))

(declare-fun b!1380858 () Bool)

(assert (=> b!1380858 (= e!782612 e!782611)))

(declare-fun c!128511 () Bool)

(assert (=> b!1380858 (= c!128511 (validKeyInArray!0 (select (arr!45465 a!3931) (bvadd #b00000000000000000000000000000001 from!3309))))))

(declare-fun d!148881 () Bool)

(declare-fun lt!608100 () (_ BitVec 32))

(assert (=> d!148881 (and (bvsge lt!608100 #b00000000000000000000000000000000) (bvsle lt!608100 (bvsub (size!46015 a!3931) (bvadd #b00000000000000000000000000000001 from!3309))))))

(assert (=> d!148881 (= lt!608100 e!782612)))

(declare-fun c!128510 () Bool)

(assert (=> d!148881 (= c!128510 (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(assert (=> d!148881 (and (bvsle (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000) (bvsle to!105 (size!46015 a!3931)))))

(assert (=> d!148881 (= (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105) lt!608100)))

(assert (= (and d!148881 c!128510) b!1380855))

(assert (= (and d!148881 (not c!128510)) b!1380858))

(assert (= (and b!1380858 c!128511) b!1380856))

(assert (= (and b!1380858 (not c!128511)) b!1380857))

(assert (= (or b!1380856 b!1380857) bm!66430))

(declare-fun m!1266113 () Bool)

(assert (=> bm!66430 m!1266113))

(assert (=> b!1380858 m!1266101))

(assert (=> b!1380858 m!1266101))

(assert (=> b!1380858 m!1266103))

(assert (=> bm!66409 d!148881))

(declare-fun d!148883 () Bool)

(assert (=> d!148883 (= (array_inv!34493 a!3931) (bvsge (size!46015 a!3931) #b00000000000000000000000000000000))))

(assert (=> start!117626 d!148883))

(declare-fun d!148885 () Bool)

(assert (=> d!148885 (= (validKeyInArray!0 (select (arr!45465 a!3931) (bvsub to!105 #b00000000000000000000000000000001))) (and (not (= (select (arr!45465 a!3931) (bvsub to!105 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45465 a!3931) (bvsub to!105 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1380817 d!148885))

(declare-fun b!1380873 () Bool)

(declare-fun e!782621 () Bool)

(declare-fun call!66440 () (_ BitVec 32))

(declare-fun call!66441 () (_ BitVec 32))

(assert (=> b!1380873 (= e!782621 (= (bvadd call!66440 #b00000000000000000000000000000001) call!66441))))

(declare-fun bm!66437 () Bool)

(assert (=> bm!66437 (= call!66440 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun d!148887 () Bool)

(declare-fun e!782622 () Bool)

(assert (=> d!148887 e!782622))

(declare-fun res!922717 () Bool)

(assert (=> d!148887 (=> (not res!922717) (not e!782622))))

(declare-fun lt!608107 () (_ BitVec 32))

(assert (=> d!148887 (= res!922717 (and (bvsge lt!608107 #b00000000000000000000000000000000) (bvslt lt!608107 (size!46015 a!3931))))))

(assert (=> d!148887 (= lt!608107 (bvsub to!105 #b00000000000000000000000000000001))))

(declare-fun lt!608108 () Unit!46019)

(declare-fun choose!86 (array!94144 (_ BitVec 32) (_ BitVec 32)) Unit!46019)

(assert (=> d!148887 (= lt!608108 (choose!86 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(assert (=> d!148887 (and (bvslt (size!46015 a!3931) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000) (bvsgt to!105 (bvadd #b00000000000000000000000000000001 from!3309)) (bvsle to!105 (size!46015 a!3931)))))

(assert (=> d!148887 (= (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105) lt!608108)))

(declare-fun bm!66438 () Bool)

(assert (=> bm!66438 (= call!66441 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380874 () Bool)

(assert (=> b!1380874 (= e!782621 (= call!66440 call!66441))))

(declare-fun b!1380875 () Bool)

(assert (=> b!1380875 (= e!782622 e!782621)))

(declare-fun c!128518 () Bool)

(assert (=> b!1380875 (= c!128518 (validKeyInArray!0 (select (arr!45465 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(assert (= (and d!148887 res!922717) b!1380875))

(assert (= (and b!1380875 c!128518) b!1380873))

(assert (= (and b!1380875 (not c!128518)) b!1380874))

(assert (= (or b!1380873 b!1380874) bm!66438))

(assert (= (or b!1380873 b!1380874) bm!66437))

(assert (=> bm!66437 m!1266067))

(declare-fun m!1266115 () Bool)

(assert (=> d!148887 m!1266115))

(assert (=> bm!66438 m!1266069))

(assert (=> b!1380875 m!1266077))

(assert (=> b!1380875 m!1266077))

(assert (=> b!1380875 m!1266079))

(assert (=> b!1380817 d!148887))

(check-sat (not b!1380854) (not d!148887) (not bm!66437) (not bm!66430) (not b!1380846) (not bm!66429) (not b!1380850) (not b!1380858) (not bm!66427) (not b!1380875) (not bm!66428) (not bm!66438))
(check-sat)
