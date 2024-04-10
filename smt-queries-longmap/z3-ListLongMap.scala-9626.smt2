; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113896 () Bool)

(assert start!113896)

(declare-fun b!1350612 () Bool)

(declare-fun res!896068 () Bool)

(declare-fun e!768339 () Bool)

(assert (=> b!1350612 (=> (not res!896068) (not e!768339))))

(declare-datatypes ((List!31528 0))(
  ( (Nil!31525) (Cons!31524 (h!32733 (_ BitVec 64)) (t!46186 List!31528)) )
))
(declare-fun acc!759 () List!31528)

(declare-fun contains!9237 (List!31528 (_ BitVec 64)) Bool)

(assert (=> b!1350612 (= res!896068 (not (contains!9237 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350611 () Bool)

(declare-fun res!896070 () Bool)

(assert (=> b!1350611 (=> (not res!896070) (not e!768339))))

(assert (=> b!1350611 (= res!896070 (not (contains!9237 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!896071 () Bool)

(assert (=> start!113896 (=> (not res!896071) (not e!768339))))

(declare-datatypes ((array!92078 0))(
  ( (array!92079 (arr!44487 (Array (_ BitVec 32) (_ BitVec 64))) (size!45037 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92078)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113896 (= res!896071 (and (bvslt (size!45037 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45037 a!3742))))))

(assert (=> start!113896 e!768339))

(declare-fun array_inv!33515 (array!92078) Bool)

(assert (=> start!113896 (array_inv!33515 a!3742)))

(assert (=> start!113896 true))

(declare-fun b!1350610 () Bool)

(declare-fun res!896069 () Bool)

(assert (=> b!1350610 (=> (not res!896069) (not e!768339))))

(declare-fun noDuplicate!2094 (List!31528) Bool)

(assert (=> b!1350610 (= res!896069 (noDuplicate!2094 acc!759))))

(declare-fun b!1350613 () Bool)

(assert (=> b!1350613 (= e!768339 false)))

(declare-fun lt!597007 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92078 (_ BitVec 32) List!31528) Bool)

(assert (=> b!1350613 (= lt!597007 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31525))))

(assert (= (and start!113896 res!896071) b!1350610))

(assert (= (and b!1350610 res!896069) b!1350611))

(assert (= (and b!1350611 res!896070) b!1350612))

(assert (= (and b!1350612 res!896068) b!1350613))

(declare-fun m!1237817 () Bool)

(assert (=> b!1350611 m!1237817))

(declare-fun m!1237819 () Bool)

(assert (=> b!1350613 m!1237819))

(declare-fun m!1237821 () Bool)

(assert (=> b!1350610 m!1237821))

(declare-fun m!1237823 () Bool)

(assert (=> b!1350612 m!1237823))

(declare-fun m!1237825 () Bool)

(assert (=> start!113896 m!1237825))

(check-sat (not b!1350612) (not b!1350610) (not start!113896) (not b!1350613) (not b!1350611))
(check-sat)
