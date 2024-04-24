; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131908 () Bool)

(assert start!131908)

(declare-fun res!1058555 () Bool)

(declare-fun e!858616 () Bool)

(assert (=> start!131908 (=> (not res!1058555) (not e!858616))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131908 (= res!1058555 (validMask!0 mask!4052))))

(assert (=> start!131908 e!858616))

(assert (=> start!131908 true))

(declare-datatypes ((array!102519 0))(
  ( (array!102520 (arr!49461 (Array (_ BitVec 32) (_ BitVec 64))) (size!50012 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102519)

(declare-fun array_inv!38742 (array!102519) Bool)

(assert (=> start!131908 (array_inv!38742 a!3920)))

(declare-fun b!1543585 () Bool)

(declare-fun res!1058556 () Bool)

(assert (=> b!1543585 (=> (not res!1058556) (not e!858616))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1543585 (= res!1058556 (and (= (size!50012 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!50012 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!50012 a!3920))))))

(declare-fun b!1543586 () Bool)

(assert (=> b!1543586 (= e!858616 false)))

(declare-fun lt!666504 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102519 (_ BitVec 32)) Bool)

(assert (=> b!1543586 (= lt!666504 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131908 res!1058555) b!1543585))

(assert (= (and b!1543585 res!1058556) b!1543586))

(declare-fun m!1425425 () Bool)

(assert (=> start!131908 m!1425425))

(declare-fun m!1425427 () Bool)

(assert (=> start!131908 m!1425427))

(declare-fun m!1425429 () Bool)

(assert (=> b!1543586 m!1425429))

(push 1)

(assert (not b!1543586))

(assert (not start!131908))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

