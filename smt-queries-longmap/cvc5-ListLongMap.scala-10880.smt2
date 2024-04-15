; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127500 () Bool)

(assert start!127500)

(declare-fun b!1498101 () Bool)

(declare-fun res!1019369 () Bool)

(declare-fun e!838818 () Bool)

(assert (=> b!1498101 (=> (not res!1019369) (not e!838818))))

(declare-datatypes ((array!99875 0))(
  ( (array!99876 (arr!48198 (Array (_ BitVec 32) (_ BitVec 64))) (size!48750 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99875)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498101 (= res!1019369 (validKeyInArray!0 (select (arr!48198 a!2850) j!87)))))

(declare-fun b!1498102 () Bool)

(declare-fun res!1019366 () Bool)

(assert (=> b!1498102 (=> (not res!1019366) (not e!838818))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1498102 (= res!1019366 (validKeyInArray!0 (select (arr!48198 a!2850) i!996)))))

(declare-fun res!1019365 () Bool)

(assert (=> start!127500 (=> (not res!1019365) (not e!838818))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127500 (= res!1019365 (validMask!0 mask!2661))))

(assert (=> start!127500 e!838818))

(assert (=> start!127500 true))

(declare-fun array_inv!37431 (array!99875) Bool)

(assert (=> start!127500 (array_inv!37431 a!2850)))

(declare-fun b!1498103 () Bool)

(assert (=> b!1498103 (= e!838818 false)))

(declare-fun lt!652363 () Bool)

(declare-datatypes ((List!34768 0))(
  ( (Nil!34765) (Cons!34764 (h!36162 (_ BitVec 64)) (t!49454 List!34768)) )
))
(declare-fun arrayNoDuplicates!0 (array!99875 (_ BitVec 32) List!34768) Bool)

(assert (=> b!1498103 (= lt!652363 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34765))))

(declare-fun b!1498104 () Bool)

(declare-fun res!1019368 () Bool)

(assert (=> b!1498104 (=> (not res!1019368) (not e!838818))))

(assert (=> b!1498104 (= res!1019368 (and (= (size!48750 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48750 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48750 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498105 () Bool)

(declare-fun res!1019367 () Bool)

(assert (=> b!1498105 (=> (not res!1019367) (not e!838818))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99875 (_ BitVec 32)) Bool)

(assert (=> b!1498105 (= res!1019367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127500 res!1019365) b!1498104))

(assert (= (and b!1498104 res!1019368) b!1498102))

(assert (= (and b!1498102 res!1019366) b!1498101))

(assert (= (and b!1498101 res!1019369) b!1498105))

(assert (= (and b!1498105 res!1019367) b!1498103))

(declare-fun m!1380657 () Bool)

(assert (=> b!1498101 m!1380657))

(assert (=> b!1498101 m!1380657))

(declare-fun m!1380659 () Bool)

(assert (=> b!1498101 m!1380659))

(declare-fun m!1380661 () Bool)

(assert (=> b!1498102 m!1380661))

(assert (=> b!1498102 m!1380661))

(declare-fun m!1380663 () Bool)

(assert (=> b!1498102 m!1380663))

(declare-fun m!1380665 () Bool)

(assert (=> b!1498105 m!1380665))

(declare-fun m!1380667 () Bool)

(assert (=> start!127500 m!1380667))

(declare-fun m!1380669 () Bool)

(assert (=> start!127500 m!1380669))

(declare-fun m!1380671 () Bool)

(assert (=> b!1498103 m!1380671))

(push 1)

(assert (not b!1498101))

(assert (not b!1498103))

(assert (not start!127500))

(assert (not b!1498105))

(assert (not b!1498102))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

