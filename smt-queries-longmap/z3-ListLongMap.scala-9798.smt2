; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116344 () Bool)

(assert start!116344)

(declare-fun b!1373288 () Bool)

(declare-fun res!916584 () Bool)

(declare-fun e!777916 () Bool)

(assert (=> b!1373288 (=> (not res!916584) (not e!777916))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!93081 0))(
  ( (array!93082 (arr!44950 (Array (_ BitVec 32) (_ BitVec 64))) (size!45502 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93081)

(assert (=> b!1373288 (= res!916584 (bvslt from!3239 (size!45502 a!3861)))))

(declare-fun b!1373290 () Bool)

(declare-fun res!916585 () Bool)

(assert (=> b!1373290 (=> (not res!916585) (not e!777916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373290 (= res!916585 (not (validKeyInArray!0 (select (arr!44950 a!3861) from!3239))))))

(declare-fun b!1373291 () Bool)

(declare-fun res!916576 () Bool)

(declare-fun e!777917 () Bool)

(assert (=> b!1373291 (=> (not res!916576) (not e!777917))))

(declare-datatypes ((List!32096 0))(
  ( (Nil!32093) (Cons!32092 (h!33301 (_ BitVec 64)) (t!46782 List!32096)) )
))
(declare-fun newAcc!98 () List!32096)

(declare-fun contains!9689 (List!32096 (_ BitVec 64)) Bool)

(assert (=> b!1373291 (= res!916576 (not (contains!9689 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373292 () Bool)

(declare-fun res!916581 () Bool)

(assert (=> b!1373292 (=> (not res!916581) (not e!777916))))

(assert (=> b!1373292 (= res!916581 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1373293 () Bool)

(declare-fun res!916580 () Bool)

(assert (=> b!1373293 (=> (not res!916580) (not e!777916))))

(declare-fun acc!866 () List!32096)

(declare-fun arrayNoDuplicates!0 (array!93081 (_ BitVec 32) List!32096) Bool)

(assert (=> b!1373293 (= res!916580 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1373294 () Bool)

(declare-fun res!916586 () Bool)

(assert (=> b!1373294 (=> (not res!916586) (not e!777917))))

(assert (=> b!1373294 (= res!916586 (not (contains!9689 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373295 () Bool)

(declare-fun res!916583 () Bool)

(assert (=> b!1373295 (=> (not res!916583) (not e!777917))))

(declare-fun subseq!1127 (List!32096 List!32096) Bool)

(assert (=> b!1373295 (= res!916583 (subseq!1127 newAcc!98 acc!866))))

(declare-fun b!1373296 () Bool)

(declare-fun res!916578 () Bool)

(assert (=> b!1373296 (=> (not res!916578) (not e!777917))))

(declare-fun noDuplicate!2604 (List!32096) Bool)

(assert (=> b!1373296 (= res!916578 (noDuplicate!2604 acc!866))))

(declare-fun b!1373297 () Bool)

(assert (=> b!1373297 (= e!777916 (not (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98)))))

(assert (=> b!1373297 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-datatypes ((Unit!45228 0))(
  ( (Unit!45229) )
))
(declare-fun lt!602853 () Unit!45228)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!93081 List!32096 List!32096 (_ BitVec 32)) Unit!45228)

(assert (=> b!1373297 (= lt!602853 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(declare-fun b!1373289 () Bool)

(assert (=> b!1373289 (= e!777917 e!777916)))

(declare-fun res!916582 () Bool)

(assert (=> b!1373289 (=> (not res!916582) (not e!777916))))

(assert (=> b!1373289 (= res!916582 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!602852 () Unit!45228)

(declare-fun noDuplicateSubseq!314 (List!32096 List!32096) Unit!45228)

(assert (=> b!1373289 (= lt!602852 (noDuplicateSubseq!314 newAcc!98 acc!866))))

(declare-fun res!916575 () Bool)

(assert (=> start!116344 (=> (not res!916575) (not e!777917))))

(assert (=> start!116344 (= res!916575 (and (bvslt (size!45502 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45502 a!3861))))))

(assert (=> start!116344 e!777917))

(declare-fun array_inv!34183 (array!93081) Bool)

(assert (=> start!116344 (array_inv!34183 a!3861)))

(assert (=> start!116344 true))

(declare-fun b!1373298 () Bool)

(declare-fun res!916577 () Bool)

(assert (=> b!1373298 (=> (not res!916577) (not e!777917))))

(assert (=> b!1373298 (= res!916577 (not (contains!9689 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373299 () Bool)

(declare-fun res!916579 () Bool)

(assert (=> b!1373299 (=> (not res!916579) (not e!777917))))

(assert (=> b!1373299 (= res!916579 (not (contains!9689 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116344 res!916575) b!1373296))

(assert (= (and b!1373296 res!916578) b!1373299))

(assert (= (and b!1373299 res!916579) b!1373298))

(assert (= (and b!1373298 res!916577) b!1373294))

(assert (= (and b!1373294 res!916586) b!1373291))

(assert (= (and b!1373291 res!916576) b!1373295))

(assert (= (and b!1373295 res!916583) b!1373289))

(assert (= (and b!1373289 res!916582) b!1373288))

(assert (= (and b!1373288 res!916584) b!1373290))

(assert (= (and b!1373290 res!916585) b!1373292))

(assert (= (and b!1373292 res!916581) b!1373293))

(assert (= (and b!1373293 res!916580) b!1373297))

(declare-fun m!1256091 () Bool)

(assert (=> start!116344 m!1256091))

(declare-fun m!1256093 () Bool)

(assert (=> b!1373299 m!1256093))

(declare-fun m!1256095 () Bool)

(assert (=> b!1373295 m!1256095))

(declare-fun m!1256097 () Bool)

(assert (=> b!1373296 m!1256097))

(declare-fun m!1256099 () Bool)

(assert (=> b!1373290 m!1256099))

(assert (=> b!1373290 m!1256099))

(declare-fun m!1256101 () Bool)

(assert (=> b!1373290 m!1256101))

(declare-fun m!1256103 () Bool)

(assert (=> b!1373294 m!1256103))

(declare-fun m!1256105 () Bool)

(assert (=> b!1373297 m!1256105))

(declare-fun m!1256107 () Bool)

(assert (=> b!1373297 m!1256107))

(declare-fun m!1256109 () Bool)

(assert (=> b!1373297 m!1256109))

(declare-fun m!1256111 () Bool)

(assert (=> b!1373298 m!1256111))

(declare-fun m!1256113 () Bool)

(assert (=> b!1373293 m!1256113))

(declare-fun m!1256115 () Bool)

(assert (=> b!1373289 m!1256115))

(declare-fun m!1256117 () Bool)

(assert (=> b!1373289 m!1256117))

(declare-fun m!1256119 () Bool)

(assert (=> b!1373291 m!1256119))

(check-sat (not start!116344) (not b!1373293) (not b!1373297) (not b!1373294) (not b!1373296) (not b!1373290) (not b!1373291) (not b!1373298) (not b!1373295) (not b!1373289) (not b!1373299))
(check-sat)
(get-model)

(declare-fun d!147827 () Bool)

(declare-fun res!916663 () Bool)

(declare-fun e!777941 () Bool)

(assert (=> d!147827 (=> res!916663 e!777941)))

(get-info :version)

(assert (=> d!147827 (= res!916663 ((_ is Nil!32093) acc!866))))

(assert (=> d!147827 (= (noDuplicate!2604 acc!866) e!777941)))

(declare-fun b!1373376 () Bool)

(declare-fun e!777942 () Bool)

(assert (=> b!1373376 (= e!777941 e!777942)))

(declare-fun res!916664 () Bool)

(assert (=> b!1373376 (=> (not res!916664) (not e!777942))))

(assert (=> b!1373376 (= res!916664 (not (contains!9689 (t!46782 acc!866) (h!33301 acc!866))))))

(declare-fun b!1373377 () Bool)

(assert (=> b!1373377 (= e!777942 (noDuplicate!2604 (t!46782 acc!866)))))

(assert (= (and d!147827 (not res!916663)) b!1373376))

(assert (= (and b!1373376 res!916664) b!1373377))

(declare-fun m!1256181 () Bool)

(assert (=> b!1373376 m!1256181))

(declare-fun m!1256183 () Bool)

(assert (=> b!1373377 m!1256183))

(assert (=> b!1373296 d!147827))

(declare-fun d!147829 () Bool)

(declare-fun lt!602868 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!746 (List!32096) (InoxSet (_ BitVec 64)))

(assert (=> d!147829 (= lt!602868 (select (content!746 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777955 () Bool)

(assert (=> d!147829 (= lt!602868 e!777955)))

(declare-fun res!916675 () Bool)

(assert (=> d!147829 (=> (not res!916675) (not e!777955))))

(assert (=> d!147829 (= res!916675 ((_ is Cons!32092) newAcc!98))))

(assert (=> d!147829 (= (contains!9689 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602868)))

(declare-fun b!1373392 () Bool)

(declare-fun e!777956 () Bool)

(assert (=> b!1373392 (= e!777955 e!777956)))

(declare-fun res!916676 () Bool)

(assert (=> b!1373392 (=> res!916676 e!777956)))

(assert (=> b!1373392 (= res!916676 (= (h!33301 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373393 () Bool)

(assert (=> b!1373393 (= e!777956 (contains!9689 (t!46782 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147829 res!916675) b!1373392))

(assert (= (and b!1373392 (not res!916676)) b!1373393))

(declare-fun m!1256185 () Bool)

(assert (=> d!147829 m!1256185))

(declare-fun m!1256187 () Bool)

(assert (=> d!147829 m!1256187))

(declare-fun m!1256189 () Bool)

(assert (=> b!1373393 m!1256189))

(assert (=> b!1373291 d!147829))

(declare-fun call!65600 () Bool)

(declare-fun c!127805 () Bool)

(declare-fun bm!65597 () Bool)

(assert (=> bm!65597 (= call!65600 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127805 (Cons!32092 (select (arr!44950 a!3861) from!3239) newAcc!98) newAcc!98)))))

(declare-fun b!1373422 () Bool)

(declare-fun e!777982 () Bool)

(assert (=> b!1373422 (= e!777982 call!65600)))

(declare-fun b!1373423 () Bool)

(declare-fun e!777983 () Bool)

(assert (=> b!1373423 (= e!777983 e!777982)))

(assert (=> b!1373423 (= c!127805 (validKeyInArray!0 (select (arr!44950 a!3861) from!3239)))))

(declare-fun d!147833 () Bool)

(declare-fun res!916697 () Bool)

(declare-fun e!777984 () Bool)

(assert (=> d!147833 (=> res!916697 e!777984)))

(assert (=> d!147833 (= res!916697 (bvsge from!3239 (size!45502 a!3861)))))

(assert (=> d!147833 (= (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98) e!777984)))

(declare-fun b!1373424 () Bool)

(assert (=> b!1373424 (= e!777984 e!777983)))

(declare-fun res!916698 () Bool)

(assert (=> b!1373424 (=> (not res!916698) (not e!777983))))

(declare-fun e!777981 () Bool)

(assert (=> b!1373424 (= res!916698 (not e!777981))))

(declare-fun res!916699 () Bool)

(assert (=> b!1373424 (=> (not res!916699) (not e!777981))))

(assert (=> b!1373424 (= res!916699 (validKeyInArray!0 (select (arr!44950 a!3861) from!3239)))))

(declare-fun b!1373425 () Bool)

(assert (=> b!1373425 (= e!777981 (contains!9689 newAcc!98 (select (arr!44950 a!3861) from!3239)))))

(declare-fun b!1373426 () Bool)

(assert (=> b!1373426 (= e!777982 call!65600)))

(assert (= (and d!147833 (not res!916697)) b!1373424))

(assert (= (and b!1373424 res!916699) b!1373425))

(assert (= (and b!1373424 res!916698) b!1373423))

(assert (= (and b!1373423 c!127805) b!1373422))

(assert (= (and b!1373423 (not c!127805)) b!1373426))

(assert (= (or b!1373422 b!1373426) bm!65597))

(assert (=> bm!65597 m!1256099))

(declare-fun m!1256215 () Bool)

(assert (=> bm!65597 m!1256215))

(assert (=> b!1373423 m!1256099))

(assert (=> b!1373423 m!1256099))

(assert (=> b!1373423 m!1256101))

(assert (=> b!1373424 m!1256099))

(assert (=> b!1373424 m!1256099))

(assert (=> b!1373424 m!1256101))

(assert (=> b!1373425 m!1256099))

(assert (=> b!1373425 m!1256099))

(declare-fun m!1256219 () Bool)

(assert (=> b!1373425 m!1256219))

(assert (=> b!1373297 d!147833))

(declare-fun bm!65598 () Bool)

(declare-fun c!127806 () Bool)

(declare-fun call!65601 () Bool)

(assert (=> bm!65598 (= call!65601 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127806 (Cons!32092 (select (arr!44950 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) newAcc!98) newAcc!98)))))

(declare-fun b!1373427 () Bool)

(declare-fun e!777986 () Bool)

(assert (=> b!1373427 (= e!777986 call!65601)))

(declare-fun b!1373428 () Bool)

(declare-fun e!777987 () Bool)

(assert (=> b!1373428 (= e!777987 e!777986)))

(assert (=> b!1373428 (= c!127806 (validKeyInArray!0 (select (arr!44950 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun d!147847 () Bool)

(declare-fun res!916700 () Bool)

(declare-fun e!777988 () Bool)

(assert (=> d!147847 (=> res!916700 e!777988)))

(assert (=> d!147847 (= res!916700 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45502 a!3861)))))

(assert (=> d!147847 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98) e!777988)))

(declare-fun b!1373429 () Bool)

(assert (=> b!1373429 (= e!777988 e!777987)))

(declare-fun res!916701 () Bool)

(assert (=> b!1373429 (=> (not res!916701) (not e!777987))))

(declare-fun e!777985 () Bool)

(assert (=> b!1373429 (= res!916701 (not e!777985))))

(declare-fun res!916702 () Bool)

(assert (=> b!1373429 (=> (not res!916702) (not e!777985))))

(assert (=> b!1373429 (= res!916702 (validKeyInArray!0 (select (arr!44950 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1373430 () Bool)

(assert (=> b!1373430 (= e!777985 (contains!9689 newAcc!98 (select (arr!44950 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1373431 () Bool)

(assert (=> b!1373431 (= e!777986 call!65601)))

(assert (= (and d!147847 (not res!916700)) b!1373429))

(assert (= (and b!1373429 res!916702) b!1373430))

(assert (= (and b!1373429 res!916701) b!1373428))

(assert (= (and b!1373428 c!127806) b!1373427))

(assert (= (and b!1373428 (not c!127806)) b!1373431))

(assert (= (or b!1373427 b!1373431) bm!65598))

(declare-fun m!1256221 () Bool)

(assert (=> bm!65598 m!1256221))

(declare-fun m!1256223 () Bool)

(assert (=> bm!65598 m!1256223))

(assert (=> b!1373428 m!1256221))

(assert (=> b!1373428 m!1256221))

(declare-fun m!1256225 () Bool)

(assert (=> b!1373428 m!1256225))

(assert (=> b!1373429 m!1256221))

(assert (=> b!1373429 m!1256221))

(assert (=> b!1373429 m!1256225))

(assert (=> b!1373430 m!1256221))

(assert (=> b!1373430 m!1256221))

(declare-fun m!1256227 () Bool)

(assert (=> b!1373430 m!1256227))

(assert (=> b!1373297 d!147847))

(declare-fun d!147849 () Bool)

(assert (=> d!147849 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-fun lt!602881 () Unit!45228)

(declare-fun choose!80 (array!93081 List!32096 List!32096 (_ BitVec 32)) Unit!45228)

(assert (=> d!147849 (= lt!602881 (choose!80 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> d!147849 (bvslt (size!45502 a!3861) #b01111111111111111111111111111111)))

(assert (=> d!147849 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)) lt!602881)))

(declare-fun bs!39339 () Bool)

(assert (= bs!39339 d!147849))

(assert (=> bs!39339 m!1256107))

(declare-fun m!1256235 () Bool)

(assert (=> bs!39339 m!1256235))

(assert (=> b!1373297 d!147849))

(declare-fun d!147853 () Bool)

(assert (=> d!147853 (= (array_inv!34183 a!3861) (bvsge (size!45502 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116344 d!147853))

(declare-fun d!147855 () Bool)

(declare-fun lt!602882 () Bool)

(assert (=> d!147855 (= lt!602882 (select (content!746 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!778011 () Bool)

(assert (=> d!147855 (= lt!602882 e!778011)))

(declare-fun res!916721 () Bool)

(assert (=> d!147855 (=> (not res!916721) (not e!778011))))

(assert (=> d!147855 (= res!916721 ((_ is Cons!32092) acc!866))))

(assert (=> d!147855 (= (contains!9689 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602882)))

(declare-fun b!1373458 () Bool)

(declare-fun e!778012 () Bool)

(assert (=> b!1373458 (= e!778011 e!778012)))

(declare-fun res!916722 () Bool)

(assert (=> b!1373458 (=> res!916722 e!778012)))

(assert (=> b!1373458 (= res!916722 (= (h!33301 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373459 () Bool)

(assert (=> b!1373459 (= e!778012 (contains!9689 (t!46782 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147855 res!916721) b!1373458))

(assert (= (and b!1373458 (not res!916722)) b!1373459))

(declare-fun m!1256243 () Bool)

(assert (=> d!147855 m!1256243))

(declare-fun m!1256245 () Bool)

(assert (=> d!147855 m!1256245))

(declare-fun m!1256247 () Bool)

(assert (=> b!1373459 m!1256247))

(assert (=> b!1373298 d!147855))

(declare-fun c!127811 () Bool)

(declare-fun call!65606 () Bool)

(declare-fun bm!65603 () Bool)

(assert (=> bm!65603 (= call!65606 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127811 (Cons!32092 (select (arr!44950 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) acc!866) acc!866)))))

(declare-fun b!1373460 () Bool)

(declare-fun e!778014 () Bool)

(assert (=> b!1373460 (= e!778014 call!65606)))

(declare-fun b!1373461 () Bool)

(declare-fun e!778015 () Bool)

(assert (=> b!1373461 (= e!778015 e!778014)))

(assert (=> b!1373461 (= c!127811 (validKeyInArray!0 (select (arr!44950 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun d!147859 () Bool)

(declare-fun res!916723 () Bool)

(declare-fun e!778016 () Bool)

(assert (=> d!147859 (=> res!916723 e!778016)))

(assert (=> d!147859 (= res!916723 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45502 a!3861)))))

(assert (=> d!147859 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866) e!778016)))

(declare-fun b!1373462 () Bool)

(assert (=> b!1373462 (= e!778016 e!778015)))

(declare-fun res!916724 () Bool)

(assert (=> b!1373462 (=> (not res!916724) (not e!778015))))

(declare-fun e!778013 () Bool)

(assert (=> b!1373462 (= res!916724 (not e!778013))))

(declare-fun res!916725 () Bool)

(assert (=> b!1373462 (=> (not res!916725) (not e!778013))))

(assert (=> b!1373462 (= res!916725 (validKeyInArray!0 (select (arr!44950 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1373463 () Bool)

(assert (=> b!1373463 (= e!778013 (contains!9689 acc!866 (select (arr!44950 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1373464 () Bool)

(assert (=> b!1373464 (= e!778014 call!65606)))

(assert (= (and d!147859 (not res!916723)) b!1373462))

(assert (= (and b!1373462 res!916725) b!1373463))

(assert (= (and b!1373462 res!916724) b!1373461))

(assert (= (and b!1373461 c!127811) b!1373460))

(assert (= (and b!1373461 (not c!127811)) b!1373464))

(assert (= (or b!1373460 b!1373464) bm!65603))

(assert (=> bm!65603 m!1256221))

(declare-fun m!1256251 () Bool)

(assert (=> bm!65603 m!1256251))

(assert (=> b!1373461 m!1256221))

(assert (=> b!1373461 m!1256221))

(assert (=> b!1373461 m!1256225))

(assert (=> b!1373462 m!1256221))

(assert (=> b!1373462 m!1256221))

(assert (=> b!1373462 m!1256225))

(assert (=> b!1373463 m!1256221))

(assert (=> b!1373463 m!1256221))

(declare-fun m!1256253 () Bool)

(assert (=> b!1373463 m!1256253))

(assert (=> b!1373293 d!147859))

(declare-fun d!147863 () Bool)

(declare-fun lt!602883 () Bool)

(assert (=> d!147863 (= lt!602883 (select (content!746 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!778021 () Bool)

(assert (=> d!147863 (= lt!602883 e!778021)))

(declare-fun res!916730 () Bool)

(assert (=> d!147863 (=> (not res!916730) (not e!778021))))

(assert (=> d!147863 (= res!916730 ((_ is Cons!32092) acc!866))))

(assert (=> d!147863 (= (contains!9689 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602883)))

(declare-fun b!1373467 () Bool)

(declare-fun e!778022 () Bool)

(assert (=> b!1373467 (= e!778021 e!778022)))

(declare-fun res!916731 () Bool)

(assert (=> b!1373467 (=> res!916731 e!778022)))

(assert (=> b!1373467 (= res!916731 (= (h!33301 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373468 () Bool)

(assert (=> b!1373468 (= e!778022 (contains!9689 (t!46782 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147863 res!916730) b!1373467))

(assert (= (and b!1373467 (not res!916731)) b!1373468))

(assert (=> d!147863 m!1256243))

(declare-fun m!1256255 () Bool)

(assert (=> d!147863 m!1256255))

(declare-fun m!1256257 () Bool)

(assert (=> b!1373468 m!1256257))

(assert (=> b!1373299 d!147863))

(declare-fun d!147865 () Bool)

(declare-fun lt!602884 () Bool)

(assert (=> d!147865 (= lt!602884 (select (content!746 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!778023 () Bool)

(assert (=> d!147865 (= lt!602884 e!778023)))

(declare-fun res!916732 () Bool)

(assert (=> d!147865 (=> (not res!916732) (not e!778023))))

(assert (=> d!147865 (= res!916732 ((_ is Cons!32092) newAcc!98))))

(assert (=> d!147865 (= (contains!9689 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602884)))

(declare-fun b!1373471 () Bool)

(declare-fun e!778024 () Bool)

(assert (=> b!1373471 (= e!778023 e!778024)))

(declare-fun res!916733 () Bool)

(assert (=> b!1373471 (=> res!916733 e!778024)))

(assert (=> b!1373471 (= res!916733 (= (h!33301 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373472 () Bool)

(assert (=> b!1373472 (= e!778024 (contains!9689 (t!46782 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147865 res!916732) b!1373471))

(assert (= (and b!1373471 (not res!916733)) b!1373472))

(assert (=> d!147865 m!1256185))

(declare-fun m!1256259 () Bool)

(assert (=> d!147865 m!1256259))

(declare-fun m!1256261 () Bool)

(assert (=> b!1373472 m!1256261))

(assert (=> b!1373294 d!147865))

(declare-fun c!127812 () Bool)

(declare-fun bm!65604 () Bool)

(declare-fun call!65607 () Bool)

(assert (=> bm!65604 (= call!65607 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127812 (Cons!32092 (select (arr!44950 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1373473 () Bool)

(declare-fun e!778026 () Bool)

(assert (=> b!1373473 (= e!778026 call!65607)))

(declare-fun b!1373474 () Bool)

(declare-fun e!778027 () Bool)

(assert (=> b!1373474 (= e!778027 e!778026)))

(assert (=> b!1373474 (= c!127812 (validKeyInArray!0 (select (arr!44950 a!3861) from!3239)))))

(declare-fun d!147867 () Bool)

(declare-fun res!916734 () Bool)

(declare-fun e!778028 () Bool)

(assert (=> d!147867 (=> res!916734 e!778028)))

(assert (=> d!147867 (= res!916734 (bvsge from!3239 (size!45502 a!3861)))))

(assert (=> d!147867 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!778028)))

(declare-fun b!1373475 () Bool)

(assert (=> b!1373475 (= e!778028 e!778027)))

(declare-fun res!916735 () Bool)

(assert (=> b!1373475 (=> (not res!916735) (not e!778027))))

(declare-fun e!778025 () Bool)

(assert (=> b!1373475 (= res!916735 (not e!778025))))

(declare-fun res!916736 () Bool)

(assert (=> b!1373475 (=> (not res!916736) (not e!778025))))

(assert (=> b!1373475 (= res!916736 (validKeyInArray!0 (select (arr!44950 a!3861) from!3239)))))

(declare-fun b!1373476 () Bool)

(assert (=> b!1373476 (= e!778025 (contains!9689 acc!866 (select (arr!44950 a!3861) from!3239)))))

(declare-fun b!1373477 () Bool)

(assert (=> b!1373477 (= e!778026 call!65607)))

(assert (= (and d!147867 (not res!916734)) b!1373475))

(assert (= (and b!1373475 res!916736) b!1373476))

(assert (= (and b!1373475 res!916735) b!1373474))

(assert (= (and b!1373474 c!127812) b!1373473))

(assert (= (and b!1373474 (not c!127812)) b!1373477))

(assert (= (or b!1373473 b!1373477) bm!65604))

(assert (=> bm!65604 m!1256099))

(declare-fun m!1256267 () Bool)

(assert (=> bm!65604 m!1256267))

(assert (=> b!1373474 m!1256099))

(assert (=> b!1373474 m!1256099))

(assert (=> b!1373474 m!1256101))

(assert (=> b!1373475 m!1256099))

(assert (=> b!1373475 m!1256099))

(assert (=> b!1373475 m!1256101))

(assert (=> b!1373476 m!1256099))

(assert (=> b!1373476 m!1256099))

(declare-fun m!1256269 () Bool)

(assert (=> b!1373476 m!1256269))

(assert (=> b!1373289 d!147867))

(declare-fun d!147871 () Bool)

(assert (=> d!147871 (noDuplicate!2604 newAcc!98)))

(declare-fun lt!602891 () Unit!45228)

(declare-fun choose!2034 (List!32096 List!32096) Unit!45228)

(assert (=> d!147871 (= lt!602891 (choose!2034 newAcc!98 acc!866))))

(declare-fun e!778050 () Bool)

(assert (=> d!147871 e!778050))

(declare-fun res!916757 () Bool)

(assert (=> d!147871 (=> (not res!916757) (not e!778050))))

(assert (=> d!147871 (= res!916757 (subseq!1127 newAcc!98 acc!866))))

(assert (=> d!147871 (= (noDuplicateSubseq!314 newAcc!98 acc!866) lt!602891)))

(declare-fun b!1373500 () Bool)

(assert (=> b!1373500 (= e!778050 (noDuplicate!2604 acc!866))))

(assert (= (and d!147871 res!916757) b!1373500))

(declare-fun m!1256287 () Bool)

(assert (=> d!147871 m!1256287))

(declare-fun m!1256289 () Bool)

(assert (=> d!147871 m!1256289))

(assert (=> d!147871 m!1256095))

(assert (=> b!1373500 m!1256097))

(assert (=> b!1373289 d!147871))

(declare-fun b!1373539 () Bool)

(declare-fun e!778085 () Bool)

(declare-fun e!778086 () Bool)

(assert (=> b!1373539 (= e!778085 e!778086)))

(declare-fun res!916792 () Bool)

(assert (=> b!1373539 (=> res!916792 e!778086)))

(declare-fun e!778088 () Bool)

(assert (=> b!1373539 (= res!916792 e!778088)))

(declare-fun res!916791 () Bool)

(assert (=> b!1373539 (=> (not res!916791) (not e!778088))))

(assert (=> b!1373539 (= res!916791 (= (h!33301 newAcc!98) (h!33301 acc!866)))))

(declare-fun b!1373538 () Bool)

(declare-fun e!778087 () Bool)

(assert (=> b!1373538 (= e!778087 e!778085)))

(declare-fun res!916789 () Bool)

(assert (=> b!1373538 (=> (not res!916789) (not e!778085))))

(assert (=> b!1373538 (= res!916789 ((_ is Cons!32092) acc!866))))

(declare-fun b!1373541 () Bool)

(assert (=> b!1373541 (= e!778086 (subseq!1127 newAcc!98 (t!46782 acc!866)))))

(declare-fun d!147879 () Bool)

(declare-fun res!916790 () Bool)

(assert (=> d!147879 (=> res!916790 e!778087)))

(assert (=> d!147879 (= res!916790 ((_ is Nil!32093) newAcc!98))))

(assert (=> d!147879 (= (subseq!1127 newAcc!98 acc!866) e!778087)))

(declare-fun b!1373540 () Bool)

(assert (=> b!1373540 (= e!778088 (subseq!1127 (t!46782 newAcc!98) (t!46782 acc!866)))))

(assert (= (and d!147879 (not res!916790)) b!1373538))

(assert (= (and b!1373538 res!916789) b!1373539))

(assert (= (and b!1373539 res!916791) b!1373540))

(assert (= (and b!1373539 (not res!916792)) b!1373541))

(declare-fun m!1256321 () Bool)

(assert (=> b!1373541 m!1256321))

(declare-fun m!1256323 () Bool)

(assert (=> b!1373540 m!1256323))

(assert (=> b!1373295 d!147879))

(declare-fun d!147897 () Bool)

(assert (=> d!147897 (= (validKeyInArray!0 (select (arr!44950 a!3861) from!3239)) (and (not (= (select (arr!44950 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44950 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1373290 d!147897))

(check-sat (not b!1373463) (not b!1373540) (not bm!65598) (not b!1373462) (not b!1373541) (not b!1373430) (not d!147849) (not b!1373424) (not b!1373459) (not b!1373376) (not d!147855) (not b!1373429) (not b!1373393) (not b!1373472) (not b!1373476) (not b!1373500) (not b!1373425) (not b!1373475) (not b!1373428) (not bm!65597) (not d!147829) (not b!1373461) (not b!1373474) (not d!147871) (not d!147863) (not b!1373468) (not b!1373377) (not d!147865) (not b!1373423) (not bm!65603) (not bm!65604))
(check-sat)
