; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125102 () Bool)

(assert start!125102)

(declare-fun b!1457011 () Bool)

(declare-fun res!987391 () Bool)

(declare-fun e!819700 () Bool)

(assert (=> b!1457011 (=> (not res!987391) (not e!819700))))

(declare-datatypes ((array!98550 0))(
  ( (array!98551 (arr!47563 (Array (_ BitVec 32) (_ BitVec 64))) (size!48113 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98550)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11815 0))(
  ( (MissingZero!11815 (index!49652 (_ BitVec 32))) (Found!11815 (index!49653 (_ BitVec 32))) (Intermediate!11815 (undefined!12627 Bool) (index!49654 (_ BitVec 32)) (x!131272 (_ BitVec 32))) (Undefined!11815) (MissingVacant!11815 (index!49655 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98550 (_ BitVec 32)) SeekEntryResult!11815)

(assert (=> b!1457011 (= res!987391 (= (seekEntryOrOpen!0 (select (arr!47563 a!2862) j!93) a!2862 mask!2687) (Found!11815 j!93)))))

(declare-fun b!1457012 () Bool)

(declare-fun e!819692 () Bool)

(declare-fun e!819694 () Bool)

(assert (=> b!1457012 (= e!819692 e!819694)))

(declare-fun res!987395 () Bool)

(assert (=> b!1457012 (=> (not res!987395) (not e!819694))))

(declare-fun lt!638527 () SeekEntryResult!11815)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98550 (_ BitVec 32)) SeekEntryResult!11815)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457012 (= res!987395 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47563 a!2862) j!93) mask!2687) (select (arr!47563 a!2862) j!93) a!2862 mask!2687) lt!638527))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1457012 (= lt!638527 (Intermediate!11815 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1457013 () Bool)

(declare-fun res!987403 () Bool)

(declare-fun e!819701 () Bool)

(assert (=> b!1457013 (=> (not res!987403) (not e!819701))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1457013 (= res!987403 (validKeyInArray!0 (select (arr!47563 a!2862) i!1006)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!638526 () array!98550)

(declare-fun lt!638529 () (_ BitVec 32))

(declare-fun b!1457014 () Bool)

(declare-fun lt!638523 () SeekEntryResult!11815)

(declare-fun e!819698 () Bool)

(declare-fun lt!638525 () (_ BitVec 64))

(assert (=> b!1457014 (= e!819698 (not (= lt!638523 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638529 lt!638525 lt!638526 mask!2687))))))

(declare-fun b!1457015 () Bool)

(declare-fun e!819696 () Bool)

(assert (=> b!1457015 (= e!819694 e!819696)))

(declare-fun res!987400 () Bool)

(assert (=> b!1457015 (=> (not res!987400) (not e!819696))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1457015 (= res!987400 (= lt!638523 (Intermediate!11815 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1457015 (= lt!638523 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638525 mask!2687) lt!638525 lt!638526 mask!2687))))

(assert (=> b!1457015 (= lt!638525 (select (store (arr!47563 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1457016 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1457016 (= e!819700 (and (or (= (select (arr!47563 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47563 a!2862) intermediateBeforeIndex!19) (select (arr!47563 a!2862) j!93))) (let ((bdg!53293 (select (store (arr!47563 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47563 a!2862) index!646) bdg!53293) (= (select (arr!47563 a!2862) index!646) (select (arr!47563 a!2862) j!93))) (= (select (arr!47563 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53293 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1457017 () Bool)

(declare-fun res!987398 () Bool)

(assert (=> b!1457017 (=> (not res!987398) (not e!819701))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98550 (_ BitVec 32)) Bool)

(assert (=> b!1457017 (= res!987398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1457018 () Bool)

(declare-fun res!987399 () Bool)

(assert (=> b!1457018 (=> (not res!987399) (not e!819701))))

(assert (=> b!1457018 (= res!987399 (and (= (size!48113 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48113 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48113 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1457019 () Bool)

(declare-fun res!987389 () Bool)

(assert (=> b!1457019 (=> (not res!987389) (not e!819701))))

(assert (=> b!1457019 (= res!987389 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48113 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48113 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48113 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1457020 () Bool)

(declare-fun res!987397 () Bool)

(assert (=> b!1457020 (=> (not res!987397) (not e!819701))))

(declare-datatypes ((List!34064 0))(
  ( (Nil!34061) (Cons!34060 (h!35410 (_ BitVec 64)) (t!48758 List!34064)) )
))
(declare-fun arrayNoDuplicates!0 (array!98550 (_ BitVec 32) List!34064) Bool)

(assert (=> b!1457020 (= res!987397 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34061))))

(declare-fun e!819693 () Bool)

(declare-fun b!1457021 () Bool)

(assert (=> b!1457021 (= e!819693 (= lt!638523 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638525 lt!638526 mask!2687)))))

(declare-fun b!1457010 () Bool)

(declare-fun res!987404 () Bool)

(assert (=> b!1457010 (=> (not res!987404) (not e!819701))))

(assert (=> b!1457010 (= res!987404 (validKeyInArray!0 (select (arr!47563 a!2862) j!93)))))

(declare-fun res!987406 () Bool)

(assert (=> start!125102 (=> (not res!987406) (not e!819701))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125102 (= res!987406 (validMask!0 mask!2687))))

(assert (=> start!125102 e!819701))

(assert (=> start!125102 true))

(declare-fun array_inv!36591 (array!98550) Bool)

(assert (=> start!125102 (array_inv!36591 a!2862)))

(declare-fun b!1457022 () Bool)

(declare-fun lt!638528 () SeekEntryResult!11815)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98550 (_ BitVec 32)) SeekEntryResult!11815)

(assert (=> b!1457022 (= e!819698 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638529 intermediateAfterIndex!19 lt!638525 lt!638526 mask!2687) lt!638528)))))

(declare-fun b!1457023 () Bool)

(declare-fun res!987401 () Bool)

(assert (=> b!1457023 (=> (not res!987401) (not e!819694))))

(assert (=> b!1457023 (= res!987401 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47563 a!2862) j!93) a!2862 mask!2687) lt!638527))))

(declare-fun b!1457024 () Bool)

(declare-fun e!819697 () Bool)

(assert (=> b!1457024 (= e!819697 true)))

(declare-fun lt!638522 () Bool)

(assert (=> b!1457024 (= lt!638522 e!819698)))

(declare-fun c!134322 () Bool)

(assert (=> b!1457024 (= c!134322 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1457025 () Bool)

(declare-fun res!987390 () Bool)

(assert (=> b!1457025 (=> (not res!987390) (not e!819696))))

(assert (=> b!1457025 (= res!987390 e!819693)))

(declare-fun c!134321 () Bool)

(assert (=> b!1457025 (= c!134321 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1457026 () Bool)

(assert (=> b!1457026 (= e!819701 e!819692)))

(declare-fun res!987402 () Bool)

(assert (=> b!1457026 (=> (not res!987402) (not e!819692))))

(assert (=> b!1457026 (= res!987402 (= (select (store (arr!47563 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1457026 (= lt!638526 (array!98551 (store (arr!47563 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48113 a!2862)))))

(declare-fun b!1457027 () Bool)

(declare-fun res!987394 () Bool)

(assert (=> b!1457027 (=> (not res!987394) (not e!819696))))

(assert (=> b!1457027 (= res!987394 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1457028 () Bool)

(declare-fun e!819699 () Bool)

(assert (=> b!1457028 (= e!819696 (not e!819699))))

(declare-fun res!987392 () Bool)

(assert (=> b!1457028 (=> res!987392 e!819699)))

(assert (=> b!1457028 (= res!987392 (or (and (= (select (arr!47563 a!2862) index!646) (select (store (arr!47563 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47563 a!2862) index!646) (select (arr!47563 a!2862) j!93))) (= (select (arr!47563 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1457028 e!819700))

(declare-fun res!987393 () Bool)

(assert (=> b!1457028 (=> (not res!987393) (not e!819700))))

(assert (=> b!1457028 (= res!987393 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49126 0))(
  ( (Unit!49127) )
))
(declare-fun lt!638524 () Unit!49126)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98550 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49126)

(assert (=> b!1457028 (= lt!638524 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1457029 () Bool)

(assert (=> b!1457029 (= e!819693 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638525 lt!638526 mask!2687) (seekEntryOrOpen!0 lt!638525 lt!638526 mask!2687)))))

(declare-fun b!1457030 () Bool)

(assert (=> b!1457030 (= e!819699 e!819697)))

(declare-fun res!987405 () Bool)

(assert (=> b!1457030 (=> res!987405 e!819697)))

(assert (=> b!1457030 (= res!987405 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638529 #b00000000000000000000000000000000) (bvsge lt!638529 (size!48113 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457030 (= lt!638529 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1457030 (= lt!638528 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638525 lt!638526 mask!2687))))

(assert (=> b!1457030 (= lt!638528 (seekEntryOrOpen!0 lt!638525 lt!638526 mask!2687))))

(declare-fun b!1457031 () Bool)

(declare-fun res!987396 () Bool)

(assert (=> b!1457031 (=> res!987396 e!819697)))

(assert (=> b!1457031 (= res!987396 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638529 (select (arr!47563 a!2862) j!93) a!2862 mask!2687) lt!638527)))))

(assert (= (and start!125102 res!987406) b!1457018))

(assert (= (and b!1457018 res!987399) b!1457013))

(assert (= (and b!1457013 res!987403) b!1457010))

(assert (= (and b!1457010 res!987404) b!1457017))

(assert (= (and b!1457017 res!987398) b!1457020))

(assert (= (and b!1457020 res!987397) b!1457019))

(assert (= (and b!1457019 res!987389) b!1457026))

(assert (= (and b!1457026 res!987402) b!1457012))

(assert (= (and b!1457012 res!987395) b!1457023))

(assert (= (and b!1457023 res!987401) b!1457015))

(assert (= (and b!1457015 res!987400) b!1457025))

(assert (= (and b!1457025 c!134321) b!1457021))

(assert (= (and b!1457025 (not c!134321)) b!1457029))

(assert (= (and b!1457025 res!987390) b!1457027))

(assert (= (and b!1457027 res!987394) b!1457028))

(assert (= (and b!1457028 res!987393) b!1457011))

(assert (= (and b!1457011 res!987391) b!1457016))

(assert (= (and b!1457028 (not res!987392)) b!1457030))

(assert (= (and b!1457030 (not res!987405)) b!1457031))

(assert (= (and b!1457031 (not res!987396)) b!1457024))

(assert (= (and b!1457024 c!134322) b!1457014))

(assert (= (and b!1457024 (not c!134322)) b!1457022))

(declare-fun m!1345041 () Bool)

(assert (=> b!1457030 m!1345041))

(declare-fun m!1345043 () Bool)

(assert (=> b!1457030 m!1345043))

(declare-fun m!1345045 () Bool)

(assert (=> b!1457030 m!1345045))

(declare-fun m!1345047 () Bool)

(assert (=> b!1457022 m!1345047))

(declare-fun m!1345049 () Bool)

(assert (=> b!1457023 m!1345049))

(assert (=> b!1457023 m!1345049))

(declare-fun m!1345051 () Bool)

(assert (=> b!1457023 m!1345051))

(declare-fun m!1345053 () Bool)

(assert (=> b!1457026 m!1345053))

(declare-fun m!1345055 () Bool)

(assert (=> b!1457026 m!1345055))

(assert (=> b!1457031 m!1345049))

(assert (=> b!1457031 m!1345049))

(declare-fun m!1345057 () Bool)

(assert (=> b!1457031 m!1345057))

(assert (=> b!1457029 m!1345043))

(assert (=> b!1457029 m!1345045))

(declare-fun m!1345059 () Bool)

(assert (=> b!1457014 m!1345059))

(assert (=> b!1457010 m!1345049))

(assert (=> b!1457010 m!1345049))

(declare-fun m!1345061 () Bool)

(assert (=> b!1457010 m!1345061))

(assert (=> b!1457011 m!1345049))

(assert (=> b!1457011 m!1345049))

(declare-fun m!1345063 () Bool)

(assert (=> b!1457011 m!1345063))

(assert (=> b!1457012 m!1345049))

(assert (=> b!1457012 m!1345049))

(declare-fun m!1345065 () Bool)

(assert (=> b!1457012 m!1345065))

(assert (=> b!1457012 m!1345065))

(assert (=> b!1457012 m!1345049))

(declare-fun m!1345067 () Bool)

(assert (=> b!1457012 m!1345067))

(declare-fun m!1345069 () Bool)

(assert (=> b!1457017 m!1345069))

(assert (=> b!1457016 m!1345053))

(declare-fun m!1345071 () Bool)

(assert (=> b!1457016 m!1345071))

(declare-fun m!1345073 () Bool)

(assert (=> b!1457016 m!1345073))

(declare-fun m!1345075 () Bool)

(assert (=> b!1457016 m!1345075))

(assert (=> b!1457016 m!1345049))

(declare-fun m!1345077 () Bool)

(assert (=> start!125102 m!1345077))

(declare-fun m!1345079 () Bool)

(assert (=> start!125102 m!1345079))

(declare-fun m!1345081 () Bool)

(assert (=> b!1457020 m!1345081))

(declare-fun m!1345083 () Bool)

(assert (=> b!1457028 m!1345083))

(assert (=> b!1457028 m!1345053))

(assert (=> b!1457028 m!1345073))

(assert (=> b!1457028 m!1345075))

(declare-fun m!1345085 () Bool)

(assert (=> b!1457028 m!1345085))

(assert (=> b!1457028 m!1345049))

(declare-fun m!1345087 () Bool)

(assert (=> b!1457013 m!1345087))

(assert (=> b!1457013 m!1345087))

(declare-fun m!1345089 () Bool)

(assert (=> b!1457013 m!1345089))

(declare-fun m!1345091 () Bool)

(assert (=> b!1457021 m!1345091))

(declare-fun m!1345093 () Bool)

(assert (=> b!1457015 m!1345093))

(assert (=> b!1457015 m!1345093))

(declare-fun m!1345095 () Bool)

(assert (=> b!1457015 m!1345095))

(assert (=> b!1457015 m!1345053))

(declare-fun m!1345097 () Bool)

(assert (=> b!1457015 m!1345097))

(push 1)

(assert (not b!1457028))

(assert (not b!1457023))

(assert (not b!1457013))

(assert (not b!1457014))

(assert (not b!1457010))

(assert (not b!1457017))

(assert (not b!1457011))

(assert (not b!1457029))

(assert (not b!1457031))

(assert (not b!1457015))

(assert (not start!125102))

(assert (not b!1457021))

(assert (not b!1457022))

(assert (not b!1457030))

(assert (not b!1457020))

(assert (not b!1457012))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

