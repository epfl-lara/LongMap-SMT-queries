; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118474 () Bool)

(assert start!118474)

(declare-fun b!1385434 () Bool)

(declare-fun res!926683 () Bool)

(declare-fun e!784987 () Bool)

(assert (=> b!1385434 (=> (not res!926683) (not e!784987))))

(declare-datatypes ((array!94750 0))(
  ( (array!94751 (arr!45751 (Array (_ BitVec 32) (_ BitVec 64))) (size!46301 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94750)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385434 (= res!926683 (validKeyInArray!0 (select (arr!45751 a!2938) i!1065)))))

(declare-fun res!926685 () Bool)

(assert (=> start!118474 (=> (not res!926685) (not e!784987))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118474 (= res!926685 (validMask!0 mask!2987))))

(assert (=> start!118474 e!784987))

(assert (=> start!118474 true))

(declare-fun array_inv!34779 (array!94750) Bool)

(assert (=> start!118474 (array_inv!34779 a!2938)))

(declare-fun b!1385435 () Bool)

(declare-fun res!926684 () Bool)

(assert (=> b!1385435 (=> (not res!926684) (not e!784987))))

(declare-datatypes ((List!32279 0))(
  ( (Nil!32276) (Cons!32275 (h!33484 (_ BitVec 64)) (t!46973 List!32279)) )
))
(declare-fun arrayNoDuplicates!0 (array!94750 (_ BitVec 32) List!32279) Bool)

(assert (=> b!1385435 (= res!926684 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32276))))

(declare-fun b!1385433 () Bool)

(declare-fun res!926686 () Bool)

(assert (=> b!1385433 (=> (not res!926686) (not e!784987))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385433 (= res!926686 (and (= (size!46301 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46301 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46301 a!2938))))))

(declare-fun b!1385436 () Bool)

(assert (=> b!1385436 (= e!784987 false)))

(declare-fun lt!609243 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94750 (_ BitVec 32)) Bool)

(assert (=> b!1385436 (= lt!609243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118474 res!926685) b!1385433))

(assert (= (and b!1385433 res!926686) b!1385434))

(assert (= (and b!1385434 res!926683) b!1385435))

(assert (= (and b!1385435 res!926684) b!1385436))

(declare-fun m!1270725 () Bool)

(assert (=> b!1385434 m!1270725))

(assert (=> b!1385434 m!1270725))

(declare-fun m!1270727 () Bool)

(assert (=> b!1385434 m!1270727))

(declare-fun m!1270729 () Bool)

(assert (=> start!118474 m!1270729))

(declare-fun m!1270731 () Bool)

(assert (=> start!118474 m!1270731))

(declare-fun m!1270733 () Bool)

(assert (=> b!1385435 m!1270733))

(declare-fun m!1270735 () Bool)

(assert (=> b!1385436 m!1270735))

(push 1)

(assert (not b!1385435))

(assert (not start!118474))

(assert (not b!1385434))

(assert (not b!1385436))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

