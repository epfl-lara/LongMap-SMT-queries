; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119630 () Bool)

(assert start!119630)

(declare-fun res!932209 () Bool)

(declare-fun e!788993 () Bool)

(assert (=> start!119630 (=> (not res!932209) (not e!788993))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119630 (= res!932209 (validMask!0 mask!2840))))

(assert (=> start!119630 e!788993))

(assert (=> start!119630 true))

(declare-datatypes ((array!95336 0))(
  ( (array!95337 (arr!46027 (Array (_ BitVec 32) (_ BitVec 64))) (size!46578 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95336)

(declare-fun array_inv!35308 (array!95336) Bool)

(assert (=> start!119630 (array_inv!35308 a!2901)))

(declare-fun b!1393169 () Bool)

(declare-fun res!932207 () Bool)

(assert (=> b!1393169 (=> (not res!932207) (not e!788993))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393169 (= res!932207 (validKeyInArray!0 (select (arr!46027 a!2901) j!112)))))

(declare-fun b!1393170 () Bool)

(declare-fun e!788995 () Bool)

(assert (=> b!1393170 (= e!788993 (not e!788995))))

(declare-fun res!932210 () Bool)

(assert (=> b!1393170 (=> res!932210 e!788995)))

(declare-datatypes ((SeekEntryResult!10247 0))(
  ( (MissingZero!10247 (index!43359 (_ BitVec 32))) (Found!10247 (index!43360 (_ BitVec 32))) (Intermediate!10247 (undefined!11059 Bool) (index!43361 (_ BitVec 32)) (x!125194 (_ BitVec 32))) (Undefined!10247) (MissingVacant!10247 (index!43362 (_ BitVec 32))) )
))
(declare-fun lt!611836 () SeekEntryResult!10247)

(get-info :version)

(assert (=> b!1393170 (= res!932210 (or (not ((_ is Intermediate!10247) lt!611836)) (undefined!11059 lt!611836)))))

(declare-fun e!788996 () Bool)

(assert (=> b!1393170 e!788996))

(declare-fun res!932208 () Bool)

(assert (=> b!1393170 (=> (not res!932208) (not e!788996))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95336 (_ BitVec 32)) Bool)

(assert (=> b!1393170 (= res!932208 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46525 0))(
  ( (Unit!46526) )
))
(declare-fun lt!611835 () Unit!46525)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46525)

(assert (=> b!1393170 (= lt!611835 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95336 (_ BitVec 32)) SeekEntryResult!10247)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393170 (= lt!611836 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46027 a!2901) j!112) mask!2840) (select (arr!46027 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393171 () Bool)

(declare-fun lt!611837 () (_ BitVec 32))

(assert (=> b!1393171 (= e!788995 (or (bvslt mask!2840 #b00000000000000000000000000000000) (and (bvsge lt!611837 #b00000000000000000000000000000000) (bvslt lt!611837 (bvadd #b00000000000000000000000000000001 mask!2840)))))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1393171 (= lt!611837 (toIndex!0 (select (store (arr!46027 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1393172 () Bool)

(declare-fun res!932205 () Bool)

(assert (=> b!1393172 (=> (not res!932205) (not e!788993))))

(declare-datatypes ((List!32533 0))(
  ( (Nil!32530) (Cons!32529 (h!33764 (_ BitVec 64)) (t!47219 List!32533)) )
))
(declare-fun arrayNoDuplicates!0 (array!95336 (_ BitVec 32) List!32533) Bool)

(assert (=> b!1393172 (= res!932205 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32530))))

(declare-fun b!1393173 () Bool)

(declare-fun res!932211 () Bool)

(assert (=> b!1393173 (=> (not res!932211) (not e!788993))))

(assert (=> b!1393173 (= res!932211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393174 () Bool)

(declare-fun res!932206 () Bool)

(assert (=> b!1393174 (=> (not res!932206) (not e!788993))))

(assert (=> b!1393174 (= res!932206 (and (= (size!46578 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46578 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46578 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393175 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95336 (_ BitVec 32)) SeekEntryResult!10247)

(assert (=> b!1393175 (= e!788996 (= (seekEntryOrOpen!0 (select (arr!46027 a!2901) j!112) a!2901 mask!2840) (Found!10247 j!112)))))

(declare-fun b!1393176 () Bool)

(declare-fun res!932212 () Bool)

(assert (=> b!1393176 (=> (not res!932212) (not e!788993))))

(assert (=> b!1393176 (= res!932212 (validKeyInArray!0 (select (arr!46027 a!2901) i!1037)))))

(assert (= (and start!119630 res!932209) b!1393174))

(assert (= (and b!1393174 res!932206) b!1393176))

(assert (= (and b!1393176 res!932212) b!1393169))

(assert (= (and b!1393169 res!932207) b!1393173))

(assert (= (and b!1393173 res!932211) b!1393172))

(assert (= (and b!1393172 res!932205) b!1393170))

(assert (= (and b!1393170 res!932208) b!1393175))

(assert (= (and b!1393170 (not res!932210)) b!1393171))

(declare-fun m!1279183 () Bool)

(assert (=> b!1393170 m!1279183))

(declare-fun m!1279185 () Bool)

(assert (=> b!1393170 m!1279185))

(assert (=> b!1393170 m!1279183))

(declare-fun m!1279187 () Bool)

(assert (=> b!1393170 m!1279187))

(assert (=> b!1393170 m!1279185))

(assert (=> b!1393170 m!1279183))

(declare-fun m!1279189 () Bool)

(assert (=> b!1393170 m!1279189))

(declare-fun m!1279191 () Bool)

(assert (=> b!1393170 m!1279191))

(declare-fun m!1279193 () Bool)

(assert (=> b!1393173 m!1279193))

(assert (=> b!1393175 m!1279183))

(assert (=> b!1393175 m!1279183))

(declare-fun m!1279195 () Bool)

(assert (=> b!1393175 m!1279195))

(assert (=> b!1393169 m!1279183))

(assert (=> b!1393169 m!1279183))

(declare-fun m!1279197 () Bool)

(assert (=> b!1393169 m!1279197))

(declare-fun m!1279199 () Bool)

(assert (=> b!1393172 m!1279199))

(declare-fun m!1279201 () Bool)

(assert (=> b!1393171 m!1279201))

(declare-fun m!1279203 () Bool)

(assert (=> b!1393171 m!1279203))

(assert (=> b!1393171 m!1279203))

(declare-fun m!1279205 () Bool)

(assert (=> b!1393171 m!1279205))

(declare-fun m!1279207 () Bool)

(assert (=> b!1393176 m!1279207))

(assert (=> b!1393176 m!1279207))

(declare-fun m!1279209 () Bool)

(assert (=> b!1393176 m!1279209))

(declare-fun m!1279211 () Bool)

(assert (=> start!119630 m!1279211))

(declare-fun m!1279213 () Bool)

(assert (=> start!119630 m!1279213))

(check-sat (not b!1393176) (not b!1393171) (not b!1393169) (not b!1393170) (not b!1393175) (not start!119630) (not b!1393172) (not b!1393173))
(check-sat)
(get-model)

(declare-fun b!1393237 () Bool)

(declare-fun e!789027 () SeekEntryResult!10247)

(assert (=> b!1393237 (= e!789027 Undefined!10247)))

(declare-fun d!150765 () Bool)

(declare-fun lt!611869 () SeekEntryResult!10247)

(assert (=> d!150765 (and (or ((_ is Undefined!10247) lt!611869) (not ((_ is Found!10247) lt!611869)) (and (bvsge (index!43360 lt!611869) #b00000000000000000000000000000000) (bvslt (index!43360 lt!611869) (size!46578 a!2901)))) (or ((_ is Undefined!10247) lt!611869) ((_ is Found!10247) lt!611869) (not ((_ is MissingZero!10247) lt!611869)) (and (bvsge (index!43359 lt!611869) #b00000000000000000000000000000000) (bvslt (index!43359 lt!611869) (size!46578 a!2901)))) (or ((_ is Undefined!10247) lt!611869) ((_ is Found!10247) lt!611869) ((_ is MissingZero!10247) lt!611869) (not ((_ is MissingVacant!10247) lt!611869)) (and (bvsge (index!43362 lt!611869) #b00000000000000000000000000000000) (bvslt (index!43362 lt!611869) (size!46578 a!2901)))) (or ((_ is Undefined!10247) lt!611869) (ite ((_ is Found!10247) lt!611869) (= (select (arr!46027 a!2901) (index!43360 lt!611869)) (select (arr!46027 a!2901) j!112)) (ite ((_ is MissingZero!10247) lt!611869) (= (select (arr!46027 a!2901) (index!43359 lt!611869)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10247) lt!611869) (= (select (arr!46027 a!2901) (index!43362 lt!611869)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150765 (= lt!611869 e!789027)))

(declare-fun c!129945 () Bool)

(declare-fun lt!611870 () SeekEntryResult!10247)

(assert (=> d!150765 (= c!129945 (and ((_ is Intermediate!10247) lt!611870) (undefined!11059 lt!611870)))))

(assert (=> d!150765 (= lt!611870 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46027 a!2901) j!112) mask!2840) (select (arr!46027 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150765 (validMask!0 mask!2840)))

(assert (=> d!150765 (= (seekEntryOrOpen!0 (select (arr!46027 a!2901) j!112) a!2901 mask!2840) lt!611869)))

(declare-fun b!1393238 () Bool)

(declare-fun e!789028 () SeekEntryResult!10247)

(assert (=> b!1393238 (= e!789028 (MissingZero!10247 (index!43361 lt!611870)))))

(declare-fun b!1393239 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95336 (_ BitVec 32)) SeekEntryResult!10247)

(assert (=> b!1393239 (= e!789028 (seekKeyOrZeroReturnVacant!0 (x!125194 lt!611870) (index!43361 lt!611870) (index!43361 lt!611870) (select (arr!46027 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393240 () Bool)

(declare-fun e!789029 () SeekEntryResult!10247)

(assert (=> b!1393240 (= e!789029 (Found!10247 (index!43361 lt!611870)))))

(declare-fun b!1393241 () Bool)

(assert (=> b!1393241 (= e!789027 e!789029)))

(declare-fun lt!611868 () (_ BitVec 64))

(assert (=> b!1393241 (= lt!611868 (select (arr!46027 a!2901) (index!43361 lt!611870)))))

(declare-fun c!129946 () Bool)

(assert (=> b!1393241 (= c!129946 (= lt!611868 (select (arr!46027 a!2901) j!112)))))

(declare-fun b!1393242 () Bool)

(declare-fun c!129944 () Bool)

(assert (=> b!1393242 (= c!129944 (= lt!611868 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1393242 (= e!789029 e!789028)))

(assert (= (and d!150765 c!129945) b!1393237))

(assert (= (and d!150765 (not c!129945)) b!1393241))

(assert (= (and b!1393241 c!129946) b!1393240))

(assert (= (and b!1393241 (not c!129946)) b!1393242))

(assert (= (and b!1393242 c!129944) b!1393238))

(assert (= (and b!1393242 (not c!129944)) b!1393239))

(assert (=> d!150765 m!1279211))

(declare-fun m!1279279 () Bool)

(assert (=> d!150765 m!1279279))

(assert (=> d!150765 m!1279185))

(assert (=> d!150765 m!1279183))

(assert (=> d!150765 m!1279189))

(assert (=> d!150765 m!1279183))

(assert (=> d!150765 m!1279185))

(declare-fun m!1279281 () Bool)

(assert (=> d!150765 m!1279281))

(declare-fun m!1279283 () Bool)

(assert (=> d!150765 m!1279283))

(assert (=> b!1393239 m!1279183))

(declare-fun m!1279285 () Bool)

(assert (=> b!1393239 m!1279285))

(declare-fun m!1279287 () Bool)

(assert (=> b!1393241 m!1279287))

(assert (=> b!1393175 d!150765))

(declare-fun b!1393259 () Bool)

(declare-fun e!789044 () Bool)

(declare-fun e!789042 () Bool)

(assert (=> b!1393259 (= e!789044 e!789042)))

(declare-fun lt!611884 () (_ BitVec 64))

(assert (=> b!1393259 (= lt!611884 (select (arr!46027 a!2901) j!112))))

(declare-fun lt!611883 () Unit!46525)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95336 (_ BitVec 64) (_ BitVec 32)) Unit!46525)

(assert (=> b!1393259 (= lt!611883 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611884 j!112))))

(declare-fun arrayContainsKey!0 (array!95336 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1393259 (arrayContainsKey!0 a!2901 lt!611884 #b00000000000000000000000000000000)))

(declare-fun lt!611885 () Unit!46525)

(assert (=> b!1393259 (= lt!611885 lt!611883)))

(declare-fun res!932271 () Bool)

(assert (=> b!1393259 (= res!932271 (= (seekEntryOrOpen!0 (select (arr!46027 a!2901) j!112) a!2901 mask!2840) (Found!10247 j!112)))))

(assert (=> b!1393259 (=> (not res!932271) (not e!789042))))

(declare-fun b!1393260 () Bool)

(declare-fun call!66822 () Bool)

(assert (=> b!1393260 (= e!789042 call!66822)))

(declare-fun bm!66819 () Bool)

(assert (=> bm!66819 (= call!66822 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1393261 () Bool)

(declare-fun e!789043 () Bool)

(assert (=> b!1393261 (= e!789043 e!789044)))

(declare-fun c!129951 () Bool)

(assert (=> b!1393261 (= c!129951 (validKeyInArray!0 (select (arr!46027 a!2901) j!112)))))

(declare-fun b!1393262 () Bool)

(assert (=> b!1393262 (= e!789044 call!66822)))

(declare-fun d!150775 () Bool)

(declare-fun res!932270 () Bool)

(assert (=> d!150775 (=> res!932270 e!789043)))

(assert (=> d!150775 (= res!932270 (bvsge j!112 (size!46578 a!2901)))))

(assert (=> d!150775 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!789043)))

(assert (= (and d!150775 (not res!932270)) b!1393261))

(assert (= (and b!1393261 c!129951) b!1393259))

(assert (= (and b!1393261 (not c!129951)) b!1393262))

(assert (= (and b!1393259 res!932271) b!1393260))

(assert (= (or b!1393260 b!1393262) bm!66819))

(assert (=> b!1393259 m!1279183))

(declare-fun m!1279289 () Bool)

(assert (=> b!1393259 m!1279289))

(declare-fun m!1279291 () Bool)

(assert (=> b!1393259 m!1279291))

(assert (=> b!1393259 m!1279183))

(assert (=> b!1393259 m!1279195))

(declare-fun m!1279293 () Bool)

(assert (=> bm!66819 m!1279293))

(assert (=> b!1393261 m!1279183))

(assert (=> b!1393261 m!1279183))

(assert (=> b!1393261 m!1279197))

(assert (=> b!1393170 d!150775))

(declare-fun d!150785 () Bool)

(assert (=> d!150785 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!611897 () Unit!46525)

(declare-fun choose!38 (array!95336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46525)

(assert (=> d!150785 (= lt!611897 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150785 (validMask!0 mask!2840)))

(assert (=> d!150785 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!611897)))

(declare-fun bs!40504 () Bool)

(assert (= bs!40504 d!150785))

(assert (=> bs!40504 m!1279191))

(declare-fun m!1279301 () Bool)

(assert (=> bs!40504 m!1279301))

(assert (=> bs!40504 m!1279211))

(assert (=> b!1393170 d!150785))

(declare-fun b!1393315 () Bool)

(declare-fun e!789079 () SeekEntryResult!10247)

(assert (=> b!1393315 (= e!789079 (Intermediate!10247 false (toIndex!0 (select (arr!46027 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1393316 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393316 (= e!789079 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46027 a!2901) j!112) mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (arr!46027 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393317 () Bool)

(declare-fun e!789078 () Bool)

(declare-fun lt!611918 () SeekEntryResult!10247)

(assert (=> b!1393317 (= e!789078 (bvsge (x!125194 lt!611918) #b01111111111111111111111111111110))))

(declare-fun b!1393319 () Bool)

(assert (=> b!1393319 (and (bvsge (index!43361 lt!611918) #b00000000000000000000000000000000) (bvslt (index!43361 lt!611918) (size!46578 a!2901)))))

(declare-fun res!932295 () Bool)

(assert (=> b!1393319 (= res!932295 (= (select (arr!46027 a!2901) (index!43361 lt!611918)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!789080 () Bool)

(assert (=> b!1393319 (=> res!932295 e!789080)))

(declare-fun b!1393320 () Bool)

(declare-fun e!789081 () SeekEntryResult!10247)

(assert (=> b!1393320 (= e!789081 e!789079)))

(declare-fun lt!611919 () (_ BitVec 64))

(declare-fun c!129970 () Bool)

(assert (=> b!1393320 (= c!129970 (or (= lt!611919 (select (arr!46027 a!2901) j!112)) (= (bvadd lt!611919 lt!611919) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1393321 () Bool)

(assert (=> b!1393321 (and (bvsge (index!43361 lt!611918) #b00000000000000000000000000000000) (bvslt (index!43361 lt!611918) (size!46578 a!2901)))))

(assert (=> b!1393321 (= e!789080 (= (select (arr!46027 a!2901) (index!43361 lt!611918)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1393322 () Bool)

(assert (=> b!1393322 (and (bvsge (index!43361 lt!611918) #b00000000000000000000000000000000) (bvslt (index!43361 lt!611918) (size!46578 a!2901)))))

(declare-fun res!932293 () Bool)

(assert (=> b!1393322 (= res!932293 (= (select (arr!46027 a!2901) (index!43361 lt!611918)) (select (arr!46027 a!2901) j!112)))))

(assert (=> b!1393322 (=> res!932293 e!789080)))

(declare-fun e!789077 () Bool)

(assert (=> b!1393322 (= e!789077 e!789080)))

(declare-fun b!1393323 () Bool)

(assert (=> b!1393323 (= e!789081 (Intermediate!10247 true (toIndex!0 (select (arr!46027 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1393318 () Bool)

(assert (=> b!1393318 (= e!789078 e!789077)))

(declare-fun res!932294 () Bool)

(assert (=> b!1393318 (= res!932294 (and ((_ is Intermediate!10247) lt!611918) (not (undefined!11059 lt!611918)) (bvslt (x!125194 lt!611918) #b01111111111111111111111111111110) (bvsge (x!125194 lt!611918) #b00000000000000000000000000000000) (bvsge (x!125194 lt!611918) #b00000000000000000000000000000000)))))

(assert (=> b!1393318 (=> (not res!932294) (not e!789077))))

(declare-fun d!150789 () Bool)

(assert (=> d!150789 e!789078))

(declare-fun c!129968 () Bool)

(assert (=> d!150789 (= c!129968 (and ((_ is Intermediate!10247) lt!611918) (undefined!11059 lt!611918)))))

(assert (=> d!150789 (= lt!611918 e!789081)))

(declare-fun c!129969 () Bool)

(assert (=> d!150789 (= c!129969 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150789 (= lt!611919 (select (arr!46027 a!2901) (toIndex!0 (select (arr!46027 a!2901) j!112) mask!2840)))))

(assert (=> d!150789 (validMask!0 mask!2840)))

(assert (=> d!150789 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46027 a!2901) j!112) mask!2840) (select (arr!46027 a!2901) j!112) a!2901 mask!2840) lt!611918)))

(assert (= (and d!150789 c!129969) b!1393323))

(assert (= (and d!150789 (not c!129969)) b!1393320))

(assert (= (and b!1393320 c!129970) b!1393315))

(assert (= (and b!1393320 (not c!129970)) b!1393316))

(assert (= (and d!150789 c!129968) b!1393317))

(assert (= (and d!150789 (not c!129968)) b!1393318))

(assert (= (and b!1393318 res!932294) b!1393322))

(assert (= (and b!1393322 (not res!932293)) b!1393319))

(assert (= (and b!1393319 (not res!932295)) b!1393321))

(assert (=> b!1393316 m!1279185))

(declare-fun m!1279317 () Bool)

(assert (=> b!1393316 m!1279317))

(assert (=> b!1393316 m!1279317))

(assert (=> b!1393316 m!1279183))

(declare-fun m!1279319 () Bool)

(assert (=> b!1393316 m!1279319))

(declare-fun m!1279321 () Bool)

(assert (=> b!1393322 m!1279321))

(assert (=> d!150789 m!1279185))

(declare-fun m!1279323 () Bool)

(assert (=> d!150789 m!1279323))

(assert (=> d!150789 m!1279211))

(assert (=> b!1393319 m!1279321))

(assert (=> b!1393321 m!1279321))

(assert (=> b!1393170 d!150789))

(declare-fun d!150797 () Bool)

(declare-fun lt!611938 () (_ BitVec 32))

(declare-fun lt!611937 () (_ BitVec 32))

(assert (=> d!150797 (= lt!611938 (bvmul (bvxor lt!611937 (bvlshr lt!611937 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150797 (= lt!611937 ((_ extract 31 0) (bvand (bvxor (select (arr!46027 a!2901) j!112) (bvlshr (select (arr!46027 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150797 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!932296 (let ((h!33769 ((_ extract 31 0) (bvand (bvxor (select (arr!46027 a!2901) j!112) (bvlshr (select (arr!46027 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125201 (bvmul (bvxor h!33769 (bvlshr h!33769 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125201 (bvlshr x!125201 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!932296 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!932296 #b00000000000000000000000000000000))))))

(assert (=> d!150797 (= (toIndex!0 (select (arr!46027 a!2901) j!112) mask!2840) (bvand (bvxor lt!611938 (bvlshr lt!611938 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1393170 d!150797))

(declare-fun d!150807 () Bool)

(assert (=> d!150807 (= (validKeyInArray!0 (select (arr!46027 a!2901) j!112)) (and (not (= (select (arr!46027 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46027 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1393169 d!150807))

(declare-fun b!1393384 () Bool)

(declare-fun e!789123 () Bool)

(declare-fun call!66836 () Bool)

(assert (=> b!1393384 (= e!789123 call!66836)))

(declare-fun bm!66833 () Bool)

(declare-fun c!129990 () Bool)

(assert (=> bm!66833 (= call!66836 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129990 (Cons!32529 (select (arr!46027 a!2901) #b00000000000000000000000000000000) Nil!32530) Nil!32530)))))

(declare-fun b!1393385 () Bool)

(assert (=> b!1393385 (= e!789123 call!66836)))

(declare-fun b!1393386 () Bool)

(declare-fun e!789125 () Bool)

(declare-fun contains!9810 (List!32533 (_ BitVec 64)) Bool)

(assert (=> b!1393386 (= e!789125 (contains!9810 Nil!32530 (select (arr!46027 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1393387 () Bool)

(declare-fun e!789124 () Bool)

(assert (=> b!1393387 (= e!789124 e!789123)))

(assert (=> b!1393387 (= c!129990 (validKeyInArray!0 (select (arr!46027 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1393388 () Bool)

(declare-fun e!789122 () Bool)

(assert (=> b!1393388 (= e!789122 e!789124)))

(declare-fun res!932321 () Bool)

(assert (=> b!1393388 (=> (not res!932321) (not e!789124))))

(assert (=> b!1393388 (= res!932321 (not e!789125))))

(declare-fun res!932320 () Bool)

(assert (=> b!1393388 (=> (not res!932320) (not e!789125))))

(assert (=> b!1393388 (= res!932320 (validKeyInArray!0 (select (arr!46027 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150811 () Bool)

(declare-fun res!932319 () Bool)

(assert (=> d!150811 (=> res!932319 e!789122)))

(assert (=> d!150811 (= res!932319 (bvsge #b00000000000000000000000000000000 (size!46578 a!2901)))))

(assert (=> d!150811 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32530) e!789122)))

(assert (= (and d!150811 (not res!932319)) b!1393388))

(assert (= (and b!1393388 res!932320) b!1393386))

(assert (= (and b!1393388 res!932321) b!1393387))

(assert (= (and b!1393387 c!129990) b!1393385))

(assert (= (and b!1393387 (not c!129990)) b!1393384))

(assert (= (or b!1393385 b!1393384) bm!66833))

(declare-fun m!1279367 () Bool)

(assert (=> bm!66833 m!1279367))

(declare-fun m!1279369 () Bool)

(assert (=> bm!66833 m!1279369))

(assert (=> b!1393386 m!1279367))

(assert (=> b!1393386 m!1279367))

(declare-fun m!1279371 () Bool)

(assert (=> b!1393386 m!1279371))

(assert (=> b!1393387 m!1279367))

(assert (=> b!1393387 m!1279367))

(declare-fun m!1279373 () Bool)

(assert (=> b!1393387 m!1279373))

(assert (=> b!1393388 m!1279367))

(assert (=> b!1393388 m!1279367))

(assert (=> b!1393388 m!1279373))

(assert (=> b!1393172 d!150811))

(declare-fun b!1393389 () Bool)

(declare-fun e!789128 () Bool)

(declare-fun e!789126 () Bool)

(assert (=> b!1393389 (= e!789128 e!789126)))

(declare-fun lt!611949 () (_ BitVec 64))

(assert (=> b!1393389 (= lt!611949 (select (arr!46027 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!611948 () Unit!46525)

(assert (=> b!1393389 (= lt!611948 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611949 #b00000000000000000000000000000000))))

(assert (=> b!1393389 (arrayContainsKey!0 a!2901 lt!611949 #b00000000000000000000000000000000)))

(declare-fun lt!611950 () Unit!46525)

(assert (=> b!1393389 (= lt!611950 lt!611948)))

(declare-fun res!932323 () Bool)

(assert (=> b!1393389 (= res!932323 (= (seekEntryOrOpen!0 (select (arr!46027 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10247 #b00000000000000000000000000000000)))))

(assert (=> b!1393389 (=> (not res!932323) (not e!789126))))

(declare-fun b!1393390 () Bool)

(declare-fun call!66837 () Bool)

(assert (=> b!1393390 (= e!789126 call!66837)))

(declare-fun bm!66834 () Bool)

(assert (=> bm!66834 (= call!66837 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1393391 () Bool)

(declare-fun e!789127 () Bool)

(assert (=> b!1393391 (= e!789127 e!789128)))

(declare-fun c!129991 () Bool)

(assert (=> b!1393391 (= c!129991 (validKeyInArray!0 (select (arr!46027 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1393392 () Bool)

(assert (=> b!1393392 (= e!789128 call!66837)))

(declare-fun d!150821 () Bool)

(declare-fun res!932322 () Bool)

(assert (=> d!150821 (=> res!932322 e!789127)))

(assert (=> d!150821 (= res!932322 (bvsge #b00000000000000000000000000000000 (size!46578 a!2901)))))

(assert (=> d!150821 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!789127)))

(assert (= (and d!150821 (not res!932322)) b!1393391))

(assert (= (and b!1393391 c!129991) b!1393389))

(assert (= (and b!1393391 (not c!129991)) b!1393392))

(assert (= (and b!1393389 res!932323) b!1393390))

(assert (= (or b!1393390 b!1393392) bm!66834))

(assert (=> b!1393389 m!1279367))

(declare-fun m!1279375 () Bool)

(assert (=> b!1393389 m!1279375))

(declare-fun m!1279377 () Bool)

(assert (=> b!1393389 m!1279377))

(assert (=> b!1393389 m!1279367))

(declare-fun m!1279379 () Bool)

(assert (=> b!1393389 m!1279379))

(declare-fun m!1279381 () Bool)

(assert (=> bm!66834 m!1279381))

(assert (=> b!1393391 m!1279367))

(assert (=> b!1393391 m!1279367))

(assert (=> b!1393391 m!1279373))

(assert (=> b!1393173 d!150821))

(declare-fun d!150823 () Bool)

(assert (=> d!150823 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119630 d!150823))

(declare-fun d!150825 () Bool)

(assert (=> d!150825 (= (array_inv!35308 a!2901) (bvsge (size!46578 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119630 d!150825))

(declare-fun d!150827 () Bool)

(declare-fun lt!611952 () (_ BitVec 32))

(declare-fun lt!611951 () (_ BitVec 32))

(assert (=> d!150827 (= lt!611952 (bvmul (bvxor lt!611951 (bvlshr lt!611951 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150827 (= lt!611951 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46027 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46027 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150827 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!932296 (let ((h!33769 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46027 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46027 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125201 (bvmul (bvxor h!33769 (bvlshr h!33769 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125201 (bvlshr x!125201 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!932296 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!932296 #b00000000000000000000000000000000))))))

(assert (=> d!150827 (= (toIndex!0 (select (store (arr!46027 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!611952 (bvlshr lt!611952 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1393171 d!150827))

(declare-fun d!150829 () Bool)

(assert (=> d!150829 (= (validKeyInArray!0 (select (arr!46027 a!2901) i!1037)) (and (not (= (select (arr!46027 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46027 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1393176 d!150829))

(check-sat (not b!1393391) (not d!150789) (not b!1393389) (not bm!66819) (not bm!66834) (not b!1393259) (not b!1393386) (not b!1393316) (not b!1393239) (not b!1393388) (not d!150765) (not b!1393387) (not d!150785) (not b!1393261) (not bm!66833))
(check-sat)
