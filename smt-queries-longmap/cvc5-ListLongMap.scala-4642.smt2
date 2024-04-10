; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64552 () Bool)

(assert start!64552)

(declare-fun b!727189 () Bool)

(declare-fun e!407101 () Bool)

(declare-fun e!407102 () Bool)

(assert (=> b!727189 (= e!407101 e!407102)))

(declare-fun res!488090 () Bool)

(assert (=> b!727189 (=> (not res!488090) (not e!407102))))

(declare-datatypes ((array!41070 0))(
  ( (array!41071 (arr!19656 (Array (_ BitVec 32) (_ BitVec 64))) (size!20077 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41070)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7256 0))(
  ( (MissingZero!7256 (index!31392 (_ BitVec 32))) (Found!7256 (index!31393 (_ BitVec 32))) (Intermediate!7256 (undefined!8068 Bool) (index!31394 (_ BitVec 32)) (x!62378 (_ BitVec 32))) (Undefined!7256) (MissingVacant!7256 (index!31395 (_ BitVec 32))) )
))
(declare-fun lt!322076 () SeekEntryResult!7256)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41070 (_ BitVec 32)) SeekEntryResult!7256)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727189 (= res!488090 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19656 a!3186) j!159) mask!3328) (select (arr!19656 a!3186) j!159) a!3186 mask!3328) lt!322076))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!727189 (= lt!322076 (Intermediate!7256 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun lt!322079 () SeekEntryResult!7256)

(declare-fun b!727190 () Bool)

(declare-fun e!407097 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41070 (_ BitVec 32)) SeekEntryResult!7256)

(assert (=> b!727190 (= e!407097 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19656 a!3186) j!159) a!3186 mask!3328) lt!322079))))

(declare-fun e!407100 () Bool)

(declare-fun b!727191 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!727191 (= e!407100 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19656 a!3186) j!159) a!3186 mask!3328) (Found!7256 j!159)))))

(declare-fun b!727192 () Bool)

(declare-fun res!488098 () Bool)

(assert (=> b!727192 (=> (not res!488098) (not e!407101))))

(declare-datatypes ((List!13658 0))(
  ( (Nil!13655) (Cons!13654 (h!14711 (_ BitVec 64)) (t!19973 List!13658)) )
))
(declare-fun arrayNoDuplicates!0 (array!41070 (_ BitVec 32) List!13658) Bool)

(assert (=> b!727192 (= res!488098 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13655))))

(declare-fun b!727193 () Bool)

(declare-fun e!407095 () Bool)

(assert (=> b!727193 (= e!407095 e!407101)))

(declare-fun res!488087 () Bool)

(assert (=> b!727193 (=> (not res!488087) (not e!407101))))

(declare-fun lt!322074 () SeekEntryResult!7256)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!727193 (= res!488087 (or (= lt!322074 (MissingZero!7256 i!1173)) (= lt!322074 (MissingVacant!7256 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41070 (_ BitVec 32)) SeekEntryResult!7256)

(assert (=> b!727193 (= lt!322074 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!727194 () Bool)

(declare-fun res!488091 () Bool)

(assert (=> b!727194 (=> (not res!488091) (not e!407095))))

(declare-fun arrayContainsKey!0 (array!41070 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!727194 (= res!488091 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!727195 () Bool)

(declare-fun res!488096 () Bool)

(assert (=> b!727195 (=> (not res!488096) (not e!407095))))

(assert (=> b!727195 (= res!488096 (and (= (size!20077 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20077 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20077 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!727196 () Bool)

(declare-fun res!488089 () Bool)

(assert (=> b!727196 (=> (not res!488089) (not e!407095))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!727196 (= res!488089 (validKeyInArray!0 k!2102))))

(declare-fun b!727197 () Bool)

(declare-fun res!488092 () Bool)

(assert (=> b!727197 (=> (not res!488092) (not e!407102))))

(assert (=> b!727197 (= res!488092 e!407100)))

(declare-fun c!79924 () Bool)

(assert (=> b!727197 (= c!79924 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!727198 () Bool)

(declare-fun res!488094 () Bool)

(assert (=> b!727198 (=> (not res!488094) (not e!407101))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41070 (_ BitVec 32)) Bool)

(assert (=> b!727198 (= res!488094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!488100 () Bool)

(assert (=> start!64552 (=> (not res!488100) (not e!407095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64552 (= res!488100 (validMask!0 mask!3328))))

(assert (=> start!64552 e!407095))

(assert (=> start!64552 true))

(declare-fun array_inv!15452 (array!41070) Bool)

(assert (=> start!64552 (array_inv!15452 a!3186)))

(declare-fun b!727199 () Bool)

(declare-fun e!407098 () Bool)

(declare-fun e!407094 () Bool)

(assert (=> b!727199 (= e!407098 (not e!407094))))

(declare-fun res!488093 () Bool)

(assert (=> b!727199 (=> res!488093 e!407094)))

(declare-fun lt!322077 () SeekEntryResult!7256)

(assert (=> b!727199 (= res!488093 (or (not (is-Intermediate!7256 lt!322077)) (bvsge x!1131 (x!62378 lt!322077))))))

(declare-fun e!407096 () Bool)

(assert (=> b!727199 e!407096))

(declare-fun res!488088 () Bool)

(assert (=> b!727199 (=> (not res!488088) (not e!407096))))

(assert (=> b!727199 (= res!488088 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24830 0))(
  ( (Unit!24831) )
))
(declare-fun lt!322073 () Unit!24830)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41070 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24830)

(assert (=> b!727199 (= lt!322073 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!727200 () Bool)

(declare-fun lt!322075 () (_ BitVec 32))

(assert (=> b!727200 (= e!407094 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000) (and (bvsge lt!322075 #b00000000000000000000000000000000) (bvslt lt!322075 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727200 (= lt!322075 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!727201 () Bool)

(assert (=> b!727201 (= e!407100 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19656 a!3186) j!159) a!3186 mask!3328) lt!322076))))

(declare-fun b!727202 () Bool)

(assert (=> b!727202 (= e!407096 e!407097)))

(declare-fun res!488099 () Bool)

(assert (=> b!727202 (=> (not res!488099) (not e!407097))))

(assert (=> b!727202 (= res!488099 (= (seekEntryOrOpen!0 (select (arr!19656 a!3186) j!159) a!3186 mask!3328) lt!322079))))

(assert (=> b!727202 (= lt!322079 (Found!7256 j!159))))

(declare-fun b!727203 () Bool)

(assert (=> b!727203 (= e!407102 e!407098)))

(declare-fun res!488102 () Bool)

(assert (=> b!727203 (=> (not res!488102) (not e!407098))))

(declare-fun lt!322071 () SeekEntryResult!7256)

(assert (=> b!727203 (= res!488102 (= lt!322071 lt!322077))))

(declare-fun lt!322078 () array!41070)

(declare-fun lt!322072 () (_ BitVec 64))

(assert (=> b!727203 (= lt!322077 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322072 lt!322078 mask!3328))))

(assert (=> b!727203 (= lt!322071 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322072 mask!3328) lt!322072 lt!322078 mask!3328))))

(assert (=> b!727203 (= lt!322072 (select (store (arr!19656 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!727203 (= lt!322078 (array!41071 (store (arr!19656 a!3186) i!1173 k!2102) (size!20077 a!3186)))))

(declare-fun b!727204 () Bool)

(declare-fun res!488095 () Bool)

(assert (=> b!727204 (=> (not res!488095) (not e!407101))))

(assert (=> b!727204 (= res!488095 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20077 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20077 a!3186))))))

(declare-fun b!727205 () Bool)

(declare-fun res!488097 () Bool)

(assert (=> b!727205 (=> (not res!488097) (not e!407095))))

(assert (=> b!727205 (= res!488097 (validKeyInArray!0 (select (arr!19656 a!3186) j!159)))))

(declare-fun b!727206 () Bool)

(declare-fun res!488101 () Bool)

(assert (=> b!727206 (=> (not res!488101) (not e!407102))))

(assert (=> b!727206 (= res!488101 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19656 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!64552 res!488100) b!727195))

(assert (= (and b!727195 res!488096) b!727205))

(assert (= (and b!727205 res!488097) b!727196))

(assert (= (and b!727196 res!488089) b!727194))

(assert (= (and b!727194 res!488091) b!727193))

(assert (= (and b!727193 res!488087) b!727198))

(assert (= (and b!727198 res!488094) b!727192))

(assert (= (and b!727192 res!488098) b!727204))

(assert (= (and b!727204 res!488095) b!727189))

(assert (= (and b!727189 res!488090) b!727206))

(assert (= (and b!727206 res!488101) b!727197))

(assert (= (and b!727197 c!79924) b!727201))

(assert (= (and b!727197 (not c!79924)) b!727191))

(assert (= (and b!727197 res!488092) b!727203))

(assert (= (and b!727203 res!488102) b!727199))

(assert (= (and b!727199 res!488088) b!727202))

(assert (= (and b!727202 res!488099) b!727190))

(assert (= (and b!727199 (not res!488093)) b!727200))

(declare-fun m!681169 () Bool)

(assert (=> b!727191 m!681169))

(assert (=> b!727191 m!681169))

(declare-fun m!681171 () Bool)

(assert (=> b!727191 m!681171))

(declare-fun m!681173 () Bool)

(assert (=> b!727192 m!681173))

(assert (=> b!727205 m!681169))

(assert (=> b!727205 m!681169))

(declare-fun m!681175 () Bool)

(assert (=> b!727205 m!681175))

(declare-fun m!681177 () Bool)

(assert (=> start!64552 m!681177))

(declare-fun m!681179 () Bool)

(assert (=> start!64552 m!681179))

(declare-fun m!681181 () Bool)

(assert (=> b!727203 m!681181))

(assert (=> b!727203 m!681181))

(declare-fun m!681183 () Bool)

(assert (=> b!727203 m!681183))

(declare-fun m!681185 () Bool)

(assert (=> b!727203 m!681185))

(declare-fun m!681187 () Bool)

(assert (=> b!727203 m!681187))

(declare-fun m!681189 () Bool)

(assert (=> b!727203 m!681189))

(declare-fun m!681191 () Bool)

(assert (=> b!727199 m!681191))

(declare-fun m!681193 () Bool)

(assert (=> b!727199 m!681193))

(declare-fun m!681195 () Bool)

(assert (=> b!727200 m!681195))

(declare-fun m!681197 () Bool)

(assert (=> b!727193 m!681197))

(declare-fun m!681199 () Bool)

(assert (=> b!727198 m!681199))

(assert (=> b!727202 m!681169))

(assert (=> b!727202 m!681169))

(declare-fun m!681201 () Bool)

(assert (=> b!727202 m!681201))

(declare-fun m!681203 () Bool)

(assert (=> b!727196 m!681203))

(assert (=> b!727190 m!681169))

(assert (=> b!727190 m!681169))

(declare-fun m!681205 () Bool)

(assert (=> b!727190 m!681205))

(declare-fun m!681207 () Bool)

(assert (=> b!727194 m!681207))

(assert (=> b!727189 m!681169))

(assert (=> b!727189 m!681169))

(declare-fun m!681209 () Bool)

(assert (=> b!727189 m!681209))

(assert (=> b!727189 m!681209))

(assert (=> b!727189 m!681169))

(declare-fun m!681211 () Bool)

(assert (=> b!727189 m!681211))

(declare-fun m!681213 () Bool)

(assert (=> b!727206 m!681213))

(assert (=> b!727201 m!681169))

(assert (=> b!727201 m!681169))

(declare-fun m!681215 () Bool)

(assert (=> b!727201 m!681215))

(push 1)

(assert (not b!727192))

(assert (not b!727205))

(assert (not b!727198))

(assert (not b!727196))

(assert (not b!727193))

(assert (not b!727199))

(assert (not b!727190))

(assert (not start!64552))

(assert (not b!727201))

(assert (not b!727191))

(assert (not b!727194))

(assert (not b!727203))

(assert (not b!727202))

(assert (not b!727200))

(assert (not b!727189))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!727412 () Bool)

(declare-fun e!407214 () SeekEntryResult!7256)

(declare-fun e!407217 () SeekEntryResult!7256)

(assert (=> b!727412 (= e!407214 e!407217)))

(declare-fun lt!322186 () (_ BitVec 64))

(declare-fun lt!322185 () SeekEntryResult!7256)

(assert (=> b!727412 (= lt!322186 (select (arr!19656 a!3186) (index!31394 lt!322185)))))

(declare-fun c!79974 () Bool)

(assert (=> b!727412 (= c!79974 (= lt!322186 (select (arr!19656 a!3186) j!159)))))

(declare-fun b!727414 () Bool)

(declare-fun c!79971 () Bool)

(assert (=> b!727414 (= c!79971 (= lt!322186 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!407215 () SeekEntryResult!7256)

(assert (=> b!727414 (= e!407217 e!407215)))

(declare-fun b!727416 () Bool)

(assert (=> b!727416 (= e!407217 (Found!7256 (index!31394 lt!322185)))))

(declare-fun b!727418 () Bool)

(assert (=> b!727418 (= e!407215 (seekKeyOrZeroReturnVacant!0 (x!62378 lt!322185) (index!31394 lt!322185) (index!31394 lt!322185) (select (arr!19656 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!727420 () Bool)

(assert (=> b!727420 (= e!407214 Undefined!7256)))

(declare-fun b!727422 () Bool)

(assert (=> b!727422 (= e!407215 (MissingZero!7256 (index!31394 lt!322185)))))

(declare-fun d!99461 () Bool)

(declare-fun lt!322188 () SeekEntryResult!7256)

(assert (=> d!99461 (and (or (is-Undefined!7256 lt!322188) (not (is-Found!7256 lt!322188)) (and (bvsge (index!31393 lt!322188) #b00000000000000000000000000000000) (bvslt (index!31393 lt!322188) (size!20077 a!3186)))) (or (is-Undefined!7256 lt!322188) (is-Found!7256 lt!322188) (not (is-MissingZero!7256 lt!322188)) (and (bvsge (index!31392 lt!322188) #b00000000000000000000000000000000) (bvslt (index!31392 lt!322188) (size!20077 a!3186)))) (or (is-Undefined!7256 lt!322188) (is-Found!7256 lt!322188) (is-MissingZero!7256 lt!322188) (not (is-MissingVacant!7256 lt!322188)) (and (bvsge (index!31395 lt!322188) #b00000000000000000000000000000000) (bvslt (index!31395 lt!322188) (size!20077 a!3186)))) (or (is-Undefined!7256 lt!322188) (ite (is-Found!7256 lt!322188) (= (select (arr!19656 a!3186) (index!31393 lt!322188)) (select (arr!19656 a!3186) j!159)) (ite (is-MissingZero!7256 lt!322188) (= (select (arr!19656 a!3186) (index!31392 lt!322188)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7256 lt!322188) (= (select (arr!19656 a!3186) (index!31395 lt!322188)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!99461 (= lt!322188 e!407214)))

(declare-fun c!79973 () Bool)

(assert (=> d!99461 (= c!79973 (and (is-Intermediate!7256 lt!322185) (undefined!8068 lt!322185)))))

(assert (=> d!99461 (= lt!322185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19656 a!3186) j!159) mask!3328) (select (arr!19656 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!99461 (validMask!0 mask!3328)))

(assert (=> d!99461 (= (seekEntryOrOpen!0 (select (arr!19656 a!3186) j!159) a!3186 mask!3328) lt!322188)))

(assert (= (and d!99461 c!79973) b!727420))

(assert (= (and d!99461 (not c!79973)) b!727412))

(assert (= (and b!727412 c!79974) b!727416))

(assert (= (and b!727412 (not c!79974)) b!727414))

(assert (= (and b!727414 c!79971) b!727422))

(assert (= (and b!727414 (not c!79971)) b!727418))

(declare-fun m!681355 () Bool)

(assert (=> b!727412 m!681355))

(assert (=> b!727418 m!681169))

(declare-fun m!681357 () Bool)

(assert (=> b!727418 m!681357))

(assert (=> d!99461 m!681169))

(assert (=> d!99461 m!681209))

(declare-fun m!681361 () Bool)

(assert (=> d!99461 m!681361))

(assert (=> d!99461 m!681177))

(assert (=> d!99461 m!681209))

(assert (=> d!99461 m!681169))

(assert (=> d!99461 m!681211))

(declare-fun m!681365 () Bool)

(assert (=> d!99461 m!681365))

(declare-fun m!681369 () Bool)

(assert (=> d!99461 m!681369))

(assert (=> b!727202 d!99461))

(declare-fun b!727496 () Bool)

(declare-fun e!407267 () SeekEntryResult!7256)

(assert (=> b!727496 (= e!407267 (Intermediate!7256 false index!1321 x!1131))))

(declare-fun b!727497 () Bool)

(declare-fun lt!322221 () SeekEntryResult!7256)

(assert (=> b!727497 (and (bvsge (index!31394 lt!322221) #b00000000000000000000000000000000) (bvslt (index!31394 lt!322221) (size!20077 lt!322078)))))

(declare-fun res!488249 () Bool)

(assert (=> b!727497 (= res!488249 (= (select (arr!19656 lt!322078) (index!31394 lt!322221)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!407264 () Bool)

(assert (=> b!727497 (=> res!488249 e!407264)))

(declare-fun b!727498 () Bool)

(assert (=> b!727498 (and (bvsge (index!31394 lt!322221) #b00000000000000000000000000000000) (bvslt (index!31394 lt!322221) (size!20077 lt!322078)))))

(assert (=> b!727498 (= e!407264 (= (select (arr!19656 lt!322078) (index!31394 lt!322221)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!99474 () Bool)

(declare-fun e!407265 () Bool)

(assert (=> d!99474 e!407265))

(declare-fun c!79999 () Bool)

(assert (=> d!99474 (= c!79999 (and (is-Intermediate!7256 lt!322221) (undefined!8068 lt!322221)))))

(declare-fun e!407263 () SeekEntryResult!7256)

(assert (=> d!99474 (= lt!322221 e!407263)))

(declare-fun c!79998 () Bool)

(assert (=> d!99474 (= c!79998 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!322222 () (_ BitVec 64))

(assert (=> d!99474 (= lt!322222 (select (arr!19656 lt!322078) index!1321))))

(assert (=> d!99474 (validMask!0 mask!3328)))

(assert (=> d!99474 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322072 lt!322078 mask!3328) lt!322221)))

(declare-fun b!727499 () Bool)

(assert (=> b!727499 (= e!407263 (Intermediate!7256 true index!1321 x!1131))))

(declare-fun b!727500 () Bool)

(assert (=> b!727500 (= e!407265 (bvsge (x!62378 lt!322221) #b01111111111111111111111111111110))))

(declare-fun b!727501 () Bool)

(assert (=> b!727501 (and (bvsge (index!31394 lt!322221) #b00000000000000000000000000000000) (bvslt (index!31394 lt!322221) (size!20077 lt!322078)))))

(declare-fun res!488248 () Bool)

(assert (=> b!727501 (= res!488248 (= (select (arr!19656 lt!322078) (index!31394 lt!322221)) lt!322072))))

(assert (=> b!727501 (=> res!488248 e!407264)))

(declare-fun e!407266 () Bool)

(assert (=> b!727501 (= e!407266 e!407264)))

(declare-fun b!727502 () Bool)

(assert (=> b!727502 (= e!407267 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!322072 lt!322078 mask!3328))))

(declare-fun b!727503 () Bool)

(assert (=> b!727503 (= e!407265 e!407266)))

(declare-fun res!488247 () Bool)

(assert (=> b!727503 (= res!488247 (and (is-Intermediate!7256 lt!322221) (not (undefined!8068 lt!322221)) (bvslt (x!62378 lt!322221) #b01111111111111111111111111111110) (bvsge (x!62378 lt!322221) #b00000000000000000000000000000000) (bvsge (x!62378 lt!322221) x!1131)))))

(assert (=> b!727503 (=> (not res!488247) (not e!407266))))

(declare-fun b!727504 () Bool)

(assert (=> b!727504 (= e!407263 e!407267)))

(declare-fun c!80000 () Bool)

(assert (=> b!727504 (= c!80000 (or (= lt!322222 lt!322072) (= (bvadd lt!322222 lt!322222) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!99474 c!79998) b!727499))

(assert (= (and d!99474 (not c!79998)) b!727504))

(assert (= (and b!727504 c!80000) b!727496))

(assert (= (and b!727504 (not c!80000)) b!727502))

(assert (= (and d!99474 c!79999) b!727500))

(assert (= (and d!99474 (not c!79999)) b!727503))

(assert (= (and b!727503 res!488247) b!727501))

(assert (= (and b!727501 (not res!488248)) b!727497))

(assert (= (and b!727497 (not res!488249)) b!727498))

(assert (=> b!727502 m!681195))

(assert (=> b!727502 m!681195))

(declare-fun m!681409 () Bool)

(assert (=> b!727502 m!681409))

(declare-fun m!681411 () Bool)

(assert (=> b!727498 m!681411))

(assert (=> b!727497 m!681411))

(assert (=> b!727501 m!681411))

(declare-fun m!681413 () Bool)

(assert (=> d!99474 m!681413))

(assert (=> d!99474 m!681177))

(assert (=> b!727203 d!99474))

(declare-fun b!727505 () Bool)

(declare-fun e!407272 () SeekEntryResult!7256)

(assert (=> b!727505 (= e!407272 (Intermediate!7256 false (toIndex!0 lt!322072 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!727506 () Bool)

(declare-fun lt!322223 () SeekEntryResult!7256)

(assert (=> b!727506 (and (bvsge (index!31394 lt!322223) #b00000000000000000000000000000000) (bvslt (index!31394 lt!322223) (size!20077 lt!322078)))))

(declare-fun res!488252 () Bool)

(assert (=> b!727506 (= res!488252 (= (select (arr!19656 lt!322078) (index!31394 lt!322223)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!407269 () Bool)

(assert (=> b!727506 (=> res!488252 e!407269)))

(declare-fun b!727507 () Bool)

(assert (=> b!727507 (and (bvsge (index!31394 lt!322223) #b00000000000000000000000000000000) (bvslt (index!31394 lt!322223) (size!20077 lt!322078)))))

(assert (=> b!727507 (= e!407269 (= (select (arr!19656 lt!322078) (index!31394 lt!322223)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!99493 () Bool)

(declare-fun e!407270 () Bool)

(assert (=> d!99493 e!407270))

(declare-fun c!80002 () Bool)

(assert (=> d!99493 (= c!80002 (and (is-Intermediate!7256 lt!322223) (undefined!8068 lt!322223)))))

(declare-fun e!407268 () SeekEntryResult!7256)

(assert (=> d!99493 (= lt!322223 e!407268)))

(declare-fun c!80001 () Bool)

(assert (=> d!99493 (= c!80001 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!322224 () (_ BitVec 64))

(assert (=> d!99493 (= lt!322224 (select (arr!19656 lt!322078) (toIndex!0 lt!322072 mask!3328)))))

(assert (=> d!99493 (validMask!0 mask!3328)))

(assert (=> d!99493 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322072 mask!3328) lt!322072 lt!322078 mask!3328) lt!322223)))

(declare-fun b!727508 () Bool)

(assert (=> b!727508 (= e!407268 (Intermediate!7256 true (toIndex!0 lt!322072 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!727509 () Bool)

(assert (=> b!727509 (= e!407270 (bvsge (x!62378 lt!322223) #b01111111111111111111111111111110))))

(declare-fun b!727510 () Bool)

(assert (=> b!727510 (and (bvsge (index!31394 lt!322223) #b00000000000000000000000000000000) (bvslt (index!31394 lt!322223) (size!20077 lt!322078)))))

(declare-fun res!488251 () Bool)

(assert (=> b!727510 (= res!488251 (= (select (arr!19656 lt!322078) (index!31394 lt!322223)) lt!322072))))

(assert (=> b!727510 (=> res!488251 e!407269)))

(declare-fun e!407271 () Bool)

(assert (=> b!727510 (= e!407271 e!407269)))

(declare-fun b!727511 () Bool)

(assert (=> b!727511 (= e!407272 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!322072 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!322072 lt!322078 mask!3328))))

(declare-fun b!727512 () Bool)

(assert (=> b!727512 (= e!407270 e!407271)))

(declare-fun res!488250 () Bool)

(assert (=> b!727512 (= res!488250 (and (is-Intermediate!7256 lt!322223) (not (undefined!8068 lt!322223)) (bvslt (x!62378 lt!322223) #b01111111111111111111111111111110) (bvsge (x!62378 lt!322223) #b00000000000000000000000000000000) (bvsge (x!62378 lt!322223) #b00000000000000000000000000000000)))))

(assert (=> b!727512 (=> (not res!488250) (not e!407271))))

(declare-fun b!727513 () Bool)

(assert (=> b!727513 (= e!407268 e!407272)))

(declare-fun c!80003 () Bool)

(assert (=> b!727513 (= c!80003 (or (= lt!322224 lt!322072) (= (bvadd lt!322224 lt!322224) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!99493 c!80001) b!727508))

(assert (= (and d!99493 (not c!80001)) b!727513))

(assert (= (and b!727513 c!80003) b!727505))

(assert (= (and b!727513 (not c!80003)) b!727511))

(assert (= (and d!99493 c!80002) b!727509))

(assert (= (and d!99493 (not c!80002)) b!727512))

(assert (= (and b!727512 res!488250) b!727510))

(assert (= (and b!727510 (not res!488251)) b!727506))

(assert (= (and b!727506 (not res!488252)) b!727507))

(assert (=> b!727511 m!681181))

(declare-fun m!681415 () Bool)

(assert (=> b!727511 m!681415))

(assert (=> b!727511 m!681415))

(declare-fun m!681417 () Bool)

(assert (=> b!727511 m!681417))

(declare-fun m!681419 () Bool)

(assert (=> b!727507 m!681419))

(assert (=> b!727506 m!681419))

(assert (=> b!727510 m!681419))

(assert (=> d!99493 m!681181))

(declare-fun m!681421 () Bool)

(assert (=> d!99493 m!681421))

(assert (=> d!99493 m!681177))

(assert (=> b!727203 d!99493))

(declare-fun d!99495 () Bool)

(declare-fun lt!322233 () (_ BitVec 32))

(declare-fun lt!322232 () (_ BitVec 32))

(assert (=> d!99495 (= lt!322233 (bvmul (bvxor lt!322232 (bvlshr lt!322232 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99495 (= lt!322232 ((_ extract 31 0) (bvand (bvxor lt!322072 (bvlshr lt!322072 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99495 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!488253 (let ((h!14715 ((_ extract 31 0) (bvand (bvxor lt!322072 (bvlshr lt!322072 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62387 (bvmul (bvxor h!14715 (bvlshr h!14715 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62387 (bvlshr x!62387 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!488253 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!488253 #b00000000000000000000000000000000))))))

(assert (=> d!99495 (= (toIndex!0 lt!322072 mask!3328) (bvand (bvxor lt!322233 (bvlshr lt!322233 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!727203 d!99495))

(declare-fun b!727551 () Bool)

(declare-fun e!407302 () Bool)

(declare-fun e!407301 () Bool)

(assert (=> b!727551 (= e!407302 e!407301)))

(declare-fun res!488271 () Bool)

(assert (=> b!727551 (=> (not res!488271) (not e!407301))))

(declare-fun e!407299 () Bool)

(assert (=> b!727551 (= res!488271 (not e!407299))))

(declare-fun res!488269 () Bool)

(assert (=> b!727551 (=> (not res!488269) (not e!407299))))

(assert (=> b!727551 (= res!488269 (validKeyInArray!0 (select (arr!19656 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!727553 () Bool)

(declare-fun contains!4051 (List!13658 (_ BitVec 64)) Bool)

(assert (=> b!727553 (= e!407299 (contains!4051 Nil!13655 (select (arr!19656 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!727554 () Bool)

(declare-fun e!407300 () Bool)

(declare-fun call!34822 () Bool)

(assert (=> b!727554 (= e!407300 call!34822)))

(declare-fun b!727555 () Bool)

(assert (=> b!727555 (= e!407301 e!407300)))

(declare-fun c!80015 () Bool)

(assert (=> b!727555 (= c!80015 (validKeyInArray!0 (select (arr!19656 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34819 () Bool)

(assert (=> bm!34819 (= call!34822 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!80015 (Cons!13654 (select (arr!19656 a!3186) #b00000000000000000000000000000000) Nil!13655) Nil!13655)))))

(declare-fun b!727552 () Bool)

(assert (=> b!727552 (= e!407300 call!34822)))

(declare-fun d!99499 () Bool)

(declare-fun res!488270 () Bool)

(assert (=> d!99499 (=> res!488270 e!407302)))

(assert (=> d!99499 (= res!488270 (bvsge #b00000000000000000000000000000000 (size!20077 a!3186)))))

(assert (=> d!99499 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13655) e!407302)))

(assert (= (and d!99499 (not res!488270)) b!727551))

(assert (= (and b!727551 res!488269) b!727553))

(assert (= (and b!727551 res!488271) b!727555))

(assert (= (and b!727555 c!80015) b!727552))

(assert (= (and b!727555 (not c!80015)) b!727554))

(assert (= (or b!727552 b!727554) bm!34819))

(declare-fun m!681443 () Bool)

(assert (=> b!727551 m!681443))

(assert (=> b!727551 m!681443))

(declare-fun m!681445 () Bool)

(assert (=> b!727551 m!681445))

(assert (=> b!727553 m!681443))

(assert (=> b!727553 m!681443))

(declare-fun m!681447 () Bool)

(assert (=> b!727553 m!681447))

(assert (=> b!727555 m!681443))

(assert (=> b!727555 m!681443))

(assert (=> b!727555 m!681445))

(assert (=> bm!34819 m!681443))

(declare-fun m!681449 () Bool)

(assert (=> bm!34819 m!681449))

(assert (=> b!727192 d!99499))

(declare-fun b!727556 () Bool)

(declare-fun e!407307 () SeekEntryResult!7256)

(assert (=> b!727556 (= e!407307 (Intermediate!7256 false index!1321 x!1131))))

(declare-fun b!727557 () Bool)

(declare-fun lt!322236 () SeekEntryResult!7256)

(assert (=> b!727557 (and (bvsge (index!31394 lt!322236) #b00000000000000000000000000000000) (bvslt (index!31394 lt!322236) (size!20077 a!3186)))))

(declare-fun res!488274 () Bool)

(assert (=> b!727557 (= res!488274 (= (select (arr!19656 a!3186) (index!31394 lt!322236)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!407304 () Bool)

(assert (=> b!727557 (=> res!488274 e!407304)))

(declare-fun b!727558 () Bool)

(assert (=> b!727558 (and (bvsge (index!31394 lt!322236) #b00000000000000000000000000000000) (bvslt (index!31394 lt!322236) (size!20077 a!3186)))))

(assert (=> b!727558 (= e!407304 (= (select (arr!19656 a!3186) (index!31394 lt!322236)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!99507 () Bool)

(declare-fun e!407305 () Bool)

(assert (=> d!99507 e!407305))

(declare-fun c!80017 () Bool)

(assert (=> d!99507 (= c!80017 (and (is-Intermediate!7256 lt!322236) (undefined!8068 lt!322236)))))

(declare-fun e!407303 () SeekEntryResult!7256)

(assert (=> d!99507 (= lt!322236 e!407303)))

(declare-fun c!80016 () Bool)

(assert (=> d!99507 (= c!80016 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!322237 () (_ BitVec 64))

(assert (=> d!99507 (= lt!322237 (select (arr!19656 a!3186) index!1321))))

(assert (=> d!99507 (validMask!0 mask!3328)))

(assert (=> d!99507 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19656 a!3186) j!159) a!3186 mask!3328) lt!322236)))

(declare-fun b!727559 () Bool)

(assert (=> b!727559 (= e!407303 (Intermediate!7256 true index!1321 x!1131))))

(declare-fun b!727560 () Bool)

(assert (=> b!727560 (= e!407305 (bvsge (x!62378 lt!322236) #b01111111111111111111111111111110))))

(declare-fun b!727561 () Bool)

(assert (=> b!727561 (and (bvsge (index!31394 lt!322236) #b00000000000000000000000000000000) (bvslt (index!31394 lt!322236) (size!20077 a!3186)))))

(declare-fun res!488273 () Bool)

(assert (=> b!727561 (= res!488273 (= (select (arr!19656 a!3186) (index!31394 lt!322236)) (select (arr!19656 a!3186) j!159)))))

(assert (=> b!727561 (=> res!488273 e!407304)))

(declare-fun e!407306 () Bool)

(assert (=> b!727561 (= e!407306 e!407304)))

(declare-fun b!727562 () Bool)

(assert (=> b!727562 (= e!407307 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!19656 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!727563 () Bool)

(assert (=> b!727563 (= e!407305 e!407306)))

(declare-fun res!488272 () Bool)

(assert (=> b!727563 (= res!488272 (and (is-Intermediate!7256 lt!322236) (not (undefined!8068 lt!322236)) (bvslt (x!62378 lt!322236) #b01111111111111111111111111111110) (bvsge (x!62378 lt!322236) #b00000000000000000000000000000000) (bvsge (x!62378 lt!322236) x!1131)))))

(assert (=> b!727563 (=> (not res!488272) (not e!407306))))

(declare-fun b!727564 () Bool)

(assert (=> b!727564 (= e!407303 e!407307)))

(declare-fun c!80018 () Bool)

(assert (=> b!727564 (= c!80018 (or (= lt!322237 (select (arr!19656 a!3186) j!159)) (= (bvadd lt!322237 lt!322237) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!99507 c!80016) b!727559))

(assert (= (and d!99507 (not c!80016)) b!727564))

(assert (= (and b!727564 c!80018) b!727556))

(assert (= (and b!727564 (not c!80018)) b!727562))

(assert (= (and d!99507 c!80017) b!727560))

(assert (= (and d!99507 (not c!80017)) b!727563))

(assert (= (and b!727563 res!488272) b!727561))

(assert (= (and b!727561 (not res!488273)) b!727557))

(assert (= (and b!727557 (not res!488274)) b!727558))

(assert (=> b!727562 m!681195))

(assert (=> b!727562 m!681195))

(assert (=> b!727562 m!681169))

(declare-fun m!681451 () Bool)

(assert (=> b!727562 m!681451))

(declare-fun m!681453 () Bool)

(assert (=> b!727558 m!681453))

(assert (=> b!727557 m!681453))

(assert (=> b!727561 m!681453))

(declare-fun m!681455 () Bool)

(assert (=> d!99507 m!681455))

(assert (=> d!99507 m!681177))

(assert (=> b!727201 d!99507))

(declare-fun b!727625 () Bool)

(declare-fun c!80041 () Bool)

(declare-fun lt!322257 () (_ BitVec 64))

(assert (=> b!727625 (= c!80041 (= lt!322257 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!407345 () SeekEntryResult!7256)

(declare-fun e!407343 () SeekEntryResult!7256)

(assert (=> b!727625 (= e!407345 e!407343)))

(declare-fun b!727626 () Bool)

(assert (=> b!727626 (= e!407345 (Found!7256 resIntermediateIndex!5))))

(declare-fun b!727627 () Bool)

(assert (=> b!727627 (= e!407343 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!19656 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!727628 () Bool)

(assert (=> b!727628 (= e!407343 (MissingVacant!7256 resIntermediateIndex!5))))

(declare-fun b!727629 () Bool)

(declare-fun e!407344 () SeekEntryResult!7256)

(assert (=> b!727629 (= e!407344 e!407345)))

(declare-fun c!80040 () Bool)

(assert (=> b!727629 (= c!80040 (= lt!322257 (select (arr!19656 a!3186) j!159)))))

(declare-fun d!99509 () Bool)

(declare-fun lt!322258 () SeekEntryResult!7256)

(assert (=> d!99509 (and (or (is-Undefined!7256 lt!322258) (not (is-Found!7256 lt!322258)) (and (bvsge (index!31393 lt!322258) #b00000000000000000000000000000000) (bvslt (index!31393 lt!322258) (size!20077 a!3186)))) (or (is-Undefined!7256 lt!322258) (is-Found!7256 lt!322258) (not (is-MissingVacant!7256 lt!322258)) (not (= (index!31395 lt!322258) resIntermediateIndex!5)) (and (bvsge (index!31395 lt!322258) #b00000000000000000000000000000000) (bvslt (index!31395 lt!322258) (size!20077 a!3186)))) (or (is-Undefined!7256 lt!322258) (ite (is-Found!7256 lt!322258) (= (select (arr!19656 a!3186) (index!31393 lt!322258)) (select (arr!19656 a!3186) j!159)) (and (is-MissingVacant!7256 lt!322258) (= (index!31395 lt!322258) resIntermediateIndex!5) (= (select (arr!19656 a!3186) (index!31395 lt!322258)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99509 (= lt!322258 e!407344)))

(declare-fun c!80042 () Bool)

(assert (=> d!99509 (= c!80042 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!99509 (= lt!322257 (select (arr!19656 a!3186) resIntermediateIndex!5))))

(assert (=> d!99509 (validMask!0 mask!3328)))

(assert (=> d!99509 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19656 a!3186) j!159) a!3186 mask!3328) lt!322258)))

(declare-fun b!727630 () Bool)

(assert (=> b!727630 (= e!407344 Undefined!7256)))

(assert (= (and d!99509 c!80042) b!727630))

(assert (= (and d!99509 (not c!80042)) b!727629))

(assert (= (and b!727629 c!80040) b!727626))

(assert (= (and b!727629 (not c!80040)) b!727625))

(assert (= (and b!727625 c!80041) b!727628))

(assert (= (and b!727625 (not c!80041)) b!727627))

(declare-fun m!681487 () Bool)

(assert (=> b!727627 m!681487))

(assert (=> b!727627 m!681487))

(assert (=> b!727627 m!681169))

(declare-fun m!681489 () Bool)

(assert (=> b!727627 m!681489))

(declare-fun m!681491 () Bool)

(assert (=> d!99509 m!681491))

(declare-fun m!681493 () Bool)

(assert (=> d!99509 m!681493))

(assert (=> d!99509 m!681213))

(assert (=> d!99509 m!681177))

(assert (=> b!727190 d!99509))

(declare-fun b!727635 () Bool)

(declare-fun c!80045 () Bool)

(declare-fun lt!322264 () (_ BitVec 64))

(assert (=> b!727635 (= c!80045 (= lt!322264 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!407351 () SeekEntryResult!7256)

(declare-fun e!407349 () SeekEntryResult!7256)

(assert (=> b!727635 (= e!407351 e!407349)))

(declare-fun b!727636 () Bool)

(assert (=> b!727636 (= e!407351 (Found!7256 index!1321))))

(declare-fun b!727637 () Bool)

(assert (=> b!727637 (= e!407349 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19656 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!727638 () Bool)

(assert (=> b!727638 (= e!407349 (MissingVacant!7256 resIntermediateIndex!5))))

(declare-fun b!727639 () Bool)

(declare-fun e!407350 () SeekEntryResult!7256)

(assert (=> b!727639 (= e!407350 e!407351)))

(declare-fun c!80044 () Bool)

(assert (=> b!727639 (= c!80044 (= lt!322264 (select (arr!19656 a!3186) j!159)))))

(declare-fun lt!322265 () SeekEntryResult!7256)

(declare-fun d!99523 () Bool)

(assert (=> d!99523 (and (or (is-Undefined!7256 lt!322265) (not (is-Found!7256 lt!322265)) (and (bvsge (index!31393 lt!322265) #b00000000000000000000000000000000) (bvslt (index!31393 lt!322265) (size!20077 a!3186)))) (or (is-Undefined!7256 lt!322265) (is-Found!7256 lt!322265) (not (is-MissingVacant!7256 lt!322265)) (not (= (index!31395 lt!322265) resIntermediateIndex!5)) (and (bvsge (index!31395 lt!322265) #b00000000000000000000000000000000) (bvslt (index!31395 lt!322265) (size!20077 a!3186)))) (or (is-Undefined!7256 lt!322265) (ite (is-Found!7256 lt!322265) (= (select (arr!19656 a!3186) (index!31393 lt!322265)) (select (arr!19656 a!3186) j!159)) (and (is-MissingVacant!7256 lt!322265) (= (index!31395 lt!322265) resIntermediateIndex!5) (= (select (arr!19656 a!3186) (index!31395 lt!322265)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99523 (= lt!322265 e!407350)))

(declare-fun c!80046 () Bool)

(assert (=> d!99523 (= c!80046 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99523 (= lt!322264 (select (arr!19656 a!3186) index!1321))))

(assert (=> d!99523 (validMask!0 mask!3328)))

(assert (=> d!99523 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19656 a!3186) j!159) a!3186 mask!3328) lt!322265)))

(declare-fun b!727640 () Bool)

(assert (=> b!727640 (= e!407350 Undefined!7256)))

(assert (= (and d!99523 c!80046) b!727640))

(assert (= (and d!99523 (not c!80046)) b!727639))

(assert (= (and b!727639 c!80044) b!727636))

(assert (= (and b!727639 (not c!80044)) b!727635))

(assert (= (and b!727635 c!80045) b!727638))

(assert (= (and b!727635 (not c!80045)) b!727637))

(assert (=> b!727637 m!681195))

(assert (=> b!727637 m!681195))

(assert (=> b!727637 m!681169))

(declare-fun m!681503 () Bool)

(assert (=> b!727637 m!681503))

(declare-fun m!681505 () Bool)

(assert (=> d!99523 m!681505))

(declare-fun m!681507 () Bool)

(assert (=> d!99523 m!681507))

(assert (=> d!99523 m!681455))

(assert (=> d!99523 m!681177))

(assert (=> b!727191 d!99523))

(declare-fun e!407356 () SeekEntryResult!7256)

(declare-fun b!727641 () Bool)

(assert (=> b!727641 (= e!407356 (Intermediate!7256 false (toIndex!0 (select (arr!19656 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!727642 () Bool)

(declare-fun lt!322266 () SeekEntryResult!7256)

(assert (=> b!727642 (and (bvsge (index!31394 lt!322266) #b00000000000000000000000000000000) (bvslt (index!31394 lt!322266) (size!20077 a!3186)))))

(declare-fun res!488298 () Bool)

(assert (=> b!727642 (= res!488298 (= (select (arr!19656 a!3186) (index!31394 lt!322266)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!407353 () Bool)

(assert (=> b!727642 (=> res!488298 e!407353)))

(declare-fun b!727643 () Bool)

(assert (=> b!727643 (and (bvsge (index!31394 lt!322266) #b00000000000000000000000000000000) (bvslt (index!31394 lt!322266) (size!20077 a!3186)))))

(assert (=> b!727643 (= e!407353 (= (select (arr!19656 a!3186) (index!31394 lt!322266)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!99527 () Bool)

(declare-fun e!407354 () Bool)

(assert (=> d!99527 e!407354))

(declare-fun c!80048 () Bool)

(assert (=> d!99527 (= c!80048 (and (is-Intermediate!7256 lt!322266) (undefined!8068 lt!322266)))))

(declare-fun e!407352 () SeekEntryResult!7256)

(assert (=> d!99527 (= lt!322266 e!407352)))

(declare-fun c!80047 () Bool)

(assert (=> d!99527 (= c!80047 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!322267 () (_ BitVec 64))

(assert (=> d!99527 (= lt!322267 (select (arr!19656 a!3186) (toIndex!0 (select (arr!19656 a!3186) j!159) mask!3328)))))

(assert (=> d!99527 (validMask!0 mask!3328)))

(assert (=> d!99527 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19656 a!3186) j!159) mask!3328) (select (arr!19656 a!3186) j!159) a!3186 mask!3328) lt!322266)))

(declare-fun b!727644 () Bool)

(assert (=> b!727644 (= e!407352 (Intermediate!7256 true (toIndex!0 (select (arr!19656 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!727645 () Bool)

(assert (=> b!727645 (= e!407354 (bvsge (x!62378 lt!322266) #b01111111111111111111111111111110))))

(declare-fun b!727646 () Bool)

(assert (=> b!727646 (and (bvsge (index!31394 lt!322266) #b00000000000000000000000000000000) (bvslt (index!31394 lt!322266) (size!20077 a!3186)))))

(declare-fun res!488297 () Bool)

(assert (=> b!727646 (= res!488297 (= (select (arr!19656 a!3186) (index!31394 lt!322266)) (select (arr!19656 a!3186) j!159)))))

(assert (=> b!727646 (=> res!488297 e!407353)))

(declare-fun e!407355 () Bool)

(assert (=> b!727646 (= e!407355 e!407353)))

(declare-fun b!727647 () Bool)

(assert (=> b!727647 (= e!407356 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19656 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!19656 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!727648 () Bool)

(assert (=> b!727648 (= e!407354 e!407355)))

(declare-fun res!488296 () Bool)

(assert (=> b!727648 (= res!488296 (and (is-Intermediate!7256 lt!322266) (not (undefined!8068 lt!322266)) (bvslt (x!62378 lt!322266) #b01111111111111111111111111111110) (bvsge (x!62378 lt!322266) #b00000000000000000000000000000000) (bvsge (x!62378 lt!322266) #b00000000000000000000000000000000)))))

(assert (=> b!727648 (=> (not res!488296) (not e!407355))))

(declare-fun b!727649 () Bool)

(assert (=> b!727649 (= e!407352 e!407356)))

(declare-fun c!80049 () Bool)

(assert (=> b!727649 (= c!80049 (or (= lt!322267 (select (arr!19656 a!3186) j!159)) (= (bvadd lt!322267 lt!322267) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!99527 c!80047) b!727644))

(assert (= (and d!99527 (not c!80047)) b!727649))

(assert (= (and b!727649 c!80049) b!727641))

(assert (= (and b!727649 (not c!80049)) b!727647))

(assert (= (and d!99527 c!80048) b!727645))

(assert (= (and d!99527 (not c!80048)) b!727648))

(assert (= (and b!727648 res!488296) b!727646))

(assert (= (and b!727646 (not res!488297)) b!727642))

(assert (= (and b!727642 (not res!488298)) b!727643))

(assert (=> b!727647 m!681209))

(declare-fun m!681509 () Bool)

(assert (=> b!727647 m!681509))

(assert (=> b!727647 m!681509))

(assert (=> b!727647 m!681169))

(declare-fun m!681511 () Bool)

(assert (=> b!727647 m!681511))

(declare-fun m!681513 () Bool)

(assert (=> b!727643 m!681513))

(assert (=> b!727642 m!681513))

(assert (=> b!727646 m!681513))

(assert (=> d!99527 m!681209))

(declare-fun m!681515 () Bool)

(assert (=> d!99527 m!681515))

(assert (=> d!99527 m!681177))

(assert (=> b!727189 d!99527))

(declare-fun d!99529 () Bool)

(declare-fun lt!322269 () (_ BitVec 32))

(declare-fun lt!322268 () (_ BitVec 32))

(assert (=> d!99529 (= lt!322269 (bvmul (bvxor lt!322268 (bvlshr lt!322268 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99529 (= lt!322268 ((_ extract 31 0) (bvand (bvxor (select (arr!19656 a!3186) j!159) (bvlshr (select (arr!19656 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99529 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!488253 (let ((h!14715 ((_ extract 31 0) (bvand (bvxor (select (arr!19656 a!3186) j!159) (bvlshr (select (arr!19656 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62387 (bvmul (bvxor h!14715 (bvlshr h!14715 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62387 (bvlshr x!62387 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!488253 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!488253 #b00000000000000000000000000000000))))))

(assert (=> d!99529 (= (toIndex!0 (select (arr!19656 a!3186) j!159) mask!3328) (bvand (bvxor lt!322269 (bvlshr lt!322269 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!727189 d!99529))

(declare-fun d!99531 () Bool)

(declare-fun lt!322272 () (_ BitVec 32))

(assert (=> d!99531 (and (bvsge lt!322272 #b00000000000000000000000000000000) (bvslt lt!322272 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!99531 (= lt!322272 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!99531 (validMask!0 mask!3328)))

(assert (=> d!99531 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!322272)))

(declare-fun bs!20867 () Bool)

(assert (= bs!20867 d!99531))

(declare-fun m!681517 () Bool)

(assert (=> bs!20867 m!681517))

(assert (=> bs!20867 m!681177))

(assert (=> b!727200 d!99531))

(declare-fun d!99533 () Bool)

(declare-fun res!488303 () Bool)

(declare-fun e!407370 () Bool)

(assert (=> d!99533 (=> res!488303 e!407370)))

(assert (=> d!99533 (= res!488303 (bvsge #b00000000000000000000000000000000 (size!20077 a!3186)))))

(assert (=> d!99533 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!407370)))

(declare-fun b!727670 () Bool)

(declare-fun e!407371 () Bool)

(assert (=> b!727670 (= e!407370 e!407371)))

(declare-fun c!80058 () Bool)

(assert (=> b!727670 (= c!80058 (validKeyInArray!0 (select (arr!19656 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!727671 () Bool)

(declare-fun e!407369 () Bool)

(declare-fun call!34826 () Bool)

(assert (=> b!727671 (= e!407369 call!34826)))

(declare-fun b!727672 () Bool)

(assert (=> b!727672 (= e!407371 call!34826)))

(declare-fun bm!34823 () Bool)

(assert (=> bm!34823 (= call!34826 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!727673 () Bool)

(assert (=> b!727673 (= e!407371 e!407369)))

(declare-fun lt!322285 () (_ BitVec 64))

(assert (=> b!727673 (= lt!322285 (select (arr!19656 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!322284 () Unit!24830)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!41070 (_ BitVec 64) (_ BitVec 32)) Unit!24830)

(assert (=> b!727673 (= lt!322284 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!322285 #b00000000000000000000000000000000))))

(assert (=> b!727673 (arrayContainsKey!0 a!3186 lt!322285 #b00000000000000000000000000000000)))

(declare-fun lt!322283 () Unit!24830)

(assert (=> b!727673 (= lt!322283 lt!322284)))

(declare-fun res!488304 () Bool)

(assert (=> b!727673 (= res!488304 (= (seekEntryOrOpen!0 (select (arr!19656 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7256 #b00000000000000000000000000000000)))))

(assert (=> b!727673 (=> (not res!488304) (not e!407369))))

(assert (= (and d!99533 (not res!488303)) b!727670))

(assert (= (and b!727670 c!80058) b!727673))

(assert (= (and b!727670 (not c!80058)) b!727672))

(assert (= (and b!727673 res!488304) b!727671))

(assert (= (or b!727671 b!727672) bm!34823))

(assert (=> b!727670 m!681443))

(assert (=> b!727670 m!681443))

(assert (=> b!727670 m!681445))

(declare-fun m!681519 () Bool)

(assert (=> bm!34823 m!681519))

(assert (=> b!727673 m!681443))

(declare-fun m!681521 () Bool)

(assert (=> b!727673 m!681521))

(declare-fun m!681523 () Bool)

(assert (=> b!727673 m!681523))

(assert (=> b!727673 m!681443))

(declare-fun m!681525 () Bool)

(assert (=> b!727673 m!681525))

(assert (=> b!727198 d!99533))

(declare-fun d!99535 () Bool)

(declare-fun res!488305 () Bool)

(declare-fun e!407373 () Bool)

(assert (=> d!99535 (=> res!488305 e!407373)))

(assert (=> d!99535 (= res!488305 (bvsge j!159 (size!20077 a!3186)))))

(assert (=> d!99535 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!407373)))

(declare-fun b!727674 () Bool)

(declare-fun e!407374 () Bool)

(assert (=> b!727674 (= e!407373 e!407374)))

(declare-fun c!80059 () Bool)

(assert (=> b!727674 (= c!80059 (validKeyInArray!0 (select (arr!19656 a!3186) j!159)))))

(declare-fun b!727675 () Bool)

(declare-fun e!407372 () Bool)

(declare-fun call!34827 () Bool)

(assert (=> b!727675 (= e!407372 call!34827)))

(declare-fun b!727676 () Bool)

(assert (=> b!727676 (= e!407374 call!34827)))

(declare-fun bm!34824 () Bool)

(assert (=> bm!34824 (= call!34827 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!727677 () Bool)

(assert (=> b!727677 (= e!407374 e!407372)))

(declare-fun lt!322288 () (_ BitVec 64))

(assert (=> b!727677 (= lt!322288 (select (arr!19656 a!3186) j!159))))

(declare-fun lt!322287 () Unit!24830)

(assert (=> b!727677 (= lt!322287 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!322288 j!159))))

(assert (=> b!727677 (arrayContainsKey!0 a!3186 lt!322288 #b00000000000000000000000000000000)))

(declare-fun lt!322286 () Unit!24830)

(assert (=> b!727677 (= lt!322286 lt!322287)))

(declare-fun res!488306 () Bool)

(assert (=> b!727677 (= res!488306 (= (seekEntryOrOpen!0 (select (arr!19656 a!3186) j!159) a!3186 mask!3328) (Found!7256 j!159)))))

(assert (=> b!727677 (=> (not res!488306) (not e!407372))))

(assert (= (and d!99535 (not res!488305)) b!727674))

(assert (= (and b!727674 c!80059) b!727677))

(assert (= (and b!727674 (not c!80059)) b!727676))

(assert (= (and b!727677 res!488306) b!727675))

(assert (= (or b!727675 b!727676) bm!34824))

(assert (=> b!727674 m!681169))

(assert (=> b!727674 m!681169))

(assert (=> b!727674 m!681175))

(declare-fun m!681527 () Bool)

(assert (=> bm!34824 m!681527))

(assert (=> b!727677 m!681169))

(declare-fun m!681529 () Bool)

(assert (=> b!727677 m!681529))

(declare-fun m!681531 () Bool)

(assert (=> b!727677 m!681531))

(assert (=> b!727677 m!681169))

(assert (=> b!727677 m!681201))

(assert (=> b!727199 d!99535))

(declare-fun d!99537 () Bool)

(assert (=> d!99537 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!322300 () Unit!24830)

(declare-fun choose!38 (array!41070 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24830)

(assert (=> d!99537 (= lt!322300 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!99537 (validMask!0 mask!3328)))

(assert (=> d!99537 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!322300)))

(declare-fun bs!20868 () Bool)

(assert (= bs!20868 d!99537))

(assert (=> bs!20868 m!681191))

(declare-fun m!681567 () Bool)

(assert (=> bs!20868 m!681567))

(assert (=> bs!20868 m!681177))

(assert (=> b!727199 d!99537))

(declare-fun d!99547 () Bool)

(assert (=> d!99547 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!64552 d!99547))

(declare-fun d!99551 () Bool)

(assert (=> d!99551 (= (array_inv!15452 a!3186) (bvsge (size!20077 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!64552 d!99551))

(declare-fun d!99555 () Bool)

(assert (=> d!99555 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!727196 d!99555))

(declare-fun d!99557 () Bool)

(assert (=> d!99557 (= (validKeyInArray!0 (select (arr!19656 a!3186) j!159)) (and (not (= (select (arr!19656 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19656 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!727205 d!99557))

(declare-fun d!99559 () Bool)

(declare-fun res!488323 () Bool)

(declare-fun e!407404 () Bool)

(assert (=> d!99559 (=> res!488323 e!407404)))

(assert (=> d!99559 (= res!488323 (= (select (arr!19656 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!99559 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!407404)))

(declare-fun b!727724 () Bool)

(declare-fun e!407405 () Bool)

(assert (=> b!727724 (= e!407404 e!407405)))

(declare-fun res!488324 () Bool)

(assert (=> b!727724 (=> (not res!488324) (not e!407405))))

(assert (=> b!727724 (= res!488324 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20077 a!3186)))))

(declare-fun b!727725 () Bool)

(assert (=> b!727725 (= e!407405 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99559 (not res!488323)) b!727724))

(assert (= (and b!727724 res!488324) b!727725))

(assert (=> d!99559 m!681443))

(declare-fun m!681577 () Bool)

(assert (=> b!727725 m!681577))

(assert (=> b!727194 d!99559))

(declare-fun b!727726 () Bool)

(declare-fun e!407406 () SeekEntryResult!7256)

(declare-fun e!407408 () SeekEntryResult!7256)

(assert (=> b!727726 (= e!407406 e!407408)))

(declare-fun lt!322304 () (_ BitVec 64))

(declare-fun lt!322303 () SeekEntryResult!7256)

(assert (=> b!727726 (= lt!322304 (select (arr!19656 a!3186) (index!31394 lt!322303)))))

(declare-fun c!80077 () Bool)

(assert (=> b!727726 (= c!80077 (= lt!322304 k!2102))))

(declare-fun b!727727 () Bool)

(declare-fun c!80075 () Bool)

(assert (=> b!727727 (= c!80075 (= lt!322304 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!407407 () SeekEntryResult!7256)

(assert (=> b!727727 (= e!407408 e!407407)))

(declare-fun b!727728 () Bool)

(assert (=> b!727728 (= e!407408 (Found!7256 (index!31394 lt!322303)))))

(declare-fun b!727729 () Bool)

(assert (=> b!727729 (= e!407407 (seekKeyOrZeroReturnVacant!0 (x!62378 lt!322303) (index!31394 lt!322303) (index!31394 lt!322303) k!2102 a!3186 mask!3328))))

(declare-fun b!727730 () Bool)

(assert (=> b!727730 (= e!407406 Undefined!7256)))

(declare-fun b!727731 () Bool)

(assert (=> b!727731 (= e!407407 (MissingZero!7256 (index!31394 lt!322303)))))

(declare-fun d!99563 () Bool)

(declare-fun lt!322305 () SeekEntryResult!7256)

(assert (=> d!99563 (and (or (is-Undefined!7256 lt!322305) (not (is-Found!7256 lt!322305)) (and (bvsge (index!31393 lt!322305) #b00000000000000000000000000000000) (bvslt (index!31393 lt!322305) (size!20077 a!3186)))) (or (is-Undefined!7256 lt!322305) (is-Found!7256 lt!322305) (not (is-MissingZero!7256 lt!322305)) (and (bvsge (index!31392 lt!322305) #b00000000000000000000000000000000) (bvslt (index!31392 lt!322305) (size!20077 a!3186)))) (or (is-Undefined!7256 lt!322305) (is-Found!7256 lt!322305) (is-MissingZero!7256 lt!322305) (not (is-MissingVacant!7256 lt!322305)) (and (bvsge (index!31395 lt!322305) #b00000000000000000000000000000000) (bvslt (index!31395 lt!322305) (size!20077 a!3186)))) (or (is-Undefined!7256 lt!322305) (ite (is-Found!7256 lt!322305) (= (select (arr!19656 a!3186) (index!31393 lt!322305)) k!2102) (ite (is-MissingZero!7256 lt!322305) (= (select (arr!19656 a!3186) (index!31392 lt!322305)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7256 lt!322305) (= (select (arr!19656 a!3186) (index!31395 lt!322305)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!99563 (= lt!322305 e!407406)))

(declare-fun c!80076 () Bool)

(assert (=> d!99563 (= c!80076 (and (is-Intermediate!7256 lt!322303) (undefined!8068 lt!322303)))))

(assert (=> d!99563 (= lt!322303 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!99563 (validMask!0 mask!3328)))

(assert (=> d!99563 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!322305)))

(assert (= (and d!99563 c!80076) b!727730))

(assert (= (and d!99563 (not c!80076)) b!727726))

(assert (= (and b!727726 c!80077) b!727728))

(assert (= (and b!727726 (not c!80077)) b!727727))

(assert (= (and b!727727 c!80075) b!727731))

(assert (= (and b!727727 (not c!80075)) b!727729))

(declare-fun m!681581 () Bool)

(assert (=> b!727726 m!681581))

(declare-fun m!681583 () Bool)

(assert (=> b!727729 m!681583))

(declare-fun m!681585 () Bool)

(assert (=> d!99563 m!681585))

(declare-fun m!681587 () Bool)

(assert (=> d!99563 m!681587))

(assert (=> d!99563 m!681177))

(assert (=> d!99563 m!681585))

(declare-fun m!681589 () Bool)

(assert (=> d!99563 m!681589))

(declare-fun m!681591 () Bool)

(assert (=> d!99563 m!681591))

(declare-fun m!681593 () Bool)

(assert (=> d!99563 m!681593))

(assert (=> b!727193 d!99563))

(push 1)

