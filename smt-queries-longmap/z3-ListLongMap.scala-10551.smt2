; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124446 () Bool)

(assert start!124446)

(declare-fun b!1439834 () Bool)

(declare-fun e!811997 () Bool)

(declare-fun e!811996 () Bool)

(assert (=> b!1439834 (= e!811997 e!811996)))

(declare-fun res!972261 () Bool)

(assert (=> b!1439834 (=> (not res!972261) (not e!811996))))

(declare-datatypes ((array!97894 0))(
  ( (array!97895 (arr!47235 (Array (_ BitVec 32) (_ BitVec 64))) (size!47785 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97894)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11487 0))(
  ( (MissingZero!11487 (index!48340 (_ BitVec 32))) (Found!11487 (index!48341 (_ BitVec 32))) (Intermediate!11487 (undefined!12299 Bool) (index!48342 (_ BitVec 32)) (x!130072 (_ BitVec 32))) (Undefined!11487) (MissingVacant!11487 (index!48343 (_ BitVec 32))) )
))
(declare-fun lt!632874 () SeekEntryResult!11487)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97894 (_ BitVec 32)) SeekEntryResult!11487)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439834 (= res!972261 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47235 a!2862) j!93) mask!2687) (select (arr!47235 a!2862) j!93) a!2862 mask!2687) lt!632874))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1439834 (= lt!632874 (Intermediate!11487 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439835 () Bool)

(declare-fun res!972267 () Bool)

(assert (=> b!1439835 (=> (not res!972267) (not e!811996))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1439835 (= res!972267 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47235 a!2862) j!93) a!2862 mask!2687) lt!632874))))

(declare-fun b!1439836 () Bool)

(declare-fun res!972266 () Bool)

(assert (=> b!1439836 (=> (not res!972266) (not e!811997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97894 (_ BitVec 32)) Bool)

(assert (=> b!1439836 (= res!972266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439837 () Bool)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439837 (= e!811996 (not (validKeyInArray!0 (select (store (arr!47235 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))))

(declare-fun b!1439838 () Bool)

(declare-fun res!972263 () Bool)

(assert (=> b!1439838 (=> (not res!972263) (not e!811997))))

(assert (=> b!1439838 (= res!972263 (validKeyInArray!0 (select (arr!47235 a!2862) j!93)))))

(declare-fun b!1439839 () Bool)

(declare-fun res!972270 () Bool)

(assert (=> b!1439839 (=> (not res!972270) (not e!811996))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1439839 (= res!972270 (and (bvsle x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1439840 () Bool)

(declare-fun res!972265 () Bool)

(assert (=> b!1439840 (=> (not res!972265) (not e!811997))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1439840 (= res!972265 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47785 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47785 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47785 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47235 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!972268 () Bool)

(assert (=> start!124446 (=> (not res!972268) (not e!811997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124446 (= res!972268 (validMask!0 mask!2687))))

(assert (=> start!124446 e!811997))

(assert (=> start!124446 true))

(declare-fun array_inv!36263 (array!97894) Bool)

(assert (=> start!124446 (array_inv!36263 a!2862)))

(declare-fun b!1439841 () Bool)

(declare-fun res!972264 () Bool)

(assert (=> b!1439841 (=> (not res!972264) (not e!811997))))

(assert (=> b!1439841 (= res!972264 (validKeyInArray!0 (select (arr!47235 a!2862) i!1006)))))

(declare-fun b!1439842 () Bool)

(declare-fun res!972262 () Bool)

(assert (=> b!1439842 (=> (not res!972262) (not e!811996))))

(assert (=> b!1439842 (= res!972262 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47235 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47235 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97895 (store (arr!47235 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47785 a!2862)) mask!2687) (Intermediate!11487 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1439843 () Bool)

(declare-fun res!972271 () Bool)

(assert (=> b!1439843 (=> (not res!972271) (not e!811997))))

(declare-datatypes ((List!33736 0))(
  ( (Nil!33733) (Cons!33732 (h!35082 (_ BitVec 64)) (t!48430 List!33736)) )
))
(declare-fun arrayNoDuplicates!0 (array!97894 (_ BitVec 32) List!33736) Bool)

(assert (=> b!1439843 (= res!972271 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33733))))

(declare-fun b!1439844 () Bool)

(declare-fun res!972269 () Bool)

(assert (=> b!1439844 (=> (not res!972269) (not e!811997))))

(assert (=> b!1439844 (= res!972269 (and (= (size!47785 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47785 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47785 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124446 res!972268) b!1439844))

(assert (= (and b!1439844 res!972269) b!1439841))

(assert (= (and b!1439841 res!972264) b!1439838))

(assert (= (and b!1439838 res!972263) b!1439836))

(assert (= (and b!1439836 res!972266) b!1439843))

(assert (= (and b!1439843 res!972271) b!1439840))

(assert (= (and b!1439840 res!972265) b!1439834))

(assert (= (and b!1439834 res!972261) b!1439835))

(assert (= (and b!1439835 res!972267) b!1439842))

(assert (= (and b!1439842 res!972262) b!1439839))

(assert (= (and b!1439839 res!972270) b!1439837))

(declare-fun m!1328951 () Bool)

(assert (=> b!1439837 m!1328951))

(declare-fun m!1328953 () Bool)

(assert (=> b!1439837 m!1328953))

(assert (=> b!1439837 m!1328953))

(declare-fun m!1328955 () Bool)

(assert (=> b!1439837 m!1328955))

(declare-fun m!1328957 () Bool)

(assert (=> start!124446 m!1328957))

(declare-fun m!1328959 () Bool)

(assert (=> start!124446 m!1328959))

(declare-fun m!1328961 () Bool)

(assert (=> b!1439834 m!1328961))

(assert (=> b!1439834 m!1328961))

(declare-fun m!1328963 () Bool)

(assert (=> b!1439834 m!1328963))

(assert (=> b!1439834 m!1328963))

(assert (=> b!1439834 m!1328961))

(declare-fun m!1328965 () Bool)

(assert (=> b!1439834 m!1328965))

(assert (=> b!1439840 m!1328951))

(declare-fun m!1328967 () Bool)

(assert (=> b!1439840 m!1328967))

(assert (=> b!1439842 m!1328951))

(assert (=> b!1439842 m!1328953))

(assert (=> b!1439842 m!1328953))

(declare-fun m!1328969 () Bool)

(assert (=> b!1439842 m!1328969))

(assert (=> b!1439842 m!1328969))

(assert (=> b!1439842 m!1328953))

(declare-fun m!1328971 () Bool)

(assert (=> b!1439842 m!1328971))

(declare-fun m!1328973 () Bool)

(assert (=> b!1439843 m!1328973))

(declare-fun m!1328975 () Bool)

(assert (=> b!1439841 m!1328975))

(assert (=> b!1439841 m!1328975))

(declare-fun m!1328977 () Bool)

(assert (=> b!1439841 m!1328977))

(declare-fun m!1328979 () Bool)

(assert (=> b!1439836 m!1328979))

(assert (=> b!1439835 m!1328961))

(assert (=> b!1439835 m!1328961))

(declare-fun m!1328981 () Bool)

(assert (=> b!1439835 m!1328981))

(assert (=> b!1439838 m!1328961))

(assert (=> b!1439838 m!1328961))

(declare-fun m!1328983 () Bool)

(assert (=> b!1439838 m!1328983))

(check-sat (not b!1439837) (not b!1439838) (not b!1439836) (not b!1439834) (not b!1439843) (not b!1439835) (not start!124446) (not b!1439842) (not b!1439841))
(check-sat)
