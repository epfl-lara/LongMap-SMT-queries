; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123332 () Bool)

(assert start!123332)

(declare-fun b!1428954 () Bool)

(declare-fun res!963110 () Bool)

(declare-fun e!807182 () Bool)

(assert (=> b!1428954 (=> (not res!963110) (not e!807182))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(assert (=> b!1428954 (= res!963110 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1428955 () Bool)

(declare-fun res!963103 () Bool)

(declare-fun e!807184 () Bool)

(assert (=> b!1428955 (=> (not res!963103) (not e!807184))))

(declare-datatypes ((array!97466 0))(
  ( (array!97467 (arr!47044 (Array (_ BitVec 32) (_ BitVec 64))) (size!47595 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97466)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428955 (= res!963103 (validKeyInArray!0 (select (arr!47044 a!2831) i!982)))))

(declare-fun b!1428956 () Bool)

(declare-fun res!963106 () Bool)

(assert (=> b!1428956 (=> (not res!963106) (not e!807184))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1428956 (= res!963106 (and (= (size!47595 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47595 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47595 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1428957 () Bool)

(declare-fun e!807183 () Bool)

(assert (=> b!1428957 (= e!807183 e!807182)))

(declare-fun res!963101 () Bool)

(assert (=> b!1428957 (=> (not res!963101) (not e!807182))))

(declare-datatypes ((SeekEntryResult!11225 0))(
  ( (MissingZero!11225 (index!47292 (_ BitVec 32))) (Found!11225 (index!47293 (_ BitVec 32))) (Intermediate!11225 (undefined!12037 Bool) (index!47294 (_ BitVec 32)) (x!129088 (_ BitVec 32))) (Undefined!11225) (MissingVacant!11225 (index!47295 (_ BitVec 32))) )
))
(declare-fun lt!629126 () SeekEntryResult!11225)

(declare-fun lt!629129 () (_ BitVec 64))

(declare-fun lt!629125 () array!97466)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97466 (_ BitVec 32)) SeekEntryResult!11225)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428957 (= res!963101 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629129 mask!2608) lt!629129 lt!629125 mask!2608) lt!629126))))

(assert (=> b!1428957 (= lt!629126 (Intermediate!11225 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1428957 (= lt!629129 (select (store (arr!47044 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428957 (= lt!629125 (array!97467 (store (arr!47044 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47595 a!2831)))))

(declare-fun b!1428958 () Bool)

(declare-fun res!963100 () Bool)

(assert (=> b!1428958 (=> (not res!963100) (not e!807182))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!629128 () SeekEntryResult!11225)

(assert (=> b!1428958 (= res!963100 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47044 a!2831) j!81) a!2831 mask!2608) lt!629128))))

(declare-fun b!1428959 () Bool)

(declare-fun res!963109 () Bool)

(assert (=> b!1428959 (=> (not res!963109) (not e!807184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97466 (_ BitVec 32)) Bool)

(assert (=> b!1428959 (= res!963109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun e!807181 () Bool)

(declare-fun b!1428960 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97466 (_ BitVec 32)) SeekEntryResult!11225)

(assert (=> b!1428960 (= e!807181 (= (seekEntryOrOpen!0 (select (arr!47044 a!2831) j!81) a!2831 mask!2608) (Found!11225 j!81)))))

(declare-fun b!1428961 () Bool)

(assert (=> b!1428961 (= e!807184 e!807183)))

(declare-fun res!963111 () Bool)

(assert (=> b!1428961 (=> (not res!963111) (not e!807183))))

(assert (=> b!1428961 (= res!963111 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47044 a!2831) j!81) mask!2608) (select (arr!47044 a!2831) j!81) a!2831 mask!2608) lt!629128))))

(assert (=> b!1428961 (= lt!629128 (Intermediate!11225 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1428962 () Bool)

(declare-fun res!963102 () Bool)

(assert (=> b!1428962 (=> (not res!963102) (not e!807184))))

(declare-datatypes ((List!33541 0))(
  ( (Nil!33538) (Cons!33537 (h!34856 (_ BitVec 64)) (t!48227 List!33541)) )
))
(declare-fun arrayNoDuplicates!0 (array!97466 (_ BitVec 32) List!33541) Bool)

(assert (=> b!1428962 (= res!963102 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33538))))

(declare-fun res!963112 () Bool)

(assert (=> start!123332 (=> (not res!963112) (not e!807184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123332 (= res!963112 (validMask!0 mask!2608))))

(assert (=> start!123332 e!807184))

(assert (=> start!123332 true))

(declare-fun array_inv!36325 (array!97466) Bool)

(assert (=> start!123332 (array_inv!36325 a!2831)))

(declare-fun b!1428963 () Bool)

(declare-fun res!963104 () Bool)

(assert (=> b!1428963 (=> (not res!963104) (not e!807184))))

(assert (=> b!1428963 (= res!963104 (validKeyInArray!0 (select (arr!47044 a!2831) j!81)))))

(declare-fun b!1428964 () Bool)

(declare-fun res!963105 () Bool)

(assert (=> b!1428964 (=> (not res!963105) (not e!807184))))

(assert (=> b!1428964 (= res!963105 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47595 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47595 a!2831))))))

(declare-fun b!1428965 () Bool)

(assert (=> b!1428965 (= e!807182 (not (or (= (select (arr!47044 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (select (arr!47044 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1428965 e!807181))

(declare-fun res!963107 () Bool)

(assert (=> b!1428965 (=> (not res!963107) (not e!807181))))

(assert (=> b!1428965 (= res!963107 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48227 0))(
  ( (Unit!48228) )
))
(declare-fun lt!629127 () Unit!48227)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97466 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48227)

(assert (=> b!1428965 (= lt!629127 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1428966 () Bool)

(declare-fun res!963108 () Bool)

(assert (=> b!1428966 (=> (not res!963108) (not e!807182))))

(assert (=> b!1428966 (= res!963108 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629129 lt!629125 mask!2608) lt!629126))))

(assert (= (and start!123332 res!963112) b!1428956))

(assert (= (and b!1428956 res!963106) b!1428955))

(assert (= (and b!1428955 res!963103) b!1428963))

(assert (= (and b!1428963 res!963104) b!1428959))

(assert (= (and b!1428959 res!963109) b!1428962))

(assert (= (and b!1428962 res!963102) b!1428964))

(assert (= (and b!1428964 res!963105) b!1428961))

(assert (= (and b!1428961 res!963111) b!1428957))

(assert (= (and b!1428957 res!963101) b!1428958))

(assert (= (and b!1428958 res!963100) b!1428966))

(assert (= (and b!1428966 res!963108) b!1428954))

(assert (= (and b!1428954 res!963110) b!1428965))

(assert (= (and b!1428965 res!963107) b!1428960))

(declare-fun m!1319439 () Bool)

(assert (=> b!1428961 m!1319439))

(assert (=> b!1428961 m!1319439))

(declare-fun m!1319441 () Bool)

(assert (=> b!1428961 m!1319441))

(assert (=> b!1428961 m!1319441))

(assert (=> b!1428961 m!1319439))

(declare-fun m!1319443 () Bool)

(assert (=> b!1428961 m!1319443))

(declare-fun m!1319445 () Bool)

(assert (=> b!1428957 m!1319445))

(assert (=> b!1428957 m!1319445))

(declare-fun m!1319447 () Bool)

(assert (=> b!1428957 m!1319447))

(declare-fun m!1319449 () Bool)

(assert (=> b!1428957 m!1319449))

(declare-fun m!1319451 () Bool)

(assert (=> b!1428957 m!1319451))

(declare-fun m!1319453 () Bool)

(assert (=> b!1428965 m!1319453))

(declare-fun m!1319455 () Bool)

(assert (=> b!1428965 m!1319455))

(declare-fun m!1319457 () Bool)

(assert (=> b!1428965 m!1319457))

(assert (=> b!1428958 m!1319439))

(assert (=> b!1428958 m!1319439))

(declare-fun m!1319459 () Bool)

(assert (=> b!1428958 m!1319459))

(assert (=> b!1428963 m!1319439))

(assert (=> b!1428963 m!1319439))

(declare-fun m!1319461 () Bool)

(assert (=> b!1428963 m!1319461))

(declare-fun m!1319463 () Bool)

(assert (=> b!1428962 m!1319463))

(declare-fun m!1319465 () Bool)

(assert (=> b!1428966 m!1319465))

(declare-fun m!1319467 () Bool)

(assert (=> b!1428959 m!1319467))

(declare-fun m!1319469 () Bool)

(assert (=> b!1428955 m!1319469))

(assert (=> b!1428955 m!1319469))

(declare-fun m!1319471 () Bool)

(assert (=> b!1428955 m!1319471))

(declare-fun m!1319473 () Bool)

(assert (=> start!123332 m!1319473))

(declare-fun m!1319475 () Bool)

(assert (=> start!123332 m!1319475))

(assert (=> b!1428960 m!1319439))

(assert (=> b!1428960 m!1319439))

(declare-fun m!1319477 () Bool)

(assert (=> b!1428960 m!1319477))

(check-sat (not b!1428955) (not b!1428965) (not b!1428957) (not b!1428959) (not b!1428958) (not b!1428960) (not b!1428962) (not start!123332) (not b!1428963) (not b!1428966) (not b!1428961))
(check-sat)
(get-model)

(declare-fun e!807222 () SeekEntryResult!11225)

(declare-fun lt!629168 () SeekEntryResult!11225)

(declare-fun b!1429058 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97466 (_ BitVec 32)) SeekEntryResult!11225)

(assert (=> b!1429058 (= e!807222 (seekKeyOrZeroReturnVacant!0 (x!129088 lt!629168) (index!47294 lt!629168) (index!47294 lt!629168) (select (arr!47044 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1429059 () Bool)

(declare-fun e!807223 () SeekEntryResult!11225)

(assert (=> b!1429059 (= e!807223 Undefined!11225)))

(declare-fun b!1429060 () Bool)

(declare-fun e!807224 () SeekEntryResult!11225)

(assert (=> b!1429060 (= e!807223 e!807224)))

(declare-fun lt!629167 () (_ BitVec 64))

(assert (=> b!1429060 (= lt!629167 (select (arr!47044 a!2831) (index!47294 lt!629168)))))

(declare-fun c!132431 () Bool)

(assert (=> b!1429060 (= c!132431 (= lt!629167 (select (arr!47044 a!2831) j!81)))))

(declare-fun d!153795 () Bool)

(declare-fun lt!629166 () SeekEntryResult!11225)

(get-info :version)

(assert (=> d!153795 (and (or ((_ is Undefined!11225) lt!629166) (not ((_ is Found!11225) lt!629166)) (and (bvsge (index!47293 lt!629166) #b00000000000000000000000000000000) (bvslt (index!47293 lt!629166) (size!47595 a!2831)))) (or ((_ is Undefined!11225) lt!629166) ((_ is Found!11225) lt!629166) (not ((_ is MissingZero!11225) lt!629166)) (and (bvsge (index!47292 lt!629166) #b00000000000000000000000000000000) (bvslt (index!47292 lt!629166) (size!47595 a!2831)))) (or ((_ is Undefined!11225) lt!629166) ((_ is Found!11225) lt!629166) ((_ is MissingZero!11225) lt!629166) (not ((_ is MissingVacant!11225) lt!629166)) (and (bvsge (index!47295 lt!629166) #b00000000000000000000000000000000) (bvslt (index!47295 lt!629166) (size!47595 a!2831)))) (or ((_ is Undefined!11225) lt!629166) (ite ((_ is Found!11225) lt!629166) (= (select (arr!47044 a!2831) (index!47293 lt!629166)) (select (arr!47044 a!2831) j!81)) (ite ((_ is MissingZero!11225) lt!629166) (= (select (arr!47044 a!2831) (index!47292 lt!629166)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11225) lt!629166) (= (select (arr!47044 a!2831) (index!47295 lt!629166)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!153795 (= lt!629166 e!807223)))

(declare-fun c!132432 () Bool)

(assert (=> d!153795 (= c!132432 (and ((_ is Intermediate!11225) lt!629168) (undefined!12037 lt!629168)))))

(assert (=> d!153795 (= lt!629168 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47044 a!2831) j!81) mask!2608) (select (arr!47044 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153795 (validMask!0 mask!2608)))

(assert (=> d!153795 (= (seekEntryOrOpen!0 (select (arr!47044 a!2831) j!81) a!2831 mask!2608) lt!629166)))

(declare-fun b!1429057 () Bool)

(declare-fun c!132433 () Bool)

(assert (=> b!1429057 (= c!132433 (= lt!629167 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1429057 (= e!807224 e!807222)))

(declare-fun b!1429061 () Bool)

(assert (=> b!1429061 (= e!807224 (Found!11225 (index!47294 lt!629168)))))

(declare-fun b!1429062 () Bool)

(assert (=> b!1429062 (= e!807222 (MissingZero!11225 (index!47294 lt!629168)))))

(assert (= (and d!153795 c!132432) b!1429059))

(assert (= (and d!153795 (not c!132432)) b!1429060))

(assert (= (and b!1429060 c!132431) b!1429061))

(assert (= (and b!1429060 (not c!132431)) b!1429057))

(assert (= (and b!1429057 c!132433) b!1429062))

(assert (= (and b!1429057 (not c!132433)) b!1429058))

(assert (=> b!1429058 m!1319439))

(declare-fun m!1319559 () Bool)

(assert (=> b!1429058 m!1319559))

(declare-fun m!1319561 () Bool)

(assert (=> b!1429060 m!1319561))

(assert (=> d!153795 m!1319473))

(declare-fun m!1319563 () Bool)

(assert (=> d!153795 m!1319563))

(declare-fun m!1319565 () Bool)

(assert (=> d!153795 m!1319565))

(assert (=> d!153795 m!1319441))

(assert (=> d!153795 m!1319439))

(assert (=> d!153795 m!1319443))

(declare-fun m!1319567 () Bool)

(assert (=> d!153795 m!1319567))

(assert (=> d!153795 m!1319439))

(assert (=> d!153795 m!1319441))

(assert (=> b!1428960 d!153795))

(declare-fun bm!67443 () Bool)

(declare-fun call!67446 () Bool)

(assert (=> bm!67443 (= call!67446 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1429071 () Bool)

(declare-fun e!807231 () Bool)

(declare-fun e!807233 () Bool)

(assert (=> b!1429071 (= e!807231 e!807233)))

(declare-fun c!132436 () Bool)

(assert (=> b!1429071 (= c!132436 (validKeyInArray!0 (select (arr!47044 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1429073 () Bool)

(declare-fun e!807232 () Bool)

(assert (=> b!1429073 (= e!807233 e!807232)))

(declare-fun lt!629175 () (_ BitVec 64))

(assert (=> b!1429073 (= lt!629175 (select (arr!47044 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!629176 () Unit!48227)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97466 (_ BitVec 64) (_ BitVec 32)) Unit!48227)

(assert (=> b!1429073 (= lt!629176 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629175 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97466 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1429073 (arrayContainsKey!0 a!2831 lt!629175 #b00000000000000000000000000000000)))

(declare-fun lt!629177 () Unit!48227)

(assert (=> b!1429073 (= lt!629177 lt!629176)))

(declare-fun res!963196 () Bool)

(assert (=> b!1429073 (= res!963196 (= (seekEntryOrOpen!0 (select (arr!47044 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11225 #b00000000000000000000000000000000)))))

(assert (=> b!1429073 (=> (not res!963196) (not e!807232))))

(declare-fun b!1429074 () Bool)

(assert (=> b!1429074 (= e!807233 call!67446)))

(declare-fun b!1429072 () Bool)

(assert (=> b!1429072 (= e!807232 call!67446)))

(declare-fun d!153797 () Bool)

(declare-fun res!963195 () Bool)

(assert (=> d!153797 (=> res!963195 e!807231)))

(assert (=> d!153797 (= res!963195 (bvsge #b00000000000000000000000000000000 (size!47595 a!2831)))))

(assert (=> d!153797 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!807231)))

(assert (= (and d!153797 (not res!963195)) b!1429071))

(assert (= (and b!1429071 c!132436) b!1429073))

(assert (= (and b!1429071 (not c!132436)) b!1429074))

(assert (= (and b!1429073 res!963196) b!1429072))

(assert (= (or b!1429072 b!1429074) bm!67443))

(declare-fun m!1319569 () Bool)

(assert (=> bm!67443 m!1319569))

(declare-fun m!1319571 () Bool)

(assert (=> b!1429071 m!1319571))

(assert (=> b!1429071 m!1319571))

(declare-fun m!1319573 () Bool)

(assert (=> b!1429071 m!1319573))

(assert (=> b!1429073 m!1319571))

(declare-fun m!1319575 () Bool)

(assert (=> b!1429073 m!1319575))

(declare-fun m!1319577 () Bool)

(assert (=> b!1429073 m!1319577))

(assert (=> b!1429073 m!1319571))

(declare-fun m!1319579 () Bool)

(assert (=> b!1429073 m!1319579))

(assert (=> b!1428959 d!153797))

(declare-fun b!1429120 () Bool)

(declare-fun e!807267 () Bool)

(declare-fun e!807266 () Bool)

(assert (=> b!1429120 (= e!807267 e!807266)))

(declare-fun res!963219 () Bool)

(declare-fun lt!629194 () SeekEntryResult!11225)

(assert (=> b!1429120 (= res!963219 (and ((_ is Intermediate!11225) lt!629194) (not (undefined!12037 lt!629194)) (bvslt (x!129088 lt!629194) #b01111111111111111111111111111110) (bvsge (x!129088 lt!629194) #b00000000000000000000000000000000) (bvsge (x!129088 lt!629194) #b00000000000000000000000000000000)))))

(assert (=> b!1429120 (=> (not res!963219) (not e!807266))))

(declare-fun e!807268 () SeekEntryResult!11225)

(declare-fun b!1429121 () Bool)

(assert (=> b!1429121 (= e!807268 (Intermediate!11225 false (toIndex!0 (select (arr!47044 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1429122 () Bool)

(assert (=> b!1429122 (and (bvsge (index!47294 lt!629194) #b00000000000000000000000000000000) (bvslt (index!47294 lt!629194) (size!47595 a!2831)))))

(declare-fun res!963218 () Bool)

(assert (=> b!1429122 (= res!963218 (= (select (arr!47044 a!2831) (index!47294 lt!629194)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807265 () Bool)

(assert (=> b!1429122 (=> res!963218 e!807265)))

(declare-fun b!1429123 () Bool)

(assert (=> b!1429123 (and (bvsge (index!47294 lt!629194) #b00000000000000000000000000000000) (bvslt (index!47294 lt!629194) (size!47595 a!2831)))))

(declare-fun res!963220 () Bool)

(assert (=> b!1429123 (= res!963220 (= (select (arr!47044 a!2831) (index!47294 lt!629194)) (select (arr!47044 a!2831) j!81)))))

(assert (=> b!1429123 (=> res!963220 e!807265)))

(assert (=> b!1429123 (= e!807266 e!807265)))

(declare-fun b!1429124 () Bool)

(declare-fun e!807269 () SeekEntryResult!11225)

(assert (=> b!1429124 (= e!807269 e!807268)))

(declare-fun c!132451 () Bool)

(declare-fun lt!629195 () (_ BitVec 64))

(assert (=> b!1429124 (= c!132451 (or (= lt!629195 (select (arr!47044 a!2831) j!81)) (= (bvadd lt!629195 lt!629195) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1429125 () Bool)

(assert (=> b!1429125 (= e!807269 (Intermediate!11225 true (toIndex!0 (select (arr!47044 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!153799 () Bool)

(assert (=> d!153799 e!807267))

(declare-fun c!132450 () Bool)

(assert (=> d!153799 (= c!132450 (and ((_ is Intermediate!11225) lt!629194) (undefined!12037 lt!629194)))))

(assert (=> d!153799 (= lt!629194 e!807269)))

(declare-fun c!132449 () Bool)

(assert (=> d!153799 (= c!132449 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153799 (= lt!629195 (select (arr!47044 a!2831) (toIndex!0 (select (arr!47044 a!2831) j!81) mask!2608)))))

(assert (=> d!153799 (validMask!0 mask!2608)))

(assert (=> d!153799 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47044 a!2831) j!81) mask!2608) (select (arr!47044 a!2831) j!81) a!2831 mask!2608) lt!629194)))

(declare-fun b!1429126 () Bool)

(assert (=> b!1429126 (= e!807267 (bvsge (x!129088 lt!629194) #b01111111111111111111111111111110))))

(declare-fun b!1429127 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429127 (= e!807268 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47044 a!2831) j!81) mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) (select (arr!47044 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1429128 () Bool)

(assert (=> b!1429128 (and (bvsge (index!47294 lt!629194) #b00000000000000000000000000000000) (bvslt (index!47294 lt!629194) (size!47595 a!2831)))))

(assert (=> b!1429128 (= e!807265 (= (select (arr!47044 a!2831) (index!47294 lt!629194)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!153799 c!132449) b!1429125))

(assert (= (and d!153799 (not c!132449)) b!1429124))

(assert (= (and b!1429124 c!132451) b!1429121))

(assert (= (and b!1429124 (not c!132451)) b!1429127))

(assert (= (and d!153799 c!132450) b!1429126))

(assert (= (and d!153799 (not c!132450)) b!1429120))

(assert (= (and b!1429120 res!963219) b!1429123))

(assert (= (and b!1429123 (not res!963220)) b!1429122))

(assert (= (and b!1429122 (not res!963218)) b!1429128))

(declare-fun m!1319597 () Bool)

(assert (=> b!1429128 m!1319597))

(assert (=> b!1429127 m!1319441))

(declare-fun m!1319599 () Bool)

(assert (=> b!1429127 m!1319599))

(assert (=> b!1429127 m!1319599))

(assert (=> b!1429127 m!1319439))

(declare-fun m!1319601 () Bool)

(assert (=> b!1429127 m!1319601))

(assert (=> b!1429122 m!1319597))

(assert (=> b!1429123 m!1319597))

(assert (=> d!153799 m!1319441))

(declare-fun m!1319603 () Bool)

(assert (=> d!153799 m!1319603))

(assert (=> d!153799 m!1319473))

(assert (=> b!1428961 d!153799))

(declare-fun d!153811 () Bool)

(declare-fun lt!629205 () (_ BitVec 32))

(declare-fun lt!629204 () (_ BitVec 32))

(assert (=> d!153811 (= lt!629205 (bvmul (bvxor lt!629204 (bvlshr lt!629204 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153811 (= lt!629204 ((_ extract 31 0) (bvand (bvxor (select (arr!47044 a!2831) j!81) (bvlshr (select (arr!47044 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153811 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!963221 (let ((h!34859 ((_ extract 31 0) (bvand (bvxor (select (arr!47044 a!2831) j!81) (bvlshr (select (arr!47044 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129092 (bvmul (bvxor h!34859 (bvlshr h!34859 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129092 (bvlshr x!129092 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!963221 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!963221 #b00000000000000000000000000000000))))))

(assert (=> d!153811 (= (toIndex!0 (select (arr!47044 a!2831) j!81) mask!2608) (bvand (bvxor lt!629205 (bvlshr lt!629205 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1428961 d!153811))

(declare-fun b!1429147 () Bool)

(declare-fun e!807282 () Bool)

(declare-fun e!807281 () Bool)

(assert (=> b!1429147 (= e!807282 e!807281)))

(declare-fun res!963229 () Bool)

(declare-fun lt!629206 () SeekEntryResult!11225)

(assert (=> b!1429147 (= res!963229 (and ((_ is Intermediate!11225) lt!629206) (not (undefined!12037 lt!629206)) (bvslt (x!129088 lt!629206) #b01111111111111111111111111111110) (bvsge (x!129088 lt!629206) #b00000000000000000000000000000000) (bvsge (x!129088 lt!629206) #b00000000000000000000000000000000)))))

(assert (=> b!1429147 (=> (not res!963229) (not e!807281))))

(declare-fun b!1429148 () Bool)

(declare-fun e!807283 () SeekEntryResult!11225)

(assert (=> b!1429148 (= e!807283 (Intermediate!11225 false (toIndex!0 lt!629129 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1429149 () Bool)

(assert (=> b!1429149 (and (bvsge (index!47294 lt!629206) #b00000000000000000000000000000000) (bvslt (index!47294 lt!629206) (size!47595 lt!629125)))))

(declare-fun res!963228 () Bool)

(assert (=> b!1429149 (= res!963228 (= (select (arr!47044 lt!629125) (index!47294 lt!629206)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807280 () Bool)

(assert (=> b!1429149 (=> res!963228 e!807280)))

(declare-fun b!1429150 () Bool)

(assert (=> b!1429150 (and (bvsge (index!47294 lt!629206) #b00000000000000000000000000000000) (bvslt (index!47294 lt!629206) (size!47595 lt!629125)))))

(declare-fun res!963230 () Bool)

(assert (=> b!1429150 (= res!963230 (= (select (arr!47044 lt!629125) (index!47294 lt!629206)) lt!629129))))

(assert (=> b!1429150 (=> res!963230 e!807280)))

(assert (=> b!1429150 (= e!807281 e!807280)))

(declare-fun b!1429151 () Bool)

(declare-fun e!807284 () SeekEntryResult!11225)

(assert (=> b!1429151 (= e!807284 e!807283)))

(declare-fun c!132460 () Bool)

(declare-fun lt!629207 () (_ BitVec 64))

(assert (=> b!1429151 (= c!132460 (or (= lt!629207 lt!629129) (= (bvadd lt!629207 lt!629207) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1429152 () Bool)

(assert (=> b!1429152 (= e!807284 (Intermediate!11225 true (toIndex!0 lt!629129 mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!153813 () Bool)

(assert (=> d!153813 e!807282))

(declare-fun c!132459 () Bool)

(assert (=> d!153813 (= c!132459 (and ((_ is Intermediate!11225) lt!629206) (undefined!12037 lt!629206)))))

(assert (=> d!153813 (= lt!629206 e!807284)))

(declare-fun c!132458 () Bool)

(assert (=> d!153813 (= c!132458 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153813 (= lt!629207 (select (arr!47044 lt!629125) (toIndex!0 lt!629129 mask!2608)))))

(assert (=> d!153813 (validMask!0 mask!2608)))

(assert (=> d!153813 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629129 mask!2608) lt!629129 lt!629125 mask!2608) lt!629206)))

(declare-fun b!1429153 () Bool)

(assert (=> b!1429153 (= e!807282 (bvsge (x!129088 lt!629206) #b01111111111111111111111111111110))))

(declare-fun b!1429154 () Bool)

(assert (=> b!1429154 (= e!807283 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!629129 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) lt!629129 lt!629125 mask!2608))))

(declare-fun b!1429155 () Bool)

(assert (=> b!1429155 (and (bvsge (index!47294 lt!629206) #b00000000000000000000000000000000) (bvslt (index!47294 lt!629206) (size!47595 lt!629125)))))

(assert (=> b!1429155 (= e!807280 (= (select (arr!47044 lt!629125) (index!47294 lt!629206)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!153813 c!132458) b!1429152))

(assert (= (and d!153813 (not c!132458)) b!1429151))

(assert (= (and b!1429151 c!132460) b!1429148))

(assert (= (and b!1429151 (not c!132460)) b!1429154))

(assert (= (and d!153813 c!132459) b!1429153))

(assert (= (and d!153813 (not c!132459)) b!1429147))

(assert (= (and b!1429147 res!963229) b!1429150))

(assert (= (and b!1429150 (not res!963230)) b!1429149))

(assert (= (and b!1429149 (not res!963228)) b!1429155))

(declare-fun m!1319605 () Bool)

(assert (=> b!1429155 m!1319605))

(assert (=> b!1429154 m!1319445))

(declare-fun m!1319607 () Bool)

(assert (=> b!1429154 m!1319607))

(assert (=> b!1429154 m!1319607))

(declare-fun m!1319609 () Bool)

(assert (=> b!1429154 m!1319609))

(assert (=> b!1429149 m!1319605))

(assert (=> b!1429150 m!1319605))

(assert (=> d!153813 m!1319445))

(declare-fun m!1319611 () Bool)

(assert (=> d!153813 m!1319611))

(assert (=> d!153813 m!1319473))

(assert (=> b!1428957 d!153813))

(declare-fun d!153815 () Bool)

(declare-fun lt!629209 () (_ BitVec 32))

(declare-fun lt!629208 () (_ BitVec 32))

(assert (=> d!153815 (= lt!629209 (bvmul (bvxor lt!629208 (bvlshr lt!629208 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153815 (= lt!629208 ((_ extract 31 0) (bvand (bvxor lt!629129 (bvlshr lt!629129 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153815 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!963221 (let ((h!34859 ((_ extract 31 0) (bvand (bvxor lt!629129 (bvlshr lt!629129 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129092 (bvmul (bvxor h!34859 (bvlshr h!34859 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129092 (bvlshr x!129092 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!963221 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!963221 #b00000000000000000000000000000000))))))

(assert (=> d!153815 (= (toIndex!0 lt!629129 mask!2608) (bvand (bvxor lt!629209 (bvlshr lt!629209 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1428957 d!153815))

(declare-fun b!1429156 () Bool)

(declare-fun e!807287 () Bool)

(declare-fun e!807286 () Bool)

(assert (=> b!1429156 (= e!807287 e!807286)))

(declare-fun res!963232 () Bool)

(declare-fun lt!629210 () SeekEntryResult!11225)

(assert (=> b!1429156 (= res!963232 (and ((_ is Intermediate!11225) lt!629210) (not (undefined!12037 lt!629210)) (bvslt (x!129088 lt!629210) #b01111111111111111111111111111110) (bvsge (x!129088 lt!629210) #b00000000000000000000000000000000) (bvsge (x!129088 lt!629210) x!605)))))

(assert (=> b!1429156 (=> (not res!963232) (not e!807286))))

(declare-fun b!1429157 () Bool)

(declare-fun e!807288 () SeekEntryResult!11225)

(assert (=> b!1429157 (= e!807288 (Intermediate!11225 false index!585 x!605))))

(declare-fun b!1429158 () Bool)

(assert (=> b!1429158 (and (bvsge (index!47294 lt!629210) #b00000000000000000000000000000000) (bvslt (index!47294 lt!629210) (size!47595 a!2831)))))

(declare-fun res!963231 () Bool)

(assert (=> b!1429158 (= res!963231 (= (select (arr!47044 a!2831) (index!47294 lt!629210)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807285 () Bool)

(assert (=> b!1429158 (=> res!963231 e!807285)))

(declare-fun b!1429159 () Bool)

(assert (=> b!1429159 (and (bvsge (index!47294 lt!629210) #b00000000000000000000000000000000) (bvslt (index!47294 lt!629210) (size!47595 a!2831)))))

(declare-fun res!963233 () Bool)

(assert (=> b!1429159 (= res!963233 (= (select (arr!47044 a!2831) (index!47294 lt!629210)) (select (arr!47044 a!2831) j!81)))))

(assert (=> b!1429159 (=> res!963233 e!807285)))

(assert (=> b!1429159 (= e!807286 e!807285)))

(declare-fun b!1429160 () Bool)

(declare-fun e!807289 () SeekEntryResult!11225)

(assert (=> b!1429160 (= e!807289 e!807288)))

(declare-fun lt!629211 () (_ BitVec 64))

(declare-fun c!132463 () Bool)

(assert (=> b!1429160 (= c!132463 (or (= lt!629211 (select (arr!47044 a!2831) j!81)) (= (bvadd lt!629211 lt!629211) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1429161 () Bool)

(assert (=> b!1429161 (= e!807289 (Intermediate!11225 true index!585 x!605))))

(declare-fun d!153817 () Bool)

(assert (=> d!153817 e!807287))

(declare-fun c!132462 () Bool)

(assert (=> d!153817 (= c!132462 (and ((_ is Intermediate!11225) lt!629210) (undefined!12037 lt!629210)))))

(assert (=> d!153817 (= lt!629210 e!807289)))

(declare-fun c!132461 () Bool)

(assert (=> d!153817 (= c!132461 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153817 (= lt!629211 (select (arr!47044 a!2831) index!585))))

(assert (=> d!153817 (validMask!0 mask!2608)))

(assert (=> d!153817 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47044 a!2831) j!81) a!2831 mask!2608) lt!629210)))

(declare-fun b!1429162 () Bool)

(assert (=> b!1429162 (= e!807287 (bvsge (x!129088 lt!629210) #b01111111111111111111111111111110))))

(declare-fun b!1429163 () Bool)

(assert (=> b!1429163 (= e!807288 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) (select (arr!47044 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1429164 () Bool)

(assert (=> b!1429164 (and (bvsge (index!47294 lt!629210) #b00000000000000000000000000000000) (bvslt (index!47294 lt!629210) (size!47595 a!2831)))))

(assert (=> b!1429164 (= e!807285 (= (select (arr!47044 a!2831) (index!47294 lt!629210)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!153817 c!132461) b!1429161))

(assert (= (and d!153817 (not c!132461)) b!1429160))

(assert (= (and b!1429160 c!132463) b!1429157))

(assert (= (and b!1429160 (not c!132463)) b!1429163))

(assert (= (and d!153817 c!132462) b!1429162))

(assert (= (and d!153817 (not c!132462)) b!1429156))

(assert (= (and b!1429156 res!963232) b!1429159))

(assert (= (and b!1429159 (not res!963233)) b!1429158))

(assert (= (and b!1429158 (not res!963231)) b!1429164))

(declare-fun m!1319613 () Bool)

(assert (=> b!1429164 m!1319613))

(declare-fun m!1319615 () Bool)

(assert (=> b!1429163 m!1319615))

(assert (=> b!1429163 m!1319615))

(assert (=> b!1429163 m!1319439))

(declare-fun m!1319617 () Bool)

(assert (=> b!1429163 m!1319617))

(assert (=> b!1429158 m!1319613))

(assert (=> b!1429159 m!1319613))

(assert (=> d!153817 m!1319453))

(assert (=> d!153817 m!1319473))

(assert (=> b!1428958 d!153817))

(declare-fun call!67453 () Bool)

(declare-fun bm!67450 () Bool)

(assert (=> bm!67450 (= call!67453 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1429174 () Bool)

(declare-fun e!807295 () Bool)

(declare-fun e!807297 () Bool)

(assert (=> b!1429174 (= e!807295 e!807297)))

(declare-fun c!132467 () Bool)

(assert (=> b!1429174 (= c!132467 (validKeyInArray!0 (select (arr!47044 a!2831) j!81)))))

(declare-fun b!1429176 () Bool)

(declare-fun e!807296 () Bool)

(assert (=> b!1429176 (= e!807297 e!807296)))

(declare-fun lt!629214 () (_ BitVec 64))

(assert (=> b!1429176 (= lt!629214 (select (arr!47044 a!2831) j!81))))

(declare-fun lt!629215 () Unit!48227)

(assert (=> b!1429176 (= lt!629215 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629214 j!81))))

(assert (=> b!1429176 (arrayContainsKey!0 a!2831 lt!629214 #b00000000000000000000000000000000)))

(declare-fun lt!629216 () Unit!48227)

(assert (=> b!1429176 (= lt!629216 lt!629215)))

(declare-fun res!963238 () Bool)

(assert (=> b!1429176 (= res!963238 (= (seekEntryOrOpen!0 (select (arr!47044 a!2831) j!81) a!2831 mask!2608) (Found!11225 j!81)))))

(assert (=> b!1429176 (=> (not res!963238) (not e!807296))))

(declare-fun b!1429177 () Bool)

(assert (=> b!1429177 (= e!807297 call!67453)))

(declare-fun b!1429175 () Bool)

(assert (=> b!1429175 (= e!807296 call!67453)))

(declare-fun d!153819 () Bool)

(declare-fun res!963237 () Bool)

(assert (=> d!153819 (=> res!963237 e!807295)))

(assert (=> d!153819 (= res!963237 (bvsge j!81 (size!47595 a!2831)))))

(assert (=> d!153819 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!807295)))

(assert (= (and d!153819 (not res!963237)) b!1429174))

(assert (= (and b!1429174 c!132467) b!1429176))

(assert (= (and b!1429174 (not c!132467)) b!1429177))

(assert (= (and b!1429176 res!963238) b!1429175))

(assert (= (or b!1429175 b!1429177) bm!67450))

(declare-fun m!1319627 () Bool)

(assert (=> bm!67450 m!1319627))

(assert (=> b!1429174 m!1319439))

(assert (=> b!1429174 m!1319439))

(assert (=> b!1429174 m!1319461))

(assert (=> b!1429176 m!1319439))

(declare-fun m!1319629 () Bool)

(assert (=> b!1429176 m!1319629))

(declare-fun m!1319631 () Bool)

(assert (=> b!1429176 m!1319631))

(assert (=> b!1429176 m!1319439))

(assert (=> b!1429176 m!1319477))

(assert (=> b!1428965 d!153819))

(declare-fun d!153823 () Bool)

(assert (=> d!153823 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!629223 () Unit!48227)

(declare-fun choose!38 (array!97466 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48227)

(assert (=> d!153823 (= lt!629223 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153823 (validMask!0 mask!2608)))

(assert (=> d!153823 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!629223)))

(declare-fun bs!41618 () Bool)

(assert (= bs!41618 d!153823))

(assert (=> bs!41618 m!1319455))

(declare-fun m!1319633 () Bool)

(assert (=> bs!41618 m!1319633))

(assert (=> bs!41618 m!1319473))

(assert (=> b!1428965 d!153823))

(declare-fun d!153825 () Bool)

(assert (=> d!153825 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123332 d!153825))

(declare-fun d!153839 () Bool)

(assert (=> d!153839 (= (array_inv!36325 a!2831) (bvsge (size!47595 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123332 d!153839))

(declare-fun d!153841 () Bool)

(assert (=> d!153841 (= (validKeyInArray!0 (select (arr!47044 a!2831) i!982)) (and (not (= (select (arr!47044 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47044 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1428955 d!153841))

(declare-fun b!1429218 () Bool)

(declare-fun e!807323 () Bool)

(declare-fun e!807322 () Bool)

(assert (=> b!1429218 (= e!807323 e!807322)))

(declare-fun res!963255 () Bool)

(declare-fun lt!629237 () SeekEntryResult!11225)

(assert (=> b!1429218 (= res!963255 (and ((_ is Intermediate!11225) lt!629237) (not (undefined!12037 lt!629237)) (bvslt (x!129088 lt!629237) #b01111111111111111111111111111110) (bvsge (x!129088 lt!629237) #b00000000000000000000000000000000) (bvsge (x!129088 lt!629237) x!605)))))

(assert (=> b!1429218 (=> (not res!963255) (not e!807322))))

(declare-fun b!1429219 () Bool)

(declare-fun e!807324 () SeekEntryResult!11225)

(assert (=> b!1429219 (= e!807324 (Intermediate!11225 false index!585 x!605))))

(declare-fun b!1429220 () Bool)

(assert (=> b!1429220 (and (bvsge (index!47294 lt!629237) #b00000000000000000000000000000000) (bvslt (index!47294 lt!629237) (size!47595 lt!629125)))))

(declare-fun res!963254 () Bool)

(assert (=> b!1429220 (= res!963254 (= (select (arr!47044 lt!629125) (index!47294 lt!629237)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807321 () Bool)

(assert (=> b!1429220 (=> res!963254 e!807321)))

(declare-fun b!1429221 () Bool)

(assert (=> b!1429221 (and (bvsge (index!47294 lt!629237) #b00000000000000000000000000000000) (bvslt (index!47294 lt!629237) (size!47595 lt!629125)))))

(declare-fun res!963256 () Bool)

(assert (=> b!1429221 (= res!963256 (= (select (arr!47044 lt!629125) (index!47294 lt!629237)) lt!629129))))

(assert (=> b!1429221 (=> res!963256 e!807321)))

(assert (=> b!1429221 (= e!807322 e!807321)))

(declare-fun b!1429222 () Bool)

(declare-fun e!807325 () SeekEntryResult!11225)

(assert (=> b!1429222 (= e!807325 e!807324)))

(declare-fun c!132483 () Bool)

(declare-fun lt!629238 () (_ BitVec 64))

(assert (=> b!1429222 (= c!132483 (or (= lt!629238 lt!629129) (= (bvadd lt!629238 lt!629238) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1429223 () Bool)

(assert (=> b!1429223 (= e!807325 (Intermediate!11225 true index!585 x!605))))

(declare-fun d!153843 () Bool)

(assert (=> d!153843 e!807323))

(declare-fun c!132482 () Bool)

(assert (=> d!153843 (= c!132482 (and ((_ is Intermediate!11225) lt!629237) (undefined!12037 lt!629237)))))

(assert (=> d!153843 (= lt!629237 e!807325)))

(declare-fun c!132481 () Bool)

(assert (=> d!153843 (= c!132481 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153843 (= lt!629238 (select (arr!47044 lt!629125) index!585))))

(assert (=> d!153843 (validMask!0 mask!2608)))

(assert (=> d!153843 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629129 lt!629125 mask!2608) lt!629237)))

(declare-fun b!1429224 () Bool)

(assert (=> b!1429224 (= e!807323 (bvsge (x!129088 lt!629237) #b01111111111111111111111111111110))))

(declare-fun b!1429225 () Bool)

(assert (=> b!1429225 (= e!807324 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) lt!629129 lt!629125 mask!2608))))

(declare-fun b!1429226 () Bool)

(assert (=> b!1429226 (and (bvsge (index!47294 lt!629237) #b00000000000000000000000000000000) (bvslt (index!47294 lt!629237) (size!47595 lt!629125)))))

(assert (=> b!1429226 (= e!807321 (= (select (arr!47044 lt!629125) (index!47294 lt!629237)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!153843 c!132481) b!1429223))

(assert (= (and d!153843 (not c!132481)) b!1429222))

(assert (= (and b!1429222 c!132483) b!1429219))

(assert (= (and b!1429222 (not c!132483)) b!1429225))

(assert (= (and d!153843 c!132482) b!1429224))

(assert (= (and d!153843 (not c!132482)) b!1429218))

(assert (= (and b!1429218 res!963255) b!1429221))

(assert (= (and b!1429221 (not res!963256)) b!1429220))

(assert (= (and b!1429220 (not res!963254)) b!1429226))

(declare-fun m!1319661 () Bool)

(assert (=> b!1429226 m!1319661))

(assert (=> b!1429225 m!1319615))

(assert (=> b!1429225 m!1319615))

(declare-fun m!1319663 () Bool)

(assert (=> b!1429225 m!1319663))

(assert (=> b!1429220 m!1319661))

(assert (=> b!1429221 m!1319661))

(declare-fun m!1319665 () Bool)

(assert (=> d!153843 m!1319665))

(assert (=> d!153843 m!1319473))

(assert (=> b!1428966 d!153843))

(declare-fun b!1429252 () Bool)

(declare-fun e!807347 () Bool)

(declare-fun e!807349 () Bool)

(assert (=> b!1429252 (= e!807347 e!807349)))

(declare-fun res!963274 () Bool)

(assert (=> b!1429252 (=> (not res!963274) (not e!807349))))

(declare-fun e!807348 () Bool)

(assert (=> b!1429252 (= res!963274 (not e!807348))))

(declare-fun res!963273 () Bool)

(assert (=> b!1429252 (=> (not res!963273) (not e!807348))))

(assert (=> b!1429252 (= res!963273 (validKeyInArray!0 (select (arr!47044 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1429253 () Bool)

(declare-fun e!807346 () Bool)

(declare-fun call!67460 () Bool)

(assert (=> b!1429253 (= e!807346 call!67460)))

(declare-fun d!153845 () Bool)

(declare-fun res!963272 () Bool)

(assert (=> d!153845 (=> res!963272 e!807347)))

(assert (=> d!153845 (= res!963272 (bvsge #b00000000000000000000000000000000 (size!47595 a!2831)))))

(assert (=> d!153845 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33538) e!807347)))

(declare-fun b!1429254 () Bool)

(assert (=> b!1429254 (= e!807346 call!67460)))

(declare-fun b!1429255 () Bool)

(declare-fun contains!9900 (List!33541 (_ BitVec 64)) Bool)

(assert (=> b!1429255 (= e!807348 (contains!9900 Nil!33538 (select (arr!47044 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67457 () Bool)

(declare-fun c!132489 () Bool)

(assert (=> bm!67457 (= call!67460 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132489 (Cons!33537 (select (arr!47044 a!2831) #b00000000000000000000000000000000) Nil!33538) Nil!33538)))))

(declare-fun b!1429256 () Bool)

(assert (=> b!1429256 (= e!807349 e!807346)))

(assert (=> b!1429256 (= c!132489 (validKeyInArray!0 (select (arr!47044 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153845 (not res!963272)) b!1429252))

(assert (= (and b!1429252 res!963273) b!1429255))

(assert (= (and b!1429252 res!963274) b!1429256))

(assert (= (and b!1429256 c!132489) b!1429253))

(assert (= (and b!1429256 (not c!132489)) b!1429254))

(assert (= (or b!1429253 b!1429254) bm!67457))

(assert (=> b!1429252 m!1319571))

(assert (=> b!1429252 m!1319571))

(assert (=> b!1429252 m!1319573))

(assert (=> b!1429255 m!1319571))

(assert (=> b!1429255 m!1319571))

(declare-fun m!1319671 () Bool)

(assert (=> b!1429255 m!1319671))

(assert (=> bm!67457 m!1319571))

(declare-fun m!1319673 () Bool)

(assert (=> bm!67457 m!1319673))

(assert (=> b!1429256 m!1319571))

(assert (=> b!1429256 m!1319571))

(assert (=> b!1429256 m!1319573))

(assert (=> b!1428962 d!153845))

(declare-fun d!153851 () Bool)

(assert (=> d!153851 (= (validKeyInArray!0 (select (arr!47044 a!2831) j!81)) (and (not (= (select (arr!47044 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47044 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1428963 d!153851))

(check-sat (not b!1429058) (not bm!67450) (not d!153795) (not b!1429225) (not d!153817) (not b!1429163) (not b!1429071) (not bm!67457) (not b!1429174) (not b!1429176) (not b!1429127) (not d!153799) (not b!1429256) (not b!1429154) (not d!153843) (not d!153813) (not b!1429255) (not b!1429073) (not bm!67443) (not d!153823) (not b!1429252))
(check-sat)
