; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127544 () Bool)

(assert start!127544)

(declare-fun b!1498402 () Bool)

(declare-fun res!1019479 () Bool)

(declare-fun e!839010 () Bool)

(assert (=> b!1498402 (=> (not res!1019479) (not e!839010))))

(declare-datatypes ((array!99925 0))(
  ( (array!99926 (arr!48222 (Array (_ BitVec 32) (_ BitVec 64))) (size!48772 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99925)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498402 (= res!1019479 (validKeyInArray!0 (select (arr!48222 a!2850) j!87)))))

(declare-fun res!1019480 () Bool)

(assert (=> start!127544 (=> (not res!1019480) (not e!839010))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127544 (= res!1019480 (validMask!0 mask!2661))))

(assert (=> start!127544 e!839010))

(assert (=> start!127544 true))

(declare-fun array_inv!37250 (array!99925) Bool)

(assert (=> start!127544 (array_inv!37250 a!2850)))

(declare-fun b!1498403 () Bool)

(declare-fun res!1019478 () Bool)

(assert (=> b!1498403 (=> (not res!1019478) (not e!839010))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1498403 (= res!1019478 (validKeyInArray!0 (select (arr!48222 a!2850) i!996)))))

(declare-fun b!1498404 () Bool)

(declare-fun res!1019482 () Bool)

(assert (=> b!1498404 (=> (not res!1019482) (not e!839010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99925 (_ BitVec 32)) Bool)

(assert (=> b!1498404 (= res!1019482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498405 () Bool)

(assert (=> b!1498405 (= e!839010 false)))

(declare-fun lt!652639 () Bool)

(declare-datatypes ((List!34714 0))(
  ( (Nil!34711) (Cons!34710 (h!36107 (_ BitVec 64)) (t!49408 List!34714)) )
))
(declare-fun arrayNoDuplicates!0 (array!99925 (_ BitVec 32) List!34714) Bool)

(assert (=> b!1498405 (= lt!652639 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34711))))

(declare-fun b!1498406 () Bool)

(declare-fun res!1019481 () Bool)

(assert (=> b!1498406 (=> (not res!1019481) (not e!839010))))

(assert (=> b!1498406 (= res!1019481 (and (= (size!48772 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48772 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48772 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127544 res!1019480) b!1498406))

(assert (= (and b!1498406 res!1019481) b!1498403))

(assert (= (and b!1498403 res!1019478) b!1498402))

(assert (= (and b!1498402 res!1019479) b!1498404))

(assert (= (and b!1498404 res!1019482) b!1498405))

(declare-fun m!1381511 () Bool)

(assert (=> b!1498402 m!1381511))

(assert (=> b!1498402 m!1381511))

(declare-fun m!1381513 () Bool)

(assert (=> b!1498402 m!1381513))

(declare-fun m!1381515 () Bool)

(assert (=> b!1498404 m!1381515))

(declare-fun m!1381517 () Bool)

(assert (=> b!1498403 m!1381517))

(assert (=> b!1498403 m!1381517))

(declare-fun m!1381519 () Bool)

(assert (=> b!1498403 m!1381519))

(declare-fun m!1381521 () Bool)

(assert (=> b!1498405 m!1381521))

(declare-fun m!1381523 () Bool)

(assert (=> start!127544 m!1381523))

(declare-fun m!1381525 () Bool)

(assert (=> start!127544 m!1381525))

(check-sat (not b!1498402) (not b!1498405) (not start!127544) (not b!1498404) (not b!1498403))
