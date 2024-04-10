; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117792 () Bool)

(assert start!117792)

(declare-fun res!922847 () Bool)

(declare-fun e!782929 () Bool)

(assert (=> start!117792 (=> (not res!922847) (not e!782929))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117792 (= res!922847 (validMask!0 mask!3034))))

(assert (=> start!117792 e!782929))

(assert (=> start!117792 true))

(declare-datatypes ((array!94244 0))(
  ( (array!94245 (arr!45509 (Array (_ BitVec 32) (_ BitVec 64))) (size!46059 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94244)

(declare-fun array_inv!34537 (array!94244) Bool)

(assert (=> start!117792 (array_inv!34537 a!2971)))

(declare-fun b!1381219 () Bool)

(declare-fun res!922848 () Bool)

(assert (=> b!1381219 (=> (not res!922848) (not e!782929))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381219 (= res!922848 (and (= (size!46059 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46059 a!2971))))))

(declare-fun b!1381220 () Bool)

(declare-fun res!922849 () Bool)

(assert (=> b!1381220 (=> (not res!922849) (not e!782929))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381220 (= res!922849 (validKeyInArray!0 (select (arr!45509 a!2971) i!1094)))))

(declare-fun b!1381221 () Bool)

(assert (=> b!1381221 (= e!782929 (bvsgt #b00000000000000000000000000000000 (size!46059 a!2971)))))

(assert (= (and start!117792 res!922847) b!1381219))

(assert (= (and b!1381219 res!922848) b!1381220))

(assert (= (and b!1381220 res!922849) b!1381221))

(declare-fun m!1266429 () Bool)

(assert (=> start!117792 m!1266429))

(declare-fun m!1266431 () Bool)

(assert (=> start!117792 m!1266431))

(declare-fun m!1266433 () Bool)

(assert (=> b!1381220 m!1266433))

(assert (=> b!1381220 m!1266433))

(declare-fun m!1266435 () Bool)

(assert (=> b!1381220 m!1266435))

(push 1)

(assert (not start!117792))

(assert (not b!1381220))

(check-sat)

