; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124360 () Bool)

(assert start!124360)

(declare-fun b!1438444 () Bool)

(declare-fun res!970508 () Bool)

(declare-fun e!811682 () Bool)

(assert (=> b!1438444 (=> (not res!970508) (not e!811682))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97859 0))(
  ( (array!97860 (arr!47220 (Array (_ BitVec 32) (_ BitVec 64))) (size!47771 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97859)

(assert (=> b!1438444 (= res!970508 (and (= (size!47771 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47771 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47771 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438445 () Bool)

(declare-fun res!970504 () Bool)

(assert (=> b!1438445 (=> (not res!970504) (not e!811682))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438445 (= res!970504 (validKeyInArray!0 (select (arr!47220 a!2862) i!1006)))))

(declare-fun res!970506 () Bool)

(assert (=> start!124360 (=> (not res!970506) (not e!811682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124360 (= res!970506 (validMask!0 mask!2687))))

(assert (=> start!124360 e!811682))

(assert (=> start!124360 true))

(declare-fun array_inv!36501 (array!97859) Bool)

(assert (=> start!124360 (array_inv!36501 a!2862)))

(declare-fun b!1438446 () Bool)

(declare-fun res!970503 () Bool)

(assert (=> b!1438446 (=> (not res!970503) (not e!811682))))

(assert (=> b!1438446 (= res!970503 (validKeyInArray!0 (select (arr!47220 a!2862) j!93)))))

(declare-fun b!1438447 () Bool)

(assert (=> b!1438447 (= e!811682 false)))

(declare-datatypes ((SeekEntryResult!11369 0))(
  ( (MissingZero!11369 (index!47868 (_ BitVec 32))) (Found!11369 (index!47869 (_ BitVec 32))) (Intermediate!11369 (undefined!12181 Bool) (index!47870 (_ BitVec 32)) (x!129770 (_ BitVec 32))) (Undefined!11369) (MissingVacant!11369 (index!47871 (_ BitVec 32))) )
))
(declare-fun lt!632716 () SeekEntryResult!11369)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97859 (_ BitVec 32)) SeekEntryResult!11369)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438447 (= lt!632716 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47220 a!2862) j!93) mask!2687) (select (arr!47220 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1438448 () Bool)

(declare-fun res!970502 () Bool)

(assert (=> b!1438448 (=> (not res!970502) (not e!811682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97859 (_ BitVec 32)) Bool)

(assert (=> b!1438448 (= res!970502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438449 () Bool)

(declare-fun res!970507 () Bool)

(assert (=> b!1438449 (=> (not res!970507) (not e!811682))))

(declare-datatypes ((List!33708 0))(
  ( (Nil!33705) (Cons!33704 (h!35053 (_ BitVec 64)) (t!48394 List!33708)) )
))
(declare-fun arrayNoDuplicates!0 (array!97859 (_ BitVec 32) List!33708) Bool)

(assert (=> b!1438449 (= res!970507 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33705))))

(declare-fun b!1438450 () Bool)

(declare-fun res!970505 () Bool)

(assert (=> b!1438450 (=> (not res!970505) (not e!811682))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1438450 (= res!970505 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47771 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47771 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47771 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47220 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124360 res!970506) b!1438444))

(assert (= (and b!1438444 res!970508) b!1438445))

(assert (= (and b!1438445 res!970504) b!1438446))

(assert (= (and b!1438446 res!970503) b!1438448))

(assert (= (and b!1438448 res!970502) b!1438449))

(assert (= (and b!1438449 res!970507) b!1438450))

(assert (= (and b!1438450 res!970505) b!1438447))

(declare-fun m!1327873 () Bool)

(assert (=> b!1438450 m!1327873))

(declare-fun m!1327875 () Bool)

(assert (=> b!1438450 m!1327875))

(declare-fun m!1327877 () Bool)

(assert (=> b!1438447 m!1327877))

(assert (=> b!1438447 m!1327877))

(declare-fun m!1327879 () Bool)

(assert (=> b!1438447 m!1327879))

(assert (=> b!1438447 m!1327879))

(assert (=> b!1438447 m!1327877))

(declare-fun m!1327881 () Bool)

(assert (=> b!1438447 m!1327881))

(declare-fun m!1327883 () Bool)

(assert (=> b!1438449 m!1327883))

(declare-fun m!1327885 () Bool)

(assert (=> start!124360 m!1327885))

(declare-fun m!1327887 () Bool)

(assert (=> start!124360 m!1327887))

(declare-fun m!1327889 () Bool)

(assert (=> b!1438445 m!1327889))

(assert (=> b!1438445 m!1327889))

(declare-fun m!1327891 () Bool)

(assert (=> b!1438445 m!1327891))

(declare-fun m!1327893 () Bool)

(assert (=> b!1438448 m!1327893))

(assert (=> b!1438446 m!1327877))

(assert (=> b!1438446 m!1327877))

(declare-fun m!1327895 () Bool)

(assert (=> b!1438446 m!1327895))

(push 1)

(assert (not b!1438449))

(assert (not b!1438446))

(assert (not b!1438448))

(assert (not b!1438445))

(assert (not b!1438447))

(assert (not start!124360))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

