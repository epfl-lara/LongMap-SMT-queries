; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127542 () Bool)

(assert start!127542)

(declare-fun res!1019465 () Bool)

(declare-fun e!839004 () Bool)

(assert (=> start!127542 (=> (not res!1019465) (not e!839004))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127542 (= res!1019465 (validMask!0 mask!2661))))

(assert (=> start!127542 e!839004))

(assert (=> start!127542 true))

(declare-datatypes ((array!99923 0))(
  ( (array!99924 (arr!48221 (Array (_ BitVec 32) (_ BitVec 64))) (size!48771 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99923)

(declare-fun array_inv!37249 (array!99923) Bool)

(assert (=> start!127542 (array_inv!37249 a!2850)))

(declare-fun b!1498387 () Bool)

(declare-fun res!1019466 () Bool)

(assert (=> b!1498387 (=> (not res!1019466) (not e!839004))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498387 (= res!1019466 (and (= (size!48771 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48771 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48771 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498388 () Bool)

(declare-fun res!1019464 () Bool)

(assert (=> b!1498388 (=> (not res!1019464) (not e!839004))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498388 (= res!1019464 (validKeyInArray!0 (select (arr!48221 a!2850) j!87)))))

(declare-fun b!1498389 () Bool)

(declare-fun res!1019467 () Bool)

(assert (=> b!1498389 (=> (not res!1019467) (not e!839004))))

(assert (=> b!1498389 (= res!1019467 (validKeyInArray!0 (select (arr!48221 a!2850) i!996)))))

(declare-fun b!1498390 () Bool)

(assert (=> b!1498390 (= e!839004 false)))

(declare-fun lt!652636 () Bool)

(declare-datatypes ((List!34713 0))(
  ( (Nil!34710) (Cons!34709 (h!36106 (_ BitVec 64)) (t!49407 List!34713)) )
))
(declare-fun arrayNoDuplicates!0 (array!99923 (_ BitVec 32) List!34713) Bool)

(assert (=> b!1498390 (= lt!652636 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34710))))

(declare-fun b!1498391 () Bool)

(declare-fun res!1019463 () Bool)

(assert (=> b!1498391 (=> (not res!1019463) (not e!839004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99923 (_ BitVec 32)) Bool)

(assert (=> b!1498391 (= res!1019463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127542 res!1019465) b!1498387))

(assert (= (and b!1498387 res!1019466) b!1498389))

(assert (= (and b!1498389 res!1019467) b!1498388))

(assert (= (and b!1498388 res!1019464) b!1498391))

(assert (= (and b!1498391 res!1019463) b!1498390))

(declare-fun m!1381495 () Bool)

(assert (=> b!1498390 m!1381495))

(declare-fun m!1381497 () Bool)

(assert (=> b!1498389 m!1381497))

(assert (=> b!1498389 m!1381497))

(declare-fun m!1381499 () Bool)

(assert (=> b!1498389 m!1381499))

(declare-fun m!1381501 () Bool)

(assert (=> start!127542 m!1381501))

(declare-fun m!1381503 () Bool)

(assert (=> start!127542 m!1381503))

(declare-fun m!1381505 () Bool)

(assert (=> b!1498388 m!1381505))

(assert (=> b!1498388 m!1381505))

(declare-fun m!1381507 () Bool)

(assert (=> b!1498388 m!1381507))

(declare-fun m!1381509 () Bool)

(assert (=> b!1498391 m!1381509))

(push 1)

(assert (not b!1498388))

(assert (not b!1498389))

(assert (not b!1498391))

(assert (not start!127542))

(assert (not b!1498390))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

