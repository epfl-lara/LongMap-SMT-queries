; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131514 () Bool)

(assert start!131514)

(declare-fun res!1057758 () Bool)

(declare-fun e!857161 () Bool)

(assert (=> start!131514 (=> (not res!1057758) (not e!857161))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131514 (= res!1057758 (validMask!0 mask!4052))))

(assert (=> start!131514 e!857161))

(assert (=> start!131514 true))

(declare-datatypes ((array!102417 0))(
  ( (array!102418 (arr!49417 (Array (_ BitVec 32) (_ BitVec 64))) (size!49967 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102417)

(declare-fun array_inv!38445 (array!102417) Bool)

(assert (=> start!131514 (array_inv!38445 a!3920)))

(declare-fun b!1541212 () Bool)

(declare-fun res!1057759 () Bool)

(assert (=> b!1541212 (=> (not res!1057759) (not e!857161))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541212 (= res!1057759 (and (= (size!49967 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49967 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49967 a!3920))))))

(declare-fun b!1541213 () Bool)

(assert (=> b!1541213 (= e!857161 false)))

(declare-fun lt!665614 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102417 (_ BitVec 32)) Bool)

(assert (=> b!1541213 (= lt!665614 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131514 res!1057758) b!1541212))

(assert (= (and b!1541212 res!1057759) b!1541213))

(declare-fun m!1423221 () Bool)

(assert (=> start!131514 m!1423221))

(declare-fun m!1423223 () Bool)

(assert (=> start!131514 m!1423223))

(declare-fun m!1423225 () Bool)

(assert (=> b!1541213 m!1423225))

(push 1)

(assert (not start!131514))

(assert (not b!1541213))

(check-sat)

(pop 1)

