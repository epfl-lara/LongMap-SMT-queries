; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125720 () Bool)

(assert start!125720)

(declare-fun b!1469242 () Bool)

(declare-fun res!996686 () Bool)

(declare-fun e!825365 () Bool)

(assert (=> b!1469242 (=> (not res!996686) (not e!825365))))

(declare-datatypes ((array!99006 0))(
  ( (array!99007 (arr!47786 (Array (_ BitVec 32) (_ BitVec 64))) (size!48337 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99006)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469242 (= res!996686 (validKeyInArray!0 (select (arr!47786 a!2862) i!1006)))))

(declare-fun res!996685 () Bool)

(assert (=> start!125720 (=> (not res!996685) (not e!825365))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125720 (= res!996685 (validMask!0 mask!2687))))

(assert (=> start!125720 e!825365))

(assert (=> start!125720 true))

(declare-fun array_inv!37067 (array!99006) Bool)

(assert (=> start!125720 (array_inv!37067 a!2862)))

(declare-fun b!1469243 () Bool)

(declare-fun res!996687 () Bool)

(assert (=> b!1469243 (=> (not res!996687) (not e!825365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99006 (_ BitVec 32)) Bool)

(assert (=> b!1469243 (= res!996687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469244 () Bool)

(declare-fun res!996684 () Bool)

(assert (=> b!1469244 (=> (not res!996684) (not e!825365))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1469244 (= res!996684 (and (= (size!48337 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48337 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48337 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469245 () Bool)

(assert (=> b!1469245 (= e!825365 false)))

(declare-fun lt!642754 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469245 (= lt!642754 (toIndex!0 (select (arr!47786 a!2862) j!93) mask!2687))))

(declare-fun b!1469246 () Bool)

(declare-fun res!996689 () Bool)

(assert (=> b!1469246 (=> (not res!996689) (not e!825365))))

(declare-datatypes ((List!34274 0))(
  ( (Nil!34271) (Cons!34270 (h!35634 (_ BitVec 64)) (t!48960 List!34274)) )
))
(declare-fun arrayNoDuplicates!0 (array!99006 (_ BitVec 32) List!34274) Bool)

(assert (=> b!1469246 (= res!996689 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34271))))

(declare-fun b!1469247 () Bool)

(declare-fun res!996683 () Bool)

(assert (=> b!1469247 (=> (not res!996683) (not e!825365))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1469247 (= res!996683 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48337 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48337 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48337 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47786 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1469248 () Bool)

(declare-fun res!996688 () Bool)

(assert (=> b!1469248 (=> (not res!996688) (not e!825365))))

(assert (=> b!1469248 (= res!996688 (validKeyInArray!0 (select (arr!47786 a!2862) j!93)))))

(assert (= (and start!125720 res!996685) b!1469244))

(assert (= (and b!1469244 res!996684) b!1469242))

(assert (= (and b!1469242 res!996686) b!1469248))

(assert (= (and b!1469248 res!996688) b!1469243))

(assert (= (and b!1469243 res!996687) b!1469246))

(assert (= (and b!1469246 res!996689) b!1469247))

(assert (= (and b!1469247 res!996683) b!1469245))

(declare-fun m!1356161 () Bool)

(assert (=> b!1469247 m!1356161))

(declare-fun m!1356163 () Bool)

(assert (=> b!1469247 m!1356163))

(declare-fun m!1356165 () Bool)

(assert (=> b!1469243 m!1356165))

(declare-fun m!1356167 () Bool)

(assert (=> start!125720 m!1356167))

(declare-fun m!1356169 () Bool)

(assert (=> start!125720 m!1356169))

(declare-fun m!1356171 () Bool)

(assert (=> b!1469245 m!1356171))

(assert (=> b!1469245 m!1356171))

(declare-fun m!1356173 () Bool)

(assert (=> b!1469245 m!1356173))

(declare-fun m!1356175 () Bool)

(assert (=> b!1469246 m!1356175))

(declare-fun m!1356177 () Bool)

(assert (=> b!1469242 m!1356177))

(assert (=> b!1469242 m!1356177))

(declare-fun m!1356179 () Bool)

(assert (=> b!1469242 m!1356179))

(assert (=> b!1469248 m!1356171))

(assert (=> b!1469248 m!1356171))

(declare-fun m!1356181 () Bool)

(assert (=> b!1469248 m!1356181))

(push 1)

(assert (not start!125720))

(assert (not b!1469246))

(assert (not b!1469242))

(assert (not b!1469243))

(assert (not b!1469245))

(assert (not b!1469248))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

