; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63502 () Bool)

(assert start!63502)

(declare-fun b!714890 () Bool)

(declare-fun res!477802 () Bool)

(declare-fun e!401763 () Bool)

(assert (=> b!714890 (=> (not res!477802) (not e!401763))))

(declare-datatypes ((array!40497 0))(
  ( (array!40498 (arr!19384 (Array (_ BitVec 32) (_ BitVec 64))) (size!19797 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40497)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!714890 (= res!477802 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun res!477811 () Bool)

(assert (=> start!63502 (=> (not res!477811) (not e!401763))))

(assert (=> start!63502 (= res!477811 (and (bvslt (size!19797 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19797 a!3591))))))

(assert (=> start!63502 e!401763))

(assert (=> start!63502 true))

(declare-fun array_inv!15243 (array!40497) Bool)

(assert (=> start!63502 (array_inv!15243 a!3591)))

(declare-fun b!714891 () Bool)

(declare-fun res!477804 () Bool)

(assert (=> b!714891 (=> (not res!477804) (not e!401763))))

(declare-datatypes ((List!13332 0))(
  ( (Nil!13329) (Cons!13328 (h!14376 (_ BitVec 64)) (t!19639 List!13332)) )
))
(declare-fun acc!652 () List!13332)

(declare-fun contains!3984 (List!13332 (_ BitVec 64)) Bool)

(assert (=> b!714891 (= res!477804 (not (contains!3984 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714892 () Bool)

(declare-fun res!477801 () Bool)

(assert (=> b!714892 (=> (not res!477801) (not e!401763))))

(declare-fun newAcc!49 () List!13332)

(assert (=> b!714892 (= res!477801 (not (contains!3984 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714893 () Bool)

(declare-fun res!477812 () Bool)

(assert (=> b!714893 (=> (not res!477812) (not e!401763))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!714893 (= res!477812 (not (validKeyInArray!0 (select (arr!19384 a!3591) from!2969))))))

(declare-fun b!714894 () Bool)

(declare-fun res!477797 () Bool)

(assert (=> b!714894 (=> (not res!477797) (not e!401763))))

(assert (=> b!714894 (= res!477797 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!714895 () Bool)

(declare-fun res!477813 () Bool)

(assert (=> b!714895 (=> (not res!477813) (not e!401763))))

(assert (=> b!714895 (= res!477813 (not (contains!3984 acc!652 k0!2824)))))

(declare-fun b!714896 () Bool)

(declare-fun res!477814 () Bool)

(assert (=> b!714896 (=> (not res!477814) (not e!401763))))

(declare-fun noDuplicate!1258 (List!13332) Bool)

(assert (=> b!714896 (= res!477814 (noDuplicate!1258 acc!652))))

(declare-fun b!714897 () Bool)

(declare-fun res!477808 () Bool)

(assert (=> b!714897 (=> (not res!477808) (not e!401763))))

(assert (=> b!714897 (= res!477808 (not (contains!3984 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714898 () Bool)

(declare-fun res!477799 () Bool)

(assert (=> b!714898 (=> (not res!477799) (not e!401763))))

(declare-fun -!416 (List!13332 (_ BitVec 64)) List!13332)

(assert (=> b!714898 (= res!477799 (= (-!416 newAcc!49 k0!2824) acc!652))))

(declare-fun b!714899 () Bool)

(declare-fun res!477805 () Bool)

(assert (=> b!714899 (=> (not res!477805) (not e!401763))))

(assert (=> b!714899 (= res!477805 (validKeyInArray!0 k0!2824))))

(declare-fun b!714900 () Bool)

(declare-fun res!477798 () Bool)

(assert (=> b!714900 (=> (not res!477798) (not e!401763))))

(assert (=> b!714900 (= res!477798 (contains!3984 newAcc!49 k0!2824))))

(declare-fun b!714901 () Bool)

(declare-fun res!477809 () Bool)

(assert (=> b!714901 (=> (not res!477809) (not e!401763))))

(assert (=> b!714901 (= res!477809 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!714902 () Bool)

(declare-fun res!477807 () Bool)

(assert (=> b!714902 (=> (not res!477807) (not e!401763))))

(assert (=> b!714902 (= res!477807 (noDuplicate!1258 newAcc!49))))

(declare-fun b!714903 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40497 (_ BitVec 32) List!13332) Bool)

(assert (=> b!714903 (= e!401763 (not (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652)))))

(declare-fun b!714904 () Bool)

(declare-fun res!477806 () Bool)

(assert (=> b!714904 (=> (not res!477806) (not e!401763))))

(declare-fun subseq!452 (List!13332 List!13332) Bool)

(assert (=> b!714904 (= res!477806 (subseq!452 acc!652 newAcc!49))))

(declare-fun b!714905 () Bool)

(declare-fun res!477810 () Bool)

(assert (=> b!714905 (=> (not res!477810) (not e!401763))))

(assert (=> b!714905 (= res!477810 (not (contains!3984 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714906 () Bool)

(declare-fun res!477800 () Bool)

(assert (=> b!714906 (=> (not res!477800) (not e!401763))))

(assert (=> b!714906 (= res!477800 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!714907 () Bool)

(declare-fun res!477803 () Bool)

(assert (=> b!714907 (=> (not res!477803) (not e!401763))))

(assert (=> b!714907 (= res!477803 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19797 a!3591)))))

(assert (= (and start!63502 res!477811) b!714896))

(assert (= (and b!714896 res!477814) b!714902))

(assert (= (and b!714902 res!477807) b!714905))

(assert (= (and b!714905 res!477810) b!714891))

(assert (= (and b!714891 res!477804) b!714890))

(assert (= (and b!714890 res!477802) b!714895))

(assert (= (and b!714895 res!477813) b!714899))

(assert (= (and b!714899 res!477805) b!714906))

(assert (= (and b!714906 res!477800) b!714904))

(assert (= (and b!714904 res!477806) b!714900))

(assert (= (and b!714900 res!477798) b!714898))

(assert (= (and b!714898 res!477799) b!714892))

(assert (= (and b!714892 res!477801) b!714897))

(assert (= (and b!714897 res!477808) b!714907))

(assert (= (and b!714907 res!477803) b!714893))

(assert (= (and b!714893 res!477812) b!714901))

(assert (= (and b!714901 res!477809) b!714894))

(assert (= (and b!714894 res!477797) b!714903))

(declare-fun m!671859 () Bool)

(assert (=> b!714904 m!671859))

(declare-fun m!671861 () Bool)

(assert (=> b!714891 m!671861))

(declare-fun m!671863 () Bool)

(assert (=> b!714894 m!671863))

(declare-fun m!671865 () Bool)

(assert (=> b!714890 m!671865))

(declare-fun m!671867 () Bool)

(assert (=> b!714905 m!671867))

(declare-fun m!671869 () Bool)

(assert (=> start!63502 m!671869))

(declare-fun m!671871 () Bool)

(assert (=> b!714906 m!671871))

(declare-fun m!671873 () Bool)

(assert (=> b!714902 m!671873))

(declare-fun m!671875 () Bool)

(assert (=> b!714897 m!671875))

(declare-fun m!671877 () Bool)

(assert (=> b!714893 m!671877))

(assert (=> b!714893 m!671877))

(declare-fun m!671879 () Bool)

(assert (=> b!714893 m!671879))

(declare-fun m!671881 () Bool)

(assert (=> b!714895 m!671881))

(declare-fun m!671883 () Bool)

(assert (=> b!714899 m!671883))

(declare-fun m!671885 () Bool)

(assert (=> b!714898 m!671885))

(declare-fun m!671887 () Bool)

(assert (=> b!714892 m!671887))

(declare-fun m!671889 () Bool)

(assert (=> b!714900 m!671889))

(declare-fun m!671891 () Bool)

(assert (=> b!714896 m!671891))

(declare-fun m!671893 () Bool)

(assert (=> b!714903 m!671893))

(check-sat (not b!714904) (not b!714897) (not b!714894) (not b!714890) (not b!714906) (not b!714902) (not b!714898) (not b!714903) (not b!714892) (not b!714905) (not b!714893) (not b!714891) (not start!63502) (not b!714896) (not b!714895) (not b!714899) (not b!714900))
(check-sat)
(get-model)

(declare-fun b!715026 () Bool)

(declare-fun e!401784 () Bool)

(assert (=> b!715026 (= e!401784 (contains!3984 acc!652 (select (arr!19384 a!3591) from!2969)))))

(declare-fun b!715027 () Bool)

(declare-fun e!401787 () Bool)

(declare-fun call!34620 () Bool)

(assert (=> b!715027 (= e!401787 call!34620)))

(declare-fun b!715028 () Bool)

(assert (=> b!715028 (= e!401787 call!34620)))

(declare-fun c!78917 () Bool)

(declare-fun bm!34617 () Bool)

(assert (=> bm!34617 (= call!34620 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78917 (Cons!13328 (select (arr!19384 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun d!98477 () Bool)

(declare-fun res!477930 () Bool)

(declare-fun e!401785 () Bool)

(assert (=> d!98477 (=> res!477930 e!401785)))

(assert (=> d!98477 (= res!477930 (bvsge from!2969 (size!19797 a!3591)))))

(assert (=> d!98477 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!401785)))

(declare-fun b!715029 () Bool)

(declare-fun e!401786 () Bool)

(assert (=> b!715029 (= e!401785 e!401786)))

(declare-fun res!477929 () Bool)

(assert (=> b!715029 (=> (not res!477929) (not e!401786))))

(assert (=> b!715029 (= res!477929 (not e!401784))))

(declare-fun res!477931 () Bool)

(assert (=> b!715029 (=> (not res!477931) (not e!401784))))

(assert (=> b!715029 (= res!477931 (validKeyInArray!0 (select (arr!19384 a!3591) from!2969)))))

(declare-fun b!715030 () Bool)

(assert (=> b!715030 (= e!401786 e!401787)))

(assert (=> b!715030 (= c!78917 (validKeyInArray!0 (select (arr!19384 a!3591) from!2969)))))

(assert (= (and d!98477 (not res!477930)) b!715029))

(assert (= (and b!715029 res!477931) b!715026))

(assert (= (and b!715029 res!477929) b!715030))

(assert (= (and b!715030 c!78917) b!715027))

(assert (= (and b!715030 (not c!78917)) b!715028))

(assert (= (or b!715027 b!715028) bm!34617))

(assert (=> b!715026 m!671877))

(assert (=> b!715026 m!671877))

(declare-fun m!671967 () Bool)

(assert (=> b!715026 m!671967))

(assert (=> bm!34617 m!671877))

(declare-fun m!671969 () Bool)

(assert (=> bm!34617 m!671969))

(assert (=> b!715029 m!671877))

(assert (=> b!715029 m!671877))

(assert (=> b!715029 m!671879))

(assert (=> b!715030 m!671877))

(assert (=> b!715030 m!671877))

(assert (=> b!715030 m!671879))

(assert (=> b!714906 d!98477))

(declare-fun d!98479 () Bool)

(declare-fun lt!318900 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!368 (List!13332) (InoxSet (_ BitVec 64)))

(assert (=> d!98479 (= lt!318900 (select (content!368 acc!652) k0!2824))))

(declare-fun e!401792 () Bool)

(assert (=> d!98479 (= lt!318900 e!401792)))

(declare-fun res!477936 () Bool)

(assert (=> d!98479 (=> (not res!477936) (not e!401792))))

(get-info :version)

(assert (=> d!98479 (= res!477936 ((_ is Cons!13328) acc!652))))

(assert (=> d!98479 (= (contains!3984 acc!652 k0!2824) lt!318900)))

(declare-fun b!715035 () Bool)

(declare-fun e!401793 () Bool)

(assert (=> b!715035 (= e!401792 e!401793)))

(declare-fun res!477937 () Bool)

(assert (=> b!715035 (=> res!477937 e!401793)))

(assert (=> b!715035 (= res!477937 (= (h!14376 acc!652) k0!2824))))

(declare-fun b!715036 () Bool)

(assert (=> b!715036 (= e!401793 (contains!3984 (t!19639 acc!652) k0!2824))))

(assert (= (and d!98479 res!477936) b!715035))

(assert (= (and b!715035 (not res!477937)) b!715036))

(declare-fun m!671971 () Bool)

(assert (=> d!98479 m!671971))

(declare-fun m!671973 () Bool)

(assert (=> d!98479 m!671973))

(declare-fun m!671975 () Bool)

(assert (=> b!715036 m!671975))

(assert (=> b!714895 d!98479))

(declare-fun d!98481 () Bool)

(declare-fun res!477942 () Bool)

(declare-fun e!401798 () Bool)

(assert (=> d!98481 (=> res!477942 e!401798)))

(assert (=> d!98481 (= res!477942 ((_ is Nil!13329) acc!652))))

(assert (=> d!98481 (= (noDuplicate!1258 acc!652) e!401798)))

(declare-fun b!715041 () Bool)

(declare-fun e!401799 () Bool)

(assert (=> b!715041 (= e!401798 e!401799)))

(declare-fun res!477943 () Bool)

(assert (=> b!715041 (=> (not res!477943) (not e!401799))))

(assert (=> b!715041 (= res!477943 (not (contains!3984 (t!19639 acc!652) (h!14376 acc!652))))))

(declare-fun b!715042 () Bool)

(assert (=> b!715042 (= e!401799 (noDuplicate!1258 (t!19639 acc!652)))))

(assert (= (and d!98481 (not res!477942)) b!715041))

(assert (= (and b!715041 res!477943) b!715042))

(declare-fun m!671977 () Bool)

(assert (=> b!715041 m!671977))

(declare-fun m!671979 () Bool)

(assert (=> b!715042 m!671979))

(assert (=> b!714896 d!98481))

(declare-fun d!98489 () Bool)

(declare-fun lt!318901 () Bool)

(assert (=> d!98489 (= lt!318901 (select (content!368 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401800 () Bool)

(assert (=> d!98489 (= lt!318901 e!401800)))

(declare-fun res!477944 () Bool)

(assert (=> d!98489 (=> (not res!477944) (not e!401800))))

(assert (=> d!98489 (= res!477944 ((_ is Cons!13328) newAcc!49))))

(assert (=> d!98489 (= (contains!3984 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318901)))

(declare-fun b!715043 () Bool)

(declare-fun e!401801 () Bool)

(assert (=> b!715043 (= e!401800 e!401801)))

(declare-fun res!477945 () Bool)

(assert (=> b!715043 (=> res!477945 e!401801)))

(assert (=> b!715043 (= res!477945 (= (h!14376 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!715044 () Bool)

(assert (=> b!715044 (= e!401801 (contains!3984 (t!19639 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98489 res!477944) b!715043))

(assert (= (and b!715043 (not res!477945)) b!715044))

(declare-fun m!671981 () Bool)

(assert (=> d!98489 m!671981))

(declare-fun m!671983 () Bool)

(assert (=> d!98489 m!671983))

(declare-fun m!671985 () Bool)

(assert (=> b!715044 m!671985))

(assert (=> b!714897 d!98489))

(declare-fun e!401806 () Bool)

(declare-fun b!715049 () Bool)

(assert (=> b!715049 (= e!401806 (contains!3984 acc!652 (select (arr!19384 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!715050 () Bool)

(declare-fun e!401809 () Bool)

(declare-fun call!34621 () Bool)

(assert (=> b!715050 (= e!401809 call!34621)))

(declare-fun b!715051 () Bool)

(assert (=> b!715051 (= e!401809 call!34621)))

(declare-fun c!78918 () Bool)

(declare-fun bm!34618 () Bool)

(assert (=> bm!34618 (= call!34621 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78918 (Cons!13328 (select (arr!19384 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) acc!652) acc!652)))))

(declare-fun d!98491 () Bool)

(declare-fun res!477951 () Bool)

(declare-fun e!401807 () Bool)

(assert (=> d!98491 (=> res!477951 e!401807)))

(assert (=> d!98491 (= res!477951 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19797 a!3591)))))

(assert (=> d!98491 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652) e!401807)))

(declare-fun b!715052 () Bool)

(declare-fun e!401808 () Bool)

(assert (=> b!715052 (= e!401807 e!401808)))

(declare-fun res!477950 () Bool)

(assert (=> b!715052 (=> (not res!477950) (not e!401808))))

(assert (=> b!715052 (= res!477950 (not e!401806))))

(declare-fun res!477952 () Bool)

(assert (=> b!715052 (=> (not res!477952) (not e!401806))))

(assert (=> b!715052 (= res!477952 (validKeyInArray!0 (select (arr!19384 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!715053 () Bool)

(assert (=> b!715053 (= e!401808 e!401809)))

(assert (=> b!715053 (= c!78918 (validKeyInArray!0 (select (arr!19384 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(assert (= (and d!98491 (not res!477951)) b!715052))

(assert (= (and b!715052 res!477952) b!715049))

(assert (= (and b!715052 res!477950) b!715053))

(assert (= (and b!715053 c!78918) b!715050))

(assert (= (and b!715053 (not c!78918)) b!715051))

(assert (= (or b!715050 b!715051) bm!34618))

(declare-fun m!671987 () Bool)

(assert (=> b!715049 m!671987))

(assert (=> b!715049 m!671987))

(declare-fun m!671989 () Bool)

(assert (=> b!715049 m!671989))

(assert (=> bm!34618 m!671987))

(declare-fun m!671991 () Bool)

(assert (=> bm!34618 m!671991))

(assert (=> b!715052 m!671987))

(assert (=> b!715052 m!671987))

(declare-fun m!671993 () Bool)

(assert (=> b!715052 m!671993))

(assert (=> b!715053 m!671987))

(assert (=> b!715053 m!671987))

(assert (=> b!715053 m!671993))

(assert (=> b!714903 d!98491))

(declare-fun b!715082 () Bool)

(declare-fun e!401841 () Bool)

(declare-fun e!401840 () Bool)

(assert (=> b!715082 (= e!401841 e!401840)))

(declare-fun res!477983 () Bool)

(assert (=> b!715082 (=> (not res!477983) (not e!401840))))

(assert (=> b!715082 (= res!477983 ((_ is Cons!13328) newAcc!49))))

(declare-fun b!715083 () Bool)

(declare-fun e!401839 () Bool)

(assert (=> b!715083 (= e!401840 e!401839)))

(declare-fun res!477982 () Bool)

(assert (=> b!715083 (=> res!477982 e!401839)))

(declare-fun e!401838 () Bool)

(assert (=> b!715083 (= res!477982 e!401838)))

(declare-fun res!477984 () Bool)

(assert (=> b!715083 (=> (not res!477984) (not e!401838))))

(assert (=> b!715083 (= res!477984 (= (h!14376 acc!652) (h!14376 newAcc!49)))))

(declare-fun b!715084 () Bool)

(assert (=> b!715084 (= e!401838 (subseq!452 (t!19639 acc!652) (t!19639 newAcc!49)))))

(declare-fun d!98493 () Bool)

(declare-fun res!477981 () Bool)

(assert (=> d!98493 (=> res!477981 e!401841)))

(assert (=> d!98493 (= res!477981 ((_ is Nil!13329) acc!652))))

(assert (=> d!98493 (= (subseq!452 acc!652 newAcc!49) e!401841)))

(declare-fun b!715085 () Bool)

(assert (=> b!715085 (= e!401839 (subseq!452 acc!652 (t!19639 newAcc!49)))))

(assert (= (and d!98493 (not res!477981)) b!715082))

(assert (= (and b!715082 res!477983) b!715083))

(assert (= (and b!715083 res!477984) b!715084))

(assert (= (and b!715083 (not res!477982)) b!715085))

(declare-fun m!672009 () Bool)

(assert (=> b!715084 m!672009))

(declare-fun m!672011 () Bool)

(assert (=> b!715085 m!672011))

(assert (=> b!714904 d!98493))

(declare-fun d!98501 () Bool)

(assert (=> d!98501 (= (validKeyInArray!0 (select (arr!19384 a!3591) from!2969)) (and (not (= (select (arr!19384 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19384 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!714893 d!98501))

(declare-fun d!98503 () Bool)

(declare-fun res!478001 () Bool)

(declare-fun e!401860 () Bool)

(assert (=> d!98503 (=> res!478001 e!401860)))

(assert (=> d!98503 (= res!478001 (= (select (arr!19384 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k0!2824))))

(assert (=> d!98503 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!401860)))

(declare-fun b!715106 () Bool)

(declare-fun e!401861 () Bool)

(assert (=> b!715106 (= e!401860 e!401861)))

(declare-fun res!478002 () Bool)

(assert (=> b!715106 (=> (not res!478002) (not e!401861))))

(assert (=> b!715106 (= res!478002 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19797 a!3591)))))

(declare-fun b!715107 () Bool)

(assert (=> b!715107 (= e!401861 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98503 (not res!478001)) b!715106))

(assert (= (and b!715106 res!478002) b!715107))

(assert (=> d!98503 m!671987))

(declare-fun m!672019 () Bool)

(assert (=> b!715107 m!672019))

(assert (=> b!714894 d!98503))

(declare-fun d!98507 () Bool)

(declare-fun lt!318908 () Bool)

(assert (=> d!98507 (= lt!318908 (select (content!368 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401862 () Bool)

(assert (=> d!98507 (= lt!318908 e!401862)))

(declare-fun res!478003 () Bool)

(assert (=> d!98507 (=> (not res!478003) (not e!401862))))

(assert (=> d!98507 (= res!478003 ((_ is Cons!13328) acc!652))))

(assert (=> d!98507 (= (contains!3984 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318908)))

(declare-fun b!715108 () Bool)

(declare-fun e!401863 () Bool)

(assert (=> b!715108 (= e!401862 e!401863)))

(declare-fun res!478004 () Bool)

(assert (=> b!715108 (=> res!478004 e!401863)))

(assert (=> b!715108 (= res!478004 (= (h!14376 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!715109 () Bool)

(assert (=> b!715109 (= e!401863 (contains!3984 (t!19639 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98507 res!478003) b!715108))

(assert (= (and b!715108 (not res!478004)) b!715109))

(assert (=> d!98507 m!671971))

(declare-fun m!672021 () Bool)

(assert (=> d!98507 m!672021))

(declare-fun m!672023 () Bool)

(assert (=> b!715109 m!672023))

(assert (=> b!714905 d!98507))

(declare-fun d!98509 () Bool)

(declare-fun res!478005 () Bool)

(declare-fun e!401864 () Bool)

(assert (=> d!98509 (=> res!478005 e!401864)))

(assert (=> d!98509 (= res!478005 (= (select (arr!19384 a!3591) from!2969) k0!2824))))

(assert (=> d!98509 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!401864)))

(declare-fun b!715110 () Bool)

(declare-fun e!401865 () Bool)

(assert (=> b!715110 (= e!401864 e!401865)))

(declare-fun res!478006 () Bool)

(assert (=> b!715110 (=> (not res!478006) (not e!401865))))

(assert (=> b!715110 (= res!478006 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19797 a!3591)))))

(declare-fun b!715111 () Bool)

(assert (=> b!715111 (= e!401865 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98509 (not res!478005)) b!715110))

(assert (= (and b!715110 res!478006) b!715111))

(assert (=> d!98509 m!671877))

(declare-fun m!672025 () Bool)

(assert (=> b!715111 m!672025))

(assert (=> b!714890 d!98509))

(declare-fun d!98511 () Bool)

(declare-fun res!478007 () Bool)

(declare-fun e!401866 () Bool)

(assert (=> d!98511 (=> res!478007 e!401866)))

(assert (=> d!98511 (= res!478007 ((_ is Nil!13329) newAcc!49))))

(assert (=> d!98511 (= (noDuplicate!1258 newAcc!49) e!401866)))

(declare-fun b!715112 () Bool)

(declare-fun e!401867 () Bool)

(assert (=> b!715112 (= e!401866 e!401867)))

(declare-fun res!478008 () Bool)

(assert (=> b!715112 (=> (not res!478008) (not e!401867))))

(assert (=> b!715112 (= res!478008 (not (contains!3984 (t!19639 newAcc!49) (h!14376 newAcc!49))))))

(declare-fun b!715113 () Bool)

(assert (=> b!715113 (= e!401867 (noDuplicate!1258 (t!19639 newAcc!49)))))

(assert (= (and d!98511 (not res!478007)) b!715112))

(assert (= (and b!715112 res!478008) b!715113))

(declare-fun m!672027 () Bool)

(assert (=> b!715112 m!672027))

(declare-fun m!672029 () Bool)

(assert (=> b!715113 m!672029))

(assert (=> b!714902 d!98511))

(declare-fun d!98513 () Bool)

(declare-fun lt!318909 () Bool)

(assert (=> d!98513 (= lt!318909 (select (content!368 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401868 () Bool)

(assert (=> d!98513 (= lt!318909 e!401868)))

(declare-fun res!478009 () Bool)

(assert (=> d!98513 (=> (not res!478009) (not e!401868))))

(assert (=> d!98513 (= res!478009 ((_ is Cons!13328) acc!652))))

(assert (=> d!98513 (= (contains!3984 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318909)))

(declare-fun b!715114 () Bool)

(declare-fun e!401869 () Bool)

(assert (=> b!715114 (= e!401868 e!401869)))

(declare-fun res!478010 () Bool)

(assert (=> b!715114 (=> res!478010 e!401869)))

(assert (=> b!715114 (= res!478010 (= (h!14376 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!715115 () Bool)

(assert (=> b!715115 (= e!401869 (contains!3984 (t!19639 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98513 res!478009) b!715114))

(assert (= (and b!715114 (not res!478010)) b!715115))

(assert (=> d!98513 m!671971))

(declare-fun m!672031 () Bool)

(assert (=> d!98513 m!672031))

(declare-fun m!672033 () Bool)

(assert (=> b!715115 m!672033))

(assert (=> b!714891 d!98513))

(declare-fun d!98515 () Bool)

(declare-fun lt!318912 () Bool)

(assert (=> d!98515 (= lt!318912 (select (content!368 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401875 () Bool)

(assert (=> d!98515 (= lt!318912 e!401875)))

(declare-fun res!478011 () Bool)

(assert (=> d!98515 (=> (not res!478011) (not e!401875))))

(assert (=> d!98515 (= res!478011 ((_ is Cons!13328) newAcc!49))))

(assert (=> d!98515 (= (contains!3984 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318912)))

(declare-fun b!715124 () Bool)

(declare-fun e!401876 () Bool)

(assert (=> b!715124 (= e!401875 e!401876)))

(declare-fun res!478012 () Bool)

(assert (=> b!715124 (=> res!478012 e!401876)))

(assert (=> b!715124 (= res!478012 (= (h!14376 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!715125 () Bool)

(assert (=> b!715125 (= e!401876 (contains!3984 (t!19639 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98515 res!478011) b!715124))

(assert (= (and b!715124 (not res!478012)) b!715125))

(assert (=> d!98515 m!671981))

(declare-fun m!672035 () Bool)

(assert (=> d!98515 m!672035))

(declare-fun m!672037 () Bool)

(assert (=> b!715125 m!672037))

(assert (=> b!714892 d!98515))

(declare-fun lt!318919 () List!13332)

(declare-fun b!715177 () Bool)

(declare-fun e!401920 () Bool)

(assert (=> b!715177 (= e!401920 (= (content!368 lt!318919) ((_ map and) (content!368 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun d!98517 () Bool)

(assert (=> d!98517 e!401920))

(declare-fun res!478044 () Bool)

(assert (=> d!98517 (=> (not res!478044) (not e!401920))))

(declare-fun size!19801 (List!13332) Int)

(assert (=> d!98517 (= res!478044 (<= (size!19801 lt!318919) (size!19801 newAcc!49)))))

(declare-fun e!401921 () List!13332)

(assert (=> d!98517 (= lt!318919 e!401921)))

(declare-fun c!78935 () Bool)

(assert (=> d!98517 (= c!78935 ((_ is Cons!13328) newAcc!49))))

(assert (=> d!98517 (= (-!416 newAcc!49 k0!2824) lt!318919)))

(declare-fun b!715178 () Bool)

(assert (=> b!715178 (= e!401921 Nil!13329)))

(declare-fun b!715179 () Bool)

(declare-fun e!401919 () List!13332)

(declare-fun call!34633 () List!13332)

(assert (=> b!715179 (= e!401919 (Cons!13328 (h!14376 newAcc!49) call!34633))))

(declare-fun bm!34630 () Bool)

(assert (=> bm!34630 (= call!34633 (-!416 (t!19639 newAcc!49) k0!2824))))

(declare-fun b!715180 () Bool)

(assert (=> b!715180 (= e!401919 call!34633)))

(declare-fun b!715181 () Bool)

(assert (=> b!715181 (= e!401921 e!401919)))

(declare-fun c!78936 () Bool)

(assert (=> b!715181 (= c!78936 (= k0!2824 (h!14376 newAcc!49)))))

(assert (= (and d!98517 c!78935) b!715181))

(assert (= (and d!98517 (not c!78935)) b!715178))

(assert (= (and b!715181 c!78936) b!715180))

(assert (= (and b!715181 (not c!78936)) b!715179))

(assert (= (or b!715180 b!715179) bm!34630))

(assert (= (and d!98517 res!478044) b!715177))

(declare-fun m!672081 () Bool)

(assert (=> b!715177 m!672081))

(assert (=> b!715177 m!671981))

(declare-fun m!672087 () Bool)

(assert (=> b!715177 m!672087))

(declare-fun m!672089 () Bool)

(assert (=> d!98517 m!672089))

(declare-fun m!672091 () Bool)

(assert (=> d!98517 m!672091))

(declare-fun m!672093 () Bool)

(assert (=> bm!34630 m!672093))

(assert (=> b!714898 d!98517))

(declare-fun d!98543 () Bool)

(assert (=> d!98543 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!714899 d!98543))

(declare-fun d!98545 () Bool)

(declare-fun lt!318922 () Bool)

(assert (=> d!98545 (= lt!318922 (select (content!368 newAcc!49) k0!2824))))

(declare-fun e!401926 () Bool)

(assert (=> d!98545 (= lt!318922 e!401926)))

(declare-fun res!478049 () Bool)

(assert (=> d!98545 (=> (not res!478049) (not e!401926))))

(assert (=> d!98545 (= res!478049 ((_ is Cons!13328) newAcc!49))))

(assert (=> d!98545 (= (contains!3984 newAcc!49 k0!2824) lt!318922)))

(declare-fun b!715186 () Bool)

(declare-fun e!401927 () Bool)

(assert (=> b!715186 (= e!401926 e!401927)))

(declare-fun res!478050 () Bool)

(assert (=> b!715186 (=> res!478050 e!401927)))

(assert (=> b!715186 (= res!478050 (= (h!14376 newAcc!49) k0!2824))))

(declare-fun b!715187 () Bool)

(assert (=> b!715187 (= e!401927 (contains!3984 (t!19639 newAcc!49) k0!2824))))

(assert (= (and d!98545 res!478049) b!715186))

(assert (= (and b!715186 (not res!478050)) b!715187))

(assert (=> d!98545 m!671981))

(declare-fun m!672099 () Bool)

(assert (=> d!98545 m!672099))

(declare-fun m!672101 () Bool)

(assert (=> b!715187 m!672101))

(assert (=> b!714900 d!98545))

(declare-fun d!98549 () Bool)

(assert (=> d!98549 (= (array_inv!15243 a!3591) (bvsge (size!19797 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63502 d!98549))

(check-sat (not d!98513) (not d!98479) (not b!715109) (not b!715042) (not b!715049) (not b!715041) (not d!98545) (not b!715115) (not b!715112) (not b!715085) (not b!715113) (not b!715053) (not b!715052) (not b!715107) (not b!715111) (not b!715030) (not b!715125) (not b!715029) (not b!715044) (not b!715187) (not d!98489) (not b!715084) (not bm!34618) (not b!715026) (not bm!34630) (not bm!34617) (not d!98515) (not d!98507) (not b!715036) (not b!715177) (not d!98517))
(check-sat)
