; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123960 () Bool)

(assert start!123960)

(declare-fun b!1436009 () Bool)

(declare-fun e!810398 () Bool)

(declare-fun e!810397 () Bool)

(assert (=> b!1436009 (= e!810398 e!810397)))

(declare-fun res!968981 () Bool)

(assert (=> b!1436009 (=> res!968981 e!810397)))

(declare-datatypes ((List!33627 0))(
  ( (Nil!33624) (Cons!33623 (h!34958 (_ BitVec 64)) (t!48321 List!33627)) )
))
(declare-fun contains!9880 (List!33627 (_ BitVec 64)) Bool)

(assert (=> b!1436009 (= res!968981 (contains!9880 Nil!33624 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1436010 () Bool)

(declare-fun res!968979 () Bool)

(assert (=> b!1436010 (=> (not res!968979) (not e!810398))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97656 0))(
  ( (array!97657 (arr!47126 (Array (_ BitVec 32) (_ BitVec 64))) (size!47676 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97656)

(assert (=> b!1436010 (= res!968979 (and (= (size!47676 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47676 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47676 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436011 () Bool)

(declare-fun res!968980 () Bool)

(assert (=> b!1436011 (=> (not res!968980) (not e!810398))))

(assert (=> b!1436011 (= res!968980 (and (bvsle #b00000000000000000000000000000000 (size!47676 a!2862)) (bvslt (size!47676 a!2862) #b01111111111111111111111111111111)))))

(declare-fun b!1436012 () Bool)

(declare-fun res!968986 () Bool)

(assert (=> b!1436012 (=> (not res!968986) (not e!810398))))

(declare-fun noDuplicate!2615 (List!33627) Bool)

(assert (=> b!1436012 (= res!968986 (noDuplicate!2615 Nil!33624))))

(declare-fun res!968985 () Bool)

(assert (=> start!123960 (=> (not res!968985) (not e!810398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123960 (= res!968985 (validMask!0 mask!2687))))

(assert (=> start!123960 e!810398))

(assert (=> start!123960 true))

(declare-fun array_inv!36154 (array!97656) Bool)

(assert (=> start!123960 (array_inv!36154 a!2862)))

(declare-fun b!1436013 () Bool)

(declare-fun res!968983 () Bool)

(assert (=> b!1436013 (=> (not res!968983) (not e!810398))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97656 (_ BitVec 32)) Bool)

(assert (=> b!1436013 (= res!968983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436014 () Bool)

(declare-fun res!968984 () Bool)

(assert (=> b!1436014 (=> (not res!968984) (not e!810398))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436014 (= res!968984 (validKeyInArray!0 (select (arr!47126 a!2862) j!93)))))

(declare-fun b!1436015 () Bool)

(declare-fun res!968982 () Bool)

(assert (=> b!1436015 (=> (not res!968982) (not e!810398))))

(assert (=> b!1436015 (= res!968982 (validKeyInArray!0 (select (arr!47126 a!2862) i!1006)))))

(declare-fun b!1436016 () Bool)

(assert (=> b!1436016 (= e!810397 (contains!9880 Nil!33624 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!123960 res!968985) b!1436010))

(assert (= (and b!1436010 res!968979) b!1436015))

(assert (= (and b!1436015 res!968982) b!1436014))

(assert (= (and b!1436014 res!968984) b!1436013))

(assert (= (and b!1436013 res!968983) b!1436011))

(assert (= (and b!1436011 res!968980) b!1436012))

(assert (= (and b!1436012 res!968986) b!1436009))

(assert (= (and b!1436009 (not res!968981)) b!1436016))

(declare-fun m!1325355 () Bool)

(assert (=> b!1436014 m!1325355))

(assert (=> b!1436014 m!1325355))

(declare-fun m!1325357 () Bool)

(assert (=> b!1436014 m!1325357))

(declare-fun m!1325359 () Bool)

(assert (=> start!123960 m!1325359))

(declare-fun m!1325361 () Bool)

(assert (=> start!123960 m!1325361))

(declare-fun m!1325363 () Bool)

(assert (=> b!1436012 m!1325363))

(declare-fun m!1325365 () Bool)

(assert (=> b!1436015 m!1325365))

(assert (=> b!1436015 m!1325365))

(declare-fun m!1325367 () Bool)

(assert (=> b!1436015 m!1325367))

(declare-fun m!1325369 () Bool)

(assert (=> b!1436016 m!1325369))

(declare-fun m!1325371 () Bool)

(assert (=> b!1436013 m!1325371))

(declare-fun m!1325373 () Bool)

(assert (=> b!1436009 m!1325373))

(push 1)

(assert (not b!1436012))

(assert (not b!1436014))

(assert (not b!1436009))

(assert (not b!1436016))

(assert (not b!1436013))

(assert (not start!123960))

(assert (not b!1436015))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!154485 () Bool)

(declare-fun lt!632053 () Bool)

(declare-fun content!776 (List!33627) (Set (_ BitVec 64)))

(assert (=> d!154485 (= lt!632053 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!776 Nil!33624)))))

(declare-fun e!810430 () Bool)

(assert (=> d!154485 (= lt!632053 e!810430)))

(declare-fun res!969048 () Bool)

(assert (=> d!154485 (=> (not res!969048) (not e!810430))))

(assert (=> d!154485 (= res!969048 (is-Cons!33623 Nil!33624))))

(assert (=> d!154485 (= (contains!9880 Nil!33624 #b1000000000000000000000000000000000000000000000000000000000000000) lt!632053)))

(declare-fun b!1436077 () Bool)

(declare-fun e!810429 () Bool)

(assert (=> b!1436077 (= e!810430 e!810429)))

(declare-fun res!969047 () Bool)

(assert (=> b!1436077 (=> res!969047 e!810429)))

(assert (=> b!1436077 (= res!969047 (= (h!34958 Nil!33624) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1436078 () Bool)

(assert (=> b!1436078 (= e!810429 (contains!9880 (t!48321 Nil!33624) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!154485 res!969048) b!1436077))

(assert (= (and b!1436077 (not res!969047)) b!1436078))

(declare-fun m!1325425 () Bool)

(assert (=> d!154485 m!1325425))

(declare-fun m!1325427 () Bool)

(assert (=> d!154485 m!1325427))

(declare-fun m!1325429 () Bool)

(assert (=> b!1436078 m!1325429))

(assert (=> b!1436016 d!154485))

(declare-fun d!154495 () Bool)

(declare-fun res!969059 () Bool)

(declare-fun e!810441 () Bool)

(assert (=> d!154495 (=> res!969059 e!810441)))

(assert (=> d!154495 (= res!969059 (is-Nil!33624 Nil!33624))))

(assert (=> d!154495 (= (noDuplicate!2615 Nil!33624) e!810441)))

(declare-fun b!1436089 () Bool)

(declare-fun e!810442 () Bool)

(assert (=> b!1436089 (= e!810441 e!810442)))

(declare-fun res!969060 () Bool)

(assert (=> b!1436089 (=> (not res!969060) (not e!810442))))

(assert (=> b!1436089 (= res!969060 (not (contains!9880 (t!48321 Nil!33624) (h!34958 Nil!33624))))))

(declare-fun b!1436090 () Bool)

(assert (=> b!1436090 (= e!810442 (noDuplicate!2615 (t!48321 Nil!33624)))))

(assert (= (and d!154495 (not res!969059)) b!1436089))

(assert (= (and b!1436089 res!969060) b!1436090))

(declare-fun m!1325437 () Bool)

(assert (=> b!1436089 m!1325437))

(declare-fun m!1325439 () Bool)

(assert (=> b!1436090 m!1325439))

(assert (=> b!1436012 d!154495))

(declare-fun d!154499 () Bool)

(assert (=> d!154499 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!123960 d!154499))

(declare-fun d!154509 () Bool)

(assert (=> d!154509 (= (array_inv!36154 a!2862) (bvsge (size!47676 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!123960 d!154509))

(declare-fun d!154511 () Bool)

(declare-fun res!969084 () Bool)

(declare-fun e!810473 () Bool)

(assert (=> d!154511 (=> res!969084 e!810473)))

(assert (=> d!154511 (= res!969084 (bvsge #b00000000000000000000000000000000 (size!47676 a!2862)))))

(assert (=> d!154511 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!810473)))

(declare-fun b!1436129 () Bool)

(declare-fun e!810475 () Bool)

(declare-fun e!810474 () Bool)

(assert (=> b!1436129 (= e!810475 e!810474)))

(declare-fun lt!632082 () (_ BitVec 64))

(assert (=> b!1436129 (= lt!632082 (select (arr!47126 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48544 0))(
  ( (Unit!48545) )
))
(declare-fun lt!632081 () Unit!48544)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97656 (_ BitVec 64) (_ BitVec 32)) Unit!48544)

(assert (=> b!1436129 (= lt!632081 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632082 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97656 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1436129 (arrayContainsKey!0 a!2862 lt!632082 #b00000000000000000000000000000000)))

(declare-fun lt!632083 () Unit!48544)

(assert (=> b!1436129 (= lt!632083 lt!632081)))

(declare-fun res!969083 () Bool)

(declare-datatypes ((SeekEntryResult!11399 0))(
  ( (MissingZero!11399 (index!47988 (_ BitVec 32))) (Found!11399 (index!47989 (_ BitVec 32))) (Intermediate!11399 (undefined!12211 Bool) (index!47990 (_ BitVec 32)) (x!129669 (_ BitVec 32))) (Undefined!11399) (MissingVacant!11399 (index!47991 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97656 (_ BitVec 32)) SeekEntryResult!11399)

(assert (=> b!1436129 (= res!969083 (= (seekEntryOrOpen!0 (select (arr!47126 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11399 #b00000000000000000000000000000000)))))

(assert (=> b!1436129 (=> (not res!969083) (not e!810474))))

(declare-fun bm!67585 () Bool)

(declare-fun call!67588 () Bool)

(assert (=> bm!67585 (= call!67588 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1436130 () Bool)

(assert (=> b!1436130 (= e!810475 call!67588)))

(declare-fun b!1436131 () Bool)

(assert (=> b!1436131 (= e!810474 call!67588)))

(declare-fun b!1436132 () Bool)

(assert (=> b!1436132 (= e!810473 e!810475)))

(declare-fun c!133026 () Bool)

(assert (=> b!1436132 (= c!133026 (validKeyInArray!0 (select (arr!47126 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!154511 (not res!969084)) b!1436132))

(assert (= (and b!1436132 c!133026) b!1436129))

(assert (= (and b!1436132 (not c!133026)) b!1436130))

(assert (= (and b!1436129 res!969083) b!1436131))

(assert (= (or b!1436131 b!1436130) bm!67585))

(declare-fun m!1325469 () Bool)

(assert (=> b!1436129 m!1325469))

(declare-fun m!1325471 () Bool)

(assert (=> b!1436129 m!1325471))

(declare-fun m!1325473 () Bool)

(assert (=> b!1436129 m!1325473))

(assert (=> b!1436129 m!1325469))

(declare-fun m!1325475 () Bool)

(assert (=> b!1436129 m!1325475))

(declare-fun m!1325477 () Bool)

(assert (=> bm!67585 m!1325477))

(assert (=> b!1436132 m!1325469))

(assert (=> b!1436132 m!1325469))

(declare-fun m!1325479 () Bool)

(assert (=> b!1436132 m!1325479))

(assert (=> b!1436013 d!154511))

(declare-fun d!154521 () Bool)

(assert (=> d!154521 (= (validKeyInArray!0 (select (arr!47126 a!2862) j!93)) (and (not (= (select (arr!47126 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47126 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1436014 d!154521))

(declare-fun d!154523 () Bool)

(declare-fun lt!632084 () Bool)

(assert (=> d!154523 (= lt!632084 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!776 Nil!33624)))))

(declare-fun e!810477 () Bool)

(assert (=> d!154523 (= lt!632084 e!810477)))

(declare-fun res!969086 () Bool)

(assert (=> d!154523 (=> (not res!969086) (not e!810477))))

(assert (=> d!154523 (= res!969086 (is-Cons!33623 Nil!33624))))

(assert (=> d!154523 (= (contains!9880 Nil!33624 #b0000000000000000000000000000000000000000000000000000000000000000) lt!632084)))

(declare-fun b!1436133 () Bool)

(declare-fun e!810476 () Bool)

(assert (=> b!1436133 (= e!810477 e!810476)))

(declare-fun res!969085 () Bool)

(assert (=> b!1436133 (=> res!969085 e!810476)))

(assert (=> b!1436133 (= res!969085 (= (h!34958 Nil!33624) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1436134 () Bool)

(assert (=> b!1436134 (= e!810476 (contains!9880 (t!48321 Nil!33624) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!154523 res!969086) b!1436133))

(assert (= (and b!1436133 (not res!969085)) b!1436134))

