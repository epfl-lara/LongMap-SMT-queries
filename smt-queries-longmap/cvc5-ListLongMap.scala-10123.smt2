; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119286 () Bool)

(assert start!119286)

(declare-fun b!1391040 () Bool)

(declare-fun res!931056 () Bool)

(declare-fun e!787722 () Bool)

(assert (=> b!1391040 (=> (not res!931056) (not e!787722))))

(declare-datatypes ((array!95172 0))(
  ( (array!95173 (arr!45950 (Array (_ BitVec 32) (_ BitVec 64))) (size!46500 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95172)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391040 (= res!931056 (validKeyInArray!0 (select (arr!45950 a!2901) j!112)))))

(declare-fun b!1391042 () Bool)

(declare-fun res!931060 () Bool)

(assert (=> b!1391042 (=> (not res!931060) (not e!787722))))

(declare-datatypes ((List!32469 0))(
  ( (Nil!32466) (Cons!32465 (h!33686 (_ BitVec 64)) (t!47163 List!32469)) )
))
(declare-fun arrayNoDuplicates!0 (array!95172 (_ BitVec 32) List!32469) Bool)

(assert (=> b!1391042 (= res!931060 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32466))))

(declare-fun b!1391043 () Bool)

(declare-fun res!931057 () Bool)

(assert (=> b!1391043 (=> (not res!931057) (not e!787722))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1391043 (= res!931057 (and (= (size!46500 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46500 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46500 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391044 () Bool)

(declare-fun e!787724 () Bool)

(declare-datatypes ((SeekEntryResult!10267 0))(
  ( (MissingZero!10267 (index!43439 (_ BitVec 32))) (Found!10267 (index!43440 (_ BitVec 32))) (Intermediate!10267 (undefined!11079 Bool) (index!43441 (_ BitVec 32)) (x!125119 (_ BitVec 32))) (Undefined!10267) (MissingVacant!10267 (index!43442 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95172 (_ BitVec 32)) SeekEntryResult!10267)

(assert (=> b!1391044 (= e!787724 (= (seekEntryOrOpen!0 (select (arr!45950 a!2901) j!112) a!2901 mask!2840) (Found!10267 j!112)))))

(declare-fun b!1391045 () Bool)

(declare-fun res!931054 () Bool)

(assert (=> b!1391045 (=> (not res!931054) (not e!787722))))

(assert (=> b!1391045 (= res!931054 (validKeyInArray!0 (select (arr!45950 a!2901) i!1037)))))

(declare-fun b!1391046 () Bool)

(declare-fun res!931058 () Bool)

(assert (=> b!1391046 (=> (not res!931058) (not e!787722))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95172 (_ BitVec 32)) Bool)

(assert (=> b!1391046 (= res!931058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!931055 () Bool)

(assert (=> start!119286 (=> (not res!931055) (not e!787722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119286 (= res!931055 (validMask!0 mask!2840))))

(assert (=> start!119286 e!787722))

(assert (=> start!119286 true))

(declare-fun array_inv!34978 (array!95172) Bool)

(assert (=> start!119286 (array_inv!34978 a!2901)))

(declare-fun lt!611043 () (_ BitVec 32))

(declare-fun lt!611042 () SeekEntryResult!10267)

(declare-fun b!1391041 () Bool)

(assert (=> b!1391041 (= e!787722 (not (or (not (is-Intermediate!10267 lt!611042)) (undefined!11079 lt!611042) (bvslt mask!2840 #b00000000000000000000000000000000) (and (bvsge lt!611043 #b00000000000000000000000000000000) (bvslt lt!611043 (bvadd #b00000000000000000000000000000001 mask!2840))))))))

(assert (=> b!1391041 e!787724))

(declare-fun res!931059 () Bool)

(assert (=> b!1391041 (=> (not res!931059) (not e!787724))))

(assert (=> b!1391041 (= res!931059 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46538 0))(
  ( (Unit!46539) )
))
(declare-fun lt!611041 () Unit!46538)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95172 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46538)

(assert (=> b!1391041 (= lt!611041 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95172 (_ BitVec 32)) SeekEntryResult!10267)

(assert (=> b!1391041 (= lt!611042 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!611043 (select (arr!45950 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391041 (= lt!611043 (toIndex!0 (select (arr!45950 a!2901) j!112) mask!2840))))

(assert (= (and start!119286 res!931055) b!1391043))

(assert (= (and b!1391043 res!931057) b!1391045))

(assert (= (and b!1391045 res!931054) b!1391040))

(assert (= (and b!1391040 res!931056) b!1391046))

(assert (= (and b!1391046 res!931058) b!1391042))

(assert (= (and b!1391042 res!931060) b!1391041))

(assert (= (and b!1391041 res!931059) b!1391044))

(declare-fun m!1276875 () Bool)

(assert (=> b!1391041 m!1276875))

(declare-fun m!1276877 () Bool)

(assert (=> b!1391041 m!1276877))

(assert (=> b!1391041 m!1276875))

(assert (=> b!1391041 m!1276875))

(declare-fun m!1276879 () Bool)

(assert (=> b!1391041 m!1276879))

(declare-fun m!1276881 () Bool)

(assert (=> b!1391041 m!1276881))

(declare-fun m!1276883 () Bool)

(assert (=> b!1391041 m!1276883))

(declare-fun m!1276885 () Bool)

(assert (=> b!1391045 m!1276885))

(assert (=> b!1391045 m!1276885))

(declare-fun m!1276887 () Bool)

(assert (=> b!1391045 m!1276887))

(declare-fun m!1276889 () Bool)

(assert (=> b!1391046 m!1276889))

(declare-fun m!1276891 () Bool)

(assert (=> b!1391042 m!1276891))

(assert (=> b!1391040 m!1276875))

(assert (=> b!1391040 m!1276875))

(declare-fun m!1276893 () Bool)

(assert (=> b!1391040 m!1276893))

(declare-fun m!1276895 () Bool)

(assert (=> start!119286 m!1276895))

(declare-fun m!1276897 () Bool)

(assert (=> start!119286 m!1276897))

(assert (=> b!1391044 m!1276875))

(assert (=> b!1391044 m!1276875))

(declare-fun m!1276899 () Bool)

(assert (=> b!1391044 m!1276899))

(push 1)

(assert (not b!1391045))

(assert (not b!1391041))

(assert (not start!119286))

(assert (not b!1391044))

(assert (not b!1391046))

(assert (not b!1391042))

(assert (not b!1391040))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!150277 () Bool)

(assert (=> d!150277 (= (validKeyInArray!0 (select (arr!45950 a!2901) i!1037)) (and (not (= (select (arr!45950 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45950 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1391045 d!150277))

(declare-fun d!150279 () Bool)

(assert (=> d!150279 (= (validKeyInArray!0 (select (arr!45950 a!2901) j!112)) (and (not (= (select (arr!45950 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45950 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1391040 d!150279))

(declare-fun b!1391121 () Bool)

(declare-fun e!787769 () Bool)

(declare-fun call!66725 () Bool)

(assert (=> b!1391121 (= e!787769 call!66725)))

(declare-fun d!150281 () Bool)

(declare-fun res!931120 () Bool)

(declare-fun e!787767 () Bool)

(assert (=> d!150281 (=> res!931120 e!787767)))

(assert (=> d!150281 (= res!931120 (bvsge #b00000000000000000000000000000000 (size!46500 a!2901)))))

(assert (=> d!150281 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!787767)))

(declare-fun b!1391122 () Bool)

(declare-fun e!787768 () Bool)

(assert (=> b!1391122 (= e!787769 e!787768)))

(declare-fun lt!611091 () (_ BitVec 64))

(assert (=> b!1391122 (= lt!611091 (select (arr!45950 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!611090 () Unit!46538)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95172 (_ BitVec 64) (_ BitVec 32)) Unit!46538)

(assert (=> b!1391122 (= lt!611090 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611091 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95172 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1391122 (arrayContainsKey!0 a!2901 lt!611091 #b00000000000000000000000000000000)))

(declare-fun lt!611089 () Unit!46538)

(assert (=> b!1391122 (= lt!611089 lt!611090)))

(declare-fun res!931119 () Bool)

(assert (=> b!1391122 (= res!931119 (= (seekEntryOrOpen!0 (select (arr!45950 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10267 #b00000000000000000000000000000000)))))

(assert (=> b!1391122 (=> (not res!931119) (not e!787768))))

(declare-fun b!1391123 () Bool)

(assert (=> b!1391123 (= e!787767 e!787769)))

(declare-fun c!129447 () Bool)

(assert (=> b!1391123 (= c!129447 (validKeyInArray!0 (select (arr!45950 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66722 () Bool)

(assert (=> bm!66722 (= call!66725 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1391124 () Bool)

(assert (=> b!1391124 (= e!787768 call!66725)))

(assert (= (and d!150281 (not res!931120)) b!1391123))

(assert (= (and b!1391123 c!129447) b!1391122))

(assert (= (and b!1391123 (not c!129447)) b!1391121))

(assert (= (and b!1391122 res!931119) b!1391124))

(assert (= (or b!1391124 b!1391121) bm!66722))

(declare-fun m!1276973 () Bool)

(assert (=> b!1391122 m!1276973))

(declare-fun m!1276975 () Bool)

(assert (=> b!1391122 m!1276975))

(declare-fun m!1276977 () Bool)

(assert (=> b!1391122 m!1276977))

(assert (=> b!1391122 m!1276973))

(declare-fun m!1276979 () Bool)

(assert (=> b!1391122 m!1276979))

(assert (=> b!1391123 m!1276973))

(assert (=> b!1391123 m!1276973))

(declare-fun m!1276981 () Bool)

(assert (=> b!1391123 m!1276981))

(declare-fun m!1276983 () Bool)

(assert (=> bm!66722 m!1276983))

(assert (=> b!1391046 d!150281))

(declare-fun b!1391125 () Bool)

(declare-fun e!787772 () Bool)

(declare-fun call!66728 () Bool)

(assert (=> b!1391125 (= e!787772 call!66728)))

(declare-fun d!150295 () Bool)

(declare-fun res!931122 () Bool)

(declare-fun e!787770 () Bool)

(assert (=> d!150295 (=> res!931122 e!787770)))

(assert (=> d!150295 (= res!931122 (bvsge j!112 (size!46500 a!2901)))))

(assert (=> d!150295 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!787770)))

(declare-fun b!1391126 () Bool)

(declare-fun e!787771 () Bool)

(assert (=> b!1391126 (= e!787772 e!787771)))

(declare-fun lt!611094 () (_ BitVec 64))

(assert (=> b!1391126 (= lt!611094 (select (arr!45950 a!2901) j!112))))

(declare-fun lt!611093 () Unit!46538)

(assert (=> b!1391126 (= lt!611093 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611094 j!112))))

(assert (=> b!1391126 (arrayContainsKey!0 a!2901 lt!611094 #b00000000000000000000000000000000)))

(declare-fun lt!611092 () Unit!46538)

(assert (=> b!1391126 (= lt!611092 lt!611093)))

(declare-fun res!931121 () Bool)

(assert (=> b!1391126 (= res!931121 (= (seekEntryOrOpen!0 (select (arr!45950 a!2901) j!112) a!2901 mask!2840) (Found!10267 j!112)))))

(assert (=> b!1391126 (=> (not res!931121) (not e!787771))))

(declare-fun b!1391127 () Bool)

(assert (=> b!1391127 (= e!787770 e!787772)))

(declare-fun c!129448 () Bool)

(assert (=> b!1391127 (= c!129448 (validKeyInArray!0 (select (arr!45950 a!2901) j!112)))))

(declare-fun bm!66725 () Bool)

(assert (=> bm!66725 (= call!66728 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1391128 () Bool)

(assert (=> b!1391128 (= e!787771 call!66728)))

(assert (= (and d!150295 (not res!931122)) b!1391127))

(assert (= (and b!1391127 c!129448) b!1391126))

(assert (= (and b!1391127 (not c!129448)) b!1391125))

(assert (= (and b!1391126 res!931121) b!1391128))

(assert (= (or b!1391128 b!1391125) bm!66725))

(assert (=> b!1391126 m!1276875))

(declare-fun m!1276985 () Bool)

(assert (=> b!1391126 m!1276985))

(declare-fun m!1276987 () Bool)

(assert (=> b!1391126 m!1276987))

(assert (=> b!1391126 m!1276875))

(assert (=> b!1391126 m!1276899))

(assert (=> b!1391127 m!1276875))

(assert (=> b!1391127 m!1276875))

(assert (=> b!1391127 m!1276893))

(declare-fun m!1276989 () Bool)

(assert (=> bm!66725 m!1276989))

(assert (=> b!1391041 d!150295))

(declare-fun d!150297 () Bool)

(assert (=> d!150297 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!611100 () Unit!46538)

(declare-fun choose!38 (array!95172 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46538)

(assert (=> d!150297 (= lt!611100 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150297 (validMask!0 mask!2840)))

(assert (=> d!150297 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!611100)))

(declare-fun bs!40470 () Bool)

(assert (= bs!40470 d!150297))

(assert (=> bs!40470 m!1276883))

(declare-fun m!1276997 () Bool)

(assert (=> bs!40470 m!1276997))

(assert (=> bs!40470 m!1276895))

(assert (=> b!1391041 d!150297))

(declare-fun b!1391196 () Bool)

(declare-fun lt!611125 () SeekEntryResult!10267)

(assert (=> b!1391196 (and (bvsge (index!43441 lt!611125) #b00000000000000000000000000000000) (bvslt (index!43441 lt!611125) (size!46500 a!2901)))))

(declare-fun res!931149 () Bool)

(assert (=> b!1391196 (= res!931149 (= (select (arr!45950 a!2901) (index!43441 lt!611125)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!787811 () Bool)

(assert (=> b!1391196 (=> res!931149 e!787811)))

(declare-fun b!1391198 () Bool)

(declare-fun e!787812 () SeekEntryResult!10267)

(declare-fun e!787815 () SeekEntryResult!10267)

(assert (=> b!1391198 (= e!787812 e!787815)))

(declare-fun c!129472 () Bool)

(declare-fun lt!611124 () (_ BitVec 64))

(assert (=> b!1391198 (= c!129472 (or (= lt!611124 (select (arr!45950 a!2901) j!112)) (= (bvadd lt!611124 lt!611124) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1391199 () Bool)

(assert (=> b!1391199 (and (bvsge (index!43441 lt!611125) #b00000000000000000000000000000000) (bvslt (index!43441 lt!611125) (size!46500 a!2901)))))

(declare-fun res!931148 () Bool)

(assert (=> b!1391199 (= res!931148 (= (select (arr!45950 a!2901) (index!43441 lt!611125)) (select (arr!45950 a!2901) j!112)))))

(assert (=> b!1391199 (=> res!931148 e!787811)))

(declare-fun e!787813 () Bool)

(assert (=> b!1391199 (= e!787813 e!787811)))

(declare-fun b!1391200 () Bool)

(declare-fun e!787814 () Bool)

(assert (=> b!1391200 (= e!787814 (bvsge (x!125119 lt!611125) #b01111111111111111111111111111110))))

(declare-fun b!1391201 () Bool)

(assert (=> b!1391201 (and (bvsge (index!43441 lt!611125) #b00000000000000000000000000000000) (bvslt (index!43441 lt!611125) (size!46500 a!2901)))))

(assert (=> b!1391201 (= e!787811 (= (select (arr!45950 a!2901) (index!43441 lt!611125)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1391202 () Bool)

(assert (=> b!1391202 (= e!787814 e!787813)))

(declare-fun res!931147 () Bool)

(assert (=> b!1391202 (= res!931147 (and (is-Intermediate!10267 lt!611125) (not (undefined!11079 lt!611125)) (bvslt (x!125119 lt!611125) #b01111111111111111111111111111110) (bvsge (x!125119 lt!611125) #b00000000000000000000000000000000) (bvsge (x!125119 lt!611125) #b00000000000000000000000000000000)))))

(assert (=> b!1391202 (=> (not res!931147) (not e!787813))))

(declare-fun b!1391197 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391197 (= e!787815 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!611043 #b00000000000000000000000000000000 mask!2840) (select (arr!45950 a!2901) j!112) a!2901 mask!2840))))

(declare-fun d!150301 () Bool)

(assert (=> d!150301 e!787814))

(declare-fun c!129473 () Bool)

(assert (=> d!150301 (= c!129473 (and (is-Intermediate!10267 lt!611125) (undefined!11079 lt!611125)))))

(assert (=> d!150301 (= lt!611125 e!787812)))

(declare-fun c!129471 () Bool)

(assert (=> d!150301 (= c!129471 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150301 (= lt!611124 (select (arr!45950 a!2901) lt!611043))))

(assert (=> d!150301 (validMask!0 mask!2840)))

(assert (=> d!150301 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!611043 (select (arr!45950 a!2901) j!112) a!2901 mask!2840) lt!611125)))

(declare-fun b!1391203 () Bool)

(assert (=> b!1391203 (= e!787812 (Intermediate!10267 true lt!611043 #b00000000000000000000000000000000))))

(declare-fun b!1391204 () Bool)

(assert (=> b!1391204 (= e!787815 (Intermediate!10267 false lt!611043 #b00000000000000000000000000000000))))

(assert (= (and d!150301 c!129471) b!1391203))

(assert (= (and d!150301 (not c!129471)) b!1391198))

(assert (= (and b!1391198 c!129472) b!1391204))

(assert (= (and b!1391198 (not c!129472)) b!1391197))

(assert (= (and d!150301 c!129473) b!1391200))

(assert (= (and d!150301 (not c!129473)) b!1391202))

(assert (= (and b!1391202 res!931147) b!1391199))

(assert (= (and b!1391199 (not res!931148)) b!1391196))

(assert (= (and b!1391196 (not res!931149)) b!1391201))

(declare-fun m!1277009 () Bool)

(assert (=> b!1391197 m!1277009))

(assert (=> b!1391197 m!1277009))

(assert (=> b!1391197 m!1276875))

(declare-fun m!1277011 () Bool)

(assert (=> b!1391197 m!1277011))

(declare-fun m!1277013 () Bool)

(assert (=> b!1391199 m!1277013))

(assert (=> b!1391201 m!1277013))

(assert (=> b!1391196 m!1277013))

(declare-fun m!1277015 () Bool)

(assert (=> d!150301 m!1277015))

(assert (=> d!150301 m!1276895))

(assert (=> b!1391041 d!150301))

(declare-fun d!150311 () Bool)

(declare-fun lt!611133 () (_ BitVec 32))

(declare-fun lt!611132 () (_ BitVec 32))

(assert (=> d!150311 (= lt!611133 (bvmul (bvxor lt!611132 (bvlshr lt!611132 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150311 (= lt!611132 ((_ extract 31 0) (bvand (bvxor (select (arr!45950 a!2901) j!112) (bvlshr (select (arr!45950 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150311 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!931150 (let ((h!33690 ((_ extract 31 0) (bvand (bvxor (select (arr!45950 a!2901) j!112) (bvlshr (select (arr!45950 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125126 (bvmul (bvxor h!33690 (bvlshr h!33690 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125126 (bvlshr x!125126 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!931150 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!931150 #b00000000000000000000000000000000))))))

(assert (=> d!150311 (= (toIndex!0 (select (arr!45950 a!2901) j!112) mask!2840) (bvand (bvxor lt!611133 (bvlshr lt!611133 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1391041 d!150311))

(declare-fun b!1391243 () Bool)

(declare-fun e!787844 () Bool)

(declare-fun call!66736 () Bool)

(assert (=> b!1391243 (= e!787844 call!66736)))

(declare-fun b!1391244 () Bool)

(declare-fun e!787846 () Bool)

(assert (=> b!1391244 (= e!787846 e!787844)))

(declare-fun c!129483 () Bool)

(assert (=> b!1391244 (= c!129483 (validKeyInArray!0 (select (arr!45950 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150315 () Bool)

(declare-fun res!931172 () Bool)

(declare-fun e!787845 () Bool)

(assert (=> d!150315 (=> res!931172 e!787845)))

(assert (=> d!150315 (= res!931172 (bvsge #b00000000000000000000000000000000 (size!46500 a!2901)))))

(assert (=> d!150315 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32466) e!787845)))

(declare-fun b!1391245 () Bool)

(assert (=> b!1391245 (= e!787845 e!787846)))

(declare-fun res!931173 () Bool)

(assert (=> b!1391245 (=> (not res!931173) (not e!787846))))

(declare-fun e!787847 () Bool)

(assert (=> b!1391245 (= res!931173 (not e!787847))))

(declare-fun res!931174 () Bool)

(assert (=> b!1391245 (=> (not res!931174) (not e!787847))))

(assert (=> b!1391245 (= res!931174 (validKeyInArray!0 (select (arr!45950 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1391246 () Bool)

(declare-fun contains!9765 (List!32469 (_ BitVec 64)) Bool)

(assert (=> b!1391246 (= e!787847 (contains!9765 Nil!32466 (select (arr!45950 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66733 () Bool)

(assert (=> bm!66733 (= call!66736 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129483 (Cons!32465 (select (arr!45950 a!2901) #b00000000000000000000000000000000) Nil!32466) Nil!32466)))))

(declare-fun b!1391247 () Bool)

(assert (=> b!1391247 (= e!787844 call!66736)))

(assert (= (and d!150315 (not res!931172)) b!1391245))

(assert (= (and b!1391245 res!931174) b!1391246))

(assert (= (and b!1391245 res!931173) b!1391244))

(assert (= (and b!1391244 c!129483) b!1391247))

(assert (= (and b!1391244 (not c!129483)) b!1391243))

(assert (= (or b!1391247 b!1391243) bm!66733))

(assert (=> b!1391244 m!1276973))

(assert (=> b!1391244 m!1276973))

(assert (=> b!1391244 m!1276981))

(assert (=> b!1391245 m!1276973))

(assert (=> b!1391245 m!1276973))

(assert (=> b!1391245 m!1276981))

(assert (=> b!1391246 m!1276973))

(assert (=> b!1391246 m!1276973))

(declare-fun m!1277041 () Bool)

(assert (=> b!1391246 m!1277041))

(assert (=> bm!66733 m!1276973))

(declare-fun m!1277043 () Bool)

(assert (=> bm!66733 m!1277043))

(assert (=> b!1391042 d!150315))

(declare-fun b!1391302 () Bool)

(declare-fun e!787879 () SeekEntryResult!10267)

(declare-fun lt!611168 () SeekEntryResult!10267)

(assert (=> b!1391302 (= e!787879 (MissingZero!10267 (index!43441 lt!611168)))))

(declare-fun b!1391303 () Bool)

(declare-fun e!787878 () SeekEntryResult!10267)

(declare-fun e!787880 () SeekEntryResult!10267)

(assert (=> b!1391303 (= e!787878 e!787880)))

(declare-fun lt!611169 () (_ BitVec 64))

(assert (=> b!1391303 (= lt!611169 (select (arr!45950 a!2901) (index!43441 lt!611168)))))

(declare-fun c!129508 () Bool)

(assert (=> b!1391303 (= c!129508 (= lt!611169 (select (arr!45950 a!2901) j!112)))))

(declare-fun b!1391306 () Bool)

(assert (=> b!1391306 (= e!787880 (Found!10267 (index!43441 lt!611168)))))

(declare-fun b!1391307 () Bool)

(assert (=> b!1391307 (= e!787878 Undefined!10267)))

(declare-fun d!150323 () Bool)

(declare-fun lt!611167 () SeekEntryResult!10267)

(assert (=> d!150323 (and (or (is-Undefined!10267 lt!611167) (not (is-Found!10267 lt!611167)) (and (bvsge (index!43440 lt!611167) #b00000000000000000000000000000000) (bvslt (index!43440 lt!611167) (size!46500 a!2901)))) (or (is-Undefined!10267 lt!611167) (is-Found!10267 lt!611167) (not (is-MissingZero!10267 lt!611167)) (and (bvsge (index!43439 lt!611167) #b00000000000000000000000000000000) (bvslt (index!43439 lt!611167) (size!46500 a!2901)))) (or (is-Undefined!10267 lt!611167) (is-Found!10267 lt!611167) (is-MissingZero!10267 lt!611167) (not (is-MissingVacant!10267 lt!611167)) (and (bvsge (index!43442 lt!611167) #b00000000000000000000000000000000) (bvslt (index!43442 lt!611167) (size!46500 a!2901)))) (or (is-Undefined!10267 lt!611167) (ite (is-Found!10267 lt!611167) (= (select (arr!45950 a!2901) (index!43440 lt!611167)) (select (arr!45950 a!2901) j!112)) (ite (is-MissingZero!10267 lt!611167) (= (select (arr!45950 a!2901) (index!43439 lt!611167)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10267 lt!611167) (= (select (arr!45950 a!2901) (index!43442 lt!611167)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150323 (= lt!611167 e!787878)))

(declare-fun c!129510 () Bool)

(assert (=> d!150323 (= c!129510 (and (is-Intermediate!10267 lt!611168) (undefined!11079 lt!611168)))))

(assert (=> d!150323 (= lt!611168 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45950 a!2901) j!112) mask!2840) (select (arr!45950 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150323 (validMask!0 mask!2840)))

(assert (=> d!150323 (= (seekEntryOrOpen!0 (select (arr!45950 a!2901) j!112) a!2901 mask!2840) lt!611167)))

(declare-fun b!1391308 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95172 (_ BitVec 32)) SeekEntryResult!10267)

(assert (=> b!1391308 (= e!787879 (seekKeyOrZeroReturnVacant!0 (x!125119 lt!611168) (index!43441 lt!611168) (index!43441 lt!611168) (select (arr!45950 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391309 () Bool)

(declare-fun c!129509 () Bool)

(assert (=> b!1391309 (= c!129509 (= lt!611169 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1391309 (= e!787880 e!787879)))

(assert (= (and d!150323 c!129510) b!1391307))

(assert (= (and d!150323 (not c!129510)) b!1391303))

(assert (= (and b!1391303 c!129508) b!1391306))

(assert (= (and b!1391303 (not c!129508)) b!1391309))

(assert (= (and b!1391309 c!129509) b!1391302))

(assert (= (and b!1391309 (not c!129509)) b!1391308))

(declare-fun m!1277069 () Bool)

(assert (=> b!1391303 m!1277069))

(assert (=> d!150323 m!1276877))

(assert (=> d!150323 m!1276875))

(declare-fun m!1277071 () Bool)

(assert (=> d!150323 m!1277071))

(assert (=> d!150323 m!1276875))

(assert (=> d!150323 m!1276877))

(declare-fun m!1277073 () Bool)

(assert (=> d!150323 m!1277073))

(assert (=> d!150323 m!1276895))

(declare-fun m!1277075 () Bool)

(assert (=> d!150323 m!1277075))

(declare-fun m!1277077 () Bool)

(assert (=> d!150323 m!1277077))

(assert (=> b!1391308 m!1276875))

(declare-fun m!1277079 () Bool)

(assert (=> b!1391308 m!1277079))

(assert (=> b!1391044 d!150323))

(declare-fun d!150329 () Bool)

(assert (=> d!150329 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119286 d!150329))

(declare-fun d!150335 () Bool)

(assert (=> d!150335 (= (array_inv!34978 a!2901) (bvsge (size!46500 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119286 d!150335))

(push 1)

(assert (not d!150323))

(assert (not bm!66733))

(assert (not b!1391123))

(assert (not d!150301))

(assert (not b!1391127))

(assert (not d!150297))

(assert (not b!1391244))

(assert (not b!1391245))

(assert (not b!1391197))

(assert (not bm!66725))

(assert (not b!1391246))

(assert (not b!1391122))

(assert (not b!1391126))

(assert (not bm!66722))

(assert (not b!1391308))

(check-sat)

(pop 1)

(push 1)

(check-sat)

