; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113824 () Bool)

(assert start!113824)

(declare-fun res!895704 () Bool)

(declare-fun e!768114 () Bool)

(assert (=> start!113824 (=> (not res!895704) (not e!768114))))

(declare-datatypes ((array!92036 0))(
  ( (array!92037 (arr!44469 (Array (_ BitVec 32) (_ BitVec 64))) (size!45019 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92036)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113824 (= res!895704 (and (bvslt (size!45019 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45019 a!3742))))))

(assert (=> start!113824 e!768114))

(declare-fun array_inv!33497 (array!92036) Bool)

(assert (=> start!113824 (array_inv!33497 a!3742)))

(assert (=> start!113824 true))

(declare-fun b!1350245 () Bool)

(declare-fun res!895705 () Bool)

(assert (=> b!1350245 (=> (not res!895705) (not e!768114))))

(declare-datatypes ((List!31510 0))(
  ( (Nil!31507) (Cons!31506 (h!32715 (_ BitVec 64)) (t!46168 List!31510)) )
))
(declare-fun acc!759 () List!31510)

(declare-fun noDuplicate!2076 (List!31510) Bool)

(assert (=> b!1350245 (= res!895705 (noDuplicate!2076 acc!759))))

(declare-fun b!1350246 () Bool)

(declare-fun res!895703 () Bool)

(assert (=> b!1350246 (=> (not res!895703) (not e!768114))))

(declare-fun contains!9219 (List!31510 (_ BitVec 64)) Bool)

(assert (=> b!1350246 (= res!895703 (not (contains!9219 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350247 () Bool)

(assert (=> b!1350247 (= e!768114 false)))

(declare-fun lt!596950 () Bool)

(assert (=> b!1350247 (= lt!596950 (contains!9219 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!113824 res!895704) b!1350245))

(assert (= (and b!1350245 res!895705) b!1350246))

(assert (= (and b!1350246 res!895703) b!1350247))

(declare-fun m!1237491 () Bool)

(assert (=> start!113824 m!1237491))

(declare-fun m!1237493 () Bool)

(assert (=> b!1350245 m!1237493))

(declare-fun m!1237495 () Bool)

(assert (=> b!1350246 m!1237495))

(declare-fun m!1237497 () Bool)

(assert (=> b!1350247 m!1237497))

(check-sat (not b!1350245) (not b!1350246) (not start!113824) (not b!1350247))
(check-sat)
