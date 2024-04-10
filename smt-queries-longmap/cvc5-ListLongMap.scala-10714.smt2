; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125422 () Bool)

(assert start!125422)

(declare-fun b!1467374 () Bool)

(declare-fun res!995913 () Bool)

(declare-fun e!824243 () Bool)

(assert (=> b!1467374 (=> (not res!995913) (not e!824243))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98870 0))(
  ( (array!98871 (arr!47723 (Array (_ BitVec 32) (_ BitVec 64))) (size!48273 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98870)

(assert (=> b!1467374 (= res!995913 (and (= (size!48273 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48273 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48273 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467375 () Bool)

(assert (=> b!1467375 (= e!824243 false)))

(declare-fun lt!642087 () Bool)

(declare-datatypes ((List!34224 0))(
  ( (Nil!34221) (Cons!34220 (h!35570 (_ BitVec 64)) (t!48918 List!34224)) )
))
(declare-fun arrayNoDuplicates!0 (array!98870 (_ BitVec 32) List!34224) Bool)

(assert (=> b!1467375 (= lt!642087 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34221))))

(declare-fun b!1467376 () Bool)

(declare-fun res!995914 () Bool)

(assert (=> b!1467376 (=> (not res!995914) (not e!824243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98870 (_ BitVec 32)) Bool)

(assert (=> b!1467376 (= res!995914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467377 () Bool)

(declare-fun res!995917 () Bool)

(assert (=> b!1467377 (=> (not res!995917) (not e!824243))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467377 (= res!995917 (validKeyInArray!0 (select (arr!47723 a!2862) j!93)))))

(declare-fun b!1467378 () Bool)

(declare-fun res!995916 () Bool)

(assert (=> b!1467378 (=> (not res!995916) (not e!824243))))

(assert (=> b!1467378 (= res!995916 (validKeyInArray!0 (select (arr!47723 a!2862) i!1006)))))

(declare-fun res!995915 () Bool)

(assert (=> start!125422 (=> (not res!995915) (not e!824243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125422 (= res!995915 (validMask!0 mask!2687))))

(assert (=> start!125422 e!824243))

(assert (=> start!125422 true))

(declare-fun array_inv!36751 (array!98870) Bool)

(assert (=> start!125422 (array_inv!36751 a!2862)))

(assert (= (and start!125422 res!995915) b!1467374))

(assert (= (and b!1467374 res!995913) b!1467378))

(assert (= (and b!1467378 res!995916) b!1467377))

(assert (= (and b!1467377 res!995917) b!1467376))

(assert (= (and b!1467376 res!995914) b!1467375))

(declare-fun m!1354309 () Bool)

(assert (=> b!1467377 m!1354309))

(assert (=> b!1467377 m!1354309))

(declare-fun m!1354311 () Bool)

(assert (=> b!1467377 m!1354311))

(declare-fun m!1354313 () Bool)

(assert (=> b!1467378 m!1354313))

(assert (=> b!1467378 m!1354313))

(declare-fun m!1354315 () Bool)

(assert (=> b!1467378 m!1354315))

(declare-fun m!1354317 () Bool)

(assert (=> start!125422 m!1354317))

(declare-fun m!1354319 () Bool)

(assert (=> start!125422 m!1354319))

(declare-fun m!1354321 () Bool)

(assert (=> b!1467375 m!1354321))

(declare-fun m!1354323 () Bool)

(assert (=> b!1467376 m!1354323))

(push 1)

(assert (not b!1467375))

(assert (not b!1467376))

(assert (not b!1467378))

(assert (not start!125422))

(assert (not b!1467377))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

