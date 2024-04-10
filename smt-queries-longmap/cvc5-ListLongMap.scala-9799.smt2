; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116408 () Bool)

(assert start!116408)

(declare-fun b!1373651 () Bool)

(declare-fun res!916865 () Bool)

(declare-fun e!778150 () Bool)

(assert (=> b!1373651 (=> (not res!916865) (not e!778150))))

(declare-datatypes ((List!32046 0))(
  ( (Nil!32043) (Cons!32042 (h!33251 (_ BitVec 64)) (t!46740 List!32046)) )
))
(declare-fun newAcc!98 () List!32046)

(declare-fun contains!9728 (List!32046 (_ BitVec 64)) Bool)

(assert (=> b!1373651 (= res!916865 (not (contains!9728 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!916859 () Bool)

(assert (=> start!116408 (=> (not res!916859) (not e!778150))))

(declare-datatypes ((array!93141 0))(
  ( (array!93142 (arr!44978 (Array (_ BitVec 32) (_ BitVec 64))) (size!45528 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93141)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116408 (= res!916859 (and (bvslt (size!45528 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45528 a!3861))))))

(assert (=> start!116408 e!778150))

(declare-fun array_inv!34006 (array!93141) Bool)

(assert (=> start!116408 (array_inv!34006 a!3861)))

(assert (=> start!116408 true))

(declare-fun b!1373652 () Bool)

(declare-fun res!916862 () Bool)

(assert (=> b!1373652 (=> (not res!916862) (not e!778150))))

(declare-fun acc!866 () List!32046)

(assert (=> b!1373652 (= res!916862 (not (contains!9728 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373653 () Bool)

(declare-fun res!916861 () Bool)

(assert (=> b!1373653 (=> (not res!916861) (not e!778150))))

(declare-fun noDuplicate!2585 (List!32046) Bool)

(assert (=> b!1373653 (= res!916861 (noDuplicate!2585 acc!866))))

(declare-fun b!1373654 () Bool)

(declare-fun res!916863 () Bool)

(declare-fun e!778148 () Bool)

(assert (=> b!1373654 (=> (not res!916863) (not e!778148))))

(assert (=> b!1373654 (= res!916863 (bvsge from!3239 (size!45528 a!3861)))))

(declare-fun b!1373655 () Bool)

(assert (=> b!1373655 (= e!778150 e!778148)))

(declare-fun res!916867 () Bool)

(assert (=> b!1373655 (=> (not res!916867) (not e!778148))))

(declare-fun arrayNoDuplicates!0 (array!93141 (_ BitVec 32) List!32046) Bool)

(assert (=> b!1373655 (= res!916867 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45393 0))(
  ( (Unit!45394) )
))
(declare-fun lt!603091 () Unit!45393)

(declare-fun noDuplicateSubseq!317 (List!32046 List!32046) Unit!45393)

(assert (=> b!1373655 (= lt!603091 (noDuplicateSubseq!317 newAcc!98 acc!866))))

(declare-fun b!1373656 () Bool)

(declare-fun res!916866 () Bool)

(assert (=> b!1373656 (=> (not res!916866) (not e!778150))))

(assert (=> b!1373656 (= res!916866 (not (contains!9728 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373657 () Bool)

(declare-fun res!916864 () Bool)

(assert (=> b!1373657 (=> (not res!916864) (not e!778150))))

(assert (=> b!1373657 (= res!916864 (not (contains!9728 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373658 () Bool)

(declare-fun res!916860 () Bool)

(assert (=> b!1373658 (=> (not res!916860) (not e!778150))))

(declare-fun subseq!1130 (List!32046 List!32046) Bool)

(assert (=> b!1373658 (= res!916860 (subseq!1130 newAcc!98 acc!866))))

(declare-fun b!1373659 () Bool)

(assert (=> b!1373659 (= e!778148 (not (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98)))))

(assert (= (and start!116408 res!916859) b!1373653))

(assert (= (and b!1373653 res!916861) b!1373656))

(assert (= (and b!1373656 res!916866) b!1373652))

(assert (= (and b!1373652 res!916862) b!1373651))

(assert (= (and b!1373651 res!916865) b!1373657))

(assert (= (and b!1373657 res!916864) b!1373658))

(assert (= (and b!1373658 res!916860) b!1373655))

(assert (= (and b!1373655 res!916867) b!1373654))

(assert (= (and b!1373654 res!916863) b!1373659))

(declare-fun m!1256869 () Bool)

(assert (=> b!1373651 m!1256869))

(declare-fun m!1256871 () Bool)

(assert (=> b!1373659 m!1256871))

(declare-fun m!1256873 () Bool)

(assert (=> b!1373658 m!1256873))

(declare-fun m!1256875 () Bool)

(assert (=> b!1373653 m!1256875))

(declare-fun m!1256877 () Bool)

(assert (=> b!1373652 m!1256877))

(declare-fun m!1256879 () Bool)

(assert (=> b!1373657 m!1256879))

(declare-fun m!1256881 () Bool)

(assert (=> start!116408 m!1256881))

(declare-fun m!1256883 () Bool)

(assert (=> b!1373655 m!1256883))

(declare-fun m!1256885 () Bool)

(assert (=> b!1373655 m!1256885))

(declare-fun m!1256887 () Bool)

(assert (=> b!1373656 m!1256887))

(push 1)

(assert (not b!1373657))

(assert (not b!1373653))

(assert (not b!1373656))

(assert (not b!1373655))

(assert (not b!1373659))

(assert (not b!1373652))

(assert (not b!1373651))

(assert (not start!116408))

(assert (not b!1373658))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!148043 () Bool)

(assert (=> d!148043 (= (array_inv!34006 a!3861) (bvsge (size!45528 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116408 d!148043))

(declare-fun d!148049 () Bool)

(declare-fun lt!603104 () Bool)

(declare-fun content!754 (List!32046) (Set (_ BitVec 64)))

(assert (=> d!148049 (= lt!603104 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!754 newAcc!98)))))

(declare-fun e!778182 () Bool)

(assert (=> d!148049 (= lt!603104 e!778182)))

(declare-fun res!916935 () Bool)

(assert (=> d!148049 (=> (not res!916935) (not e!778182))))

(assert (=> d!148049 (= res!916935 (is-Cons!32042 newAcc!98))))

(assert (=> d!148049 (= (contains!9728 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603104)))

(declare-fun b!1373726 () Bool)

(declare-fun e!778181 () Bool)

(assert (=> b!1373726 (= e!778182 e!778181)))

(declare-fun res!916934 () Bool)

(assert (=> b!1373726 (=> res!916934 e!778181)))

(assert (=> b!1373726 (= res!916934 (= (h!33251 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373727 () Bool)

(assert (=> b!1373727 (= e!778181 (contains!9728 (t!46740 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148049 res!916935) b!1373726))

(assert (= (and b!1373726 (not res!916934)) b!1373727))

(declare-fun m!1256941 () Bool)

(assert (=> d!148049 m!1256941))

(declare-fun m!1256943 () Bool)

(assert (=> d!148049 m!1256943))

(declare-fun m!1256945 () Bool)

(assert (=> b!1373727 m!1256945))

(assert (=> b!1373657 d!148049))

(declare-fun d!148055 () Bool)

(declare-fun lt!603105 () Bool)

(assert (=> d!148055 (= lt!603105 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!754 acc!866)))))

(declare-fun e!778197 () Bool)

(assert (=> d!148055 (= lt!603105 e!778197)))

(declare-fun res!916949 () Bool)

(assert (=> d!148055 (=> (not res!916949) (not e!778197))))

(assert (=> d!148055 (= res!916949 (is-Cons!32042 acc!866))))

(assert (=> d!148055 (= (contains!9728 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603105)))

(declare-fun b!1373742 () Bool)

(declare-fun e!778196 () Bool)

(assert (=> b!1373742 (= e!778197 e!778196)))

(declare-fun res!916948 () Bool)

(assert (=> b!1373742 (=> res!916948 e!778196)))

(assert (=> b!1373742 (= res!916948 (= (h!33251 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373743 () Bool)

(assert (=> b!1373743 (= e!778196 (contains!9728 (t!46740 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148055 res!916949) b!1373742))

(assert (= (and b!1373742 (not res!916948)) b!1373743))

(declare-fun m!1256947 () Bool)

(assert (=> d!148055 m!1256947))

(declare-fun m!1256949 () Bool)

(assert (=> d!148055 m!1256949))

(declare-fun m!1256951 () Bool)

(assert (=> b!1373743 m!1256951))

(assert (=> b!1373652 d!148055))

(declare-fun d!148057 () Bool)

(declare-fun lt!603106 () Bool)

(assert (=> d!148057 (= lt!603106 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!754 newAcc!98)))))

(declare-fun e!778202 () Bool)

(assert (=> d!148057 (= lt!603106 e!778202)))

(declare-fun res!916951 () Bool)

(assert (=> d!148057 (=> (not res!916951) (not e!778202))))

(assert (=> d!148057 (= res!916951 (is-Cons!32042 newAcc!98))))

(assert (=> d!148057 (= (contains!9728 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!603106)))

(declare-fun b!1373750 () Bool)

(declare-fun e!778201 () Bool)

(assert (=> b!1373750 (= e!778202 e!778201)))

(declare-fun res!916950 () Bool)

(assert (=> b!1373750 (=> res!916950 e!778201)))

(assert (=> b!1373750 (= res!916950 (= (h!33251 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373751 () Bool)

(assert (=> b!1373751 (= e!778201 (contains!9728 (t!46740 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148057 res!916951) b!1373750))

(assert (= (and b!1373750 (not res!916950)) b!1373751))

(assert (=> d!148057 m!1256941))

(declare-fun m!1256953 () Bool)

(assert (=> d!148057 m!1256953))

(declare-fun m!1256955 () Bool)

(assert (=> b!1373751 m!1256955))

(assert (=> b!1373651 d!148057))

(declare-fun d!148059 () Bool)

(declare-fun lt!603107 () Bool)

(assert (=> d!148059 (= lt!603107 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!754 acc!866)))))

(declare-fun e!778204 () Bool)

(assert (=> d!148059 (= lt!603107 e!778204)))

(declare-fun res!916953 () Bool)

(assert (=> d!148059 (=> (not res!916953) (not e!778204))))

(assert (=> d!148059 (= res!916953 (is-Cons!32042 acc!866))))

(assert (=> d!148059 (= (contains!9728 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!603107)))

(declare-fun b!1373752 () Bool)

(declare-fun e!778203 () Bool)

(assert (=> b!1373752 (= e!778204 e!778203)))

(declare-fun res!916952 () Bool)

(assert (=> b!1373752 (=> res!916952 e!778203)))

(assert (=> b!1373752 (= res!916952 (= (h!33251 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373753 () Bool)

(assert (=> b!1373753 (= e!778203 (contains!9728 (t!46740 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148059 res!916953) b!1373752))

(assert (= (and b!1373752 (not res!916952)) b!1373753))

(assert (=> d!148059 m!1256947))

(declare-fun m!1256957 () Bool)

(assert (=> d!148059 m!1256957))

(declare-fun m!1256959 () Bool)

(assert (=> b!1373753 m!1256959))

(assert (=> b!1373656 d!148059))

(declare-fun b!1373780 () Bool)

(declare-fun e!778230 () Bool)

(declare-fun e!778229 () Bool)

(assert (=> b!1373780 (= e!778230 e!778229)))

(declare-fun res!916972 () Bool)

(assert (=> b!1373780 (=> (not res!916972) (not e!778229))))

(declare-fun e!778227 () Bool)

(assert (=> b!1373780 (= res!916972 (not e!778227))))

(declare-fun res!916973 () Bool)

(assert (=> b!1373780 (=> (not res!916973) (not e!778227))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373780 (= res!916973 (validKeyInArray!0 (select (arr!44978 a!3861) from!3239)))))

(declare-fun b!1373781 () Bool)

(declare-fun e!778228 () Bool)

(assert (=> b!1373781 (= e!778229 e!778228)))

(declare-fun c!127844 () Bool)

(assert (=> b!1373781 (= c!127844 (validKeyInArray!0 (select (arr!44978 a!3861) from!3239)))))

(declare-fun b!1373782 () Bool)

(declare-fun call!65639 () Bool)

(assert (=> b!1373782 (= e!778228 call!65639)))

(declare-fun d!148061 () Bool)

(declare-fun res!916974 () Bool)

(assert (=> d!148061 (=> res!916974 e!778230)))

(assert (=> d!148061 (= res!916974 (bvsge from!3239 (size!45528 a!3861)))))

(assert (=> d!148061 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!778230)))

(declare-fun b!1373783 () Bool)

(assert (=> b!1373783 (= e!778228 call!65639)))

(declare-fun bm!65636 () Bool)

(assert (=> bm!65636 (= call!65639 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127844 (Cons!32042 (select (arr!44978 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1373784 () Bool)

(assert (=> b!1373784 (= e!778227 (contains!9728 acc!866 (select (arr!44978 a!3861) from!3239)))))

(assert (= (and d!148061 (not res!916974)) b!1373780))

(assert (= (and b!1373780 res!916973) b!1373784))

(assert (= (and b!1373780 res!916972) b!1373781))

(assert (= (and b!1373781 c!127844) b!1373782))

(assert (= (and b!1373781 (not c!127844)) b!1373783))

(assert (= (or b!1373782 b!1373783) bm!65636))

(declare-fun m!1256985 () Bool)

(assert (=> b!1373780 m!1256985))

(assert (=> b!1373780 m!1256985))

(declare-fun m!1256987 () Bool)

(assert (=> b!1373780 m!1256987))

(assert (=> b!1373781 m!1256985))

(assert (=> b!1373781 m!1256985))

(assert (=> b!1373781 m!1256987))

(assert (=> bm!65636 m!1256985))

(declare-fun m!1256991 () Bool)

(assert (=> bm!65636 m!1256991))

(assert (=> b!1373784 m!1256985))

(assert (=> b!1373784 m!1256985))

(declare-fun m!1256993 () Bool)

(assert (=> b!1373784 m!1256993))

(assert (=> b!1373655 d!148061))

(declare-fun d!148071 () Bool)

(assert (=> d!148071 (noDuplicate!2585 newAcc!98)))

(declare-fun lt!603120 () Unit!45393)

(declare-fun choose!2029 (List!32046 List!32046) Unit!45393)

(assert (=> d!148071 (= lt!603120 (choose!2029 newAcc!98 acc!866))))

(declare-fun e!778249 () Bool)

(assert (=> d!148071 e!778249))

(declare-fun res!916991 () Bool)

(assert (=> d!148071 (=> (not res!916991) (not e!778249))))

(assert (=> d!148071 (= res!916991 (subseq!1130 newAcc!98 acc!866))))

(assert (=> d!148071 (= (noDuplicateSubseq!317 newAcc!98 acc!866) lt!603120)))

(declare-fun b!1373805 () Bool)

(assert (=> b!1373805 (= e!778249 (noDuplicate!2585 acc!866))))

(assert (= (and d!148071 res!916991) b!1373805))

(declare-fun m!1257009 () Bool)

(assert (=> d!148071 m!1257009))

(declare-fun m!1257011 () Bool)

(assert (=> d!148071 m!1257011))

(assert (=> d!148071 m!1256873))

(assert (=> b!1373805 m!1256875))

(assert (=> b!1373655 d!148071))

(declare-fun b!1373808 () Bool)

(declare-fun e!778255 () Bool)

(declare-fun e!778254 () Bool)

(assert (=> b!1373808 (= e!778255 e!778254)))

(declare-fun res!916994 () Bool)

(assert (=> b!1373808 (=> (not res!916994) (not e!778254))))

(declare-fun e!778252 () Bool)

(assert (=> b!1373808 (= res!916994 (not e!778252))))

(declare-fun res!916995 () Bool)

(assert (=> b!1373808 (=> (not res!916995) (not e!778252))))

(assert (=> b!1373808 (= res!916995 (validKeyInArray!0 (select (arr!44978 a!3861) from!3239)))))

(declare-fun b!1373809 () Bool)

(declare-fun e!778253 () Bool)

(assert (=> b!1373809 (= e!778254 e!778253)))

(declare-fun c!127847 () Bool)

(assert (=> b!1373809 (= c!127847 (validKeyInArray!0 (select (arr!44978 a!3861) from!3239)))))

(declare-fun b!1373810 () Bool)

(declare-fun call!65642 () Bool)

(assert (=> b!1373810 (= e!778253 call!65642)))

(declare-fun d!148083 () Bool)

(declare-fun res!916996 () Bool)

(assert (=> d!148083 (=> res!916996 e!778255)))

(assert (=> d!148083 (= res!916996 (bvsge from!3239 (size!45528 a!3861)))))

(assert (=> d!148083 (= (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98) e!778255)))

(declare-fun b!1373811 () Bool)

(assert (=> b!1373811 (= e!778253 call!65642)))

(declare-fun bm!65639 () Bool)

(assert (=> bm!65639 (= call!65642 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127847 (Cons!32042 (select (arr!44978 a!3861) from!3239) newAcc!98) newAcc!98)))))

(declare-fun b!1373812 () Bool)

(assert (=> b!1373812 (= e!778252 (contains!9728 newAcc!98 (select (arr!44978 a!3861) from!3239)))))

(assert (= (and d!148083 (not res!916996)) b!1373808))

(assert (= (and b!1373808 res!916995) b!1373812))

(assert (= (and b!1373808 res!916994) b!1373809))

(assert (= (and b!1373809 c!127847) b!1373810))

