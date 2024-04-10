; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113878 () Bool)

(assert start!113878)

(declare-fun b!1350498 () Bool)

(declare-fun res!895956 () Bool)

(declare-fun e!768286 () Bool)

(assert (=> b!1350498 (=> (not res!895956) (not e!768286))))

(declare-datatypes ((List!31519 0))(
  ( (Nil!31516) (Cons!31515 (h!32724 (_ BitVec 64)) (t!46177 List!31519)) )
))
(declare-fun acc!759 () List!31519)

(declare-fun contains!9228 (List!31519 (_ BitVec 64)) Bool)

(assert (=> b!1350498 (= res!895956 (not (contains!9228 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350499 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92060 0))(
  ( (array!92061 (arr!44478 (Array (_ BitVec 32) (_ BitVec 64))) (size!45028 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92060)

(assert (=> b!1350499 (= e!768286 (bvsgt from!3120 (size!45028 a!3742)))))

(declare-fun b!1350500 () Bool)

(declare-fun res!895958 () Bool)

(assert (=> b!1350500 (=> (not res!895958) (not e!768286))))

(declare-fun noDuplicate!2085 (List!31519) Bool)

(assert (=> b!1350500 (= res!895958 (noDuplicate!2085 acc!759))))

(declare-fun res!895957 () Bool)

(assert (=> start!113878 (=> (not res!895957) (not e!768286))))

(assert (=> start!113878 (= res!895957 (and (bvslt (size!45028 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45028 a!3742))))))

(assert (=> start!113878 e!768286))

(declare-fun array_inv!33506 (array!92060) Bool)

(assert (=> start!113878 (array_inv!33506 a!3742)))

(assert (=> start!113878 true))

(declare-fun b!1350501 () Bool)

(declare-fun res!895959 () Bool)

(assert (=> b!1350501 (=> (not res!895959) (not e!768286))))

(assert (=> b!1350501 (= res!895959 (not (contains!9228 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350502 () Bool)

(declare-fun res!895960 () Bool)

(assert (=> b!1350502 (=> (not res!895960) (not e!768286))))

(declare-fun arrayNoDuplicates!0 (array!92060 (_ BitVec 32) List!31519) Bool)

(assert (=> b!1350502 (= res!895960 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31516))))

(assert (= (and start!113878 res!895957) b!1350500))

(assert (= (and b!1350500 res!895958) b!1350498))

(assert (= (and b!1350498 res!895956) b!1350501))

(assert (= (and b!1350501 res!895959) b!1350502))

(assert (= (and b!1350502 res!895960) b!1350499))

(declare-fun m!1237727 () Bool)

(assert (=> b!1350501 m!1237727))

(declare-fun m!1237729 () Bool)

(assert (=> b!1350500 m!1237729))

(declare-fun m!1237731 () Bool)

(assert (=> start!113878 m!1237731))

(declare-fun m!1237733 () Bool)

(assert (=> b!1350498 m!1237733))

(declare-fun m!1237735 () Bool)

(assert (=> b!1350502 m!1237735))

(check-sat (not start!113878) (not b!1350498) (not b!1350502) (not b!1350501) (not b!1350500))
(check-sat)
