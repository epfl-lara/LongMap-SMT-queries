; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124800 () Bool)

(assert start!124800)

(declare-fun b!1443561 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!98143 0))(
  ( (array!98144 (arr!47356 (Array (_ BitVec 32) (_ BitVec 64))) (size!47907 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98143)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun e!813737 () Bool)

(assert (=> b!1443561 (= e!813737 (or (= (select (arr!47356 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47356 a!2862) intermediateBeforeIndex!19) (select (arr!47356 a!2862) j!93))))))

(declare-fun b!1443563 () Bool)

(declare-fun res!974993 () Bool)

(declare-fun e!813733 () Bool)

(assert (=> b!1443563 (=> (not res!974993) (not e!813733))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11505 0))(
  ( (MissingZero!11505 (index!48412 (_ BitVec 32))) (Found!11505 (index!48413 (_ BitVec 32))) (Intermediate!11505 (undefined!12317 Bool) (index!48414 (_ BitVec 32)) (x!130298 (_ BitVec 32))) (Undefined!11505) (MissingVacant!11505 (index!48415 (_ BitVec 32))) )
))
(declare-fun lt!633979 () SeekEntryResult!11505)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98143 (_ BitVec 32)) SeekEntryResult!11505)

(assert (=> b!1443563 (= res!974993 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47356 a!2862) j!93) a!2862 mask!2687) lt!633979))))

(declare-fun b!1443564 () Bool)

(declare-fun res!974987 () Bool)

(declare-fun e!813734 () Bool)

(assert (=> b!1443564 (=> (not res!974987) (not e!813734))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1443564 (= res!974987 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47907 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47907 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47907 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443565 () Bool)

(declare-fun e!813738 () Bool)

(assert (=> b!1443565 (= e!813734 e!813738)))

(declare-fun res!974992 () Bool)

(assert (=> b!1443565 (=> (not res!974992) (not e!813738))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1443565 (= res!974992 (= (select (store (arr!47356 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!633978 () array!98143)

(assert (=> b!1443565 (= lt!633978 (array!98144 (store (arr!47356 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47907 a!2862)))))

(declare-fun b!1443566 () Bool)

(declare-fun res!974984 () Bool)

(assert (=> b!1443566 (=> (not res!974984) (not e!813734))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98143 (_ BitVec 32)) Bool)

(assert (=> b!1443566 (= res!974984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1443567 () Bool)

(declare-fun res!974988 () Bool)

(declare-fun e!813736 () Bool)

(assert (=> b!1443567 (=> (not res!974988) (not e!813736))))

(assert (=> b!1443567 (= res!974988 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun e!813732 () Bool)

(declare-fun b!1443568 () Bool)

(declare-fun lt!633980 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98143 (_ BitVec 32)) SeekEntryResult!11505)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98143 (_ BitVec 32)) SeekEntryResult!11505)

(assert (=> b!1443568 (= e!813732 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633980 lt!633978 mask!2687) (seekEntryOrOpen!0 lt!633980 lt!633978 mask!2687)))))

(declare-fun b!1443569 () Bool)

(declare-fun res!974991 () Bool)

(assert (=> b!1443569 (=> (not res!974991) (not e!813734))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443569 (= res!974991 (validKeyInArray!0 (select (arr!47356 a!2862) j!93)))))

(declare-fun b!1443570 () Bool)

(declare-fun res!974979 () Bool)

(assert (=> b!1443570 (=> (not res!974979) (not e!813734))))

(assert (=> b!1443570 (= res!974979 (validKeyInArray!0 (select (arr!47356 a!2862) i!1006)))))

(declare-fun b!1443562 () Bool)

(declare-fun res!974985 () Bool)

(assert (=> b!1443562 (=> (not res!974985) (not e!813737))))

(assert (=> b!1443562 (= res!974985 (= (seekEntryOrOpen!0 (select (arr!47356 a!2862) j!93) a!2862 mask!2687) (Found!11505 j!93)))))

(declare-fun res!974990 () Bool)

(assert (=> start!124800 (=> (not res!974990) (not e!813734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124800 (= res!974990 (validMask!0 mask!2687))))

(assert (=> start!124800 e!813734))

(assert (=> start!124800 true))

(declare-fun array_inv!36637 (array!98143) Bool)

(assert (=> start!124800 (array_inv!36637 a!2862)))

(declare-fun b!1443571 () Bool)

(declare-fun res!974982 () Bool)

(assert (=> b!1443571 (=> (not res!974982) (not e!813734))))

(assert (=> b!1443571 (= res!974982 (and (= (size!47907 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47907 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47907 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1443572 () Bool)

(assert (=> b!1443572 (= e!813738 e!813733)))

(declare-fun res!974989 () Bool)

(assert (=> b!1443572 (=> (not res!974989) (not e!813733))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443572 (= res!974989 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47356 a!2862) j!93) mask!2687) (select (arr!47356 a!2862) j!93) a!2862 mask!2687) lt!633979))))

(assert (=> b!1443572 (= lt!633979 (Intermediate!11505 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443573 () Bool)

(assert (=> b!1443573 (= e!813733 e!813736)))

(declare-fun res!974986 () Bool)

(assert (=> b!1443573 (=> (not res!974986) (not e!813736))))

(declare-fun lt!633982 () SeekEntryResult!11505)

(assert (=> b!1443573 (= res!974986 (= lt!633982 (Intermediate!11505 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1443573 (= lt!633982 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633980 mask!2687) lt!633980 lt!633978 mask!2687))))

(assert (=> b!1443573 (= lt!633980 (select (store (arr!47356 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443574 () Bool)

(assert (=> b!1443574 (= e!813736 (not (or (not (= (select (arr!47356 a!2862) index!646) (select (store (arr!47356 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47356 a!2862) index!646) (select (arr!47356 a!2862) j!93))) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(assert (=> b!1443574 e!813737))

(declare-fun res!974981 () Bool)

(assert (=> b!1443574 (=> (not res!974981) (not e!813737))))

(assert (=> b!1443574 (= res!974981 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48539 0))(
  ( (Unit!48540) )
))
(declare-fun lt!633981 () Unit!48539)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98143 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48539)

(assert (=> b!1443574 (= lt!633981 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1443575 () Bool)

(assert (=> b!1443575 (= e!813732 (= lt!633982 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633980 lt!633978 mask!2687)))))

(declare-fun b!1443576 () Bool)

(declare-fun res!974980 () Bool)

(assert (=> b!1443576 (=> (not res!974980) (not e!813736))))

(assert (=> b!1443576 (= res!974980 e!813732)))

(declare-fun c!133810 () Bool)

(assert (=> b!1443576 (= c!133810 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443577 () Bool)

(declare-fun res!974983 () Bool)

(assert (=> b!1443577 (=> (not res!974983) (not e!813734))))

(declare-datatypes ((List!33844 0))(
  ( (Nil!33841) (Cons!33840 (h!35201 (_ BitVec 64)) (t!48530 List!33844)) )
))
(declare-fun arrayNoDuplicates!0 (array!98143 (_ BitVec 32) List!33844) Bool)

(assert (=> b!1443577 (= res!974983 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33841))))

(assert (= (and start!124800 res!974990) b!1443571))

(assert (= (and b!1443571 res!974982) b!1443570))

(assert (= (and b!1443570 res!974979) b!1443569))

(assert (= (and b!1443569 res!974991) b!1443566))

(assert (= (and b!1443566 res!974984) b!1443577))

(assert (= (and b!1443577 res!974983) b!1443564))

(assert (= (and b!1443564 res!974987) b!1443565))

(assert (= (and b!1443565 res!974992) b!1443572))

(assert (= (and b!1443572 res!974989) b!1443563))

(assert (= (and b!1443563 res!974993) b!1443573))

(assert (= (and b!1443573 res!974986) b!1443576))

(assert (= (and b!1443576 c!133810) b!1443575))

(assert (= (and b!1443576 (not c!133810)) b!1443568))

(assert (= (and b!1443576 res!974980) b!1443567))

(assert (= (and b!1443567 res!974988) b!1443574))

(assert (= (and b!1443574 res!974981) b!1443562))

(assert (= (and b!1443562 res!974985) b!1443561))

(declare-fun m!1332835 () Bool)

(assert (=> b!1443575 m!1332835))

(declare-fun m!1332837 () Bool)

(assert (=> b!1443566 m!1332837))

(declare-fun m!1332839 () Bool)

(assert (=> b!1443565 m!1332839))

(declare-fun m!1332841 () Bool)

(assert (=> b!1443565 m!1332841))

(declare-fun m!1332843 () Bool)

(assert (=> b!1443561 m!1332843))

(declare-fun m!1332845 () Bool)

(assert (=> b!1443561 m!1332845))

(assert (=> b!1443563 m!1332845))

(assert (=> b!1443563 m!1332845))

(declare-fun m!1332847 () Bool)

(assert (=> b!1443563 m!1332847))

(assert (=> b!1443562 m!1332845))

(assert (=> b!1443562 m!1332845))

(declare-fun m!1332849 () Bool)

(assert (=> b!1443562 m!1332849))

(declare-fun m!1332851 () Bool)

(assert (=> start!124800 m!1332851))

(declare-fun m!1332853 () Bool)

(assert (=> start!124800 m!1332853))

(declare-fun m!1332855 () Bool)

(assert (=> b!1443570 m!1332855))

(assert (=> b!1443570 m!1332855))

(declare-fun m!1332857 () Bool)

(assert (=> b!1443570 m!1332857))

(declare-fun m!1332859 () Bool)

(assert (=> b!1443568 m!1332859))

(declare-fun m!1332861 () Bool)

(assert (=> b!1443568 m!1332861))

(assert (=> b!1443572 m!1332845))

(assert (=> b!1443572 m!1332845))

(declare-fun m!1332863 () Bool)

(assert (=> b!1443572 m!1332863))

(assert (=> b!1443572 m!1332863))

(assert (=> b!1443572 m!1332845))

(declare-fun m!1332865 () Bool)

(assert (=> b!1443572 m!1332865))

(declare-fun m!1332867 () Bool)

(assert (=> b!1443573 m!1332867))

(assert (=> b!1443573 m!1332867))

(declare-fun m!1332869 () Bool)

(assert (=> b!1443573 m!1332869))

(assert (=> b!1443573 m!1332839))

(declare-fun m!1332871 () Bool)

(assert (=> b!1443573 m!1332871))

(declare-fun m!1332873 () Bool)

(assert (=> b!1443574 m!1332873))

(assert (=> b!1443574 m!1332839))

(declare-fun m!1332875 () Bool)

(assert (=> b!1443574 m!1332875))

(declare-fun m!1332877 () Bool)

(assert (=> b!1443574 m!1332877))

(declare-fun m!1332879 () Bool)

(assert (=> b!1443574 m!1332879))

(assert (=> b!1443574 m!1332845))

(declare-fun m!1332881 () Bool)

(assert (=> b!1443577 m!1332881))

(assert (=> b!1443569 m!1332845))

(assert (=> b!1443569 m!1332845))

(declare-fun m!1332883 () Bool)

(assert (=> b!1443569 m!1332883))

(check-sat (not b!1443577) (not b!1443573) (not b!1443566) (not b!1443570) (not b!1443563) (not b!1443575) (not b!1443568) (not b!1443574) (not b!1443572) (not b!1443562) (not b!1443569) (not start!124800))
(check-sat)
