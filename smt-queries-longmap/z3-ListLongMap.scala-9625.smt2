; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113890 () Bool)

(assert start!113890)

(declare-fun res!896034 () Bool)

(declare-fun e!768321 () Bool)

(assert (=> start!113890 (=> (not res!896034) (not e!768321))))

(declare-datatypes ((array!92072 0))(
  ( (array!92073 (arr!44484 (Array (_ BitVec 32) (_ BitVec 64))) (size!45034 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92072)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113890 (= res!896034 (and (bvslt (size!45034 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45034 a!3742))))))

(assert (=> start!113890 e!768321))

(declare-fun array_inv!33512 (array!92072) Bool)

(assert (=> start!113890 (array_inv!33512 a!3742)))

(assert (=> start!113890 true))

(declare-fun b!1350577 () Bool)

(assert (=> b!1350577 (= e!768321 false)))

(declare-fun lt!596998 () Bool)

(declare-datatypes ((List!31525 0))(
  ( (Nil!31522) (Cons!31521 (h!32730 (_ BitVec 64)) (t!46183 List!31525)) )
))
(declare-fun arrayNoDuplicates!0 (array!92072 (_ BitVec 32) List!31525) Bool)

(assert (=> b!1350577 (= lt!596998 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31522))))

(declare-fun b!1350575 () Bool)

(declare-fun res!896032 () Bool)

(assert (=> b!1350575 (=> (not res!896032) (not e!768321))))

(declare-fun acc!759 () List!31525)

(declare-fun contains!9234 (List!31525 (_ BitVec 64)) Bool)

(assert (=> b!1350575 (= res!896032 (not (contains!9234 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350576 () Bool)

(declare-fun res!896035 () Bool)

(assert (=> b!1350576 (=> (not res!896035) (not e!768321))))

(assert (=> b!1350576 (= res!896035 (not (contains!9234 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350574 () Bool)

(declare-fun res!896033 () Bool)

(assert (=> b!1350574 (=> (not res!896033) (not e!768321))))

(declare-fun noDuplicate!2091 (List!31525) Bool)

(assert (=> b!1350574 (= res!896033 (noDuplicate!2091 acc!759))))

(assert (= (and start!113890 res!896034) b!1350574))

(assert (= (and b!1350574 res!896033) b!1350575))

(assert (= (and b!1350575 res!896032) b!1350576))

(assert (= (and b!1350576 res!896035) b!1350577))

(declare-fun m!1237787 () Bool)

(assert (=> b!1350575 m!1237787))

(declare-fun m!1237789 () Bool)

(assert (=> b!1350577 m!1237789))

(declare-fun m!1237791 () Bool)

(assert (=> b!1350574 m!1237791))

(declare-fun m!1237793 () Bool)

(assert (=> b!1350576 m!1237793))

(declare-fun m!1237795 () Bool)

(assert (=> start!113890 m!1237795))

(check-sat (not b!1350576) (not b!1350574) (not b!1350575) (not b!1350577) (not start!113890))
(check-sat)
