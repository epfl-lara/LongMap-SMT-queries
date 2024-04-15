; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124582 () Bool)

(assert start!124582)

(declare-fun b!1442804 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!633494 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!813098 () Bool)

(declare-datatypes ((array!98008 0))(
  ( (array!98009 (arr!47293 (Array (_ BitVec 32) (_ BitVec 64))) (size!47845 (_ BitVec 32))) )
))
(declare-fun lt!633491 () array!98008)

(declare-datatypes ((SeekEntryResult!11570 0))(
  ( (MissingZero!11570 (index!48672 (_ BitVec 32))) (Found!11570 (index!48673 (_ BitVec 32))) (Intermediate!11570 (undefined!12382 Bool) (index!48674 (_ BitVec 32)) (x!130374 (_ BitVec 32))) (Undefined!11570) (MissingVacant!11570 (index!48675 (_ BitVec 32))) )
))
(declare-fun lt!633492 () SeekEntryResult!11570)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98008 (_ BitVec 32)) SeekEntryResult!11570)

(assert (=> b!1442804 (= e!813098 (= lt!633492 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633494 lt!633491 mask!2687)))))

(declare-fun b!1442805 () Bool)

(declare-fun res!975075 () Bool)

(declare-fun e!813096 () Bool)

(assert (=> b!1442805 (=> (not res!975075) (not e!813096))))

(declare-fun a!2862 () array!98008)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442805 (= res!975075 (validKeyInArray!0 (select (arr!47293 a!2862) j!93)))))

(declare-fun b!1442806 () Bool)

(declare-fun res!975086 () Bool)

(assert (=> b!1442806 (=> (not res!975086) (not e!813096))))

(declare-datatypes ((List!33872 0))(
  ( (Nil!33869) (Cons!33868 (h!35218 (_ BitVec 64)) (t!48558 List!33872)) )
))
(declare-fun arrayNoDuplicates!0 (array!98008 (_ BitVec 32) List!33872) Bool)

(assert (=> b!1442806 (= res!975086 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33869))))

(declare-fun b!1442807 () Bool)

(declare-fun e!813097 () Bool)

(declare-fun e!813094 () Bool)

(assert (=> b!1442807 (= e!813097 e!813094)))

(declare-fun res!975083 () Bool)

(assert (=> b!1442807 (=> (not res!975083) (not e!813094))))

(declare-fun lt!633495 () SeekEntryResult!11570)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442807 (= res!975083 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47293 a!2862) j!93) mask!2687) (select (arr!47293 a!2862) j!93) a!2862 mask!2687) lt!633495))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1442807 (= lt!633495 (Intermediate!11570 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442809 () Bool)

(declare-fun res!975084 () Bool)

(assert (=> b!1442809 (=> (not res!975084) (not e!813096))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1442809 (= res!975084 (validKeyInArray!0 (select (arr!47293 a!2862) i!1006)))))

(declare-fun b!1442810 () Bool)

(declare-fun res!975077 () Bool)

(declare-fun e!813093 () Bool)

(assert (=> b!1442810 (=> (not res!975077) (not e!813093))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98008 (_ BitVec 32)) SeekEntryResult!11570)

(assert (=> b!1442810 (= res!975077 (= (seekEntryOrOpen!0 (select (arr!47293 a!2862) j!93) a!2862 mask!2687) (Found!11570 j!93)))))

(declare-fun b!1442811 () Bool)

(declare-fun res!975078 () Bool)

(assert (=> b!1442811 (=> (not res!975078) (not e!813096))))

(assert (=> b!1442811 (= res!975078 (and (= (size!47845 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47845 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47845 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1442812 () Bool)

(declare-fun res!975076 () Bool)

(assert (=> b!1442812 (=> (not res!975076) (not e!813094))))

(assert (=> b!1442812 (= res!975076 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47293 a!2862) j!93) a!2862 mask!2687) lt!633495))))

(declare-fun b!1442813 () Bool)

(declare-fun res!975079 () Bool)

(assert (=> b!1442813 (=> (not res!975079) (not e!813096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98008 (_ BitVec 32)) Bool)

(assert (=> b!1442813 (= res!975079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442814 () Bool)

(declare-fun res!975081 () Bool)

(declare-fun e!813095 () Bool)

(assert (=> b!1442814 (=> (not res!975081) (not e!813095))))

(assert (=> b!1442814 (= res!975081 e!813098)))

(declare-fun c!133378 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1442814 (= c!133378 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1442815 () Bool)

(assert (=> b!1442815 (= e!813094 e!813095)))

(declare-fun res!975085 () Bool)

(assert (=> b!1442815 (=> (not res!975085) (not e!813095))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1442815 (= res!975085 (= lt!633492 (Intermediate!11570 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1442815 (= lt!633492 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633494 mask!2687) lt!633494 lt!633491 mask!2687))))

(assert (=> b!1442815 (= lt!633494 (select (store (arr!47293 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1442816 () Bool)

(assert (=> b!1442816 (= e!813095 (not true))))

(assert (=> b!1442816 e!813093))

(declare-fun res!975080 () Bool)

(assert (=> b!1442816 (=> (not res!975080) (not e!813093))))

(assert (=> b!1442816 (= res!975080 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48477 0))(
  ( (Unit!48478) )
))
(declare-fun lt!633493 () Unit!48477)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98008 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48477)

(assert (=> b!1442816 (= lt!633493 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1442817 () Bool)

(assert (=> b!1442817 (= e!813096 e!813097)))

(declare-fun res!975074 () Bool)

(assert (=> b!1442817 (=> (not res!975074) (not e!813097))))

(assert (=> b!1442817 (= res!975074 (= (select (store (arr!47293 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442817 (= lt!633491 (array!98009 (store (arr!47293 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47845 a!2862)))))

(declare-fun b!1442818 () Bool)

(assert (=> b!1442818 (= e!813093 (or (= (select (arr!47293 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47293 a!2862) intermediateBeforeIndex!19) (select (arr!47293 a!2862) j!93))))))

(declare-fun b!1442808 () Bool)

(declare-fun res!975082 () Bool)

(assert (=> b!1442808 (=> (not res!975082) (not e!813096))))

(assert (=> b!1442808 (= res!975082 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47845 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47845 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47845 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!975087 () Bool)

(assert (=> start!124582 (=> (not res!975087) (not e!813096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124582 (= res!975087 (validMask!0 mask!2687))))

(assert (=> start!124582 e!813096))

(assert (=> start!124582 true))

(declare-fun array_inv!36526 (array!98008) Bool)

(assert (=> start!124582 (array_inv!36526 a!2862)))

(declare-fun b!1442819 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98008 (_ BitVec 32)) SeekEntryResult!11570)

(assert (=> b!1442819 (= e!813098 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633494 lt!633491 mask!2687) (seekEntryOrOpen!0 lt!633494 lt!633491 mask!2687)))))

(declare-fun b!1442820 () Bool)

(declare-fun res!975088 () Bool)

(assert (=> b!1442820 (=> (not res!975088) (not e!813095))))

(assert (=> b!1442820 (= res!975088 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!124582 res!975087) b!1442811))

(assert (= (and b!1442811 res!975078) b!1442809))

(assert (= (and b!1442809 res!975084) b!1442805))

(assert (= (and b!1442805 res!975075) b!1442813))

(assert (= (and b!1442813 res!975079) b!1442806))

(assert (= (and b!1442806 res!975086) b!1442808))

(assert (= (and b!1442808 res!975082) b!1442817))

(assert (= (and b!1442817 res!975074) b!1442807))

(assert (= (and b!1442807 res!975083) b!1442812))

(assert (= (and b!1442812 res!975076) b!1442815))

(assert (= (and b!1442815 res!975085) b!1442814))

(assert (= (and b!1442814 c!133378) b!1442804))

(assert (= (and b!1442814 (not c!133378)) b!1442819))

(assert (= (and b!1442814 res!975081) b!1442820))

(assert (= (and b!1442820 res!975088) b!1442816))

(assert (= (and b!1442816 res!975080) b!1442810))

(assert (= (and b!1442810 res!975077) b!1442818))

(declare-fun m!1331433 () Bool)

(assert (=> b!1442812 m!1331433))

(assert (=> b!1442812 m!1331433))

(declare-fun m!1331435 () Bool)

(assert (=> b!1442812 m!1331435))

(assert (=> b!1442810 m!1331433))

(assert (=> b!1442810 m!1331433))

(declare-fun m!1331437 () Bool)

(assert (=> b!1442810 m!1331437))

(declare-fun m!1331439 () Bool)

(assert (=> b!1442815 m!1331439))

(assert (=> b!1442815 m!1331439))

(declare-fun m!1331441 () Bool)

(assert (=> b!1442815 m!1331441))

(declare-fun m!1331443 () Bool)

(assert (=> b!1442815 m!1331443))

(declare-fun m!1331445 () Bool)

(assert (=> b!1442815 m!1331445))

(declare-fun m!1331447 () Bool)

(assert (=> b!1442804 m!1331447))

(declare-fun m!1331449 () Bool)

(assert (=> start!124582 m!1331449))

(declare-fun m!1331451 () Bool)

(assert (=> start!124582 m!1331451))

(declare-fun m!1331453 () Bool)

(assert (=> b!1442816 m!1331453))

(declare-fun m!1331455 () Bool)

(assert (=> b!1442816 m!1331455))

(declare-fun m!1331457 () Bool)

(assert (=> b!1442806 m!1331457))

(assert (=> b!1442807 m!1331433))

(assert (=> b!1442807 m!1331433))

(declare-fun m!1331459 () Bool)

(assert (=> b!1442807 m!1331459))

(assert (=> b!1442807 m!1331459))

(assert (=> b!1442807 m!1331433))

(declare-fun m!1331461 () Bool)

(assert (=> b!1442807 m!1331461))

(assert (=> b!1442805 m!1331433))

(assert (=> b!1442805 m!1331433))

(declare-fun m!1331463 () Bool)

(assert (=> b!1442805 m!1331463))

(declare-fun m!1331465 () Bool)

(assert (=> b!1442819 m!1331465))

(declare-fun m!1331467 () Bool)

(assert (=> b!1442819 m!1331467))

(assert (=> b!1442817 m!1331443))

(declare-fun m!1331469 () Bool)

(assert (=> b!1442817 m!1331469))

(declare-fun m!1331471 () Bool)

(assert (=> b!1442818 m!1331471))

(assert (=> b!1442818 m!1331433))

(declare-fun m!1331473 () Bool)

(assert (=> b!1442809 m!1331473))

(assert (=> b!1442809 m!1331473))

(declare-fun m!1331475 () Bool)

(assert (=> b!1442809 m!1331475))

(declare-fun m!1331477 () Bool)

(assert (=> b!1442813 m!1331477))

(check-sat (not b!1442812) (not b!1442809) (not b!1442807) (not b!1442805) (not b!1442815) (not b!1442810) (not b!1442806) (not b!1442813) (not b!1442816) (not b!1442804) (not b!1442819) (not start!124582))
(check-sat)
