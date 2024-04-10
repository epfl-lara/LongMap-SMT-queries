; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119290 () Bool)

(assert start!119290)

(declare-fun b!1391082 () Bool)

(declare-fun res!931096 () Bool)

(declare-fun e!787741 () Bool)

(assert (=> b!1391082 (=> (not res!931096) (not e!787741))))

(declare-datatypes ((array!95176 0))(
  ( (array!95177 (arr!45952 (Array (_ BitVec 32) (_ BitVec 64))) (size!46502 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95176)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391082 (= res!931096 (validKeyInArray!0 (select (arr!45952 a!2901) i!1037)))))

(declare-fun b!1391083 () Bool)

(declare-fun res!931098 () Bool)

(assert (=> b!1391083 (=> (not res!931098) (not e!787741))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95176 (_ BitVec 32)) Bool)

(assert (=> b!1391083 (= res!931098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!787742 () Bool)

(declare-fun b!1391085 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10269 0))(
  ( (MissingZero!10269 (index!43447 (_ BitVec 32))) (Found!10269 (index!43448 (_ BitVec 32))) (Intermediate!10269 (undefined!11081 Bool) (index!43449 (_ BitVec 32)) (x!125121 (_ BitVec 32))) (Undefined!10269) (MissingVacant!10269 (index!43450 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95176 (_ BitVec 32)) SeekEntryResult!10269)

(assert (=> b!1391085 (= e!787742 (= (seekEntryOrOpen!0 (select (arr!45952 a!2901) j!112) a!2901 mask!2840) (Found!10269 j!112)))))

(declare-fun b!1391086 () Bool)

(declare-fun res!931097 () Bool)

(assert (=> b!1391086 (=> (not res!931097) (not e!787741))))

(declare-datatypes ((List!32471 0))(
  ( (Nil!32468) (Cons!32467 (h!33688 (_ BitVec 64)) (t!47165 List!32471)) )
))
(declare-fun arrayNoDuplicates!0 (array!95176 (_ BitVec 32) List!32471) Bool)

(assert (=> b!1391086 (= res!931097 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32468))))

(declare-fun res!931099 () Bool)

(assert (=> start!119290 (=> (not res!931099) (not e!787741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119290 (= res!931099 (validMask!0 mask!2840))))

(assert (=> start!119290 e!787741))

(assert (=> start!119290 true))

(declare-fun array_inv!34980 (array!95176) Bool)

(assert (=> start!119290 (array_inv!34980 a!2901)))

(declare-fun b!1391084 () Bool)

(declare-fun res!931102 () Bool)

(assert (=> b!1391084 (=> (not res!931102) (not e!787741))))

(assert (=> b!1391084 (= res!931102 (and (= (size!46502 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46502 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46502 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391087 () Bool)

(declare-fun res!931100 () Bool)

(assert (=> b!1391087 (=> (not res!931100) (not e!787741))))

(assert (=> b!1391087 (= res!931100 (validKeyInArray!0 (select (arr!45952 a!2901) j!112)))))

(declare-fun b!1391088 () Bool)

(declare-fun lt!611059 () (_ BitVec 32))

(declare-fun lt!611060 () SeekEntryResult!10269)

(assert (=> b!1391088 (= e!787741 (not (or (not (is-Intermediate!10269 lt!611060)) (undefined!11081 lt!611060) (bvslt mask!2840 #b00000000000000000000000000000000) (and (bvsge lt!611059 #b00000000000000000000000000000000) (bvslt lt!611059 (bvadd #b00000000000000000000000000000001 mask!2840))))))))

(assert (=> b!1391088 e!787742))

(declare-fun res!931101 () Bool)

(assert (=> b!1391088 (=> (not res!931101) (not e!787742))))

(assert (=> b!1391088 (= res!931101 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46542 0))(
  ( (Unit!46543) )
))
(declare-fun lt!611061 () Unit!46542)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95176 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46542)

(assert (=> b!1391088 (= lt!611061 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95176 (_ BitVec 32)) SeekEntryResult!10269)

(assert (=> b!1391088 (= lt!611060 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!611059 (select (arr!45952 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391088 (= lt!611059 (toIndex!0 (select (arr!45952 a!2901) j!112) mask!2840))))

(assert (= (and start!119290 res!931099) b!1391084))

(assert (= (and b!1391084 res!931102) b!1391082))

(assert (= (and b!1391082 res!931096) b!1391087))

(assert (= (and b!1391087 res!931100) b!1391083))

(assert (= (and b!1391083 res!931098) b!1391086))

(assert (= (and b!1391086 res!931097) b!1391088))

(assert (= (and b!1391088 res!931101) b!1391085))

(declare-fun m!1276927 () Bool)

(assert (=> b!1391085 m!1276927))

(assert (=> b!1391085 m!1276927))

(declare-fun m!1276929 () Bool)

(assert (=> b!1391085 m!1276929))

(declare-fun m!1276931 () Bool)

(assert (=> b!1391083 m!1276931))

(assert (=> b!1391088 m!1276927))

(declare-fun m!1276933 () Bool)

(assert (=> b!1391088 m!1276933))

(assert (=> b!1391088 m!1276927))

(declare-fun m!1276935 () Bool)

(assert (=> b!1391088 m!1276935))

(assert (=> b!1391088 m!1276927))

(declare-fun m!1276937 () Bool)

(assert (=> b!1391088 m!1276937))

(declare-fun m!1276939 () Bool)

(assert (=> b!1391088 m!1276939))

(declare-fun m!1276941 () Bool)

(assert (=> b!1391082 m!1276941))

(assert (=> b!1391082 m!1276941))

(declare-fun m!1276943 () Bool)

(assert (=> b!1391082 m!1276943))

(assert (=> b!1391087 m!1276927))

(assert (=> b!1391087 m!1276927))

(declare-fun m!1276945 () Bool)

(assert (=> b!1391087 m!1276945))

(declare-fun m!1276947 () Bool)

(assert (=> b!1391086 m!1276947))

(declare-fun m!1276949 () Bool)

(assert (=> start!119290 m!1276949))

(declare-fun m!1276951 () Bool)

(assert (=> start!119290 m!1276951))

(push 1)

(assert (not b!1391086))

(assert (not b!1391085))

(assert (not b!1391082))

(assert (not b!1391083))

(assert (not b!1391088))

(assert (not b!1391087))

(assert (not start!119290))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!150283 () Bool)

(assert (=> d!150283 (= (validKeyInArray!0 (select (arr!45952 a!2901) j!112)) (and (not (= (select (arr!45952 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45952 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1391087 d!150283))

(declare-fun d!150285 () Bool)

(assert (=> d!150285 (= (validKeyInArray!0 (select (arr!45952 a!2901) i!1037)) (and (not (= (select (arr!45952 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45952 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1391082 d!150285))

(declare-fun call!66729 () Bool)

(declare-fun bm!66726 () Bool)

(assert (=> bm!66726 (= call!66729 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1391129 () Bool)

(declare-fun e!787775 () Bool)

(assert (=> b!1391129 (= e!787775 call!66729)))

(declare-fun d!150287 () Bool)

(declare-fun res!931124 () Bool)

(declare-fun e!787774 () Bool)

(assert (=> d!150287 (=> res!931124 e!787774)))

(assert (=> d!150287 (= res!931124 (bvsge j!112 (size!46502 a!2901)))))

(assert (=> d!150287 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!787774)))

(declare-fun b!1391130 () Bool)

(declare-fun e!787773 () Bool)

(assert (=> b!1391130 (= e!787773 call!66729)))

(declare-fun b!1391131 () Bool)

(assert (=> b!1391131 (= e!787775 e!787773)))

(declare-fun lt!611095 () (_ BitVec 64))

(assert (=> b!1391131 (= lt!611095 (select (arr!45952 a!2901) j!112))))

(declare-fun lt!611097 () Unit!46542)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95176 (_ BitVec 64) (_ BitVec 32)) Unit!46542)

(assert (=> b!1391131 (= lt!611097 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611095 j!112))))

(declare-fun arrayContainsKey!0 (array!95176 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1391131 (arrayContainsKey!0 a!2901 lt!611095 #b00000000000000000000000000000000)))

(declare-fun lt!611096 () Unit!46542)

(assert (=> b!1391131 (= lt!611096 lt!611097)))

(declare-fun res!931123 () Bool)

(assert (=> b!1391131 (= res!931123 (= (seekEntryOrOpen!0 (select (arr!45952 a!2901) j!112) a!2901 mask!2840) (Found!10269 j!112)))))

(assert (=> b!1391131 (=> (not res!931123) (not e!787773))))

(declare-fun b!1391132 () Bool)

(assert (=> b!1391132 (= e!787774 e!787775)))

(declare-fun c!129449 () Bool)

(assert (=> b!1391132 (= c!129449 (validKeyInArray!0 (select (arr!45952 a!2901) j!112)))))

(assert (= (and d!150287 (not res!931124)) b!1391132))

(assert (= (and b!1391132 c!129449) b!1391131))

(assert (= (and b!1391132 (not c!129449)) b!1391129))

(assert (= (and b!1391131 res!931123) b!1391130))

(assert (= (or b!1391130 b!1391129) bm!66726))

(declare-fun m!1276991 () Bool)

(assert (=> bm!66726 m!1276991))

(assert (=> b!1391131 m!1276927))

(declare-fun m!1276993 () Bool)

(assert (=> b!1391131 m!1276993))

(declare-fun m!1276995 () Bool)

(assert (=> b!1391131 m!1276995))

(assert (=> b!1391131 m!1276927))

(assert (=> b!1391131 m!1276929))

(assert (=> b!1391132 m!1276927))

(assert (=> b!1391132 m!1276927))

(assert (=> b!1391132 m!1276945))

(assert (=> b!1391088 d!150287))

(declare-fun d!150299 () Bool)

(assert (=> d!150299 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!611103 () Unit!46542)

(declare-fun choose!38 (array!95176 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46542)

(assert (=> d!150299 (= lt!611103 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150299 (validMask!0 mask!2840)))

(assert (=> d!150299 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!611103)))

(declare-fun bs!40471 () Bool)

(assert (= bs!40471 d!150299))

(assert (=> bs!40471 m!1276939))

(declare-fun m!1276999 () Bool)

(assert (=> bs!40471 m!1276999))

(assert (=> bs!40471 m!1276949))

(assert (=> b!1391088 d!150299))

(declare-fun d!150303 () Bool)

(declare-fun e!787818 () Bool)

(assert (=> d!150303 e!787818))

(declare-fun c!129476 () Bool)

(declare-fun lt!611127 () SeekEntryResult!10269)

(assert (=> d!150303 (= c!129476 (and (is-Intermediate!10269 lt!611127) (undefined!11081 lt!611127)))))

(declare-fun e!787820 () SeekEntryResult!10269)

(assert (=> d!150303 (= lt!611127 e!787820)))

(declare-fun c!129475 () Bool)

(assert (=> d!150303 (= c!129475 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!611126 () (_ BitVec 64))

(assert (=> d!150303 (= lt!611126 (select (arr!45952 a!2901) lt!611059))))

(assert (=> d!150303 (validMask!0 mask!2840)))

(assert (=> d!150303 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!611059 (select (arr!45952 a!2901) j!112) a!2901 mask!2840) lt!611127)))

(declare-fun b!1391205 () Bool)

(declare-fun e!787819 () Bool)

(assert (=> b!1391205 (= e!787818 e!787819)))

(declare-fun res!931153 () Bool)

(assert (=> b!1391205 (= res!931153 (and (is-Intermediate!10269 lt!611127) (not (undefined!11081 lt!611127)) (bvslt (x!125121 lt!611127) #b01111111111111111111111111111110) (bvsge (x!125121 lt!611127) #b00000000000000000000000000000000) (bvsge (x!125121 lt!611127) #b00000000000000000000000000000000)))))

(assert (=> b!1391205 (=> (not res!931153) (not e!787819))))

(declare-fun b!1391206 () Bool)

(declare-fun e!787817 () SeekEntryResult!10269)

(assert (=> b!1391206 (= e!787817 (Intermediate!10269 false lt!611059 #b00000000000000000000000000000000))))

(declare-fun b!1391207 () Bool)

(assert (=> b!1391207 (= e!787820 e!787817)))

(declare-fun c!129474 () Bool)

(assert (=> b!1391207 (= c!129474 (or (= lt!611126 (select (arr!45952 a!2901) j!112)) (= (bvadd lt!611126 lt!611126) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1391208 () Bool)

(assert (=> b!1391208 (and (bvsge (index!43449 lt!611127) #b00000000000000000000000000000000) (bvslt (index!43449 lt!611127) (size!46502 a!2901)))))

(declare-fun e!787816 () Bool)

(assert (=> b!1391208 (= e!787816 (= (select (arr!45952 a!2901) (index!43449 lt!611127)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1391209 () Bool)

(assert (=> b!1391209 (= e!787820 (Intermediate!10269 true lt!611059 #b00000000000000000000000000000000))))

(declare-fun b!1391210 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391210 (= e!787817 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!611059 #b00000000000000000000000000000000 mask!2840) (select (arr!45952 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391211 () Bool)

(assert (=> b!1391211 (= e!787818 (bvsge (x!125121 lt!611127) #b01111111111111111111111111111110))))

(declare-fun b!1391212 () Bool)

(assert (=> b!1391212 (and (bvsge (index!43449 lt!611127) #b00000000000000000000000000000000) (bvslt (index!43449 lt!611127) (size!46502 a!2901)))))

(declare-fun res!931152 () Bool)

(assert (=> b!1391212 (= res!931152 (= (select (arr!45952 a!2901) (index!43449 lt!611127)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1391212 (=> res!931152 e!787816)))

(declare-fun b!1391213 () Bool)

(assert (=> b!1391213 (and (bvsge (index!43449 lt!611127) #b00000000000000000000000000000000) (bvslt (index!43449 lt!611127) (size!46502 a!2901)))))

(declare-fun res!931151 () Bool)

(assert (=> b!1391213 (= res!931151 (= (select (arr!45952 a!2901) (index!43449 lt!611127)) (select (arr!45952 a!2901) j!112)))))

(assert (=> b!1391213 (=> res!931151 e!787816)))

(assert (=> b!1391213 (= e!787819 e!787816)))

(assert (= (and d!150303 c!129475) b!1391209))

(assert (= (and d!150303 (not c!129475)) b!1391207))

(assert (= (and b!1391207 c!129474) b!1391206))

(assert (= (and b!1391207 (not c!129474)) b!1391210))

(assert (= (and d!150303 c!129476) b!1391211))

(assert (= (and d!150303 (not c!129476)) b!1391205))

(assert (= (and b!1391205 res!931153) b!1391213))

(assert (= (and b!1391213 (not res!931151)) b!1391212))

(assert (= (and b!1391212 (not res!931152)) b!1391208))

(declare-fun m!1277017 () Bool)

(assert (=> d!150303 m!1277017))

(assert (=> d!150303 m!1276949))

(declare-fun m!1277019 () Bool)

(assert (=> b!1391210 m!1277019))

(assert (=> b!1391210 m!1277019))

(assert (=> b!1391210 m!1276927))

(declare-fun m!1277021 () Bool)

(assert (=> b!1391210 m!1277021))

(declare-fun m!1277023 () Bool)

(assert (=> b!1391208 m!1277023))

(assert (=> b!1391213 m!1277023))

(assert (=> b!1391212 m!1277023))

(assert (=> b!1391088 d!150303))

(declare-fun d!150313 () Bool)

(declare-fun lt!611139 () (_ BitVec 32))

(declare-fun lt!611138 () (_ BitVec 32))

(assert (=> d!150313 (= lt!611139 (bvmul (bvxor lt!611138 (bvlshr lt!611138 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150313 (= lt!611138 ((_ extract 31 0) (bvand (bvxor (select (arr!45952 a!2901) j!112) (bvlshr (select (arr!45952 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150313 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!931160 (let ((h!33691 ((_ extract 31 0) (bvand (bvxor (select (arr!45952 a!2901) j!112) (bvlshr (select (arr!45952 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125127 (bvmul (bvxor h!33691 (bvlshr h!33691 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125127 (bvlshr x!125127 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!931160 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!931160 #b00000000000000000000000000000000))))))

(assert (=> d!150313 (= (toIndex!0 (select (arr!45952 a!2901) j!112) mask!2840) (bvand (bvxor lt!611139 (bvlshr lt!611139 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1391088 d!150313))

(declare-fun bm!66730 () Bool)

(declare-fun call!66733 () Bool)

(assert (=> bm!66730 (= call!66733 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1391229 () Bool)

(declare-fun e!787835 () Bool)

(assert (=> b!1391229 (= e!787835 call!66733)))

(declare-fun d!150319 () Bool)

(declare-fun res!931165 () Bool)

(declare-fun e!787834 () Bool)

(assert (=> d!150319 (=> res!931165 e!787834)))

(assert (=> d!150319 (= res!931165 (bvsge #b00000000000000000000000000000000 (size!46502 a!2901)))))

(assert (=> d!150319 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!787834)))

(declare-fun b!1391230 () Bool)

(declare-fun e!787833 () Bool)

(assert (=> b!1391230 (= e!787833 call!66733)))

(declare-fun b!1391231 () Bool)

(assert (=> b!1391231 (= e!787835 e!787833)))

(declare-fun lt!611140 () (_ BitVec 64))

(assert (=> b!1391231 (= lt!611140 (select (arr!45952 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!611142 () Unit!46542)

(assert (=> b!1391231 (= lt!611142 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611140 #b00000000000000000000000000000000))))

(assert (=> b!1391231 (arrayContainsKey!0 a!2901 lt!611140 #b00000000000000000000000000000000)))

(declare-fun lt!611141 () Unit!46542)

(assert (=> b!1391231 (= lt!611141 lt!611142)))

(declare-fun res!931164 () Bool)

(assert (=> b!1391231 (= res!931164 (= (seekEntryOrOpen!0 (select (arr!45952 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10269 #b00000000000000000000000000000000)))))

(assert (=> b!1391231 (=> (not res!931164) (not e!787833))))

(declare-fun b!1391232 () Bool)

(assert (=> b!1391232 (= e!787834 e!787835)))

(declare-fun c!129480 () Bool)

(assert (=> b!1391232 (= c!129480 (validKeyInArray!0 (select (arr!45952 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!150319 (not res!931165)) b!1391232))

(assert (= (and b!1391232 c!129480) b!1391231))

(assert (= (and b!1391232 (not c!129480)) b!1391229))

(assert (= (and b!1391231 res!931164) b!1391230))

(assert (= (or b!1391230 b!1391229) bm!66730))

(declare-fun m!1277029 () Bool)

(assert (=> bm!66730 m!1277029))

(declare-fun m!1277031 () Bool)

(assert (=> b!1391231 m!1277031))

(declare-fun m!1277033 () Bool)

(assert (=> b!1391231 m!1277033))

(declare-fun m!1277035 () Bool)

(assert (=> b!1391231 m!1277035))

(assert (=> b!1391231 m!1277031))

(declare-fun m!1277037 () Bool)

(assert (=> b!1391231 m!1277037))

(assert (=> b!1391232 m!1277031))

(assert (=> b!1391232 m!1277031))

(declare-fun m!1277039 () Bool)

(assert (=> b!1391232 m!1277039))

(assert (=> b!1391083 d!150319))

(declare-fun b!1391282 () Bool)

(declare-fun e!787865 () SeekEntryResult!10269)

(declare-fun e!787867 () SeekEntryResult!10269)

(assert (=> b!1391282 (= e!787865 e!787867)))

(declare-fun lt!611163 () (_ BitVec 64))

(declare-fun lt!611162 () SeekEntryResult!10269)

(assert (=> b!1391282 (= lt!611163 (select (arr!45952 a!2901) (index!43449 lt!611162)))))

(declare-fun c!129503 () Bool)

(assert (=> b!1391282 (= c!129503 (= lt!611163 (select (arr!45952 a!2901) j!112)))))

(declare-fun b!1391283 () Bool)

(declare-fun e!787866 () SeekEntryResult!10269)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95176 (_ BitVec 32)) SeekEntryResult!10269)

(assert (=> b!1391283 (= e!787866 (seekKeyOrZeroReturnVacant!0 (x!125121 lt!611162) (index!43449 lt!611162) (index!43449 lt!611162) (select (arr!45952 a!2901) j!112) a!2901 mask!2840))))

(declare-fun d!150321 () Bool)

(declare-fun lt!611164 () SeekEntryResult!10269)

(assert (=> d!150321 (and (or (is-Undefined!10269 lt!611164) (not (is-Found!10269 lt!611164)) (and (bvsge (index!43448 lt!611164) #b00000000000000000000000000000000) (bvslt (index!43448 lt!611164) (size!46502 a!2901)))) (or (is-Undefined!10269 lt!611164) (is-Found!10269 lt!611164) (not (is-MissingZero!10269 lt!611164)) (and (bvsge (index!43447 lt!611164) #b00000000000000000000000000000000) (bvslt (index!43447 lt!611164) (size!46502 a!2901)))) (or (is-Undefined!10269 lt!611164) (is-Found!10269 lt!611164) (is-MissingZero!10269 lt!611164) (not (is-MissingVacant!10269 lt!611164)) (and (bvsge (index!43450 lt!611164) #b00000000000000000000000000000000) (bvslt (index!43450 lt!611164) (size!46502 a!2901)))) (or (is-Undefined!10269 lt!611164) (ite (is-Found!10269 lt!611164) (= (select (arr!45952 a!2901) (index!43448 lt!611164)) (select (arr!45952 a!2901) j!112)) (ite (is-MissingZero!10269 lt!611164) (= (select (arr!45952 a!2901) (index!43447 lt!611164)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10269 lt!611164) (= (select (arr!45952 a!2901) (index!43450 lt!611164)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150321 (= lt!611164 e!787865)))

(declare-fun c!129501 () Bool)

(assert (=> d!150321 (= c!129501 (and (is-Intermediate!10269 lt!611162) (undefined!11081 lt!611162)))))

(assert (=> d!150321 (= lt!611162 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45952 a!2901) j!112) mask!2840) (select (arr!45952 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150321 (validMask!0 mask!2840)))

(assert (=> d!150321 (= (seekEntryOrOpen!0 (select (arr!45952 a!2901) j!112) a!2901 mask!2840) lt!611164)))

(declare-fun b!1391284 () Bool)

(declare-fun c!129502 () Bool)

(assert (=> b!1391284 (= c!129502 (= lt!611163 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1391284 (= e!787867 e!787866)))

(declare-fun b!1391285 () Bool)

(assert (=> b!1391285 (= e!787866 (MissingZero!10269 (index!43449 lt!611162)))))

(declare-fun b!1391286 () Bool)

(assert (=> b!1391286 (= e!787867 (Found!10269 (index!43449 lt!611162)))))

(declare-fun b!1391287 () Bool)

(assert (=> b!1391287 (= e!787865 Undefined!10269)))

(assert (= (and d!150321 c!129501) b!1391287))

(assert (= (and d!150321 (not c!129501)) b!1391282))

(assert (= (and b!1391282 c!129503) b!1391286))

(assert (= (and b!1391282 (not c!129503)) b!1391284))

(assert (= (and b!1391284 c!129502) b!1391285))

(assert (= (and b!1391284 (not c!129502)) b!1391283))

(declare-fun m!1277057 () Bool)

(assert (=> b!1391282 m!1277057))

(assert (=> b!1391283 m!1276927))

(declare-fun m!1277059 () Bool)

(assert (=> b!1391283 m!1277059))

(declare-fun m!1277061 () Bool)

(assert (=> d!150321 m!1277061))

(assert (=> d!150321 m!1276927))

(assert (=> d!150321 m!1276933))

(assert (=> d!150321 m!1276933))

(assert (=> d!150321 m!1276927))

(declare-fun m!1277063 () Bool)

(assert (=> d!150321 m!1277063))

(declare-fun m!1277065 () Bool)

(assert (=> d!150321 m!1277065))

(assert (=> d!150321 m!1276949))

(declare-fun m!1277067 () Bool)

(assert (=> d!150321 m!1277067))

(assert (=> b!1391085 d!150321))

(declare-fun b!1391312 () Bool)

(declare-fun e!787886 () Bool)

(declare-fun call!66739 () Bool)

(assert (=> b!1391312 (= e!787886 call!66739)))

(declare-fun b!1391313 () Bool)

(declare-fun e!787884 () Bool)

(declare-fun contains!9766 (List!32471 (_ BitVec 64)) Bool)

(assert (=> b!1391313 (= e!787884 (contains!9766 Nil!32468 (select (arr!45952 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66736 () Bool)

(declare-fun c!129513 () Bool)

(assert (=> bm!66736 (= call!66739 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129513 (Cons!32467 (select (arr!45952 a!2901) #b00000000000000000000000000000000) Nil!32468) Nil!32468)))))

(declare-fun b!1391314 () Bool)

(assert (=> b!1391314 (= e!787886 call!66739)))

(declare-fun d!150327 () Bool)

(declare-fun res!931182 () Bool)

(declare-fun e!787883 () Bool)

(assert (=> d!150327 (=> res!931182 e!787883)))

(assert (=> d!150327 (= res!931182 (bvsge #b00000000000000000000000000000000 (size!46502 a!2901)))))

(assert (=> d!150327 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32468) e!787883)))

(declare-fun b!1391315 () Bool)

(declare-fun e!787885 () Bool)

(assert (=> b!1391315 (= e!787885 e!787886)))

(assert (=> b!1391315 (= c!129513 (validKeyInArray!0 (select (arr!45952 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1391316 () Bool)

(assert (=> b!1391316 (= e!787883 e!787885)))

(declare-fun res!931183 () Bool)

(assert (=> b!1391316 (=> (not res!931183) (not e!787885))))

(assert (=> b!1391316 (= res!931183 (not e!787884))))

(declare-fun res!931181 () Bool)

(assert (=> b!1391316 (=> (not res!931181) (not e!787884))))

(assert (=> b!1391316 (= res!931181 (validKeyInArray!0 (select (arr!45952 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!150327 (not res!931182)) b!1391316))

(assert (= (and b!1391316 res!931181) b!1391313))

(assert (= (and b!1391316 res!931183) b!1391315))

(assert (= (and b!1391315 c!129513) b!1391312))

(assert (= (and b!1391315 (not c!129513)) b!1391314))

(assert (= (or b!1391312 b!1391314) bm!66736))

(assert (=> b!1391313 m!1277031))

(assert (=> b!1391313 m!1277031))

(declare-fun m!1277081 () Bool)

(assert (=> b!1391313 m!1277081))

(assert (=> bm!66736 m!1277031))

(declare-fun m!1277083 () Bool)

(assert (=> bm!66736 m!1277083))

(assert (=> b!1391315 m!1277031))

(assert (=> b!1391315 m!1277031))

(assert (=> b!1391315 m!1277039))

(assert (=> b!1391316 m!1277031))

(assert (=> b!1391316 m!1277031))

(assert (=> b!1391316 m!1277039))

(assert (=> b!1391086 d!150327))

(declare-fun d!150331 () Bool)

(assert (=> d!150331 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119290 d!150331))

(declare-fun d!150337 () Bool)

(assert (=> d!150337 (= (array_inv!34980 a!2901) (bvsge (size!46502 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119290 d!150337))

(push 1)

