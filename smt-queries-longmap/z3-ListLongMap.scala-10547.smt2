; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124638 () Bool)

(assert start!124638)

(declare-fun b!1440784 () Bool)

(declare-fun res!972391 () Bool)

(declare-fun e!812716 () Bool)

(assert (=> b!1440784 (=> (not res!972391) (not e!812716))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97981 0))(
  ( (array!97982 (arr!47275 (Array (_ BitVec 32) (_ BitVec 64))) (size!47826 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97981)

(assert (=> b!1440784 (= res!972391 (and (= (size!47826 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47826 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47826 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440785 () Bool)

(declare-fun res!972386 () Bool)

(declare-fun e!812717 () Bool)

(assert (=> b!1440785 (=> (not res!972386) (not e!812717))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11424 0))(
  ( (MissingZero!11424 (index!48088 (_ BitVec 32))) (Found!11424 (index!48089 (_ BitVec 32))) (Intermediate!11424 (undefined!12236 Bool) (index!48090 (_ BitVec 32)) (x!130001 (_ BitVec 32))) (Undefined!11424) (MissingVacant!11424 (index!48091 (_ BitVec 32))) )
))
(declare-fun lt!633295 () SeekEntryResult!11424)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97981 (_ BitVec 32)) SeekEntryResult!11424)

(assert (=> b!1440785 (= res!972386 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47275 a!2862) j!93) a!2862 mask!2687) lt!633295))))

(declare-fun b!1440786 () Bool)

(assert (=> b!1440786 (= e!812716 e!812717)))

(declare-fun res!972394 () Bool)

(assert (=> b!1440786 (=> (not res!972394) (not e!812717))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440786 (= res!972394 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47275 a!2862) j!93) mask!2687) (select (arr!47275 a!2862) j!93) a!2862 mask!2687) lt!633295))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440786 (= lt!633295 (Intermediate!11424 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!972387 () Bool)

(assert (=> start!124638 (=> (not res!972387) (not e!812716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124638 (= res!972387 (validMask!0 mask!2687))))

(assert (=> start!124638 e!812716))

(assert (=> start!124638 true))

(declare-fun array_inv!36556 (array!97981) Bool)

(assert (=> start!124638 (array_inv!36556 a!2862)))

(declare-fun b!1440787 () Bool)

(declare-fun res!972388 () Bool)

(assert (=> b!1440787 (=> (not res!972388) (not e!812717))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440787 (= res!972388 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47275 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47275 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97982 (store (arr!47275 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47826 a!2862)) mask!2687) (Intermediate!11424 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1440788 () Bool)

(declare-fun res!972395 () Bool)

(assert (=> b!1440788 (=> (not res!972395) (not e!812716))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440788 (= res!972395 (validKeyInArray!0 (select (arr!47275 a!2862) i!1006)))))

(declare-fun b!1440789 () Bool)

(declare-fun res!972390 () Bool)

(assert (=> b!1440789 (=> (not res!972390) (not e!812716))))

(declare-datatypes ((List!33763 0))(
  ( (Nil!33760) (Cons!33759 (h!35120 (_ BitVec 64)) (t!48449 List!33763)) )
))
(declare-fun arrayNoDuplicates!0 (array!97981 (_ BitVec 32) List!33763) Bool)

(assert (=> b!1440789 (= res!972390 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33760))))

(declare-fun b!1440790 () Bool)

(declare-fun res!972393 () Bool)

(assert (=> b!1440790 (=> (not res!972393) (not e!812716))))

(assert (=> b!1440790 (= res!972393 (validKeyInArray!0 (select (arr!47275 a!2862) j!93)))))

(declare-fun b!1440791 () Bool)

(declare-fun res!972389 () Bool)

(assert (=> b!1440791 (=> (not res!972389) (not e!812716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97981 (_ BitVec 32)) Bool)

(assert (=> b!1440791 (= res!972389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440792 () Bool)

(declare-fun res!972392 () Bool)

(assert (=> b!1440792 (=> (not res!972392) (not e!812716))))

(assert (=> b!1440792 (= res!972392 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47826 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47826 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47826 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47275 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440793 () Bool)

(assert (=> b!1440793 (= e!812717 (and (bvsle x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(assert (= (and start!124638 res!972387) b!1440784))

(assert (= (and b!1440784 res!972391) b!1440788))

(assert (= (and b!1440788 res!972395) b!1440790))

(assert (= (and b!1440790 res!972393) b!1440791))

(assert (= (and b!1440791 res!972389) b!1440789))

(assert (= (and b!1440789 res!972390) b!1440792))

(assert (= (and b!1440792 res!972392) b!1440786))

(assert (= (and b!1440786 res!972394) b!1440785))

(assert (= (and b!1440785 res!972386) b!1440787))

(assert (= (and b!1440787 res!972388) b!1440793))

(declare-fun m!1329973 () Bool)

(assert (=> b!1440787 m!1329973))

(declare-fun m!1329975 () Bool)

(assert (=> b!1440787 m!1329975))

(assert (=> b!1440787 m!1329975))

(declare-fun m!1329977 () Bool)

(assert (=> b!1440787 m!1329977))

(assert (=> b!1440787 m!1329977))

(assert (=> b!1440787 m!1329975))

(declare-fun m!1329979 () Bool)

(assert (=> b!1440787 m!1329979))

(declare-fun m!1329981 () Bool)

(assert (=> b!1440785 m!1329981))

(assert (=> b!1440785 m!1329981))

(declare-fun m!1329983 () Bool)

(assert (=> b!1440785 m!1329983))

(declare-fun m!1329985 () Bool)

(assert (=> b!1440788 m!1329985))

(assert (=> b!1440788 m!1329985))

(declare-fun m!1329987 () Bool)

(assert (=> b!1440788 m!1329987))

(declare-fun m!1329989 () Bool)

(assert (=> b!1440791 m!1329989))

(declare-fun m!1329991 () Bool)

(assert (=> b!1440789 m!1329991))

(assert (=> b!1440792 m!1329973))

(declare-fun m!1329993 () Bool)

(assert (=> b!1440792 m!1329993))

(declare-fun m!1329995 () Bool)

(assert (=> start!124638 m!1329995))

(declare-fun m!1329997 () Bool)

(assert (=> start!124638 m!1329997))

(assert (=> b!1440790 m!1329981))

(assert (=> b!1440790 m!1329981))

(declare-fun m!1329999 () Bool)

(assert (=> b!1440790 m!1329999))

(assert (=> b!1440786 m!1329981))

(assert (=> b!1440786 m!1329981))

(declare-fun m!1330001 () Bool)

(assert (=> b!1440786 m!1330001))

(assert (=> b!1440786 m!1330001))

(assert (=> b!1440786 m!1329981))

(declare-fun m!1330003 () Bool)

(assert (=> b!1440786 m!1330003))

(check-sat (not b!1440788) (not b!1440791) (not b!1440786) (not b!1440789) (not b!1440785) (not b!1440790) (not start!124638) (not b!1440787))
(check-sat)
