; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131510 () Bool)

(assert start!131510)

(declare-fun res!1057747 () Bool)

(declare-fun e!857148 () Bool)

(assert (=> start!131510 (=> (not res!1057747) (not e!857148))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131510 (= res!1057747 (validMask!0 mask!4052))))

(assert (=> start!131510 e!857148))

(assert (=> start!131510 true))

(declare-datatypes ((array!102413 0))(
  ( (array!102414 (arr!49415 (Array (_ BitVec 32) (_ BitVec 64))) (size!49965 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102413)

(declare-fun array_inv!38443 (array!102413) Bool)

(assert (=> start!131510 (array_inv!38443 a!3920)))

(declare-fun b!1541200 () Bool)

(declare-fun res!1057746 () Bool)

(assert (=> b!1541200 (=> (not res!1057746) (not e!857148))))

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1541200 (= res!1057746 (and (= (size!49965 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49965 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49965 a!3920))))))

(declare-fun b!1541201 () Bool)

(assert (=> b!1541201 (= e!857148 false)))

(declare-fun lt!665608 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102413 (_ BitVec 32)) Bool)

(assert (=> b!1541201 (= lt!665608 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131510 res!1057747) b!1541200))

(assert (= (and b!1541200 res!1057746) b!1541201))

(declare-fun m!1423209 () Bool)

(assert (=> start!131510 m!1423209))

(declare-fun m!1423211 () Bool)

(assert (=> start!131510 m!1423211))

(declare-fun m!1423213 () Bool)

(assert (=> b!1541201 m!1423213))

(push 1)

(assert (not start!131510))

(assert (not b!1541201))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

