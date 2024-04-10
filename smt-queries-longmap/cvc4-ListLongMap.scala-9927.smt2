; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117352 () Bool)

(assert start!117352)

(declare-fun res!922210 () Bool)

(declare-fun e!781741 () Bool)

(assert (=> start!117352 (=> (not res!922210) (not e!781741))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93933 0))(
  ( (array!93934 (arr!45364 (Array (_ BitVec 32) (_ BitVec 64))) (size!45914 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93933)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117352 (= res!922210 (and (bvslt (size!45914 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45914 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117352 e!781741))

(declare-fun array_inv!34392 (array!93933) Bool)

(assert (=> start!117352 (array_inv!34392 a!4010)))

(assert (=> start!117352 true))

(declare-fun b!1379819 () Bool)

(declare-fun res!922209 () Bool)

(assert (=> b!1379819 (=> (not res!922209) (not e!781741))))

(declare-fun isPivot!0 (array!93933 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379819 (= res!922209 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379820 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93933 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379820 (= e!781741 (not (= (bvadd (arrayCountValidKeys!0 a!4010 from!3388 pivot!64) (arrayCountValidKeys!0 a!4010 pivot!64 to!184)) (arrayCountValidKeys!0 a!4010 from!3388 to!184))))))

(assert (=> b!1379820 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45919 0))(
  ( (Unit!45920) )
))
(declare-fun lt!607764 () Unit!45919)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93933 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45919)

(assert (=> b!1379820 (= lt!607764 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117352 res!922210) b!1379819))

(assert (= (and b!1379819 res!922209) b!1379820))

(declare-fun m!1265041 () Bool)

(assert (=> start!117352 m!1265041))

(declare-fun m!1265043 () Bool)

(assert (=> b!1379819 m!1265043))

(declare-fun m!1265045 () Bool)

(assert (=> b!1379820 m!1265045))

(declare-fun m!1265047 () Bool)

(assert (=> b!1379820 m!1265047))

(declare-fun m!1265049 () Bool)

(assert (=> b!1379820 m!1265049))

(declare-fun m!1265051 () Bool)

(assert (=> b!1379820 m!1265051))

(declare-fun m!1265053 () Bool)

(assert (=> b!1379820 m!1265053))

(push 1)

(assert (not b!1379819))

(assert (not start!117352))

(assert (not b!1379820))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!148655 () Bool)

(assert (=> d!148655 (= (isPivot!0 a!4010 from!3388 to!184 from!3388) (= (bvadd (arrayCountValidKeys!0 a!4010 from!3388 from!3388) (arrayCountValidKeys!0 a!4010 from!3388 to!184)) (arrayCountValidKeys!0 a!4010 from!3388 to!184)))))

(declare-fun bs!39790 () Bool)

(assert (= bs!39790 d!148655))

(declare-fun m!1265055 () Bool)

(assert (=> bs!39790 m!1265055))

(assert (=> bs!39790 m!1265045))

(assert (=> bs!39790 m!1265045))

(assert (=> b!1379819 d!148655))

(declare-fun d!148659 () Bool)

(assert (=> d!148659 (= (array_inv!34392 a!4010) (bvsge (size!45914 a!4010) #b00000000000000000000000000000000))))

(assert (=> start!117352 d!148659))

(declare-fun d!148661 () Bool)

(assert (=> d!148661 (= (isPivot!0 a!4010 from!3388 to!184 pivot!64) (= (bvadd (arrayCountValidKeys!0 a!4010 from!3388 pivot!64) (arrayCountValidKeys!0 a!4010 pivot!64 to!184)) (arrayCountValidKeys!0 a!4010 from!3388 to!184)))))

(declare-fun bs!39791 () Bool)

(assert (= bs!39791 d!148661))

(assert (=> bs!39791 m!1265047))

(assert (=> bs!39791 m!1265049))

(assert (=> bs!39791 m!1265045))

(assert (=> b!1379820 d!148661))

(declare-fun d!148663 () Bool)

(assert (=> d!148663 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-fun lt!607772 () Unit!45919)

(declare-fun choose!124 (array!93933 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45919)

(assert (=> d!148663 (= lt!607772 (choose!124 a!4010 from!3388 to!184 pivot!64 from!3388))))

(declare-fun e!781750 () Bool)

(assert (=> d!148663 e!781750))

(declare-fun res!922218 () Bool)

(assert (=> d!148663 (=> (not res!922218) (not e!781750))))

(assert (=> d!148663 (= res!922218 (and (bvslt (size!45914 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45914 a!4010)) (bvsge pivot!64 from!3388) (bvslt pivot!64 to!184) (bvsle from!3388 pivot!64) (bvsge from!3388 from!3388)))))

(assert (=> d!148663 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388) lt!607772)))

(declare-fun b!1379828 () Bool)

(assert (=> b!1379828 (= e!781750 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(assert (= (and d!148663 res!922218) b!1379828))

(assert (=> d!148663 m!1265053))

(declare-fun m!1265059 () Bool)

(assert (=> d!148663 m!1265059))

(assert (=> b!1379828 m!1265043))

(assert (=> b!1379820 d!148663))

(declare-fun bm!66099 () Bool)

(declare-fun call!66102 () (_ BitVec 32))

(assert (=> bm!66099 (= call!66102 (arrayCountValidKeys!0 a!4010 (bvadd pivot!64 #b00000000000000000000000000000001) to!184))))

(declare-fun b!1379846 () Bool)

(declare-fun e!781760 () (_ BitVec 32))

(assert (=> b!1379846 (= e!781760 call!66102)))

(declare-fun b!1379847 () Bool)

(assert (=> b!1379847 (= e!781760 (bvadd #b00000000000000000000000000000001 call!66102))))

(declare-fun b!1379848 () Bool)

(declare-fun e!781761 () (_ BitVec 32))

(assert (=> b!1379848 (= e!781761 #b00000000000000000000000000000000)))

(declare-fun b!1379849 () Bool)

(assert (=> b!1379849 (= e!781761 e!781760)))

(declare-fun c!128254 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379849 (= c!128254 (validKeyInArray!0 (select (arr!45364 a!4010) pivot!64)))))

(declare-fun d!148667 () Bool)

(declare-fun lt!607778 () (_ BitVec 32))

(assert (=> d!148667 (and (bvsge lt!607778 #b00000000000000000000000000000000) (bvsle lt!607778 (bvsub (size!45914 a!4010) pivot!64)))))

(assert (=> d!148667 (= lt!607778 e!781761)))

(declare-fun c!128253 () Bool)

(assert (=> d!148667 (= c!128253 (bvsge pivot!64 to!184))))

(assert (=> d!148667 (and (bvsle pivot!64 to!184) (bvsge pivot!64 #b00000000000000000000000000000000) (bvsle to!184 (size!45914 a!4010)))))

(assert (=> d!148667 (= (arrayCountValidKeys!0 a!4010 pivot!64 to!184) lt!607778)))

(assert (= (and d!148667 c!128253) b!1379848))

(assert (= (and d!148667 (not c!128253)) b!1379849))

(assert (= (and b!1379849 c!128254) b!1379847))

(assert (= (and b!1379849 (not c!128254)) b!1379846))

(assert (= (or b!1379847 b!1379846) bm!66099))

(declare-fun m!1265063 () Bool)

(assert (=> bm!66099 m!1265063))

(declare-fun m!1265065 () Bool)

(assert (=> b!1379849 m!1265065))

(assert (=> b!1379849 m!1265065))

(declare-fun m!1265067 () Bool)

(assert (=> b!1379849 m!1265067))

(assert (=> b!1379820 d!148667))

(declare-fun bm!66100 () Bool)

(declare-fun call!66103 () (_ BitVec 32))

(assert (=> bm!66100 (= call!66103 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) to!184))))

(declare-fun b!1379850 () Bool)

(declare-fun e!781762 () (_ BitVec 32))

(assert (=> b!1379850 (= e!781762 call!66103)))

(declare-fun b!1379851 () Bool)

(assert (=> b!1379851 (= e!781762 (bvadd #b00000000000000000000000000000001 call!66103))))

(declare-fun b!1379852 () Bool)

(declare-fun e!781763 () (_ BitVec 32))

(assert (=> b!1379852 (= e!781763 #b00000000000000000000000000000000)))

(declare-fun b!1379853 () Bool)

(assert (=> b!1379853 (= e!781763 e!781762)))

(declare-fun c!128256 () Bool)

(assert (=> b!1379853 (= c!128256 (validKeyInArray!0 (select (arr!45364 a!4010) from!3388)))))

(declare-fun d!148671 () Bool)

(declare-fun lt!607779 () (_ BitVec 32))

(assert (=> d!148671 (and (bvsge lt!607779 #b00000000000000000000000000000000) (bvsle lt!607779 (bvsub (size!45914 a!4010) from!3388)))))

(assert (=> d!148671 (= lt!607779 e!781763)))

(declare-fun c!128255 () Bool)

(assert (=> d!148671 (= c!128255 (bvsge from!3388 to!184))))

(assert (=> d!148671 (and (bvsle from!3388 to!184) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle to!184 (size!45914 a!4010)))))

(assert (=> d!148671 (= (arrayCountValidKeys!0 a!4010 from!3388 to!184) lt!607779)))

(assert (= (and d!148671 c!128255) b!1379852))

(assert (= (and d!148671 (not c!128255)) b!1379853))

(assert (= (and b!1379853 c!128256) b!1379851))

(assert (= (and b!1379853 (not c!128256)) b!1379850))

(assert (= (or b!1379851 b!1379850) bm!66100))

(declare-fun m!1265069 () Bool)

(assert (=> bm!66100 m!1265069))

(declare-fun m!1265071 () Bool)

(assert (=> b!1379853 m!1265071))

(assert (=> b!1379853 m!1265071))

(declare-fun m!1265073 () Bool)

(assert (=> b!1379853 m!1265073))

(assert (=> b!1379820 d!148671))

(declare-fun call!66105 () (_ BitVec 32))

(declare-fun bm!66102 () Bool)

(assert (=> bm!66102 (= call!66105 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) pivot!64))))

(declare-fun b!1379858 () Bool)

(declare-fun e!781766 () (_ BitVec 32))

(assert (=> b!1379858 (= e!781766 call!66105)))

(declare-fun b!1379859 () Bool)

(assert (=> b!1379859 (= e!781766 (bvadd #b00000000000000000000000000000001 call!66105))))

(declare-fun b!1379860 () Bool)

(declare-fun e!781767 () (_ BitVec 32))

(assert (=> b!1379860 (= e!781767 #b00000000000000000000000000000000)))

(declare-fun b!1379861 () Bool)

(assert (=> b!1379861 (= e!781767 e!781766)))

(declare-fun c!128260 () Bool)

(assert (=> b!1379861 (= c!128260 (validKeyInArray!0 (select (arr!45364 a!4010) from!3388)))))

(declare-fun d!148673 () Bool)

(declare-fun lt!607781 () (_ BitVec 32))

(assert (=> d!148673 (and (bvsge lt!607781 #b00000000000000000000000000000000) (bvsle lt!607781 (bvsub (size!45914 a!4010) from!3388)))))

(assert (=> d!148673 (= lt!607781 e!781767)))

(declare-fun c!128259 () Bool)

(assert (=> d!148673 (= c!128259 (bvsge from!3388 pivot!64))))

(assert (=> d!148673 (and (bvsle from!3388 pivot!64) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle pivot!64 (size!45914 a!4010)))))

(assert (=> d!148673 (= (arrayCountValidKeys!0 a!4010 from!3388 pivot!64) lt!607781)))

(assert (= (and d!148673 c!128259) b!1379860))

(assert (= (and d!148673 (not c!128259)) b!1379861))

(assert (= (and b!1379861 c!128260) b!1379859))

(assert (= (and b!1379861 (not c!128260)) b!1379858))

(assert (= (or b!1379859 b!1379858) bm!66102))

(declare-fun m!1265075 () Bool)

(assert (=> bm!66102 m!1265075))

(assert (=> b!1379861 m!1265071))

(assert (=> b!1379861 m!1265071))

(assert (=> b!1379861 m!1265073))

(assert (=> b!1379820 d!148673))

(push 1)

