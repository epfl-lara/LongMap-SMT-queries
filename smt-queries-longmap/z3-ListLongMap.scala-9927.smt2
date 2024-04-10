; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117350 () Bool)

(assert start!117350)

(declare-fun res!922204 () Bool)

(declare-fun e!781735 () Bool)

(assert (=> start!117350 (=> (not res!922204) (not e!781735))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93931 0))(
  ( (array!93932 (arr!45363 (Array (_ BitVec 32) (_ BitVec 64))) (size!45913 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93931)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117350 (= res!922204 (and (bvslt (size!45913 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45913 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117350 e!781735))

(declare-fun array_inv!34391 (array!93931) Bool)

(assert (=> start!117350 (array_inv!34391 a!4010)))

(assert (=> start!117350 true))

(declare-fun b!1379813 () Bool)

(declare-fun res!922203 () Bool)

(assert (=> b!1379813 (=> (not res!922203) (not e!781735))))

(declare-fun isPivot!0 (array!93931 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379813 (= res!922203 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379814 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93931 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379814 (= e!781735 (not (= (bvadd (arrayCountValidKeys!0 a!4010 from!3388 pivot!64) (arrayCountValidKeys!0 a!4010 pivot!64 to!184)) (arrayCountValidKeys!0 a!4010 from!3388 to!184))))))

(assert (=> b!1379814 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45917 0))(
  ( (Unit!45918) )
))
(declare-fun lt!607761 () Unit!45917)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93931 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45917)

(assert (=> b!1379814 (= lt!607761 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117350 res!922204) b!1379813))

(assert (= (and b!1379813 res!922203) b!1379814))

(declare-fun m!1265027 () Bool)

(assert (=> start!117350 m!1265027))

(declare-fun m!1265029 () Bool)

(assert (=> b!1379813 m!1265029))

(declare-fun m!1265031 () Bool)

(assert (=> b!1379814 m!1265031))

(declare-fun m!1265033 () Bool)

(assert (=> b!1379814 m!1265033))

(declare-fun m!1265035 () Bool)

(assert (=> b!1379814 m!1265035))

(declare-fun m!1265037 () Bool)

(assert (=> b!1379814 m!1265037))

(declare-fun m!1265039 () Bool)

(assert (=> b!1379814 m!1265039))

(check-sat (not start!117350) (not b!1379814) (not b!1379813))
(check-sat)
(get-model)

(declare-fun d!148645 () Bool)

(assert (=> d!148645 (= (array_inv!34391 a!4010) (bvsge (size!45913 a!4010) #b00000000000000000000000000000000))))

(assert (=> start!117350 d!148645))

(declare-fun d!148647 () Bool)

(assert (=> d!148647 (= (isPivot!0 a!4010 from!3388 to!184 pivot!64) (= (bvadd (arrayCountValidKeys!0 a!4010 from!3388 pivot!64) (arrayCountValidKeys!0 a!4010 pivot!64 to!184)) (arrayCountValidKeys!0 a!4010 from!3388 to!184)))))

(declare-fun bs!39788 () Bool)

(assert (= bs!39788 d!148647))

(assert (=> bs!39788 m!1265033))

(assert (=> bs!39788 m!1265035))

(assert (=> bs!39788 m!1265031))

(assert (=> b!1379814 d!148647))

(declare-fun d!148649 () Bool)

(assert (=> d!148649 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-fun lt!607767 () Unit!45917)

(declare-fun choose!124 (array!93931 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45917)

(assert (=> d!148649 (= lt!607767 (choose!124 a!4010 from!3388 to!184 pivot!64 from!3388))))

(declare-fun e!781745 () Bool)

(assert (=> d!148649 e!781745))

(declare-fun res!922213 () Bool)

(assert (=> d!148649 (=> (not res!922213) (not e!781745))))

(assert (=> d!148649 (= res!922213 (and (bvslt (size!45913 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45913 a!4010)) (bvsge pivot!64 from!3388) (bvslt pivot!64 to!184) (bvsle from!3388 pivot!64) (bvsge from!3388 from!3388)))))

(assert (=> d!148649 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388) lt!607767)))

(declare-fun b!1379823 () Bool)

(assert (=> b!1379823 (= e!781745 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(assert (= (and d!148649 res!922213) b!1379823))

(assert (=> d!148649 m!1265039))

(declare-fun m!1265057 () Bool)

(assert (=> d!148649 m!1265057))

(assert (=> b!1379823 m!1265029))

(assert (=> b!1379814 d!148649))

(declare-fun b!1379854 () Bool)

(declare-fun e!781764 () (_ BitVec 32))

(declare-fun call!66104 () (_ BitVec 32))

(assert (=> b!1379854 (= e!781764 call!66104)))

(declare-fun bm!66101 () Bool)

(assert (=> bm!66101 (= call!66104 (arrayCountValidKeys!0 a!4010 (bvadd pivot!64 #b00000000000000000000000000000001) to!184))))

(declare-fun b!1379855 () Bool)

(declare-fun e!781765 () (_ BitVec 32))

(assert (=> b!1379855 (= e!781765 #b00000000000000000000000000000000)))

(declare-fun d!148665 () Bool)

(declare-fun lt!607780 () (_ BitVec 32))

(assert (=> d!148665 (and (bvsge lt!607780 #b00000000000000000000000000000000) (bvsle lt!607780 (bvsub (size!45913 a!4010) pivot!64)))))

(assert (=> d!148665 (= lt!607780 e!781765)))

(declare-fun c!128258 () Bool)

(assert (=> d!148665 (= c!128258 (bvsge pivot!64 to!184))))

(assert (=> d!148665 (and (bvsle pivot!64 to!184) (bvsge pivot!64 #b00000000000000000000000000000000) (bvsle to!184 (size!45913 a!4010)))))

(assert (=> d!148665 (= (arrayCountValidKeys!0 a!4010 pivot!64 to!184) lt!607780)))

(declare-fun b!1379856 () Bool)

(assert (=> b!1379856 (= e!781765 e!781764)))

(declare-fun c!128257 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379856 (= c!128257 (validKeyInArray!0 (select (arr!45363 a!4010) pivot!64)))))

(declare-fun b!1379857 () Bool)

(assert (=> b!1379857 (= e!781764 (bvadd #b00000000000000000000000000000001 call!66104))))

(assert (= (and d!148665 c!128258) b!1379855))

(assert (= (and d!148665 (not c!128258)) b!1379856))

(assert (= (and b!1379856 c!128257) b!1379857))

(assert (= (and b!1379856 (not c!128257)) b!1379854))

(assert (= (or b!1379857 b!1379854) bm!66101))

(declare-fun m!1265077 () Bool)

(assert (=> bm!66101 m!1265077))

(declare-fun m!1265079 () Bool)

(assert (=> b!1379856 m!1265079))

(assert (=> b!1379856 m!1265079))

(declare-fun m!1265081 () Bool)

(assert (=> b!1379856 m!1265081))

(assert (=> b!1379814 d!148665))

(declare-fun b!1379870 () Bool)

(declare-fun e!781772 () (_ BitVec 32))

(declare-fun call!66106 () (_ BitVec 32))

(assert (=> b!1379870 (= e!781772 call!66106)))

(declare-fun bm!66103 () Bool)

(assert (=> bm!66103 (= call!66106 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) to!184))))

(declare-fun b!1379871 () Bool)

(declare-fun e!781773 () (_ BitVec 32))

(assert (=> b!1379871 (= e!781773 #b00000000000000000000000000000000)))

(declare-fun d!148675 () Bool)

(declare-fun lt!607784 () (_ BitVec 32))

(assert (=> d!148675 (and (bvsge lt!607784 #b00000000000000000000000000000000) (bvsle lt!607784 (bvsub (size!45913 a!4010) from!3388)))))

(assert (=> d!148675 (= lt!607784 e!781773)))

(declare-fun c!128266 () Bool)

(assert (=> d!148675 (= c!128266 (bvsge from!3388 to!184))))

(assert (=> d!148675 (and (bvsle from!3388 to!184) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle to!184 (size!45913 a!4010)))))

(assert (=> d!148675 (= (arrayCountValidKeys!0 a!4010 from!3388 to!184) lt!607784)))

(declare-fun b!1379872 () Bool)

(assert (=> b!1379872 (= e!781773 e!781772)))

(declare-fun c!128265 () Bool)

(assert (=> b!1379872 (= c!128265 (validKeyInArray!0 (select (arr!45363 a!4010) from!3388)))))

(declare-fun b!1379873 () Bool)

(assert (=> b!1379873 (= e!781772 (bvadd #b00000000000000000000000000000001 call!66106))))

(assert (= (and d!148675 c!128266) b!1379871))

(assert (= (and d!148675 (not c!128266)) b!1379872))

(assert (= (and b!1379872 c!128265) b!1379873))

(assert (= (and b!1379872 (not c!128265)) b!1379870))

(assert (= (or b!1379873 b!1379870) bm!66103))

(declare-fun m!1265083 () Bool)

(assert (=> bm!66103 m!1265083))

(declare-fun m!1265085 () Bool)

(assert (=> b!1379872 m!1265085))

(assert (=> b!1379872 m!1265085))

(declare-fun m!1265087 () Bool)

(assert (=> b!1379872 m!1265087))

(assert (=> b!1379814 d!148675))

(declare-fun b!1379874 () Bool)

(declare-fun e!781774 () (_ BitVec 32))

(declare-fun call!66109 () (_ BitVec 32))

(assert (=> b!1379874 (= e!781774 call!66109)))

(declare-fun bm!66106 () Bool)

(assert (=> bm!66106 (= call!66109 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) pivot!64))))

(declare-fun b!1379875 () Bool)

(declare-fun e!781775 () (_ BitVec 32))

(assert (=> b!1379875 (= e!781775 #b00000000000000000000000000000000)))

(declare-fun d!148677 () Bool)

(declare-fun lt!607785 () (_ BitVec 32))

(assert (=> d!148677 (and (bvsge lt!607785 #b00000000000000000000000000000000) (bvsle lt!607785 (bvsub (size!45913 a!4010) from!3388)))))

(assert (=> d!148677 (= lt!607785 e!781775)))

(declare-fun c!128268 () Bool)

(assert (=> d!148677 (= c!128268 (bvsge from!3388 pivot!64))))

(assert (=> d!148677 (and (bvsle from!3388 pivot!64) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle pivot!64 (size!45913 a!4010)))))

(assert (=> d!148677 (= (arrayCountValidKeys!0 a!4010 from!3388 pivot!64) lt!607785)))

(declare-fun b!1379876 () Bool)

(assert (=> b!1379876 (= e!781775 e!781774)))

(declare-fun c!128267 () Bool)

(assert (=> b!1379876 (= c!128267 (validKeyInArray!0 (select (arr!45363 a!4010) from!3388)))))

(declare-fun b!1379877 () Bool)

(assert (=> b!1379877 (= e!781774 (bvadd #b00000000000000000000000000000001 call!66109))))

(assert (= (and d!148677 c!128268) b!1379875))

(assert (= (and d!148677 (not c!128268)) b!1379876))

(assert (= (and b!1379876 c!128267) b!1379877))

(assert (= (and b!1379876 (not c!128267)) b!1379874))

(assert (= (or b!1379877 b!1379874) bm!66106))

(declare-fun m!1265089 () Bool)

(assert (=> bm!66106 m!1265089))

(assert (=> b!1379876 m!1265085))

(assert (=> b!1379876 m!1265085))

(assert (=> b!1379876 m!1265087))

(assert (=> b!1379814 d!148677))

(declare-fun d!148679 () Bool)

(assert (=> d!148679 (= (isPivot!0 a!4010 from!3388 to!184 from!3388) (= (bvadd (arrayCountValidKeys!0 a!4010 from!3388 from!3388) (arrayCountValidKeys!0 a!4010 from!3388 to!184)) (arrayCountValidKeys!0 a!4010 from!3388 to!184)))))

(declare-fun bs!39792 () Bool)

(assert (= bs!39792 d!148679))

(declare-fun m!1265091 () Bool)

(assert (=> bs!39792 m!1265091))

(assert (=> bs!39792 m!1265031))

(assert (=> bs!39792 m!1265031))

(assert (=> b!1379813 d!148679))

(check-sat (not b!1379856) (not bm!66103) (not b!1379876) (not d!148647) (not d!148679) (not bm!66101) (not b!1379872) (not d!148649) (not b!1379823) (not bm!66106))
(check-sat)
