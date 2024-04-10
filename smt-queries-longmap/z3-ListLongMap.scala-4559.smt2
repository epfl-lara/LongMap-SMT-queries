; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63528 () Bool)

(assert start!63528)

(declare-fun b!715906 () Bool)

(declare-fun res!478891 () Bool)

(declare-fun e!401915 () Bool)

(assert (=> b!715906 (=> (not res!478891) (not e!401915))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!715906 (= res!478891 (validKeyInArray!0 k0!2824))))

(declare-fun b!715907 () Bool)

(declare-fun res!478893 () Bool)

(assert (=> b!715907 (=> (not res!478893) (not e!401915))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((List!13449 0))(
  ( (Nil!13446) (Cons!13445 (h!14490 (_ BitVec 64)) (t!19764 List!13449)) )
))
(declare-fun acc!652 () List!13449)

(declare-datatypes ((array!40542 0))(
  ( (array!40543 (arr!19408 (Array (_ BitVec 32) (_ BitVec 64))) (size!19824 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40542)

(declare-fun arrayNoDuplicates!0 (array!40542 (_ BitVec 32) List!13449) Bool)

(assert (=> b!715907 (= res!478893 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!715908 () Bool)

(declare-fun res!478888 () Bool)

(assert (=> b!715908 (=> (not res!478888) (not e!401915))))

(assert (=> b!715908 (= res!478888 (not (validKeyInArray!0 (select (arr!19408 a!3591) from!2969))))))

(declare-fun b!715909 () Bool)

(declare-fun res!478886 () Bool)

(assert (=> b!715909 (=> (not res!478886) (not e!401915))))

(declare-fun contains!4026 (List!13449 (_ BitVec 64)) Bool)

(assert (=> b!715909 (= res!478886 (not (contains!4026 acc!652 k0!2824)))))

(declare-fun b!715910 () Bool)

(declare-fun res!478876 () Bool)

(assert (=> b!715910 (=> (not res!478876) (not e!401915))))

(assert (=> b!715910 (= res!478876 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!715911 () Bool)

(declare-fun res!478880 () Bool)

(assert (=> b!715911 (=> (not res!478880) (not e!401915))))

(declare-fun newAcc!49 () List!13449)

(assert (=> b!715911 (= res!478880 (not (contains!4026 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715912 () Bool)

(declare-fun res!478879 () Bool)

(assert (=> b!715912 (=> (not res!478879) (not e!401915))))

(assert (=> b!715912 (= res!478879 (contains!4026 newAcc!49 k0!2824))))

(declare-fun b!715913 () Bool)

(declare-fun res!478884 () Bool)

(assert (=> b!715913 (=> (not res!478884) (not e!401915))))

(declare-fun noDuplicate!1273 (List!13449) Bool)

(assert (=> b!715913 (= res!478884 (noDuplicate!1273 newAcc!49))))

(declare-fun b!715914 () Bool)

(declare-fun res!478887 () Bool)

(assert (=> b!715914 (=> (not res!478887) (not e!401915))))

(declare-fun subseq!471 (List!13449 List!13449) Bool)

(assert (=> b!715914 (= res!478887 (subseq!471 acc!652 newAcc!49))))

(declare-fun res!478885 () Bool)

(assert (=> start!63528 (=> (not res!478885) (not e!401915))))

(assert (=> start!63528 (= res!478885 (and (bvslt (size!19824 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19824 a!3591))))))

(assert (=> start!63528 e!401915))

(assert (=> start!63528 true))

(declare-fun array_inv!15204 (array!40542) Bool)

(assert (=> start!63528 (array_inv!15204 a!3591)))

(declare-fun b!715915 () Bool)

(declare-fun res!478894 () Bool)

(assert (=> b!715915 (=> (not res!478894) (not e!401915))))

(assert (=> b!715915 (= res!478894 (not (contains!4026 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715916 () Bool)

(declare-fun res!478878 () Bool)

(assert (=> b!715916 (=> (not res!478878) (not e!401915))))

(declare-fun arrayContainsKey!0 (array!40542 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!715916 (= res!478878 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!715917 () Bool)

(declare-fun res!478882 () Bool)

(assert (=> b!715917 (=> (not res!478882) (not e!401915))))

(assert (=> b!715917 (= res!478882 (noDuplicate!1273 acc!652))))

(declare-fun b!715918 () Bool)

(declare-fun res!478883 () Bool)

(assert (=> b!715918 (=> (not res!478883) (not e!401915))))

(assert (=> b!715918 (= res!478883 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!715919 () Bool)

(declare-fun res!478892 () Bool)

(assert (=> b!715919 (=> (not res!478892) (not e!401915))))

(assert (=> b!715919 (= res!478892 (not (contains!4026 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715920 () Bool)

(assert (=> b!715920 (= e!401915 (not (arrayNoDuplicates!0 a!3591 from!2969 newAcc!49)))))

(assert (=> b!715920 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-datatypes ((Unit!24638 0))(
  ( (Unit!24639) )
))
(declare-fun lt!318857 () Unit!24638)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40542 (_ BitVec 64) (_ BitVec 32) List!13449 List!13449) Unit!24638)

(assert (=> b!715920 (= lt!318857 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(declare-fun b!715921 () Bool)

(declare-fun res!478877 () Bool)

(assert (=> b!715921 (=> (not res!478877) (not e!401915))))

(declare-fun -!436 (List!13449 (_ BitVec 64)) List!13449)

(assert (=> b!715921 (= res!478877 (= (-!436 newAcc!49 k0!2824) acc!652))))

(declare-fun b!715922 () Bool)

(declare-fun res!478881 () Bool)

(assert (=> b!715922 (=> (not res!478881) (not e!401915))))

(assert (=> b!715922 (= res!478881 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!715923 () Bool)

(declare-fun res!478890 () Bool)

(assert (=> b!715923 (=> (not res!478890) (not e!401915))))

(assert (=> b!715923 (= res!478890 (not (contains!4026 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715924 () Bool)

(declare-fun res!478889 () Bool)

(assert (=> b!715924 (=> (not res!478889) (not e!401915))))

(assert (=> b!715924 (= res!478889 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19824 a!3591)))))

(assert (= (and start!63528 res!478885) b!715917))

(assert (= (and b!715917 res!478882) b!715913))

(assert (= (and b!715913 res!478884) b!715919))

(assert (= (and b!715919 res!478892) b!715923))

(assert (= (and b!715923 res!478890) b!715918))

(assert (= (and b!715918 res!478883) b!715909))

(assert (= (and b!715909 res!478886) b!715906))

(assert (= (and b!715906 res!478891) b!715907))

(assert (= (and b!715907 res!478893) b!715914))

(assert (= (and b!715914 res!478887) b!715912))

(assert (= (and b!715912 res!478879) b!715921))

(assert (= (and b!715921 res!478877) b!715911))

(assert (= (and b!715911 res!478880) b!715915))

(assert (= (and b!715915 res!478894) b!715924))

(assert (= (and b!715924 res!478889) b!715908))

(assert (= (and b!715908 res!478888) b!715910))

(assert (= (and b!715910 res!478876) b!715916))

(assert (= (and b!715916 res!478878) b!715922))

(assert (= (and b!715922 res!478881) b!715920))

(declare-fun m!671989 () Bool)

(assert (=> b!715912 m!671989))

(declare-fun m!671991 () Bool)

(assert (=> b!715918 m!671991))

(declare-fun m!671993 () Bool)

(assert (=> start!63528 m!671993))

(declare-fun m!671995 () Bool)

(assert (=> b!715907 m!671995))

(declare-fun m!671997 () Bool)

(assert (=> b!715919 m!671997))

(declare-fun m!671999 () Bool)

(assert (=> b!715922 m!671999))

(declare-fun m!672001 () Bool)

(assert (=> b!715917 m!672001))

(declare-fun m!672003 () Bool)

(assert (=> b!715916 m!672003))

(declare-fun m!672005 () Bool)

(assert (=> b!715906 m!672005))

(declare-fun m!672007 () Bool)

(assert (=> b!715920 m!672007))

(declare-fun m!672009 () Bool)

(assert (=> b!715920 m!672009))

(declare-fun m!672011 () Bool)

(assert (=> b!715920 m!672011))

(declare-fun m!672013 () Bool)

(assert (=> b!715913 m!672013))

(declare-fun m!672015 () Bool)

(assert (=> b!715915 m!672015))

(declare-fun m!672017 () Bool)

(assert (=> b!715908 m!672017))

(assert (=> b!715908 m!672017))

(declare-fun m!672019 () Bool)

(assert (=> b!715908 m!672019))

(declare-fun m!672021 () Bool)

(assert (=> b!715923 m!672021))

(declare-fun m!672023 () Bool)

(assert (=> b!715909 m!672023))

(declare-fun m!672025 () Bool)

(assert (=> b!715914 m!672025))

(declare-fun m!672027 () Bool)

(assert (=> b!715911 m!672027))

(declare-fun m!672029 () Bool)

(assert (=> b!715921 m!672029))

(check-sat (not b!715922) (not b!715921) (not b!715920) (not start!63528) (not b!715912) (not b!715918) (not b!715916) (not b!715909) (not b!715917) (not b!715913) (not b!715908) (not b!715919) (not b!715906) (not b!715923) (not b!715914) (not b!715907) (not b!715911) (not b!715915))
(check-sat)
(get-model)

(declare-fun d!98443 () Bool)

(declare-fun res!478956 () Bool)

(declare-fun e!401926 () Bool)

(assert (=> d!98443 (=> res!478956 e!401926)))

(assert (=> d!98443 (= res!478956 (= (select (arr!19408 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k0!2824))))

(assert (=> d!98443 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!401926)))

(declare-fun b!715986 () Bool)

(declare-fun e!401927 () Bool)

(assert (=> b!715986 (= e!401926 e!401927)))

(declare-fun res!478957 () Bool)

(assert (=> b!715986 (=> (not res!478957) (not e!401927))))

(assert (=> b!715986 (= res!478957 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19824 a!3591)))))

(declare-fun b!715987 () Bool)

(assert (=> b!715987 (= e!401927 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98443 (not res!478956)) b!715986))

(assert (= (and b!715986 res!478957) b!715987))

(declare-fun m!672073 () Bool)

(assert (=> d!98443 m!672073))

(declare-fun m!672075 () Bool)

(assert (=> b!715987 m!672075))

(assert (=> b!715916 d!98443))

(declare-fun d!98445 () Bool)

(assert (=> d!98445 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!715906 d!98445))

(declare-fun d!98447 () Bool)

(declare-fun res!478962 () Bool)

(declare-fun e!401932 () Bool)

(assert (=> d!98447 (=> res!478962 e!401932)))

(get-info :version)

(assert (=> d!98447 (= res!478962 ((_ is Nil!13446) acc!652))))

(assert (=> d!98447 (= (noDuplicate!1273 acc!652) e!401932)))

(declare-fun b!715992 () Bool)

(declare-fun e!401933 () Bool)

(assert (=> b!715992 (= e!401932 e!401933)))

(declare-fun res!478963 () Bool)

(assert (=> b!715992 (=> (not res!478963) (not e!401933))))

(assert (=> b!715992 (= res!478963 (not (contains!4026 (t!19764 acc!652) (h!14490 acc!652))))))

(declare-fun b!715993 () Bool)

(assert (=> b!715993 (= e!401933 (noDuplicate!1273 (t!19764 acc!652)))))

(assert (= (and d!98447 (not res!478962)) b!715992))

(assert (= (and b!715992 res!478963) b!715993))

(declare-fun m!672077 () Bool)

(assert (=> b!715992 m!672077))

(declare-fun m!672079 () Bool)

(assert (=> b!715993 m!672079))

(assert (=> b!715917 d!98447))

(declare-fun d!98449 () Bool)

(declare-fun lt!318863 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!370 (List!13449) (InoxSet (_ BitVec 64)))

(assert (=> d!98449 (= lt!318863 (select (content!370 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401938 () Bool)

(assert (=> d!98449 (= lt!318863 e!401938)))

(declare-fun res!478969 () Bool)

(assert (=> d!98449 (=> (not res!478969) (not e!401938))))

(assert (=> d!98449 (= res!478969 ((_ is Cons!13445) newAcc!49))))

(assert (=> d!98449 (= (contains!4026 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318863)))

(declare-fun b!715998 () Bool)

(declare-fun e!401939 () Bool)

(assert (=> b!715998 (= e!401938 e!401939)))

(declare-fun res!478968 () Bool)

(assert (=> b!715998 (=> res!478968 e!401939)))

(assert (=> b!715998 (= res!478968 (= (h!14490 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!715999 () Bool)

(assert (=> b!715999 (= e!401939 (contains!4026 (t!19764 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98449 res!478969) b!715998))

(assert (= (and b!715998 (not res!478968)) b!715999))

(declare-fun m!672081 () Bool)

(assert (=> d!98449 m!672081))

(declare-fun m!672083 () Bool)

(assert (=> d!98449 m!672083))

(declare-fun m!672085 () Bool)

(assert (=> b!715999 m!672085))

(assert (=> b!715915 d!98449))

(declare-fun d!98451 () Bool)

(assert (=> d!98451 (= (validKeyInArray!0 (select (arr!19408 a!3591) from!2969)) (and (not (= (select (arr!19408 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19408 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!715908 d!98451))

(declare-fun d!98453 () Bool)

(declare-fun lt!318864 () Bool)

(assert (=> d!98453 (= lt!318864 (select (content!370 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401940 () Bool)

(assert (=> d!98453 (= lt!318864 e!401940)))

(declare-fun res!478971 () Bool)

(assert (=> d!98453 (=> (not res!478971) (not e!401940))))

(assert (=> d!98453 (= res!478971 ((_ is Cons!13445) acc!652))))

(assert (=> d!98453 (= (contains!4026 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318864)))

(declare-fun b!716000 () Bool)

(declare-fun e!401941 () Bool)

(assert (=> b!716000 (= e!401940 e!401941)))

(declare-fun res!478970 () Bool)

(assert (=> b!716000 (=> res!478970 e!401941)))

(assert (=> b!716000 (= res!478970 (= (h!14490 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!716001 () Bool)

(assert (=> b!716001 (= e!401941 (contains!4026 (t!19764 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98453 res!478971) b!716000))

(assert (= (and b!716000 (not res!478970)) b!716001))

(declare-fun m!672087 () Bool)

(assert (=> d!98453 m!672087))

(declare-fun m!672089 () Bool)

(assert (=> d!98453 m!672089))

(declare-fun m!672091 () Bool)

(assert (=> b!716001 m!672091))

(assert (=> b!715919 d!98453))

(declare-fun d!98455 () Bool)

(declare-fun lt!318865 () Bool)

(assert (=> d!98455 (= lt!318865 (select (content!370 acc!652) k0!2824))))

(declare-fun e!401942 () Bool)

(assert (=> d!98455 (= lt!318865 e!401942)))

(declare-fun res!478973 () Bool)

(assert (=> d!98455 (=> (not res!478973) (not e!401942))))

(assert (=> d!98455 (= res!478973 ((_ is Cons!13445) acc!652))))

(assert (=> d!98455 (= (contains!4026 acc!652 k0!2824) lt!318865)))

(declare-fun b!716002 () Bool)

(declare-fun e!401943 () Bool)

(assert (=> b!716002 (= e!401942 e!401943)))

(declare-fun res!478972 () Bool)

(assert (=> b!716002 (=> res!478972 e!401943)))

(assert (=> b!716002 (= res!478972 (= (h!14490 acc!652) k0!2824))))

(declare-fun b!716003 () Bool)

(assert (=> b!716003 (= e!401943 (contains!4026 (t!19764 acc!652) k0!2824))))

(assert (= (and d!98455 res!478973) b!716002))

(assert (= (and b!716002 (not res!478972)) b!716003))

(assert (=> d!98455 m!672087))

(declare-fun m!672093 () Bool)

(assert (=> d!98455 m!672093))

(declare-fun m!672095 () Bool)

(assert (=> b!716003 m!672095))

(assert (=> b!715909 d!98455))

(declare-fun b!716014 () Bool)

(declare-fun e!401953 () Bool)

(declare-fun e!401954 () Bool)

(assert (=> b!716014 (= e!401953 e!401954)))

(declare-fun c!78884 () Bool)

(assert (=> b!716014 (= c!78884 (validKeyInArray!0 (select (arr!19408 a!3591) from!2969)))))

(declare-fun d!98457 () Bool)

(declare-fun res!478982 () Bool)

(declare-fun e!401955 () Bool)

(assert (=> d!98457 (=> res!478982 e!401955)))

(assert (=> d!98457 (= res!478982 (bvsge from!2969 (size!19824 a!3591)))))

(assert (=> d!98457 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!401955)))

(declare-fun b!716015 () Bool)

(declare-fun call!34635 () Bool)

(assert (=> b!716015 (= e!401954 call!34635)))

(declare-fun b!716016 () Bool)

(declare-fun e!401952 () Bool)

(assert (=> b!716016 (= e!401952 (contains!4026 acc!652 (select (arr!19408 a!3591) from!2969)))))

(declare-fun bm!34632 () Bool)

(assert (=> bm!34632 (= call!34635 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78884 (Cons!13445 (select (arr!19408 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!716017 () Bool)

(assert (=> b!716017 (= e!401955 e!401953)))

(declare-fun res!478980 () Bool)

(assert (=> b!716017 (=> (not res!478980) (not e!401953))))

(assert (=> b!716017 (= res!478980 (not e!401952))))

(declare-fun res!478981 () Bool)

(assert (=> b!716017 (=> (not res!478981) (not e!401952))))

(assert (=> b!716017 (= res!478981 (validKeyInArray!0 (select (arr!19408 a!3591) from!2969)))))

(declare-fun b!716018 () Bool)

(assert (=> b!716018 (= e!401954 call!34635)))

(assert (= (and d!98457 (not res!478982)) b!716017))

(assert (= (and b!716017 res!478981) b!716016))

(assert (= (and b!716017 res!478980) b!716014))

(assert (= (and b!716014 c!78884) b!716018))

(assert (= (and b!716014 (not c!78884)) b!716015))

(assert (= (or b!716018 b!716015) bm!34632))

(assert (=> b!716014 m!672017))

(assert (=> b!716014 m!672017))

(assert (=> b!716014 m!672019))

(assert (=> b!716016 m!672017))

(assert (=> b!716016 m!672017))

(declare-fun m!672097 () Bool)

(assert (=> b!716016 m!672097))

(assert (=> bm!34632 m!672017))

(declare-fun m!672099 () Bool)

(assert (=> bm!34632 m!672099))

(assert (=> b!716017 m!672017))

(assert (=> b!716017 m!672017))

(assert (=> b!716017 m!672019))

(assert (=> b!715907 d!98457))

(declare-fun d!98465 () Bool)

(declare-fun res!478991 () Bool)

(declare-fun e!401964 () Bool)

(assert (=> d!98465 (=> res!478991 e!401964)))

(assert (=> d!98465 (= res!478991 (= (select (arr!19408 a!3591) from!2969) k0!2824))))

(assert (=> d!98465 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!401964)))

(declare-fun b!716027 () Bool)

(declare-fun e!401965 () Bool)

(assert (=> b!716027 (= e!401964 e!401965)))

(declare-fun res!478992 () Bool)

(assert (=> b!716027 (=> (not res!478992) (not e!401965))))

(assert (=> b!716027 (= res!478992 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19824 a!3591)))))

(declare-fun b!716028 () Bool)

(assert (=> b!716028 (= e!401965 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98465 (not res!478991)) b!716027))

(assert (= (and b!716027 res!478992) b!716028))

(assert (=> d!98465 m!672017))

(declare-fun m!672101 () Bool)

(assert (=> b!716028 m!672101))

(assert (=> b!715918 d!98465))

(declare-fun d!98467 () Bool)

(assert (=> d!98467 (= (array_inv!15204 a!3591) (bvsge (size!19824 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63528 d!98467))

(declare-fun d!98471 () Bool)

(declare-fun lt!318866 () Bool)

(assert (=> d!98471 (= lt!318866 (select (content!370 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401970 () Bool)

(assert (=> d!98471 (= lt!318866 e!401970)))

(declare-fun res!478998 () Bool)

(assert (=> d!98471 (=> (not res!478998) (not e!401970))))

(assert (=> d!98471 (= res!478998 ((_ is Cons!13445) newAcc!49))))

(assert (=> d!98471 (= (contains!4026 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318866)))

(declare-fun b!716033 () Bool)

(declare-fun e!401971 () Bool)

(assert (=> b!716033 (= e!401970 e!401971)))

(declare-fun res!478997 () Bool)

(assert (=> b!716033 (=> res!478997 e!401971)))

(assert (=> b!716033 (= res!478997 (= (h!14490 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!716034 () Bool)

(assert (=> b!716034 (= e!401971 (contains!4026 (t!19764 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98471 res!478998) b!716033))

(assert (= (and b!716033 (not res!478997)) b!716034))

(assert (=> d!98471 m!672081))

(declare-fun m!672111 () Bool)

(assert (=> d!98471 m!672111))

(declare-fun m!672113 () Bool)

(assert (=> b!716034 m!672113))

(assert (=> b!715911 d!98471))

(declare-fun b!716035 () Bool)

(declare-fun e!401973 () Bool)

(declare-fun e!401974 () Bool)

(assert (=> b!716035 (= e!401973 e!401974)))

(declare-fun c!78885 () Bool)

(assert (=> b!716035 (= c!78885 (validKeyInArray!0 (select (arr!19408 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun d!98475 () Bool)

(declare-fun res!479001 () Bool)

(declare-fun e!401975 () Bool)

(assert (=> d!98475 (=> res!479001 e!401975)))

(assert (=> d!98475 (= res!479001 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19824 a!3591)))))

(assert (=> d!98475 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652) e!401975)))

(declare-fun b!716036 () Bool)

(declare-fun call!34636 () Bool)

(assert (=> b!716036 (= e!401974 call!34636)))

(declare-fun b!716037 () Bool)

(declare-fun e!401972 () Bool)

(assert (=> b!716037 (= e!401972 (contains!4026 acc!652 (select (arr!19408 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun bm!34633 () Bool)

(assert (=> bm!34633 (= call!34636 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78885 (Cons!13445 (select (arr!19408 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) acc!652) acc!652)))))

(declare-fun b!716038 () Bool)

(assert (=> b!716038 (= e!401975 e!401973)))

(declare-fun res!478999 () Bool)

(assert (=> b!716038 (=> (not res!478999) (not e!401973))))

(assert (=> b!716038 (= res!478999 (not e!401972))))

(declare-fun res!479000 () Bool)

(assert (=> b!716038 (=> (not res!479000) (not e!401972))))

(assert (=> b!716038 (= res!479000 (validKeyInArray!0 (select (arr!19408 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!716039 () Bool)

(assert (=> b!716039 (= e!401974 call!34636)))

(assert (= (and d!98475 (not res!479001)) b!716038))

(assert (= (and b!716038 res!479000) b!716037))

(assert (= (and b!716038 res!478999) b!716035))

(assert (= (and b!716035 c!78885) b!716039))

(assert (= (and b!716035 (not c!78885)) b!716036))

(assert (= (or b!716039 b!716036) bm!34633))

(assert (=> b!716035 m!672073))

(assert (=> b!716035 m!672073))

(declare-fun m!672115 () Bool)

(assert (=> b!716035 m!672115))

(assert (=> b!716037 m!672073))

(assert (=> b!716037 m!672073))

(declare-fun m!672117 () Bool)

(assert (=> b!716037 m!672117))

(assert (=> bm!34633 m!672073))

(declare-fun m!672119 () Bool)

(assert (=> bm!34633 m!672119))

(assert (=> b!716038 m!672073))

(assert (=> b!716038 m!672073))

(assert (=> b!716038 m!672115))

(assert (=> b!715922 d!98475))

(declare-fun b!716040 () Bool)

(declare-fun e!401977 () Bool)

(declare-fun e!401978 () Bool)

(assert (=> b!716040 (= e!401977 e!401978)))

(declare-fun c!78886 () Bool)

(assert (=> b!716040 (= c!78886 (validKeyInArray!0 (select (arr!19408 a!3591) from!2969)))))

(declare-fun d!98481 () Bool)

(declare-fun res!479004 () Bool)

(declare-fun e!401979 () Bool)

(assert (=> d!98481 (=> res!479004 e!401979)))

(assert (=> d!98481 (= res!479004 (bvsge from!2969 (size!19824 a!3591)))))

(assert (=> d!98481 (= (arrayNoDuplicates!0 a!3591 from!2969 newAcc!49) e!401979)))

(declare-fun b!716041 () Bool)

(declare-fun call!34637 () Bool)

(assert (=> b!716041 (= e!401978 call!34637)))

(declare-fun b!716042 () Bool)

(declare-fun e!401976 () Bool)

(assert (=> b!716042 (= e!401976 (contains!4026 newAcc!49 (select (arr!19408 a!3591) from!2969)))))

(declare-fun bm!34634 () Bool)

(assert (=> bm!34634 (= call!34637 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78886 (Cons!13445 (select (arr!19408 a!3591) from!2969) newAcc!49) newAcc!49)))))

(declare-fun b!716043 () Bool)

(assert (=> b!716043 (= e!401979 e!401977)))

(declare-fun res!479002 () Bool)

(assert (=> b!716043 (=> (not res!479002) (not e!401977))))

(assert (=> b!716043 (= res!479002 (not e!401976))))

(declare-fun res!479003 () Bool)

(assert (=> b!716043 (=> (not res!479003) (not e!401976))))

(assert (=> b!716043 (= res!479003 (validKeyInArray!0 (select (arr!19408 a!3591) from!2969)))))

(declare-fun b!716044 () Bool)

(assert (=> b!716044 (= e!401978 call!34637)))

(assert (= (and d!98481 (not res!479004)) b!716043))

(assert (= (and b!716043 res!479003) b!716042))

(assert (= (and b!716043 res!479002) b!716040))

(assert (= (and b!716040 c!78886) b!716044))

(assert (= (and b!716040 (not c!78886)) b!716041))

(assert (= (or b!716044 b!716041) bm!34634))

(assert (=> b!716040 m!672017))

(assert (=> b!716040 m!672017))

(assert (=> b!716040 m!672019))

(assert (=> b!716042 m!672017))

(assert (=> b!716042 m!672017))

(declare-fun m!672121 () Bool)

(assert (=> b!716042 m!672121))

(assert (=> bm!34634 m!672017))

(declare-fun m!672123 () Bool)

(assert (=> bm!34634 m!672123))

(assert (=> b!716043 m!672017))

(assert (=> b!716043 m!672017))

(assert (=> b!716043 m!672019))

(assert (=> b!715920 d!98481))

(declare-fun b!716045 () Bool)

(declare-fun e!401981 () Bool)

(declare-fun e!401982 () Bool)

(assert (=> b!716045 (= e!401981 e!401982)))

(declare-fun c!78887 () Bool)

(assert (=> b!716045 (= c!78887 (validKeyInArray!0 (select (arr!19408 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun d!98483 () Bool)

(declare-fun res!479007 () Bool)

(declare-fun e!401983 () Bool)

(assert (=> d!98483 (=> res!479007 e!401983)))

(assert (=> d!98483 (= res!479007 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19824 a!3591)))))

(assert (=> d!98483 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49) e!401983)))

(declare-fun b!716046 () Bool)

(declare-fun call!34638 () Bool)

(assert (=> b!716046 (= e!401982 call!34638)))

(declare-fun e!401980 () Bool)

(declare-fun b!716047 () Bool)

(assert (=> b!716047 (= e!401980 (contains!4026 newAcc!49 (select (arr!19408 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun bm!34635 () Bool)

(assert (=> bm!34635 (= call!34638 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78887 (Cons!13445 (select (arr!19408 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) newAcc!49) newAcc!49)))))

(declare-fun b!716048 () Bool)

(assert (=> b!716048 (= e!401983 e!401981)))

(declare-fun res!479005 () Bool)

(assert (=> b!716048 (=> (not res!479005) (not e!401981))))

(assert (=> b!716048 (= res!479005 (not e!401980))))

(declare-fun res!479006 () Bool)

(assert (=> b!716048 (=> (not res!479006) (not e!401980))))

(assert (=> b!716048 (= res!479006 (validKeyInArray!0 (select (arr!19408 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!716049 () Bool)

(assert (=> b!716049 (= e!401982 call!34638)))

(assert (= (and d!98483 (not res!479007)) b!716048))

(assert (= (and b!716048 res!479006) b!716047))

(assert (= (and b!716048 res!479005) b!716045))

(assert (= (and b!716045 c!78887) b!716049))

(assert (= (and b!716045 (not c!78887)) b!716046))

(assert (= (or b!716049 b!716046) bm!34635))

(assert (=> b!716045 m!672073))

(assert (=> b!716045 m!672073))

(assert (=> b!716045 m!672115))

(assert (=> b!716047 m!672073))

(assert (=> b!716047 m!672073))

(declare-fun m!672125 () Bool)

(assert (=> b!716047 m!672125))

(assert (=> bm!34635 m!672073))

(declare-fun m!672127 () Bool)

(assert (=> bm!34635 m!672127))

(assert (=> b!716048 m!672073))

(assert (=> b!716048 m!672073))

(assert (=> b!716048 m!672115))

(assert (=> b!715920 d!98483))

(declare-fun d!98485 () Bool)

(assert (=> d!98485 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-fun lt!318872 () Unit!24638)

(declare-fun choose!66 (array!40542 (_ BitVec 64) (_ BitVec 32) List!13449 List!13449) Unit!24638)

(assert (=> d!98485 (= lt!318872 (choose!66 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(assert (=> d!98485 (bvslt (size!19824 a!3591) #b01111111111111111111111111111111)))

(assert (=> d!98485 (= (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49) lt!318872)))

(declare-fun bs!20608 () Bool)

(assert (= bs!20608 d!98485))

(assert (=> bs!20608 m!672009))

(declare-fun m!672135 () Bool)

(assert (=> bs!20608 m!672135))

(assert (=> b!715920 d!98485))

(declare-fun b!716111 () Bool)

(declare-fun e!402033 () List!13449)

(assert (=> b!716111 (= e!402033 Nil!13446)))

(declare-fun d!98489 () Bool)

(declare-fun e!402034 () Bool)

(assert (=> d!98489 e!402034))

(declare-fun res!479043 () Bool)

(assert (=> d!98489 (=> (not res!479043) (not e!402034))))

(declare-fun lt!318878 () List!13449)

(declare-fun size!19826 (List!13449) Int)

(assert (=> d!98489 (= res!479043 (<= (size!19826 lt!318878) (size!19826 newAcc!49)))))

(assert (=> d!98489 (= lt!318878 e!402033)))

(declare-fun c!78901 () Bool)

(assert (=> d!98489 (= c!78901 ((_ is Cons!13445) newAcc!49))))

(assert (=> d!98489 (= (-!436 newAcc!49 k0!2824) lt!318878)))

(declare-fun b!716112 () Bool)

(declare-fun e!402035 () List!13449)

(declare-fun call!34650 () List!13449)

(assert (=> b!716112 (= e!402035 (Cons!13445 (h!14490 newAcc!49) call!34650))))

(declare-fun bm!34647 () Bool)

(assert (=> bm!34647 (= call!34650 (-!436 (t!19764 newAcc!49) k0!2824))))

(declare-fun b!716113 () Bool)

(assert (=> b!716113 (= e!402034 (= (content!370 lt!318878) ((_ map and) (content!370 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun b!716114 () Bool)

(assert (=> b!716114 (= e!402033 e!402035)))

(declare-fun c!78902 () Bool)

(assert (=> b!716114 (= c!78902 (= k0!2824 (h!14490 newAcc!49)))))

(declare-fun b!716115 () Bool)

(assert (=> b!716115 (= e!402035 call!34650)))

(assert (= (and d!98489 c!78901) b!716114))

(assert (= (and d!98489 (not c!78901)) b!716111))

(assert (= (and b!716114 c!78902) b!716115))

(assert (= (and b!716114 (not c!78902)) b!716112))

(assert (= (or b!716115 b!716112) bm!34647))

(assert (= (and d!98489 res!479043) b!716113))

(declare-fun m!672165 () Bool)

(assert (=> d!98489 m!672165))

(declare-fun m!672167 () Bool)

(assert (=> d!98489 m!672167))

(declare-fun m!672169 () Bool)

(assert (=> bm!34647 m!672169))

(declare-fun m!672171 () Bool)

(assert (=> b!716113 m!672171))

(assert (=> b!716113 m!672081))

(declare-fun m!672173 () Bool)

(assert (=> b!716113 m!672173))

(assert (=> b!715921 d!98489))

(declare-fun b!716136 () Bool)

(declare-fun e!402055 () Bool)

(assert (=> b!716136 (= e!402055 (subseq!471 (t!19764 acc!652) (t!19764 newAcc!49)))))

(declare-fun b!716134 () Bool)

(declare-fun e!402057 () Bool)

(declare-fun e!402056 () Bool)

(assert (=> b!716134 (= e!402057 e!402056)))

(declare-fun res!479063 () Bool)

(assert (=> b!716134 (=> (not res!479063) (not e!402056))))

(assert (=> b!716134 (= res!479063 ((_ is Cons!13445) newAcc!49))))

(declare-fun b!716135 () Bool)

(declare-fun e!402054 () Bool)

(assert (=> b!716135 (= e!402056 e!402054)))

(declare-fun res!479062 () Bool)

(assert (=> b!716135 (=> res!479062 e!402054)))

(assert (=> b!716135 (= res!479062 e!402055)))

(declare-fun res!479065 () Bool)

(assert (=> b!716135 (=> (not res!479065) (not e!402055))))

(assert (=> b!716135 (= res!479065 (= (h!14490 acc!652) (h!14490 newAcc!49)))))

(declare-fun d!98503 () Bool)

(declare-fun res!479064 () Bool)

(assert (=> d!98503 (=> res!479064 e!402057)))

(assert (=> d!98503 (= res!479064 ((_ is Nil!13446) acc!652))))

(assert (=> d!98503 (= (subseq!471 acc!652 newAcc!49) e!402057)))

(declare-fun b!716137 () Bool)

(assert (=> b!716137 (= e!402054 (subseq!471 acc!652 (t!19764 newAcc!49)))))

(assert (= (and d!98503 (not res!479064)) b!716134))

(assert (= (and b!716134 res!479063) b!716135))

(assert (= (and b!716135 res!479065) b!716136))

(assert (= (and b!716135 (not res!479062)) b!716137))

(declare-fun m!672193 () Bool)

(assert (=> b!716136 m!672193))

(declare-fun m!672195 () Bool)

(assert (=> b!716137 m!672195))

(assert (=> b!715914 d!98503))

(declare-fun d!98515 () Bool)

(declare-fun lt!318887 () Bool)

(assert (=> d!98515 (= lt!318887 (select (content!370 newAcc!49) k0!2824))))

(declare-fun e!402062 () Bool)

(assert (=> d!98515 (= lt!318887 e!402062)))

(declare-fun res!479071 () Bool)

(assert (=> d!98515 (=> (not res!479071) (not e!402062))))

(assert (=> d!98515 (= res!479071 ((_ is Cons!13445) newAcc!49))))

(assert (=> d!98515 (= (contains!4026 newAcc!49 k0!2824) lt!318887)))

(declare-fun b!716142 () Bool)

(declare-fun e!402063 () Bool)

(assert (=> b!716142 (= e!402062 e!402063)))

(declare-fun res!479070 () Bool)

(assert (=> b!716142 (=> res!479070 e!402063)))

(assert (=> b!716142 (= res!479070 (= (h!14490 newAcc!49) k0!2824))))

(declare-fun b!716143 () Bool)

(assert (=> b!716143 (= e!402063 (contains!4026 (t!19764 newAcc!49) k0!2824))))

(assert (= (and d!98515 res!479071) b!716142))

(assert (= (and b!716142 (not res!479070)) b!716143))

(assert (=> d!98515 m!672081))

(declare-fun m!672197 () Bool)

(assert (=> d!98515 m!672197))

(declare-fun m!672199 () Bool)

(assert (=> b!716143 m!672199))

(assert (=> b!715912 d!98515))

(declare-fun d!98517 () Bool)

(declare-fun lt!318888 () Bool)

(assert (=> d!98517 (= lt!318888 (select (content!370 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!402064 () Bool)

(assert (=> d!98517 (= lt!318888 e!402064)))

(declare-fun res!479073 () Bool)

(assert (=> d!98517 (=> (not res!479073) (not e!402064))))

(assert (=> d!98517 (= res!479073 ((_ is Cons!13445) acc!652))))

(assert (=> d!98517 (= (contains!4026 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318888)))

(declare-fun b!716144 () Bool)

(declare-fun e!402065 () Bool)

(assert (=> b!716144 (= e!402064 e!402065)))

(declare-fun res!479072 () Bool)

(assert (=> b!716144 (=> res!479072 e!402065)))

(assert (=> b!716144 (= res!479072 (= (h!14490 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!716145 () Bool)

(assert (=> b!716145 (= e!402065 (contains!4026 (t!19764 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98517 res!479073) b!716144))

(assert (= (and b!716144 (not res!479072)) b!716145))

(assert (=> d!98517 m!672087))

(declare-fun m!672201 () Bool)

(assert (=> d!98517 m!672201))

(declare-fun m!672203 () Bool)

(assert (=> b!716145 m!672203))

(assert (=> b!715923 d!98517))

(declare-fun d!98519 () Bool)

(declare-fun res!479074 () Bool)

(declare-fun e!402066 () Bool)

(assert (=> d!98519 (=> res!479074 e!402066)))

(assert (=> d!98519 (= res!479074 ((_ is Nil!13446) newAcc!49))))

(assert (=> d!98519 (= (noDuplicate!1273 newAcc!49) e!402066)))

(declare-fun b!716146 () Bool)

(declare-fun e!402067 () Bool)

(assert (=> b!716146 (= e!402066 e!402067)))

(declare-fun res!479075 () Bool)

(assert (=> b!716146 (=> (not res!479075) (not e!402067))))

(assert (=> b!716146 (= res!479075 (not (contains!4026 (t!19764 newAcc!49) (h!14490 newAcc!49))))))

(declare-fun b!716147 () Bool)

(assert (=> b!716147 (= e!402067 (noDuplicate!1273 (t!19764 newAcc!49)))))

(assert (= (and d!98519 (not res!479074)) b!716146))

(assert (= (and b!716146 res!479075) b!716147))

(declare-fun m!672205 () Bool)

(assert (=> b!716146 m!672205))

(declare-fun m!672207 () Bool)

(assert (=> b!716147 m!672207))

(assert (=> b!715913 d!98519))

(check-sat (not b!716001) (not b!716147) (not b!716043) (not b!715987) (not bm!34632) (not b!716016) (not d!98485) (not d!98515) (not b!716143) (not b!716038) (not b!716145) (not b!715993) (not b!716042) (not b!716146) (not b!716137) (not b!716040) (not bm!34635) (not b!715999) (not b!716014) (not b!716034) (not d!98453) (not b!716113) (not b!716017) (not b!716048) (not b!715992) (not b!716003) (not b!716136) (not b!716028) (not b!716035) (not b!716045) (not bm!34633) (not b!716037) (not d!98455) (not d!98471) (not b!716047) (not bm!34634) (not d!98489) (not d!98517) (not bm!34647) (not d!98449))
(check-sat)
