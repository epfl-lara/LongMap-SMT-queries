; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131486 () Bool)

(assert start!131486)

(declare-fun b!1541098 () Bool)

(declare-fun e!857077 () Bool)

(assert (=> b!1541098 (= e!857077 (not true))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102389 0))(
  ( (array!102390 (arr!49403 (Array (_ BitVec 32) (_ BitVec 64))) (size!49953 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102389)

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102389 (_ BitVec 32)) Bool)

(assert (=> b!1541098 (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))

(declare-datatypes ((Unit!51468 0))(
  ( (Unit!51469) )
))
(declare-fun lt!665581 () Unit!51468)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!102389 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51468)

(assert (=> b!1541098 (= lt!665581 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3920 mask!4052 (bvadd #b00000000000000000000000000000001 from!3298) newFrom!293))))

(declare-fun b!1541099 () Bool)

(declare-fun res!1057646 () Bool)

(assert (=> b!1541099 (=> (not res!1057646) (not e!857077))))

(assert (=> b!1541099 (= res!1057646 (and (= (size!49953 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49953 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49953 a!3920))))))

(declare-fun b!1541100 () Bool)

(declare-fun res!1057644 () Bool)

(assert (=> b!1541100 (=> (not res!1057644) (not e!857077))))

(assert (=> b!1541100 (= res!1057644 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49953 a!3920))))))

(declare-fun b!1541101 () Bool)

(declare-fun res!1057645 () Bool)

(assert (=> b!1541101 (=> (not res!1057645) (not e!857077))))

(assert (=> b!1541101 (= res!1057645 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun res!1057647 () Bool)

(assert (=> start!131486 (=> (not res!1057647) (not e!857077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131486 (= res!1057647 (validMask!0 mask!4052))))

(assert (=> start!131486 e!857077))

(assert (=> start!131486 true))

(declare-fun array_inv!38431 (array!102389) Bool)

(assert (=> start!131486 (array_inv!38431 a!3920)))

(declare-fun b!1541102 () Bool)

(declare-fun res!1057648 () Bool)

(assert (=> b!1541102 (=> (not res!1057648) (not e!857077))))

(assert (=> b!1541102 (= res!1057648 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(assert (= (and start!131486 res!1057647) b!1541099))

(assert (= (and b!1541099 res!1057646) b!1541101))

(assert (= (and b!1541101 res!1057645) b!1541100))

(assert (= (and b!1541100 res!1057644) b!1541102))

(assert (= (and b!1541102 res!1057648) b!1541098))

(declare-fun m!1423119 () Bool)

(assert (=> b!1541098 m!1423119))

(declare-fun m!1423121 () Bool)

(assert (=> b!1541098 m!1423121))

(declare-fun m!1423123 () Bool)

(assert (=> b!1541101 m!1423123))

(declare-fun m!1423125 () Bool)

(assert (=> start!131486 m!1423125))

(declare-fun m!1423127 () Bool)

(assert (=> start!131486 m!1423127))

(declare-fun m!1423129 () Bool)

(assert (=> b!1541102 m!1423129))

(push 1)

(assert (not start!131486))

(assert (not b!1541101))

(assert (not b!1541102))

(assert (not b!1541098))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

