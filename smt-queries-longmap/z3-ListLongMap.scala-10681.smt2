; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125194 () Bool)

(assert start!125194)

(declare-fun b!1460670 () Bool)

(declare-fun e!821242 () Bool)

(declare-fun e!821236 () Bool)

(assert (=> b!1460670 (= e!821242 e!821236)))

(declare-fun res!990515 () Bool)

(assert (=> b!1460670 (=> (not res!990515) (not e!821236))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98620 0))(
  ( (array!98621 (arr!47599 (Array (_ BitVec 32) (_ BitVec 64))) (size!48151 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98620)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1460670 (= res!990515 (= (select (store (arr!47599 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!639717 () array!98620)

(assert (=> b!1460670 (= lt!639717 (array!98621 (store (arr!47599 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48151 a!2862)))))

(declare-fun b!1460671 () Bool)

(declare-fun e!821238 () Bool)

(declare-fun e!821243 () Bool)

(assert (=> b!1460671 (= e!821238 (not e!821243))))

(declare-fun res!990510 () Bool)

(assert (=> b!1460671 (=> res!990510 e!821243)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1460671 (= res!990510 (or (and (= (select (arr!47599 a!2862) index!646) (select (store (arr!47599 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47599 a!2862) index!646) (select (arr!47599 a!2862) j!93))) (= (select (arr!47599 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!821239 () Bool)

(assert (=> b!1460671 e!821239))

(declare-fun res!990508 () Bool)

(assert (=> b!1460671 (=> (not res!990508) (not e!821239))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98620 (_ BitVec 32)) Bool)

(assert (=> b!1460671 (= res!990508 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49089 0))(
  ( (Unit!49090) )
))
(declare-fun lt!639715 () Unit!49089)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98620 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49089)

(assert (=> b!1460671 (= lt!639715 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1460672 () Bool)

(declare-fun res!990516 () Bool)

(assert (=> b!1460672 (=> (not res!990516) (not e!821242))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1460672 (= res!990516 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48151 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48151 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48151 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1460673 () Bool)

(declare-fun res!990520 () Bool)

(declare-fun e!821240 () Bool)

(assert (=> b!1460673 (=> res!990520 e!821240)))

(declare-fun lt!639718 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11876 0))(
  ( (MissingZero!11876 (index!49896 (_ BitVec 32))) (Found!11876 (index!49897 (_ BitVec 32))) (Intermediate!11876 (undefined!12688 Bool) (index!49898 (_ BitVec 32)) (x!131496 (_ BitVec 32))) (Undefined!11876) (MissingVacant!11876 (index!49899 (_ BitVec 32))) )
))
(declare-fun lt!639716 () SeekEntryResult!11876)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98620 (_ BitVec 32)) SeekEntryResult!11876)

(assert (=> b!1460673 (= res!990520 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639718 (select (arr!47599 a!2862) j!93) a!2862 mask!2687) lt!639716)))))

(declare-fun b!1460674 () Bool)

(declare-fun e!821237 () Bool)

(declare-fun lt!639714 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98620 (_ BitVec 32)) SeekEntryResult!11876)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98620 (_ BitVec 32)) SeekEntryResult!11876)

(assert (=> b!1460674 (= e!821237 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639714 lt!639717 mask!2687) (seekEntryOrOpen!0 lt!639714 lt!639717 mask!2687)))))

(declare-fun b!1460675 () Bool)

(declare-fun e!821235 () Bool)

(assert (=> b!1460675 (= e!821235 e!821238)))

(declare-fun res!990509 () Bool)

(assert (=> b!1460675 (=> (not res!990509) (not e!821238))))

(declare-fun lt!639720 () SeekEntryResult!11876)

(assert (=> b!1460675 (= res!990509 (= lt!639720 (Intermediate!11876 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460675 (= lt!639720 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639714 mask!2687) lt!639714 lt!639717 mask!2687))))

(assert (=> b!1460675 (= lt!639714 (select (store (arr!47599 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1460676 () Bool)

(declare-fun res!990512 () Bool)

(assert (=> b!1460676 (=> (not res!990512) (not e!821242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460676 (= res!990512 (validKeyInArray!0 (select (arr!47599 a!2862) j!93)))))

(declare-fun b!1460677 () Bool)

(declare-fun res!990513 () Bool)

(assert (=> b!1460677 (=> (not res!990513) (not e!821239))))

(assert (=> b!1460677 (= res!990513 (= (seekEntryOrOpen!0 (select (arr!47599 a!2862) j!93) a!2862 mask!2687) (Found!11876 j!93)))))

(declare-fun b!1460678 () Bool)

(declare-fun res!990519 () Bool)

(assert (=> b!1460678 (=> (not res!990519) (not e!821242))))

(declare-datatypes ((List!34178 0))(
  ( (Nil!34175) (Cons!34174 (h!35524 (_ BitVec 64)) (t!48864 List!34178)) )
))
(declare-fun arrayNoDuplicates!0 (array!98620 (_ BitVec 32) List!34178) Bool)

(assert (=> b!1460678 (= res!990519 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34175))))

(declare-fun b!1460679 () Bool)

(assert (=> b!1460679 (= e!821240 true)))

(declare-fun lt!639719 () Bool)

(declare-fun e!821244 () Bool)

(assert (=> b!1460679 (= lt!639719 e!821244)))

(declare-fun c!134596 () Bool)

(assert (=> b!1460679 (= c!134596 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1460680 () Bool)

(declare-fun res!990518 () Bool)

(assert (=> b!1460680 (=> (not res!990518) (not e!821238))))

(assert (=> b!1460680 (= res!990518 e!821237)))

(declare-fun c!134595 () Bool)

(assert (=> b!1460680 (= c!134595 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1460681 () Bool)

(assert (=> b!1460681 (= e!821244 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639718 intermediateAfterIndex!19 lt!639714 lt!639717 mask!2687) (seekEntryOrOpen!0 lt!639714 lt!639717 mask!2687))))))

(declare-fun b!1460682 () Bool)

(assert (=> b!1460682 (= e!821239 (or (= (select (arr!47599 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47599 a!2862) intermediateBeforeIndex!19) (select (arr!47599 a!2862) j!93))))))

(declare-fun b!1460683 () Bool)

(declare-fun res!990521 () Bool)

(assert (=> b!1460683 (=> (not res!990521) (not e!821238))))

(assert (=> b!1460683 (= res!990521 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1460684 () Bool)

(assert (=> b!1460684 (= e!821236 e!821235)))

(declare-fun res!990517 () Bool)

(assert (=> b!1460684 (=> (not res!990517) (not e!821235))))

(assert (=> b!1460684 (= res!990517 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47599 a!2862) j!93) mask!2687) (select (arr!47599 a!2862) j!93) a!2862 mask!2687) lt!639716))))

(assert (=> b!1460684 (= lt!639716 (Intermediate!11876 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1460685 () Bool)

(assert (=> b!1460685 (= e!821243 e!821240)))

(declare-fun res!990523 () Bool)

(assert (=> b!1460685 (=> res!990523 e!821240)))

(assert (=> b!1460685 (= res!990523 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639718 #b00000000000000000000000000000000) (bvsge lt!639718 (size!48151 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460685 (= lt!639718 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1460686 () Bool)

(assert (=> b!1460686 (= e!821244 (not (= lt!639720 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639718 lt!639714 lt!639717 mask!2687))))))

(declare-fun b!1460687 () Bool)

(assert (=> b!1460687 (= e!821237 (= lt!639720 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639714 lt!639717 mask!2687)))))

(declare-fun b!1460688 () Bool)

(declare-fun res!990511 () Bool)

(assert (=> b!1460688 (=> (not res!990511) (not e!821242))))

(assert (=> b!1460688 (= res!990511 (and (= (size!48151 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48151 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48151 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460689 () Bool)

(declare-fun res!990514 () Bool)

(assert (=> b!1460689 (=> (not res!990514) (not e!821242))))

(assert (=> b!1460689 (= res!990514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!990506 () Bool)

(assert (=> start!125194 (=> (not res!990506) (not e!821242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125194 (= res!990506 (validMask!0 mask!2687))))

(assert (=> start!125194 e!821242))

(assert (=> start!125194 true))

(declare-fun array_inv!36832 (array!98620) Bool)

(assert (=> start!125194 (array_inv!36832 a!2862)))

(declare-fun b!1460690 () Bool)

(declare-fun res!990507 () Bool)

(assert (=> b!1460690 (=> (not res!990507) (not e!821242))))

(assert (=> b!1460690 (= res!990507 (validKeyInArray!0 (select (arr!47599 a!2862) i!1006)))))

(declare-fun b!1460691 () Bool)

(declare-fun res!990522 () Bool)

(assert (=> b!1460691 (=> (not res!990522) (not e!821235))))

(assert (=> b!1460691 (= res!990522 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47599 a!2862) j!93) a!2862 mask!2687) lt!639716))))

(assert (= (and start!125194 res!990506) b!1460688))

(assert (= (and b!1460688 res!990511) b!1460690))

(assert (= (and b!1460690 res!990507) b!1460676))

(assert (= (and b!1460676 res!990512) b!1460689))

(assert (= (and b!1460689 res!990514) b!1460678))

(assert (= (and b!1460678 res!990519) b!1460672))

(assert (= (and b!1460672 res!990516) b!1460670))

(assert (= (and b!1460670 res!990515) b!1460684))

(assert (= (and b!1460684 res!990517) b!1460691))

(assert (= (and b!1460691 res!990522) b!1460675))

(assert (= (and b!1460675 res!990509) b!1460680))

(assert (= (and b!1460680 c!134595) b!1460687))

(assert (= (and b!1460680 (not c!134595)) b!1460674))

(assert (= (and b!1460680 res!990518) b!1460683))

(assert (= (and b!1460683 res!990521) b!1460671))

(assert (= (and b!1460671 res!990508) b!1460677))

(assert (= (and b!1460677 res!990513) b!1460682))

(assert (= (and b!1460671 (not res!990510)) b!1460685))

(assert (= (and b!1460685 (not res!990523)) b!1460673))

(assert (= (and b!1460673 (not res!990520)) b!1460679))

(assert (= (and b!1460679 c!134596) b!1460686))

(assert (= (and b!1460679 (not c!134596)) b!1460681))

(declare-fun m!1347837 () Bool)

(assert (=> b!1460689 m!1347837))

(declare-fun m!1347839 () Bool)

(assert (=> b!1460670 m!1347839))

(declare-fun m!1347841 () Bool)

(assert (=> b!1460670 m!1347841))

(declare-fun m!1347843 () Bool)

(assert (=> b!1460682 m!1347843))

(declare-fun m!1347845 () Bool)

(assert (=> b!1460682 m!1347845))

(declare-fun m!1347847 () Bool)

(assert (=> b!1460687 m!1347847))

(declare-fun m!1347849 () Bool)

(assert (=> b!1460675 m!1347849))

(assert (=> b!1460675 m!1347849))

(declare-fun m!1347851 () Bool)

(assert (=> b!1460675 m!1347851))

(assert (=> b!1460675 m!1347839))

(declare-fun m!1347853 () Bool)

(assert (=> b!1460675 m!1347853))

(declare-fun m!1347855 () Bool)

(assert (=> b!1460671 m!1347855))

(assert (=> b!1460671 m!1347839))

(declare-fun m!1347857 () Bool)

(assert (=> b!1460671 m!1347857))

(declare-fun m!1347859 () Bool)

(assert (=> b!1460671 m!1347859))

(declare-fun m!1347861 () Bool)

(assert (=> b!1460671 m!1347861))

(assert (=> b!1460671 m!1347845))

(declare-fun m!1347863 () Bool)

(assert (=> b!1460674 m!1347863))

(declare-fun m!1347865 () Bool)

(assert (=> b!1460674 m!1347865))

(assert (=> b!1460691 m!1347845))

(assert (=> b!1460691 m!1347845))

(declare-fun m!1347867 () Bool)

(assert (=> b!1460691 m!1347867))

(declare-fun m!1347869 () Bool)

(assert (=> b!1460678 m!1347869))

(declare-fun m!1347871 () Bool)

(assert (=> start!125194 m!1347871))

(declare-fun m!1347873 () Bool)

(assert (=> start!125194 m!1347873))

(assert (=> b!1460684 m!1347845))

(assert (=> b!1460684 m!1347845))

(declare-fun m!1347875 () Bool)

(assert (=> b!1460684 m!1347875))

(assert (=> b!1460684 m!1347875))

(assert (=> b!1460684 m!1347845))

(declare-fun m!1347877 () Bool)

(assert (=> b!1460684 m!1347877))

(assert (=> b!1460673 m!1347845))

(assert (=> b!1460673 m!1347845))

(declare-fun m!1347879 () Bool)

(assert (=> b!1460673 m!1347879))

(assert (=> b!1460677 m!1347845))

(assert (=> b!1460677 m!1347845))

(declare-fun m!1347881 () Bool)

(assert (=> b!1460677 m!1347881))

(declare-fun m!1347883 () Bool)

(assert (=> b!1460686 m!1347883))

(declare-fun m!1347885 () Bool)

(assert (=> b!1460690 m!1347885))

(assert (=> b!1460690 m!1347885))

(declare-fun m!1347887 () Bool)

(assert (=> b!1460690 m!1347887))

(declare-fun m!1347889 () Bool)

(assert (=> b!1460685 m!1347889))

(declare-fun m!1347891 () Bool)

(assert (=> b!1460681 m!1347891))

(assert (=> b!1460681 m!1347865))

(assert (=> b!1460676 m!1347845))

(assert (=> b!1460676 m!1347845))

(declare-fun m!1347893 () Bool)

(assert (=> b!1460676 m!1347893))

(check-sat (not b!1460673) (not b!1460690) (not b!1460671) (not b!1460691) (not b!1460676) (not start!125194) (not b!1460674) (not b!1460684) (not b!1460685) (not b!1460681) (not b!1460678) (not b!1460675) (not b!1460677) (not b!1460686) (not b!1460689) (not b!1460687))
(check-sat)
