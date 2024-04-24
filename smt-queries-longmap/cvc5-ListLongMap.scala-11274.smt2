; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131902 () Bool)

(assert start!131902)

(declare-fun b!1543564 () Bool)

(declare-fun res!1058536 () Bool)

(declare-fun e!858598 () Bool)

(assert (=> b!1543564 (=> (not res!1058536) (not e!858598))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102513 0))(
  ( (array!102514 (arr!49458 (Array (_ BitVec 32) (_ BitVec 64))) (size!50009 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102513)

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1543564 (= res!1058536 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!50009 a!3920))))))

(declare-fun b!1543565 () Bool)

(declare-fun res!1058538 () Bool)

(assert (=> b!1543565 (=> (not res!1058538) (not e!858598))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102513 (_ BitVec 32)) Bool)

(assert (=> b!1543565 (= res!1058538 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1543566 () Bool)

(declare-fun res!1058537 () Bool)

(assert (=> b!1543566 (=> (not res!1058537) (not e!858598))))

(assert (=> b!1543566 (= res!1058537 (and (= (size!50009 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!50009 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!50009 a!3920))))))

(declare-fun b!1543567 () Bool)

(declare-fun res!1058534 () Bool)

(assert (=> b!1543567 (=> (not res!1058534) (not e!858598))))

(assert (=> b!1543567 (= res!1058534 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1543568 () Bool)

(assert (=> b!1543568 (= e!858598 (not true))))

(assert (=> b!1543568 (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))

(declare-datatypes ((Unit!51401 0))(
  ( (Unit!51402) )
))
(declare-fun lt!666495 () Unit!51401)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!102513 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51401)

(assert (=> b!1543568 (= lt!666495 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3920 mask!4052 (bvadd #b00000000000000000000000000000001 from!3298) newFrom!293))))

(declare-fun res!1058535 () Bool)

(assert (=> start!131902 (=> (not res!1058535) (not e!858598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131902 (= res!1058535 (validMask!0 mask!4052))))

(assert (=> start!131902 e!858598))

(assert (=> start!131902 true))

(declare-fun array_inv!38739 (array!102513) Bool)

(assert (=> start!131902 (array_inv!38739 a!3920)))

(assert (= (and start!131902 res!1058535) b!1543566))

(assert (= (and b!1543566 res!1058537) b!1543567))

(assert (= (and b!1543567 res!1058534) b!1543564))

(assert (= (and b!1543564 res!1058536) b!1543565))

(assert (= (and b!1543565 res!1058538) b!1543568))

(declare-fun m!1425401 () Bool)

(assert (=> b!1543565 m!1425401))

(declare-fun m!1425403 () Bool)

(assert (=> b!1543567 m!1425403))

(declare-fun m!1425405 () Bool)

(assert (=> b!1543568 m!1425405))

(declare-fun m!1425407 () Bool)

(assert (=> b!1543568 m!1425407))

(declare-fun m!1425409 () Bool)

(assert (=> start!131902 m!1425409))

(declare-fun m!1425411 () Bool)

(assert (=> start!131902 m!1425411))

(push 1)

(assert (not b!1543568))

(assert (not start!131902))

(assert (not b!1543567))

(assert (not b!1543565))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

