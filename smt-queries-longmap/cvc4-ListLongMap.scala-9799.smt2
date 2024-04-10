; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116412 () Bool)

(assert start!116412)

(declare-fun b!1373705 () Bool)

(declare-fun res!916915 () Bool)

(declare-fun e!778168 () Bool)

(assert (=> b!1373705 (=> (not res!916915) (not e!778168))))

(declare-datatypes ((List!32048 0))(
  ( (Nil!32045) (Cons!32044 (h!33253 (_ BitVec 64)) (t!46742 List!32048)) )
))
(declare-fun newAcc!98 () List!32048)

(declare-fun contains!9730 (List!32048 (_ BitVec 64)) Bool)

(assert (=> b!1373705 (= res!916915 (not (contains!9730 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373706 () Bool)

(declare-fun e!778167 () Bool)

(assert (=> b!1373706 (= e!778168 e!778167)))

(declare-fun res!916919 () Bool)

(assert (=> b!1373706 (=> (not res!916919) (not e!778167))))

(declare-datatypes ((array!93145 0))(
  ( (array!93146 (arr!44980 (Array (_ BitVec 32) (_ BitVec 64))) (size!45530 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93145)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun acc!866 () List!32048)

(declare-fun arrayNoDuplicates!0 (array!93145 (_ BitVec 32) List!32048) Bool)

(assert (=> b!1373706 (= res!916919 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45397 0))(
  ( (Unit!45398) )
))
(declare-fun lt!603097 () Unit!45397)

(declare-fun noDuplicateSubseq!319 (List!32048 List!32048) Unit!45397)

(assert (=> b!1373706 (= lt!603097 (noDuplicateSubseq!319 newAcc!98 acc!866))))

(declare-fun b!1373708 () Bool)

(declare-fun res!916921 () Bool)

(assert (=> b!1373708 (=> (not res!916921) (not e!778168))))

(assert (=> b!1373708 (= res!916921 (not (contains!9730 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373709 () Bool)

(declare-fun res!916917 () Bool)

(assert (=> b!1373709 (=> (not res!916917) (not e!778168))))

(assert (=> b!1373709 (= res!916917 (not (contains!9730 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373710 () Bool)

(assert (=> b!1373710 (= e!778167 (not (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98)))))

(declare-fun b!1373711 () Bool)

(declare-fun res!916920 () Bool)

(assert (=> b!1373711 (=> (not res!916920) (not e!778167))))

(assert (=> b!1373711 (= res!916920 (bvsge from!3239 (size!45530 a!3861)))))

(declare-fun b!1373707 () Bool)

(declare-fun res!916913 () Bool)

(assert (=> b!1373707 (=> (not res!916913) (not e!778168))))

(declare-fun subseq!1132 (List!32048 List!32048) Bool)

(assert (=> b!1373707 (= res!916913 (subseq!1132 newAcc!98 acc!866))))

(declare-fun res!916914 () Bool)

(assert (=> start!116412 (=> (not res!916914) (not e!778168))))

(assert (=> start!116412 (= res!916914 (and (bvslt (size!45530 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45530 a!3861))))))

(assert (=> start!116412 e!778168))

(declare-fun array_inv!34008 (array!93145) Bool)

(assert (=> start!116412 (array_inv!34008 a!3861)))

(assert (=> start!116412 true))

(declare-fun b!1373712 () Bool)

(declare-fun res!916918 () Bool)

(assert (=> b!1373712 (=> (not res!916918) (not e!778168))))

(assert (=> b!1373712 (= res!916918 (not (contains!9730 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373713 () Bool)

(declare-fun res!916916 () Bool)

(assert (=> b!1373713 (=> (not res!916916) (not e!778168))))

(declare-fun noDuplicate!2587 (List!32048) Bool)

(assert (=> b!1373713 (= res!916916 (noDuplicate!2587 acc!866))))

(assert (= (and start!116412 res!916914) b!1373713))

(assert (= (and b!1373713 res!916916) b!1373709))

(assert (= (and b!1373709 res!916917) b!1373708))

(assert (= (and b!1373708 res!916921) b!1373712))

(assert (= (and b!1373712 res!916918) b!1373705))

(assert (= (and b!1373705 res!916915) b!1373707))

(assert (= (and b!1373707 res!916913) b!1373706))

(assert (= (and b!1373706 res!916919) b!1373711))

(assert (= (and b!1373711 res!916920) b!1373710))

(declare-fun m!1256909 () Bool)

(assert (=> start!116412 m!1256909))

(declare-fun m!1256911 () Bool)

(assert (=> b!1373709 m!1256911))

(declare-fun m!1256913 () Bool)

(assert (=> b!1373707 m!1256913))

(declare-fun m!1256915 () Bool)

(assert (=> b!1373710 m!1256915))

(declare-fun m!1256917 () Bool)

(assert (=> b!1373712 m!1256917))

(declare-fun m!1256919 () Bool)

(assert (=> b!1373705 m!1256919))

(declare-fun m!1256921 () Bool)

(assert (=> b!1373706 m!1256921))

(declare-fun m!1256923 () Bool)

(assert (=> b!1373706 m!1256923))

(declare-fun m!1256925 () Bool)

(assert (=> b!1373708 m!1256925))

(declare-fun m!1256927 () Bool)

(assert (=> b!1373713 m!1256927))

(push 1)

(assert (not b!1373707))

(assert (not b!1373705))

(assert (not b!1373709))

(assert (not b!1373712))

(assert (not b!1373710))

(assert (not b!1373706))

(assert (not start!116412))

(assert (not b!1373708))

(assert (not b!1373713))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!148045 () Bool)

(assert (=> d!148045 (= (array_inv!34008 a!3861) (bvsge (size!45530 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116412 d!148045))

(declare-fun b!1373754 () Bool)

(declare-fun e!778206 () Bool)

(declare-fun call!65635 () Bool)

(assert (=> b!1373754 (= e!778206 call!65635)))

(declare-fun b!1373755 () Bool)

(declare-fun e!778207 () Bool)

(declare-fun e!778205 () Bool)

(assert (=> b!1373755 (= e!778207 e!778205)))

(declare-fun res!916955 () Bool)

(assert (=> b!1373755 (=> (not res!916955) (not e!778205))))

(declare-fun e!778208 () Bool)

(assert (=> b!1373755 (= res!916955 (not e!778208))))

(declare-fun res!916954 () Bool)

(assert (=> b!1373755 (=> (not res!916954) (not e!778208))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373755 (= res!916954 (validKeyInArray!0 (select (arr!44980 a!3861) from!3239)))))

(declare-fun bm!65632 () Bool)

(declare-fun c!127840 () Bool)

(assert (=> bm!65632 (= call!65635 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127840 (Cons!32044 (select (arr!44980 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1373756 () Bool)

(assert (=> b!1373756 (= e!778205 e!778206)))

(assert (=> b!1373756 (= c!127840 (validKeyInArray!0 (select (arr!44980 a!3861) from!3239)))))

(declare-fun b!1373758 () Bool)

(assert (=> b!1373758 (= e!778206 call!65635)))

(declare-fun b!1373757 () Bool)

(assert (=> b!1373757 (= e!778208 (contains!9730 acc!866 (select (arr!44980 a!3861) from!3239)))))

(declare-fun d!148051 () Bool)

(declare-fun res!916956 () Bool)

(assert (=> d!148051 (=> res!916956 e!778207)))

(assert (=> d!148051 (= res!916956 (bvsge from!3239 (size!45530 a!3861)))))

(assert (=> d!148051 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!778207)))

(assert (= (and d!148051 (not res!916956)) b!1373755))

(assert (= (and b!1373755 res!916954) b!1373757))

(assert (= (and b!1373755 res!916955) b!1373756))

(assert (= (and b!1373756 c!127840) b!1373758))

(assert (= (and b!1373756 (not c!127840)) b!1373754))

(assert (= (or b!1373758 b!1373754) bm!65632))

(declare-fun m!1256961 () Bool)

(assert (=> b!1373755 m!1256961))

(assert (=> b!1373755 m!1256961))

(declare-fun m!1256963 () Bool)

(assert (=> b!1373755 m!1256963))

(assert (=> bm!65632 m!1256961))

(declare-fun m!1256965 () Bool)

(assert (=> bm!65632 m!1256965))

(assert (=> b!1373756 m!1256961))

(assert (=> b!1373756 m!1256961))

(assert (=> b!1373756 m!1256963))

(assert (=> b!1373757 m!1256961))

(assert (=> b!1373757 m!1256961))

(declare-fun m!1256969 () Bool)

(assert (=> b!1373757 m!1256969))

(assert (=> b!1373706 d!148051))

(declare-fun d!148063 () Bool)

(assert (=> d!148063 (noDuplicate!2587 newAcc!98)))

(declare-fun lt!603112 () Unit!45397)

(declare-fun choose!2028 (List!32048 List!32048) Unit!45397)

(assert (=> d!148063 (= lt!603112 (choose!2028 newAcc!98 acc!866))))

(declare-fun e!778225 () Bool)

(assert (=> d!148063 e!778225))

(declare-fun res!916970 () Bool)

(assert (=> d!148063 (=> (not res!916970) (not e!778225))))

(assert (=> d!148063 (= res!916970 (subseq!1132 newAcc!98 acc!866))))

(assert (=> d!148063 (= (noDuplicateSubseq!319 newAcc!98 acc!866) lt!603112)))

(declare-fun b!1373778 () Bool)

(assert (=> b!1373778 (= e!778225 (noDuplicate!2587 acc!866))))

(assert (= (and d!148063 res!916970) b!1373778))

(declare-fun m!1256977 () Bool)

(assert (=> d!148063 m!1256977))

(declare-fun m!1256979 () Bool)

(assert (=> d!148063 m!1256979))

(assert (=> d!148063 m!1256913))

(assert (=> b!1373778 m!1256927))

(assert (=> b!1373706 d!148063))

(declare-fun d!148067 () Bool)

(declare-fun lt!603117 () Bool)

(declare-fun content!755 (List!32048) (Set (_ BitVec 64)))

(assert (=> d!148067 (= lt!603117 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!755 newAcc!98)))))

(declare-fun e!778241 () Bool)

(assert (=> d!148067 (= lt!603117 e!778241)))

(declare-fun res!916984 () Bool)

(assert (=> d!148067 (=> (not res!916984) (not e!778241))))

(assert (=> d!148067 (= res!916984 (is-Cons!32044 newAcc!98))))

(assert (=> d!148067 (= (contains!9730 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603117)))

(declare-fun b!1373796 () Bool)

(declare-fun e!778242 () Bool)

(assert (=> b!1373796 (= e!778241 e!778242)))

(declare-fun res!916985 () Bool)

(assert (=> b!1373796 (=> res!916985 e!778242)))

(assert (=> b!1373796 (= res!916985 (= (h!33253 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373797 () Bool)

(assert (=> b!1373797 (= e!778242 (contains!9730 (t!46742 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148067 res!916984) b!1373796))

(assert (= (and b!1373796 (not res!916985)) b!1373797))

(declare-fun m!1257001 () Bool)

(assert (=> d!148067 m!1257001))

(declare-fun m!1257003 () Bool)

(assert (=> d!148067 m!1257003))

(declare-fun m!1257005 () Bool)

(assert (=> b!1373797 m!1257005))

(assert (=> b!1373705 d!148067))

(declare-fun b!1373800 () Bool)

(declare-fun e!778246 () Bool)

(declare-fun call!65641 () Bool)

(assert (=> b!1373800 (= e!778246 call!65641)))

(declare-fun b!1373801 () Bool)

(declare-fun e!778247 () Bool)

(declare-fun e!778245 () Bool)

(assert (=> b!1373801 (= e!778247 e!778245)))

(declare-fun res!916989 () Bool)

(assert (=> b!1373801 (=> (not res!916989) (not e!778245))))

(declare-fun e!778248 () Bool)

(assert (=> b!1373801 (= res!916989 (not e!778248))))

(declare-fun res!916988 () Bool)

(assert (=> b!1373801 (=> (not res!916988) (not e!778248))))

(assert (=> b!1373801 (= res!916988 (validKeyInArray!0 (select (arr!44980 a!3861) from!3239)))))

(declare-fun c!127846 () Bool)

(declare-fun bm!65638 () Bool)

(assert (=> bm!65638 (= call!65641 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127846 (Cons!32044 (select (arr!44980 a!3861) from!3239) newAcc!98) newAcc!98)))))

(declare-fun b!1373802 () Bool)

(assert (=> b!1373802 (= e!778245 e!778246)))

(assert (=> b!1373802 (= c!127846 (validKeyInArray!0 (select (arr!44980 a!3861) from!3239)))))

(declare-fun b!1373804 () Bool)

(assert (=> b!1373804 (= e!778246 call!65641)))

(declare-fun b!1373803 () Bool)

(assert (=> b!1373803 (= e!778248 (contains!9730 newAcc!98 (select (arr!44980 a!3861) from!3239)))))

(declare-fun d!148079 () Bool)

(declare-fun res!916990 () Bool)

(assert (=> d!148079 (=> res!916990 e!778247)))

(assert (=> d!148079 (= res!916990 (bvsge from!3239 (size!45530 a!3861)))))

(assert (=> d!148079 (= (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98) e!778247)))

(assert (= (and d!148079 (not res!916990)) b!1373801))

(assert (= (and b!1373801 res!916988) b!1373803))

(assert (= (and b!1373801 res!916989) b!1373802))

(assert (= (and b!1373802 c!127846) b!1373804))

(assert (= (and b!1373802 (not c!127846)) b!1373800))

(assert (= (or b!1373804 b!1373800) bm!65638))

(assert (=> b!1373801 m!1256961))

(assert (=> b!1373801 m!1256961))

(assert (=> b!1373801 m!1256963))

(assert (=> bm!65638 m!1256961))

(declare-fun m!1257007 () Bool)

(assert (=> bm!65638 m!1257007))

(assert (=> b!1373802 m!1256961))

(assert (=> b!1373802 m!1256961))

(assert (=> b!1373802 m!1256963))

(assert (=> b!1373803 m!1256961))

(assert (=> b!1373803 m!1256961))

(declare-fun m!1257013 () Bool)

(assert (=> b!1373803 m!1257013))

(assert (=> b!1373710 d!148079))

(declare-fun d!148081 () Bool)

(declare-fun lt!603121 () Bool)

(assert (=> d!148081 (= lt!603121 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!755 acc!866)))))

(declare-fun e!778250 () Bool)

(assert (=> d!148081 (= lt!603121 e!778250)))

(declare-fun res!916992 () Bool)

(assert (=> d!148081 (=> (not res!916992) (not e!778250))))

(assert (=> d!148081 (= res!916992 (is-Cons!32044 acc!866))))

(assert (=> d!148081 (= (contains!9730 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!603121)))

(declare-fun b!1373806 () Bool)

(declare-fun e!778251 () Bool)

(assert (=> b!1373806 (= e!778250 e!778251)))

(declare-fun res!916993 () Bool)

(assert (=> b!1373806 (=> res!916993 e!778251)))

(assert (=> b!1373806 (= res!916993 (= (h!33253 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373807 () Bool)

(assert (=> b!1373807 (= e!778251 (contains!9730 (t!46742 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

