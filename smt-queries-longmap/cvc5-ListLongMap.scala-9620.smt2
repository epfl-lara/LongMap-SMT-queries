; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113822 () Bool)

(assert start!113822)

(declare-fun res!895694 () Bool)

(declare-fun e!768109 () Bool)

(assert (=> start!113822 (=> (not res!895694) (not e!768109))))

(declare-datatypes ((array!92034 0))(
  ( (array!92035 (arr!44468 (Array (_ BitVec 32) (_ BitVec 64))) (size!45018 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92034)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113822 (= res!895694 (and (bvslt (size!45018 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45018 a!3742))))))

(assert (=> start!113822 e!768109))

(declare-fun array_inv!33496 (array!92034) Bool)

(assert (=> start!113822 (array_inv!33496 a!3742)))

(assert (=> start!113822 true))

(declare-fun b!1350236 () Bool)

(declare-fun res!895695 () Bool)

(assert (=> b!1350236 (=> (not res!895695) (not e!768109))))

(declare-datatypes ((List!31509 0))(
  ( (Nil!31506) (Cons!31505 (h!32714 (_ BitVec 64)) (t!46167 List!31509)) )
))
(declare-fun acc!759 () List!31509)

(declare-fun noDuplicate!2075 (List!31509) Bool)

(assert (=> b!1350236 (= res!895695 (noDuplicate!2075 acc!759))))

(declare-fun b!1350237 () Bool)

(declare-fun res!895696 () Bool)

(assert (=> b!1350237 (=> (not res!895696) (not e!768109))))

(declare-fun contains!9218 (List!31509 (_ BitVec 64)) Bool)

(assert (=> b!1350237 (= res!895696 (not (contains!9218 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350238 () Bool)

(assert (=> b!1350238 (= e!768109 false)))

(declare-fun lt!596947 () Bool)

(assert (=> b!1350238 (= lt!596947 (contains!9218 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!113822 res!895694) b!1350236))

(assert (= (and b!1350236 res!895695) b!1350237))

(assert (= (and b!1350237 res!895696) b!1350238))

(declare-fun m!1237483 () Bool)

(assert (=> start!113822 m!1237483))

(declare-fun m!1237485 () Bool)

(assert (=> b!1350236 m!1237485))

(declare-fun m!1237487 () Bool)

(assert (=> b!1350237 m!1237487))

(declare-fun m!1237489 () Bool)

(assert (=> b!1350238 m!1237489))

(push 1)

(assert (not b!1350237))

(assert (not start!113822))

(assert (not b!1350238))

(assert (not b!1350236))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

