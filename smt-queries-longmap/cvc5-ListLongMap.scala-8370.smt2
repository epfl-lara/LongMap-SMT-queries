; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101822 () Bool)

(assert start!101822)

(declare-fun b!1226366 () Bool)

(declare-fun res!815064 () Bool)

(declare-fun e!696484 () Bool)

(assert (=> b!1226366 (=> (not res!815064) (not e!696484))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79088 0))(
  ( (array!79089 (arr!38170 (Array (_ BitVec 32) (_ BitVec 64))) (size!38708 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79088)

(assert (=> b!1226366 (= res!815064 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38708 a!3806)) (bvslt from!3184 (size!38708 a!3806))))))

(declare-fun b!1226367 () Bool)

(declare-fun res!815063 () Bool)

(assert (=> b!1226367 (=> (not res!815063) (not e!696484))))

(declare-datatypes ((List!27044 0))(
  ( (Nil!27041) (Cons!27040 (h!28249 (_ BitVec 64)) (t!40498 List!27044)) )
))
(declare-fun acc!823 () List!27044)

(declare-fun contains!7016 (List!27044 (_ BitVec 64)) Bool)

(assert (=> b!1226367 (= res!815063 (not (contains!7016 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226368 () Bool)

(declare-fun res!815062 () Bool)

(assert (=> b!1226368 (=> (not res!815062) (not e!696484))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226368 (= res!815062 (validKeyInArray!0 k!2913))))

(declare-fun res!815065 () Bool)

(assert (=> start!101822 (=> (not res!815065) (not e!696484))))

(assert (=> start!101822 (= res!815065 (bvslt (size!38708 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101822 e!696484))

(declare-fun array_inv!29153 (array!79088) Bool)

(assert (=> start!101822 (array_inv!29153 a!3806)))

(assert (=> start!101822 true))

(declare-fun b!1226369 () Bool)

(assert (=> b!1226369 (= e!696484 false)))

(declare-fun lt!558638 () Bool)

(assert (=> b!1226369 (= lt!558638 (contains!7016 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1226370 () Bool)

(declare-fun res!815066 () Bool)

(assert (=> b!1226370 (=> (not res!815066) (not e!696484))))

(declare-fun noDuplicate!1659 (List!27044) Bool)

(assert (=> b!1226370 (= res!815066 (noDuplicate!1659 acc!823))))

(assert (= (and start!101822 res!815065) b!1226368))

(assert (= (and b!1226368 res!815062) b!1226366))

(assert (= (and b!1226366 res!815064) b!1226370))

(assert (= (and b!1226370 res!815066) b!1226367))

(assert (= (and b!1226367 res!815063) b!1226369))

(declare-fun m!1130999 () Bool)

(assert (=> b!1226368 m!1130999))

(declare-fun m!1131001 () Bool)

(assert (=> b!1226369 m!1131001))

(declare-fun m!1131003 () Bool)

(assert (=> b!1226370 m!1131003))

(declare-fun m!1131005 () Bool)

(assert (=> b!1226367 m!1131005))

(declare-fun m!1131007 () Bool)

(assert (=> start!101822 m!1131007))

(push 1)

(assert (not b!1226369))

(assert (not b!1226368))

(assert (not b!1226367))

(assert (not start!101822))

(assert (not b!1226370))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

