; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127526 () Bool)

(assert start!127526)

(declare-fun b!1498258 () Bool)

(declare-fun e!838957 () Bool)

(assert (=> b!1498258 (= e!838957 false)))

(declare-fun lt!652621 () Bool)

(declare-datatypes ((array!99907 0))(
  ( (array!99908 (arr!48213 (Array (_ BitVec 32) (_ BitVec 64))) (size!48763 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99907)

(declare-datatypes ((List!34705 0))(
  ( (Nil!34702) (Cons!34701 (h!36098 (_ BitVec 64)) (t!49399 List!34705)) )
))
(declare-fun arrayNoDuplicates!0 (array!99907 (_ BitVec 32) List!34705) Bool)

(assert (=> b!1498258 (= lt!652621 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34702))))

(declare-fun b!1498259 () Bool)

(declare-fun res!1019334 () Bool)

(assert (=> b!1498259 (=> (not res!1019334) (not e!838957))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99907 (_ BitVec 32)) Bool)

(assert (=> b!1498259 (= res!1019334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498260 () Bool)

(declare-fun res!1019337 () Bool)

(assert (=> b!1498260 (=> (not res!1019337) (not e!838957))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498260 (= res!1019337 (validKeyInArray!0 (select (arr!48213 a!2850) i!996)))))

(declare-fun b!1498261 () Bool)

(declare-fun res!1019336 () Bool)

(assert (=> b!1498261 (=> (not res!1019336) (not e!838957))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498261 (= res!1019336 (validKeyInArray!0 (select (arr!48213 a!2850) j!87)))))

(declare-fun res!1019338 () Bool)

(assert (=> start!127526 (=> (not res!1019338) (not e!838957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127526 (= res!1019338 (validMask!0 mask!2661))))

(assert (=> start!127526 e!838957))

(assert (=> start!127526 true))

(declare-fun array_inv!37241 (array!99907) Bool)

(assert (=> start!127526 (array_inv!37241 a!2850)))

(declare-fun b!1498262 () Bool)

(declare-fun res!1019335 () Bool)

(assert (=> b!1498262 (=> (not res!1019335) (not e!838957))))

(assert (=> b!1498262 (= res!1019335 (and (= (size!48763 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48763 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48763 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127526 res!1019338) b!1498262))

(assert (= (and b!1498262 res!1019335) b!1498260))

(assert (= (and b!1498260 res!1019337) b!1498261))

(assert (= (and b!1498261 res!1019336) b!1498259))

(assert (= (and b!1498259 res!1019334) b!1498258))

(declare-fun m!1381349 () Bool)

(assert (=> b!1498259 m!1381349))

(declare-fun m!1381351 () Bool)

(assert (=> start!127526 m!1381351))

(declare-fun m!1381353 () Bool)

(assert (=> start!127526 m!1381353))

(declare-fun m!1381355 () Bool)

(assert (=> b!1498258 m!1381355))

(declare-fun m!1381357 () Bool)

(assert (=> b!1498260 m!1381357))

(assert (=> b!1498260 m!1381357))

(declare-fun m!1381359 () Bool)

(assert (=> b!1498260 m!1381359))

(declare-fun m!1381361 () Bool)

(assert (=> b!1498261 m!1381361))

(assert (=> b!1498261 m!1381361))

(declare-fun m!1381363 () Bool)

(assert (=> b!1498261 m!1381363))

(check-sat (not b!1498258) (not b!1498260) (not start!127526) (not b!1498259) (not b!1498261))
