; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131482 () Bool)

(assert start!131482)

(declare-fun res!1057683 () Bool)

(declare-fun e!857016 () Bool)

(assert (=> start!131482 (=> (not res!1057683) (not e!857016))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131482 (= res!1057683 (validMask!0 mask!4052))))

(assert (=> start!131482 e!857016))

(assert (=> start!131482 true))

(declare-datatypes ((array!102383 0))(
  ( (array!102384 (arr!49401 (Array (_ BitVec 32) (_ BitVec 64))) (size!49953 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102383)

(declare-fun array_inv!38634 (array!102383) Bool)

(assert (=> start!131482 (array_inv!38634 a!3920)))

(declare-fun b!1540953 () Bool)

(declare-fun res!1057684 () Bool)

(assert (=> b!1540953 (=> (not res!1057684) (not e!857016))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1540953 (= res!1057684 (and (= (size!49953 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49953 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49953 a!3920))))))

(declare-fun b!1540954 () Bool)

(assert (=> b!1540954 (= e!857016 false)))

(declare-fun lt!665355 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102383 (_ BitVec 32)) Bool)

(assert (=> b!1540954 (= lt!665355 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131482 res!1057683) b!1540953))

(assert (= (and b!1540953 res!1057684) b!1540954))

(declare-fun m!1422383 () Bool)

(assert (=> start!131482 m!1422383))

(declare-fun m!1422385 () Bool)

(assert (=> start!131482 m!1422385))

(declare-fun m!1422387 () Bool)

(assert (=> b!1540954 m!1422387))

(push 1)

(assert (not b!1540954))

(assert (not start!131482))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

