; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124118 () Bool)

(assert start!124118)

(declare-fun b!1436985 () Bool)

(declare-fun res!969986 () Bool)

(declare-fun e!810746 () Bool)

(assert (=> b!1436985 (=> (not res!969986) (not e!810746))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97700 0))(
  ( (array!97701 (arr!47145 (Array (_ BitVec 32) (_ BitVec 64))) (size!47697 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97700)

(assert (=> b!1436985 (= res!969986 (and (= (size!47697 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47697 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47697 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436986 () Bool)

(declare-fun res!969988 () Bool)

(assert (=> b!1436986 (=> (not res!969988) (not e!810746))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436986 (= res!969988 (validKeyInArray!0 (select (arr!47145 a!2862) i!1006)))))

(declare-fun b!1436987 () Bool)

(assert (=> b!1436987 (= e!810746 false)))

(declare-datatypes ((SeekEntryResult!11422 0))(
  ( (MissingZero!11422 (index!48080 (_ BitVec 32))) (Found!11422 (index!48081 (_ BitVec 32))) (Intermediate!11422 (undefined!12234 Bool) (index!48082 (_ BitVec 32)) (x!129802 (_ BitVec 32))) (Undefined!11422) (MissingVacant!11422 (index!48083 (_ BitVec 32))) )
))
(declare-fun lt!632013 () SeekEntryResult!11422)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97700 (_ BitVec 32)) SeekEntryResult!11422)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436987 (= lt!632013 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47145 a!2862) j!93) mask!2687) (select (arr!47145 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1436989 () Bool)

(declare-fun res!969989 () Bool)

(assert (=> b!1436989 (=> (not res!969989) (not e!810746))))

(assert (=> b!1436989 (= res!969989 (validKeyInArray!0 (select (arr!47145 a!2862) j!93)))))

(declare-fun res!969991 () Bool)

(assert (=> start!124118 (=> (not res!969991) (not e!810746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124118 (= res!969991 (validMask!0 mask!2687))))

(assert (=> start!124118 e!810746))

(assert (=> start!124118 true))

(declare-fun array_inv!36378 (array!97700) Bool)

(assert (=> start!124118 (array_inv!36378 a!2862)))

(declare-fun b!1436988 () Bool)

(declare-fun res!969990 () Bool)

(assert (=> b!1436988 (=> (not res!969990) (not e!810746))))

(declare-datatypes ((List!33724 0))(
  ( (Nil!33721) (Cons!33720 (h!35058 (_ BitVec 64)) (t!48410 List!33724)) )
))
(declare-fun arrayNoDuplicates!0 (array!97700 (_ BitVec 32) List!33724) Bool)

(assert (=> b!1436988 (= res!969990 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33721))))

(declare-fun b!1436990 () Bool)

(declare-fun res!969987 () Bool)

(assert (=> b!1436990 (=> (not res!969987) (not e!810746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97700 (_ BitVec 32)) Bool)

(assert (=> b!1436990 (= res!969987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436991 () Bool)

(declare-fun res!969985 () Bool)

(assert (=> b!1436991 (=> (not res!969985) (not e!810746))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1436991 (= res!969985 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47697 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47697 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47697 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47145 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124118 res!969991) b!1436985))

(assert (= (and b!1436985 res!969986) b!1436986))

(assert (= (and b!1436986 res!969988) b!1436989))

(assert (= (and b!1436989 res!969989) b!1436990))

(assert (= (and b!1436990 res!969987) b!1436988))

(assert (= (and b!1436988 res!969990) b!1436991))

(assert (= (and b!1436991 res!969985) b!1436987))

(declare-fun m!1325829 () Bool)

(assert (=> b!1436986 m!1325829))

(assert (=> b!1436986 m!1325829))

(declare-fun m!1325831 () Bool)

(assert (=> b!1436986 m!1325831))

(declare-fun m!1325833 () Bool)

(assert (=> b!1436990 m!1325833))

(declare-fun m!1325835 () Bool)

(assert (=> b!1436989 m!1325835))

(assert (=> b!1436989 m!1325835))

(declare-fun m!1325837 () Bool)

(assert (=> b!1436989 m!1325837))

(declare-fun m!1325839 () Bool)

(assert (=> b!1436991 m!1325839))

(declare-fun m!1325841 () Bool)

(assert (=> b!1436991 m!1325841))

(declare-fun m!1325843 () Bool)

(assert (=> start!124118 m!1325843))

(declare-fun m!1325845 () Bool)

(assert (=> start!124118 m!1325845))

(declare-fun m!1325847 () Bool)

(assert (=> b!1436988 m!1325847))

(assert (=> b!1436987 m!1325835))

(assert (=> b!1436987 m!1325835))

(declare-fun m!1325849 () Bool)

(assert (=> b!1436987 m!1325849))

(assert (=> b!1436987 m!1325849))

(assert (=> b!1436987 m!1325835))

(declare-fun m!1325851 () Bool)

(assert (=> b!1436987 m!1325851))

(push 1)

(assert (not b!1436989))

(assert (not start!124118))

(assert (not b!1436986))

(assert (not b!1436988))

(assert (not b!1436990))

(assert (not b!1436987))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

