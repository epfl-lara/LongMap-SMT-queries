; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127538 () Bool)

(assert start!127538)

(declare-fun b!1498357 () Bool)

(declare-fun res!1019434 () Bool)

(declare-fun e!838992 () Bool)

(assert (=> b!1498357 (=> (not res!1019434) (not e!838992))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!99919 0))(
  ( (array!99920 (arr!48219 (Array (_ BitVec 32) (_ BitVec 64))) (size!48769 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99919)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498357 (= res!1019434 (and (= (size!48769 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48769 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48769 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1019437 () Bool)

(assert (=> start!127538 (=> (not res!1019437) (not e!838992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127538 (= res!1019437 (validMask!0 mask!2661))))

(assert (=> start!127538 e!838992))

(assert (=> start!127538 true))

(declare-fun array_inv!37247 (array!99919) Bool)

(assert (=> start!127538 (array_inv!37247 a!2850)))

(declare-fun b!1498358 () Bool)

(assert (=> b!1498358 (= e!838992 false)))

(declare-fun lt!652630 () Bool)

(declare-datatypes ((List!34711 0))(
  ( (Nil!34708) (Cons!34707 (h!36104 (_ BitVec 64)) (t!49405 List!34711)) )
))
(declare-fun arrayNoDuplicates!0 (array!99919 (_ BitVec 32) List!34711) Bool)

(assert (=> b!1498358 (= lt!652630 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34708))))

(declare-fun b!1498359 () Bool)

(declare-fun res!1019436 () Bool)

(assert (=> b!1498359 (=> (not res!1019436) (not e!838992))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498359 (= res!1019436 (validKeyInArray!0 (select (arr!48219 a!2850) j!87)))))

(declare-fun b!1498360 () Bool)

(declare-fun res!1019435 () Bool)

(assert (=> b!1498360 (=> (not res!1019435) (not e!838992))))

(assert (=> b!1498360 (= res!1019435 (validKeyInArray!0 (select (arr!48219 a!2850) i!996)))))

(declare-fun b!1498361 () Bool)

(declare-fun res!1019433 () Bool)

(assert (=> b!1498361 (=> (not res!1019433) (not e!838992))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99919 (_ BitVec 32)) Bool)

(assert (=> b!1498361 (= res!1019433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127538 res!1019437) b!1498357))

(assert (= (and b!1498357 res!1019434) b!1498360))

(assert (= (and b!1498360 res!1019435) b!1498359))

(assert (= (and b!1498359 res!1019436) b!1498361))

(assert (= (and b!1498361 res!1019433) b!1498358))

(declare-fun m!1381463 () Bool)

(assert (=> start!127538 m!1381463))

(declare-fun m!1381465 () Bool)

(assert (=> start!127538 m!1381465))

(declare-fun m!1381467 () Bool)

(assert (=> b!1498359 m!1381467))

(assert (=> b!1498359 m!1381467))

(declare-fun m!1381469 () Bool)

(assert (=> b!1498359 m!1381469))

(declare-fun m!1381471 () Bool)

(assert (=> b!1498360 m!1381471))

(assert (=> b!1498360 m!1381471))

(declare-fun m!1381473 () Bool)

(assert (=> b!1498360 m!1381473))

(declare-fun m!1381475 () Bool)

(assert (=> b!1498361 m!1381475))

(declare-fun m!1381477 () Bool)

(assert (=> b!1498358 m!1381477))

(check-sat (not b!1498361) (not start!127538) (not b!1498358) (not b!1498360) (not b!1498359))
