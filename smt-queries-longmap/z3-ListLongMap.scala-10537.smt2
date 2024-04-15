; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124246 () Bool)

(assert start!124246)

(declare-fun res!970754 () Bool)

(declare-fun e!811194 () Bool)

(assert (=> start!124246 (=> (not res!970754) (not e!811194))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124246 (= res!970754 (validMask!0 mask!2687))))

(assert (=> start!124246 e!811194))

(assert (=> start!124246 true))

(declare-datatypes ((array!97750 0))(
  ( (array!97751 (arr!47167 (Array (_ BitVec 32) (_ BitVec 64))) (size!47719 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97750)

(declare-fun array_inv!36400 (array!97750) Bool)

(assert (=> start!124246 (array_inv!36400 a!2862)))

(declare-fun b!1437957 () Bool)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun e!811191 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437957 (= e!811191 (not (validKeyInArray!0 (select (store (arr!47167 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))))

(declare-fun b!1437958 () Bool)

(declare-fun res!970750 () Bool)

(assert (=> b!1437958 (=> (not res!970750) (not e!811194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97750 (_ BitVec 32)) Bool)

(assert (=> b!1437958 (= res!970750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437959 () Bool)

(declare-fun res!970756 () Bool)

(assert (=> b!1437959 (=> (not res!970756) (not e!811194))))

(assert (=> b!1437959 (= res!970756 (validKeyInArray!0 (select (arr!47167 a!2862) i!1006)))))

(declare-fun b!1437960 () Bool)

(declare-fun e!811193 () Bool)

(assert (=> b!1437960 (= e!811194 e!811193)))

(declare-fun res!970755 () Bool)

(assert (=> b!1437960 (=> (not res!970755) (not e!811193))))

(declare-datatypes ((SeekEntryResult!11444 0))(
  ( (MissingZero!11444 (index!48168 (_ BitVec 32))) (Found!11444 (index!48169 (_ BitVec 32))) (Intermediate!11444 (undefined!12256 Bool) (index!48170 (_ BitVec 32)) (x!129900 (_ BitVec 32))) (Undefined!11444) (MissingVacant!11444 (index!48171 (_ BitVec 32))) )
))
(declare-fun lt!632270 () SeekEntryResult!11444)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97750 (_ BitVec 32)) SeekEntryResult!11444)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437960 (= res!970755 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47167 a!2862) j!93) mask!2687) (select (arr!47167 a!2862) j!93) a!2862 mask!2687) lt!632270))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1437960 (= lt!632270 (Intermediate!11444 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1437961 () Bool)

(assert (=> b!1437961 (= e!811193 e!811191)))

(declare-fun res!970751 () Bool)

(assert (=> b!1437961 (=> (not res!970751) (not e!811191))))

(declare-fun lt!632271 () (_ BitVec 32))

(assert (=> b!1437961 (= res!970751 (and (bvsge mask!2687 #b00000000000000000000000000000000) (bvsge lt!632271 #b00000000000000000000000000000000) (bvslt lt!632271 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(assert (=> b!1437961 (= lt!632271 (toIndex!0 (select (store (arr!47167 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1437962 () Bool)

(declare-fun res!970753 () Bool)

(assert (=> b!1437962 (=> (not res!970753) (not e!811194))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437962 (= res!970753 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47719 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47719 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47719 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47167 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437963 () Bool)

(declare-fun res!970749 () Bool)

(assert (=> b!1437963 (=> (not res!970749) (not e!811194))))

(assert (=> b!1437963 (= res!970749 (and (= (size!47719 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47719 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47719 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437964 () Bool)

(declare-fun res!970752 () Bool)

(assert (=> b!1437964 (=> (not res!970752) (not e!811194))))

(assert (=> b!1437964 (= res!970752 (validKeyInArray!0 (select (arr!47167 a!2862) j!93)))))

(declare-fun b!1437965 () Bool)

(declare-fun res!970748 () Bool)

(assert (=> b!1437965 (=> (not res!970748) (not e!811193))))

(assert (=> b!1437965 (= res!970748 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47167 a!2862) j!93) a!2862 mask!2687) lt!632270))))

(declare-fun b!1437966 () Bool)

(declare-fun res!970747 () Bool)

(assert (=> b!1437966 (=> (not res!970747) (not e!811194))))

(declare-datatypes ((List!33746 0))(
  ( (Nil!33743) (Cons!33742 (h!35086 (_ BitVec 64)) (t!48432 List!33746)) )
))
(declare-fun arrayNoDuplicates!0 (array!97750 (_ BitVec 32) List!33746) Bool)

(assert (=> b!1437966 (= res!970747 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33743))))

(assert (= (and start!124246 res!970754) b!1437963))

(assert (= (and b!1437963 res!970749) b!1437959))

(assert (= (and b!1437959 res!970756) b!1437964))

(assert (= (and b!1437964 res!970752) b!1437958))

(assert (= (and b!1437958 res!970750) b!1437966))

(assert (= (and b!1437966 res!970747) b!1437962))

(assert (= (and b!1437962 res!970753) b!1437960))

(assert (= (and b!1437960 res!970755) b!1437965))

(assert (= (and b!1437965 res!970748) b!1437961))

(assert (= (and b!1437961 res!970751) b!1437957))

(declare-fun m!1326651 () Bool)

(assert (=> b!1437962 m!1326651))

(declare-fun m!1326653 () Bool)

(assert (=> b!1437962 m!1326653))

(assert (=> b!1437957 m!1326651))

(declare-fun m!1326655 () Bool)

(assert (=> b!1437957 m!1326655))

(assert (=> b!1437957 m!1326655))

(declare-fun m!1326657 () Bool)

(assert (=> b!1437957 m!1326657))

(declare-fun m!1326659 () Bool)

(assert (=> b!1437958 m!1326659))

(assert (=> b!1437961 m!1326651))

(assert (=> b!1437961 m!1326655))

(assert (=> b!1437961 m!1326655))

(declare-fun m!1326661 () Bool)

(assert (=> b!1437961 m!1326661))

(declare-fun m!1326663 () Bool)

(assert (=> b!1437959 m!1326663))

(assert (=> b!1437959 m!1326663))

(declare-fun m!1326665 () Bool)

(assert (=> b!1437959 m!1326665))

(declare-fun m!1326667 () Bool)

(assert (=> start!124246 m!1326667))

(declare-fun m!1326669 () Bool)

(assert (=> start!124246 m!1326669))

(declare-fun m!1326671 () Bool)

(assert (=> b!1437964 m!1326671))

(assert (=> b!1437964 m!1326671))

(declare-fun m!1326673 () Bool)

(assert (=> b!1437964 m!1326673))

(assert (=> b!1437960 m!1326671))

(assert (=> b!1437960 m!1326671))

(declare-fun m!1326675 () Bool)

(assert (=> b!1437960 m!1326675))

(assert (=> b!1437960 m!1326675))

(assert (=> b!1437960 m!1326671))

(declare-fun m!1326677 () Bool)

(assert (=> b!1437960 m!1326677))

(declare-fun m!1326679 () Bool)

(assert (=> b!1437966 m!1326679))

(assert (=> b!1437965 m!1326671))

(assert (=> b!1437965 m!1326671))

(declare-fun m!1326681 () Bool)

(assert (=> b!1437965 m!1326681))

(check-sat (not start!124246) (not b!1437964) (not b!1437959) (not b!1437958) (not b!1437966) (not b!1437957) (not b!1437961) (not b!1437960) (not b!1437965))
(check-sat)
