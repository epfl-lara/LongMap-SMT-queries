; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125304 () Bool)

(assert start!125304)

(declare-fun b!1457809 () Bool)

(declare-fun res!987461 () Bool)

(declare-fun e!820297 () Bool)

(assert (=> b!1457809 (=> (not res!987461) (not e!820297))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!98647 0))(
  ( (array!98648 (arr!47608 (Array (_ BitVec 32) (_ BitVec 64))) (size!48159 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98647)

(declare-datatypes ((SeekEntryResult!11757 0))(
  ( (MissingZero!11757 (index!49420 (_ BitVec 32))) (Found!11757 (index!49421 (_ BitVec 32))) (Intermediate!11757 (undefined!12569 Bool) (index!49422 (_ BitVec 32)) (x!131222 (_ BitVec 32))) (Undefined!11757) (MissingVacant!11757 (index!49423 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98647 (_ BitVec 32)) SeekEntryResult!11757)

(assert (=> b!1457809 (= res!987461 (= (seekEntryOrOpen!0 (select (arr!47608 a!2862) j!93) a!2862 mask!2687) (Found!11757 j!93)))))

(declare-fun b!1457811 () Bool)

(declare-fun res!987466 () Bool)

(declare-fun e!820291 () Bool)

(assert (=> b!1457811 (=> (not res!987466) (not e!820291))))

(declare-fun e!820293 () Bool)

(assert (=> b!1457811 (= res!987466 e!820293)))

(declare-fun c!134695 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1457811 (= c!134695 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1457812 () Bool)

(declare-fun res!987467 () Bool)

(declare-fun e!820290 () Bool)

(assert (=> b!1457812 (=> res!987467 e!820290)))

(declare-fun lt!638813 () SeekEntryResult!11757)

(declare-fun lt!638810 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98647 (_ BitVec 32)) SeekEntryResult!11757)

(assert (=> b!1457812 (= res!987467 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638810 (select (arr!47608 a!2862) j!93) a!2862 mask!2687) lt!638813)))))

(declare-fun b!1457813 () Bool)

(declare-fun res!987469 () Bool)

(declare-fun e!820292 () Bool)

(assert (=> b!1457813 (=> (not res!987469) (not e!820292))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1457813 (= res!987469 (and (= (size!48159 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48159 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48159 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1457814 () Bool)

(assert (=> b!1457814 (= e!820290 true)))

(declare-fun lt!638812 () Bool)

(declare-fun e!820295 () Bool)

(assert (=> b!1457814 (= lt!638812 e!820295)))

(declare-fun c!134694 () Bool)

(assert (=> b!1457814 (= c!134694 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1457815 () Bool)

(declare-fun res!987460 () Bool)

(assert (=> b!1457815 (=> (not res!987460) (not e!820292))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1457815 (= res!987460 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48159 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48159 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48159 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!638809 () array!98647)

(declare-fun lt!638811 () (_ BitVec 64))

(declare-fun b!1457816 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98647 (_ BitVec 32)) SeekEntryResult!11757)

(assert (=> b!1457816 (= e!820293 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638811 lt!638809 mask!2687) (seekEntryOrOpen!0 lt!638811 lt!638809 mask!2687)))))

(declare-fun b!1457817 () Bool)

(declare-fun res!987459 () Bool)

(assert (=> b!1457817 (=> (not res!987459) (not e!820292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1457817 (= res!987459 (validKeyInArray!0 (select (arr!47608 a!2862) i!1006)))))

(declare-fun b!1457818 () Bool)

(declare-fun res!987475 () Bool)

(assert (=> b!1457818 (=> (not res!987475) (not e!820291))))

(assert (=> b!1457818 (= res!987475 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1457819 () Bool)

(declare-fun res!987474 () Bool)

(assert (=> b!1457819 (=> (not res!987474) (not e!820292))))

(assert (=> b!1457819 (= res!987474 (validKeyInArray!0 (select (arr!47608 a!2862) j!93)))))

(declare-fun b!1457820 () Bool)

(declare-fun res!987471 () Bool)

(assert (=> b!1457820 (=> (not res!987471) (not e!820292))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98647 (_ BitVec 32)) Bool)

(assert (=> b!1457820 (= res!987471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1457810 () Bool)

(declare-fun e!820299 () Bool)

(assert (=> b!1457810 (= e!820291 (not e!820299))))

(declare-fun res!987473 () Bool)

(assert (=> b!1457810 (=> res!987473 e!820299)))

(assert (=> b!1457810 (= res!987473 (or (and (= (select (arr!47608 a!2862) index!646) (select (store (arr!47608 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47608 a!2862) index!646) (select (arr!47608 a!2862) j!93))) (= (select (arr!47608 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1457810 e!820297))

(declare-fun res!987472 () Bool)

(assert (=> b!1457810 (=> (not res!987472) (not e!820297))))

(assert (=> b!1457810 (= res!987472 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49043 0))(
  ( (Unit!49044) )
))
(declare-fun lt!638815 () Unit!49043)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98647 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49043)

(assert (=> b!1457810 (= lt!638815 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!987476 () Bool)

(assert (=> start!125304 (=> (not res!987476) (not e!820292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125304 (= res!987476 (validMask!0 mask!2687))))

(assert (=> start!125304 e!820292))

(assert (=> start!125304 true))

(declare-fun array_inv!36889 (array!98647) Bool)

(assert (=> start!125304 (array_inv!36889 a!2862)))

(declare-fun b!1457821 () Bool)

(declare-fun lt!638814 () SeekEntryResult!11757)

(assert (=> b!1457821 (= e!820295 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638810 intermediateAfterIndex!19 lt!638811 lt!638809 mask!2687) lt!638814)))))

(declare-fun b!1457822 () Bool)

(declare-fun e!820294 () Bool)

(declare-fun e!820296 () Bool)

(assert (=> b!1457822 (= e!820294 e!820296)))

(declare-fun res!987470 () Bool)

(assert (=> b!1457822 (=> (not res!987470) (not e!820296))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457822 (= res!987470 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47608 a!2862) j!93) mask!2687) (select (arr!47608 a!2862) j!93) a!2862 mask!2687) lt!638813))))

(assert (=> b!1457822 (= lt!638813 (Intermediate!11757 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1457823 () Bool)

(declare-fun res!987468 () Bool)

(assert (=> b!1457823 (=> (not res!987468) (not e!820292))))

(declare-datatypes ((List!34096 0))(
  ( (Nil!34093) (Cons!34092 (h!35453 (_ BitVec 64)) (t!48782 List!34096)) )
))
(declare-fun arrayNoDuplicates!0 (array!98647 (_ BitVec 32) List!34096) Bool)

(assert (=> b!1457823 (= res!987468 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34093))))

(declare-fun b!1457824 () Bool)

(assert (=> b!1457824 (= e!820296 e!820291)))

(declare-fun res!987462 () Bool)

(assert (=> b!1457824 (=> (not res!987462) (not e!820291))))

(declare-fun lt!638808 () SeekEntryResult!11757)

(assert (=> b!1457824 (= res!987462 (= lt!638808 (Intermediate!11757 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1457824 (= lt!638808 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638811 mask!2687) lt!638811 lt!638809 mask!2687))))

(assert (=> b!1457824 (= lt!638811 (select (store (arr!47608 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1457825 () Bool)

(assert (=> b!1457825 (= e!820293 (= lt!638808 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638811 lt!638809 mask!2687)))))

(declare-fun b!1457826 () Bool)

(assert (=> b!1457826 (= e!820292 e!820294)))

(declare-fun res!987463 () Bool)

(assert (=> b!1457826 (=> (not res!987463) (not e!820294))))

(assert (=> b!1457826 (= res!987463 (= (select (store (arr!47608 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1457826 (= lt!638809 (array!98648 (store (arr!47608 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48159 a!2862)))))

(declare-fun b!1457827 () Bool)

(declare-fun res!987464 () Bool)

(assert (=> b!1457827 (=> (not res!987464) (not e!820296))))

(assert (=> b!1457827 (= res!987464 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47608 a!2862) j!93) a!2862 mask!2687) lt!638813))))

(declare-fun b!1457828 () Bool)

(assert (=> b!1457828 (= e!820295 (not (= lt!638808 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638810 lt!638811 lt!638809 mask!2687))))))

(declare-fun b!1457829 () Bool)

(assert (=> b!1457829 (= e!820297 (and (or (= (select (arr!47608 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47608 a!2862) intermediateBeforeIndex!19) (select (arr!47608 a!2862) j!93))) (let ((bdg!53252 (select (store (arr!47608 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47608 a!2862) index!646) bdg!53252) (= (select (arr!47608 a!2862) index!646) (select (arr!47608 a!2862) j!93))) (= (select (arr!47608 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53252 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1457830 () Bool)

(assert (=> b!1457830 (= e!820299 e!820290)))

(declare-fun res!987465 () Bool)

(assert (=> b!1457830 (=> res!987465 e!820290)))

(assert (=> b!1457830 (= res!987465 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638810 #b00000000000000000000000000000000) (bvsge lt!638810 (size!48159 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457830 (= lt!638810 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> b!1457830 (= lt!638814 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638811 lt!638809 mask!2687))))

(assert (=> b!1457830 (= lt!638814 (seekEntryOrOpen!0 lt!638811 lt!638809 mask!2687))))

(assert (= (and start!125304 res!987476) b!1457813))

(assert (= (and b!1457813 res!987469) b!1457817))

(assert (= (and b!1457817 res!987459) b!1457819))

(assert (= (and b!1457819 res!987474) b!1457820))

(assert (= (and b!1457820 res!987471) b!1457823))

(assert (= (and b!1457823 res!987468) b!1457815))

(assert (= (and b!1457815 res!987460) b!1457826))

(assert (= (and b!1457826 res!987463) b!1457822))

(assert (= (and b!1457822 res!987470) b!1457827))

(assert (= (and b!1457827 res!987464) b!1457824))

(assert (= (and b!1457824 res!987462) b!1457811))

(assert (= (and b!1457811 c!134695) b!1457825))

(assert (= (and b!1457811 (not c!134695)) b!1457816))

(assert (= (and b!1457811 res!987466) b!1457818))

(assert (= (and b!1457818 res!987475) b!1457810))

(assert (= (and b!1457810 res!987472) b!1457809))

(assert (= (and b!1457809 res!987461) b!1457829))

(assert (= (and b!1457810 (not res!987473)) b!1457830))

(assert (= (and b!1457830 (not res!987465)) b!1457812))

(assert (= (and b!1457812 (not res!987467)) b!1457814))

(assert (= (and b!1457814 c!134694) b!1457828))

(assert (= (and b!1457814 (not c!134694)) b!1457821))

(declare-fun m!1346017 () Bool)

(assert (=> b!1457820 m!1346017))

(declare-fun m!1346019 () Bool)

(assert (=> b!1457809 m!1346019))

(assert (=> b!1457809 m!1346019))

(declare-fun m!1346021 () Bool)

(assert (=> b!1457809 m!1346021))

(declare-fun m!1346023 () Bool)

(assert (=> b!1457825 m!1346023))

(declare-fun m!1346025 () Bool)

(assert (=> b!1457828 m!1346025))

(declare-fun m!1346027 () Bool)

(assert (=> b!1457823 m!1346027))

(declare-fun m!1346029 () Bool)

(assert (=> b!1457830 m!1346029))

(declare-fun m!1346031 () Bool)

(assert (=> b!1457830 m!1346031))

(declare-fun m!1346033 () Bool)

(assert (=> b!1457830 m!1346033))

(assert (=> b!1457827 m!1346019))

(assert (=> b!1457827 m!1346019))

(declare-fun m!1346035 () Bool)

(assert (=> b!1457827 m!1346035))

(assert (=> b!1457812 m!1346019))

(assert (=> b!1457812 m!1346019))

(declare-fun m!1346037 () Bool)

(assert (=> b!1457812 m!1346037))

(declare-fun m!1346039 () Bool)

(assert (=> b!1457829 m!1346039))

(declare-fun m!1346041 () Bool)

(assert (=> b!1457829 m!1346041))

(declare-fun m!1346043 () Bool)

(assert (=> b!1457829 m!1346043))

(declare-fun m!1346045 () Bool)

(assert (=> b!1457829 m!1346045))

(assert (=> b!1457829 m!1346019))

(declare-fun m!1346047 () Bool)

(assert (=> b!1457817 m!1346047))

(assert (=> b!1457817 m!1346047))

(declare-fun m!1346049 () Bool)

(assert (=> b!1457817 m!1346049))

(declare-fun m!1346051 () Bool)

(assert (=> b!1457821 m!1346051))

(assert (=> b!1457816 m!1346031))

(assert (=> b!1457816 m!1346033))

(declare-fun m!1346053 () Bool)

(assert (=> b!1457810 m!1346053))

(assert (=> b!1457810 m!1346039))

(assert (=> b!1457810 m!1346043))

(assert (=> b!1457810 m!1346045))

(declare-fun m!1346055 () Bool)

(assert (=> b!1457810 m!1346055))

(assert (=> b!1457810 m!1346019))

(assert (=> b!1457826 m!1346039))

(declare-fun m!1346057 () Bool)

(assert (=> b!1457826 m!1346057))

(assert (=> b!1457819 m!1346019))

(assert (=> b!1457819 m!1346019))

(declare-fun m!1346059 () Bool)

(assert (=> b!1457819 m!1346059))

(declare-fun m!1346061 () Bool)

(assert (=> b!1457824 m!1346061))

(assert (=> b!1457824 m!1346061))

(declare-fun m!1346063 () Bool)

(assert (=> b!1457824 m!1346063))

(assert (=> b!1457824 m!1346039))

(declare-fun m!1346065 () Bool)

(assert (=> b!1457824 m!1346065))

(assert (=> b!1457822 m!1346019))

(assert (=> b!1457822 m!1346019))

(declare-fun m!1346067 () Bool)

(assert (=> b!1457822 m!1346067))

(assert (=> b!1457822 m!1346067))

(assert (=> b!1457822 m!1346019))

(declare-fun m!1346069 () Bool)

(assert (=> b!1457822 m!1346069))

(declare-fun m!1346071 () Bool)

(assert (=> start!125304 m!1346071))

(declare-fun m!1346073 () Bool)

(assert (=> start!125304 m!1346073))

(check-sat (not b!1457819) (not b!1457825) (not b!1457820) (not b!1457828) (not b!1457822) (not b!1457824) (not start!125304) (not b!1457810) (not b!1457812) (not b!1457827) (not b!1457830) (not b!1457809) (not b!1457816) (not b!1457821) (not b!1457823) (not b!1457817))
(check-sat)
