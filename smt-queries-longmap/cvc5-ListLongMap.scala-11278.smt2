; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131464 () Bool)

(assert start!131464)

(declare-fun res!1057629 () Bool)

(declare-fun e!856962 () Bool)

(assert (=> start!131464 (=> (not res!1057629) (not e!856962))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131464 (= res!1057629 (validMask!0 mask!4052))))

(assert (=> start!131464 e!856962))

(assert (=> start!131464 true))

(declare-datatypes ((array!102365 0))(
  ( (array!102366 (arr!49392 (Array (_ BitVec 32) (_ BitVec 64))) (size!49944 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102365)

(declare-fun array_inv!38625 (array!102365) Bool)

(assert (=> start!131464 (array_inv!38625 a!3920)))

(declare-fun b!1540899 () Bool)

(declare-fun res!1057630 () Bool)

(assert (=> b!1540899 (=> (not res!1057630) (not e!856962))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1540899 (= res!1057630 (and (= (size!49944 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49944 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49944 a!3920))))))

(declare-fun b!1540900 () Bool)

(assert (=> b!1540900 (= e!856962 false)))

(declare-fun lt!665328 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102365 (_ BitVec 32)) Bool)

(assert (=> b!1540900 (= lt!665328 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131464 res!1057629) b!1540899))

(assert (= (and b!1540899 res!1057630) b!1540900))

(declare-fun m!1422329 () Bool)

(assert (=> start!131464 m!1422329))

(declare-fun m!1422331 () Bool)

(assert (=> start!131464 m!1422331))

(declare-fun m!1422333 () Bool)

(assert (=> b!1540900 m!1422333))

(push 1)

(assert (not b!1540900))

(assert (not start!131464))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

