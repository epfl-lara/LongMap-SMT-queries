; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131944 () Bool)

(assert start!131944)

(declare-fun res!1058672 () Bool)

(declare-fun e!858723 () Bool)

(assert (=> start!131944 (=> (not res!1058672) (not e!858723))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131944 (= res!1058672 (validMask!0 mask!4052))))

(assert (=> start!131944 e!858723))

(assert (=> start!131944 true))

(declare-datatypes ((array!102555 0))(
  ( (array!102556 (arr!49479 (Array (_ BitVec 32) (_ BitVec 64))) (size!50030 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102555)

(declare-fun array_inv!38760 (array!102555) Bool)

(assert (=> start!131944 (array_inv!38760 a!3920)))

(declare-fun b!1543702 () Bool)

(declare-fun res!1058673 () Bool)

(assert (=> b!1543702 (=> (not res!1058673) (not e!858723))))

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1543702 (= res!1058673 (and (= (size!50030 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!50030 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!50030 a!3920))))))

(declare-fun b!1543703 () Bool)

(assert (=> b!1543703 (= e!858723 false)))

(declare-fun lt!666549 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102555 (_ BitVec 32)) Bool)

(assert (=> b!1543703 (= lt!666549 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131944 res!1058672) b!1543702))

(assert (= (and b!1543702 res!1058673) b!1543703))

(declare-fun m!1425533 () Bool)

(assert (=> start!131944 m!1425533))

(declare-fun m!1425535 () Bool)

(assert (=> start!131944 m!1425535))

(declare-fun m!1425537 () Bool)

(assert (=> b!1543703 m!1425537))

(push 1)

(assert (not b!1543703))

(assert (not start!131944))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

