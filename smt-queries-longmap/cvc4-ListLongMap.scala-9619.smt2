; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113820 () Bool)

(assert start!113820)

(declare-fun b!1350229 () Bool)

(declare-fun e!768103 () Bool)

(declare-datatypes ((array!92032 0))(
  ( (array!92033 (arr!44467 (Array (_ BitVec 32) (_ BitVec 64))) (size!45017 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92032)

(assert (=> b!1350229 (= e!768103 (bvsgt #b00000000000000000000000000000000 (size!45017 a!3742)))))

(declare-fun res!895687 () Bool)

(assert (=> start!113820 (=> (not res!895687) (not e!768103))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113820 (= res!895687 (and (bvslt (size!45017 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45017 a!3742))))))

(assert (=> start!113820 e!768103))

(declare-fun array_inv!33495 (array!92032) Bool)

(assert (=> start!113820 (array_inv!33495 a!3742)))

(assert (=> start!113820 true))

(declare-fun b!1350227 () Bool)

(declare-fun res!895685 () Bool)

(assert (=> b!1350227 (=> (not res!895685) (not e!768103))))

(declare-datatypes ((List!31508 0))(
  ( (Nil!31505) (Cons!31504 (h!32713 (_ BitVec 64)) (t!46166 List!31508)) )
))
(declare-fun acc!759 () List!31508)

(declare-fun contains!9217 (List!31508 (_ BitVec 64)) Bool)

(assert (=> b!1350227 (= res!895685 (not (contains!9217 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350228 () Bool)

(declare-fun res!895686 () Bool)

(assert (=> b!1350228 (=> (not res!895686) (not e!768103))))

(assert (=> b!1350228 (= res!895686 (not (contains!9217 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350226 () Bool)

(declare-fun res!895684 () Bool)

(assert (=> b!1350226 (=> (not res!895684) (not e!768103))))

(declare-fun noDuplicate!2074 (List!31508) Bool)

(assert (=> b!1350226 (= res!895684 (noDuplicate!2074 acc!759))))

(assert (= (and start!113820 res!895687) b!1350226))

(assert (= (and b!1350226 res!895684) b!1350227))

(assert (= (and b!1350227 res!895685) b!1350228))

(assert (= (and b!1350228 res!895686) b!1350229))

(declare-fun m!1237475 () Bool)

(assert (=> start!113820 m!1237475))

(declare-fun m!1237477 () Bool)

(assert (=> b!1350227 m!1237477))

(declare-fun m!1237479 () Bool)

(assert (=> b!1350228 m!1237479))

(declare-fun m!1237481 () Bool)

(assert (=> b!1350226 m!1237481))

(push 1)

(assert (not start!113820))

(assert (not b!1350226))

(assert (not b!1350227))

(assert (not b!1350228))

(check-sat)

