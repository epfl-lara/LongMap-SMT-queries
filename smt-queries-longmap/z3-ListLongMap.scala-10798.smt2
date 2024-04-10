; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126378 () Bool)

(assert start!126378)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1481465 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun e!830886 () Bool)

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99397 0))(
  ( (array!99398 (arr!47976 (Array (_ BitVec 32) (_ BitVec 64))) (size!48526 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99397)

(assert (=> b!1481465 (= e!830886 (not (or (and (= (select (arr!47976 a!2862) index!646) (select (store (arr!47976 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47976 a!2862) index!646) (select (arr!47976 a!2862) j!93))) (= (select (arr!47976 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (= (select (store (arr!47976 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!830887 () Bool)

(assert (=> b!1481465 e!830887))

(declare-fun res!1006790 () Bool)

(assert (=> b!1481465 (=> (not res!1006790) (not e!830887))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99397 (_ BitVec 32)) Bool)

(assert (=> b!1481465 (= res!1006790 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49772 0))(
  ( (Unit!49773) )
))
(declare-fun lt!646788 () Unit!49772)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99397 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49772)

(assert (=> b!1481465 (= lt!646788 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1481466 () Bool)

(declare-fun res!1006794 () Bool)

(assert (=> b!1481466 (=> (not res!1006794) (not e!830886))))

(declare-fun e!830888 () Bool)

(assert (=> b!1481466 (= res!1006794 e!830888)))

(declare-fun c!136860 () Bool)

(assert (=> b!1481466 (= c!136860 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1481467 () Bool)

(declare-fun res!1006797 () Bool)

(declare-fun e!830890 () Bool)

(assert (=> b!1481467 (=> (not res!1006797) (not e!830890))))

(declare-datatypes ((List!34477 0))(
  ( (Nil!34474) (Cons!34473 (h!35844 (_ BitVec 64)) (t!49171 List!34477)) )
))
(declare-fun arrayNoDuplicates!0 (array!99397 (_ BitVec 32) List!34477) Bool)

(assert (=> b!1481467 (= res!1006797 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34474))))

(declare-fun b!1481468 () Bool)

(declare-fun e!830885 () Bool)

(assert (=> b!1481468 (= e!830890 e!830885)))

(declare-fun res!1006800 () Bool)

(assert (=> b!1481468 (=> (not res!1006800) (not e!830885))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1481468 (= res!1006800 (= (select (store (arr!47976 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!646787 () array!99397)

(assert (=> b!1481468 (= lt!646787 (array!99398 (store (arr!47976 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48526 a!2862)))))

(declare-fun b!1481469 () Bool)

(declare-fun res!1006792 () Bool)

(assert (=> b!1481469 (=> (not res!1006792) (not e!830890))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481469 (= res!1006792 (validKeyInArray!0 (select (arr!47976 a!2862) j!93)))))

(declare-fun b!1481470 () Bool)

(declare-fun lt!646786 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12216 0))(
  ( (MissingZero!12216 (index!51256 (_ BitVec 32))) (Found!12216 (index!51257 (_ BitVec 32))) (Intermediate!12216 (undefined!13028 Bool) (index!51258 (_ BitVec 32)) (x!132843 (_ BitVec 32))) (Undefined!12216) (MissingVacant!12216 (index!51259 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99397 (_ BitVec 32)) SeekEntryResult!12216)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99397 (_ BitVec 32)) SeekEntryResult!12216)

(assert (=> b!1481470 (= e!830888 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646786 lt!646787 mask!2687) (seekEntryOrOpen!0 lt!646786 lt!646787 mask!2687)))))

(declare-fun b!1481471 () Bool)

(declare-fun e!830891 () Bool)

(assert (=> b!1481471 (= e!830891 e!830886)))

(declare-fun res!1006795 () Bool)

(assert (=> b!1481471 (=> (not res!1006795) (not e!830886))))

(declare-fun lt!646784 () SeekEntryResult!12216)

(assert (=> b!1481471 (= res!1006795 (= lt!646784 (Intermediate!12216 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99397 (_ BitVec 32)) SeekEntryResult!12216)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481471 (= lt!646784 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646786 mask!2687) lt!646786 lt!646787 mask!2687))))

(assert (=> b!1481471 (= lt!646786 (select (store (arr!47976 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1481472 () Bool)

(declare-fun res!1006793 () Bool)

(assert (=> b!1481472 (=> (not res!1006793) (not e!830886))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1481472 (= res!1006793 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1481473 () Bool)

(declare-fun res!1006789 () Bool)

(assert (=> b!1481473 (=> (not res!1006789) (not e!830891))))

(declare-fun lt!646785 () SeekEntryResult!12216)

(assert (=> b!1481473 (= res!1006789 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47976 a!2862) j!93) a!2862 mask!2687) lt!646785))))

(declare-fun b!1481474 () Bool)

(declare-fun res!1006801 () Bool)

(assert (=> b!1481474 (=> (not res!1006801) (not e!830890))))

(assert (=> b!1481474 (= res!1006801 (validKeyInArray!0 (select (arr!47976 a!2862) i!1006)))))

(declare-fun b!1481475 () Bool)

(assert (=> b!1481475 (= e!830888 (= lt!646784 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646786 lt!646787 mask!2687)))))

(declare-fun b!1481476 () Bool)

(declare-fun res!1006796 () Bool)

(assert (=> b!1481476 (=> (not res!1006796) (not e!830887))))

(assert (=> b!1481476 (= res!1006796 (= (seekEntryOrOpen!0 (select (arr!47976 a!2862) j!93) a!2862 mask!2687) (Found!12216 j!93)))))

(declare-fun res!1006798 () Bool)

(assert (=> start!126378 (=> (not res!1006798) (not e!830890))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126378 (= res!1006798 (validMask!0 mask!2687))))

(assert (=> start!126378 e!830890))

(assert (=> start!126378 true))

(declare-fun array_inv!37004 (array!99397) Bool)

(assert (=> start!126378 (array_inv!37004 a!2862)))

(declare-fun b!1481477 () Bool)

(declare-fun res!1006791 () Bool)

(assert (=> b!1481477 (=> (not res!1006791) (not e!830890))))

(assert (=> b!1481477 (= res!1006791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1481478 () Bool)

(declare-fun res!1006788 () Bool)

(assert (=> b!1481478 (=> (not res!1006788) (not e!830890))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1481478 (= res!1006788 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48526 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48526 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48526 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1481479 () Bool)

(declare-fun res!1006799 () Bool)

(assert (=> b!1481479 (=> (not res!1006799) (not e!830890))))

(assert (=> b!1481479 (= res!1006799 (and (= (size!48526 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48526 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48526 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1481480 () Bool)

(assert (=> b!1481480 (= e!830885 e!830891)))

(declare-fun res!1006787 () Bool)

(assert (=> b!1481480 (=> (not res!1006787) (not e!830891))))

(assert (=> b!1481480 (= res!1006787 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47976 a!2862) j!93) mask!2687) (select (arr!47976 a!2862) j!93) a!2862 mask!2687) lt!646785))))

(assert (=> b!1481480 (= lt!646785 (Intermediate!12216 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1481481 () Bool)

(assert (=> b!1481481 (= e!830887 (and (or (= (select (arr!47976 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47976 a!2862) intermediateBeforeIndex!19) (select (arr!47976 a!2862) j!93))) (or (and (= (select (arr!47976 a!2862) index!646) (select (store (arr!47976 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47976 a!2862) index!646) (select (arr!47976 a!2862) j!93))) (= (select (arr!47976 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (= index!646 intermediateAfterIndex!19))))))

(assert (= (and start!126378 res!1006798) b!1481479))

(assert (= (and b!1481479 res!1006799) b!1481474))

(assert (= (and b!1481474 res!1006801) b!1481469))

(assert (= (and b!1481469 res!1006792) b!1481477))

(assert (= (and b!1481477 res!1006791) b!1481467))

(assert (= (and b!1481467 res!1006797) b!1481478))

(assert (= (and b!1481478 res!1006788) b!1481468))

(assert (= (and b!1481468 res!1006800) b!1481480))

(assert (= (and b!1481480 res!1006787) b!1481473))

(assert (= (and b!1481473 res!1006789) b!1481471))

(assert (= (and b!1481471 res!1006795) b!1481466))

(assert (= (and b!1481466 c!136860) b!1481475))

(assert (= (and b!1481466 (not c!136860)) b!1481470))

(assert (= (and b!1481466 res!1006794) b!1481472))

(assert (= (and b!1481472 res!1006793) b!1481465))

(assert (= (and b!1481465 res!1006790) b!1481476))

(assert (= (and b!1481476 res!1006796) b!1481481))

(declare-fun m!1367205 () Bool)

(assert (=> b!1481475 m!1367205))

(declare-fun m!1367207 () Bool)

(assert (=> b!1481469 m!1367207))

(assert (=> b!1481469 m!1367207))

(declare-fun m!1367209 () Bool)

(assert (=> b!1481469 m!1367209))

(declare-fun m!1367211 () Bool)

(assert (=> b!1481470 m!1367211))

(declare-fun m!1367213 () Bool)

(assert (=> b!1481470 m!1367213))

(declare-fun m!1367215 () Bool)

(assert (=> b!1481471 m!1367215))

(assert (=> b!1481471 m!1367215))

(declare-fun m!1367217 () Bool)

(assert (=> b!1481471 m!1367217))

(declare-fun m!1367219 () Bool)

(assert (=> b!1481471 m!1367219))

(declare-fun m!1367221 () Bool)

(assert (=> b!1481471 m!1367221))

(declare-fun m!1367223 () Bool)

(assert (=> b!1481474 m!1367223))

(assert (=> b!1481474 m!1367223))

(declare-fun m!1367225 () Bool)

(assert (=> b!1481474 m!1367225))

(assert (=> b!1481473 m!1367207))

(assert (=> b!1481473 m!1367207))

(declare-fun m!1367227 () Bool)

(assert (=> b!1481473 m!1367227))

(declare-fun m!1367229 () Bool)

(assert (=> b!1481477 m!1367229))

(declare-fun m!1367231 () Bool)

(assert (=> b!1481465 m!1367231))

(assert (=> b!1481465 m!1367219))

(declare-fun m!1367233 () Bool)

(assert (=> b!1481465 m!1367233))

(declare-fun m!1367235 () Bool)

(assert (=> b!1481465 m!1367235))

(declare-fun m!1367237 () Bool)

(assert (=> b!1481465 m!1367237))

(assert (=> b!1481465 m!1367207))

(assert (=> b!1481468 m!1367219))

(declare-fun m!1367239 () Bool)

(assert (=> b!1481468 m!1367239))

(assert (=> b!1481480 m!1367207))

(assert (=> b!1481480 m!1367207))

(declare-fun m!1367241 () Bool)

(assert (=> b!1481480 m!1367241))

(assert (=> b!1481480 m!1367241))

(assert (=> b!1481480 m!1367207))

(declare-fun m!1367243 () Bool)

(assert (=> b!1481480 m!1367243))

(declare-fun m!1367245 () Bool)

(assert (=> start!126378 m!1367245))

(declare-fun m!1367247 () Bool)

(assert (=> start!126378 m!1367247))

(assert (=> b!1481476 m!1367207))

(assert (=> b!1481476 m!1367207))

(declare-fun m!1367249 () Bool)

(assert (=> b!1481476 m!1367249))

(declare-fun m!1367251 () Bool)

(assert (=> b!1481467 m!1367251))

(assert (=> b!1481481 m!1367219))

(declare-fun m!1367253 () Bool)

(assert (=> b!1481481 m!1367253))

(assert (=> b!1481481 m!1367233))

(assert (=> b!1481481 m!1367235))

(assert (=> b!1481481 m!1367207))

(check-sat (not b!1481476) (not b!1481474) (not b!1481469) (not b!1481465) (not b!1481473) (not b!1481477) (not b!1481480) (not b!1481470) (not start!126378) (not b!1481475) (not b!1481471) (not b!1481467))
(check-sat)
