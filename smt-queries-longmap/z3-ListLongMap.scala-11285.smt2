; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131572 () Bool)

(assert start!131572)

(declare-fun b!1541422 () Bool)

(declare-fun res!1057945 () Bool)

(declare-fun e!857317 () Bool)

(assert (=> b!1541422 (=> (not res!1057945) (not e!857317))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102460 0))(
  ( (array!102461 (arr!49437 (Array (_ BitVec 32) (_ BitVec 64))) (size!49987 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102460)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(assert (=> b!1541422 (= res!1057945 (and (= (size!49987 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49987 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49987 a!3920))))))

(declare-fun b!1541423 () Bool)

(declare-fun res!1057946 () Bool)

(assert (=> b!1541423 (=> (not res!1057946) (not e!857317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102460 (_ BitVec 32)) Bool)

(assert (=> b!1541423 (= res!1057946 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1541424 () Bool)

(declare-fun res!1057947 () Bool)

(assert (=> b!1541424 (=> (not res!1057947) (not e!857317))))

(assert (=> b!1541424 (= res!1057947 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49987 a!3920))))))

(declare-fun res!1057948 () Bool)

(assert (=> start!131572 (=> (not res!1057948) (not e!857317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131572 (= res!1057948 (validMask!0 mask!4052))))

(assert (=> start!131572 e!857317))

(assert (=> start!131572 true))

(declare-fun array_inv!38465 (array!102460) Bool)

(assert (=> start!131572 (array_inv!38465 a!3920)))

(declare-fun b!1541425 () Bool)

(declare-fun res!1057944 () Bool)

(assert (=> b!1541425 (=> (not res!1057944) (not e!857317))))

(assert (=> b!1541425 (= res!1057944 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1541426 () Bool)

(assert (=> b!1541426 (= e!857317 (bvsge (bvsub newFrom!293 (bvadd #b00000000000000000000000000000001 from!3298)) (bvsub newFrom!293 from!3298)))))

(assert (= (and start!131572 res!1057948) b!1541422))

(assert (= (and b!1541422 res!1057945) b!1541425))

(assert (= (and b!1541425 res!1057944) b!1541424))

(assert (= (and b!1541424 res!1057947) b!1541423))

(assert (= (and b!1541423 res!1057946) b!1541426))

(declare-fun m!1423421 () Bool)

(assert (=> b!1541423 m!1423421))

(declare-fun m!1423423 () Bool)

(assert (=> start!131572 m!1423423))

(declare-fun m!1423425 () Bool)

(assert (=> start!131572 m!1423425))

(declare-fun m!1423427 () Bool)

(assert (=> b!1541425 m!1423427))

(check-sat (not b!1541425) (not b!1541423) (not start!131572))
(check-sat)
