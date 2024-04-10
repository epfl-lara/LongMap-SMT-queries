; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127546 () Bool)

(assert start!127546)

(declare-fun b!1498417 () Bool)

(declare-fun res!1019497 () Bool)

(declare-fun e!839016 () Bool)

(assert (=> b!1498417 (=> (not res!1019497) (not e!839016))))

(declare-datatypes ((array!99927 0))(
  ( (array!99928 (arr!48223 (Array (_ BitVec 32) (_ BitVec 64))) (size!48773 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99927)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498417 (= res!1019497 (validKeyInArray!0 (select (arr!48223 a!2850) i!996)))))

(declare-fun b!1498419 () Bool)

(declare-fun res!1019494 () Bool)

(assert (=> b!1498419 (=> (not res!1019494) (not e!839016))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498419 (= res!1019494 (validKeyInArray!0 (select (arr!48223 a!2850) j!87)))))

(declare-fun b!1498420 () Bool)

(assert (=> b!1498420 (= e!839016 false)))

(declare-fun lt!652642 () Bool)

(declare-datatypes ((List!34715 0))(
  ( (Nil!34712) (Cons!34711 (h!36108 (_ BitVec 64)) (t!49409 List!34715)) )
))
(declare-fun arrayNoDuplicates!0 (array!99927 (_ BitVec 32) List!34715) Bool)

(assert (=> b!1498420 (= lt!652642 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34712))))

(declare-fun b!1498421 () Bool)

(declare-fun res!1019493 () Bool)

(assert (=> b!1498421 (=> (not res!1019493) (not e!839016))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99927 (_ BitVec 32)) Bool)

(assert (=> b!1498421 (= res!1019493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498418 () Bool)

(declare-fun res!1019495 () Bool)

(assert (=> b!1498418 (=> (not res!1019495) (not e!839016))))

(assert (=> b!1498418 (= res!1019495 (and (= (size!48773 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48773 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48773 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1019496 () Bool)

(assert (=> start!127546 (=> (not res!1019496) (not e!839016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127546 (= res!1019496 (validMask!0 mask!2661))))

(assert (=> start!127546 e!839016))

(assert (=> start!127546 true))

(declare-fun array_inv!37251 (array!99927) Bool)

(assert (=> start!127546 (array_inv!37251 a!2850)))

(assert (= (and start!127546 res!1019496) b!1498418))

(assert (= (and b!1498418 res!1019495) b!1498417))

(assert (= (and b!1498417 res!1019497) b!1498419))

(assert (= (and b!1498419 res!1019494) b!1498421))

(assert (= (and b!1498421 res!1019493) b!1498420))

(declare-fun m!1381527 () Bool)

(assert (=> b!1498420 m!1381527))

(declare-fun m!1381529 () Bool)

(assert (=> b!1498419 m!1381529))

(assert (=> b!1498419 m!1381529))

(declare-fun m!1381531 () Bool)

(assert (=> b!1498419 m!1381531))

(declare-fun m!1381533 () Bool)

(assert (=> b!1498421 m!1381533))

(declare-fun m!1381535 () Bool)

(assert (=> b!1498417 m!1381535))

(assert (=> b!1498417 m!1381535))

(declare-fun m!1381537 () Bool)

(assert (=> b!1498417 m!1381537))

(declare-fun m!1381539 () Bool)

(assert (=> start!127546 m!1381539))

(declare-fun m!1381541 () Bool)

(assert (=> start!127546 m!1381541))

(push 1)

(assert (not b!1498421))

(assert (not b!1498420))

(assert (not start!127546))

(assert (not b!1498417))

(assert (not b!1498419))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

