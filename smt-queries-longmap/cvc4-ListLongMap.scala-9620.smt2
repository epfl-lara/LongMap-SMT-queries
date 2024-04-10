; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113826 () Bool)

(assert start!113826)

(declare-fun res!895712 () Bool)

(declare-fun e!768120 () Bool)

(assert (=> start!113826 (=> (not res!895712) (not e!768120))))

(declare-datatypes ((array!92038 0))(
  ( (array!92039 (arr!44470 (Array (_ BitVec 32) (_ BitVec 64))) (size!45020 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92038)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113826 (= res!895712 (and (bvslt (size!45020 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45020 a!3742))))))

(assert (=> start!113826 e!768120))

(declare-fun array_inv!33498 (array!92038) Bool)

(assert (=> start!113826 (array_inv!33498 a!3742)))

(assert (=> start!113826 true))

(declare-fun b!1350254 () Bool)

(declare-fun res!895713 () Bool)

(assert (=> b!1350254 (=> (not res!895713) (not e!768120))))

(declare-datatypes ((List!31511 0))(
  ( (Nil!31508) (Cons!31507 (h!32716 (_ BitVec 64)) (t!46169 List!31511)) )
))
(declare-fun acc!759 () List!31511)

(declare-fun noDuplicate!2077 (List!31511) Bool)

(assert (=> b!1350254 (= res!895713 (noDuplicate!2077 acc!759))))

(declare-fun b!1350255 () Bool)

(declare-fun res!895714 () Bool)

(assert (=> b!1350255 (=> (not res!895714) (not e!768120))))

(declare-fun contains!9220 (List!31511 (_ BitVec 64)) Bool)

(assert (=> b!1350255 (= res!895714 (not (contains!9220 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350256 () Bool)

(assert (=> b!1350256 (= e!768120 false)))

(declare-fun lt!596953 () Bool)

(assert (=> b!1350256 (= lt!596953 (contains!9220 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!113826 res!895712) b!1350254))

(assert (= (and b!1350254 res!895713) b!1350255))

(assert (= (and b!1350255 res!895714) b!1350256))

(declare-fun m!1237499 () Bool)

(assert (=> start!113826 m!1237499))

(declare-fun m!1237501 () Bool)

(assert (=> b!1350254 m!1237501))

(declare-fun m!1237503 () Bool)

(assert (=> b!1350255 m!1237503))

(declare-fun m!1237505 () Bool)

(assert (=> b!1350256 m!1237505))

(push 1)

(assert (not b!1350254))

(assert (not b!1350255))

(assert (not start!113826))

(assert (not b!1350256))

(check-sat)

(pop 1)

