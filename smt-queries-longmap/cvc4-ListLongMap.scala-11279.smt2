; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131520 () Bool)

(assert start!131520)

(declare-fun res!1057776 () Bool)

(declare-fun e!857178 () Bool)

(assert (=> start!131520 (=> (not res!1057776) (not e!857178))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131520 (= res!1057776 (validMask!0 mask!4052))))

(assert (=> start!131520 e!857178))

(assert (=> start!131520 true))

(declare-datatypes ((array!102423 0))(
  ( (array!102424 (arr!49420 (Array (_ BitVec 32) (_ BitVec 64))) (size!49970 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102423)

(declare-fun array_inv!38448 (array!102423) Bool)

(assert (=> start!131520 (array_inv!38448 a!3920)))

(declare-fun b!1541230 () Bool)

(declare-fun res!1057777 () Bool)

(assert (=> b!1541230 (=> (not res!1057777) (not e!857178))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541230 (= res!1057777 (and (= (size!49970 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49970 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49970 a!3920))))))

(declare-fun b!1541231 () Bool)

(assert (=> b!1541231 (= e!857178 false)))

(declare-fun lt!665623 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102423 (_ BitVec 32)) Bool)

(assert (=> b!1541231 (= lt!665623 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131520 res!1057776) b!1541230))

(assert (= (and b!1541230 res!1057777) b!1541231))

(declare-fun m!1423239 () Bool)

(assert (=> start!131520 m!1423239))

(declare-fun m!1423241 () Bool)

(assert (=> start!131520 m!1423241))

(declare-fun m!1423243 () Bool)

(assert (=> b!1541231 m!1423243))

(push 1)

(assert (not b!1541231))

(assert (not start!131520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

