; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124028 () Bool)

(assert start!124028)

(declare-fun b!1436319 () Bool)

(declare-fun res!969356 () Bool)

(declare-fun e!810522 () Bool)

(assert (=> b!1436319 (=> (not res!969356) (not e!810522))))

(declare-datatypes ((array!97643 0))(
  ( (array!97644 (arr!47118 (Array (_ BitVec 32) (_ BitVec 64))) (size!47670 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97643)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436319 (= res!969356 (validKeyInArray!0 (select (arr!47118 a!2862) j!93)))))

(declare-fun b!1436320 () Bool)

(declare-fun res!969353 () Bool)

(assert (=> b!1436320 (=> (not res!969353) (not e!810522))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1436320 (= res!969353 (validKeyInArray!0 (select (arr!47118 a!2862) i!1006)))))

(declare-fun b!1436321 () Bool)

(declare-fun res!969352 () Bool)

(assert (=> b!1436321 (=> (not res!969352) (not e!810522))))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1436321 (= res!969352 (and (= (size!47670 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47670 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47670 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436322 () Bool)

(assert (=> b!1436322 (= e!810522 false)))

(declare-fun lt!631905 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436322 (= lt!631905 (toIndex!0 (select (arr!47118 a!2862) j!93) mask!2687))))

(declare-fun res!969355 () Bool)

(assert (=> start!124028 (=> (not res!969355) (not e!810522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124028 (= res!969355 (validMask!0 mask!2687))))

(assert (=> start!124028 e!810522))

(assert (=> start!124028 true))

(declare-fun array_inv!36351 (array!97643) Bool)

(assert (=> start!124028 (array_inv!36351 a!2862)))

(declare-fun b!1436323 () Bool)

(declare-fun res!969358 () Bool)

(assert (=> b!1436323 (=> (not res!969358) (not e!810522))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1436323 (= res!969358 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47670 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47670 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47670 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47118 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436324 () Bool)

(declare-fun res!969354 () Bool)

(assert (=> b!1436324 (=> (not res!969354) (not e!810522))))

(declare-datatypes ((List!33697 0))(
  ( (Nil!33694) (Cons!33693 (h!35028 (_ BitVec 64)) (t!48383 List!33697)) )
))
(declare-fun arrayNoDuplicates!0 (array!97643 (_ BitVec 32) List!33697) Bool)

(assert (=> b!1436324 (= res!969354 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33694))))

(declare-fun b!1436325 () Bool)

(declare-fun res!969357 () Bool)

(assert (=> b!1436325 (=> (not res!969357) (not e!810522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97643 (_ BitVec 32)) Bool)

(assert (=> b!1436325 (= res!969357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124028 res!969355) b!1436321))

(assert (= (and b!1436321 res!969352) b!1436320))

(assert (= (and b!1436320 res!969353) b!1436319))

(assert (= (and b!1436319 res!969356) b!1436325))

(assert (= (and b!1436325 res!969357) b!1436324))

(assert (= (and b!1436324 res!969354) b!1436323))

(assert (= (and b!1436323 res!969358) b!1436322))

(declare-fun m!1325153 () Bool)

(assert (=> b!1436325 m!1325153))

(declare-fun m!1325155 () Bool)

(assert (=> b!1436320 m!1325155))

(assert (=> b!1436320 m!1325155))

(declare-fun m!1325157 () Bool)

(assert (=> b!1436320 m!1325157))

(declare-fun m!1325159 () Bool)

(assert (=> b!1436319 m!1325159))

(assert (=> b!1436319 m!1325159))

(declare-fun m!1325161 () Bool)

(assert (=> b!1436319 m!1325161))

(declare-fun m!1325163 () Bool)

(assert (=> b!1436323 m!1325163))

(declare-fun m!1325165 () Bool)

(assert (=> b!1436323 m!1325165))

(declare-fun m!1325167 () Bool)

(assert (=> start!124028 m!1325167))

(declare-fun m!1325169 () Bool)

(assert (=> start!124028 m!1325169))

(assert (=> b!1436322 m!1325159))

(assert (=> b!1436322 m!1325159))

(declare-fun m!1325171 () Bool)

(assert (=> b!1436322 m!1325171))

(declare-fun m!1325173 () Bool)

(assert (=> b!1436324 m!1325173))

(push 1)

(assert (not b!1436324))

(assert (not b!1436325))

(assert (not b!1436322))

(assert (not b!1436319))

(assert (not start!124028))

(assert (not b!1436320))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

