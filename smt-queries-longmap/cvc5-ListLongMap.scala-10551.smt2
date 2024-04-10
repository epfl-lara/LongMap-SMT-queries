; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124444 () Bool)

(assert start!124444)

(declare-fun b!1439801 () Bool)

(declare-fun res!972236 () Bool)

(declare-fun e!811986 () Bool)

(assert (=> b!1439801 (=> (not res!972236) (not e!811986))))

(declare-datatypes ((SeekEntryResult!11486 0))(
  ( (MissingZero!11486 (index!48336 (_ BitVec 32))) (Found!11486 (index!48337 (_ BitVec 32))) (Intermediate!11486 (undefined!12298 Bool) (index!48338 (_ BitVec 32)) (x!130071 (_ BitVec 32))) (Undefined!11486) (MissingVacant!11486 (index!48339 (_ BitVec 32))) )
))
(declare-fun lt!632871 () SeekEntryResult!11486)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!97892 0))(
  ( (array!97893 (arr!47234 (Array (_ BitVec 32) (_ BitVec 64))) (size!47784 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97892)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97892 (_ BitVec 32)) SeekEntryResult!11486)

(assert (=> b!1439801 (= res!972236 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47234 a!2862) j!93) a!2862 mask!2687) lt!632871))))

(declare-fun b!1439802 () Bool)

(declare-fun e!811987 () Bool)

(assert (=> b!1439802 (= e!811987 e!811986)))

(declare-fun res!972234 () Bool)

(assert (=> b!1439802 (=> (not res!972234) (not e!811986))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439802 (= res!972234 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47234 a!2862) j!93) mask!2687) (select (arr!47234 a!2862) j!93) a!2862 mask!2687) lt!632871))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1439802 (= lt!632871 (Intermediate!11486 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439803 () Bool)

(declare-fun res!972232 () Bool)

(assert (=> b!1439803 (=> (not res!972232) (not e!811987))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97892 (_ BitVec 32)) Bool)

(assert (=> b!1439803 (= res!972232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439804 () Bool)

(declare-fun res!972237 () Bool)

(assert (=> b!1439804 (=> (not res!972237) (not e!811987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439804 (= res!972237 (validKeyInArray!0 (select (arr!47234 a!2862) j!93)))))

(declare-fun b!1439805 () Bool)

(declare-fun res!972235 () Bool)

(assert (=> b!1439805 (=> (not res!972235) (not e!811986))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1439805 (= res!972235 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47234 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47234 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97893 (store (arr!47234 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47784 a!2862)) mask!2687) (Intermediate!11486 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1439806 () Bool)

(declare-fun res!972230 () Bool)

(assert (=> b!1439806 (=> (not res!972230) (not e!811987))))

(assert (=> b!1439806 (= res!972230 (validKeyInArray!0 (select (arr!47234 a!2862) i!1006)))))

(declare-fun b!1439807 () Bool)

(assert (=> b!1439807 (= e!811986 (not (validKeyInArray!0 (select (store (arr!47234 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))))

(declare-fun b!1439808 () Bool)

(declare-fun res!972229 () Bool)

(assert (=> b!1439808 (=> (not res!972229) (not e!811986))))

(assert (=> b!1439808 (= res!972229 (and (bvsle x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1439809 () Bool)

(declare-fun res!972231 () Bool)

(assert (=> b!1439809 (=> (not res!972231) (not e!811987))))

(assert (=> b!1439809 (= res!972231 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47784 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47784 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47784 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47234 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!972228 () Bool)

(assert (=> start!124444 (=> (not res!972228) (not e!811987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124444 (= res!972228 (validMask!0 mask!2687))))

(assert (=> start!124444 e!811987))

(assert (=> start!124444 true))

(declare-fun array_inv!36262 (array!97892) Bool)

(assert (=> start!124444 (array_inv!36262 a!2862)))

(declare-fun b!1439810 () Bool)

(declare-fun res!972238 () Bool)

(assert (=> b!1439810 (=> (not res!972238) (not e!811987))))

(declare-datatypes ((List!33735 0))(
  ( (Nil!33732) (Cons!33731 (h!35081 (_ BitVec 64)) (t!48429 List!33735)) )
))
(declare-fun arrayNoDuplicates!0 (array!97892 (_ BitVec 32) List!33735) Bool)

(assert (=> b!1439810 (= res!972238 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33732))))

(declare-fun b!1439811 () Bool)

(declare-fun res!972233 () Bool)

(assert (=> b!1439811 (=> (not res!972233) (not e!811987))))

(assert (=> b!1439811 (= res!972233 (and (= (size!47784 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47784 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47784 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124444 res!972228) b!1439811))

(assert (= (and b!1439811 res!972233) b!1439806))

(assert (= (and b!1439806 res!972230) b!1439804))

(assert (= (and b!1439804 res!972237) b!1439803))

(assert (= (and b!1439803 res!972232) b!1439810))

(assert (= (and b!1439810 res!972238) b!1439809))

(assert (= (and b!1439809 res!972231) b!1439802))

(assert (= (and b!1439802 res!972234) b!1439801))

(assert (= (and b!1439801 res!972236) b!1439805))

(assert (= (and b!1439805 res!972235) b!1439808))

(assert (= (and b!1439808 res!972229) b!1439807))

(declare-fun m!1328917 () Bool)

(assert (=> b!1439805 m!1328917))

(declare-fun m!1328919 () Bool)

(assert (=> b!1439805 m!1328919))

(assert (=> b!1439805 m!1328919))

(declare-fun m!1328921 () Bool)

(assert (=> b!1439805 m!1328921))

(assert (=> b!1439805 m!1328921))

(assert (=> b!1439805 m!1328919))

(declare-fun m!1328923 () Bool)

(assert (=> b!1439805 m!1328923))

(declare-fun m!1328925 () Bool)

(assert (=> b!1439810 m!1328925))

(declare-fun m!1328927 () Bool)

(assert (=> b!1439801 m!1328927))

(assert (=> b!1439801 m!1328927))

(declare-fun m!1328929 () Bool)

(assert (=> b!1439801 m!1328929))

(assert (=> b!1439802 m!1328927))

(assert (=> b!1439802 m!1328927))

(declare-fun m!1328931 () Bool)

(assert (=> b!1439802 m!1328931))

(assert (=> b!1439802 m!1328931))

(assert (=> b!1439802 m!1328927))

(declare-fun m!1328933 () Bool)

(assert (=> b!1439802 m!1328933))

(assert (=> b!1439807 m!1328917))

(assert (=> b!1439807 m!1328919))

(assert (=> b!1439807 m!1328919))

(declare-fun m!1328935 () Bool)

(assert (=> b!1439807 m!1328935))

(declare-fun m!1328937 () Bool)

(assert (=> b!1439803 m!1328937))

(declare-fun m!1328939 () Bool)

(assert (=> start!124444 m!1328939))

(declare-fun m!1328941 () Bool)

(assert (=> start!124444 m!1328941))

(assert (=> b!1439809 m!1328917))

(declare-fun m!1328943 () Bool)

(assert (=> b!1439809 m!1328943))

(declare-fun m!1328945 () Bool)

(assert (=> b!1439806 m!1328945))

(assert (=> b!1439806 m!1328945))

(declare-fun m!1328947 () Bool)

(assert (=> b!1439806 m!1328947))

(assert (=> b!1439804 m!1328927))

(assert (=> b!1439804 m!1328927))

(declare-fun m!1328949 () Bool)

(assert (=> b!1439804 m!1328949))

(push 1)

