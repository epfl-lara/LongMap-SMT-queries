; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131950 () Bool)

(assert start!131950)

(declare-fun res!1058699 () Bool)

(declare-fun e!858741 () Bool)

(assert (=> start!131950 (=> (not res!1058699) (not e!858741))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131950 (= res!1058699 (validMask!0 mask!4052))))

(assert (=> start!131950 e!858741))

(assert (=> start!131950 true))

(declare-datatypes ((array!102561 0))(
  ( (array!102562 (arr!49482 (Array (_ BitVec 32) (_ BitVec 64))) (size!50033 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102561)

(declare-fun array_inv!38763 (array!102561) Bool)

(assert (=> start!131950 (array_inv!38763 a!3920)))

(declare-fun b!1543728 () Bool)

(declare-fun res!1058698 () Bool)

(assert (=> b!1543728 (=> (not res!1058698) (not e!858741))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1543728 (= res!1058698 (and (= (size!50033 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!50033 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!50033 a!3920))))))

(declare-fun b!1543729 () Bool)

(declare-fun res!1058700 () Bool)

(assert (=> b!1543729 (=> (not res!1058700) (not e!858741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102561 (_ BitVec 32)) Bool)

(assert (=> b!1543729 (= res!1058700 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1543730 () Bool)

(assert (=> b!1543730 (= e!858741 (and (bvslt from!3298 newFrom!293) (or (bvslt (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!3298) (size!50033 a!3920)))))))

(assert (= (and start!131950 res!1058699) b!1543728))

(assert (= (and b!1543728 res!1058698) b!1543729))

(assert (= (and b!1543729 res!1058700) b!1543730))

(declare-fun m!1425551 () Bool)

(assert (=> start!131950 m!1425551))

(declare-fun m!1425553 () Bool)

(assert (=> start!131950 m!1425553))

(declare-fun m!1425555 () Bool)

(assert (=> b!1543729 m!1425555))

(push 1)

(assert (not start!131950))

(assert (not b!1543729))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

