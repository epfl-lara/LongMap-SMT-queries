; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126656 () Bool)

(assert start!126656)

(declare-fun b!1486756 () Bool)

(declare-fun res!1011077 () Bool)

(declare-fun e!833431 () Bool)

(assert (=> b!1486756 (=> (not res!1011077) (not e!833431))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!99555 0))(
  ( (array!99556 (arr!48052 (Array (_ BitVec 32) (_ BitVec 64))) (size!48602 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99555)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1486756 (= res!1011077 (or (= (select (arr!48052 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48052 a!2862) intermediateBeforeIndex!19) (select (arr!48052 a!2862) j!93))))))

(declare-fun b!1486757 () Bool)

(declare-fun e!833423 () Bool)

(declare-fun e!833424 () Bool)

(assert (=> b!1486757 (= e!833423 (not e!833424))))

(declare-fun res!1011094 () Bool)

(assert (=> b!1486757 (=> res!1011094 e!833424)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1486757 (= res!1011094 (or (and (= (select (arr!48052 a!2862) index!646) (select (store (arr!48052 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48052 a!2862) index!646) (select (arr!48052 a!2862) j!93))) (= (select (arr!48052 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486757 e!833431))

(declare-fun res!1011079 () Bool)

(assert (=> b!1486757 (=> (not res!1011079) (not e!833431))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99555 (_ BitVec 32)) Bool)

(assert (=> b!1486757 (= res!1011079 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49924 0))(
  ( (Unit!49925) )
))
(declare-fun lt!648574 () Unit!49924)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99555 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49924)

(assert (=> b!1486757 (= lt!648574 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!648579 () array!99555)

(declare-datatypes ((SeekEntryResult!12292 0))(
  ( (MissingZero!12292 (index!51560 (_ BitVec 32))) (Found!12292 (index!51561 (_ BitVec 32))) (Intermediate!12292 (undefined!13104 Bool) (index!51562 (_ BitVec 32)) (x!133140 (_ BitVec 32))) (Undefined!12292) (MissingVacant!12292 (index!51563 (_ BitVec 32))) )
))
(declare-fun lt!648573 () SeekEntryResult!12292)

(declare-fun lt!648576 () (_ BitVec 64))

(declare-fun e!833426 () Bool)

(declare-fun b!1486758 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99555 (_ BitVec 32)) SeekEntryResult!12292)

(assert (=> b!1486758 (= e!833426 (= lt!648573 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648576 lt!648579 mask!2687)))))

(declare-fun b!1486759 () Bool)

(declare-fun res!1011080 () Bool)

(assert (=> b!1486759 (=> (not res!1011080) (not e!833431))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99555 (_ BitVec 32)) SeekEntryResult!12292)

(assert (=> b!1486759 (= res!1011080 (= (seekEntryOrOpen!0 (select (arr!48052 a!2862) j!93) a!2862 mask!2687) (Found!12292 j!93)))))

(declare-fun b!1486760 () Bool)

(declare-fun e!833430 () Bool)

(assert (=> b!1486760 (= e!833430 e!833423)))

(declare-fun res!1011087 () Bool)

(assert (=> b!1486760 (=> (not res!1011087) (not e!833423))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1486760 (= res!1011087 (= lt!648573 (Intermediate!12292 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486760 (= lt!648573 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648576 mask!2687) lt!648576 lt!648579 mask!2687))))

(assert (=> b!1486760 (= lt!648576 (select (store (arr!48052 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1486761 () Bool)

(declare-fun res!1011089 () Bool)

(declare-fun e!833429 () Bool)

(assert (=> b!1486761 (=> (not res!1011089) (not e!833429))))

(assert (=> b!1486761 (= res!1011089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1486762 () Bool)

(declare-fun e!833425 () Bool)

(assert (=> b!1486762 (= e!833429 e!833425)))

(declare-fun res!1011091 () Bool)

(assert (=> b!1486762 (=> (not res!1011091) (not e!833425))))

(assert (=> b!1486762 (= res!1011091 (= (select (store (arr!48052 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1486762 (= lt!648579 (array!99556 (store (arr!48052 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48602 a!2862)))))

(declare-fun res!1011078 () Bool)

(assert (=> start!126656 (=> (not res!1011078) (not e!833429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126656 (= res!1011078 (validMask!0 mask!2687))))

(assert (=> start!126656 e!833429))

(assert (=> start!126656 true))

(declare-fun array_inv!37080 (array!99555) Bool)

(assert (=> start!126656 (array_inv!37080 a!2862)))

(declare-fun b!1486763 () Bool)

(declare-fun res!1011084 () Bool)

(assert (=> b!1486763 (=> (not res!1011084) (not e!833423))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1486763 (= res!1011084 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1486764 () Bool)

(declare-fun res!1011076 () Bool)

(assert (=> b!1486764 (=> (not res!1011076) (not e!833429))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1486764 (= res!1011076 (validKeyInArray!0 (select (arr!48052 a!2862) j!93)))))

(declare-fun b!1486765 () Bool)

(declare-fun res!1011090 () Bool)

(assert (=> b!1486765 (=> (not res!1011090) (not e!833429))))

(declare-datatypes ((List!34553 0))(
  ( (Nil!34550) (Cons!34549 (h!35926 (_ BitVec 64)) (t!49247 List!34553)) )
))
(declare-fun arrayNoDuplicates!0 (array!99555 (_ BitVec 32) List!34553) Bool)

(assert (=> b!1486765 (= res!1011090 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34550))))

(declare-fun b!1486766 () Bool)

(declare-fun e!833428 () Bool)

(assert (=> b!1486766 (= e!833431 e!833428)))

(declare-fun res!1011085 () Bool)

(assert (=> b!1486766 (=> res!1011085 e!833428)))

(declare-fun lt!648575 () (_ BitVec 64))

(assert (=> b!1486766 (= res!1011085 (or (and (= (select (arr!48052 a!2862) index!646) lt!648575) (= (select (arr!48052 a!2862) index!646) (select (arr!48052 a!2862) j!93))) (= (select (arr!48052 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486766 (= lt!648575 (select (store (arr!48052 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1486767 () Bool)

(declare-fun res!1011093 () Bool)

(assert (=> b!1486767 (=> (not res!1011093) (not e!833429))))

(assert (=> b!1486767 (= res!1011093 (and (= (size!48602 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48602 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48602 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1486768 () Bool)

(declare-fun e!833427 () Bool)

(assert (=> b!1486768 (= e!833428 e!833427)))

(declare-fun res!1011092 () Bool)

(assert (=> b!1486768 (=> (not res!1011092) (not e!833427))))

(assert (=> b!1486768 (= res!1011092 (and (= index!646 intermediateAfterIndex!19) (= lt!648575 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1486769 () Bool)

(declare-fun res!1011088 () Bool)

(assert (=> b!1486769 (=> (not res!1011088) (not e!833423))))

(assert (=> b!1486769 (= res!1011088 e!833426)))

(declare-fun c!137364 () Bool)

(assert (=> b!1486769 (= c!137364 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1486770 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99555 (_ BitVec 32)) SeekEntryResult!12292)

(assert (=> b!1486770 (= e!833427 (= (seekEntryOrOpen!0 lt!648576 lt!648579 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648576 lt!648579 mask!2687)))))

(declare-fun b!1486771 () Bool)

(assert (=> b!1486771 (= e!833425 e!833430)))

(declare-fun res!1011081 () Bool)

(assert (=> b!1486771 (=> (not res!1011081) (not e!833430))))

(declare-fun lt!648577 () SeekEntryResult!12292)

(assert (=> b!1486771 (= res!1011081 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48052 a!2862) j!93) mask!2687) (select (arr!48052 a!2862) j!93) a!2862 mask!2687) lt!648577))))

(assert (=> b!1486771 (= lt!648577 (Intermediate!12292 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1486772 () Bool)

(declare-fun res!1011083 () Bool)

(assert (=> b!1486772 (=> (not res!1011083) (not e!833429))))

(assert (=> b!1486772 (= res!1011083 (validKeyInArray!0 (select (arr!48052 a!2862) i!1006)))))

(declare-fun b!1486773 () Bool)

(assert (=> b!1486773 (= e!833424 true)))

(declare-fun lt!648578 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486773 (= lt!648578 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1486774 () Bool)

(assert (=> b!1486774 (= e!833426 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648576 lt!648579 mask!2687) (seekEntryOrOpen!0 lt!648576 lt!648579 mask!2687)))))

(declare-fun b!1486775 () Bool)

(declare-fun res!1011086 () Bool)

(assert (=> b!1486775 (=> (not res!1011086) (not e!833430))))

(assert (=> b!1486775 (= res!1011086 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48052 a!2862) j!93) a!2862 mask!2687) lt!648577))))

(declare-fun b!1486776 () Bool)

(declare-fun res!1011082 () Bool)

(assert (=> b!1486776 (=> (not res!1011082) (not e!833429))))

(assert (=> b!1486776 (= res!1011082 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48602 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48602 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48602 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126656 res!1011078) b!1486767))

(assert (= (and b!1486767 res!1011093) b!1486772))

(assert (= (and b!1486772 res!1011083) b!1486764))

(assert (= (and b!1486764 res!1011076) b!1486761))

(assert (= (and b!1486761 res!1011089) b!1486765))

(assert (= (and b!1486765 res!1011090) b!1486776))

(assert (= (and b!1486776 res!1011082) b!1486762))

(assert (= (and b!1486762 res!1011091) b!1486771))

(assert (= (and b!1486771 res!1011081) b!1486775))

(assert (= (and b!1486775 res!1011086) b!1486760))

(assert (= (and b!1486760 res!1011087) b!1486769))

(assert (= (and b!1486769 c!137364) b!1486758))

(assert (= (and b!1486769 (not c!137364)) b!1486774))

(assert (= (and b!1486769 res!1011088) b!1486763))

(assert (= (and b!1486763 res!1011084) b!1486757))

(assert (= (and b!1486757 res!1011079) b!1486759))

(assert (= (and b!1486759 res!1011080) b!1486756))

(assert (= (and b!1486756 res!1011077) b!1486766))

(assert (= (and b!1486766 (not res!1011085)) b!1486768))

(assert (= (and b!1486768 res!1011092) b!1486770))

(assert (= (and b!1486757 (not res!1011094)) b!1486773))

(declare-fun m!1371579 () Bool)

(assert (=> b!1486757 m!1371579))

(declare-fun m!1371581 () Bool)

(assert (=> b!1486757 m!1371581))

(declare-fun m!1371583 () Bool)

(assert (=> b!1486757 m!1371583))

(declare-fun m!1371585 () Bool)

(assert (=> b!1486757 m!1371585))

(declare-fun m!1371587 () Bool)

(assert (=> b!1486757 m!1371587))

(declare-fun m!1371589 () Bool)

(assert (=> b!1486757 m!1371589))

(declare-fun m!1371591 () Bool)

(assert (=> b!1486761 m!1371591))

(declare-fun m!1371593 () Bool)

(assert (=> b!1486773 m!1371593))

(assert (=> b!1486759 m!1371589))

(assert (=> b!1486759 m!1371589))

(declare-fun m!1371595 () Bool)

(assert (=> b!1486759 m!1371595))

(assert (=> b!1486764 m!1371589))

(assert (=> b!1486764 m!1371589))

(declare-fun m!1371597 () Bool)

(assert (=> b!1486764 m!1371597))

(declare-fun m!1371599 () Bool)

(assert (=> b!1486772 m!1371599))

(assert (=> b!1486772 m!1371599))

(declare-fun m!1371601 () Bool)

(assert (=> b!1486772 m!1371601))

(assert (=> b!1486766 m!1371585))

(assert (=> b!1486766 m!1371589))

(assert (=> b!1486766 m!1371581))

(assert (=> b!1486766 m!1371583))

(declare-fun m!1371603 () Bool)

(assert (=> b!1486756 m!1371603))

(assert (=> b!1486756 m!1371589))

(declare-fun m!1371605 () Bool)

(assert (=> b!1486770 m!1371605))

(declare-fun m!1371607 () Bool)

(assert (=> b!1486770 m!1371607))

(assert (=> b!1486774 m!1371607))

(assert (=> b!1486774 m!1371605))

(declare-fun m!1371609 () Bool)

(assert (=> b!1486765 m!1371609))

(declare-fun m!1371611 () Bool)

(assert (=> b!1486758 m!1371611))

(declare-fun m!1371613 () Bool)

(assert (=> start!126656 m!1371613))

(declare-fun m!1371615 () Bool)

(assert (=> start!126656 m!1371615))

(assert (=> b!1486771 m!1371589))

(assert (=> b!1486771 m!1371589))

(declare-fun m!1371617 () Bool)

(assert (=> b!1486771 m!1371617))

(assert (=> b!1486771 m!1371617))

(assert (=> b!1486771 m!1371589))

(declare-fun m!1371619 () Bool)

(assert (=> b!1486771 m!1371619))

(assert (=> b!1486775 m!1371589))

(assert (=> b!1486775 m!1371589))

(declare-fun m!1371621 () Bool)

(assert (=> b!1486775 m!1371621))

(assert (=> b!1486762 m!1371581))

(declare-fun m!1371623 () Bool)

(assert (=> b!1486762 m!1371623))

(declare-fun m!1371625 () Bool)

(assert (=> b!1486760 m!1371625))

(assert (=> b!1486760 m!1371625))

(declare-fun m!1371627 () Bool)

(assert (=> b!1486760 m!1371627))

(assert (=> b!1486760 m!1371581))

(declare-fun m!1371629 () Bool)

(assert (=> b!1486760 m!1371629))

(push 1)

