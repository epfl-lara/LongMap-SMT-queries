; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131866 () Bool)

(assert start!131866)

(declare-fun b!1543316 () Bool)

(declare-fun e!858490 () Bool)

(assert (=> b!1543316 (= e!858490 false)))

(declare-fun lt!666441 () Bool)

(declare-datatypes ((array!102477 0))(
  ( (array!102478 (arr!49440 (Array (_ BitVec 32) (_ BitVec 64))) (size!49991 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102477)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102477 (_ BitVec 32)) Bool)

(assert (=> b!1543316 (= lt!666441 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1543313 () Bool)

(declare-fun res!1058285 () Bool)

(assert (=> b!1543313 (=> (not res!1058285) (not e!858490))))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1543313 (= res!1058285 (and (= (size!49991 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49991 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49991 a!3920))))))

(declare-fun b!1543315 () Bool)

(declare-fun res!1058286 () Bool)

(assert (=> b!1543315 (=> (not res!1058286) (not e!858490))))

(assert (=> b!1543315 (= res!1058286 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49991 a!3920))))))

(declare-fun res!1058284 () Bool)

(assert (=> start!131866 (=> (not res!1058284) (not e!858490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131866 (= res!1058284 (validMask!0 mask!4052))))

(assert (=> start!131866 e!858490))

(assert (=> start!131866 true))

(declare-fun array_inv!38721 (array!102477) Bool)

(assert (=> start!131866 (array_inv!38721 a!3920)))

(declare-fun b!1543314 () Bool)

(declare-fun res!1058283 () Bool)

(assert (=> b!1543314 (=> (not res!1058283) (not e!858490))))

(assert (=> b!1543314 (= res!1058283 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131866 res!1058284) b!1543313))

(assert (= (and b!1543313 res!1058285) b!1543314))

(assert (= (and b!1543314 res!1058283) b!1543315))

(assert (= (and b!1543315 res!1058286) b!1543316))

(declare-fun m!1425213 () Bool)

(assert (=> b!1543316 m!1425213))

(declare-fun m!1425215 () Bool)

(assert (=> start!131866 m!1425215))

(declare-fun m!1425217 () Bool)

(assert (=> start!131866 m!1425217))

(declare-fun m!1425219 () Bool)

(assert (=> b!1543314 m!1425219))

(push 1)

(assert (not b!1543316))

(assert (not start!131866))

(assert (not b!1543314))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

