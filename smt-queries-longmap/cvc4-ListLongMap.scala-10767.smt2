; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125924 () Bool)

(assert start!125924)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!99201 0))(
  ( (array!99202 (arr!47884 (Array (_ BitVec 32) (_ BitVec 64))) (size!48434 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99201)

(declare-fun e!827350 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun b!1474619 () Bool)

(assert (=> b!1474619 (= e!827350 (or (= (select (arr!47884 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47884 a!2862) intermediateBeforeIndex!19) (select (arr!47884 a!2862) j!93))))))

(declare-fun b!1474620 () Bool)

(declare-fun res!1001812 () Bool)

(declare-fun e!827351 () Bool)

(assert (=> b!1474620 (=> (not res!1001812) (not e!827351))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99201 (_ BitVec 32)) Bool)

(assert (=> b!1474620 (= res!1001812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!1001802 () Bool)

(assert (=> start!125924 (=> (not res!1001802) (not e!827351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125924 (= res!1001802 (validMask!0 mask!2687))))

(assert (=> start!125924 e!827351))

(assert (=> start!125924 true))

(declare-fun array_inv!36912 (array!99201) Bool)

(assert (=> start!125924 (array_inv!36912 a!2862)))

(declare-fun b!1474621 () Bool)

(declare-fun res!1001806 () Bool)

(declare-fun e!827347 () Bool)

(assert (=> b!1474621 (=> (not res!1001806) (not e!827347))))

(declare-datatypes ((SeekEntryResult!12124 0))(
  ( (MissingZero!12124 (index!50888 (_ BitVec 32))) (Found!12124 (index!50889 (_ BitVec 32))) (Intermediate!12124 (undefined!12936 Bool) (index!50890 (_ BitVec 32)) (x!132464 (_ BitVec 32))) (Undefined!12124) (MissingVacant!12124 (index!50891 (_ BitVec 32))) )
))
(declare-fun lt!644304 () SeekEntryResult!12124)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99201 (_ BitVec 32)) SeekEntryResult!12124)

(assert (=> b!1474621 (= res!1001806 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47884 a!2862) j!93) a!2862 mask!2687) lt!644304))))

(declare-fun b!1474622 () Bool)

(declare-fun e!827349 () Bool)

(assert (=> b!1474622 (= e!827351 e!827349)))

(declare-fun res!1001815 () Bool)

(assert (=> b!1474622 (=> (not res!1001815) (not e!827349))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1474622 (= res!1001815 (= (select (store (arr!47884 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!644303 () array!99201)

(assert (=> b!1474622 (= lt!644303 (array!99202 (store (arr!47884 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48434 a!2862)))))

(declare-fun b!1474623 () Bool)

(declare-fun e!827345 () Bool)

(assert (=> b!1474623 (= e!827345 (not true))))

(assert (=> b!1474623 e!827350))

(declare-fun res!1001814 () Bool)

(assert (=> b!1474623 (=> (not res!1001814) (not e!827350))))

(assert (=> b!1474623 (= res!1001814 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49588 0))(
  ( (Unit!49589) )
))
(declare-fun lt!644307 () Unit!49588)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99201 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49588)

(assert (=> b!1474623 (= lt!644307 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1474624 () Bool)

(declare-fun res!1001804 () Bool)

(assert (=> b!1474624 (=> (not res!1001804) (not e!827345))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1474624 (= res!1001804 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1474625 () Bool)

(declare-fun res!1001805 () Bool)

(assert (=> b!1474625 (=> (not res!1001805) (not e!827351))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1474625 (= res!1001805 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48434 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48434 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48434 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1474626 () Bool)

(declare-fun res!1001807 () Bool)

(assert (=> b!1474626 (=> (not res!1001807) (not e!827351))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1474626 (= res!1001807 (validKeyInArray!0 (select (arr!47884 a!2862) i!1006)))))

(declare-fun b!1474627 () Bool)

(declare-fun res!1001813 () Bool)

(assert (=> b!1474627 (=> (not res!1001813) (not e!827351))))

(assert (=> b!1474627 (= res!1001813 (and (= (size!48434 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48434 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48434 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1474628 () Bool)

(declare-fun res!1001810 () Bool)

(assert (=> b!1474628 (=> (not res!1001810) (not e!827351))))

(assert (=> b!1474628 (= res!1001810 (validKeyInArray!0 (select (arr!47884 a!2862) j!93)))))

(declare-fun b!1474629 () Bool)

(declare-fun res!1001811 () Bool)

(assert (=> b!1474629 (=> (not res!1001811) (not e!827350))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99201 (_ BitVec 32)) SeekEntryResult!12124)

(assert (=> b!1474629 (= res!1001811 (= (seekEntryOrOpen!0 (select (arr!47884 a!2862) j!93) a!2862 mask!2687) (Found!12124 j!93)))))

(declare-fun b!1474630 () Bool)

(declare-fun res!1001803 () Bool)

(assert (=> b!1474630 (=> (not res!1001803) (not e!827351))))

(declare-datatypes ((List!34385 0))(
  ( (Nil!34382) (Cons!34381 (h!35740 (_ BitVec 64)) (t!49079 List!34385)) )
))
(declare-fun arrayNoDuplicates!0 (array!99201 (_ BitVec 32) List!34385) Bool)

(assert (=> b!1474630 (= res!1001803 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34382))))

(declare-fun b!1474631 () Bool)

(assert (=> b!1474631 (= e!827347 e!827345)))

(declare-fun res!1001801 () Bool)

(assert (=> b!1474631 (=> (not res!1001801) (not e!827345))))

(declare-fun lt!644305 () SeekEntryResult!12124)

(assert (=> b!1474631 (= res!1001801 (= lt!644305 (Intermediate!12124 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!644306 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474631 (= lt!644305 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644306 mask!2687) lt!644306 lt!644303 mask!2687))))

(assert (=> b!1474631 (= lt!644306 (select (store (arr!47884 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1474632 () Bool)

(declare-fun e!827348 () Bool)

(assert (=> b!1474632 (= e!827348 (= lt!644305 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644306 lt!644303 mask!2687)))))

(declare-fun b!1474633 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99201 (_ BitVec 32)) SeekEntryResult!12124)

(assert (=> b!1474633 (= e!827348 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644306 lt!644303 mask!2687) (seekEntryOrOpen!0 lt!644306 lt!644303 mask!2687)))))

(declare-fun b!1474634 () Bool)

(assert (=> b!1474634 (= e!827349 e!827347)))

(declare-fun res!1001808 () Bool)

(assert (=> b!1474634 (=> (not res!1001808) (not e!827347))))

(assert (=> b!1474634 (= res!1001808 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47884 a!2862) j!93) mask!2687) (select (arr!47884 a!2862) j!93) a!2862 mask!2687) lt!644304))))

(assert (=> b!1474634 (= lt!644304 (Intermediate!12124 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1474635 () Bool)

(declare-fun res!1001809 () Bool)

(assert (=> b!1474635 (=> (not res!1001809) (not e!827345))))

(assert (=> b!1474635 (= res!1001809 e!827348)))

(declare-fun c!135924 () Bool)

(assert (=> b!1474635 (= c!135924 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125924 res!1001802) b!1474627))

(assert (= (and b!1474627 res!1001813) b!1474626))

(assert (= (and b!1474626 res!1001807) b!1474628))

(assert (= (and b!1474628 res!1001810) b!1474620))

(assert (= (and b!1474620 res!1001812) b!1474630))

(assert (= (and b!1474630 res!1001803) b!1474625))

(assert (= (and b!1474625 res!1001805) b!1474622))

(assert (= (and b!1474622 res!1001815) b!1474634))

(assert (= (and b!1474634 res!1001808) b!1474621))

(assert (= (and b!1474621 res!1001806) b!1474631))

(assert (= (and b!1474631 res!1001801) b!1474635))

(assert (= (and b!1474635 c!135924) b!1474632))

(assert (= (and b!1474635 (not c!135924)) b!1474633))

(assert (= (and b!1474635 res!1001809) b!1474624))

(assert (= (and b!1474624 res!1001804) b!1474623))

(assert (= (and b!1474623 res!1001814) b!1474629))

(assert (= (and b!1474629 res!1001811) b!1474619))

(declare-fun m!1361049 () Bool)

(assert (=> start!125924 m!1361049))

(declare-fun m!1361051 () Bool)

(assert (=> start!125924 m!1361051))

(declare-fun m!1361053 () Bool)

(assert (=> b!1474623 m!1361053))

(declare-fun m!1361055 () Bool)

(assert (=> b!1474623 m!1361055))

(declare-fun m!1361057 () Bool)

(assert (=> b!1474630 m!1361057))

(declare-fun m!1361059 () Bool)

(assert (=> b!1474628 m!1361059))

(assert (=> b!1474628 m!1361059))

(declare-fun m!1361061 () Bool)

(assert (=> b!1474628 m!1361061))

(declare-fun m!1361063 () Bool)

(assert (=> b!1474626 m!1361063))

(assert (=> b!1474626 m!1361063))

(declare-fun m!1361065 () Bool)

(assert (=> b!1474626 m!1361065))

(declare-fun m!1361067 () Bool)

(assert (=> b!1474620 m!1361067))

(assert (=> b!1474634 m!1361059))

(assert (=> b!1474634 m!1361059))

(declare-fun m!1361069 () Bool)

(assert (=> b!1474634 m!1361069))

(assert (=> b!1474634 m!1361069))

(assert (=> b!1474634 m!1361059))

(declare-fun m!1361071 () Bool)

(assert (=> b!1474634 m!1361071))

(assert (=> b!1474621 m!1361059))

(assert (=> b!1474621 m!1361059))

(declare-fun m!1361073 () Bool)

(assert (=> b!1474621 m!1361073))

(declare-fun m!1361075 () Bool)

(assert (=> b!1474631 m!1361075))

(assert (=> b!1474631 m!1361075))

(declare-fun m!1361077 () Bool)

(assert (=> b!1474631 m!1361077))

(declare-fun m!1361079 () Bool)

(assert (=> b!1474631 m!1361079))

(declare-fun m!1361081 () Bool)

(assert (=> b!1474631 m!1361081))

(assert (=> b!1474622 m!1361079))

(declare-fun m!1361083 () Bool)

(assert (=> b!1474622 m!1361083))

(assert (=> b!1474629 m!1361059))

(assert (=> b!1474629 m!1361059))

(declare-fun m!1361085 () Bool)

(assert (=> b!1474629 m!1361085))

(declare-fun m!1361087 () Bool)

(assert (=> b!1474619 m!1361087))

(assert (=> b!1474619 m!1361059))

(declare-fun m!1361089 () Bool)

(assert (=> b!1474633 m!1361089))

(declare-fun m!1361091 () Bool)

(assert (=> b!1474633 m!1361091))

(declare-fun m!1361093 () Bool)

(assert (=> b!1474632 m!1361093))

(push 1)

