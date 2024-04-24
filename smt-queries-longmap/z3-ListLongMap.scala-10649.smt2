; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125250 () Bool)

(assert start!125250)

(declare-fun b!1456027 () Bool)

(declare-fun res!986007 () Bool)

(declare-fun e!819482 () Bool)

(assert (=> b!1456027 (=> (not res!986007) (not e!819482))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1456027 (= res!986007 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1456028 () Bool)

(declare-fun e!819486 () Bool)

(declare-fun e!819485 () Bool)

(assert (=> b!1456028 (= e!819486 e!819485)))

(declare-fun res!986017 () Bool)

(assert (=> b!1456028 (=> res!986017 e!819485)))

(declare-fun lt!638167 () (_ BitVec 32))

(declare-datatypes ((array!98593 0))(
  ( (array!98594 (arr!47581 (Array (_ BitVec 32) (_ BitVec 64))) (size!48132 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98593)

(assert (=> b!1456028 (= res!986017 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638167 #b00000000000000000000000000000000) (bvsge lt!638167 (size!48132 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456028 (= lt!638167 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun lt!638161 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11730 0))(
  ( (MissingZero!11730 (index!49312 (_ BitVec 32))) (Found!11730 (index!49313 (_ BitVec 32))) (Intermediate!11730 (undefined!12542 Bool) (index!49314 (_ BitVec 32)) (x!131123 (_ BitVec 32))) (Undefined!11730) (MissingVacant!11730 (index!49315 (_ BitVec 32))) )
))
(declare-fun lt!638163 () SeekEntryResult!11730)

(declare-fun lt!638165 () array!98593)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98593 (_ BitVec 32)) SeekEntryResult!11730)

(assert (=> b!1456028 (= lt!638163 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638161 lt!638165 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98593 (_ BitVec 32)) SeekEntryResult!11730)

(assert (=> b!1456028 (= lt!638163 (seekEntryOrOpen!0 lt!638161 lt!638165 mask!2687))))

(declare-fun b!1456029 () Bool)

(assert (=> b!1456029 (= e!819485 true)))

(declare-fun lt!638162 () Bool)

(declare-fun e!819480 () Bool)

(assert (=> b!1456029 (= lt!638162 e!819480)))

(declare-fun c!134533 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1456029 (= c!134533 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun lt!638164 () SeekEntryResult!11730)

(declare-fun b!1456030 () Bool)

(declare-fun e!819484 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98593 (_ BitVec 32)) SeekEntryResult!11730)

(assert (=> b!1456030 (= e!819484 (= lt!638164 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638161 lt!638165 mask!2687)))))

(declare-fun b!1456031 () Bool)

(declare-fun res!986004 () Bool)

(declare-fun e!819488 () Bool)

(assert (=> b!1456031 (=> (not res!986004) (not e!819488))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1456031 (= res!986004 (and (= (size!48132 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48132 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48132 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1456032 () Bool)

(assert (=> b!1456032 (= e!819480 (not (= lt!638164 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638167 lt!638161 lt!638165 mask!2687))))))

(declare-fun b!1456033 () Bool)

(declare-fun res!986013 () Bool)

(assert (=> b!1456033 (=> (not res!986013) (not e!819488))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1456033 (= res!986013 (validKeyInArray!0 (select (arr!47581 a!2862) i!1006)))))

(declare-fun b!1456034 () Bool)

(declare-fun e!819487 () Bool)

(assert (=> b!1456034 (= e!819487 e!819482)))

(declare-fun res!986015 () Bool)

(assert (=> b!1456034 (=> (not res!986015) (not e!819482))))

(assert (=> b!1456034 (= res!986015 (= lt!638164 (Intermediate!11730 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456034 (= lt!638164 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638161 mask!2687) lt!638161 lt!638165 mask!2687))))

(assert (=> b!1456034 (= lt!638161 (select (store (arr!47581 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!819483 () Bool)

(declare-fun b!1456035 () Bool)

(assert (=> b!1456035 (= e!819483 (and (or (= (select (arr!47581 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47581 a!2862) intermediateBeforeIndex!19) (select (arr!47581 a!2862) j!93))) (let ((bdg!53090 (select (store (arr!47581 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47581 a!2862) index!646) bdg!53090) (= (select (arr!47581 a!2862) index!646) (select (arr!47581 a!2862) j!93))) (= (select (arr!47581 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53090 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1456036 () Bool)

(declare-fun res!986002 () Bool)

(assert (=> b!1456036 (=> (not res!986002) (not e!819488))))

(assert (=> b!1456036 (= res!986002 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48132 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48132 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48132 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1456037 () Bool)

(declare-fun res!986008 () Bool)

(assert (=> b!1456037 (=> (not res!986008) (not e!819482))))

(assert (=> b!1456037 (= res!986008 e!819484)))

(declare-fun c!134532 () Bool)

(assert (=> b!1456037 (= c!134532 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1456038 () Bool)

(declare-fun e!819489 () Bool)

(assert (=> b!1456038 (= e!819489 e!819487)))

(declare-fun res!986005 () Bool)

(assert (=> b!1456038 (=> (not res!986005) (not e!819487))))

(declare-fun lt!638160 () SeekEntryResult!11730)

(assert (=> b!1456038 (= res!986005 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47581 a!2862) j!93) mask!2687) (select (arr!47581 a!2862) j!93) a!2862 mask!2687) lt!638160))))

(assert (=> b!1456038 (= lt!638160 (Intermediate!11730 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1456039 () Bool)

(assert (=> b!1456039 (= e!819488 e!819489)))

(declare-fun res!986018 () Bool)

(assert (=> b!1456039 (=> (not res!986018) (not e!819489))))

(assert (=> b!1456039 (= res!986018 (= (select (store (arr!47581 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1456039 (= lt!638165 (array!98594 (store (arr!47581 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48132 a!2862)))))

(declare-fun b!1456040 () Bool)

(assert (=> b!1456040 (= e!819482 (not e!819486))))

(declare-fun res!986016 () Bool)

(assert (=> b!1456040 (=> res!986016 e!819486)))

(assert (=> b!1456040 (= res!986016 (or (and (= (select (arr!47581 a!2862) index!646) (select (store (arr!47581 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47581 a!2862) index!646) (select (arr!47581 a!2862) j!93))) (= (select (arr!47581 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1456040 e!819483))

(declare-fun res!986014 () Bool)

(assert (=> b!1456040 (=> (not res!986014) (not e!819483))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98593 (_ BitVec 32)) Bool)

(assert (=> b!1456040 (= res!986014 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48989 0))(
  ( (Unit!48990) )
))
(declare-fun lt!638166 () Unit!48989)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98593 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48989)

(assert (=> b!1456040 (= lt!638166 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!986012 () Bool)

(assert (=> start!125250 (=> (not res!986012) (not e!819488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125250 (= res!986012 (validMask!0 mask!2687))))

(assert (=> start!125250 e!819488))

(assert (=> start!125250 true))

(declare-fun array_inv!36862 (array!98593) Bool)

(assert (=> start!125250 (array_inv!36862 a!2862)))

(declare-fun b!1456041 () Bool)

(declare-fun res!986009 () Bool)

(assert (=> b!1456041 (=> (not res!986009) (not e!819488))))

(declare-datatypes ((List!34069 0))(
  ( (Nil!34066) (Cons!34065 (h!35426 (_ BitVec 64)) (t!48755 List!34069)) )
))
(declare-fun arrayNoDuplicates!0 (array!98593 (_ BitVec 32) List!34069) Bool)

(assert (=> b!1456041 (= res!986009 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34066))))

(declare-fun b!1456042 () Bool)

(assert (=> b!1456042 (= e!819484 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638161 lt!638165 mask!2687) (seekEntryOrOpen!0 lt!638161 lt!638165 mask!2687)))))

(declare-fun b!1456043 () Bool)

(declare-fun res!986006 () Bool)

(assert (=> b!1456043 (=> (not res!986006) (not e!819488))))

(assert (=> b!1456043 (= res!986006 (validKeyInArray!0 (select (arr!47581 a!2862) j!93)))))

(declare-fun b!1456044 () Bool)

(declare-fun res!986011 () Bool)

(assert (=> b!1456044 (=> (not res!986011) (not e!819488))))

(assert (=> b!1456044 (= res!986011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1456045 () Bool)

(assert (=> b!1456045 (= e!819480 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638167 intermediateAfterIndex!19 lt!638161 lt!638165 mask!2687) lt!638163)))))

(declare-fun b!1456046 () Bool)

(declare-fun res!986010 () Bool)

(assert (=> b!1456046 (=> (not res!986010) (not e!819483))))

(assert (=> b!1456046 (= res!986010 (= (seekEntryOrOpen!0 (select (arr!47581 a!2862) j!93) a!2862 mask!2687) (Found!11730 j!93)))))

(declare-fun b!1456047 () Bool)

(declare-fun res!986003 () Bool)

(assert (=> b!1456047 (=> (not res!986003) (not e!819487))))

(assert (=> b!1456047 (= res!986003 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47581 a!2862) j!93) a!2862 mask!2687) lt!638160))))

(declare-fun b!1456048 () Bool)

(declare-fun res!986001 () Bool)

(assert (=> b!1456048 (=> res!986001 e!819485)))

(assert (=> b!1456048 (= res!986001 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638167 (select (arr!47581 a!2862) j!93) a!2862 mask!2687) lt!638160)))))

(assert (= (and start!125250 res!986012) b!1456031))

(assert (= (and b!1456031 res!986004) b!1456033))

(assert (= (and b!1456033 res!986013) b!1456043))

(assert (= (and b!1456043 res!986006) b!1456044))

(assert (= (and b!1456044 res!986011) b!1456041))

(assert (= (and b!1456041 res!986009) b!1456036))

(assert (= (and b!1456036 res!986002) b!1456039))

(assert (= (and b!1456039 res!986018) b!1456038))

(assert (= (and b!1456038 res!986005) b!1456047))

(assert (= (and b!1456047 res!986003) b!1456034))

(assert (= (and b!1456034 res!986015) b!1456037))

(assert (= (and b!1456037 c!134532) b!1456030))

(assert (= (and b!1456037 (not c!134532)) b!1456042))

(assert (= (and b!1456037 res!986008) b!1456027))

(assert (= (and b!1456027 res!986007) b!1456040))

(assert (= (and b!1456040 res!986014) b!1456046))

(assert (= (and b!1456046 res!986010) b!1456035))

(assert (= (and b!1456040 (not res!986016)) b!1456028))

(assert (= (and b!1456028 (not res!986017)) b!1456048))

(assert (= (and b!1456048 (not res!986001)) b!1456029))

(assert (= (and b!1456029 c!134533) b!1456032))

(assert (= (and b!1456029 (not c!134533)) b!1456045))

(declare-fun m!1344451 () Bool)

(assert (=> b!1456038 m!1344451))

(assert (=> b!1456038 m!1344451))

(declare-fun m!1344453 () Bool)

(assert (=> b!1456038 m!1344453))

(assert (=> b!1456038 m!1344453))

(assert (=> b!1456038 m!1344451))

(declare-fun m!1344455 () Bool)

(assert (=> b!1456038 m!1344455))

(assert (=> b!1456043 m!1344451))

(assert (=> b!1456043 m!1344451))

(declare-fun m!1344457 () Bool)

(assert (=> b!1456043 m!1344457))

(declare-fun m!1344459 () Bool)

(assert (=> b!1456028 m!1344459))

(declare-fun m!1344461 () Bool)

(assert (=> b!1456028 m!1344461))

(declare-fun m!1344463 () Bool)

(assert (=> b!1456028 m!1344463))

(declare-fun m!1344465 () Bool)

(assert (=> b!1456039 m!1344465))

(declare-fun m!1344467 () Bool)

(assert (=> b!1456039 m!1344467))

(declare-fun m!1344469 () Bool)

(assert (=> b!1456040 m!1344469))

(assert (=> b!1456040 m!1344465))

(declare-fun m!1344471 () Bool)

(assert (=> b!1456040 m!1344471))

(declare-fun m!1344473 () Bool)

(assert (=> b!1456040 m!1344473))

(declare-fun m!1344475 () Bool)

(assert (=> b!1456040 m!1344475))

(assert (=> b!1456040 m!1344451))

(declare-fun m!1344477 () Bool)

(assert (=> b!1456030 m!1344477))

(assert (=> b!1456042 m!1344461))

(assert (=> b!1456042 m!1344463))

(assert (=> b!1456046 m!1344451))

(assert (=> b!1456046 m!1344451))

(declare-fun m!1344479 () Bool)

(assert (=> b!1456046 m!1344479))

(declare-fun m!1344481 () Bool)

(assert (=> start!125250 m!1344481))

(declare-fun m!1344483 () Bool)

(assert (=> start!125250 m!1344483))

(declare-fun m!1344485 () Bool)

(assert (=> b!1456034 m!1344485))

(assert (=> b!1456034 m!1344485))

(declare-fun m!1344487 () Bool)

(assert (=> b!1456034 m!1344487))

(assert (=> b!1456034 m!1344465))

(declare-fun m!1344489 () Bool)

(assert (=> b!1456034 m!1344489))

(declare-fun m!1344491 () Bool)

(assert (=> b!1456045 m!1344491))

(assert (=> b!1456047 m!1344451))

(assert (=> b!1456047 m!1344451))

(declare-fun m!1344493 () Bool)

(assert (=> b!1456047 m!1344493))

(declare-fun m!1344495 () Bool)

(assert (=> b!1456032 m!1344495))

(assert (=> b!1456035 m!1344465))

(declare-fun m!1344497 () Bool)

(assert (=> b!1456035 m!1344497))

(assert (=> b!1456035 m!1344471))

(assert (=> b!1456035 m!1344473))

(assert (=> b!1456035 m!1344451))

(declare-fun m!1344499 () Bool)

(assert (=> b!1456033 m!1344499))

(assert (=> b!1456033 m!1344499))

(declare-fun m!1344501 () Bool)

(assert (=> b!1456033 m!1344501))

(declare-fun m!1344503 () Bool)

(assert (=> b!1456044 m!1344503))

(assert (=> b!1456048 m!1344451))

(assert (=> b!1456048 m!1344451))

(declare-fun m!1344505 () Bool)

(assert (=> b!1456048 m!1344505))

(declare-fun m!1344507 () Bool)

(assert (=> b!1456041 m!1344507))

(check-sat (not b!1456038) (not b!1456045) (not b!1456041) (not b!1456030) (not b!1456042) (not b!1456028) (not b!1456047) (not b!1456048) (not b!1456040) (not start!125250) (not b!1456033) (not b!1456043) (not b!1456046) (not b!1456034) (not b!1456044) (not b!1456032))
(check-sat)
