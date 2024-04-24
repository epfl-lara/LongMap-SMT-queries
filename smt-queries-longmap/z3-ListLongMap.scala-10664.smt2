; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125340 () Bool)

(assert start!125340)

(declare-fun b!1458997 () Bool)

(declare-fun e!820838 () Bool)

(declare-fun e!820830 () Bool)

(assert (=> b!1458997 (= e!820838 e!820830)))

(declare-fun res!988435 () Bool)

(assert (=> b!1458997 (=> (not res!988435) (not e!820830))))

(declare-datatypes ((SeekEntryResult!11775 0))(
  ( (MissingZero!11775 (index!49492 (_ BitVec 32))) (Found!11775 (index!49493 (_ BitVec 32))) (Intermediate!11775 (undefined!12587 Bool) (index!49494 (_ BitVec 32)) (x!131288 (_ BitVec 32))) (Undefined!11775) (MissingVacant!11775 (index!49495 (_ BitVec 32))) )
))
(declare-fun lt!639241 () SeekEntryResult!11775)

(declare-datatypes ((array!98683 0))(
  ( (array!98684 (arr!47626 (Array (_ BitVec 32) (_ BitVec 64))) (size!48177 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98683)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98683 (_ BitVec 32)) SeekEntryResult!11775)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458997 (= res!988435 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47626 a!2862) j!93) mask!2687) (select (arr!47626 a!2862) j!93) a!2862 mask!2687) lt!639241))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1458997 (= lt!639241 (Intermediate!11775 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!639240 () (_ BitVec 32))

(declare-fun lt!639244 () (_ BitVec 64))

(declare-fun lt!639246 () SeekEntryResult!11775)

(declare-fun e!820835 () Bool)

(declare-fun b!1458998 () Bool)

(declare-fun lt!639245 () array!98683)

(assert (=> b!1458998 (= e!820835 (not (= lt!639246 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639240 lt!639244 lt!639245 mask!2687))))))

(declare-fun b!1458999 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!639242 () SeekEntryResult!11775)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98683 (_ BitVec 32)) SeekEntryResult!11775)

(assert (=> b!1458999 (= e!820835 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639240 intermediateAfterIndex!19 lt!639244 lt!639245 mask!2687) lt!639242)))))

(declare-fun b!1459000 () Bool)

(declare-fun res!988446 () Bool)

(declare-fun e!820834 () Bool)

(assert (=> b!1459000 (=> (not res!988446) (not e!820834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98683 (_ BitVec 32)) Bool)

(assert (=> b!1459000 (= res!988446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!988443 () Bool)

(assert (=> start!125340 (=> (not res!988443) (not e!820834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125340 (= res!988443 (validMask!0 mask!2687))))

(assert (=> start!125340 e!820834))

(assert (=> start!125340 true))

(declare-fun array_inv!36907 (array!98683) Bool)

(assert (=> start!125340 (array_inv!36907 a!2862)))

(declare-fun e!820833 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1459001 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98683 (_ BitVec 32)) SeekEntryResult!11775)

(assert (=> b!1459001 (= e!820833 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639244 lt!639245 mask!2687) (seekEntryOrOpen!0 lt!639244 lt!639245 mask!2687)))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun b!1459002 () Bool)

(declare-fun e!820832 () Bool)

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1459002 (= e!820832 (and (or (= (select (arr!47626 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47626 a!2862) intermediateBeforeIndex!19) (select (arr!47626 a!2862) j!93))) (let ((bdg!53360 (select (store (arr!47626 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47626 a!2862) index!646) bdg!53360) (= (select (arr!47626 a!2862) index!646) (select (arr!47626 a!2862) j!93))) (= (select (arr!47626 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53360 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1459003 () Bool)

(declare-fun e!820836 () Bool)

(assert (=> b!1459003 (= e!820830 e!820836)))

(declare-fun res!988447 () Bool)

(assert (=> b!1459003 (=> (not res!988447) (not e!820836))))

(assert (=> b!1459003 (= res!988447 (= lt!639246 (Intermediate!11775 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1459003 (= lt!639246 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639244 mask!2687) lt!639244 lt!639245 mask!2687))))

(assert (=> b!1459003 (= lt!639244 (select (store (arr!47626 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1459004 () Bool)

(declare-fun e!820839 () Bool)

(assert (=> b!1459004 (= e!820836 (not e!820839))))

(declare-fun res!988431 () Bool)

(assert (=> b!1459004 (=> res!988431 e!820839)))

(assert (=> b!1459004 (= res!988431 (or (and (= (select (arr!47626 a!2862) index!646) (select (store (arr!47626 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47626 a!2862) index!646) (select (arr!47626 a!2862) j!93))) (= (select (arr!47626 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1459004 e!820832))

(declare-fun res!988441 () Bool)

(assert (=> b!1459004 (=> (not res!988441) (not e!820832))))

(assert (=> b!1459004 (= res!988441 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49079 0))(
  ( (Unit!49080) )
))
(declare-fun lt!639243 () Unit!49079)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98683 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49079)

(assert (=> b!1459004 (= lt!639243 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1459005 () Bool)

(declare-fun res!988442 () Bool)

(assert (=> b!1459005 (=> (not res!988442) (not e!820836))))

(assert (=> b!1459005 (= res!988442 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1459006 () Bool)

(assert (=> b!1459006 (= e!820834 e!820838)))

(declare-fun res!988438 () Bool)

(assert (=> b!1459006 (=> (not res!988438) (not e!820838))))

(assert (=> b!1459006 (= res!988438 (= (select (store (arr!47626 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1459006 (= lt!639245 (array!98684 (store (arr!47626 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48177 a!2862)))))

(declare-fun b!1459007 () Bool)

(declare-fun e!820831 () Bool)

(assert (=> b!1459007 (= e!820831 true)))

(declare-fun lt!639247 () Bool)

(assert (=> b!1459007 (= lt!639247 e!820835)))

(declare-fun c!134802 () Bool)

(assert (=> b!1459007 (= c!134802 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1459008 () Bool)

(declare-fun res!988434 () Bool)

(assert (=> b!1459008 (=> (not res!988434) (not e!820834))))

(assert (=> b!1459008 (= res!988434 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48177 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48177 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48177 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1459009 () Bool)

(assert (=> b!1459009 (= e!820839 e!820831)))

(declare-fun res!988436 () Bool)

(assert (=> b!1459009 (=> res!988436 e!820831)))

(assert (=> b!1459009 (= res!988436 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639240 #b00000000000000000000000000000000) (bvsge lt!639240 (size!48177 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459009 (= lt!639240 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> b!1459009 (= lt!639242 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639244 lt!639245 mask!2687))))

(assert (=> b!1459009 (= lt!639242 (seekEntryOrOpen!0 lt!639244 lt!639245 mask!2687))))

(declare-fun b!1459010 () Bool)

(assert (=> b!1459010 (= e!820833 (= lt!639246 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639244 lt!639245 mask!2687)))))

(declare-fun b!1459011 () Bool)

(declare-fun res!988440 () Bool)

(assert (=> b!1459011 (=> (not res!988440) (not e!820834))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1459011 (= res!988440 (validKeyInArray!0 (select (arr!47626 a!2862) i!1006)))))

(declare-fun b!1459012 () Bool)

(declare-fun res!988448 () Bool)

(assert (=> b!1459012 (=> (not res!988448) (not e!820834))))

(declare-datatypes ((List!34114 0))(
  ( (Nil!34111) (Cons!34110 (h!35471 (_ BitVec 64)) (t!48800 List!34114)) )
))
(declare-fun arrayNoDuplicates!0 (array!98683 (_ BitVec 32) List!34114) Bool)

(assert (=> b!1459012 (= res!988448 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34111))))

(declare-fun b!1459013 () Bool)

(declare-fun res!988433 () Bool)

(assert (=> b!1459013 (=> (not res!988433) (not e!820832))))

(assert (=> b!1459013 (= res!988433 (= (seekEntryOrOpen!0 (select (arr!47626 a!2862) j!93) a!2862 mask!2687) (Found!11775 j!93)))))

(declare-fun b!1459014 () Bool)

(declare-fun res!988445 () Bool)

(assert (=> b!1459014 (=> (not res!988445) (not e!820830))))

(assert (=> b!1459014 (= res!988445 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47626 a!2862) j!93) a!2862 mask!2687) lt!639241))))

(declare-fun b!1459015 () Bool)

(declare-fun res!988437 () Bool)

(assert (=> b!1459015 (=> res!988437 e!820831)))

(assert (=> b!1459015 (= res!988437 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639240 (select (arr!47626 a!2862) j!93) a!2862 mask!2687) lt!639241)))))

(declare-fun b!1459016 () Bool)

(declare-fun res!988444 () Bool)

(assert (=> b!1459016 (=> (not res!988444) (not e!820834))))

(assert (=> b!1459016 (= res!988444 (and (= (size!48177 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48177 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48177 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1459017 () Bool)

(declare-fun res!988439 () Bool)

(assert (=> b!1459017 (=> (not res!988439) (not e!820836))))

(assert (=> b!1459017 (= res!988439 e!820833)))

(declare-fun c!134803 () Bool)

(assert (=> b!1459017 (= c!134803 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1459018 () Bool)

(declare-fun res!988432 () Bool)

(assert (=> b!1459018 (=> (not res!988432) (not e!820834))))

(assert (=> b!1459018 (= res!988432 (validKeyInArray!0 (select (arr!47626 a!2862) j!93)))))

(assert (= (and start!125340 res!988443) b!1459016))

(assert (= (and b!1459016 res!988444) b!1459011))

(assert (= (and b!1459011 res!988440) b!1459018))

(assert (= (and b!1459018 res!988432) b!1459000))

(assert (= (and b!1459000 res!988446) b!1459012))

(assert (= (and b!1459012 res!988448) b!1459008))

(assert (= (and b!1459008 res!988434) b!1459006))

(assert (= (and b!1459006 res!988438) b!1458997))

(assert (= (and b!1458997 res!988435) b!1459014))

(assert (= (and b!1459014 res!988445) b!1459003))

(assert (= (and b!1459003 res!988447) b!1459017))

(assert (= (and b!1459017 c!134803) b!1459010))

(assert (= (and b!1459017 (not c!134803)) b!1459001))

(assert (= (and b!1459017 res!988439) b!1459005))

(assert (= (and b!1459005 res!988442) b!1459004))

(assert (= (and b!1459004 res!988441) b!1459013))

(assert (= (and b!1459013 res!988433) b!1459002))

(assert (= (and b!1459004 (not res!988431)) b!1459009))

(assert (= (and b!1459009 (not res!988436)) b!1459015))

(assert (= (and b!1459015 (not res!988437)) b!1459007))

(assert (= (and b!1459007 c!134802) b!1458998))

(assert (= (and b!1459007 (not c!134802)) b!1458999))

(declare-fun m!1347061 () Bool)

(assert (=> b!1459018 m!1347061))

(assert (=> b!1459018 m!1347061))

(declare-fun m!1347063 () Bool)

(assert (=> b!1459018 m!1347063))

(declare-fun m!1347065 () Bool)

(assert (=> b!1458999 m!1347065))

(declare-fun m!1347067 () Bool)

(assert (=> b!1459006 m!1347067))

(declare-fun m!1347069 () Bool)

(assert (=> b!1459006 m!1347069))

(declare-fun m!1347071 () Bool)

(assert (=> b!1459003 m!1347071))

(assert (=> b!1459003 m!1347071))

(declare-fun m!1347073 () Bool)

(assert (=> b!1459003 m!1347073))

(assert (=> b!1459003 m!1347067))

(declare-fun m!1347075 () Bool)

(assert (=> b!1459003 m!1347075))

(declare-fun m!1347077 () Bool)

(assert (=> b!1459010 m!1347077))

(assert (=> b!1459014 m!1347061))

(assert (=> b!1459014 m!1347061))

(declare-fun m!1347079 () Bool)

(assert (=> b!1459014 m!1347079))

(assert (=> b!1458997 m!1347061))

(assert (=> b!1458997 m!1347061))

(declare-fun m!1347081 () Bool)

(assert (=> b!1458997 m!1347081))

(assert (=> b!1458997 m!1347081))

(assert (=> b!1458997 m!1347061))

(declare-fun m!1347083 () Bool)

(assert (=> b!1458997 m!1347083))

(declare-fun m!1347085 () Bool)

(assert (=> b!1459004 m!1347085))

(assert (=> b!1459004 m!1347067))

(declare-fun m!1347087 () Bool)

(assert (=> b!1459004 m!1347087))

(declare-fun m!1347089 () Bool)

(assert (=> b!1459004 m!1347089))

(declare-fun m!1347091 () Bool)

(assert (=> b!1459004 m!1347091))

(assert (=> b!1459004 m!1347061))

(declare-fun m!1347093 () Bool)

(assert (=> b!1458998 m!1347093))

(declare-fun m!1347095 () Bool)

(assert (=> b!1459000 m!1347095))

(assert (=> b!1459015 m!1347061))

(assert (=> b!1459015 m!1347061))

(declare-fun m!1347097 () Bool)

(assert (=> b!1459015 m!1347097))

(declare-fun m!1347099 () Bool)

(assert (=> b!1459011 m!1347099))

(assert (=> b!1459011 m!1347099))

(declare-fun m!1347101 () Bool)

(assert (=> b!1459011 m!1347101))

(declare-fun m!1347103 () Bool)

(assert (=> b!1459012 m!1347103))

(declare-fun m!1347105 () Bool)

(assert (=> b!1459009 m!1347105))

(declare-fun m!1347107 () Bool)

(assert (=> b!1459009 m!1347107))

(declare-fun m!1347109 () Bool)

(assert (=> b!1459009 m!1347109))

(assert (=> b!1459001 m!1347107))

(assert (=> b!1459001 m!1347109))

(assert (=> b!1459013 m!1347061))

(assert (=> b!1459013 m!1347061))

(declare-fun m!1347111 () Bool)

(assert (=> b!1459013 m!1347111))

(assert (=> b!1459002 m!1347067))

(declare-fun m!1347113 () Bool)

(assert (=> b!1459002 m!1347113))

(assert (=> b!1459002 m!1347087))

(assert (=> b!1459002 m!1347089))

(assert (=> b!1459002 m!1347061))

(declare-fun m!1347115 () Bool)

(assert (=> start!125340 m!1347115))

(declare-fun m!1347117 () Bool)

(assert (=> start!125340 m!1347117))

(check-sat (not b!1459018) (not b!1459001) (not b!1458999) (not b!1459015) (not b!1459014) (not start!125340) (not b!1459000) (not b!1459011) (not b!1459003) (not b!1458998) (not b!1459010) (not b!1459009) (not b!1459004) (not b!1459013) (not b!1458997) (not b!1459012))
(check-sat)
