; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131580 () Bool)

(assert start!131580)

(declare-fun b!1541482 () Bool)

(declare-fun res!1058004 () Bool)

(declare-fun e!857340 () Bool)

(assert (=> b!1541482 (=> (not res!1058004) (not e!857340))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(declare-datatypes ((array!102468 0))(
  ( (array!102469 (arr!49441 (Array (_ BitVec 32) (_ BitVec 64))) (size!49991 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102468)

(declare-fun mask!4052 () (_ BitVec 32))

(assert (=> b!1541482 (= res!1058004 (and (= (size!49991 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49991 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49991 a!3920))))))

(declare-fun b!1541483 () Bool)

(declare-fun res!1058005 () Bool)

(assert (=> b!1541483 (=> (not res!1058005) (not e!857340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102468 (_ BitVec 32)) Bool)

(assert (=> b!1541483 (= res!1058005 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1541484 () Bool)

(assert (=> b!1541484 (= e!857340 (not true))))

(assert (=> b!1541484 (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))

(declare-datatypes ((Unit!51484 0))(
  ( (Unit!51485) )
))
(declare-fun lt!665695 () Unit!51484)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!102468 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51484)

(assert (=> b!1541484 (= lt!665695 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3920 mask!4052 (bvadd #b00000000000000000000000000000001 from!3298) newFrom!293))))

(declare-fun b!1541485 () Bool)

(declare-fun res!1058008 () Bool)

(assert (=> b!1541485 (=> (not res!1058008) (not e!857340))))

(assert (=> b!1541485 (= res!1058008 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49991 a!3920))))))

(declare-fun res!1058007 () Bool)

(assert (=> start!131580 (=> (not res!1058007) (not e!857340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131580 (= res!1058007 (validMask!0 mask!4052))))

(assert (=> start!131580 e!857340))

(assert (=> start!131580 true))

(declare-fun array_inv!38469 (array!102468) Bool)

(assert (=> start!131580 (array_inv!38469 a!3920)))

(declare-fun b!1541486 () Bool)

(declare-fun res!1058006 () Bool)

(assert (=> b!1541486 (=> (not res!1058006) (not e!857340))))

(assert (=> b!1541486 (= res!1058006 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(assert (= (and start!131580 res!1058007) b!1541482))

(assert (= (and b!1541482 res!1058004) b!1541483))

(assert (= (and b!1541483 res!1058005) b!1541485))

(assert (= (and b!1541485 res!1058008) b!1541486))

(assert (= (and b!1541486 res!1058006) b!1541484))

(declare-fun m!1423461 () Bool)

(assert (=> b!1541483 m!1423461))

(declare-fun m!1423463 () Bool)

(assert (=> b!1541484 m!1423463))

(declare-fun m!1423465 () Bool)

(assert (=> b!1541484 m!1423465))

(declare-fun m!1423467 () Bool)

(assert (=> start!131580 m!1423467))

(declare-fun m!1423469 () Bool)

(assert (=> start!131580 m!1423469))

(declare-fun m!1423471 () Bool)

(assert (=> b!1541486 m!1423471))

(push 1)

(assert (not start!131580))

(assert (not b!1541483))

(assert (not b!1541484))

(assert (not b!1541486))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

