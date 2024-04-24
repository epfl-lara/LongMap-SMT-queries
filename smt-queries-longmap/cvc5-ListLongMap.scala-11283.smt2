; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131956 () Bool)

(assert start!131956)

(declare-fun res!1058717 () Bool)

(declare-fun e!858760 () Bool)

(assert (=> start!131956 (=> (not res!1058717) (not e!858760))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131956 (= res!1058717 (validMask!0 mask!4052))))

(assert (=> start!131956 e!858760))

(assert (=> start!131956 true))

(declare-datatypes ((array!102567 0))(
  ( (array!102568 (arr!49485 (Array (_ BitVec 32) (_ BitVec 64))) (size!50036 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102567)

(declare-fun array_inv!38766 (array!102567) Bool)

(assert (=> start!131956 (array_inv!38766 a!3920)))

(declare-fun b!1543747 () Bool)

(declare-fun res!1058718 () Bool)

(assert (=> b!1543747 (=> (not res!1058718) (not e!858760))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1543747 (= res!1058718 (and (= (size!50036 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!50036 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!50036 a!3920))))))

(declare-fun b!1543748 () Bool)

(assert (=> b!1543748 (= e!858760 false)))

(declare-fun lt!666558 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102567 (_ BitVec 32)) Bool)

(assert (=> b!1543748 (= lt!666558 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131956 res!1058717) b!1543747))

(assert (= (and b!1543747 res!1058718) b!1543748))

(declare-fun m!1425569 () Bool)

(assert (=> start!131956 m!1425569))

(declare-fun m!1425571 () Bool)

(assert (=> start!131956 m!1425571))

(declare-fun m!1425573 () Bool)

(assert (=> b!1543748 m!1425573))

(push 1)

(assert (not start!131956))

(assert (not b!1543748))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

