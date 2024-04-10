; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131040 () Bool)

(assert start!131040)

(declare-fun b!1537546 () Bool)

(declare-fun res!1054635 () Bool)

(declare-fun e!855685 () Bool)

(assert (=> b!1537546 (=> (not res!1054635) (not e!855685))))

(declare-datatypes ((array!102138 0))(
  ( (array!102139 (arr!49285 (Array (_ BitVec 32) (_ BitVec 64))) (size!49835 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102138)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537546 (= res!1054635 (validKeyInArray!0 (select (arr!49285 a!2792) i!951)))))

(declare-fun b!1537547 () Bool)

(declare-fun res!1054636 () Bool)

(assert (=> b!1537547 (=> (not res!1054636) (not e!855685))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102138 (_ BitVec 32)) Bool)

(assert (=> b!1537547 (= res!1054636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1054634 () Bool)

(assert (=> start!131040 (=> (not res!1054634) (not e!855685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131040 (= res!1054634 (validMask!0 mask!2480))))

(assert (=> start!131040 e!855685))

(assert (=> start!131040 true))

(declare-fun array_inv!38313 (array!102138) Bool)

(assert (=> start!131040 (array_inv!38313 a!2792)))

(declare-fun b!1537548 () Bool)

(declare-fun res!1054633 () Bool)

(assert (=> b!1537548 (=> (not res!1054633) (not e!855685))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1537548 (= res!1054633 (validKeyInArray!0 (select (arr!49285 a!2792) j!64)))))

(declare-fun b!1537549 () Bool)

(assert (=> b!1537549 (= e!855685 false)))

(declare-fun lt!664747 () Bool)

(declare-datatypes ((List!35759 0))(
  ( (Nil!35756) (Cons!35755 (h!37200 (_ BitVec 64)) (t!50453 List!35759)) )
))
(declare-fun arrayNoDuplicates!0 (array!102138 (_ BitVec 32) List!35759) Bool)

(assert (=> b!1537549 (= lt!664747 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35756))))

(declare-fun b!1537550 () Bool)

(declare-fun res!1054632 () Bool)

(assert (=> b!1537550 (=> (not res!1054632) (not e!855685))))

(assert (=> b!1537550 (= res!1054632 (and (= (size!49835 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49835 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49835 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131040 res!1054634) b!1537550))

(assert (= (and b!1537550 res!1054632) b!1537546))

(assert (= (and b!1537546 res!1054635) b!1537548))

(assert (= (and b!1537548 res!1054633) b!1537547))

(assert (= (and b!1537547 res!1054636) b!1537549))

(declare-fun m!1420067 () Bool)

(assert (=> b!1537547 m!1420067))

(declare-fun m!1420069 () Bool)

(assert (=> b!1537546 m!1420069))

(assert (=> b!1537546 m!1420069))

(declare-fun m!1420071 () Bool)

(assert (=> b!1537546 m!1420071))

(declare-fun m!1420073 () Bool)

(assert (=> b!1537549 m!1420073))

(declare-fun m!1420075 () Bool)

(assert (=> start!131040 m!1420075))

(declare-fun m!1420077 () Bool)

(assert (=> start!131040 m!1420077))

(declare-fun m!1420079 () Bool)

(assert (=> b!1537548 m!1420079))

(assert (=> b!1537548 m!1420079))

(declare-fun m!1420081 () Bool)

(assert (=> b!1537548 m!1420081))

(push 1)

(assert (not b!1537548))

(assert (not start!131040))

(assert (not b!1537546))

(assert (not b!1537549))

(assert (not b!1537547))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

