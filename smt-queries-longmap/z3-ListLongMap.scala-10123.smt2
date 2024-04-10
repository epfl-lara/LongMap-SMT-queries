; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119288 () Bool)

(assert start!119288)

(declare-fun b!1391061 () Bool)

(declare-fun res!931078 () Bool)

(declare-fun e!787731 () Bool)

(assert (=> b!1391061 (=> (not res!931078) (not e!787731))))

(declare-datatypes ((array!95174 0))(
  ( (array!95175 (arr!45951 (Array (_ BitVec 32) (_ BitVec 64))) (size!46501 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95174)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95174 (_ BitVec 32)) Bool)

(assert (=> b!1391061 (= res!931078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1391062 () Bool)

(declare-fun res!931076 () Bool)

(assert (=> b!1391062 (=> (not res!931076) (not e!787731))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391062 (= res!931076 (validKeyInArray!0 (select (arr!45951 a!2901) j!112)))))

(declare-fun b!1391063 () Bool)

(declare-fun res!931080 () Bool)

(assert (=> b!1391063 (=> (not res!931080) (not e!787731))))

(declare-datatypes ((List!32470 0))(
  ( (Nil!32467) (Cons!32466 (h!33687 (_ BitVec 64)) (t!47164 List!32470)) )
))
(declare-fun arrayNoDuplicates!0 (array!95174 (_ BitVec 32) List!32470) Bool)

(assert (=> b!1391063 (= res!931080 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32467))))

(declare-fun b!1391064 () Bool)

(declare-fun res!931081 () Bool)

(assert (=> b!1391064 (=> (not res!931081) (not e!787731))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1391064 (= res!931081 (and (= (size!46501 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46501 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46501 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!931079 () Bool)

(assert (=> start!119288 (=> (not res!931079) (not e!787731))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119288 (= res!931079 (validMask!0 mask!2840))))

(assert (=> start!119288 e!787731))

(assert (=> start!119288 true))

(declare-fun array_inv!34979 (array!95174) Bool)

(assert (=> start!119288 (array_inv!34979 a!2901)))

(declare-fun e!787732 () Bool)

(declare-fun b!1391065 () Bool)

(declare-datatypes ((SeekEntryResult!10268 0))(
  ( (MissingZero!10268 (index!43443 (_ BitVec 32))) (Found!10268 (index!43444 (_ BitVec 32))) (Intermediate!10268 (undefined!11080 Bool) (index!43445 (_ BitVec 32)) (x!125120 (_ BitVec 32))) (Undefined!10268) (MissingVacant!10268 (index!43446 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95174 (_ BitVec 32)) SeekEntryResult!10268)

(assert (=> b!1391065 (= e!787732 (= (seekEntryOrOpen!0 (select (arr!45951 a!2901) j!112) a!2901 mask!2840) (Found!10268 j!112)))))

(declare-fun b!1391066 () Bool)

(declare-fun res!931075 () Bool)

(assert (=> b!1391066 (=> (not res!931075) (not e!787731))))

(assert (=> b!1391066 (= res!931075 (validKeyInArray!0 (select (arr!45951 a!2901) i!1037)))))

(declare-fun lt!611051 () (_ BitVec 32))

(declare-fun b!1391067 () Bool)

(declare-fun lt!611050 () SeekEntryResult!10268)

(get-info :version)

(assert (=> b!1391067 (= e!787731 (not (or (not ((_ is Intermediate!10268) lt!611050)) (undefined!11080 lt!611050) (bvslt mask!2840 #b00000000000000000000000000000000) (and (bvsge lt!611051 #b00000000000000000000000000000000) (bvslt lt!611051 (bvadd #b00000000000000000000000000000001 mask!2840))))))))

(assert (=> b!1391067 e!787732))

(declare-fun res!931077 () Bool)

(assert (=> b!1391067 (=> (not res!931077) (not e!787732))))

(assert (=> b!1391067 (= res!931077 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46540 0))(
  ( (Unit!46541) )
))
(declare-fun lt!611052 () Unit!46540)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95174 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46540)

(assert (=> b!1391067 (= lt!611052 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95174 (_ BitVec 32)) SeekEntryResult!10268)

(assert (=> b!1391067 (= lt!611050 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!611051 (select (arr!45951 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391067 (= lt!611051 (toIndex!0 (select (arr!45951 a!2901) j!112) mask!2840))))

(assert (= (and start!119288 res!931079) b!1391064))

(assert (= (and b!1391064 res!931081) b!1391066))

(assert (= (and b!1391066 res!931075) b!1391062))

(assert (= (and b!1391062 res!931076) b!1391061))

(assert (= (and b!1391061 res!931078) b!1391063))

(assert (= (and b!1391063 res!931080) b!1391067))

(assert (= (and b!1391067 res!931077) b!1391065))

(declare-fun m!1276901 () Bool)

(assert (=> start!119288 m!1276901))

(declare-fun m!1276903 () Bool)

(assert (=> start!119288 m!1276903))

(declare-fun m!1276905 () Bool)

(assert (=> b!1391065 m!1276905))

(assert (=> b!1391065 m!1276905))

(declare-fun m!1276907 () Bool)

(assert (=> b!1391065 m!1276907))

(declare-fun m!1276909 () Bool)

(assert (=> b!1391066 m!1276909))

(assert (=> b!1391066 m!1276909))

(declare-fun m!1276911 () Bool)

(assert (=> b!1391066 m!1276911))

(assert (=> b!1391067 m!1276905))

(declare-fun m!1276913 () Bool)

(assert (=> b!1391067 m!1276913))

(assert (=> b!1391067 m!1276905))

(assert (=> b!1391067 m!1276905))

(declare-fun m!1276915 () Bool)

(assert (=> b!1391067 m!1276915))

(declare-fun m!1276917 () Bool)

(assert (=> b!1391067 m!1276917))

(declare-fun m!1276919 () Bool)

(assert (=> b!1391067 m!1276919))

(declare-fun m!1276921 () Bool)

(assert (=> b!1391061 m!1276921))

(declare-fun m!1276923 () Bool)

(assert (=> b!1391063 m!1276923))

(assert (=> b!1391062 m!1276905))

(assert (=> b!1391062 m!1276905))

(declare-fun m!1276925 () Bool)

(assert (=> b!1391062 m!1276925))

(check-sat (not b!1391065) (not b!1391063) (not b!1391066) (not b!1391067) (not b!1391061) (not start!119288) (not b!1391062))
(check-sat)
(get-model)

(declare-fun d!150273 () Bool)

(assert (=> d!150273 (= (validKeyInArray!0 (select (arr!45951 a!2901) i!1037)) (and (not (= (select (arr!45951 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45951 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1391066 d!150273))

(declare-fun b!1391097 () Bool)

(declare-fun e!787750 () Bool)

(declare-fun e!787749 () Bool)

(assert (=> b!1391097 (= e!787750 e!787749)))

(declare-fun c!129441 () Bool)

(assert (=> b!1391097 (= c!129441 (validKeyInArray!0 (select (arr!45951 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1391098 () Bool)

(declare-fun call!66721 () Bool)

(assert (=> b!1391098 (= e!787749 call!66721)))

(declare-fun b!1391099 () Bool)

(declare-fun e!787751 () Bool)

(assert (=> b!1391099 (= e!787749 e!787751)))

(declare-fun lt!611070 () (_ BitVec 64))

(assert (=> b!1391099 (= lt!611070 (select (arr!45951 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!611069 () Unit!46540)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95174 (_ BitVec 64) (_ BitVec 32)) Unit!46540)

(assert (=> b!1391099 (= lt!611069 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611070 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95174 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1391099 (arrayContainsKey!0 a!2901 lt!611070 #b00000000000000000000000000000000)))

(declare-fun lt!611068 () Unit!46540)

(assert (=> b!1391099 (= lt!611068 lt!611069)))

(declare-fun res!931108 () Bool)

(assert (=> b!1391099 (= res!931108 (= (seekEntryOrOpen!0 (select (arr!45951 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10268 #b00000000000000000000000000000000)))))

(assert (=> b!1391099 (=> (not res!931108) (not e!787751))))

(declare-fun b!1391100 () Bool)

(assert (=> b!1391100 (= e!787751 call!66721)))

(declare-fun bm!66718 () Bool)

(assert (=> bm!66718 (= call!66721 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!150275 () Bool)

(declare-fun res!931107 () Bool)

(assert (=> d!150275 (=> res!931107 e!787750)))

(assert (=> d!150275 (= res!931107 (bvsge #b00000000000000000000000000000000 (size!46501 a!2901)))))

(assert (=> d!150275 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!787750)))

(assert (= (and d!150275 (not res!931107)) b!1391097))

(assert (= (and b!1391097 c!129441) b!1391099))

(assert (= (and b!1391097 (not c!129441)) b!1391098))

(assert (= (and b!1391099 res!931108) b!1391100))

(assert (= (or b!1391100 b!1391098) bm!66718))

(declare-fun m!1276953 () Bool)

(assert (=> b!1391097 m!1276953))

(assert (=> b!1391097 m!1276953))

(declare-fun m!1276955 () Bool)

(assert (=> b!1391097 m!1276955))

(assert (=> b!1391099 m!1276953))

(declare-fun m!1276957 () Bool)

(assert (=> b!1391099 m!1276957))

(declare-fun m!1276959 () Bool)

(assert (=> b!1391099 m!1276959))

(assert (=> b!1391099 m!1276953))

(declare-fun m!1276961 () Bool)

(assert (=> b!1391099 m!1276961))

(declare-fun m!1276963 () Bool)

(assert (=> bm!66718 m!1276963))

(assert (=> b!1391061 d!150275))

(declare-fun b!1391101 () Bool)

(declare-fun e!787753 () Bool)

(declare-fun e!787752 () Bool)

(assert (=> b!1391101 (= e!787753 e!787752)))

(declare-fun c!129442 () Bool)

(assert (=> b!1391101 (= c!129442 (validKeyInArray!0 (select (arr!45951 a!2901) j!112)))))

(declare-fun b!1391102 () Bool)

(declare-fun call!66722 () Bool)

(assert (=> b!1391102 (= e!787752 call!66722)))

(declare-fun b!1391103 () Bool)

(declare-fun e!787754 () Bool)

(assert (=> b!1391103 (= e!787752 e!787754)))

(declare-fun lt!611073 () (_ BitVec 64))

(assert (=> b!1391103 (= lt!611073 (select (arr!45951 a!2901) j!112))))

(declare-fun lt!611072 () Unit!46540)

(assert (=> b!1391103 (= lt!611072 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611073 j!112))))

(assert (=> b!1391103 (arrayContainsKey!0 a!2901 lt!611073 #b00000000000000000000000000000000)))

(declare-fun lt!611071 () Unit!46540)

(assert (=> b!1391103 (= lt!611071 lt!611072)))

(declare-fun res!931110 () Bool)

(assert (=> b!1391103 (= res!931110 (= (seekEntryOrOpen!0 (select (arr!45951 a!2901) j!112) a!2901 mask!2840) (Found!10268 j!112)))))

(assert (=> b!1391103 (=> (not res!931110) (not e!787754))))

(declare-fun b!1391104 () Bool)

(assert (=> b!1391104 (= e!787754 call!66722)))

(declare-fun bm!66719 () Bool)

(assert (=> bm!66719 (= call!66722 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!150289 () Bool)

(declare-fun res!931109 () Bool)

(assert (=> d!150289 (=> res!931109 e!787753)))

(assert (=> d!150289 (= res!931109 (bvsge j!112 (size!46501 a!2901)))))

(assert (=> d!150289 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!787753)))

(assert (= (and d!150289 (not res!931109)) b!1391101))

(assert (= (and b!1391101 c!129442) b!1391103))

(assert (= (and b!1391101 (not c!129442)) b!1391102))

(assert (= (and b!1391103 res!931110) b!1391104))

(assert (= (or b!1391104 b!1391102) bm!66719))

(assert (=> b!1391101 m!1276905))

(assert (=> b!1391101 m!1276905))

(assert (=> b!1391101 m!1276925))

(assert (=> b!1391103 m!1276905))

(declare-fun m!1276965 () Bool)

(assert (=> b!1391103 m!1276965))

(declare-fun m!1276967 () Bool)

(assert (=> b!1391103 m!1276967))

(assert (=> b!1391103 m!1276905))

(assert (=> b!1391103 m!1276907))

(declare-fun m!1276969 () Bool)

(assert (=> bm!66719 m!1276969))

(assert (=> b!1391067 d!150289))

(declare-fun d!150291 () Bool)

(assert (=> d!150291 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!611082 () Unit!46540)

(declare-fun choose!38 (array!95174 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46540)

(assert (=> d!150291 (= lt!611082 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150291 (validMask!0 mask!2840)))

(assert (=> d!150291 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!611082)))

(declare-fun bs!40469 () Bool)

(assert (= bs!40469 d!150291))

(assert (=> bs!40469 m!1276919))

(declare-fun m!1276971 () Bool)

(assert (=> bs!40469 m!1276971))

(assert (=> bs!40469 m!1276901))

(assert (=> b!1391067 d!150291))

(declare-fun e!787789 () SeekEntryResult!10268)

(declare-fun b!1391151 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391151 (= e!787789 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!611051 #b00000000000000000000000000000000 mask!2840) (select (arr!45951 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391152 () Bool)

(declare-fun lt!611108 () SeekEntryResult!10268)

(assert (=> b!1391152 (and (bvsge (index!43445 lt!611108) #b00000000000000000000000000000000) (bvslt (index!43445 lt!611108) (size!46501 a!2901)))))

(declare-fun res!931131 () Bool)

(assert (=> b!1391152 (= res!931131 (= (select (arr!45951 a!2901) (index!43445 lt!611108)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!787786 () Bool)

(assert (=> b!1391152 (=> res!931131 e!787786)))

(declare-fun d!150293 () Bool)

(declare-fun e!787787 () Bool)

(assert (=> d!150293 e!787787))

(declare-fun c!129457 () Bool)

(assert (=> d!150293 (= c!129457 (and ((_ is Intermediate!10268) lt!611108) (undefined!11080 lt!611108)))))

(declare-fun e!787790 () SeekEntryResult!10268)

(assert (=> d!150293 (= lt!611108 e!787790)))

(declare-fun c!129458 () Bool)

(assert (=> d!150293 (= c!129458 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!611109 () (_ BitVec 64))

(assert (=> d!150293 (= lt!611109 (select (arr!45951 a!2901) lt!611051))))

(assert (=> d!150293 (validMask!0 mask!2840)))

(assert (=> d!150293 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!611051 (select (arr!45951 a!2901) j!112) a!2901 mask!2840) lt!611108)))

(declare-fun b!1391153 () Bool)

(assert (=> b!1391153 (= e!787790 e!787789)))

(declare-fun c!129456 () Bool)

(assert (=> b!1391153 (= c!129456 (or (= lt!611109 (select (arr!45951 a!2901) j!112)) (= (bvadd lt!611109 lt!611109) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1391154 () Bool)

(assert (=> b!1391154 (= e!787787 (bvsge (x!125120 lt!611108) #b01111111111111111111111111111110))))

(declare-fun b!1391155 () Bool)

(assert (=> b!1391155 (and (bvsge (index!43445 lt!611108) #b00000000000000000000000000000000) (bvslt (index!43445 lt!611108) (size!46501 a!2901)))))

(declare-fun res!931133 () Bool)

(assert (=> b!1391155 (= res!931133 (= (select (arr!45951 a!2901) (index!43445 lt!611108)) (select (arr!45951 a!2901) j!112)))))

(assert (=> b!1391155 (=> res!931133 e!787786)))

(declare-fun e!787788 () Bool)

(assert (=> b!1391155 (= e!787788 e!787786)))

(declare-fun b!1391156 () Bool)

(assert (=> b!1391156 (= e!787790 (Intermediate!10268 true lt!611051 #b00000000000000000000000000000000))))

(declare-fun b!1391157 () Bool)

(assert (=> b!1391157 (and (bvsge (index!43445 lt!611108) #b00000000000000000000000000000000) (bvslt (index!43445 lt!611108) (size!46501 a!2901)))))

(assert (=> b!1391157 (= e!787786 (= (select (arr!45951 a!2901) (index!43445 lt!611108)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1391158 () Bool)

(assert (=> b!1391158 (= e!787787 e!787788)))

(declare-fun res!931132 () Bool)

(assert (=> b!1391158 (= res!931132 (and ((_ is Intermediate!10268) lt!611108) (not (undefined!11080 lt!611108)) (bvslt (x!125120 lt!611108) #b01111111111111111111111111111110) (bvsge (x!125120 lt!611108) #b00000000000000000000000000000000) (bvsge (x!125120 lt!611108) #b00000000000000000000000000000000)))))

(assert (=> b!1391158 (=> (not res!931132) (not e!787788))))

(declare-fun b!1391159 () Bool)

(assert (=> b!1391159 (= e!787789 (Intermediate!10268 false lt!611051 #b00000000000000000000000000000000))))

(assert (= (and d!150293 c!129458) b!1391156))

(assert (= (and d!150293 (not c!129458)) b!1391153))

(assert (= (and b!1391153 c!129456) b!1391159))

(assert (= (and b!1391153 (not c!129456)) b!1391151))

(assert (= (and d!150293 c!129457) b!1391154))

(assert (= (and d!150293 (not c!129457)) b!1391158))

(assert (= (and b!1391158 res!931132) b!1391155))

(assert (= (and b!1391155 (not res!931133)) b!1391152))

(assert (= (and b!1391152 (not res!931131)) b!1391157))

(declare-fun m!1277001 () Bool)

(assert (=> b!1391151 m!1277001))

(assert (=> b!1391151 m!1277001))

(assert (=> b!1391151 m!1276905))

(declare-fun m!1277003 () Bool)

(assert (=> b!1391151 m!1277003))

(declare-fun m!1277005 () Bool)

(assert (=> d!150293 m!1277005))

(assert (=> d!150293 m!1276901))

(declare-fun m!1277007 () Bool)

(assert (=> b!1391155 m!1277007))

(assert (=> b!1391157 m!1277007))

(assert (=> b!1391152 m!1277007))

(assert (=> b!1391067 d!150293))

(declare-fun d!150305 () Bool)

(declare-fun lt!611123 () (_ BitVec 32))

(declare-fun lt!611122 () (_ BitVec 32))

(assert (=> d!150305 (= lt!611123 (bvmul (bvxor lt!611122 (bvlshr lt!611122 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150305 (= lt!611122 ((_ extract 31 0) (bvand (bvxor (select (arr!45951 a!2901) j!112) (bvlshr (select (arr!45951 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150305 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!931134 (let ((h!33689 ((_ extract 31 0) (bvand (bvxor (select (arr!45951 a!2901) j!112) (bvlshr (select (arr!45951 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125124 (bvmul (bvxor h!33689 (bvlshr h!33689 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125124 (bvlshr x!125124 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!931134 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!931134 #b00000000000000000000000000000000))))))

(assert (=> d!150305 (= (toIndex!0 (select (arr!45951 a!2901) j!112) mask!2840) (bvand (bvxor lt!611123 (bvlshr lt!611123 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1391067 d!150305))

(declare-fun d!150307 () Bool)

(assert (=> d!150307 (= (validKeyInArray!0 (select (arr!45951 a!2901) j!112)) (and (not (= (select (arr!45951 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45951 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1391062 d!150307))

(declare-fun b!1391224 () Bool)

(declare-fun e!787829 () Bool)

(declare-fun e!787831 () Bool)

(assert (=> b!1391224 (= e!787829 e!787831)))

(declare-fun res!931161 () Bool)

(assert (=> b!1391224 (=> (not res!931161) (not e!787831))))

(declare-fun e!787832 () Bool)

(assert (=> b!1391224 (= res!931161 (not e!787832))))

(declare-fun res!931163 () Bool)

(assert (=> b!1391224 (=> (not res!931163) (not e!787832))))

(assert (=> b!1391224 (= res!931163 (validKeyInArray!0 (select (arr!45951 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1391225 () Bool)

(declare-fun contains!9764 (List!32470 (_ BitVec 64)) Bool)

(assert (=> b!1391225 (= e!787832 (contains!9764 Nil!32467 (select (arr!45951 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150309 () Bool)

(declare-fun res!931162 () Bool)

(assert (=> d!150309 (=> res!931162 e!787829)))

(assert (=> d!150309 (= res!931162 (bvsge #b00000000000000000000000000000000 (size!46501 a!2901)))))

(assert (=> d!150309 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32467) e!787829)))

(declare-fun b!1391226 () Bool)

(declare-fun e!787830 () Bool)

(declare-fun call!66732 () Bool)

(assert (=> b!1391226 (= e!787830 call!66732)))

(declare-fun bm!66729 () Bool)

(declare-fun c!129479 () Bool)

(assert (=> bm!66729 (= call!66732 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129479 (Cons!32466 (select (arr!45951 a!2901) #b00000000000000000000000000000000) Nil!32467) Nil!32467)))))

(declare-fun b!1391227 () Bool)

(assert (=> b!1391227 (= e!787831 e!787830)))

(assert (=> b!1391227 (= c!129479 (validKeyInArray!0 (select (arr!45951 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1391228 () Bool)

(assert (=> b!1391228 (= e!787830 call!66732)))

(assert (= (and d!150309 (not res!931162)) b!1391224))

(assert (= (and b!1391224 res!931163) b!1391225))

(assert (= (and b!1391224 res!931161) b!1391227))

(assert (= (and b!1391227 c!129479) b!1391228))

(assert (= (and b!1391227 (not c!129479)) b!1391226))

(assert (= (or b!1391228 b!1391226) bm!66729))

(assert (=> b!1391224 m!1276953))

(assert (=> b!1391224 m!1276953))

(assert (=> b!1391224 m!1276955))

(assert (=> b!1391225 m!1276953))

(assert (=> b!1391225 m!1276953))

(declare-fun m!1277025 () Bool)

(assert (=> b!1391225 m!1277025))

(assert (=> bm!66729 m!1276953))

(declare-fun m!1277027 () Bool)

(assert (=> bm!66729 m!1277027))

(assert (=> b!1391227 m!1276953))

(assert (=> b!1391227 m!1276953))

(assert (=> b!1391227 m!1276955))

(assert (=> b!1391063 d!150309))

(declare-fun b!1391273 () Bool)

(declare-fun e!787862 () SeekEntryResult!10268)

(declare-fun lt!611157 () SeekEntryResult!10268)

(assert (=> b!1391273 (= e!787862 (Found!10268 (index!43445 lt!611157)))))

(declare-fun b!1391274 () Bool)

(declare-fun e!787860 () SeekEntryResult!10268)

(assert (=> b!1391274 (= e!787860 e!787862)))

(declare-fun lt!611155 () (_ BitVec 64))

(assert (=> b!1391274 (= lt!611155 (select (arr!45951 a!2901) (index!43445 lt!611157)))))

(declare-fun c!129497 () Bool)

(assert (=> b!1391274 (= c!129497 (= lt!611155 (select (arr!45951 a!2901) j!112)))))

(declare-fun b!1391275 () Bool)

(assert (=> b!1391275 (= e!787860 Undefined!10268)))

(declare-fun b!1391276 () Bool)

(declare-fun e!787861 () SeekEntryResult!10268)

(assert (=> b!1391276 (= e!787861 (MissingZero!10268 (index!43445 lt!611157)))))

(declare-fun b!1391277 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95174 (_ BitVec 32)) SeekEntryResult!10268)

(assert (=> b!1391277 (= e!787861 (seekKeyOrZeroReturnVacant!0 (x!125120 lt!611157) (index!43445 lt!611157) (index!43445 lt!611157) (select (arr!45951 a!2901) j!112) a!2901 mask!2840))))

(declare-fun d!150317 () Bool)

(declare-fun lt!611156 () SeekEntryResult!10268)

(assert (=> d!150317 (and (or ((_ is Undefined!10268) lt!611156) (not ((_ is Found!10268) lt!611156)) (and (bvsge (index!43444 lt!611156) #b00000000000000000000000000000000) (bvslt (index!43444 lt!611156) (size!46501 a!2901)))) (or ((_ is Undefined!10268) lt!611156) ((_ is Found!10268) lt!611156) (not ((_ is MissingZero!10268) lt!611156)) (and (bvsge (index!43443 lt!611156) #b00000000000000000000000000000000) (bvslt (index!43443 lt!611156) (size!46501 a!2901)))) (or ((_ is Undefined!10268) lt!611156) ((_ is Found!10268) lt!611156) ((_ is MissingZero!10268) lt!611156) (not ((_ is MissingVacant!10268) lt!611156)) (and (bvsge (index!43446 lt!611156) #b00000000000000000000000000000000) (bvslt (index!43446 lt!611156) (size!46501 a!2901)))) (or ((_ is Undefined!10268) lt!611156) (ite ((_ is Found!10268) lt!611156) (= (select (arr!45951 a!2901) (index!43444 lt!611156)) (select (arr!45951 a!2901) j!112)) (ite ((_ is MissingZero!10268) lt!611156) (= (select (arr!45951 a!2901) (index!43443 lt!611156)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10268) lt!611156) (= (select (arr!45951 a!2901) (index!43446 lt!611156)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150317 (= lt!611156 e!787860)))

(declare-fun c!129498 () Bool)

(assert (=> d!150317 (= c!129498 (and ((_ is Intermediate!10268) lt!611157) (undefined!11080 lt!611157)))))

(assert (=> d!150317 (= lt!611157 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45951 a!2901) j!112) mask!2840) (select (arr!45951 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150317 (validMask!0 mask!2840)))

(assert (=> d!150317 (= (seekEntryOrOpen!0 (select (arr!45951 a!2901) j!112) a!2901 mask!2840) lt!611156)))

(declare-fun b!1391272 () Bool)

(declare-fun c!129496 () Bool)

(assert (=> b!1391272 (= c!129496 (= lt!611155 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1391272 (= e!787862 e!787861)))

(assert (= (and d!150317 c!129498) b!1391275))

(assert (= (and d!150317 (not c!129498)) b!1391274))

(assert (= (and b!1391274 c!129497) b!1391273))

(assert (= (and b!1391274 (not c!129497)) b!1391272))

(assert (= (and b!1391272 c!129496) b!1391276))

(assert (= (and b!1391272 (not c!129496)) b!1391277))

(declare-fun m!1277045 () Bool)

(assert (=> b!1391274 m!1277045))

(assert (=> b!1391277 m!1276905))

(declare-fun m!1277047 () Bool)

(assert (=> b!1391277 m!1277047))

(declare-fun m!1277049 () Bool)

(assert (=> d!150317 m!1277049))

(declare-fun m!1277051 () Bool)

(assert (=> d!150317 m!1277051))

(assert (=> d!150317 m!1276905))

(assert (=> d!150317 m!1276913))

(declare-fun m!1277053 () Bool)

(assert (=> d!150317 m!1277053))

(assert (=> d!150317 m!1276901))

(assert (=> d!150317 m!1276913))

(assert (=> d!150317 m!1276905))

(declare-fun m!1277055 () Bool)

(assert (=> d!150317 m!1277055))

(assert (=> b!1391065 d!150317))

(declare-fun d!150325 () Bool)

(assert (=> d!150325 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119288 d!150325))

(declare-fun d!150333 () Bool)

(assert (=> d!150333 (= (array_inv!34979 a!2901) (bvsge (size!46501 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119288 d!150333))

(check-sat (not b!1391103) (not d!150293) (not bm!66719) (not b!1391225) (not b!1391099) (not b!1391227) (not d!150317) (not b!1391101) (not b!1391277) (not b!1391224) (not bm!66729) (not b!1391151) (not d!150291) (not b!1391097) (not bm!66718))
(check-sat)
