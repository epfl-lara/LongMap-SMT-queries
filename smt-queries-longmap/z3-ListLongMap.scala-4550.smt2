; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63364 () Bool)

(assert start!63364)

(declare-fun res!476974 () Bool)

(declare-fun e!401143 () Bool)

(assert (=> start!63364 (=> (not res!476974) (not e!401143))))

(declare-datatypes ((array!40479 0))(
  ( (array!40480 (arr!19379 (Array (_ BitVec 32) (_ BitVec 64))) (size!19791 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40479)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!63364 (= res!476974 (and (bvslt (size!19791 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19791 a!3591))))))

(assert (=> start!63364 e!401143))

(assert (=> start!63364 true))

(declare-fun array_inv!15262 (array!40479) Bool)

(assert (=> start!63364 (array_inv!15262 a!3591)))

(declare-fun b!713713 () Bool)

(declare-fun res!476969 () Bool)

(assert (=> b!713713 (=> (not res!476969) (not e!401143))))

(declare-datatypes ((List!13459 0))(
  ( (Nil!13456) (Cons!13455 (h!14500 (_ BitVec 64)) (t!19765 List!13459)) )
))
(declare-fun newAcc!49 () List!13459)

(declare-fun acc!652 () List!13459)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun -!408 (List!13459 (_ BitVec 64)) List!13459)

(assert (=> b!713713 (= res!476969 (= (-!408 newAcc!49 k0!2824) acc!652))))

(declare-fun b!713714 () Bool)

(declare-fun res!476976 () Bool)

(assert (=> b!713714 (=> (not res!476976) (not e!401143))))

(declare-fun subseq!443 (List!13459 List!13459) Bool)

(assert (=> b!713714 (= res!476976 (subseq!443 acc!652 newAcc!49))))

(declare-fun b!713715 () Bool)

(declare-fun res!476971 () Bool)

(assert (=> b!713715 (=> (not res!476971) (not e!401143))))

(assert (=> b!713715 (= res!476971 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19791 a!3591)))))

(declare-fun b!713716 () Bool)

(declare-fun res!476967 () Bool)

(assert (=> b!713716 (=> (not res!476967) (not e!401143))))

(declare-fun contains!3981 (List!13459 (_ BitVec 64)) Bool)

(assert (=> b!713716 (= res!476967 (not (contains!3981 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713717 () Bool)

(declare-fun res!476977 () Bool)

(assert (=> b!713717 (=> (not res!476977) (not e!401143))))

(assert (=> b!713717 (= res!476977 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!713718 () Bool)

(declare-fun res!476970 () Bool)

(assert (=> b!713718 (=> (not res!476970) (not e!401143))))

(declare-fun noDuplicate!1250 (List!13459) Bool)

(assert (=> b!713718 (= res!476970 (noDuplicate!1250 acc!652))))

(declare-fun b!713719 () Bool)

(declare-fun res!476979 () Bool)

(assert (=> b!713719 (=> (not res!476979) (not e!401143))))

(declare-fun arrayContainsKey!0 (array!40479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!713719 (= res!476979 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!713720 () Bool)

(declare-fun res!476972 () Bool)

(assert (=> b!713720 (=> (not res!476972) (not e!401143))))

(assert (=> b!713720 (= res!476972 (noDuplicate!1250 newAcc!49))))

(declare-fun b!713721 () Bool)

(declare-fun res!476975 () Bool)

(assert (=> b!713721 (=> (not res!476975) (not e!401143))))

(declare-fun arrayNoDuplicates!0 (array!40479 (_ BitVec 32) List!13459) Bool)

(assert (=> b!713721 (= res!476975 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!713722 () Bool)

(assert (=> b!713722 (= e!401143 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)))))

(declare-fun b!713723 () Bool)

(declare-fun res!476973 () Bool)

(assert (=> b!713723 (=> (not res!476973) (not e!401143))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!713723 (= res!476973 (not (validKeyInArray!0 (select (arr!19379 a!3591) from!2969))))))

(declare-fun b!713724 () Bool)

(declare-fun res!476978 () Bool)

(assert (=> b!713724 (=> (not res!476978) (not e!401143))))

(assert (=> b!713724 (= res!476978 (not (contains!3981 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713725 () Bool)

(declare-fun res!476968 () Bool)

(assert (=> b!713725 (=> (not res!476968) (not e!401143))))

(assert (=> b!713725 (= res!476968 (validKeyInArray!0 k0!2824))))

(declare-fun b!713726 () Bool)

(declare-fun res!476965 () Bool)

(assert (=> b!713726 (=> (not res!476965) (not e!401143))))

(assert (=> b!713726 (= res!476965 (not (contains!3981 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713727 () Bool)

(declare-fun res!476963 () Bool)

(assert (=> b!713727 (=> (not res!476963) (not e!401143))))

(assert (=> b!713727 (= res!476963 (contains!3981 newAcc!49 k0!2824))))

(declare-fun b!713728 () Bool)

(declare-fun res!476964 () Bool)

(assert (=> b!713728 (=> (not res!476964) (not e!401143))))

(assert (=> b!713728 (= res!476964 (not (contains!3981 acc!652 k0!2824)))))

(declare-fun b!713729 () Bool)

(declare-fun res!476966 () Bool)

(assert (=> b!713729 (=> (not res!476966) (not e!401143))))

(assert (=> b!713729 (= res!476966 (not (contains!3981 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!63364 res!476974) b!713718))

(assert (= (and b!713718 res!476970) b!713720))

(assert (= (and b!713720 res!476972) b!713726))

(assert (= (and b!713726 res!476965) b!713716))

(assert (= (and b!713716 res!476967) b!713719))

(assert (= (and b!713719 res!476979) b!713728))

(assert (= (and b!713728 res!476964) b!713725))

(assert (= (and b!713725 res!476968) b!713721))

(assert (= (and b!713721 res!476975) b!713714))

(assert (= (and b!713714 res!476976) b!713727))

(assert (= (and b!713727 res!476963) b!713713))

(assert (= (and b!713713 res!476969) b!713729))

(assert (= (and b!713729 res!476966) b!713724))

(assert (= (and b!713724 res!476978) b!713715))

(assert (= (and b!713715 res!476971) b!713723))

(assert (= (and b!713723 res!476973) b!713717))

(assert (= (and b!713717 res!476977) b!713722))

(declare-fun m!669861 () Bool)

(assert (=> start!63364 m!669861))

(declare-fun m!669863 () Bool)

(assert (=> b!713722 m!669863))

(declare-fun m!669865 () Bool)

(assert (=> b!713716 m!669865))

(declare-fun m!669867 () Bool)

(assert (=> b!713723 m!669867))

(assert (=> b!713723 m!669867))

(declare-fun m!669869 () Bool)

(assert (=> b!713723 m!669869))

(declare-fun m!669871 () Bool)

(assert (=> b!713714 m!669871))

(declare-fun m!669873 () Bool)

(assert (=> b!713727 m!669873))

(declare-fun m!669875 () Bool)

(assert (=> b!713718 m!669875))

(declare-fun m!669877 () Bool)

(assert (=> b!713728 m!669877))

(declare-fun m!669879 () Bool)

(assert (=> b!713725 m!669879))

(declare-fun m!669881 () Bool)

(assert (=> b!713713 m!669881))

(declare-fun m!669883 () Bool)

(assert (=> b!713721 m!669883))

(declare-fun m!669885 () Bool)

(assert (=> b!713719 m!669885))

(declare-fun m!669887 () Bool)

(assert (=> b!713724 m!669887))

(declare-fun m!669889 () Bool)

(assert (=> b!713729 m!669889))

(declare-fun m!669891 () Bool)

(assert (=> b!713726 m!669891))

(declare-fun m!669893 () Bool)

(assert (=> b!713720 m!669893))

(check-sat (not b!713720) (not b!713713) (not b!713729) (not b!713716) (not b!713726) (not b!713724) (not b!713725) (not b!713718) (not b!713719) (not b!713722) (not b!713723) (not start!63364) (not b!713721) (not b!713728) (not b!713727) (not b!713714))
(check-sat)
(get-model)

(declare-fun d!98005 () Bool)

(assert (=> d!98005 (= (validKeyInArray!0 (select (arr!19379 a!3591) from!2969)) (and (not (= (select (arr!19379 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19379 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!713723 d!98005))

(declare-fun b!713842 () Bool)

(declare-fun e!401164 () Bool)

(declare-fun call!34567 () Bool)

(assert (=> b!713842 (= e!401164 call!34567)))

(declare-fun d!98007 () Bool)

(declare-fun res!477090 () Bool)

(declare-fun e!401165 () Bool)

(assert (=> d!98007 (=> res!477090 e!401165)))

(assert (=> d!98007 (= res!477090 (bvsge from!2969 (size!19791 a!3591)))))

(assert (=> d!98007 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!401165)))

(declare-fun c!78744 () Bool)

(declare-fun bm!34564 () Bool)

(assert (=> bm!34564 (= call!34567 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78744 (Cons!13455 (select (arr!19379 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!713843 () Bool)

(declare-fun e!401166 () Bool)

(assert (=> b!713843 (= e!401166 e!401164)))

(assert (=> b!713843 (= c!78744 (validKeyInArray!0 (select (arr!19379 a!3591) from!2969)))))

(declare-fun b!713844 () Bool)

(assert (=> b!713844 (= e!401164 call!34567)))

(declare-fun b!713845 () Bool)

(assert (=> b!713845 (= e!401165 e!401166)))

(declare-fun res!477089 () Bool)

(assert (=> b!713845 (=> (not res!477089) (not e!401166))))

(declare-fun e!401167 () Bool)

(assert (=> b!713845 (= res!477089 (not e!401167))))

(declare-fun res!477088 () Bool)

(assert (=> b!713845 (=> (not res!477088) (not e!401167))))

(assert (=> b!713845 (= res!477088 (validKeyInArray!0 (select (arr!19379 a!3591) from!2969)))))

(declare-fun b!713846 () Bool)

(assert (=> b!713846 (= e!401167 (contains!3981 acc!652 (select (arr!19379 a!3591) from!2969)))))

(assert (= (and d!98007 (not res!477090)) b!713845))

(assert (= (and b!713845 res!477088) b!713846))

(assert (= (and b!713845 res!477089) b!713843))

(assert (= (and b!713843 c!78744) b!713844))

(assert (= (and b!713843 (not c!78744)) b!713842))

(assert (= (or b!713844 b!713842) bm!34564))

(assert (=> bm!34564 m!669867))

(declare-fun m!669963 () Bool)

(assert (=> bm!34564 m!669963))

(assert (=> b!713843 m!669867))

(assert (=> b!713843 m!669867))

(assert (=> b!713843 m!669869))

(assert (=> b!713845 m!669867))

(assert (=> b!713845 m!669867))

(assert (=> b!713845 m!669869))

(assert (=> b!713846 m!669867))

(assert (=> b!713846 m!669867))

(declare-fun m!669965 () Bool)

(assert (=> b!713846 m!669965))

(assert (=> b!713721 d!98007))

(declare-fun d!98009 () Bool)

(declare-fun res!477095 () Bool)

(declare-fun e!401172 () Bool)

(assert (=> d!98009 (=> res!477095 e!401172)))

(assert (=> d!98009 (= res!477095 (= (select (arr!19379 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k0!2824))))

(assert (=> d!98009 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!401172)))

(declare-fun b!713851 () Bool)

(declare-fun e!401173 () Bool)

(assert (=> b!713851 (= e!401172 e!401173)))

(declare-fun res!477096 () Bool)

(assert (=> b!713851 (=> (not res!477096) (not e!401173))))

(assert (=> b!713851 (= res!477096 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19791 a!3591)))))

(declare-fun b!713852 () Bool)

(assert (=> b!713852 (= e!401173 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98009 (not res!477095)) b!713851))

(assert (= (and b!713851 res!477096) b!713852))

(declare-fun m!669967 () Bool)

(assert (=> d!98009 m!669967))

(declare-fun m!669969 () Bool)

(assert (=> b!713852 m!669969))

(assert (=> b!713722 d!98009))

(declare-fun d!98013 () Bool)

(declare-fun res!477105 () Bool)

(declare-fun e!401182 () Bool)

(assert (=> d!98013 (=> res!477105 e!401182)))

(get-info :version)

(assert (=> d!98013 (= res!477105 ((_ is Nil!13456) newAcc!49))))

(assert (=> d!98013 (= (noDuplicate!1250 newAcc!49) e!401182)))

(declare-fun b!713861 () Bool)

(declare-fun e!401183 () Bool)

(assert (=> b!713861 (= e!401182 e!401183)))

(declare-fun res!477106 () Bool)

(assert (=> b!713861 (=> (not res!477106) (not e!401183))))

(assert (=> b!713861 (= res!477106 (not (contains!3981 (t!19765 newAcc!49) (h!14500 newAcc!49))))))

(declare-fun b!713862 () Bool)

(assert (=> b!713862 (= e!401183 (noDuplicate!1250 (t!19765 newAcc!49)))))

(assert (= (and d!98013 (not res!477105)) b!713861))

(assert (= (and b!713861 res!477106) b!713862))

(declare-fun m!669971 () Bool)

(assert (=> b!713861 m!669971))

(declare-fun m!669973 () Bool)

(assert (=> b!713862 m!669973))

(assert (=> b!713720 d!98013))

(declare-fun d!98017 () Bool)

(declare-fun lt!318488 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!365 (List!13459) (InoxSet (_ BitVec 64)))

(assert (=> d!98017 (= lt!318488 (select (content!365 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401203 () Bool)

(assert (=> d!98017 (= lt!318488 e!401203)))

(declare-fun res!477121 () Bool)

(assert (=> d!98017 (=> (not res!477121) (not e!401203))))

(assert (=> d!98017 (= res!477121 ((_ is Cons!13455) newAcc!49))))

(assert (=> d!98017 (= (contains!3981 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318488)))

(declare-fun b!713885 () Bool)

(declare-fun e!401204 () Bool)

(assert (=> b!713885 (= e!401203 e!401204)))

(declare-fun res!477122 () Bool)

(assert (=> b!713885 (=> res!477122 e!401204)))

(assert (=> b!713885 (= res!477122 (= (h!14500 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713886 () Bool)

(assert (=> b!713886 (= e!401204 (contains!3981 (t!19765 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98017 res!477121) b!713885))

(assert (= (and b!713885 (not res!477122)) b!713886))

(declare-fun m!669999 () Bool)

(assert (=> d!98017 m!669999))

(declare-fun m!670001 () Bool)

(assert (=> d!98017 m!670001))

(declare-fun m!670003 () Bool)

(assert (=> b!713886 m!670003))

(assert (=> b!713729 d!98017))

(declare-fun d!98029 () Bool)

(declare-fun res!477127 () Bool)

(declare-fun e!401209 () Bool)

(assert (=> d!98029 (=> res!477127 e!401209)))

(assert (=> d!98029 (= res!477127 (= (select (arr!19379 a!3591) from!2969) k0!2824))))

(assert (=> d!98029 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!401209)))

(declare-fun b!713891 () Bool)

(declare-fun e!401210 () Bool)

(assert (=> b!713891 (= e!401209 e!401210)))

(declare-fun res!477128 () Bool)

(assert (=> b!713891 (=> (not res!477128) (not e!401210))))

(assert (=> b!713891 (= res!477128 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19791 a!3591)))))

(declare-fun b!713892 () Bool)

(assert (=> b!713892 (= e!401210 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98029 (not res!477127)) b!713891))

(assert (= (and b!713891 res!477128) b!713892))

(assert (=> d!98029 m!669867))

(declare-fun m!670005 () Bool)

(assert (=> b!713892 m!670005))

(assert (=> b!713719 d!98029))

(declare-fun d!98031 () Bool)

(declare-fun lt!318489 () Bool)

(assert (=> d!98031 (= lt!318489 (select (content!365 acc!652) k0!2824))))

(declare-fun e!401213 () Bool)

(assert (=> d!98031 (= lt!318489 e!401213)))

(declare-fun res!477131 () Bool)

(assert (=> d!98031 (=> (not res!477131) (not e!401213))))

(assert (=> d!98031 (= res!477131 ((_ is Cons!13455) acc!652))))

(assert (=> d!98031 (= (contains!3981 acc!652 k0!2824) lt!318489)))

(declare-fun b!713895 () Bool)

(declare-fun e!401214 () Bool)

(assert (=> b!713895 (= e!401213 e!401214)))

(declare-fun res!477132 () Bool)

(assert (=> b!713895 (=> res!477132 e!401214)))

(assert (=> b!713895 (= res!477132 (= (h!14500 acc!652) k0!2824))))

(declare-fun b!713896 () Bool)

(assert (=> b!713896 (= e!401214 (contains!3981 (t!19765 acc!652) k0!2824))))

(assert (= (and d!98031 res!477131) b!713895))

(assert (= (and b!713895 (not res!477132)) b!713896))

(declare-fun m!670007 () Bool)

(assert (=> d!98031 m!670007))

(declare-fun m!670009 () Bool)

(assert (=> d!98031 m!670009))

(declare-fun m!670011 () Bool)

(assert (=> b!713896 m!670011))

(assert (=> b!713728 d!98031))

(declare-fun d!98033 () Bool)

(assert (=> d!98033 (= (array_inv!15262 a!3591) (bvsge (size!19791 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63364 d!98033))

(declare-fun d!98035 () Bool)

(declare-fun res!477135 () Bool)

(declare-fun e!401217 () Bool)

(assert (=> d!98035 (=> res!477135 e!401217)))

(assert (=> d!98035 (= res!477135 ((_ is Nil!13456) acc!652))))

(assert (=> d!98035 (= (noDuplicate!1250 acc!652) e!401217)))

(declare-fun b!713899 () Bool)

(declare-fun e!401218 () Bool)

(assert (=> b!713899 (= e!401217 e!401218)))

(declare-fun res!477136 () Bool)

(assert (=> b!713899 (=> (not res!477136) (not e!401218))))

(assert (=> b!713899 (= res!477136 (not (contains!3981 (t!19765 acc!652) (h!14500 acc!652))))))

(declare-fun b!713900 () Bool)

(assert (=> b!713900 (= e!401218 (noDuplicate!1250 (t!19765 acc!652)))))

(assert (= (and d!98035 (not res!477135)) b!713899))

(assert (= (and b!713899 res!477136) b!713900))

(declare-fun m!670017 () Bool)

(assert (=> b!713899 m!670017))

(declare-fun m!670019 () Bool)

(assert (=> b!713900 m!670019))

(assert (=> b!713718 d!98035))

(declare-fun d!98039 () Bool)

(declare-fun lt!318491 () Bool)

(assert (=> d!98039 (= lt!318491 (select (content!365 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401221 () Bool)

(assert (=> d!98039 (= lt!318491 e!401221)))

(declare-fun res!477139 () Bool)

(assert (=> d!98039 (=> (not res!477139) (not e!401221))))

(assert (=> d!98039 (= res!477139 ((_ is Cons!13455) acc!652))))

(assert (=> d!98039 (= (contains!3981 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318491)))

(declare-fun b!713903 () Bool)

(declare-fun e!401222 () Bool)

(assert (=> b!713903 (= e!401221 e!401222)))

(declare-fun res!477140 () Bool)

(assert (=> b!713903 (=> res!477140 e!401222)))

(assert (=> b!713903 (= res!477140 (= (h!14500 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713904 () Bool)

(assert (=> b!713904 (= e!401222 (contains!3981 (t!19765 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98039 res!477139) b!713903))

(assert (= (and b!713903 (not res!477140)) b!713904))

(assert (=> d!98039 m!670007))

(declare-fun m!670025 () Bool)

(assert (=> d!98039 m!670025))

(declare-fun m!670027 () Bool)

(assert (=> b!713904 m!670027))

(assert (=> b!713716 d!98039))

(declare-fun d!98043 () Bool)

(declare-fun lt!318493 () Bool)

(assert (=> d!98043 (= lt!318493 (select (content!365 newAcc!49) k0!2824))))

(declare-fun e!401228 () Bool)

(assert (=> d!98043 (= lt!318493 e!401228)))

(declare-fun res!477144 () Bool)

(assert (=> d!98043 (=> (not res!477144) (not e!401228))))

(assert (=> d!98043 (= res!477144 ((_ is Cons!13455) newAcc!49))))

(assert (=> d!98043 (= (contains!3981 newAcc!49 k0!2824) lt!318493)))

(declare-fun b!713912 () Bool)

(declare-fun e!401229 () Bool)

(assert (=> b!713912 (= e!401228 e!401229)))

(declare-fun res!477145 () Bool)

(assert (=> b!713912 (=> res!477145 e!401229)))

(assert (=> b!713912 (= res!477145 (= (h!14500 newAcc!49) k0!2824))))

(declare-fun b!713913 () Bool)

(assert (=> b!713913 (= e!401229 (contains!3981 (t!19765 newAcc!49) k0!2824))))

(assert (= (and d!98043 res!477144) b!713912))

(assert (= (and b!713912 (not res!477145)) b!713913))

(assert (=> d!98043 m!669999))

(declare-fun m!670035 () Bool)

(assert (=> d!98043 m!670035))

(declare-fun m!670039 () Bool)

(assert (=> b!713913 m!670039))

(assert (=> b!713727 d!98043))

(declare-fun d!98047 () Bool)

(assert (=> d!98047 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!713725 d!98047))

(declare-fun d!98049 () Bool)

(declare-fun lt!318494 () Bool)

(assert (=> d!98049 (= lt!318494 (select (content!365 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401230 () Bool)

(assert (=> d!98049 (= lt!318494 e!401230)))

(declare-fun res!477146 () Bool)

(assert (=> d!98049 (=> (not res!477146) (not e!401230))))

(assert (=> d!98049 (= res!477146 ((_ is Cons!13455) acc!652))))

(assert (=> d!98049 (= (contains!3981 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318494)))

(declare-fun b!713914 () Bool)

(declare-fun e!401231 () Bool)

(assert (=> b!713914 (= e!401230 e!401231)))

(declare-fun res!477147 () Bool)

(assert (=> b!713914 (=> res!477147 e!401231)))

(assert (=> b!713914 (= res!477147 (= (h!14500 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713915 () Bool)

(assert (=> b!713915 (= e!401231 (contains!3981 (t!19765 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98049 res!477146) b!713914))

(assert (= (and b!713914 (not res!477147)) b!713915))

(assert (=> d!98049 m!670007))

(declare-fun m!670049 () Bool)

(assert (=> d!98049 m!670049))

(declare-fun m!670051 () Bool)

(assert (=> b!713915 m!670051))

(assert (=> b!713726 d!98049))

(declare-fun d!98053 () Bool)

(declare-fun lt!318495 () Bool)

(assert (=> d!98053 (= lt!318495 (select (content!365 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401232 () Bool)

(assert (=> d!98053 (= lt!318495 e!401232)))

(declare-fun res!477148 () Bool)

(assert (=> d!98053 (=> (not res!477148) (not e!401232))))

(assert (=> d!98053 (= res!477148 ((_ is Cons!13455) newAcc!49))))

(assert (=> d!98053 (= (contains!3981 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318495)))

(declare-fun b!713916 () Bool)

(declare-fun e!401233 () Bool)

(assert (=> b!713916 (= e!401232 e!401233)))

(declare-fun res!477149 () Bool)

(assert (=> b!713916 (=> res!477149 e!401233)))

(assert (=> b!713916 (= res!477149 (= (h!14500 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713917 () Bool)

(assert (=> b!713917 (= e!401233 (contains!3981 (t!19765 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98053 res!477148) b!713916))

(assert (= (and b!713916 (not res!477149)) b!713917))

(assert (=> d!98053 m!669999))

(declare-fun m!670053 () Bool)

(assert (=> d!98053 m!670053))

(declare-fun m!670055 () Bool)

(assert (=> b!713917 m!670055))

(assert (=> b!713724 d!98053))

(declare-fun b!713958 () Bool)

(declare-fun e!401272 () List!13459)

(declare-fun call!34573 () List!13459)

(assert (=> b!713958 (= e!401272 (Cons!13455 (h!14500 newAcc!49) call!34573))))

(declare-fun b!713959 () Bool)

(assert (=> b!713959 (= e!401272 call!34573)))

(declare-fun d!98057 () Bool)

(declare-fun e!401271 () Bool)

(assert (=> d!98057 e!401271))

(declare-fun res!477182 () Bool)

(assert (=> d!98057 (=> (not res!477182) (not e!401271))))

(declare-fun lt!318498 () List!13459)

(declare-fun size!19795 (List!13459) Int)

(assert (=> d!98057 (= res!477182 (<= (size!19795 lt!318498) (size!19795 newAcc!49)))))

(declare-fun e!401273 () List!13459)

(assert (=> d!98057 (= lt!318498 e!401273)))

(declare-fun c!78756 () Bool)

(assert (=> d!98057 (= c!78756 ((_ is Cons!13455) newAcc!49))))

(assert (=> d!98057 (= (-!408 newAcc!49 k0!2824) lt!318498)))

(declare-fun b!713960 () Bool)

(assert (=> b!713960 (= e!401273 Nil!13456)))

(declare-fun b!713961 () Bool)

(assert (=> b!713961 (= e!401273 e!401272)))

(declare-fun c!78755 () Bool)

(assert (=> b!713961 (= c!78755 (= k0!2824 (h!14500 newAcc!49)))))

(declare-fun bm!34570 () Bool)

(assert (=> bm!34570 (= call!34573 (-!408 (t!19765 newAcc!49) k0!2824))))

(declare-fun b!713962 () Bool)

(assert (=> b!713962 (= e!401271 (= (content!365 lt!318498) ((_ map and) (content!365 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(assert (= (and d!98057 c!78756) b!713961))

(assert (= (and d!98057 (not c!78756)) b!713960))

(assert (= (and b!713961 c!78755) b!713959))

(assert (= (and b!713961 (not c!78755)) b!713958))

(assert (= (or b!713959 b!713958) bm!34570))

(assert (= (and d!98057 res!477182) b!713962))

(declare-fun m!670065 () Bool)

(assert (=> d!98057 m!670065))

(declare-fun m!670067 () Bool)

(assert (=> d!98057 m!670067))

(declare-fun m!670071 () Bool)

(assert (=> bm!34570 m!670071))

(declare-fun m!670073 () Bool)

(assert (=> b!713962 m!670073))

(assert (=> b!713962 m!669999))

(declare-fun m!670075 () Bool)

(assert (=> b!713962 m!670075))

(assert (=> b!713713 d!98057))

(declare-fun b!713986 () Bool)

(declare-fun e!401296 () Bool)

(declare-fun e!401298 () Bool)

(assert (=> b!713986 (= e!401296 e!401298)))

(declare-fun res!477208 () Bool)

(assert (=> b!713986 (=> res!477208 e!401298)))

(declare-fun e!401299 () Bool)

(assert (=> b!713986 (= res!477208 e!401299)))

(declare-fun res!477207 () Bool)

(assert (=> b!713986 (=> (not res!477207) (not e!401299))))

(assert (=> b!713986 (= res!477207 (= (h!14500 acc!652) (h!14500 newAcc!49)))))

(declare-fun b!713987 () Bool)

(assert (=> b!713987 (= e!401299 (subseq!443 (t!19765 acc!652) (t!19765 newAcc!49)))))

(declare-fun b!713985 () Bool)

(declare-fun e!401297 () Bool)

(assert (=> b!713985 (= e!401297 e!401296)))

(declare-fun res!477205 () Bool)

(assert (=> b!713985 (=> (not res!477205) (not e!401296))))

(assert (=> b!713985 (= res!477205 ((_ is Cons!13455) newAcc!49))))

(declare-fun b!713988 () Bool)

(assert (=> b!713988 (= e!401298 (subseq!443 acc!652 (t!19765 newAcc!49)))))

(declare-fun d!98065 () Bool)

(declare-fun res!477206 () Bool)

(assert (=> d!98065 (=> res!477206 e!401297)))

(assert (=> d!98065 (= res!477206 ((_ is Nil!13456) acc!652))))

(assert (=> d!98065 (= (subseq!443 acc!652 newAcc!49) e!401297)))

(assert (= (and d!98065 (not res!477206)) b!713985))

(assert (= (and b!713985 res!477205) b!713986))

(assert (= (and b!713986 res!477207) b!713987))

(assert (= (and b!713986 (not res!477208)) b!713988))

(declare-fun m!670089 () Bool)

(assert (=> b!713987 m!670089))

(declare-fun m!670091 () Bool)

(assert (=> b!713988 m!670091))

(assert (=> b!713714 d!98065))

(check-sat (not b!713852) (not d!98043) (not b!713913) (not d!98053) (not b!713988) (not d!98031) (not b!713896) (not b!713987) (not b!713843) (not d!98049) (not b!713962) (not b!713892) (not b!713861) (not b!713904) (not b!713917) (not b!713846) (not b!713886) (not b!713915) (not bm!34564) (not d!98017) (not b!713845) (not d!98057) (not b!713900) (not b!713899) (not b!713862) (not d!98039) (not bm!34570))
(check-sat)
