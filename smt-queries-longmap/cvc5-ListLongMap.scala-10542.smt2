; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124348 () Bool)

(assert start!124348)

(declare-fun b!1438807 () Bool)

(declare-fun res!971359 () Bool)

(declare-fun e!811588 () Bool)

(assert (=> b!1438807 (=> (not res!971359) (not e!811588))))

(declare-datatypes ((array!97835 0))(
  ( (array!97836 (arr!47207 (Array (_ BitVec 32) (_ BitVec 64))) (size!47757 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97835)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97835 (_ BitVec 32)) Bool)

(assert (=> b!1438807 (= res!971359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438808 () Bool)

(declare-fun res!971362 () Bool)

(assert (=> b!1438808 (=> (not res!971362) (not e!811588))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1438808 (= res!971362 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47757 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47757 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47757 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47207 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438809 () Bool)

(declare-fun e!811589 () Bool)

(assert (=> b!1438809 (= e!811589 false)))

(declare-datatypes ((SeekEntryResult!11459 0))(
  ( (MissingZero!11459 (index!48228 (_ BitVec 32))) (Found!11459 (index!48229 (_ BitVec 32))) (Intermediate!11459 (undefined!12271 Bool) (index!48230 (_ BitVec 32)) (x!129966 (_ BitVec 32))) (Undefined!11459) (MissingVacant!11459 (index!48231 (_ BitVec 32))) )
))
(declare-fun lt!632648 () SeekEntryResult!11459)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97835 (_ BitVec 32)) SeekEntryResult!11459)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438809 (= lt!632648 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47207 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47207 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97836 (store (arr!47207 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47757 a!2862)) mask!2687))))

(declare-fun b!1438810 () Bool)

(declare-fun res!971364 () Bool)

(assert (=> b!1438810 (=> (not res!971364) (not e!811589))))

(declare-fun lt!632649 () SeekEntryResult!11459)

(assert (=> b!1438810 (= res!971364 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47207 a!2862) j!93) a!2862 mask!2687) lt!632649))))

(declare-fun res!971360 () Bool)

(assert (=> start!124348 (=> (not res!971360) (not e!811588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124348 (= res!971360 (validMask!0 mask!2687))))

(assert (=> start!124348 e!811588))

(assert (=> start!124348 true))

(declare-fun array_inv!36235 (array!97835) Bool)

(assert (=> start!124348 (array_inv!36235 a!2862)))

(declare-fun b!1438811 () Bool)

(declare-fun res!971363 () Bool)

(assert (=> b!1438811 (=> (not res!971363) (not e!811588))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438811 (= res!971363 (validKeyInArray!0 (select (arr!47207 a!2862) j!93)))))

(declare-fun b!1438812 () Bool)

(declare-fun res!971365 () Bool)

(assert (=> b!1438812 (=> (not res!971365) (not e!811588))))

(assert (=> b!1438812 (= res!971365 (and (= (size!47757 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47757 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47757 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438813 () Bool)

(assert (=> b!1438813 (= e!811588 e!811589)))

(declare-fun res!971361 () Bool)

(assert (=> b!1438813 (=> (not res!971361) (not e!811589))))

(assert (=> b!1438813 (= res!971361 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47207 a!2862) j!93) mask!2687) (select (arr!47207 a!2862) j!93) a!2862 mask!2687) lt!632649))))

(assert (=> b!1438813 (= lt!632649 (Intermediate!11459 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438814 () Bool)

(declare-fun res!971357 () Bool)

(assert (=> b!1438814 (=> (not res!971357) (not e!811588))))

(assert (=> b!1438814 (= res!971357 (validKeyInArray!0 (select (arr!47207 a!2862) i!1006)))))

(declare-fun b!1438815 () Bool)

(declare-fun res!971358 () Bool)

(assert (=> b!1438815 (=> (not res!971358) (not e!811588))))

(declare-datatypes ((List!33708 0))(
  ( (Nil!33705) (Cons!33704 (h!35051 (_ BitVec 64)) (t!48402 List!33708)) )
))
(declare-fun arrayNoDuplicates!0 (array!97835 (_ BitVec 32) List!33708) Bool)

(assert (=> b!1438815 (= res!971358 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33705))))

(assert (= (and start!124348 res!971360) b!1438812))

(assert (= (and b!1438812 res!971365) b!1438814))

(assert (= (and b!1438814 res!971357) b!1438811))

(assert (= (and b!1438811 res!971363) b!1438807))

(assert (= (and b!1438807 res!971359) b!1438815))

(assert (= (and b!1438815 res!971358) b!1438808))

(assert (= (and b!1438808 res!971362) b!1438813))

(assert (= (and b!1438813 res!971361) b!1438810))

(assert (= (and b!1438810 res!971364) b!1438809))

(declare-fun m!1327927 () Bool)

(assert (=> b!1438811 m!1327927))

(assert (=> b!1438811 m!1327927))

(declare-fun m!1327929 () Bool)

(assert (=> b!1438811 m!1327929))

(assert (=> b!1438810 m!1327927))

(assert (=> b!1438810 m!1327927))

(declare-fun m!1327931 () Bool)

(assert (=> b!1438810 m!1327931))

(declare-fun m!1327933 () Bool)

(assert (=> b!1438815 m!1327933))

(declare-fun m!1327935 () Bool)

(assert (=> b!1438809 m!1327935))

(declare-fun m!1327937 () Bool)

(assert (=> b!1438809 m!1327937))

(assert (=> b!1438809 m!1327937))

(declare-fun m!1327939 () Bool)

(assert (=> b!1438809 m!1327939))

(assert (=> b!1438809 m!1327939))

(assert (=> b!1438809 m!1327937))

(declare-fun m!1327941 () Bool)

(assert (=> b!1438809 m!1327941))

(assert (=> b!1438813 m!1327927))

(assert (=> b!1438813 m!1327927))

(declare-fun m!1327943 () Bool)

(assert (=> b!1438813 m!1327943))

(assert (=> b!1438813 m!1327943))

(assert (=> b!1438813 m!1327927))

(declare-fun m!1327945 () Bool)

(assert (=> b!1438813 m!1327945))

(assert (=> b!1438808 m!1327935))

(declare-fun m!1327947 () Bool)

(assert (=> b!1438808 m!1327947))

(declare-fun m!1327949 () Bool)

(assert (=> b!1438807 m!1327949))

(declare-fun m!1327951 () Bool)

(assert (=> start!124348 m!1327951))

(declare-fun m!1327953 () Bool)

(assert (=> start!124348 m!1327953))

(declare-fun m!1327955 () Bool)

(assert (=> b!1438814 m!1327955))

(assert (=> b!1438814 m!1327955))

(declare-fun m!1327957 () Bool)

(assert (=> b!1438814 m!1327957))

(push 1)

