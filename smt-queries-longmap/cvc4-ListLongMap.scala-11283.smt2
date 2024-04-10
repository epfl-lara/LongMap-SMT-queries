; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131544 () Bool)

(assert start!131544)

(declare-fun res!1057857 () Bool)

(declare-fun e!857250 () Bool)

(assert (=> start!131544 (=> (not res!1057857) (not e!857250))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131544 (= res!1057857 (validMask!0 mask!4052))))

(assert (=> start!131544 e!857250))

(assert (=> start!131544 true))

(declare-datatypes ((array!102447 0))(
  ( (array!102448 (arr!49432 (Array (_ BitVec 32) (_ BitVec 64))) (size!49982 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102447)

(declare-fun array_inv!38460 (array!102447) Bool)

(assert (=> start!131544 (array_inv!38460 a!3920)))

(declare-fun b!1541311 () Bool)

(declare-fun res!1057858 () Bool)

(assert (=> b!1541311 (=> (not res!1057858) (not e!857250))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541311 (= res!1057858 (and (= (size!49982 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49982 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49982 a!3920))))))

(declare-fun b!1541312 () Bool)

(assert (=> b!1541312 (= e!857250 false)))

(declare-fun lt!665650 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102447 (_ BitVec 32)) Bool)

(assert (=> b!1541312 (= lt!665650 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131544 res!1057857) b!1541311))

(assert (= (and b!1541311 res!1057858) b!1541312))

(declare-fun m!1423311 () Bool)

(assert (=> start!131544 m!1423311))

(declare-fun m!1423313 () Bool)

(assert (=> start!131544 m!1423313))

(declare-fun m!1423315 () Bool)

(assert (=> b!1541312 m!1423315))

(push 1)

(assert (not start!131544))

(assert (not b!1541312))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

