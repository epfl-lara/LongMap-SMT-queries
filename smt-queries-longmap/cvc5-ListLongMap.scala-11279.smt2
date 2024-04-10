; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131516 () Bool)

(assert start!131516)

(declare-fun res!1057765 () Bool)

(declare-fun e!857166 () Bool)

(assert (=> start!131516 (=> (not res!1057765) (not e!857166))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131516 (= res!1057765 (validMask!0 mask!4052))))

(assert (=> start!131516 e!857166))

(assert (=> start!131516 true))

(declare-datatypes ((array!102419 0))(
  ( (array!102420 (arr!49418 (Array (_ BitVec 32) (_ BitVec 64))) (size!49968 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102419)

(declare-fun array_inv!38446 (array!102419) Bool)

(assert (=> start!131516 (array_inv!38446 a!3920)))

(declare-fun b!1541218 () Bool)

(declare-fun res!1057764 () Bool)

(assert (=> b!1541218 (=> (not res!1057764) (not e!857166))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541218 (= res!1057764 (and (= (size!49968 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49968 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49968 a!3920))))))

(declare-fun b!1541219 () Bool)

(assert (=> b!1541219 (= e!857166 false)))

(declare-fun lt!665617 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102419 (_ BitVec 32)) Bool)

(assert (=> b!1541219 (= lt!665617 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131516 res!1057765) b!1541218))

(assert (= (and b!1541218 res!1057764) b!1541219))

(declare-fun m!1423227 () Bool)

(assert (=> start!131516 m!1423227))

(declare-fun m!1423229 () Bool)

(assert (=> start!131516 m!1423229))

(declare-fun m!1423231 () Bool)

(assert (=> b!1541219 m!1423231))

(push 1)

(assert (not start!131516))

(assert (not b!1541219))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

