; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92794 () Bool)

(assert start!92794)

(declare-fun b!1054074 () Bool)

(declare-fun res!703061 () Bool)

(declare-fun e!598767 () Bool)

(assert (=> b!1054074 (=> (not res!703061) (not e!598767))))

(declare-datatypes ((array!66487 0))(
  ( (array!66488 (arr!31977 (Array (_ BitVec 32) (_ BitVec 64))) (size!32513 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66487)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054074 (= res!703061 (= (select (arr!31977 a!3488) i!1381) k!2747))))

(declare-fun b!1054075 () Bool)

(declare-fun res!703059 () Bool)

(assert (=> b!1054075 (=> (not res!703059) (not e!598767))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054075 (= res!703059 (validKeyInArray!0 k!2747))))

(declare-fun b!1054076 () Bool)

(declare-fun e!598768 () Bool)

(declare-fun lt!465306 () (_ BitVec 32))

(assert (=> b!1054076 (= e!598768 (or (bvslt lt!465306 #b00000000000000000000000000000000) (bvslt lt!465306 (size!32513 a!3488))))))

(declare-datatypes ((List!22289 0))(
  ( (Nil!22286) (Cons!22285 (h!23494 (_ BitVec 64)) (t!31596 List!22289)) )
))
(declare-fun arrayNoDuplicates!0 (array!66487 (_ BitVec 32) List!22289) Bool)

(assert (=> b!1054076 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22286)))

(declare-datatypes ((Unit!34512 0))(
  ( (Unit!34513) )
))
(declare-fun lt!465304 () Unit!34512)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66487 (_ BitVec 32) (_ BitVec 32)) Unit!34512)

(assert (=> b!1054076 (= lt!465304 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054077 () Bool)

(declare-fun e!598766 () Bool)

(declare-fun e!598765 () Bool)

(assert (=> b!1054077 (= e!598766 e!598765)))

(declare-fun res!703057 () Bool)

(assert (=> b!1054077 (=> res!703057 e!598765)))

(assert (=> b!1054077 (= res!703057 (bvsle lt!465306 i!1381))))

(declare-fun b!1054078 () Bool)

(declare-fun res!703056 () Bool)

(assert (=> b!1054078 (=> (not res!703056) (not e!598767))))

(assert (=> b!1054078 (= res!703056 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22286))))

(declare-fun b!1054079 () Bool)

(declare-fun e!598770 () Bool)

(assert (=> b!1054079 (= e!598770 (not e!598768))))

(declare-fun res!703063 () Bool)

(assert (=> b!1054079 (=> res!703063 e!598768)))

(assert (=> b!1054079 (= res!703063 (bvsle lt!465306 i!1381))))

(assert (=> b!1054079 e!598766))

(declare-fun res!703064 () Bool)

(assert (=> b!1054079 (=> (not res!703064) (not e!598766))))

(assert (=> b!1054079 (= res!703064 (= (select (store (arr!31977 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465306) k!2747))))

(declare-fun b!1054080 () Bool)

(declare-fun arrayContainsKey!0 (array!66487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054080 (= e!598765 (arrayContainsKey!0 a!3488 k!2747 lt!465306))))

(declare-fun b!1054081 () Bool)

(declare-fun e!598769 () Bool)

(assert (=> b!1054081 (= e!598767 e!598769)))

(declare-fun res!703058 () Bool)

(assert (=> b!1054081 (=> (not res!703058) (not e!598769))))

(declare-fun lt!465305 () array!66487)

(assert (=> b!1054081 (= res!703058 (arrayContainsKey!0 lt!465305 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054081 (= lt!465305 (array!66488 (store (arr!31977 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32513 a!3488)))))

(declare-fun res!703062 () Bool)

(assert (=> start!92794 (=> (not res!703062) (not e!598767))))

(assert (=> start!92794 (= res!703062 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32513 a!3488)) (bvslt (size!32513 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92794 e!598767))

(assert (=> start!92794 true))

(declare-fun array_inv!24757 (array!66487) Bool)

(assert (=> start!92794 (array_inv!24757 a!3488)))

(declare-fun b!1054082 () Bool)

(assert (=> b!1054082 (= e!598769 e!598770)))

(declare-fun res!703060 () Bool)

(assert (=> b!1054082 (=> (not res!703060) (not e!598770))))

(assert (=> b!1054082 (= res!703060 (not (= lt!465306 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66487 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054082 (= lt!465306 (arrayScanForKey!0 lt!465305 k!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92794 res!703062) b!1054078))

(assert (= (and b!1054078 res!703056) b!1054075))

(assert (= (and b!1054075 res!703059) b!1054074))

(assert (= (and b!1054074 res!703061) b!1054081))

(assert (= (and b!1054081 res!703058) b!1054082))

(assert (= (and b!1054082 res!703060) b!1054079))

(assert (= (and b!1054079 res!703064) b!1054077))

(assert (= (and b!1054077 (not res!703057)) b!1054080))

(assert (= (and b!1054079 (not res!703063)) b!1054076))

(declare-fun m!974209 () Bool)

(assert (=> start!92794 m!974209))

(declare-fun m!974211 () Bool)

(assert (=> b!1054075 m!974211))

(declare-fun m!974213 () Bool)

(assert (=> b!1054081 m!974213))

(declare-fun m!974215 () Bool)

(assert (=> b!1054081 m!974215))

(declare-fun m!974217 () Bool)

(assert (=> b!1054074 m!974217))

(declare-fun m!974219 () Bool)

(assert (=> b!1054078 m!974219))

(assert (=> b!1054079 m!974215))

(declare-fun m!974221 () Bool)

(assert (=> b!1054079 m!974221))

(declare-fun m!974223 () Bool)

(assert (=> b!1054080 m!974223))

(declare-fun m!974225 () Bool)

(assert (=> b!1054082 m!974225))

(declare-fun m!974227 () Bool)

(assert (=> b!1054076 m!974227))

(declare-fun m!974229 () Bool)

(assert (=> b!1054076 m!974229))

(push 1)

(assert (not b!1054080))

(assert (not start!92794))

(assert (not b!1054078))

(assert (not b!1054076))

(assert (not b!1054075))

(assert (not b!1054081))

(assert (not b!1054082))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!127965 () Bool)

(declare-fun res!703090 () Bool)

(declare-fun e!598804 () Bool)

(assert (=> d!127965 (=> res!703090 e!598804)))

(assert (=> d!127965 (= res!703090 (= (select (arr!31977 lt!465305) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!127965 (= (arrayContainsKey!0 lt!465305 k!2747 #b00000000000000000000000000000000) e!598804)))

(declare-fun b!1054122 () Bool)

(declare-fun e!598805 () Bool)

(assert (=> b!1054122 (= e!598804 e!598805)))

(declare-fun res!703091 () Bool)

(assert (=> b!1054122 (=> (not res!703091) (not e!598805))))

(assert (=> b!1054122 (= res!703091 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32513 lt!465305)))))

(declare-fun b!1054123 () Bool)

(assert (=> b!1054123 (= e!598805 (arrayContainsKey!0 lt!465305 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127965 (not res!703090)) b!1054122))

(assert (= (and b!1054122 res!703091) b!1054123))

(declare-fun m!974243 () Bool)

(assert (=> d!127965 m!974243))

(declare-fun m!974245 () Bool)

(assert (=> b!1054123 m!974245))

(assert (=> b!1054081 d!127965))

(declare-fun b!1054154 () Bool)

(declare-fun e!598832 () Bool)

(declare-fun call!44768 () Bool)

(assert (=> b!1054154 (= e!598832 call!44768)))

(declare-fun b!1054155 () Bool)

(declare-fun e!598834 () Bool)

(declare-fun e!598833 () Bool)

(assert (=> b!1054155 (= e!598834 e!598833)))

(declare-fun res!703112 () Bool)

(assert (=> b!1054155 (=> (not res!703112) (not e!598833))))

(declare-fun e!598831 () Bool)

(assert (=> b!1054155 (= res!703112 (not e!598831))))

(declare-fun res!703113 () Bool)

(assert (=> b!1054155 (=> (not res!703113) (not e!598831))))

(assert (=> b!1054155 (= res!703113 (validKeyInArray!0 (select (arr!31977 a!3488) i!1381)))))

(declare-fun b!1054156 () Bool)

(assert (=> b!1054156 (= e!598832 call!44768)))

(declare-fun d!127967 () Bool)

(declare-fun res!703114 () Bool)

(assert (=> d!127967 (=> res!703114 e!598834)))

(assert (=> d!127967 (= res!703114 (bvsge i!1381 (size!32513 a!3488)))))

(assert (=> d!127967 (= (arrayNoDuplicates!0 a!3488 i!1381 Nil!22286) e!598834)))

(declare-fun b!1054157 () Bool)

(assert (=> b!1054157 (= e!598833 e!598832)))

(declare-fun c!106981 () Bool)

(assert (=> b!1054157 (= c!106981 (validKeyInArray!0 (select (arr!31977 a!3488) i!1381)))))

(declare-fun b!1054158 () Bool)

(declare-fun contains!6173 (List!22289 (_ BitVec 64)) Bool)

(assert (=> b!1054158 (= e!598831 (contains!6173 Nil!22286 (select (arr!31977 a!3488) i!1381)))))

(declare-fun bm!44765 () Bool)

(assert (=> bm!44765 (= call!44768 (arrayNoDuplicates!0 a!3488 (bvadd i!1381 #b00000000000000000000000000000001) (ite c!106981 (Cons!22285 (select (arr!31977 a!3488) i!1381) Nil!22286) Nil!22286)))))

(assert (= (and d!127967 (not res!703114)) b!1054155))

(assert (= (and b!1054155 res!703113) b!1054158))

(assert (= (and b!1054155 res!703112) b!1054157))

(assert (= (and b!1054157 c!106981) b!1054154))

(assert (= (and b!1054157 (not c!106981)) b!1054156))

(assert (= (or b!1054154 b!1054156) bm!44765))

(assert (=> b!1054155 m!974217))

(assert (=> b!1054155 m!974217))

(declare-fun m!974275 () Bool)

(assert (=> b!1054155 m!974275))

(assert (=> b!1054157 m!974217))

(assert (=> b!1054157 m!974217))

(assert (=> b!1054157 m!974275))

(assert (=> b!1054158 m!974217))

(assert (=> b!1054158 m!974217))

(declare-fun m!974277 () Bool)

(assert (=> b!1054158 m!974277))

(assert (=> bm!44765 m!974217))

(declare-fun m!974279 () Bool)

(assert (=> bm!44765 m!974279))

(assert (=> b!1054076 d!127967))

(declare-fun d!127983 () Bool)

(assert (=> d!127983 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22286)))

(declare-fun lt!465318 () Unit!34512)

(declare-fun choose!39 (array!66487 (_ BitVec 32) (_ BitVec 32)) Unit!34512)

(assert (=> d!127983 (= lt!465318 (choose!39 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (=> d!127983 (bvslt (size!32513 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!127983 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381) lt!465318)))

(declare-fun bs!30888 () Bool)

(assert (= bs!30888 d!127983))

(assert (=> bs!30888 m!974227))

(declare-fun m!974281 () Bool)

(assert (=> bs!30888 m!974281))

(assert (=> b!1054076 d!127983))

(declare-fun d!127985 () Bool)

(declare-fun lt!465324 () (_ BitVec 32))

(assert (=> d!127985 (and (or (bvslt lt!465324 #b00000000000000000000000000000000) (bvsge lt!465324 (size!32513 lt!465305)) (and (bvsge lt!465324 #b00000000000000000000000000000000) (bvslt lt!465324 (size!32513 lt!465305)))) (bvsge lt!465324 #b00000000000000000000000000000000) (bvslt lt!465324 (size!32513 lt!465305)) (= (select (arr!31977 lt!465305) lt!465324) k!2747))))

(declare-fun e!598846 () (_ BitVec 32))

(assert (=> d!127985 (= lt!465324 e!598846)))

(declare-fun c!106988 () Bool)

(assert (=> d!127985 (= c!106988 (= (select (arr!31977 lt!465305) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!127985 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32513 lt!465305)) (bvslt (size!32513 lt!465305) #b01111111111111111111111111111111))))

(assert (=> d!127985 (= (arrayScanForKey!0 lt!465305 k!2747 #b00000000000000000000000000000000) lt!465324)))

(declare-fun b!1054176 () Bool)

(assert (=> b!1054176 (= e!598846 #b00000000000000000000000000000000)))

(declare-fun b!1054177 () Bool)

(assert (=> b!1054177 (= e!598846 (arrayScanForKey!0 lt!465305 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127985 c!106988) b!1054176))

(assert (= (and d!127985 (not c!106988)) b!1054177))

(declare-fun m!974299 () Bool)

(assert (=> d!127985 m!974299))

(assert (=> d!127985 m!974243))

(declare-fun m!974301 () Bool)

(assert (=> b!1054177 m!974301))

(assert (=> b!1054082 d!127985))

(declare-fun b!1054178 () Bool)

(declare-fun e!598848 () Bool)

(declare-fun call!44770 () Bool)

(assert (=> b!1054178 (= e!598848 call!44770)))

(declare-fun b!1054179 () Bool)

(declare-fun e!598850 () Bool)

(declare-fun e!598849 () Bool)

(assert (=> b!1054179 (= e!598850 e!598849)))

(declare-fun res!703120 () Bool)

(assert (=> b!1054179 (=> (not res!703120) (not e!598849))))

(declare-fun e!598847 () Bool)

(assert (=> b!1054179 (= res!703120 (not e!598847))))

(declare-fun res!703121 () Bool)

(assert (=> b!1054179 (=> (not res!703121) (not e!598847))))

(assert (=> b!1054179 (= res!703121 (validKeyInArray!0 (select (arr!31977 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1054180 () Bool)

(assert (=> b!1054180 (= e!598848 call!44770)))

(declare-fun d!127993 () Bool)

(declare-fun res!703122 () Bool)

(assert (=> d!127993 (=> res!703122 e!598850)))

(assert (=> d!127993 (= res!703122 (bvsge #b00000000000000000000000000000000 (size!32513 a!3488)))))

(assert (=> d!127993 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22286) e!598850)))

(declare-fun b!1054181 () Bool)

(assert (=> b!1054181 (= e!598849 e!598848)))

(declare-fun c!106989 () Bool)

(assert (=> b!1054181 (= c!106989 (validKeyInArray!0 (select (arr!31977 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1054182 () Bool)

(assert (=> b!1054182 (= e!598847 (contains!6173 Nil!22286 (select (arr!31977 a!3488) #b00000000000000000000000000000000)))))

(declare-fun bm!44767 () Bool)

(assert (=> bm!44767 (= call!44770 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106989 (Cons!22285 (select (arr!31977 a!3488) #b00000000000000000000000000000000) Nil!22286) Nil!22286)))))

(assert (= (and d!127993 (not res!703122)) b!1054179))

(assert (= (and b!1054179 res!703121) b!1054182))

(assert (= (and b!1054179 res!703120) b!1054181))

(assert (= (and b!1054181 c!106989) b!1054178))

(assert (= (and b!1054181 (not c!106989)) b!1054180))

(assert (= (or b!1054178 b!1054180) bm!44767))

(declare-fun m!974303 () Bool)

(assert (=> b!1054179 m!974303))

(assert (=> b!1054179 m!974303))

(declare-fun m!974305 () Bool)

(assert (=> b!1054179 m!974305))

(assert (=> b!1054181 m!974303))

(assert (=> b!1054181 m!974303))

(assert (=> b!1054181 m!974305))

(assert (=> b!1054182 m!974303))

(assert (=> b!1054182 m!974303))

(declare-fun m!974307 () Bool)

(assert (=> b!1054182 m!974307))

(assert (=> bm!44767 m!974303))

(declare-fun m!974309 () Bool)

(assert (=> bm!44767 m!974309))

(assert (=> b!1054078 d!127993))

(declare-fun d!127995 () Bool)

(assert (=> d!127995 (= (array_inv!24757 a!3488) (bvsge (size!32513 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92794 d!127995))

(declare-fun d!127997 () Bool)

(declare-fun res!703123 () Bool)

(declare-fun e!598851 () Bool)

(assert (=> d!127997 (=> res!703123 e!598851)))

(assert (=> d!127997 (= res!703123 (= (select (arr!31977 a!3488) lt!465306) k!2747))))

(assert (=> d!127997 (= (arrayContainsKey!0 a!3488 k!2747 lt!465306) e!598851)))

(declare-fun b!1054183 () Bool)

(declare-fun e!598852 () Bool)

(assert (=> b!1054183 (= e!598851 e!598852)))

(declare-fun res!703124 () Bool)

(assert (=> b!1054183 (=> (not res!703124) (not e!598852))))

(assert (=> b!1054183 (= res!703124 (bvslt (bvadd lt!465306 #b00000000000000000000000000000001) (size!32513 a!3488)))))

(declare-fun b!1054184 () Bool)

(assert (=> b!1054184 (= e!598852 (arrayContainsKey!0 a!3488 k!2747 (bvadd lt!465306 #b00000000000000000000000000000001)))))

(assert (= (and d!127997 (not res!703123)) b!1054183))

(assert (= (and b!1054183 res!703124) b!1054184))

(declare-fun m!974311 () Bool)

(assert (=> d!127997 m!974311))

(declare-fun m!974313 () Bool)

(assert (=> b!1054184 m!974313))

(assert (=> b!1054080 d!127997))

(declare-fun d!127999 () Bool)

(assert (=> d!127999 (= (validKeyInArray!0 k!2747) (and (not (= k!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1054075 d!127999))

(push 1)

