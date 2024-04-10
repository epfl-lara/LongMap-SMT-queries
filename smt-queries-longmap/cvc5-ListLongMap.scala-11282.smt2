; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131534 () Bool)

(assert start!131534)

(declare-fun res!1057821 () Bool)

(declare-fun e!857221 () Bool)

(assert (=> start!131534 (=> (not res!1057821) (not e!857221))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131534 (= res!1057821 (validMask!0 mask!4052))))

(assert (=> start!131534 e!857221))

(assert (=> start!131534 true))

(declare-datatypes ((array!102437 0))(
  ( (array!102438 (arr!49427 (Array (_ BitVec 32) (_ BitVec 64))) (size!49977 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102437)

(declare-fun array_inv!38455 (array!102437) Bool)

(assert (=> start!131534 (array_inv!38455 a!3920)))

(declare-fun b!1541274 () Bool)

(declare-fun res!1057822 () Bool)

(assert (=> b!1541274 (=> (not res!1057822) (not e!857221))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541274 (= res!1057822 (and (= (size!49977 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49977 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49977 a!3920))))))

(declare-fun b!1541275 () Bool)

(declare-fun res!1057820 () Bool)

(assert (=> b!1541275 (=> (not res!1057820) (not e!857221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102437 (_ BitVec 32)) Bool)

(assert (=> b!1541275 (= res!1057820 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1541276 () Bool)

(assert (=> b!1541276 (= e!857221 (and (bvslt from!3298 newFrom!293) (or (bvslt (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!3298) (size!49977 a!3920)))))))

(assert (= (and start!131534 res!1057821) b!1541274))

(assert (= (and b!1541274 res!1057822) b!1541275))

(assert (= (and b!1541275 res!1057820) b!1541276))

(declare-fun m!1423281 () Bool)

(assert (=> start!131534 m!1423281))

(declare-fun m!1423283 () Bool)

(assert (=> start!131534 m!1423283))

(declare-fun m!1423285 () Bool)

(assert (=> b!1541275 m!1423285))

(push 1)

(assert (not b!1541275))

(assert (not start!131534))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

