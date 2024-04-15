; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123872 () Bool)

(assert start!123872)

(declare-fun b!1435601 () Bool)

(declare-fun res!968715 () Bool)

(declare-fun e!810173 () Bool)

(assert (=> b!1435601 (=> (not res!968715) (not e!810173))))

(declare-datatypes ((array!97581 0))(
  ( (array!97582 (arr!47092 (Array (_ BitVec 32) (_ BitVec 64))) (size!47644 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97581)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435601 (= res!968715 (validKeyInArray!0 (select (arr!47092 a!2862) i!1006)))))

(declare-fun b!1435602 () Bool)

(declare-fun res!968714 () Bool)

(assert (=> b!1435602 (=> (not res!968714) (not e!810173))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1435602 (= res!968714 (validKeyInArray!0 (select (arr!47092 a!2862) j!93)))))

(declare-fun b!1435603 () Bool)

(assert (=> b!1435603 (= e!810173 (bvsgt #b00000000000000000000000000000000 (size!47644 a!2862)))))

(declare-fun b!1435604 () Bool)

(declare-fun res!968712 () Bool)

(assert (=> b!1435604 (=> (not res!968712) (not e!810173))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97581 (_ BitVec 32)) Bool)

(assert (=> b!1435604 (= res!968712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!968713 () Bool)

(assert (=> start!123872 (=> (not res!968713) (not e!810173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123872 (= res!968713 (validMask!0 mask!2687))))

(assert (=> start!123872 e!810173))

(assert (=> start!123872 true))

(declare-fun array_inv!36325 (array!97581) Bool)

(assert (=> start!123872 (array_inv!36325 a!2862)))

(declare-fun b!1435605 () Bool)

(declare-fun res!968716 () Bool)

(assert (=> b!1435605 (=> (not res!968716) (not e!810173))))

(assert (=> b!1435605 (= res!968716 (and (= (size!47644 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47644 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47644 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!123872 res!968713) b!1435605))

(assert (= (and b!1435605 res!968716) b!1435601))

(assert (= (and b!1435601 res!968715) b!1435602))

(assert (= (and b!1435602 res!968714) b!1435604))

(assert (= (and b!1435604 res!968712) b!1435603))

(declare-fun m!1324487 () Bool)

(assert (=> b!1435601 m!1324487))

(assert (=> b!1435601 m!1324487))

(declare-fun m!1324489 () Bool)

(assert (=> b!1435601 m!1324489))

(declare-fun m!1324491 () Bool)

(assert (=> b!1435602 m!1324491))

(assert (=> b!1435602 m!1324491))

(declare-fun m!1324493 () Bool)

(assert (=> b!1435602 m!1324493))

(declare-fun m!1324495 () Bool)

(assert (=> b!1435604 m!1324495))

(declare-fun m!1324497 () Bool)

(assert (=> start!123872 m!1324497))

(declare-fun m!1324499 () Bool)

(assert (=> start!123872 m!1324499))

(check-sat (not b!1435604) (not b!1435601) (not start!123872) (not b!1435602))
(check-sat)
