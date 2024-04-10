; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116142 () Bool)

(assert start!116142)

(declare-fun b!1371867 () Bool)

(declare-fun res!915233 () Bool)

(declare-fun e!777103 () Bool)

(assert (=> b!1371867 (=> (not res!915233) (not e!777103))))

(declare-datatypes ((List!32012 0))(
  ( (Nil!32009) (Cons!32008 (h!33217 (_ BitVec 64)) (t!46706 List!32012)) )
))
(declare-fun newAcc!98 () List!32012)

(declare-fun contains!9694 (List!32012 (_ BitVec 64)) Bool)

(assert (=> b!1371867 (= res!915233 (not (contains!9694 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371868 () Bool)

(declare-fun res!915234 () Bool)

(assert (=> b!1371868 (=> (not res!915234) (not e!777103))))

(declare-fun acc!866 () List!32012)

(assert (=> b!1371868 (= res!915234 (not (contains!9694 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371869 () Bool)

(declare-fun res!915238 () Bool)

(declare-fun e!777101 () Bool)

(assert (=> b!1371869 (=> (not res!915238) (not e!777101))))

(declare-datatypes ((array!93061 0))(
  ( (array!93062 (arr!44944 (Array (_ BitVec 32) (_ BitVec 64))) (size!45494 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93061)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1371869 (= res!915238 (not (contains!9694 acc!866 (select (arr!44944 a!3861) from!3239))))))

(declare-fun b!1371870 () Bool)

(declare-fun res!915236 () Bool)

(assert (=> b!1371870 (=> (not res!915236) (not e!777101))))

(assert (=> b!1371870 (= res!915236 (bvslt from!3239 (size!45494 a!3861)))))

(declare-fun b!1371871 () Bool)

(assert (=> b!1371871 (= e!777103 e!777101)))

(declare-fun res!915239 () Bool)

(assert (=> b!1371871 (=> (not res!915239) (not e!777101))))

(declare-fun arrayNoDuplicates!0 (array!93061 (_ BitVec 32) List!32012) Bool)

(assert (=> b!1371871 (= res!915239 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45325 0))(
  ( (Unit!45326) )
))
(declare-fun lt!602763 () Unit!45325)

(declare-fun noDuplicateSubseq!283 (List!32012 List!32012) Unit!45325)

(assert (=> b!1371871 (= lt!602763 (noDuplicateSubseq!283 newAcc!98 acc!866))))

(declare-fun res!915231 () Bool)

(assert (=> start!116142 (=> (not res!915231) (not e!777103))))

(assert (=> start!116142 (= res!915231 (and (bvslt (size!45494 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45494 a!3861))))))

(assert (=> start!116142 e!777103))

(declare-fun array_inv!33972 (array!93061) Bool)

(assert (=> start!116142 (array_inv!33972 a!3861)))

(assert (=> start!116142 true))

(declare-fun b!1371872 () Bool)

(assert (=> b!1371872 (= e!777101 (not (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98)))))

(declare-fun lt!602765 () Unit!45325)

(declare-fun lt!602766 () List!32012)

(declare-fun lt!602764 () List!32012)

(assert (=> b!1371872 (= lt!602765 (noDuplicateSubseq!283 lt!602766 lt!602764))))

(assert (=> b!1371872 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602766)))

(declare-fun lt!602767 () Unit!45325)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!93061 List!32012 List!32012 (_ BitVec 32)) Unit!45325)

(assert (=> b!1371872 (= lt!602767 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!602764 lt!602766 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> b!1371872 (= lt!602766 (Cons!32008 (select (arr!44944 a!3861) from!3239) newAcc!98))))

(assert (=> b!1371872 (= lt!602764 (Cons!32008 (select (arr!44944 a!3861) from!3239) acc!866))))

(declare-fun b!1371873 () Bool)

(declare-fun res!915240 () Bool)

(assert (=> b!1371873 (=> (not res!915240) (not e!777103))))

(assert (=> b!1371873 (= res!915240 (not (contains!9694 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371874 () Bool)

(declare-fun res!915232 () Bool)

(assert (=> b!1371874 (=> (not res!915232) (not e!777103))))

(assert (=> b!1371874 (= res!915232 (not (contains!9694 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371875 () Bool)

(declare-fun res!915235 () Bool)

(assert (=> b!1371875 (=> (not res!915235) (not e!777103))))

(declare-fun subseq!1096 (List!32012 List!32012) Bool)

(assert (=> b!1371875 (= res!915235 (subseq!1096 newAcc!98 acc!866))))

(declare-fun b!1371876 () Bool)

(declare-fun res!915237 () Bool)

(assert (=> b!1371876 (=> (not res!915237) (not e!777103))))

(declare-fun noDuplicate!2551 (List!32012) Bool)

(assert (=> b!1371876 (= res!915237 (noDuplicate!2551 acc!866))))

(declare-fun b!1371877 () Bool)

(declare-fun res!915241 () Bool)

(assert (=> b!1371877 (=> (not res!915241) (not e!777101))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1371877 (= res!915241 (validKeyInArray!0 (select (arr!44944 a!3861) from!3239)))))

(assert (= (and start!116142 res!915231) b!1371876))

(assert (= (and b!1371876 res!915237) b!1371873))

(assert (= (and b!1371873 res!915240) b!1371868))

(assert (= (and b!1371868 res!915234) b!1371874))

(assert (= (and b!1371874 res!915232) b!1371867))

(assert (= (and b!1371867 res!915233) b!1371875))

(assert (= (and b!1371875 res!915235) b!1371871))

(assert (= (and b!1371871 res!915239) b!1371870))

(assert (= (and b!1371870 res!915236) b!1371877))

(assert (= (and b!1371877 res!915241) b!1371869))

(assert (= (and b!1371869 res!915238) b!1371872))

(declare-fun m!1255271 () Bool)

(assert (=> b!1371875 m!1255271))

(declare-fun m!1255273 () Bool)

(assert (=> start!116142 m!1255273))

(declare-fun m!1255275 () Bool)

(assert (=> b!1371872 m!1255275))

(declare-fun m!1255277 () Bool)

(assert (=> b!1371872 m!1255277))

(declare-fun m!1255279 () Bool)

(assert (=> b!1371872 m!1255279))

(declare-fun m!1255281 () Bool)

(assert (=> b!1371872 m!1255281))

(declare-fun m!1255283 () Bool)

(assert (=> b!1371872 m!1255283))

(assert (=> b!1371877 m!1255279))

(assert (=> b!1371877 m!1255279))

(declare-fun m!1255285 () Bool)

(assert (=> b!1371877 m!1255285))

(assert (=> b!1371869 m!1255279))

(assert (=> b!1371869 m!1255279))

(declare-fun m!1255287 () Bool)

(assert (=> b!1371869 m!1255287))

(declare-fun m!1255289 () Bool)

(assert (=> b!1371871 m!1255289))

(declare-fun m!1255291 () Bool)

(assert (=> b!1371871 m!1255291))

(declare-fun m!1255293 () Bool)

(assert (=> b!1371867 m!1255293))

(declare-fun m!1255295 () Bool)

(assert (=> b!1371873 m!1255295))

(declare-fun m!1255297 () Bool)

(assert (=> b!1371874 m!1255297))

(declare-fun m!1255299 () Bool)

(assert (=> b!1371876 m!1255299))

(declare-fun m!1255301 () Bool)

(assert (=> b!1371868 m!1255301))

(push 1)

(assert (not b!1371871))

(assert (not b!1371876))

(assert (not b!1371875))

(assert (not start!116142))

(assert (not b!1371877))

(assert (not b!1371873))

(assert (not b!1371872))

(assert (not b!1371868))

(assert (not b!1371874))

(assert (not b!1371869))

(assert (not b!1371867))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!147569 () Bool)

(assert (=> d!147569 (= (validKeyInArray!0 (select (arr!44944 a!3861) from!3239)) (and (not (= (select (arr!44944 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44944 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1371877 d!147569))

(declare-fun b!1371928 () Bool)

(declare-fun e!777150 () Bool)

(declare-fun call!65567 () Bool)

(assert (=> b!1371928 (= e!777150 call!65567)))

(declare-fun d!147573 () Bool)

(declare-fun res!915286 () Bool)

(declare-fun e!777152 () Bool)

(assert (=> d!147573 (=> res!915286 e!777152)))

(assert (=> d!147573 (= res!915286 (bvsge from!3239 (size!45494 a!3861)))))

(assert (=> d!147573 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!777152)))

(declare-fun b!1371929 () Bool)

(declare-fun e!777153 () Bool)

(assert (=> b!1371929 (= e!777153 e!777150)))

(declare-fun c!127760 () Bool)

(assert (=> b!1371929 (= c!127760 (validKeyInArray!0 (select (arr!44944 a!3861) from!3239)))))

(declare-fun bm!65564 () Bool)

(assert (=> bm!65564 (= call!65567 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127760 (Cons!32008 (select (arr!44944 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1371930 () Bool)

(assert (=> b!1371930 (= e!777150 call!65567)))

(declare-fun b!1371931 () Bool)

(declare-fun e!777151 () Bool)

(assert (=> b!1371931 (= e!777151 (contains!9694 acc!866 (select (arr!44944 a!3861) from!3239)))))

(declare-fun b!1371932 () Bool)

(assert (=> b!1371932 (= e!777152 e!777153)))

(declare-fun res!915288 () Bool)

(assert (=> b!1371932 (=> (not res!915288) (not e!777153))))

(assert (=> b!1371932 (= res!915288 (not e!777151))))

(declare-fun res!915287 () Bool)

(assert (=> b!1371932 (=> (not res!915287) (not e!777151))))

(assert (=> b!1371932 (= res!915287 (validKeyInArray!0 (select (arr!44944 a!3861) from!3239)))))

(assert (= (and d!147573 (not res!915286)) b!1371932))

(assert (= (and b!1371932 res!915287) b!1371931))

(assert (= (and b!1371932 res!915288) b!1371929))

(assert (= (and b!1371929 c!127760) b!1371930))

(assert (= (and b!1371929 (not c!127760)) b!1371928))

(assert (= (or b!1371930 b!1371928) bm!65564))

(assert (=> b!1371929 m!1255279))

(assert (=> b!1371929 m!1255279))

(assert (=> b!1371929 m!1255285))

(assert (=> bm!65564 m!1255279))

(declare-fun m!1255327 () Bool)

(assert (=> bm!65564 m!1255327))

(assert (=> b!1371931 m!1255279))

(assert (=> b!1371931 m!1255279))

(assert (=> b!1371931 m!1255287))

(assert (=> b!1371932 m!1255279))

(assert (=> b!1371932 m!1255279))

(assert (=> b!1371932 m!1255285))

(assert (=> b!1371871 d!147573))

(declare-fun d!147583 () Bool)

(assert (=> d!147583 (noDuplicate!2551 newAcc!98)))

(declare-fun lt!602777 () Unit!45325)

(declare-fun choose!2018 (List!32012 List!32012) Unit!45325)

(assert (=> d!147583 (= lt!602777 (choose!2018 newAcc!98 acc!866))))

(declare-fun e!777170 () Bool)

(assert (=> d!147583 e!777170))

(declare-fun res!915300 () Bool)

(assert (=> d!147583 (=> (not res!915300) (not e!777170))))

(assert (=> d!147583 (= res!915300 (subseq!1096 newAcc!98 acc!866))))

(assert (=> d!147583 (= (noDuplicateSubseq!283 newAcc!98 acc!866) lt!602777)))

(declare-fun b!1371952 () Bool)

(assert (=> b!1371952 (= e!777170 (noDuplicate!2551 acc!866))))

(assert (= (and d!147583 res!915300) b!1371952))

(declare-fun m!1255333 () Bool)

(assert (=> d!147583 m!1255333))

(declare-fun m!1255335 () Bool)

(assert (=> d!147583 m!1255335))

(assert (=> d!147583 m!1255271))

(assert (=> b!1371952 m!1255299))

(assert (=> b!1371871 d!147583))

(declare-fun d!147587 () Bool)

(declare-fun res!915310 () Bool)

(declare-fun e!777181 () Bool)

(assert (=> d!147587 (=> res!915310 e!777181)))

(assert (=> d!147587 (= res!915310 (is-Nil!32009 acc!866))))

(assert (=> d!147587 (= (noDuplicate!2551 acc!866) e!777181)))

(declare-fun b!1371964 () Bool)

(declare-fun e!777182 () Bool)

(assert (=> b!1371964 (= e!777181 e!777182)))

(declare-fun res!915311 () Bool)

(assert (=> b!1371964 (=> (not res!915311) (not e!777182))))

(assert (=> b!1371964 (= res!915311 (not (contains!9694 (t!46706 acc!866) (h!33217 acc!866))))))

(declare-fun b!1371965 () Bool)

(assert (=> b!1371965 (= e!777182 (noDuplicate!2551 (t!46706 acc!866)))))

(assert (= (and d!147587 (not res!915310)) b!1371964))

(assert (= (and b!1371964 res!915311) b!1371965))

(declare-fun m!1255339 () Bool)

(assert (=> b!1371964 m!1255339))

(declare-fun m!1255341 () Bool)

(assert (=> b!1371965 m!1255341))

(assert (=> b!1371876 d!147587))

(declare-fun b!1371988 () Bool)

(declare-fun e!777206 () Bool)

(declare-fun e!777205 () Bool)

(assert (=> b!1371988 (= e!777206 e!777205)))

(declare-fun res!915331 () Bool)

(assert (=> b!1371988 (=> (not res!915331) (not e!777205))))

(assert (=> b!1371988 (= res!915331 (is-Cons!32008 acc!866))))

(declare-fun b!1371990 () Bool)

(declare-fun e!777204 () Bool)

(assert (=> b!1371990 (= e!777204 (subseq!1096 (t!46706 newAcc!98) (t!46706 acc!866)))))

(declare-fun b!1371991 () Bool)

(declare-fun e!777203 () Bool)

(assert (=> b!1371991 (= e!777203 (subseq!1096 newAcc!98 (t!46706 acc!866)))))

(declare-fun b!1371989 () Bool)

(assert (=> b!1371989 (= e!777205 e!777203)))

(declare-fun res!915333 () Bool)

(assert (=> b!1371989 (=> res!915333 e!777203)))

(assert (=> b!1371989 (= res!915333 e!777204)))

(declare-fun res!915332 () Bool)

(assert (=> b!1371989 (=> (not res!915332) (not e!777204))))

(assert (=> b!1371989 (= res!915332 (= (h!33217 newAcc!98) (h!33217 acc!866)))))

(declare-fun d!147589 () Bool)

(declare-fun res!915330 () Bool)

(assert (=> d!147589 (=> res!915330 e!777206)))

(assert (=> d!147589 (= res!915330 (is-Nil!32009 newAcc!98))))

(assert (=> d!147589 (= (subseq!1096 newAcc!98 acc!866) e!777206)))

(assert (= (and d!147589 (not res!915330)) b!1371988))

(assert (= (and b!1371988 res!915331) b!1371989))

(assert (= (and b!1371989 res!915332) b!1371990))

(assert (= (and b!1371989 (not res!915333)) b!1371991))

(declare-fun m!1255379 () Bool)

(assert (=> b!1371990 m!1255379))

(declare-fun m!1255383 () Bool)

(assert (=> b!1371991 m!1255383))

(assert (=> b!1371875 d!147589))

(declare-fun d!147603 () Bool)

(declare-fun lt!602797 () Bool)

(declare-fun content!743 (List!32012) (Set (_ BitVec 64)))

(assert (=> d!147603 (= lt!602797 (member (select (arr!44944 a!3861) from!3239) (content!743 acc!866)))))

(declare-fun e!777227 () Bool)

(assert (=> d!147603 (= lt!602797 e!777227)))

(declare-fun res!915352 () Bool)

(assert (=> d!147603 (=> (not res!915352) (not e!777227))))

(assert (=> d!147603 (= res!915352 (is-Cons!32008 acc!866))))

(assert (=> d!147603 (= (contains!9694 acc!866 (select (arr!44944 a!3861) from!3239)) lt!602797)))

(declare-fun b!1372012 () Bool)

(declare-fun e!777226 () Bool)

(assert (=> b!1372012 (= e!777227 e!777226)))

(declare-fun res!915353 () Bool)

(assert (=> b!1372012 (=> res!915353 e!777226)))

(assert (=> b!1372012 (= res!915353 (= (h!33217 acc!866) (select (arr!44944 a!3861) from!3239)))))

(declare-fun b!1372013 () Bool)

(assert (=> b!1372013 (= e!777226 (contains!9694 (t!46706 acc!866) (select (arr!44944 a!3861) from!3239)))))

(assert (= (and d!147603 res!915352) b!1372012))

(assert (= (and b!1372012 (not res!915353)) b!1372013))

(declare-fun m!1255411 () Bool)

(assert (=> d!147603 m!1255411))

(assert (=> d!147603 m!1255279))

(declare-fun m!1255413 () Bool)

(assert (=> d!147603 m!1255413))

(assert (=> b!1372013 m!1255279))

(declare-fun m!1255415 () Bool)

(assert (=> b!1372013 m!1255415))

(assert (=> b!1371869 d!147603))

(declare-fun d!147619 () Bool)

(declare-fun lt!602798 () Bool)

(assert (=> d!147619 (= lt!602798 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!743 newAcc!98)))))

(declare-fun e!777231 () Bool)

(assert (=> d!147619 (= lt!602798 e!777231)))

(declare-fun res!915356 () Bool)

(assert (=> d!147619 (=> (not res!915356) (not e!777231))))

(assert (=> d!147619 (= res!915356 (is-Cons!32008 newAcc!98))))

(assert (=> d!147619 (= (contains!9694 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602798)))

(declare-fun b!1372016 () Bool)

(declare-fun e!777230 () Bool)

(assert (=> b!1372016 (= e!777231 e!777230)))

(declare-fun res!915357 () Bool)

(assert (=> b!1372016 (=> res!915357 e!777230)))

(assert (=> b!1372016 (= res!915357 (= (h!33217 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372017 () Bool)

(assert (=> b!1372017 (= e!777230 (contains!9694 (t!46706 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147619 res!915356) b!1372016))

(assert (= (and b!1372016 (not res!915357)) b!1372017))

(declare-fun m!1255417 () Bool)

(assert (=> d!147619 m!1255417))

(declare-fun m!1255419 () Bool)

(assert (=> d!147619 m!1255419))

(declare-fun m!1255421 () Bool)

(assert (=> b!1372017 m!1255421))

(assert (=> b!1371874 d!147619))

(declare-fun d!147621 () Bool)

(declare-fun lt!602799 () Bool)

(assert (=> d!147621 (= lt!602799 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!743 acc!866)))))

(declare-fun e!777233 () Bool)

(assert (=> d!147621 (= lt!602799 e!777233)))

(declare-fun res!915358 () Bool)

(assert (=> d!147621 (=> (not res!915358) (not e!777233))))

(assert (=> d!147621 (= res!915358 (is-Cons!32008 acc!866))))

(assert (=> d!147621 (= (contains!9694 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602799)))

(declare-fun b!1372018 () Bool)

(declare-fun e!777232 () Bool)

(assert (=> b!1372018 (= e!777233 e!777232)))

(declare-fun res!915359 () Bool)

(assert (=> b!1372018 (=> res!915359 e!777232)))

(assert (=> b!1372018 (= res!915359 (= (h!33217 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372019 () Bool)

(assert (=> b!1372019 (= e!777232 (contains!9694 (t!46706 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147621 res!915358) b!1372018))

(assert (= (and b!1372018 (not res!915359)) b!1372019))

(assert (=> d!147621 m!1255411))

(declare-fun m!1255423 () Bool)

(assert (=> d!147621 m!1255423))

(declare-fun m!1255425 () Bool)

(assert (=> b!1372019 m!1255425))

(assert (=> b!1371868 d!147621))

(declare-fun d!147623 () Bool)

(declare-fun lt!602800 () Bool)

(assert (=> d!147623 (= lt!602800 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!743 acc!866)))))

(declare-fun e!777237 () Bool)

(assert (=> d!147623 (= lt!602800 e!777237)))

(declare-fun res!915362 () Bool)

(assert (=> d!147623 (=> (not res!915362) (not e!777237))))

(assert (=> d!147623 (= res!915362 (is-Cons!32008 acc!866))))

(assert (=> d!147623 (= (contains!9694 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602800)))

(declare-fun b!1372022 () Bool)

(declare-fun e!777236 () Bool)

(assert (=> b!1372022 (= e!777237 e!777236)))

(declare-fun res!915363 () Bool)

(assert (=> b!1372022 (=> res!915363 e!777236)))

(assert (=> b!1372022 (= res!915363 (= (h!33217 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372023 () Bool)

(assert (=> b!1372023 (= e!777236 (contains!9694 (t!46706 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147623 res!915362) b!1372022))

(assert (= (and b!1372022 (not res!915363)) b!1372023))

(assert (=> d!147623 m!1255411))

(declare-fun m!1255431 () Bool)

(assert (=> d!147623 m!1255431))

(declare-fun m!1255433 () Bool)

(assert (=> b!1372023 m!1255433))

(assert (=> b!1371873 d!147623))

(declare-fun d!147627 () Bool)

(assert (=> d!147627 (= (array_inv!33972 a!3861) (bvsge (size!45494 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116142 d!147627))

(declare-fun d!147631 () Bool)

(declare-fun lt!602802 () Bool)

(assert (=> d!147631 (= lt!602802 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!743 newAcc!98)))))

(declare-fun e!777249 () Bool)

(assert (=> d!147631 (= lt!602802 e!777249)))

(declare-fun res!915374 () Bool)

(assert (=> d!147631 (=> (not res!915374) (not e!777249))))

(assert (=> d!147631 (= res!915374 (is-Cons!32008 newAcc!98))))

(assert (=> d!147631 (= (contains!9694 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602802)))

(declare-fun b!1372034 () Bool)

(declare-fun e!777248 () Bool)

(assert (=> b!1372034 (= e!777249 e!777248)))

(declare-fun res!915375 () Bool)

(assert (=> b!1372034 (=> res!915375 e!777248)))

(assert (=> b!1372034 (= res!915375 (= (h!33217 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372035 () Bool)

(assert (=> b!1372035 (= e!777248 (contains!9694 (t!46706 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147631 res!915374) b!1372034))

(assert (= (and b!1372034 (not res!915375)) b!1372035))

(assert (=> d!147631 m!1255417))

(declare-fun m!1255439 () Bool)

(assert (=> d!147631 m!1255439))

(declare-fun m!1255441 () Bool)

(assert (=> b!1372035 m!1255441))

(assert (=> b!1371867 d!147631))

(declare-fun b!1372036 () Bool)

(declare-fun e!777250 () Bool)

(declare-fun call!65577 () Bool)

(assert (=> b!1372036 (= e!777250 call!65577)))

(declare-fun d!147633 () Bool)

(declare-fun res!915376 () Bool)

(declare-fun e!777252 () Bool)

(assert (=> d!147633 (=> res!915376 e!777252)))

(assert (=> d!147633 (= res!915376 (bvsge from!3239 (size!45494 a!3861)))))

(assert (=> d!147633 (= (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98) e!777252)))

(declare-fun b!1372037 () Bool)

(declare-fun e!777253 () Bool)

(assert (=> b!1372037 (= e!777253 e!777250)))

(declare-fun c!127770 () Bool)

(assert (=> b!1372037 (= c!127770 (validKeyInArray!0 (select (arr!44944 a!3861) from!3239)))))

(declare-fun bm!65574 () Bool)

(assert (=> bm!65574 (= call!65577 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127770 (Cons!32008 (select (arr!44944 a!3861) from!3239) newAcc!98) newAcc!98)))))

(declare-fun b!1372038 () Bool)

(assert (=> b!1372038 (= e!777250 call!65577)))

(declare-fun b!1372039 () Bool)

(declare-fun e!777251 () Bool)

(assert (=> b!1372039 (= e!777251 (contains!9694 newAcc!98 (select (arr!44944 a!3861) from!3239)))))

(declare-fun b!1372040 () Bool)

(assert (=> b!1372040 (= e!777252 e!777253)))

(declare-fun res!915378 () Bool)

(assert (=> b!1372040 (=> (not res!915378) (not e!777253))))

(assert (=> b!1372040 (= res!915378 (not e!777251))))

(declare-fun res!915377 () Bool)

(assert (=> b!1372040 (=> (not res!915377) (not e!777251))))

(assert (=> b!1372040 (= res!915377 (validKeyInArray!0 (select (arr!44944 a!3861) from!3239)))))

(assert (= (and d!147633 (not res!915376)) b!1372040))

(assert (= (and b!1372040 res!915377) b!1372039))

(assert (= (and b!1372040 res!915378) b!1372037))

(assert (= (and b!1372037 c!127770) b!1372038))

(assert (= (and b!1372037 (not c!127770)) b!1372036))

(assert (= (or b!1372038 b!1372036) bm!65574))

(assert (=> b!1372037 m!1255279))

(assert (=> b!1372037 m!1255279))

(assert (=> b!1372037 m!1255285))

(assert (=> bm!65574 m!1255279))

(declare-fun m!1255443 () Bool)

(assert (=> bm!65574 m!1255443))

(assert (=> b!1372039 m!1255279))

(assert (=> b!1372039 m!1255279))

(declare-fun m!1255445 () Bool)

(assert (=> b!1372039 m!1255445))

(assert (=> b!1372040 m!1255279))

(assert (=> b!1372040 m!1255279))

(assert (=> b!1372040 m!1255285))

(assert (=> b!1371872 d!147633))

(declare-fun d!147635 () Bool)

(assert (=> d!147635 (noDuplicate!2551 lt!602766)))

(declare-fun lt!602803 () Unit!45325)

(assert (=> d!147635 (= lt!602803 (choose!2018 lt!602766 lt!602764))))

(declare-fun e!777254 () Bool)

(assert (=> d!147635 e!777254))

(declare-fun res!915379 () Bool)

(assert (=> d!147635 (=> (not res!915379) (not e!777254))))

(assert (=> d!147635 (= res!915379 (subseq!1096 lt!602766 lt!602764))))

(assert (=> d!147635 (= (noDuplicateSubseq!283 lt!602766 lt!602764) lt!602803)))

(declare-fun b!1372041 () Bool)

(assert (=> b!1372041 (= e!777254 (noDuplicate!2551 lt!602764))))

(assert (= (and d!147635 res!915379) b!1372041))

(declare-fun m!1255447 () Bool)

(assert (=> d!147635 m!1255447))

(declare-fun m!1255449 () Bool)

(assert (=> d!147635 m!1255449))

(declare-fun m!1255451 () Bool)

(assert (=> d!147635 m!1255451))

(declare-fun m!1255453 () Bool)

(assert (=> b!1372041 m!1255453))

(assert (=> b!1371872 d!147635))

(declare-fun b!1372046 () Bool)

(declare-fun e!777259 () Bool)

(declare-fun call!65578 () Bool)

(assert (=> b!1372046 (= e!777259 call!65578)))

(declare-fun d!147637 () Bool)

(declare-fun res!915384 () Bool)

(declare-fun e!777261 () Bool)

(assert (=> d!147637 (=> res!915384 e!777261)))

(assert (=> d!147637 (= res!915384 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45494 a!3861)))))

(assert (=> d!147637 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602766) e!777261)))

(declare-fun b!1372047 () Bool)

(declare-fun e!777262 () Bool)

(assert (=> b!1372047 (= e!777262 e!777259)))

(declare-fun c!127771 () Bool)

(assert (=> b!1372047 (= c!127771 (validKeyInArray!0 (select (arr!44944 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun bm!65575 () Bool)

(assert (=> bm!65575 (= call!65578 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127771 (Cons!32008 (select (arr!44944 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) lt!602766) lt!602766)))))

(declare-fun b!1372048 () Bool)

(assert (=> b!1372048 (= e!777259 call!65578)))

(declare-fun b!1372049 () Bool)

(declare-fun e!777260 () Bool)

(assert (=> b!1372049 (= e!777260 (contains!9694 lt!602766 (select (arr!44944 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1372050 () Bool)

(assert (=> b!1372050 (= e!777261 e!777262)))

(declare-fun res!915386 () Bool)

(assert (=> b!1372050 (=> (not res!915386) (not e!777262))))

(assert (=> b!1372050 (= res!915386 (not e!777260))))

(declare-fun res!915385 () Bool)

(assert (=> b!1372050 (=> (not res!915385) (not e!777260))))

(assert (=> b!1372050 (= res!915385 (validKeyInArray!0 (select (arr!44944 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(assert (= (and d!147637 (not res!915384)) b!1372050))

(assert (= (and b!1372050 res!915385) b!1372049))

(assert (= (and b!1372050 res!915386) b!1372047))

(assert (= (and b!1372047 c!127771) b!1372048))

(assert (= (and b!1372047 (not c!127771)) b!1372046))

(assert (= (or b!1372048 b!1372046) bm!65575))

(declare-fun m!1255459 () Bool)

(assert (=> b!1372047 m!1255459))

(assert (=> b!1372047 m!1255459))

(declare-fun m!1255461 () Bool)

(assert (=> b!1372047 m!1255461))

(assert (=> bm!65575 m!1255459))

(declare-fun m!1255463 () Bool)

(assert (=> bm!65575 m!1255463))

(assert (=> b!1372049 m!1255459))

(assert (=> b!1372049 m!1255459))

(declare-fun m!1255465 () Bool)

(assert (=> b!1372049 m!1255465))

(assert (=> b!1372050 m!1255459))

(assert (=> b!1372050 m!1255459))

(assert (=> b!1372050 m!1255461))

(assert (=> b!1371872 d!147637))

(declare-fun d!147643 () Bool)

(assert (=> d!147643 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602766)))

(declare-fun lt!602809 () Unit!45325)

(declare-fun choose!80 (array!93061 List!32012 List!32012 (_ BitVec 32)) Unit!45325)

(assert (=> d!147643 (= lt!602809 (choose!80 a!3861 lt!602764 lt!602766 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> d!147643 (bvslt (size!45494 a!3861) #b01111111111111111111111111111111)))

(assert (=> d!147643 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!602764 lt!602766 (bvadd #b00000000000000000000000000000001 from!3239)) lt!602809)))

(declare-fun bs!39323 () Bool)

(assert (= bs!39323 d!147643))

(assert (=> bs!39323 m!1255275))

(declare-fun m!1255481 () Bool)

(assert (=> bs!39323 m!1255481))

(assert (=> b!1371872 d!147643))

(push 1)

(assert (not b!1371932))

(assert (not b!1372013))

(assert (not b!1371952))

(assert (not b!1372039))

(assert (not b!1372023))

(assert (not b!1371991))

(assert (not b!1372041))

(assert (not d!147603))

(assert (not d!147643))

(assert (not bm!65564))

(assert (not b!1372037))

(assert (not b!1371965))

(assert (not d!147583))

(assert (not b!1372019))

(assert (not b!1372047))

(assert (not b!1372017))

(assert (not d!147635))

(assert (not b!1372050))

(assert (not b!1371990))

(assert (not d!147621))

(assert (not bm!65574))

(assert (not d!147631))

(assert (not d!147619))

(assert (not b!1371931))

(assert (not bm!65575))

(assert (not b!1372035))

(assert (not b!1372049))

(assert (not d!147623))

(assert (not b!1372040))

(assert (not b!1371929))

(assert (not b!1371964))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!147747 () Bool)

(declare-fun res!915485 () Bool)

(declare-fun e!777376 () Bool)

(assert (=> d!147747 (=> res!915485 e!777376)))

(assert (=> d!147747 (= res!915485 (is-Nil!32009 (t!46706 acc!866)))))

(assert (=> d!147747 (= (noDuplicate!2551 (t!46706 acc!866)) e!777376)))

(declare-fun b!1372179 () Bool)

(declare-fun e!777377 () Bool)

(assert (=> b!1372179 (= e!777376 e!777377)))

(declare-fun res!915486 () Bool)

(assert (=> b!1372179 (=> (not res!915486) (not e!777377))))

(assert (=> b!1372179 (= res!915486 (not (contains!9694 (t!46706 (t!46706 acc!866)) (h!33217 (t!46706 acc!866)))))))

(declare-fun b!1372180 () Bool)

(assert (=> b!1372180 (= e!777377 (noDuplicate!2551 (t!46706 (t!46706 acc!866))))))

(assert (= (and d!147747 (not res!915485)) b!1372179))

(assert (= (and b!1372179 res!915486) b!1372180))

(declare-fun m!1255659 () Bool)

(assert (=> b!1372179 m!1255659))

(declare-fun m!1255661 () Bool)

(assert (=> b!1372180 m!1255661))

(assert (=> b!1371965 d!147747))

(assert (=> d!147643 d!147637))

(declare-fun d!147749 () Bool)

(assert (=> d!147749 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602766)))

(assert (=> d!147749 true))

(declare-fun _$70!113 () Unit!45325)

(assert (=> d!147749 (= (choose!80 a!3861 lt!602764 lt!602766 (bvadd #b00000000000000000000000000000001 from!3239)) _$70!113)))

(declare-fun bs!39330 () Bool)

(assert (= bs!39330 d!147749))

(assert (=> bs!39330 m!1255275))

(assert (=> d!147643 d!147749))

(declare-fun d!147751 () Bool)

(declare-fun lt!602826 () Bool)

(assert (=> d!147751 (= lt!602826 (member (h!33217 acc!866) (content!743 (t!46706 acc!866))))))

(declare-fun e!777379 () Bool)

(assert (=> d!147751 (= lt!602826 e!777379)))

(declare-fun res!915487 () Bool)

(assert (=> d!147751 (=> (not res!915487) (not e!777379))))

(assert (=> d!147751 (= res!915487 (is-Cons!32008 (t!46706 acc!866)))))

(assert (=> d!147751 (= (contains!9694 (t!46706 acc!866) (h!33217 acc!866)) lt!602826)))

(declare-fun b!1372181 () Bool)

(declare-fun e!777378 () Bool)

(assert (=> b!1372181 (= e!777379 e!777378)))

(declare-fun res!915488 () Bool)

(assert (=> b!1372181 (=> res!915488 e!777378)))

(assert (=> b!1372181 (= res!915488 (= (h!33217 (t!46706 acc!866)) (h!33217 acc!866)))))

(declare-fun b!1372182 () Bool)

(assert (=> b!1372182 (= e!777378 (contains!9694 (t!46706 (t!46706 acc!866)) (h!33217 acc!866)))))

(assert (= (and d!147751 res!915487) b!1372181))

(assert (= (and b!1372181 (not res!915488)) b!1372182))

(declare-fun m!1255663 () Bool)

(assert (=> d!147751 m!1255663))

(declare-fun m!1255665 () Bool)

(assert (=> d!147751 m!1255665))

(declare-fun m!1255667 () Bool)

(assert (=> b!1372182 m!1255667))

(assert (=> b!1371964 d!147751))

(declare-fun b!1372183 () Bool)

(declare-fun e!777383 () Bool)

(declare-fun e!777382 () Bool)

(assert (=> b!1372183 (= e!777383 e!777382)))

(declare-fun res!915490 () Bool)

(assert (=> b!1372183 (=> (not res!915490) (not e!777382))))

(assert (=> b!1372183 (= res!915490 (is-Cons!32008 (t!46706 acc!866)))))

(declare-fun b!1372185 () Bool)

(declare-fun e!777381 () Bool)

(assert (=> b!1372185 (= e!777381 (subseq!1096 (t!46706 newAcc!98) (t!46706 (t!46706 acc!866))))))

(declare-fun b!1372186 () Bool)

(declare-fun e!777380 () Bool)

(assert (=> b!1372186 (= e!777380 (subseq!1096 newAcc!98 (t!46706 (t!46706 acc!866))))))

(declare-fun b!1372184 () Bool)

(assert (=> b!1372184 (= e!777382 e!777380)))

(declare-fun res!915492 () Bool)

(assert (=> b!1372184 (=> res!915492 e!777380)))

(assert (=> b!1372184 (= res!915492 e!777381)))

(declare-fun res!915491 () Bool)

(assert (=> b!1372184 (=> (not res!915491) (not e!777381))))

(assert (=> b!1372184 (= res!915491 (= (h!33217 newAcc!98) (h!33217 (t!46706 acc!866))))))

(declare-fun d!147753 () Bool)

(declare-fun res!915489 () Bool)

(assert (=> d!147753 (=> res!915489 e!777383)))

(assert (=> d!147753 (= res!915489 (is-Nil!32009 newAcc!98))))

(assert (=> d!147753 (= (subseq!1096 newAcc!98 (t!46706 acc!866)) e!777383)))

(assert (= (and d!147753 (not res!915489)) b!1372183))

(assert (= (and b!1372183 res!915490) b!1372184))

(assert (= (and b!1372184 res!915491) b!1372185))

(assert (= (and b!1372184 (not res!915492)) b!1372186))

(declare-fun m!1255669 () Bool)

(assert (=> b!1372185 m!1255669))

(declare-fun m!1255671 () Bool)

(assert (=> b!1372186 m!1255671))

(assert (=> b!1371991 d!147753))

(declare-fun b!1372187 () Bool)

(declare-fun e!777387 () Bool)

(declare-fun e!777386 () Bool)

(assert (=> b!1372187 (= e!777387 e!777386)))

(declare-fun res!915494 () Bool)

(assert (=> b!1372187 (=> (not res!915494) (not e!777386))))

(assert (=> b!1372187 (= res!915494 (is-Cons!32008 (t!46706 acc!866)))))

(declare-fun b!1372189 () Bool)

(declare-fun e!777385 () Bool)

(assert (=> b!1372189 (= e!777385 (subseq!1096 (t!46706 (t!46706 newAcc!98)) (t!46706 (t!46706 acc!866))))))

(declare-fun b!1372190 () Bool)

(declare-fun e!777384 () Bool)

(assert (=> b!1372190 (= e!777384 (subseq!1096 (t!46706 newAcc!98) (t!46706 (t!46706 acc!866))))))

(declare-fun b!1372188 () Bool)

(assert (=> b!1372188 (= e!777386 e!777384)))

(declare-fun res!915496 () Bool)

(assert (=> b!1372188 (=> res!915496 e!777384)))

(assert (=> b!1372188 (= res!915496 e!777385)))

(declare-fun res!915495 () Bool)

(assert (=> b!1372188 (=> (not res!915495) (not e!777385))))

(assert (=> b!1372188 (= res!915495 (= (h!33217 (t!46706 newAcc!98)) (h!33217 (t!46706 acc!866))))))

(declare-fun d!147755 () Bool)

(declare-fun res!915493 () Bool)

(assert (=> d!147755 (=> res!915493 e!777387)))

(assert (=> d!147755 (= res!915493 (is-Nil!32009 (t!46706 newAcc!98)))))

(assert (=> d!147755 (= (subseq!1096 (t!46706 newAcc!98) (t!46706 acc!866)) e!777387)))

