; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113876 () Bool)

(assert start!113876)

(declare-fun b!1350413 () Bool)

(declare-fun res!895915 () Bool)

(declare-fun e!768247 () Bool)

(assert (=> b!1350413 (=> (not res!895915) (not e!768247))))

(declare-datatypes ((List!31571 0))(
  ( (Nil!31568) (Cons!31567 (h!32776 (_ BitVec 64)) (t!46221 List!31571)) )
))
(declare-fun acc!759 () List!31571)

(declare-fun contains!9191 (List!31571 (_ BitVec 64)) Bool)

(assert (=> b!1350413 (= res!895915 (not (contains!9191 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350414 () Bool)

(declare-fun res!895913 () Bool)

(assert (=> b!1350414 (=> (not res!895913) (not e!768247))))

(assert (=> b!1350414 (= res!895913 (not (contains!9191 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350415 () Bool)

(declare-fun res!895916 () Bool)

(assert (=> b!1350415 (=> (not res!895916) (not e!768247))))

(declare-fun noDuplicate!2106 (List!31571) Bool)

(assert (=> b!1350415 (= res!895916 (noDuplicate!2106 acc!759))))

(declare-fun res!895912 () Bool)

(assert (=> start!113876 (=> (not res!895912) (not e!768247))))

(declare-datatypes ((array!92007 0))(
  ( (array!92008 (arr!44452 (Array (_ BitVec 32) (_ BitVec 64))) (size!45004 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92007)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113876 (= res!895912 (and (bvslt (size!45004 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45004 a!3742))))))

(assert (=> start!113876 e!768247))

(declare-fun array_inv!33685 (array!92007) Bool)

(assert (=> start!113876 (array_inv!33685 a!3742)))

(assert (=> start!113876 true))

(declare-fun b!1350416 () Bool)

(declare-fun res!895914 () Bool)

(assert (=> b!1350416 (=> (not res!895914) (not e!768247))))

(declare-fun arrayNoDuplicates!0 (array!92007 (_ BitVec 32) List!31571) Bool)

(assert (=> b!1350416 (= res!895914 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31568))))

(declare-fun b!1350417 () Bool)

(assert (=> b!1350417 (= e!768247 (bvsgt from!3120 (size!45004 a!3742)))))

(assert (= (and start!113876 res!895912) b!1350415))

(assert (= (and b!1350415 res!895916) b!1350413))

(assert (= (and b!1350413 res!895915) b!1350414))

(assert (= (and b!1350414 res!895913) b!1350416))

(assert (= (and b!1350416 res!895914) b!1350417))

(declare-fun m!1237201 () Bool)

(assert (=> b!1350415 m!1237201))

(declare-fun m!1237203 () Bool)

(assert (=> b!1350416 m!1237203))

(declare-fun m!1237205 () Bool)

(assert (=> b!1350413 m!1237205))

(declare-fun m!1237207 () Bool)

(assert (=> start!113876 m!1237207))

(declare-fun m!1237209 () Bool)

(assert (=> b!1350414 m!1237209))

(check-sat (not b!1350416) (not start!113876) (not b!1350414) (not b!1350413) (not b!1350415))
(check-sat)
