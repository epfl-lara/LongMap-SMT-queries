; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113816 () Bool)

(assert start!113816)

(declare-fun b!1350133 () Bool)

(declare-fun res!895633 () Bool)

(declare-fun e!768058 () Bool)

(assert (=> b!1350133 (=> (not res!895633) (not e!768058))))

(declare-datatypes ((List!31559 0))(
  ( (Nil!31556) (Cons!31555 (h!32764 (_ BitVec 64)) (t!46209 List!31559)) )
))
(declare-fun acc!759 () List!31559)

(declare-fun contains!9179 (List!31559 (_ BitVec 64)) Bool)

(assert (=> b!1350133 (= res!895633 (not (contains!9179 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350132 () Bool)

(declare-fun res!895632 () Bool)

(assert (=> b!1350132 (=> (not res!895632) (not e!768058))))

(declare-fun noDuplicate!2094 (List!31559) Bool)

(assert (=> b!1350132 (= res!895632 (noDuplicate!2094 acc!759))))

(declare-fun b!1350135 () Bool)

(declare-datatypes ((array!91977 0))(
  ( (array!91978 (arr!44440 (Array (_ BitVec 32) (_ BitVec 64))) (size!44992 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!91977)

(assert (=> b!1350135 (= e!768058 (bvsgt #b00000000000000000000000000000000 (size!44992 a!3742)))))

(declare-fun b!1350134 () Bool)

(declare-fun res!895631 () Bool)

(assert (=> b!1350134 (=> (not res!895631) (not e!768058))))

(assert (=> b!1350134 (= res!895631 (not (contains!9179 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!895634 () Bool)

(assert (=> start!113816 (=> (not res!895634) (not e!768058))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113816 (= res!895634 (and (bvslt (size!44992 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!44992 a!3742))))))

(assert (=> start!113816 e!768058))

(declare-fun array_inv!33673 (array!91977) Bool)

(assert (=> start!113816 (array_inv!33673 a!3742)))

(assert (=> start!113816 true))

(assert (= (and start!113816 res!895634) b!1350132))

(assert (= (and b!1350132 res!895632) b!1350133))

(assert (= (and b!1350133 res!895633) b!1350134))

(assert (= (and b!1350134 res!895631) b!1350135))

(declare-fun m!1236943 () Bool)

(assert (=> b!1350133 m!1236943))

(declare-fun m!1236945 () Bool)

(assert (=> b!1350132 m!1236945))

(declare-fun m!1236947 () Bool)

(assert (=> b!1350134 m!1236947))

(declare-fun m!1236949 () Bool)

(assert (=> start!113816 m!1236949))

(check-sat (not b!1350134) (not b!1350132) (not start!113816) (not b!1350133))
(check-sat)
