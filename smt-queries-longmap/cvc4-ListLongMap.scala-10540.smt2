; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124340 () Bool)

(assert start!124340)

(declare-fun res!971240 () Bool)

(declare-fun e!811551 () Bool)

(assert (=> start!124340 (=> (not res!971240) (not e!811551))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124340 (= res!971240 (validMask!0 mask!2687))))

(assert (=> start!124340 e!811551))

(assert (=> start!124340 true))

(declare-datatypes ((array!97827 0))(
  ( (array!97828 (arr!47203 (Array (_ BitVec 32) (_ BitVec 64))) (size!47753 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97827)

(declare-fun array_inv!36231 (array!97827) Bool)

(assert (=> start!124340 (array_inv!36231 a!2862)))

(declare-fun b!1438690 () Bool)

(declare-fun e!811552 () Bool)

(assert (=> b!1438690 (= e!811552 false)))

(declare-datatypes ((SeekEntryResult!11455 0))(
  ( (MissingZero!11455 (index!48212 (_ BitVec 32))) (Found!11455 (index!48213 (_ BitVec 32))) (Intermediate!11455 (undefined!12267 Bool) (index!48214 (_ BitVec 32)) (x!129946 (_ BitVec 32))) (Undefined!11455) (MissingVacant!11455 (index!48215 (_ BitVec 32))) )
))
(declare-fun lt!632634 () SeekEntryResult!11455)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97827 (_ BitVec 32)) SeekEntryResult!11455)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438690 (= lt!632634 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47203 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47203 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97828 (store (arr!47203 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47753 a!2862)) mask!2687))))

(declare-fun b!1438691 () Bool)

(declare-fun res!971246 () Bool)

(assert (=> b!1438691 (=> (not res!971246) (not e!811551))))

(declare-datatypes ((List!33704 0))(
  ( (Nil!33701) (Cons!33700 (h!35047 (_ BitVec 64)) (t!48398 List!33704)) )
))
(declare-fun arrayNoDuplicates!0 (array!97827 (_ BitVec 32) List!33704) Bool)

(assert (=> b!1438691 (= res!971246 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33701))))

(declare-fun b!1438692 () Bool)

(declare-fun res!971243 () Bool)

(assert (=> b!1438692 (=> (not res!971243) (not e!811551))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97827 (_ BitVec 32)) Bool)

(assert (=> b!1438692 (= res!971243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438693 () Bool)

(assert (=> b!1438693 (= e!811551 e!811552)))

(declare-fun res!971248 () Bool)

(assert (=> b!1438693 (=> (not res!971248) (not e!811552))))

(declare-fun lt!632633 () SeekEntryResult!11455)

(assert (=> b!1438693 (= res!971248 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47203 a!2862) j!93) mask!2687) (select (arr!47203 a!2862) j!93) a!2862 mask!2687) lt!632633))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1438693 (= lt!632633 (Intermediate!11455 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438694 () Bool)

(declare-fun res!971247 () Bool)

(assert (=> b!1438694 (=> (not res!971247) (not e!811552))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1438694 (= res!971247 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47203 a!2862) j!93) a!2862 mask!2687) lt!632633))))

(declare-fun b!1438695 () Bool)

(declare-fun res!971245 () Bool)

(assert (=> b!1438695 (=> (not res!971245) (not e!811551))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438695 (= res!971245 (validKeyInArray!0 (select (arr!47203 a!2862) i!1006)))))

(declare-fun b!1438696 () Bool)

(declare-fun res!971244 () Bool)

(assert (=> b!1438696 (=> (not res!971244) (not e!811551))))

(assert (=> b!1438696 (= res!971244 (validKeyInArray!0 (select (arr!47203 a!2862) j!93)))))

(declare-fun b!1438697 () Bool)

(declare-fun res!971241 () Bool)

(assert (=> b!1438697 (=> (not res!971241) (not e!811551))))

(assert (=> b!1438697 (= res!971241 (and (= (size!47753 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47753 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47753 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438698 () Bool)

(declare-fun res!971242 () Bool)

(assert (=> b!1438698 (=> (not res!971242) (not e!811551))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1438698 (= res!971242 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47753 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47753 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47753 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47203 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124340 res!971240) b!1438697))

(assert (= (and b!1438697 res!971241) b!1438695))

(assert (= (and b!1438695 res!971245) b!1438696))

(assert (= (and b!1438696 res!971244) b!1438692))

(assert (= (and b!1438692 res!971243) b!1438691))

(assert (= (and b!1438691 res!971246) b!1438698))

(assert (= (and b!1438698 res!971242) b!1438693))

(assert (= (and b!1438693 res!971248) b!1438694))

(assert (= (and b!1438694 res!971247) b!1438690))

(declare-fun m!1327799 () Bool)

(assert (=> start!124340 m!1327799))

(declare-fun m!1327801 () Bool)

(assert (=> start!124340 m!1327801))

(declare-fun m!1327803 () Bool)

(assert (=> b!1438696 m!1327803))

(assert (=> b!1438696 m!1327803))

(declare-fun m!1327805 () Bool)

(assert (=> b!1438696 m!1327805))

(declare-fun m!1327807 () Bool)

(assert (=> b!1438692 m!1327807))

(assert (=> b!1438694 m!1327803))

(assert (=> b!1438694 m!1327803))

(declare-fun m!1327809 () Bool)

(assert (=> b!1438694 m!1327809))

(declare-fun m!1327811 () Bool)

(assert (=> b!1438690 m!1327811))

(declare-fun m!1327813 () Bool)

(assert (=> b!1438690 m!1327813))

(assert (=> b!1438690 m!1327813))

(declare-fun m!1327815 () Bool)

(assert (=> b!1438690 m!1327815))

(assert (=> b!1438690 m!1327815))

(assert (=> b!1438690 m!1327813))

(declare-fun m!1327817 () Bool)

(assert (=> b!1438690 m!1327817))

(declare-fun m!1327819 () Bool)

(assert (=> b!1438695 m!1327819))

(assert (=> b!1438695 m!1327819))

(declare-fun m!1327821 () Bool)

(assert (=> b!1438695 m!1327821))

(assert (=> b!1438693 m!1327803))

(assert (=> b!1438693 m!1327803))

(declare-fun m!1327823 () Bool)

(assert (=> b!1438693 m!1327823))

(assert (=> b!1438693 m!1327823))

(assert (=> b!1438693 m!1327803))

(declare-fun m!1327825 () Bool)

(assert (=> b!1438693 m!1327825))

(declare-fun m!1327827 () Bool)

(assert (=> b!1438691 m!1327827))

(assert (=> b!1438698 m!1327811))

(declare-fun m!1327829 () Bool)

(assert (=> b!1438698 m!1327829))

(push 1)

(assert (not b!1438696))

(assert (not start!124340))

(assert (not b!1438692))

