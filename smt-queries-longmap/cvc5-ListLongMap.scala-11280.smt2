; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131938 () Bool)

(assert start!131938)

(declare-fun res!1058655 () Bool)

(declare-fun e!858705 () Bool)

(assert (=> start!131938 (=> (not res!1058655) (not e!858705))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131938 (= res!1058655 (validMask!0 mask!4052))))

(assert (=> start!131938 e!858705))

(assert (=> start!131938 true))

(declare-datatypes ((array!102549 0))(
  ( (array!102550 (arr!49476 (Array (_ BitVec 32) (_ BitVec 64))) (size!50027 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102549)

(declare-fun array_inv!38757 (array!102549) Bool)

(assert (=> start!131938 (array_inv!38757 a!3920)))

(declare-fun b!1543684 () Bool)

(declare-fun res!1058654 () Bool)

(assert (=> b!1543684 (=> (not res!1058654) (not e!858705))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1543684 (= res!1058654 (and (= (size!50027 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!50027 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!50027 a!3920))))))

(declare-fun b!1543685 () Bool)

(assert (=> b!1543685 (= e!858705 false)))

(declare-fun lt!666540 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102549 (_ BitVec 32)) Bool)

(assert (=> b!1543685 (= lt!666540 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131938 res!1058655) b!1543684))

(assert (= (and b!1543684 res!1058654) b!1543685))

(declare-fun m!1425515 () Bool)

(assert (=> start!131938 m!1425515))

(declare-fun m!1425517 () Bool)

(assert (=> start!131938 m!1425517))

(declare-fun m!1425519 () Bool)

(assert (=> b!1543685 m!1425519))

(push 1)

(assert (not b!1543685))

(assert (not start!131938))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

