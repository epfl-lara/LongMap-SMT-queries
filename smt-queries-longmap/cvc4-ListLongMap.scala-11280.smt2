; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131526 () Bool)

(assert start!131526)

(declare-fun res!1057795 () Bool)

(declare-fun e!857196 () Bool)

(assert (=> start!131526 (=> (not res!1057795) (not e!857196))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131526 (= res!1057795 (validMask!0 mask!4052))))

(assert (=> start!131526 e!857196))

(assert (=> start!131526 true))

(declare-datatypes ((array!102429 0))(
  ( (array!102430 (arr!49423 (Array (_ BitVec 32) (_ BitVec 64))) (size!49973 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102429)

(declare-fun array_inv!38451 (array!102429) Bool)

(assert (=> start!131526 (array_inv!38451 a!3920)))

(declare-fun b!1541248 () Bool)

(declare-fun res!1057794 () Bool)

(assert (=> b!1541248 (=> (not res!1057794) (not e!857196))))

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1541248 (= res!1057794 (and (= (size!49973 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49973 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49973 a!3920))))))

(declare-fun b!1541249 () Bool)

(assert (=> b!1541249 (= e!857196 false)))

(declare-fun lt!665632 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102429 (_ BitVec 32)) Bool)

(assert (=> b!1541249 (= lt!665632 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131526 res!1057795) b!1541248))

(assert (= (and b!1541248 res!1057794) b!1541249))

(declare-fun m!1423257 () Bool)

(assert (=> start!131526 m!1423257))

(declare-fun m!1423259 () Bool)

(assert (=> start!131526 m!1423259))

(declare-fun m!1423261 () Bool)

(assert (=> b!1541249 m!1423261))

(push 1)

(assert (not b!1541249))

(assert (not start!131526))

(check-sat)

(pop 1)

