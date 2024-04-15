; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127340 () Bool)

(assert start!127340)

(declare-fun b!1497347 () Bool)

(declare-fun res!1018665 () Bool)

(declare-fun e!838460 () Bool)

(assert (=> b!1497347 (=> (not res!1018665) (not e!838460))))

(declare-datatypes ((array!99796 0))(
  ( (array!99797 (arr!48163 (Array (_ BitVec 32) (_ BitVec 64))) (size!48715 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99796)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497347 (= res!1018665 (validKeyInArray!0 (select (arr!48163 a!2850) i!996)))))

(declare-fun b!1497348 () Bool)

(declare-fun res!1018666 () Bool)

(assert (=> b!1497348 (=> (not res!1018666) (not e!838460))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1497348 (= res!1018666 (and (= (size!48715 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48715 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48715 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1497350 () Bool)

(declare-fun res!1018667 () Bool)

(assert (=> b!1497350 (=> (not res!1018667) (not e!838460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99796 (_ BitVec 32)) Bool)

(assert (=> b!1497350 (= res!1018667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1497351 () Bool)

(assert (=> b!1497351 (= e!838460 (bvsgt #b00000000000000000000000000000000 (size!48715 a!2850)))))

(declare-fun b!1497349 () Bool)

(declare-fun res!1018669 () Bool)

(assert (=> b!1497349 (=> (not res!1018669) (not e!838460))))

(assert (=> b!1497349 (= res!1018669 (validKeyInArray!0 (select (arr!48163 a!2850) j!87)))))

(declare-fun res!1018668 () Bool)

(assert (=> start!127340 (=> (not res!1018668) (not e!838460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127340 (= res!1018668 (validMask!0 mask!2661))))

(assert (=> start!127340 e!838460))

(assert (=> start!127340 true))

(declare-fun array_inv!37396 (array!99796) Bool)

(assert (=> start!127340 (array_inv!37396 a!2850)))

(assert (= (and start!127340 res!1018668) b!1497348))

(assert (= (and b!1497348 res!1018666) b!1497347))

(assert (= (and b!1497347 res!1018665) b!1497349))

(assert (= (and b!1497349 res!1018669) b!1497350))

(assert (= (and b!1497350 res!1018667) b!1497351))

(declare-fun m!1379901 () Bool)

(assert (=> b!1497347 m!1379901))

(assert (=> b!1497347 m!1379901))

(declare-fun m!1379903 () Bool)

(assert (=> b!1497347 m!1379903))

(declare-fun m!1379905 () Bool)

(assert (=> b!1497350 m!1379905))

(declare-fun m!1379907 () Bool)

(assert (=> b!1497349 m!1379907))

(assert (=> b!1497349 m!1379907))

(declare-fun m!1379909 () Bool)

(assert (=> b!1497349 m!1379909))

(declare-fun m!1379911 () Bool)

(assert (=> start!127340 m!1379911))

(declare-fun m!1379913 () Bool)

(assert (=> start!127340 m!1379913))

(check-sat (not b!1497347) (not start!127340) (not b!1497350) (not b!1497349))
(check-sat)
