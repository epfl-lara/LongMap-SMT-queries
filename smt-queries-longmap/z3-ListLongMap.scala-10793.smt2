; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126534 () Bool)

(assert start!126534)

(declare-fun b!1481667 () Bool)

(declare-fun e!831175 () Bool)

(declare-fun e!831173 () Bool)

(assert (=> b!1481667 (= e!831175 (not e!831173))))

(declare-fun res!1006422 () Bool)

(assert (=> b!1481667 (=> res!1006422 e!831173)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99478 0))(
  ( (array!99479 (arr!48013 (Array (_ BitVec 32) (_ BitVec 64))) (size!48564 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99478)

(assert (=> b!1481667 (= res!1006422 (or (and (= (select (arr!48013 a!2862) index!646) (select (store (arr!48013 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48013 a!2862) index!646) (select (arr!48013 a!2862) j!93))) (not (= (select (arr!48013 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48013 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!831180 () Bool)

(assert (=> b!1481667 e!831180))

(declare-fun res!1006439 () Bool)

(assert (=> b!1481667 (=> (not res!1006439) (not e!831180))))

(declare-datatypes ((SeekEntryResult!12150 0))(
  ( (MissingZero!12150 (index!50992 (_ BitVec 32))) (Found!12150 (index!50993 (_ BitVec 32))) (Intermediate!12150 (undefined!12962 Bool) (index!50994 (_ BitVec 32)) (x!132758 (_ BitVec 32))) (Undefined!12150) (MissingVacant!12150 (index!50995 (_ BitVec 32))) )
))
(declare-fun lt!646871 () SeekEntryResult!12150)

(declare-fun lt!646873 () SeekEntryResult!12150)

(assert (=> b!1481667 (= res!1006439 (and (= lt!646873 lt!646871) (or (= (select (arr!48013 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48013 a!2862) intermediateBeforeIndex!19) (select (arr!48013 a!2862) j!93)))))))

(assert (=> b!1481667 (= lt!646871 (Found!12150 j!93))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99478 (_ BitVec 32)) SeekEntryResult!12150)

(assert (=> b!1481667 (= lt!646873 (seekEntryOrOpen!0 (select (arr!48013 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99478 (_ BitVec 32)) Bool)

(assert (=> b!1481667 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49673 0))(
  ( (Unit!49674) )
))
(declare-fun lt!646876 () Unit!49673)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99478 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49673)

(assert (=> b!1481667 (= lt!646876 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1481668 () Bool)

(declare-fun res!1006437 () Bool)

(declare-fun e!831174 () Bool)

(assert (=> b!1481668 (=> (not res!1006437) (not e!831174))))

(assert (=> b!1481668 (= res!1006437 (and (= (size!48564 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48564 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48564 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1481669 () Bool)

(declare-fun res!1006432 () Bool)

(assert (=> b!1481669 (=> res!1006432 e!831173)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99478 (_ BitVec 32)) SeekEntryResult!12150)

(assert (=> b!1481669 (= res!1006432 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!48013 a!2862) j!93) a!2862 mask!2687) lt!646871)))))

(declare-fun b!1481670 () Bool)

(declare-fun e!831178 () Bool)

(assert (=> b!1481670 (= e!831178 e!831175)))

(declare-fun res!1006433 () Bool)

(assert (=> b!1481670 (=> (not res!1006433) (not e!831175))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!646872 () SeekEntryResult!12150)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1481670 (= res!1006433 (= lt!646872 (Intermediate!12150 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!646875 () (_ BitVec 64))

(declare-fun lt!646869 () array!99478)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99478 (_ BitVec 32)) SeekEntryResult!12150)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481670 (= lt!646872 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646875 mask!2687) lt!646875 lt!646869 mask!2687))))

(assert (=> b!1481670 (= lt!646875 (select (store (arr!48013 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!831176 () Bool)

(declare-fun b!1481672 () Bool)

(assert (=> b!1481672 (= e!831176 (= lt!646872 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646875 lt!646869 mask!2687)))))

(declare-fun b!1481673 () Bool)

(declare-fun res!1006435 () Bool)

(assert (=> b!1481673 (=> (not res!1006435) (not e!831174))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481673 (= res!1006435 (validKeyInArray!0 (select (arr!48013 a!2862) i!1006)))))

(declare-fun b!1481674 () Bool)

(declare-fun e!831172 () Bool)

(assert (=> b!1481674 (= e!831174 e!831172)))

(declare-fun res!1006436 () Bool)

(assert (=> b!1481674 (=> (not res!1006436) (not e!831172))))

(assert (=> b!1481674 (= res!1006436 (= (select (store (arr!48013 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1481674 (= lt!646869 (array!99479 (store (arr!48013 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48564 a!2862)))))

(declare-fun b!1481675 () Bool)

(assert (=> b!1481675 (= e!831176 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646875 lt!646869 mask!2687) (seekEntryOrOpen!0 lt!646875 lt!646869 mask!2687)))))

(declare-fun b!1481676 () Bool)

(declare-fun res!1006424 () Bool)

(assert (=> b!1481676 (=> (not res!1006424) (not e!831174))))

(declare-datatypes ((List!34501 0))(
  ( (Nil!34498) (Cons!34497 (h!35879 (_ BitVec 64)) (t!49187 List!34501)) )
))
(declare-fun arrayNoDuplicates!0 (array!99478 (_ BitVec 32) List!34501) Bool)

(assert (=> b!1481676 (= res!1006424 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34498))))

(declare-fun b!1481677 () Bool)

(declare-fun res!1006438 () Bool)

(assert (=> b!1481677 (=> (not res!1006438) (not e!831178))))

(declare-fun lt!646874 () SeekEntryResult!12150)

(assert (=> b!1481677 (= res!1006438 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48013 a!2862) j!93) a!2862 mask!2687) lt!646874))))

(declare-fun b!1481678 () Bool)

(declare-fun res!1006431 () Bool)

(assert (=> b!1481678 (=> (not res!1006431) (not e!831175))))

(assert (=> b!1481678 (= res!1006431 e!831176)))

(declare-fun c!137152 () Bool)

(assert (=> b!1481678 (= c!137152 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1481679 () Bool)

(declare-fun e!831171 () Bool)

(declare-fun e!831179 () Bool)

(assert (=> b!1481679 (= e!831171 e!831179)))

(declare-fun res!1006429 () Bool)

(assert (=> b!1481679 (=> (not res!1006429) (not e!831179))))

(assert (=> b!1481679 (= res!1006429 (= lt!646873 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!48013 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1481680 () Bool)

(declare-fun res!1006434 () Bool)

(assert (=> b!1481680 (=> (not res!1006434) (not e!831175))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1481680 (= res!1006434 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1481681 () Bool)

(assert (=> b!1481681 (= e!831179 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1481682 () Bool)

(assert (=> b!1481682 (= e!831173 true)))

(assert (=> b!1481682 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646875 lt!646869 mask!2687) lt!646871)))

(declare-fun lt!646870 () Unit!49673)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!99478 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49673)

(assert (=> b!1481682 (= lt!646870 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1481683 () Bool)

(declare-fun res!1006426 () Bool)

(assert (=> b!1481683 (=> (not res!1006426) (not e!831174))))

(assert (=> b!1481683 (= res!1006426 (validKeyInArray!0 (select (arr!48013 a!2862) j!93)))))

(declare-fun b!1481684 () Bool)

(assert (=> b!1481684 (= e!831180 e!831171)))

(declare-fun res!1006425 () Bool)

(assert (=> b!1481684 (=> res!1006425 e!831171)))

(assert (=> b!1481684 (= res!1006425 (or (and (= (select (arr!48013 a!2862) index!646) (select (store (arr!48013 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48013 a!2862) index!646) (select (arr!48013 a!2862) j!93))) (not (= (select (arr!48013 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1481671 () Bool)

(declare-fun res!1006423 () Bool)

(assert (=> b!1481671 (=> (not res!1006423) (not e!831174))))

(assert (=> b!1481671 (= res!1006423 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48564 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48564 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48564 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1006428 () Bool)

(assert (=> start!126534 (=> (not res!1006428) (not e!831174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126534 (= res!1006428 (validMask!0 mask!2687))))

(assert (=> start!126534 e!831174))

(assert (=> start!126534 true))

(declare-fun array_inv!37294 (array!99478) Bool)

(assert (=> start!126534 (array_inv!37294 a!2862)))

(declare-fun b!1481685 () Bool)

(assert (=> b!1481685 (= e!831172 e!831178)))

(declare-fun res!1006427 () Bool)

(assert (=> b!1481685 (=> (not res!1006427) (not e!831178))))

(assert (=> b!1481685 (= res!1006427 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48013 a!2862) j!93) mask!2687) (select (arr!48013 a!2862) j!93) a!2862 mask!2687) lt!646874))))

(assert (=> b!1481685 (= lt!646874 (Intermediate!12150 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1481686 () Bool)

(declare-fun res!1006430 () Bool)

(assert (=> b!1481686 (=> (not res!1006430) (not e!831174))))

(assert (=> b!1481686 (= res!1006430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!126534 res!1006428) b!1481668))

(assert (= (and b!1481668 res!1006437) b!1481673))

(assert (= (and b!1481673 res!1006435) b!1481683))

(assert (= (and b!1481683 res!1006426) b!1481686))

(assert (= (and b!1481686 res!1006430) b!1481676))

(assert (= (and b!1481676 res!1006424) b!1481671))

(assert (= (and b!1481671 res!1006423) b!1481674))

(assert (= (and b!1481674 res!1006436) b!1481685))

(assert (= (and b!1481685 res!1006427) b!1481677))

(assert (= (and b!1481677 res!1006438) b!1481670))

(assert (= (and b!1481670 res!1006433) b!1481678))

(assert (= (and b!1481678 c!137152) b!1481672))

(assert (= (and b!1481678 (not c!137152)) b!1481675))

(assert (= (and b!1481678 res!1006431) b!1481680))

(assert (= (and b!1481680 res!1006434) b!1481667))

(assert (= (and b!1481667 res!1006439) b!1481684))

(assert (= (and b!1481684 (not res!1006425)) b!1481679))

(assert (= (and b!1481679 res!1006429) b!1481681))

(assert (= (and b!1481667 (not res!1006422)) b!1481669))

(assert (= (and b!1481669 (not res!1006432)) b!1481682))

(declare-fun m!1367479 () Bool)

(assert (=> b!1481686 m!1367479))

(declare-fun m!1367481 () Bool)

(assert (=> b!1481676 m!1367481))

(declare-fun m!1367483 () Bool)

(assert (=> b!1481677 m!1367483))

(assert (=> b!1481677 m!1367483))

(declare-fun m!1367485 () Bool)

(assert (=> b!1481677 m!1367485))

(declare-fun m!1367487 () Bool)

(assert (=> b!1481674 m!1367487))

(declare-fun m!1367489 () Bool)

(assert (=> b!1481674 m!1367489))

(declare-fun m!1367491 () Bool)

(assert (=> b!1481682 m!1367491))

(declare-fun m!1367493 () Bool)

(assert (=> b!1481682 m!1367493))

(declare-fun m!1367495 () Bool)

(assert (=> b!1481673 m!1367495))

(assert (=> b!1481673 m!1367495))

(declare-fun m!1367497 () Bool)

(assert (=> b!1481673 m!1367497))

(assert (=> b!1481675 m!1367491))

(declare-fun m!1367499 () Bool)

(assert (=> b!1481675 m!1367499))

(declare-fun m!1367501 () Bool)

(assert (=> b!1481684 m!1367501))

(assert (=> b!1481684 m!1367487))

(declare-fun m!1367503 () Bool)

(assert (=> b!1481684 m!1367503))

(assert (=> b!1481684 m!1367483))

(declare-fun m!1367505 () Bool)

(assert (=> b!1481670 m!1367505))

(assert (=> b!1481670 m!1367505))

(declare-fun m!1367507 () Bool)

(assert (=> b!1481670 m!1367507))

(assert (=> b!1481670 m!1367487))

(declare-fun m!1367509 () Bool)

(assert (=> b!1481670 m!1367509))

(assert (=> b!1481679 m!1367483))

(assert (=> b!1481679 m!1367483))

(declare-fun m!1367511 () Bool)

(assert (=> b!1481679 m!1367511))

(declare-fun m!1367513 () Bool)

(assert (=> b!1481672 m!1367513))

(assert (=> b!1481669 m!1367483))

(assert (=> b!1481669 m!1367483))

(declare-fun m!1367515 () Bool)

(assert (=> b!1481669 m!1367515))

(declare-fun m!1367517 () Bool)

(assert (=> b!1481667 m!1367517))

(assert (=> b!1481667 m!1367487))

(declare-fun m!1367519 () Bool)

(assert (=> b!1481667 m!1367519))

(assert (=> b!1481667 m!1367503))

(assert (=> b!1481667 m!1367501))

(assert (=> b!1481667 m!1367483))

(declare-fun m!1367521 () Bool)

(assert (=> b!1481667 m!1367521))

(declare-fun m!1367523 () Bool)

(assert (=> b!1481667 m!1367523))

(assert (=> b!1481667 m!1367483))

(assert (=> b!1481683 m!1367483))

(assert (=> b!1481683 m!1367483))

(declare-fun m!1367525 () Bool)

(assert (=> b!1481683 m!1367525))

(declare-fun m!1367527 () Bool)

(assert (=> start!126534 m!1367527))

(declare-fun m!1367529 () Bool)

(assert (=> start!126534 m!1367529))

(assert (=> b!1481685 m!1367483))

(assert (=> b!1481685 m!1367483))

(declare-fun m!1367531 () Bool)

(assert (=> b!1481685 m!1367531))

(assert (=> b!1481685 m!1367531))

(assert (=> b!1481685 m!1367483))

(declare-fun m!1367533 () Bool)

(assert (=> b!1481685 m!1367533))

(check-sat (not b!1481685) (not b!1481670) (not b!1481677) (not b!1481672) (not b!1481682) (not b!1481679) (not b!1481676) (not b!1481669) (not b!1481673) (not b!1481667) (not start!126534) (not b!1481683) (not b!1481675) (not b!1481686))
(check-sat)
