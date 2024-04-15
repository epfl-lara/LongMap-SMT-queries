; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127482 () Bool)

(assert start!127482)

(declare-fun b!1497957 () Bool)

(declare-fun e!838764 () Bool)

(assert (=> b!1497957 (= e!838764 false)))

(declare-fun lt!652345 () Bool)

(declare-datatypes ((array!99857 0))(
  ( (array!99858 (arr!48189 (Array (_ BitVec 32) (_ BitVec 64))) (size!48741 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99857)

(declare-datatypes ((List!34759 0))(
  ( (Nil!34756) (Cons!34755 (h!36153 (_ BitVec 64)) (t!49445 List!34759)) )
))
(declare-fun arrayNoDuplicates!0 (array!99857 (_ BitVec 32) List!34759) Bool)

(assert (=> b!1497957 (= lt!652345 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34756))))

(declare-fun b!1497958 () Bool)

(declare-fun res!1019223 () Bool)

(assert (=> b!1497958 (=> (not res!1019223) (not e!838764))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99857 (_ BitVec 32)) Bool)

(assert (=> b!1497958 (= res!1019223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1019221 () Bool)

(assert (=> start!127482 (=> (not res!1019221) (not e!838764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127482 (= res!1019221 (validMask!0 mask!2661))))

(assert (=> start!127482 e!838764))

(assert (=> start!127482 true))

(declare-fun array_inv!37422 (array!99857) Bool)

(assert (=> start!127482 (array_inv!37422 a!2850)))

(declare-fun b!1497959 () Bool)

(declare-fun res!1019224 () Bool)

(assert (=> b!1497959 (=> (not res!1019224) (not e!838764))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497959 (= res!1019224 (validKeyInArray!0 (select (arr!48189 a!2850) i!996)))))

(declare-fun b!1497960 () Bool)

(declare-fun res!1019222 () Bool)

(assert (=> b!1497960 (=> (not res!1019222) (not e!838764))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1497960 (= res!1019222 (validKeyInArray!0 (select (arr!48189 a!2850) j!87)))))

(declare-fun b!1497961 () Bool)

(declare-fun res!1019225 () Bool)

(assert (=> b!1497961 (=> (not res!1019225) (not e!838764))))

(assert (=> b!1497961 (= res!1019225 (and (= (size!48741 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48741 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48741 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127482 res!1019221) b!1497961))

(assert (= (and b!1497961 res!1019225) b!1497959))

(assert (= (and b!1497959 res!1019224) b!1497960))

(assert (= (and b!1497960 res!1019222) b!1497958))

(assert (= (and b!1497958 res!1019223) b!1497957))

(declare-fun m!1380495 () Bool)

(assert (=> b!1497958 m!1380495))

(declare-fun m!1380497 () Bool)

(assert (=> start!127482 m!1380497))

(declare-fun m!1380499 () Bool)

(assert (=> start!127482 m!1380499))

(declare-fun m!1380501 () Bool)

(assert (=> b!1497960 m!1380501))

(assert (=> b!1497960 m!1380501))

(declare-fun m!1380503 () Bool)

(assert (=> b!1497960 m!1380503))

(declare-fun m!1380505 () Bool)

(assert (=> b!1497959 m!1380505))

(assert (=> b!1497959 m!1380505))

(declare-fun m!1380507 () Bool)

(assert (=> b!1497959 m!1380507))

(declare-fun m!1380509 () Bool)

(assert (=> b!1497957 m!1380509))

(push 1)

(assert (not start!127482))

(assert (not b!1497958))

(assert (not b!1497959))

(assert (not b!1497960))

(assert (not b!1497957))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

