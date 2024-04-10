; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131478 () Bool)

(assert start!131478)

(declare-fun b!1541038 () Bool)

(declare-fun res!1057584 () Bool)

(declare-fun e!857053 () Bool)

(assert (=> b!1541038 (=> (not res!1057584) (not e!857053))))

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-datatypes ((array!102381 0))(
  ( (array!102382 (arr!49399 (Array (_ BitVec 32) (_ BitVec 64))) (size!49949 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102381)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102381 (_ BitVec 32)) Bool)

(assert (=> b!1541038 (= res!1057584 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1541039 () Bool)

(declare-fun res!1057588 () Bool)

(assert (=> b!1541039 (=> (not res!1057588) (not e!857053))))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1541039 (= res!1057588 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49949 a!3920))))))

(declare-fun res!1057585 () Bool)

(assert (=> start!131478 (=> (not res!1057585) (not e!857053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131478 (= res!1057585 (validMask!0 mask!4052))))

(assert (=> start!131478 e!857053))

(assert (=> start!131478 true))

(declare-fun array_inv!38427 (array!102381) Bool)

(assert (=> start!131478 (array_inv!38427 a!3920)))

(declare-fun b!1541040 () Bool)

(declare-fun res!1057587 () Bool)

(assert (=> b!1541040 (=> (not res!1057587) (not e!857053))))

(assert (=> b!1541040 (= res!1057587 (and (= (size!49949 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49949 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49949 a!3920))))))

(declare-fun b!1541041 () Bool)

(declare-fun res!1057586 () Bool)

(assert (=> b!1541041 (=> (not res!1057586) (not e!857053))))

(assert (=> b!1541041 (= res!1057586 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1541042 () Bool)

(assert (=> b!1541042 (= e!857053 (not true))))

(assert (=> b!1541042 (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))

(declare-datatypes ((Unit!51460 0))(
  ( (Unit!51461) )
))
(declare-fun lt!665569 () Unit!51460)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!102381 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51460)

(assert (=> b!1541042 (= lt!665569 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3920 mask!4052 (bvadd #b00000000000000000000000000000001 from!3298) newFrom!293))))

(assert (= (and start!131478 res!1057585) b!1541040))

(assert (= (and b!1541040 res!1057587) b!1541038))

(assert (= (and b!1541038 res!1057584) b!1541039))

(assert (= (and b!1541039 res!1057588) b!1541041))

(assert (= (and b!1541041 res!1057586) b!1541042))

(declare-fun m!1423071 () Bool)

(assert (=> b!1541038 m!1423071))

(declare-fun m!1423073 () Bool)

(assert (=> start!131478 m!1423073))

(declare-fun m!1423075 () Bool)

(assert (=> start!131478 m!1423075))

(declare-fun m!1423077 () Bool)

(assert (=> b!1541041 m!1423077))

(declare-fun m!1423079 () Bool)

(assert (=> b!1541042 m!1423079))

(declare-fun m!1423081 () Bool)

(assert (=> b!1541042 m!1423081))

(push 1)

(assert (not start!131478))

(assert (not b!1541041))

(assert (not b!1541042))

(assert (not b!1541038))

(check-sat)

