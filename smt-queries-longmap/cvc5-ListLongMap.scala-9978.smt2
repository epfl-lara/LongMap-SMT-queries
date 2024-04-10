; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117820 () Bool)

(assert start!117820)

(declare-fun b!1381276 () Bool)

(declare-fun res!922903 () Bool)

(declare-fun e!782965 () Bool)

(assert (=> b!1381276 (=> (not res!922903) (not e!782965))))

(declare-datatypes ((array!94259 0))(
  ( (array!94260 (arr!45515 (Array (_ BitVec 32) (_ BitVec 64))) (size!46065 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94259)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381276 (= res!922903 (validKeyInArray!0 (select (arr!45515 a!2971) i!1094)))))

(declare-fun b!1381278 () Bool)

(declare-datatypes ((List!32049 0))(
  ( (Nil!32046) (Cons!32045 (h!33254 (_ BitVec 64)) (t!46743 List!32049)) )
))
(declare-fun noDuplicate!2588 (List!32049) Bool)

(assert (=> b!1381278 (= e!782965 (not (noDuplicate!2588 Nil!32046)))))

(declare-fun res!922906 () Bool)

(assert (=> start!117820 (=> (not res!922906) (not e!782965))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117820 (= res!922906 (validMask!0 mask!3034))))

(assert (=> start!117820 e!782965))

(assert (=> start!117820 true))

(declare-fun array_inv!34543 (array!94259) Bool)

(assert (=> start!117820 (array_inv!34543 a!2971)))

(declare-fun b!1381275 () Bool)

(declare-fun res!922904 () Bool)

(assert (=> b!1381275 (=> (not res!922904) (not e!782965))))

(assert (=> b!1381275 (= res!922904 (and (= (size!46065 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46065 a!2971))))))

(declare-fun b!1381277 () Bool)

(declare-fun res!922905 () Bool)

(assert (=> b!1381277 (=> (not res!922905) (not e!782965))))

(assert (=> b!1381277 (= res!922905 (and (bvsle #b00000000000000000000000000000000 (size!46065 a!2971)) (bvslt (size!46065 a!2971) #b01111111111111111111111111111111)))))

(assert (= (and start!117820 res!922906) b!1381275))

(assert (= (and b!1381275 res!922904) b!1381276))

(assert (= (and b!1381276 res!922903) b!1381277))

(assert (= (and b!1381277 res!922905) b!1381278))

(declare-fun m!1266477 () Bool)

(assert (=> b!1381276 m!1266477))

(assert (=> b!1381276 m!1266477))

(declare-fun m!1266479 () Bool)

(assert (=> b!1381276 m!1266479))

(declare-fun m!1266481 () Bool)

(assert (=> b!1381278 m!1266481))

(declare-fun m!1266483 () Bool)

(assert (=> start!117820 m!1266483))

(declare-fun m!1266485 () Bool)

(assert (=> start!117820 m!1266485))

(push 1)

(assert (not b!1381276))

(assert (not b!1381278))

(assert (not start!117820))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!149049 () Bool)

(assert (=> d!149049 (= (validKeyInArray!0 (select (arr!45515 a!2971) i!1094)) (and (not (= (select (arr!45515 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45515 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1381276 d!149049))

(declare-fun d!149053 () Bool)

(declare-fun res!922947 () Bool)

(declare-fun e!782995 () Bool)

(assert (=> d!149053 (=> res!922947 e!782995)))

(assert (=> d!149053 (= res!922947 (is-Nil!32046 Nil!32046))))

(assert (=> d!149053 (= (noDuplicate!2588 Nil!32046) e!782995)))

