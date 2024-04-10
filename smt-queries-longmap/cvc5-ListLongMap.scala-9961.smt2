; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117624 () Bool)

(assert start!117624)

(declare-fun b!1380800 () Bool)

(declare-fun e!782575 () Bool)

(declare-fun e!782573 () Bool)

(assert (=> b!1380800 (= e!782575 (not e!782573))))

(declare-fun c!128487 () Bool)

(declare-fun lt!608082 () Bool)

(assert (=> b!1380800 (= c!128487 lt!608082)))

(declare-fun e!782576 () Bool)

(assert (=> b!1380800 e!782576))

(declare-fun c!128486 () Bool)

(assert (=> b!1380800 (= c!128486 lt!608082)))

(declare-datatypes ((array!94142 0))(
  ( (array!94143 (arr!45464 (Array (_ BitVec 32) (_ BitVec 64))) (size!46014 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94142)

(declare-fun to!105 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380800 (= lt!608082 (validKeyInArray!0 (select (arr!45464 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!46017 0))(
  ( (Unit!46018) )
))
(declare-fun lt!608081 () Unit!46017)

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94142 (_ BitVec 32) (_ BitVec 32)) Unit!46017)

(assert (=> b!1380800 (= lt!608081 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380801 () Bool)

(declare-fun call!66403 () (_ BitVec 32))

(declare-fun call!66400 () (_ BitVec 32))

(assert (=> b!1380801 (= e!782576 (= call!66403 call!66400))))

(declare-fun b!1380802 () Bool)

(declare-fun call!66401 () (_ BitVec 32))

(declare-fun call!66402 () (_ BitVec 32))

(assert (=> b!1380802 (= e!782573 (= call!66401 call!66402))))

(declare-fun bm!66397 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94142 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66397 (= call!66401 (arrayCountValidKeys!0 a!3931 from!3309 (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun res!922708 () Bool)

(assert (=> start!117624 (=> (not res!922708) (not e!782575))))

(assert (=> start!117624 (= res!922708 (and (bvslt (size!46014 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46014 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117624 e!782575))

(declare-fun array_inv!34492 (array!94142) Bool)

(assert (=> start!117624 (array_inv!34492 a!3931)))

(assert (=> start!117624 true))

(declare-fun b!1380803 () Bool)

(assert (=> b!1380803 (= e!782573 (= (bvadd #b00000000000000000000000000000001 call!66401) call!66402))))

(declare-fun bm!66398 () Bool)

(assert (=> bm!66398 (= call!66403 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun bm!66399 () Bool)

(assert (=> bm!66399 (= call!66402 (arrayCountValidKeys!0 a!3931 from!3309 to!105))))

(declare-fun bm!66400 () Bool)

(assert (=> bm!66400 (= call!66400 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380804 () Bool)

(assert (=> b!1380804 (= e!782576 (= (bvadd #b00000000000000000000000000000001 call!66403) call!66400))))

(assert (= (and start!117624 res!922708) b!1380800))

(assert (= (and b!1380800 c!128486) b!1380804))

(assert (= (and b!1380800 (not c!128486)) b!1380801))

(assert (= (or b!1380804 b!1380801) bm!66400))

(assert (= (or b!1380804 b!1380801) bm!66398))

(assert (= (and b!1380800 c!128487) b!1380803))

(assert (= (and b!1380800 (not c!128487)) b!1380802))

(assert (= (or b!1380803 b!1380802) bm!66399))

(assert (= (or b!1380803 b!1380802) bm!66397))

(declare-fun m!1266051 () Bool)

(assert (=> bm!66400 m!1266051))

(declare-fun m!1266053 () Bool)

(assert (=> bm!66397 m!1266053))

(declare-fun m!1266055 () Bool)

(assert (=> start!117624 m!1266055))

(declare-fun m!1266057 () Bool)

(assert (=> bm!66398 m!1266057))

(declare-fun m!1266059 () Bool)

(assert (=> bm!66399 m!1266059))

(declare-fun m!1266061 () Bool)

(assert (=> b!1380800 m!1266061))

(assert (=> b!1380800 m!1266061))

(declare-fun m!1266063 () Bool)

(assert (=> b!1380800 m!1266063))

(declare-fun m!1266065 () Bool)

(assert (=> b!1380800 m!1266065))

(push 1)

(assert (not bm!66399))

(assert (not bm!66397))

(assert (not start!117624))

(assert (not b!1380800))

(assert (not bm!66400))

(assert (not bm!66398))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1380876 () Bool)

(declare-fun e!782623 () (_ BitVec 32))

(declare-fun call!66442 () (_ BitVec 32))

(assert (=> b!1380876 (= e!782623 (bvadd #b00000000000000000000000000000001 call!66442))))

(declare-fun b!1380877 () Bool)

(declare-fun e!782624 () (_ BitVec 32))

(assert (=> b!1380877 (= e!782624 e!782623)))

(declare-fun c!128519 () Bool)

(assert (=> b!1380877 (= c!128519 (validKeyInArray!0 (select (arr!45464 a!3931) from!3309)))))

(declare-fun d!148889 () Bool)

(declare-fun lt!608109 () (_ BitVec 32))

(assert (=> d!148889 (and (bvsge lt!608109 #b00000000000000000000000000000000) (bvsle lt!608109 (bvsub (size!46014 a!3931) from!3309)))))

(assert (=> d!148889 (= lt!608109 e!782624)))

(declare-fun c!128520 () Bool)

(assert (=> d!148889 (= c!128520 (bvsge from!3309 (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (=> d!148889 (and (bvsle from!3309 (bvsub to!105 #b00000000000000000000000000000001)) (bvsge from!3309 #b00000000000000000000000000000000) (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!46014 a!3931)))))

(assert (=> d!148889 (= (arrayCountValidKeys!0 a!3931 from!3309 (bvsub to!105 #b00000000000000000000000000000001)) lt!608109)))

(declare-fun b!1380878 () Bool)

(assert (=> b!1380878 (= e!782624 #b00000000000000000000000000000000)))

(declare-fun bm!66439 () Bool)

(assert (=> bm!66439 (= call!66442 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380879 () Bool)

(assert (=> b!1380879 (= e!782623 call!66442)))

(assert (= (and d!148889 c!128520) b!1380878))

(assert (= (and d!148889 (not c!128520)) b!1380877))

(assert (= (and b!1380877 c!128519) b!1380876))

(assert (= (and b!1380877 (not c!128519)) b!1380879))

(assert (= (or b!1380876 b!1380879) bm!66439))

(declare-fun m!1266117 () Bool)

(assert (=> b!1380877 m!1266117))

(assert (=> b!1380877 m!1266117))

(declare-fun m!1266119 () Bool)

(assert (=> b!1380877 m!1266119))

(declare-fun m!1266121 () Bool)

(assert (=> bm!66439 m!1266121))

(assert (=> bm!66397 d!148889))

(declare-fun b!1380880 () Bool)

(declare-fun e!782625 () (_ BitVec 32))

(declare-fun call!66443 () (_ BitVec 32))

(assert (=> b!1380880 (= e!782625 (bvadd #b00000000000000000000000000000001 call!66443))))

(declare-fun b!1380881 () Bool)

(declare-fun e!782626 () (_ BitVec 32))

(assert (=> b!1380881 (= e!782626 e!782625)))

(declare-fun c!128521 () Bool)

(assert (=> b!1380881 (= c!128521 (validKeyInArray!0 (select (arr!45464 a!3931) (bvadd #b00000000000000000000000000000001 from!3309))))))

(declare-fun d!148891 () Bool)

(declare-fun lt!608110 () (_ BitVec 32))

(assert (=> d!148891 (and (bvsge lt!608110 #b00000000000000000000000000000000) (bvsle lt!608110 (bvsub (size!46014 a!3931) (bvadd #b00000000000000000000000000000001 from!3309))))))

(assert (=> d!148891 (= lt!608110 e!782626)))

(declare-fun c!128522 () Bool)

(assert (=> d!148891 (= c!128522 (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(assert (=> d!148891 (and (bvsle (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000) (bvsle to!105 (size!46014 a!3931)))))

(assert (=> d!148891 (= (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105) lt!608110)))

(declare-fun b!1380882 () Bool)

(assert (=> b!1380882 (= e!782626 #b00000000000000000000000000000000)))

(declare-fun bm!66440 () Bool)

(assert (=> bm!66440 (= call!66443 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309 #b00000000000000000000000000000001) to!105))))

(declare-fun b!1380883 () Bool)

(assert (=> b!1380883 (= e!782625 call!66443)))

(assert (= (and d!148891 c!128522) b!1380882))

(assert (= (and d!148891 (not c!128522)) b!1380881))

(assert (= (and b!1380881 c!128521) b!1380880))

(assert (= (and b!1380881 (not c!128521)) b!1380883))

(assert (= (or b!1380880 b!1380883) bm!66440))

(declare-fun m!1266123 () Bool)

(assert (=> b!1380881 m!1266123))

(assert (=> b!1380881 m!1266123))

(declare-fun m!1266125 () Bool)

(assert (=> b!1380881 m!1266125))

(declare-fun m!1266127 () Bool)

(assert (=> bm!66440 m!1266127))

(assert (=> bm!66400 d!148891))

(declare-fun d!148895 () Bool)

(assert (=> d!148895 (= (validKeyInArray!0 (select (arr!45464 a!3931) (bvsub to!105 #b00000000000000000000000000000001))) (and (not (= (select (arr!45464 a!3931) (bvsub to!105 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45464 a!3931) (bvsub to!105 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1380800 d!148895))

(declare-fun d!148897 () Bool)

(declare-fun e!782638 () Bool)

(assert (=> d!148897 e!782638))

(declare-fun res!922720 () Bool)

(assert (=> d!148897 (=> (not res!922720) (not e!782638))))

(declare-fun lt!608118 () (_ BitVec 32))

(assert (=> d!148897 (= res!922720 (and (bvsge lt!608118 #b00000000000000000000000000000000) (bvslt lt!608118 (size!46014 a!3931))))))

(assert (=> d!148897 (= lt!608118 (bvsub to!105 #b00000000000000000000000000000001))))

(declare-fun lt!608119 () Unit!46017)

(declare-fun choose!86 (array!94142 (_ BitVec 32) (_ BitVec 32)) Unit!46017)

(assert (=> d!148897 (= lt!608119 (choose!86 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(assert (=> d!148897 (and (bvslt (size!46014 a!3931) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000) (bvsgt to!105 (bvadd #b00000000000000000000000000000001 from!3309)) (bvsle to!105 (size!46014 a!3931)))))

(assert (=> d!148897 (= (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105) lt!608119)))

(declare-fun b!1380902 () Bool)

(declare-fun e!782637 () Bool)

(declare-fun call!66452 () (_ BitVec 32))

(declare-fun call!66451 () (_ BitVec 32))

(assert (=> b!1380902 (= e!782637 (= (bvadd call!66452 #b00000000000000000000000000000001) call!66451))))

(declare-fun bm!66448 () Bool)

(assert (=> bm!66448 (= call!66451 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380903 () Bool)

(assert (=> b!1380903 (= e!782637 (= call!66452 call!66451))))

(declare-fun b!1380904 () Bool)

(assert (=> b!1380904 (= e!782638 e!782637)))

(declare-fun c!128531 () Bool)

(assert (=> b!1380904 (= c!128531 (validKeyInArray!0 (select (arr!45464 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-fun bm!66449 () Bool)

(assert (=> bm!66449 (= call!66452 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (= (and d!148897 res!922720) b!1380904))

(assert (= (and b!1380904 c!128531) b!1380902))

(assert (= (and b!1380904 (not c!128531)) b!1380903))

(assert (= (or b!1380902 b!1380903) bm!66448))

(assert (= (or b!1380902 b!1380903) bm!66449))

(declare-fun m!1266135 () Bool)

(assert (=> d!148897 m!1266135))

(assert (=> bm!66448 m!1266051))

(assert (=> b!1380904 m!1266061))

(assert (=> b!1380904 m!1266061))

(assert (=> b!1380904 m!1266063))

(assert (=> bm!66449 m!1266057))

(assert (=> b!1380800 d!148897))

(declare-fun d!148903 () Bool)

(assert (=> d!148903 (= (array_inv!34492 a!3931) (bvsge (size!46014 a!3931) #b00000000000000000000000000000000))))

(assert (=> start!117624 d!148903))

(declare-fun b!1380905 () Bool)

(declare-fun e!782639 () (_ BitVec 32))

(declare-fun call!66453 () (_ BitVec 32))

(assert (=> b!1380905 (= e!782639 (bvadd #b00000000000000000000000000000001 call!66453))))

(declare-fun b!1380906 () Bool)

(declare-fun e!782640 () (_ BitVec 32))

(assert (=> b!1380906 (= e!782640 e!782639)))

(declare-fun c!128532 () Bool)

(assert (=> b!1380906 (= c!128532 (validKeyInArray!0 (select (arr!45464 a!3931) from!3309)))))

(declare-fun d!148905 () Bool)

(declare-fun lt!608120 () (_ BitVec 32))

(assert (=> d!148905 (and (bvsge lt!608120 #b00000000000000000000000000000000) (bvsle lt!608120 (bvsub (size!46014 a!3931) from!3309)))))

(assert (=> d!148905 (= lt!608120 e!782640)))

(declare-fun c!128533 () Bool)

(assert (=> d!148905 (= c!128533 (bvsge from!3309 to!105))))

(assert (=> d!148905 (and (bvsle from!3309 to!105) (bvsge from!3309 #b00000000000000000000000000000000) (bvsle to!105 (size!46014 a!3931)))))

(assert (=> d!148905 (= (arrayCountValidKeys!0 a!3931 from!3309 to!105) lt!608120)))

(declare-fun b!1380907 () Bool)

(assert (=> b!1380907 (= e!782640 #b00000000000000000000000000000000)))

(declare-fun bm!66450 () Bool)

(assert (=> bm!66450 (= call!66453 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) to!105))))

(declare-fun b!1380908 () Bool)

(assert (=> b!1380908 (= e!782639 call!66453)))

(assert (= (and d!148905 c!128533) b!1380907))

(assert (= (and d!148905 (not c!128533)) b!1380906))

(assert (= (and b!1380906 c!128532) b!1380905))

(assert (= (and b!1380906 (not c!128532)) b!1380908))

(assert (= (or b!1380905 b!1380908) bm!66450))

(assert (=> b!1380906 m!1266117))

(assert (=> b!1380906 m!1266117))

(assert (=> b!1380906 m!1266119))

(declare-fun m!1266137 () Bool)

(assert (=> bm!66450 m!1266137))

(assert (=> bm!66399 d!148905))

(declare-fun b!1380909 () Bool)

(declare-fun e!782641 () (_ BitVec 32))

(declare-fun call!66454 () (_ BitVec 32))

(assert (=> b!1380909 (= e!782641 (bvadd #b00000000000000000000000000000001 call!66454))))

(declare-fun b!1380910 () Bool)

(declare-fun e!782642 () (_ BitVec 32))

(assert (=> b!1380910 (= e!782642 e!782641)))

(declare-fun c!128534 () Bool)

(assert (=> b!1380910 (= c!128534 (validKeyInArray!0 (select (arr!45464 a!3931) (bvadd #b00000000000000000000000000000001 from!3309))))))

(declare-fun d!148907 () Bool)

(declare-fun lt!608121 () (_ BitVec 32))

(assert (=> d!148907 (and (bvsge lt!608121 #b00000000000000000000000000000000) (bvsle lt!608121 (bvsub (size!46014 a!3931) (bvadd #b00000000000000000000000000000001 from!3309))))))

(assert (=> d!148907 (= lt!608121 e!782642)))

(declare-fun c!128535 () Bool)

(assert (=> d!148907 (= c!128535 (bvsge (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (=> d!148907 (and (bvsle (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000) (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!46014 a!3931)))))

(assert (=> d!148907 (= (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)) lt!608121)))

(declare-fun b!1380911 () Bool)

(assert (=> b!1380911 (= e!782642 #b00000000000000000000000000000000)))

(declare-fun bm!66451 () Bool)

(assert (=> bm!66451 (= call!66454 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380912 () Bool)

(assert (=> b!1380912 (= e!782641 call!66454)))

(assert (= (and d!148907 c!128535) b!1380911))

(assert (= (and d!148907 (not c!128535)) b!1380910))

(assert (= (and b!1380910 c!128534) b!1380909))

(assert (= (and b!1380910 (not c!128534)) b!1380912))

(assert (= (or b!1380909 b!1380912) bm!66451))

(assert (=> b!1380910 m!1266123))

(assert (=> b!1380910 m!1266123))

(assert (=> b!1380910 m!1266125))

(declare-fun m!1266139 () Bool)

(assert (=> bm!66451 m!1266139))

(assert (=> bm!66398 d!148907))

(push 1)

(assert (not bm!66439))

(assert (not bm!66450))

(assert (not b!1380910))

(assert (not b!1380881))

(assert (not bm!66440))

(assert (not bm!66448))

(assert (not b!1380877))

(assert (not b!1380906))

(assert (not bm!66449))

(assert (not d!148897))

(assert (not b!1380904))

(assert (not bm!66451))

(check-sat)

(pop 1)

(push 1)

(check-sat)

