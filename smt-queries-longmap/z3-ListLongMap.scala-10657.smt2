; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125298 () Bool)

(assert start!125298)

(declare-fun b!1457611 () Bool)

(declare-fun e!820208 () Bool)

(declare-fun e!820200 () Bool)

(assert (=> b!1457611 (= e!820208 e!820200)))

(declare-fun res!987299 () Bool)

(assert (=> b!1457611 (=> (not res!987299) (not e!820200))))

(declare-datatypes ((SeekEntryResult!11754 0))(
  ( (MissingZero!11754 (index!49408 (_ BitVec 32))) (Found!11754 (index!49409 (_ BitVec 32))) (Intermediate!11754 (undefined!12566 Bool) (index!49410 (_ BitVec 32)) (x!131211 (_ BitVec 32))) (Undefined!11754) (MissingVacant!11754 (index!49411 (_ BitVec 32))) )
))
(declare-fun lt!638743 () SeekEntryResult!11754)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1457611 (= res!987299 (= lt!638743 (Intermediate!11754 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!98641 0))(
  ( (array!98642 (arr!47605 (Array (_ BitVec 32) (_ BitVec 64))) (size!48156 (_ BitVec 32))) )
))
(declare-fun lt!638736 () array!98641)

(declare-fun lt!638742 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98641 (_ BitVec 32)) SeekEntryResult!11754)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457611 (= lt!638743 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638742 mask!2687) lt!638742 lt!638736 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98641)

(assert (=> b!1457611 (= lt!638742 (select (store (arr!47605 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1457612 () Bool)

(declare-fun e!820204 () Bool)

(assert (=> b!1457612 (= e!820204 true)))

(declare-fun lt!638739 () Bool)

(declare-fun e!820202 () Bool)

(assert (=> b!1457612 (= lt!638739 e!820202)))

(declare-fun c!134676 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1457612 (= c!134676 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1457613 () Bool)

(declare-fun res!987306 () Bool)

(declare-fun e!820205 () Bool)

(assert (=> b!1457613 (=> (not res!987306) (not e!820205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98641 (_ BitVec 32)) Bool)

(assert (=> b!1457613 (= res!987306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1457614 () Bool)

(declare-fun res!987302 () Bool)

(assert (=> b!1457614 (=> (not res!987302) (not e!820205))))

(assert (=> b!1457614 (= res!987302 (and (= (size!48156 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48156 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48156 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1457615 () Bool)

(declare-fun lt!638738 () SeekEntryResult!11754)

(declare-fun lt!638741 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98641 (_ BitVec 32)) SeekEntryResult!11754)

(assert (=> b!1457615 (= e!820202 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638741 intermediateAfterIndex!19 lt!638742 lt!638736 mask!2687) lt!638738)))))

(declare-fun b!1457616 () Bool)

(declare-fun res!987311 () Bool)

(assert (=> b!1457616 (=> (not res!987311) (not e!820200))))

(declare-fun e!820209 () Bool)

(assert (=> b!1457616 (= res!987311 e!820209)))

(declare-fun c!134677 () Bool)

(assert (=> b!1457616 (= c!134677 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1457617 () Bool)

(declare-fun res!987301 () Bool)

(declare-fun e!820206 () Bool)

(assert (=> b!1457617 (=> (not res!987301) (not e!820206))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98641 (_ BitVec 32)) SeekEntryResult!11754)

(assert (=> b!1457617 (= res!987301 (= (seekEntryOrOpen!0 (select (arr!47605 a!2862) j!93) a!2862 mask!2687) (Found!11754 j!93)))))

(declare-fun b!1457618 () Bool)

(declare-fun e!820207 () Bool)

(assert (=> b!1457618 (= e!820207 e!820204)))

(declare-fun res!987300 () Bool)

(assert (=> b!1457618 (=> res!987300 e!820204)))

(assert (=> b!1457618 (= res!987300 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638741 #b00000000000000000000000000000000) (bvsge lt!638741 (size!48156 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457618 (= lt!638741 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> b!1457618 (= lt!638738 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638742 lt!638736 mask!2687))))

(assert (=> b!1457618 (= lt!638738 (seekEntryOrOpen!0 lt!638742 lt!638736 mask!2687))))

(declare-fun b!1457619 () Bool)

(declare-fun e!820201 () Bool)

(assert (=> b!1457619 (= e!820205 e!820201)))

(declare-fun res!987308 () Bool)

(assert (=> b!1457619 (=> (not res!987308) (not e!820201))))

(assert (=> b!1457619 (= res!987308 (= (select (store (arr!47605 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1457619 (= lt!638736 (array!98642 (store (arr!47605 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48156 a!2862)))))

(declare-fun b!1457620 () Bool)

(declare-fun res!987307 () Bool)

(assert (=> b!1457620 (=> (not res!987307) (not e!820205))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1457620 (= res!987307 (validKeyInArray!0 (select (arr!47605 a!2862) i!1006)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1457621 () Bool)

(assert (=> b!1457621 (= e!820206 (and (or (= (select (arr!47605 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47605 a!2862) intermediateBeforeIndex!19) (select (arr!47605 a!2862) j!93))) (let ((bdg!53234 (select (store (arr!47605 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47605 a!2862) index!646) bdg!53234) (= (select (arr!47605 a!2862) index!646) (select (arr!47605 a!2862) j!93))) (= (select (arr!47605 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53234 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun res!987309 () Bool)

(assert (=> start!125298 (=> (not res!987309) (not e!820205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125298 (= res!987309 (validMask!0 mask!2687))))

(assert (=> start!125298 e!820205))

(assert (=> start!125298 true))

(declare-fun array_inv!36886 (array!98641) Bool)

(assert (=> start!125298 (array_inv!36886 a!2862)))

(declare-fun b!1457622 () Bool)

(assert (=> b!1457622 (= e!820201 e!820208)))

(declare-fun res!987297 () Bool)

(assert (=> b!1457622 (=> (not res!987297) (not e!820208))))

(declare-fun lt!638740 () SeekEntryResult!11754)

(assert (=> b!1457622 (= res!987297 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47605 a!2862) j!93) mask!2687) (select (arr!47605 a!2862) j!93) a!2862 mask!2687) lt!638740))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1457622 (= lt!638740 (Intermediate!11754 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1457623 () Bool)

(assert (=> b!1457623 (= e!820209 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638742 lt!638736 mask!2687) (seekEntryOrOpen!0 lt!638742 lt!638736 mask!2687)))))

(declare-fun b!1457624 () Bool)

(assert (=> b!1457624 (= e!820200 (not e!820207))))

(declare-fun res!987298 () Bool)

(assert (=> b!1457624 (=> res!987298 e!820207)))

(assert (=> b!1457624 (= res!987298 (or (and (= (select (arr!47605 a!2862) index!646) (select (store (arr!47605 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47605 a!2862) index!646) (select (arr!47605 a!2862) j!93))) (= (select (arr!47605 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1457624 e!820206))

(declare-fun res!987305 () Bool)

(assert (=> b!1457624 (=> (not res!987305) (not e!820206))))

(assert (=> b!1457624 (= res!987305 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49037 0))(
  ( (Unit!49038) )
))
(declare-fun lt!638737 () Unit!49037)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98641 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49037)

(assert (=> b!1457624 (= lt!638737 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1457625 () Bool)

(declare-fun res!987303 () Bool)

(assert (=> b!1457625 (=> res!987303 e!820204)))

(assert (=> b!1457625 (= res!987303 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638741 (select (arr!47605 a!2862) j!93) a!2862 mask!2687) lt!638740)))))

(declare-fun b!1457626 () Bool)

(declare-fun res!987313 () Bool)

(assert (=> b!1457626 (=> (not res!987313) (not e!820200))))

(assert (=> b!1457626 (= res!987313 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1457627 () Bool)

(declare-fun res!987312 () Bool)

(assert (=> b!1457627 (=> (not res!987312) (not e!820205))))

(declare-datatypes ((List!34093 0))(
  ( (Nil!34090) (Cons!34089 (h!35450 (_ BitVec 64)) (t!48779 List!34093)) )
))
(declare-fun arrayNoDuplicates!0 (array!98641 (_ BitVec 32) List!34093) Bool)

(assert (=> b!1457627 (= res!987312 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34090))))

(declare-fun b!1457628 () Bool)

(declare-fun res!987304 () Bool)

(assert (=> b!1457628 (=> (not res!987304) (not e!820205))))

(assert (=> b!1457628 (= res!987304 (validKeyInArray!0 (select (arr!47605 a!2862) j!93)))))

(declare-fun b!1457629 () Bool)

(assert (=> b!1457629 (= e!820202 (not (= lt!638743 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638741 lt!638742 lt!638736 mask!2687))))))

(declare-fun b!1457630 () Bool)

(declare-fun res!987314 () Bool)

(assert (=> b!1457630 (=> (not res!987314) (not e!820205))))

(assert (=> b!1457630 (= res!987314 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48156 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48156 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48156 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1457631 () Bool)

(assert (=> b!1457631 (= e!820209 (= lt!638743 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638742 lt!638736 mask!2687)))))

(declare-fun b!1457632 () Bool)

(declare-fun res!987310 () Bool)

(assert (=> b!1457632 (=> (not res!987310) (not e!820208))))

(assert (=> b!1457632 (= res!987310 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47605 a!2862) j!93) a!2862 mask!2687) lt!638740))))

(assert (= (and start!125298 res!987309) b!1457614))

(assert (= (and b!1457614 res!987302) b!1457620))

(assert (= (and b!1457620 res!987307) b!1457628))

(assert (= (and b!1457628 res!987304) b!1457613))

(assert (= (and b!1457613 res!987306) b!1457627))

(assert (= (and b!1457627 res!987312) b!1457630))

(assert (= (and b!1457630 res!987314) b!1457619))

(assert (= (and b!1457619 res!987308) b!1457622))

(assert (= (and b!1457622 res!987297) b!1457632))

(assert (= (and b!1457632 res!987310) b!1457611))

(assert (= (and b!1457611 res!987299) b!1457616))

(assert (= (and b!1457616 c!134677) b!1457631))

(assert (= (and b!1457616 (not c!134677)) b!1457623))

(assert (= (and b!1457616 res!987311) b!1457626))

(assert (= (and b!1457626 res!987313) b!1457624))

(assert (= (and b!1457624 res!987305) b!1457617))

(assert (= (and b!1457617 res!987301) b!1457621))

(assert (= (and b!1457624 (not res!987298)) b!1457618))

(assert (= (and b!1457618 (not res!987300)) b!1457625))

(assert (= (and b!1457625 (not res!987303)) b!1457612))

(assert (= (and b!1457612 c!134676) b!1457629))

(assert (= (and b!1457612 (not c!134676)) b!1457615))

(declare-fun m!1345843 () Bool)

(assert (=> b!1457617 m!1345843))

(assert (=> b!1457617 m!1345843))

(declare-fun m!1345845 () Bool)

(assert (=> b!1457617 m!1345845))

(declare-fun m!1345847 () Bool)

(assert (=> b!1457611 m!1345847))

(assert (=> b!1457611 m!1345847))

(declare-fun m!1345849 () Bool)

(assert (=> b!1457611 m!1345849))

(declare-fun m!1345851 () Bool)

(assert (=> b!1457611 m!1345851))

(declare-fun m!1345853 () Bool)

(assert (=> b!1457611 m!1345853))

(declare-fun m!1345855 () Bool)

(assert (=> start!125298 m!1345855))

(declare-fun m!1345857 () Bool)

(assert (=> start!125298 m!1345857))

(assert (=> b!1457632 m!1345843))

(assert (=> b!1457632 m!1345843))

(declare-fun m!1345859 () Bool)

(assert (=> b!1457632 m!1345859))

(declare-fun m!1345861 () Bool)

(assert (=> b!1457615 m!1345861))

(declare-fun m!1345863 () Bool)

(assert (=> b!1457624 m!1345863))

(assert (=> b!1457624 m!1345851))

(declare-fun m!1345865 () Bool)

(assert (=> b!1457624 m!1345865))

(declare-fun m!1345867 () Bool)

(assert (=> b!1457624 m!1345867))

(declare-fun m!1345869 () Bool)

(assert (=> b!1457624 m!1345869))

(assert (=> b!1457624 m!1345843))

(declare-fun m!1345871 () Bool)

(assert (=> b!1457618 m!1345871))

(declare-fun m!1345873 () Bool)

(assert (=> b!1457618 m!1345873))

(declare-fun m!1345875 () Bool)

(assert (=> b!1457618 m!1345875))

(assert (=> b!1457619 m!1345851))

(declare-fun m!1345877 () Bool)

(assert (=> b!1457619 m!1345877))

(declare-fun m!1345879 () Bool)

(assert (=> b!1457629 m!1345879))

(declare-fun m!1345881 () Bool)

(assert (=> b!1457613 m!1345881))

(declare-fun m!1345883 () Bool)

(assert (=> b!1457620 m!1345883))

(assert (=> b!1457620 m!1345883))

(declare-fun m!1345885 () Bool)

(assert (=> b!1457620 m!1345885))

(declare-fun m!1345887 () Bool)

(assert (=> b!1457627 m!1345887))

(assert (=> b!1457628 m!1345843))

(assert (=> b!1457628 m!1345843))

(declare-fun m!1345889 () Bool)

(assert (=> b!1457628 m!1345889))

(assert (=> b!1457621 m!1345851))

(declare-fun m!1345891 () Bool)

(assert (=> b!1457621 m!1345891))

(assert (=> b!1457621 m!1345865))

(assert (=> b!1457621 m!1345867))

(assert (=> b!1457621 m!1345843))

(assert (=> b!1457623 m!1345873))

(assert (=> b!1457623 m!1345875))

(assert (=> b!1457625 m!1345843))

(assert (=> b!1457625 m!1345843))

(declare-fun m!1345893 () Bool)

(assert (=> b!1457625 m!1345893))

(assert (=> b!1457622 m!1345843))

(assert (=> b!1457622 m!1345843))

(declare-fun m!1345895 () Bool)

(assert (=> b!1457622 m!1345895))

(assert (=> b!1457622 m!1345895))

(assert (=> b!1457622 m!1345843))

(declare-fun m!1345897 () Bool)

(assert (=> b!1457622 m!1345897))

(declare-fun m!1345899 () Bool)

(assert (=> b!1457631 m!1345899))

(check-sat (not b!1457620) (not b!1457622) (not b!1457613) (not b!1457631) (not b!1457628) (not b!1457617) (not b!1457623) (not start!125298) (not b!1457625) (not b!1457632) (not b!1457618) (not b!1457629) (not b!1457611) (not b!1457624) (not b!1457627) (not b!1457615))
(check-sat)
