; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125714 () Bool)

(assert start!125714)

(declare-fun b!1469187 () Bool)

(declare-fun res!996629 () Bool)

(declare-fun e!825348 () Bool)

(assert (=> b!1469187 (=> (not res!996629) (not e!825348))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99000 0))(
  ( (array!99001 (arr!47783 (Array (_ BitVec 32) (_ BitVec 64))) (size!48334 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99000)

(assert (=> b!1469187 (= res!996629 (and (= (size!48334 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48334 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48334 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469188 () Bool)

(declare-fun res!996628 () Bool)

(assert (=> b!1469188 (=> (not res!996628) (not e!825348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99000 (_ BitVec 32)) Bool)

(assert (=> b!1469188 (= res!996628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469189 () Bool)

(assert (=> b!1469189 (= e!825348 false)))

(declare-fun lt!642745 () Bool)

(declare-datatypes ((List!34271 0))(
  ( (Nil!34268) (Cons!34267 (h!35631 (_ BitVec 64)) (t!48957 List!34271)) )
))
(declare-fun arrayNoDuplicates!0 (array!99000 (_ BitVec 32) List!34271) Bool)

(assert (=> b!1469189 (= lt!642745 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34268))))

(declare-fun b!1469190 () Bool)

(declare-fun res!996631 () Bool)

(assert (=> b!1469190 (=> (not res!996631) (not e!825348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469190 (= res!996631 (validKeyInArray!0 (select (arr!47783 a!2862) i!1006)))))

(declare-fun res!996630 () Bool)

(assert (=> start!125714 (=> (not res!996630) (not e!825348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125714 (= res!996630 (validMask!0 mask!2687))))

(assert (=> start!125714 e!825348))

(assert (=> start!125714 true))

(declare-fun array_inv!37064 (array!99000) Bool)

(assert (=> start!125714 (array_inv!37064 a!2862)))

(declare-fun b!1469191 () Bool)

(declare-fun res!996632 () Bool)

(assert (=> b!1469191 (=> (not res!996632) (not e!825348))))

(assert (=> b!1469191 (= res!996632 (validKeyInArray!0 (select (arr!47783 a!2862) j!93)))))

(assert (= (and start!125714 res!996630) b!1469187))

(assert (= (and b!1469187 res!996629) b!1469190))

(assert (= (and b!1469190 res!996631) b!1469191))

(assert (= (and b!1469191 res!996632) b!1469188))

(assert (= (and b!1469188 res!996628) b!1469189))

(declare-fun m!1356107 () Bool)

(assert (=> b!1469190 m!1356107))

(assert (=> b!1469190 m!1356107))

(declare-fun m!1356109 () Bool)

(assert (=> b!1469190 m!1356109))

(declare-fun m!1356111 () Bool)

(assert (=> start!125714 m!1356111))

(declare-fun m!1356113 () Bool)

(assert (=> start!125714 m!1356113))

(declare-fun m!1356115 () Bool)

(assert (=> b!1469191 m!1356115))

(assert (=> b!1469191 m!1356115))

(declare-fun m!1356117 () Bool)

(assert (=> b!1469191 m!1356117))

(declare-fun m!1356119 () Bool)

(assert (=> b!1469188 m!1356119))

(declare-fun m!1356121 () Bool)

(assert (=> b!1469189 m!1356121))

(push 1)

(assert (not b!1469191))

(assert (not b!1469189))

(assert (not b!1469190))

(assert (not start!125714))

(assert (not b!1469188))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

