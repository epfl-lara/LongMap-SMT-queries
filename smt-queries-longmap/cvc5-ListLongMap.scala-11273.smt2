; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131480 () Bool)

(assert start!131480)

(declare-fun b!1541053 () Bool)

(declare-fun res!1057603 () Bool)

(declare-fun e!857058 () Bool)

(assert (=> b!1541053 (=> (not res!1057603) (not e!857058))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102383 0))(
  ( (array!102384 (arr!49400 (Array (_ BitVec 32) (_ BitVec 64))) (size!49950 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102383)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(assert (=> b!1541053 (= res!1057603 (and (= (size!49950 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49950 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49950 a!3920))))))

(declare-fun b!1541054 () Bool)

(declare-fun res!1057600 () Bool)

(assert (=> b!1541054 (=> (not res!1057600) (not e!857058))))

(assert (=> b!1541054 (= res!1057600 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49950 a!3920))))))

(declare-fun b!1541055 () Bool)

(declare-fun res!1057599 () Bool)

(assert (=> b!1541055 (=> (not res!1057599) (not e!857058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102383 (_ BitVec 32)) Bool)

(assert (=> b!1541055 (= res!1057599 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1541056 () Bool)

(assert (=> b!1541056 (= e!857058 (not (bvsge newFrom!293 #b00000000000000000000000000000000)))))

(assert (=> b!1541056 (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))

(declare-datatypes ((Unit!51462 0))(
  ( (Unit!51463) )
))
(declare-fun lt!665572 () Unit!51462)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!102383 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51462)

(assert (=> b!1541056 (= lt!665572 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3920 mask!4052 (bvadd #b00000000000000000000000000000001 from!3298) newFrom!293))))

(declare-fun b!1541057 () Bool)

(declare-fun res!1057601 () Bool)

(assert (=> b!1541057 (=> (not res!1057601) (not e!857058))))

(assert (=> b!1541057 (= res!1057601 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun res!1057602 () Bool)

(assert (=> start!131480 (=> (not res!1057602) (not e!857058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131480 (= res!1057602 (validMask!0 mask!4052))))

(assert (=> start!131480 e!857058))

(assert (=> start!131480 true))

(declare-fun array_inv!38428 (array!102383) Bool)

(assert (=> start!131480 (array_inv!38428 a!3920)))

(assert (= (and start!131480 res!1057602) b!1541053))

(assert (= (and b!1541053 res!1057603) b!1541057))

(assert (= (and b!1541057 res!1057601) b!1541054))

(assert (= (and b!1541054 res!1057600) b!1541055))

(assert (= (and b!1541055 res!1057599) b!1541056))

(declare-fun m!1423083 () Bool)

(assert (=> b!1541055 m!1423083))

(declare-fun m!1423085 () Bool)

(assert (=> b!1541056 m!1423085))

(declare-fun m!1423087 () Bool)

(assert (=> b!1541056 m!1423087))

(declare-fun m!1423089 () Bool)

(assert (=> b!1541057 m!1423089))

(declare-fun m!1423091 () Bool)

(assert (=> start!131480 m!1423091))

(declare-fun m!1423093 () Bool)

(assert (=> start!131480 m!1423093))

(push 1)

(assert (not b!1541055))

(assert (not start!131480))

(assert (not b!1541056))

(assert (not b!1541057))

(check-sat)

(pop 1)

(push 1)

(check-sat)

