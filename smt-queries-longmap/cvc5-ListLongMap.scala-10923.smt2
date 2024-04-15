; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127758 () Bool)

(assert start!127758)

(declare-fun res!1022877 () Bool)

(declare-fun e!839916 () Bool)

(assert (=> start!127758 (=> (not res!1022877) (not e!839916))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127758 (= res!1022877 (validMask!0 mask!2661))))

(assert (=> start!127758 e!839916))

(assert (=> start!127758 true))

(declare-datatypes ((array!100133 0))(
  ( (array!100134 (arr!48327 (Array (_ BitVec 32) (_ BitVec 64))) (size!48879 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100133)

(declare-fun array_inv!37560 (array!100133) Bool)

(assert (=> start!127758 (array_inv!37560 a!2850)))

(declare-fun b!1501611 () Bool)

(declare-fun res!1022878 () Bool)

(assert (=> b!1501611 (=> (not res!1022878) (not e!839916))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501611 (= res!1022878 (and (= (size!48879 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48879 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48879 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501612 () Bool)

(declare-fun res!1022875 () Bool)

(assert (=> b!1501612 (=> (not res!1022875) (not e!839916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501612 (= res!1022875 (validKeyInArray!0 (select (arr!48327 a!2850) i!996)))))

(declare-fun b!1501613 () Bool)

(declare-fun res!1022876 () Bool)

(assert (=> b!1501613 (=> (not res!1022876) (not e!839916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100133 (_ BitVec 32)) Bool)

(assert (=> b!1501613 (= res!1022876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501614 () Bool)

(declare-fun res!1022879 () Bool)

(assert (=> b!1501614 (=> (not res!1022879) (not e!839916))))

(assert (=> b!1501614 (= res!1022879 (validKeyInArray!0 (select (arr!48327 a!2850) j!87)))))

(declare-fun b!1501615 () Bool)

(assert (=> b!1501615 (= e!839916 false)))

(declare-fun lt!653011 () Bool)

(declare-datatypes ((List!34897 0))(
  ( (Nil!34894) (Cons!34893 (h!36291 (_ BitVec 64)) (t!49583 List!34897)) )
))
(declare-fun arrayNoDuplicates!0 (array!100133 (_ BitVec 32) List!34897) Bool)

(assert (=> b!1501615 (= lt!653011 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34894))))

(assert (= (and start!127758 res!1022877) b!1501611))

(assert (= (and b!1501611 res!1022878) b!1501612))

(assert (= (and b!1501612 res!1022875) b!1501614))

(assert (= (and b!1501614 res!1022879) b!1501613))

(assert (= (and b!1501613 res!1022876) b!1501615))

(declare-fun m!1384341 () Bool)

(assert (=> b!1501613 m!1384341))

(declare-fun m!1384343 () Bool)

(assert (=> b!1501615 m!1384343))

(declare-fun m!1384345 () Bool)

(assert (=> b!1501612 m!1384345))

(assert (=> b!1501612 m!1384345))

(declare-fun m!1384347 () Bool)

(assert (=> b!1501612 m!1384347))

(declare-fun m!1384349 () Bool)

(assert (=> b!1501614 m!1384349))

(assert (=> b!1501614 m!1384349))

(declare-fun m!1384351 () Bool)

(assert (=> b!1501614 m!1384351))

(declare-fun m!1384353 () Bool)

(assert (=> start!127758 m!1384353))

(declare-fun m!1384355 () Bool)

(assert (=> start!127758 m!1384355))

(push 1)

(assert (not b!1501613))

(assert (not b!1501615))

(assert (not b!1501614))

(assert (not start!127758))

(assert (not b!1501612))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

