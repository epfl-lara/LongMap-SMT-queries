; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126822 () Bool)

(assert start!126822)

(declare-fun e!834461 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!649305 () (_ BitVec 64))

(declare-fun b!1488726 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!99595 0))(
  ( (array!99596 (arr!48069 (Array (_ BitVec 32) (_ BitVec 64))) (size!48619 (_ BitVec 32))) )
))
(declare-fun lt!649299 () array!99595)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12309 0))(
  ( (MissingZero!12309 (index!51628 (_ BitVec 32))) (Found!12309 (index!51629 (_ BitVec 32))) (Intermediate!12309 (undefined!13121 Bool) (index!51630 (_ BitVec 32)) (x!133229 (_ BitVec 32))) (Undefined!12309) (MissingVacant!12309 (index!51631 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99595 (_ BitVec 32)) SeekEntryResult!12309)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99595 (_ BitVec 32)) SeekEntryResult!12309)

(assert (=> b!1488726 (= e!834461 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649305 lt!649299 mask!2687) (seekEntryOrOpen!0 lt!649305 lt!649299 mask!2687)))))

(declare-fun b!1488727 () Bool)

(declare-fun res!1012313 () Bool)

(declare-fun e!834456 () Bool)

(assert (=> b!1488727 (=> (not res!1012313) (not e!834456))))

(assert (=> b!1488727 (= res!1012313 e!834461)))

(declare-fun c!137742 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1488727 (= c!137742 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1488728 () Bool)

(declare-fun lt!649300 () SeekEntryResult!12309)

(declare-fun e!834464 () Bool)

(declare-fun lt!649304 () (_ BitVec 32))

(assert (=> b!1488728 (= e!834464 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649304 intermediateAfterIndex!19 lt!649305 lt!649299 mask!2687) lt!649300)))))

(declare-fun b!1488729 () Bool)

(declare-fun e!834463 () Bool)

(declare-fun e!834460 () Bool)

(assert (=> b!1488729 (= e!834463 e!834460)))

(declare-fun res!1012314 () Bool)

(assert (=> b!1488729 (=> (not res!1012314) (not e!834460))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99595)

(assert (=> b!1488729 (= res!1012314 (= (select (store (arr!48069 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488729 (= lt!649299 (array!99596 (store (arr!48069 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48619 a!2862)))))

(declare-fun b!1488730 () Bool)

(declare-fun res!1012297 () Bool)

(assert (=> b!1488730 (=> (not res!1012297) (not e!834463))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1488730 (= res!1012297 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48619 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48619 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48619 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1488731 () Bool)

(declare-fun res!1012302 () Bool)

(assert (=> b!1488731 (=> (not res!1012302) (not e!834463))))

(declare-datatypes ((List!34570 0))(
  ( (Nil!34567) (Cons!34566 (h!35949 (_ BitVec 64)) (t!49264 List!34570)) )
))
(declare-fun arrayNoDuplicates!0 (array!99595 (_ BitVec 32) List!34570) Bool)

(assert (=> b!1488731 (= res!1012302 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34567))))

(declare-fun b!1488732 () Bool)

(declare-fun res!1012301 () Bool)

(assert (=> b!1488732 (=> (not res!1012301) (not e!834463))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99595 (_ BitVec 32)) Bool)

(assert (=> b!1488732 (= res!1012301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1488733 () Bool)

(declare-fun e!834457 () Bool)

(assert (=> b!1488733 (= e!834457 e!834456)))

(declare-fun res!1012303 () Bool)

(assert (=> b!1488733 (=> (not res!1012303) (not e!834456))))

(declare-fun lt!649302 () SeekEntryResult!12309)

(assert (=> b!1488733 (= res!1012303 (= lt!649302 (Intermediate!12309 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99595 (_ BitVec 32)) SeekEntryResult!12309)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488733 (= lt!649302 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649305 mask!2687) lt!649305 lt!649299 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1488733 (= lt!649305 (select (store (arr!48069 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1488734 () Bool)

(assert (=> b!1488734 (= e!834461 (= lt!649302 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649305 lt!649299 mask!2687)))))

(declare-fun b!1488735 () Bool)

(declare-fun res!1012307 () Bool)

(declare-fun e!834458 () Bool)

(assert (=> b!1488735 (=> res!1012307 e!834458)))

(declare-fun lt!649301 () SeekEntryResult!12309)

(assert (=> b!1488735 (= res!1012307 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649304 (select (arr!48069 a!2862) j!93) a!2862 mask!2687) lt!649301)))))

(declare-fun b!1488736 () Bool)

(declare-fun e!834455 () Bool)

(assert (=> b!1488736 (= e!834455 e!834458)))

(declare-fun res!1012312 () Bool)

(assert (=> b!1488736 (=> res!1012312 e!834458)))

(assert (=> b!1488736 (= res!1012312 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649304 #b00000000000000000000000000000000) (bvsge lt!649304 (size!48619 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488736 (= lt!649304 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1488736 (= lt!649300 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649305 lt!649299 mask!2687))))

(assert (=> b!1488736 (= lt!649300 (seekEntryOrOpen!0 lt!649305 lt!649299 mask!2687))))

(declare-fun b!1488737 () Bool)

(declare-fun res!1012305 () Bool)

(assert (=> b!1488737 (=> (not res!1012305) (not e!834463))))

(assert (=> b!1488737 (= res!1012305 (and (= (size!48619 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48619 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48619 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1488738 () Bool)

(declare-fun res!1012306 () Bool)

(assert (=> b!1488738 (=> (not res!1012306) (not e!834463))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1488738 (= res!1012306 (validKeyInArray!0 (select (arr!48069 a!2862) i!1006)))))

(declare-fun res!1012298 () Bool)

(assert (=> start!126822 (=> (not res!1012298) (not e!834463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126822 (= res!1012298 (validMask!0 mask!2687))))

(assert (=> start!126822 e!834463))

(assert (=> start!126822 true))

(declare-fun array_inv!37097 (array!99595) Bool)

(assert (=> start!126822 (array_inv!37097 a!2862)))

(declare-fun b!1488725 () Bool)

(declare-fun res!1012304 () Bool)

(declare-fun e!834462 () Bool)

(assert (=> b!1488725 (=> (not res!1012304) (not e!834462))))

(assert (=> b!1488725 (= res!1012304 (= (seekEntryOrOpen!0 (select (arr!48069 a!2862) j!93) a!2862 mask!2687) (Found!12309 j!93)))))

(declare-fun b!1488739 () Bool)

(assert (=> b!1488739 (= e!834462 (and (or (= (select (arr!48069 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48069 a!2862) intermediateBeforeIndex!19) (select (arr!48069 a!2862) j!93))) (let ((bdg!54656 (select (store (arr!48069 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48069 a!2862) index!646) bdg!54656) (= (select (arr!48069 a!2862) index!646) (select (arr!48069 a!2862) j!93))) (= (select (arr!48069 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54656 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1488740 () Bool)

(declare-fun res!1012309 () Bool)

(assert (=> b!1488740 (=> (not res!1012309) (not e!834456))))

(assert (=> b!1488740 (= res!1012309 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1488741 () Bool)

(assert (=> b!1488741 (= e!834456 (not e!834455))))

(declare-fun res!1012299 () Bool)

(assert (=> b!1488741 (=> res!1012299 e!834455)))

(assert (=> b!1488741 (= res!1012299 (or (and (= (select (arr!48069 a!2862) index!646) (select (store (arr!48069 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48069 a!2862) index!646) (select (arr!48069 a!2862) j!93))) (= (select (arr!48069 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1488741 e!834462))

(declare-fun res!1012315 () Bool)

(assert (=> b!1488741 (=> (not res!1012315) (not e!834462))))

(assert (=> b!1488741 (= res!1012315 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49958 0))(
  ( (Unit!49959) )
))
(declare-fun lt!649303 () Unit!49958)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99595 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49958)

(assert (=> b!1488741 (= lt!649303 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1488742 () Bool)

(assert (=> b!1488742 (= e!834458 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1488743 () Bool)

(assert (=> b!1488743 (= e!834460 e!834457)))

(declare-fun res!1012310 () Bool)

(assert (=> b!1488743 (=> (not res!1012310) (not e!834457))))

(assert (=> b!1488743 (= res!1012310 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48069 a!2862) j!93) mask!2687) (select (arr!48069 a!2862) j!93) a!2862 mask!2687) lt!649301))))

(assert (=> b!1488743 (= lt!649301 (Intermediate!12309 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1488744 () Bool)

(declare-fun res!1012308 () Bool)

(assert (=> b!1488744 (=> (not res!1012308) (not e!834457))))

(assert (=> b!1488744 (= res!1012308 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48069 a!2862) j!93) a!2862 mask!2687) lt!649301))))

(declare-fun b!1488745 () Bool)

(assert (=> b!1488745 (= e!834464 (not (= lt!649302 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649304 lt!649305 lt!649299 mask!2687))))))

(declare-fun b!1488746 () Bool)

(declare-fun res!1012311 () Bool)

(assert (=> b!1488746 (=> (not res!1012311) (not e!834463))))

(assert (=> b!1488746 (= res!1012311 (validKeyInArray!0 (select (arr!48069 a!2862) j!93)))))

(declare-fun b!1488747 () Bool)

(declare-fun res!1012300 () Bool)

(assert (=> b!1488747 (=> res!1012300 e!834458)))

(assert (=> b!1488747 (= res!1012300 e!834464)))

(declare-fun c!137741 () Bool)

(assert (=> b!1488747 (= c!137741 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(assert (= (and start!126822 res!1012298) b!1488737))

(assert (= (and b!1488737 res!1012305) b!1488738))

(assert (= (and b!1488738 res!1012306) b!1488746))

(assert (= (and b!1488746 res!1012311) b!1488732))

(assert (= (and b!1488732 res!1012301) b!1488731))

(assert (= (and b!1488731 res!1012302) b!1488730))

(assert (= (and b!1488730 res!1012297) b!1488729))

(assert (= (and b!1488729 res!1012314) b!1488743))

(assert (= (and b!1488743 res!1012310) b!1488744))

(assert (= (and b!1488744 res!1012308) b!1488733))

(assert (= (and b!1488733 res!1012303) b!1488727))

(assert (= (and b!1488727 c!137742) b!1488734))

(assert (= (and b!1488727 (not c!137742)) b!1488726))

(assert (= (and b!1488727 res!1012313) b!1488740))

(assert (= (and b!1488740 res!1012309) b!1488741))

(assert (= (and b!1488741 res!1012315) b!1488725))

(assert (= (and b!1488725 res!1012304) b!1488739))

(assert (= (and b!1488741 (not res!1012299)) b!1488736))

(assert (= (and b!1488736 (not res!1012312)) b!1488735))

(assert (= (and b!1488735 (not res!1012307)) b!1488747))

(assert (= (and b!1488747 c!137741) b!1488745))

(assert (= (and b!1488747 (not c!137741)) b!1488728))

(assert (= (and b!1488747 (not res!1012300)) b!1488742))

(declare-fun m!1373051 () Bool)

(assert (=> b!1488739 m!1373051))

(declare-fun m!1373053 () Bool)

(assert (=> b!1488739 m!1373053))

(declare-fun m!1373055 () Bool)

(assert (=> b!1488739 m!1373055))

(declare-fun m!1373057 () Bool)

(assert (=> b!1488739 m!1373057))

(declare-fun m!1373059 () Bool)

(assert (=> b!1488739 m!1373059))

(assert (=> b!1488729 m!1373051))

(declare-fun m!1373061 () Bool)

(assert (=> b!1488729 m!1373061))

(declare-fun m!1373063 () Bool)

(assert (=> b!1488733 m!1373063))

(assert (=> b!1488733 m!1373063))

(declare-fun m!1373065 () Bool)

(assert (=> b!1488733 m!1373065))

(assert (=> b!1488733 m!1373051))

(declare-fun m!1373067 () Bool)

(assert (=> b!1488733 m!1373067))

(assert (=> b!1488746 m!1373059))

(assert (=> b!1488746 m!1373059))

(declare-fun m!1373069 () Bool)

(assert (=> b!1488746 m!1373069))

(declare-fun m!1373071 () Bool)

(assert (=> b!1488736 m!1373071))

(declare-fun m!1373073 () Bool)

(assert (=> b!1488736 m!1373073))

(declare-fun m!1373075 () Bool)

(assert (=> b!1488736 m!1373075))

(assert (=> b!1488744 m!1373059))

(assert (=> b!1488744 m!1373059))

(declare-fun m!1373077 () Bool)

(assert (=> b!1488744 m!1373077))

(declare-fun m!1373079 () Bool)

(assert (=> b!1488731 m!1373079))

(declare-fun m!1373081 () Bool)

(assert (=> b!1488741 m!1373081))

(assert (=> b!1488741 m!1373051))

(assert (=> b!1488741 m!1373055))

(assert (=> b!1488741 m!1373057))

(declare-fun m!1373083 () Bool)

(assert (=> b!1488741 m!1373083))

(assert (=> b!1488741 m!1373059))

(declare-fun m!1373085 () Bool)

(assert (=> start!126822 m!1373085))

(declare-fun m!1373087 () Bool)

(assert (=> start!126822 m!1373087))

(declare-fun m!1373089 () Bool)

(assert (=> b!1488745 m!1373089))

(declare-fun m!1373091 () Bool)

(assert (=> b!1488728 m!1373091))

(assert (=> b!1488743 m!1373059))

(assert (=> b!1488743 m!1373059))

(declare-fun m!1373093 () Bool)

(assert (=> b!1488743 m!1373093))

(assert (=> b!1488743 m!1373093))

(assert (=> b!1488743 m!1373059))

(declare-fun m!1373095 () Bool)

(assert (=> b!1488743 m!1373095))

(declare-fun m!1373097 () Bool)

(assert (=> b!1488732 m!1373097))

(assert (=> b!1488735 m!1373059))

(assert (=> b!1488735 m!1373059))

(declare-fun m!1373099 () Bool)

(assert (=> b!1488735 m!1373099))

(declare-fun m!1373101 () Bool)

(assert (=> b!1488738 m!1373101))

(assert (=> b!1488738 m!1373101))

(declare-fun m!1373103 () Bool)

(assert (=> b!1488738 m!1373103))

(declare-fun m!1373105 () Bool)

(assert (=> b!1488734 m!1373105))

(assert (=> b!1488726 m!1373073))

(assert (=> b!1488726 m!1373075))

(assert (=> b!1488725 m!1373059))

(assert (=> b!1488725 m!1373059))

(declare-fun m!1373107 () Bool)

(assert (=> b!1488725 m!1373107))

(check-sat (not b!1488736) (not b!1488731) (not b!1488743) (not b!1488746) (not b!1488738) (not b!1488734) (not b!1488728) (not start!126822) (not b!1488744) (not b!1488732) (not b!1488725) (not b!1488733) (not b!1488741) (not b!1488726) (not b!1488735) (not b!1488745))
(check-sat)
