; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113882 () Bool)

(assert start!113882)

(declare-fun res!895957 () Bool)

(declare-fun e!768264 () Bool)

(assert (=> start!113882 (=> (not res!895957) (not e!768264))))

(declare-datatypes ((array!92013 0))(
  ( (array!92014 (arr!44455 (Array (_ BitVec 32) (_ BitVec 64))) (size!45007 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92013)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113882 (= res!895957 (and (bvslt (size!45007 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45007 a!3742))))))

(assert (=> start!113882 e!768264))

(declare-fun array_inv!33688 (array!92013) Bool)

(assert (=> start!113882 (array_inv!33688 a!3742)))

(assert (=> start!113882 true))

(declare-fun b!1350459 () Bool)

(assert (=> b!1350459 (= e!768264 false)))

(declare-fun lt!596800 () Bool)

(declare-datatypes ((List!31574 0))(
  ( (Nil!31571) (Cons!31570 (h!32779 (_ BitVec 64)) (t!46224 List!31574)) )
))
(declare-fun arrayNoDuplicates!0 (array!92013 (_ BitVec 32) List!31574) Bool)

(assert (=> b!1350459 (= lt!596800 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31571))))

(declare-fun b!1350458 () Bool)

(declare-fun res!895958 () Bool)

(assert (=> b!1350458 (=> (not res!895958) (not e!768264))))

(declare-fun acc!759 () List!31574)

(declare-fun contains!9194 (List!31574 (_ BitVec 64)) Bool)

(assert (=> b!1350458 (= res!895958 (not (contains!9194 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350456 () Bool)

(declare-fun res!895956 () Bool)

(assert (=> b!1350456 (=> (not res!895956) (not e!768264))))

(declare-fun noDuplicate!2109 (List!31574) Bool)

(assert (=> b!1350456 (= res!895956 (noDuplicate!2109 acc!759))))

(declare-fun b!1350457 () Bool)

(declare-fun res!895955 () Bool)

(assert (=> b!1350457 (=> (not res!895955) (not e!768264))))

(assert (=> b!1350457 (= res!895955 (not (contains!9194 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!113882 res!895957) b!1350456))

(assert (= (and b!1350456 res!895956) b!1350457))

(assert (= (and b!1350457 res!895955) b!1350458))

(assert (= (and b!1350458 res!895958) b!1350459))

(declare-fun m!1237231 () Bool)

(assert (=> start!113882 m!1237231))

(declare-fun m!1237233 () Bool)

(assert (=> b!1350457 m!1237233))

(declare-fun m!1237235 () Bool)

(assert (=> b!1350458 m!1237235))

(declare-fun m!1237237 () Bool)

(assert (=> b!1350456 m!1237237))

(declare-fun m!1237239 () Bool)

(assert (=> b!1350459 m!1237239))

(check-sat (not start!113882) (not b!1350456) (not b!1350457) (not b!1350459) (not b!1350458))
(check-sat)
