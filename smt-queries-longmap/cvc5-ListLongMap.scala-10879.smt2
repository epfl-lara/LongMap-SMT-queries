; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127536 () Bool)

(assert start!127536)

(declare-fun res!1019419 () Bool)

(declare-fun e!838987 () Bool)

(assert (=> start!127536 (=> (not res!1019419) (not e!838987))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127536 (= res!1019419 (validMask!0 mask!2661))))

(assert (=> start!127536 e!838987))

(assert (=> start!127536 true))

(declare-datatypes ((array!99917 0))(
  ( (array!99918 (arr!48218 (Array (_ BitVec 32) (_ BitVec 64))) (size!48768 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99917)

(declare-fun array_inv!37246 (array!99917) Bool)

(assert (=> start!127536 (array_inv!37246 a!2850)))

(declare-fun b!1498342 () Bool)

(declare-fun res!1019421 () Bool)

(assert (=> b!1498342 (=> (not res!1019421) (not e!838987))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1498342 (= res!1019421 (and (= (size!48768 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48768 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48768 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498343 () Bool)

(assert (=> b!1498343 (= e!838987 false)))

(declare-fun lt!652627 () Bool)

(declare-datatypes ((List!34710 0))(
  ( (Nil!34707) (Cons!34706 (h!36103 (_ BitVec 64)) (t!49404 List!34710)) )
))
(declare-fun arrayNoDuplicates!0 (array!99917 (_ BitVec 32) List!34710) Bool)

(assert (=> b!1498343 (= lt!652627 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34707))))

(declare-fun b!1498344 () Bool)

(declare-fun res!1019422 () Bool)

(assert (=> b!1498344 (=> (not res!1019422) (not e!838987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498344 (= res!1019422 (validKeyInArray!0 (select (arr!48218 a!2850) j!87)))))

(declare-fun b!1498345 () Bool)

(declare-fun res!1019418 () Bool)

(assert (=> b!1498345 (=> (not res!1019418) (not e!838987))))

(assert (=> b!1498345 (= res!1019418 (validKeyInArray!0 (select (arr!48218 a!2850) i!996)))))

(declare-fun b!1498346 () Bool)

(declare-fun res!1019420 () Bool)

(assert (=> b!1498346 (=> (not res!1019420) (not e!838987))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99917 (_ BitVec 32)) Bool)

(assert (=> b!1498346 (= res!1019420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127536 res!1019419) b!1498342))

(assert (= (and b!1498342 res!1019421) b!1498345))

(assert (= (and b!1498345 res!1019418) b!1498344))

(assert (= (and b!1498344 res!1019422) b!1498346))

(assert (= (and b!1498346 res!1019420) b!1498343))

(declare-fun m!1381447 () Bool)

(assert (=> b!1498343 m!1381447))

(declare-fun m!1381449 () Bool)

(assert (=> start!127536 m!1381449))

(declare-fun m!1381451 () Bool)

(assert (=> start!127536 m!1381451))

(declare-fun m!1381453 () Bool)

(assert (=> b!1498344 m!1381453))

(assert (=> b!1498344 m!1381453))

(declare-fun m!1381455 () Bool)

(assert (=> b!1498344 m!1381455))

(declare-fun m!1381457 () Bool)

(assert (=> b!1498345 m!1381457))

(assert (=> b!1498345 m!1381457))

(declare-fun m!1381459 () Bool)

(assert (=> b!1498345 m!1381459))

(declare-fun m!1381461 () Bool)

(assert (=> b!1498346 m!1381461))

(push 1)

(assert (not b!1498346))

(assert (not b!1498344))

(assert (not b!1498345))

(assert (not b!1498343))

(assert (not start!127536))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

