; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114146 () Bool)

(assert start!114146)

(declare-fun b!1352450 () Bool)

(declare-fun res!897139 () Bool)

(declare-fun e!769295 () Bool)

(assert (=> b!1352450 (=> (not res!897139) (not e!769295))))

(declare-datatypes ((List!31581 0))(
  ( (Nil!31578) (Cons!31577 (h!32795 (_ BitVec 64)) (t!46231 List!31581)) )
))
(declare-fun acc!759 () List!31581)

(declare-datatypes ((array!92219 0))(
  ( (array!92220 (arr!44553 (Array (_ BitVec 32) (_ BitVec 64))) (size!45104 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92219)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92219 (_ BitVec 32) List!31581) Bool)

(assert (=> b!1352450 (= res!897139 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352451 () Bool)

(declare-fun res!897131 () Bool)

(declare-fun e!769296 () Bool)

(assert (=> b!1352451 (=> res!897131 e!769296)))

(declare-fun lt!597629 () List!31581)

(declare-fun subseq!670 (List!31581 List!31581) Bool)

(assert (=> b!1352451 (= res!897131 (not (subseq!670 acc!759 lt!597629)))))

(declare-fun b!1352452 () Bool)

(declare-fun res!897134 () Bool)

(assert (=> b!1352452 (=> (not res!897134) (not e!769295))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352452 (= res!897134 (validKeyInArray!0 (select (arr!44553 a!3742) from!3120)))))

(declare-fun b!1352453 () Bool)

(declare-fun res!897130 () Bool)

(assert (=> b!1352453 (=> (not res!897130) (not e!769295))))

(assert (=> b!1352453 (= res!897130 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45104 a!3742)))))

(declare-fun b!1352454 () Bool)

(declare-fun res!897129 () Bool)

(assert (=> b!1352454 (=> res!897129 e!769296)))

(declare-fun noDuplicate!2124 (List!31581) Bool)

(assert (=> b!1352454 (= res!897129 (not (noDuplicate!2124 lt!597629)))))

(declare-fun b!1352455 () Bool)

(declare-fun res!897133 () Bool)

(assert (=> b!1352455 (=> (not res!897133) (not e!769295))))

(assert (=> b!1352455 (= res!897133 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31578))))

(declare-fun b!1352456 () Bool)

(declare-fun res!897135 () Bool)

(assert (=> b!1352456 (=> (not res!897135) (not e!769295))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352456 (= res!897135 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45104 a!3742))))))

(declare-fun b!1352457 () Bool)

(declare-fun res!897132 () Bool)

(assert (=> b!1352457 (=> (not res!897132) (not e!769295))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1352457 (= res!897132 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352458 () Bool)

(declare-fun res!897136 () Bool)

(assert (=> b!1352458 (=> (not res!897136) (not e!769295))))

(assert (=> b!1352458 (= res!897136 (noDuplicate!2124 acc!759))))

(declare-fun b!1352459 () Bool)

(declare-fun res!897141 () Bool)

(assert (=> b!1352459 (=> (not res!897141) (not e!769295))))

(declare-fun contains!9293 (List!31581 (_ BitVec 64)) Bool)

(assert (=> b!1352459 (= res!897141 (not (contains!9293 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352460 () Bool)

(declare-fun res!897140 () Bool)

(assert (=> b!1352460 (=> res!897140 e!769296)))

(assert (=> b!1352460 (= res!897140 (contains!9293 lt!597629 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1352461 () Bool)

(assert (=> b!1352461 (= e!769295 (not e!769296))))

(declare-fun res!897138 () Bool)

(assert (=> b!1352461 (=> res!897138 e!769296)))

(assert (=> b!1352461 (= res!897138 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!684 (List!31581 (_ BitVec 64)) List!31581)

(assert (=> b!1352461 (= lt!597629 ($colon$colon!684 acc!759 (select (arr!44553 a!3742) from!3120)))))

(assert (=> b!1352461 (subseq!670 acc!759 acc!759)))

(declare-datatypes ((Unit!44193 0))(
  ( (Unit!44194) )
))
(declare-fun lt!597628 () Unit!44193)

(declare-fun lemmaListSubSeqRefl!0 (List!31581) Unit!44193)

(assert (=> b!1352461 (= lt!597628 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun res!897128 () Bool)

(assert (=> start!114146 (=> (not res!897128) (not e!769295))))

(assert (=> start!114146 (= res!897128 (and (bvslt (size!45104 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45104 a!3742))))))

(assert (=> start!114146 e!769295))

(assert (=> start!114146 true))

(declare-fun array_inv!33834 (array!92219) Bool)

(assert (=> start!114146 (array_inv!33834 a!3742)))

(declare-fun b!1352462 () Bool)

(declare-fun res!897137 () Bool)

(assert (=> b!1352462 (=> res!897137 e!769296)))

(assert (=> b!1352462 (= res!897137 (contains!9293 lt!597629 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1352463 () Bool)

(assert (=> b!1352463 (= e!769296 true)))

(declare-fun lt!597627 () Bool)

(assert (=> b!1352463 (= lt!597627 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597629))))

(declare-fun lt!597630 () Unit!44193)

(declare-fun noDuplicateSubseq!121 (List!31581 List!31581) Unit!44193)

(assert (=> b!1352463 (= lt!597630 (noDuplicateSubseq!121 acc!759 lt!597629))))

(declare-fun b!1352464 () Bool)

(declare-fun res!897127 () Bool)

(assert (=> b!1352464 (=> (not res!897127) (not e!769295))))

(assert (=> b!1352464 (= res!897127 (not (contains!9293 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114146 res!897128) b!1352458))

(assert (= (and b!1352458 res!897136) b!1352459))

(assert (= (and b!1352459 res!897141) b!1352464))

(assert (= (and b!1352464 res!897127) b!1352455))

(assert (= (and b!1352455 res!897133) b!1352450))

(assert (= (and b!1352450 res!897139) b!1352456))

(assert (= (and b!1352456 res!897135) b!1352457))

(assert (= (and b!1352457 res!897132) b!1352453))

(assert (= (and b!1352453 res!897130) b!1352452))

(assert (= (and b!1352452 res!897134) b!1352461))

(assert (= (and b!1352461 (not res!897138)) b!1352454))

(assert (= (and b!1352454 (not res!897129)) b!1352460))

(assert (= (and b!1352460 (not res!897140)) b!1352462))

(assert (= (and b!1352462 (not res!897137)) b!1352451))

(assert (= (and b!1352451 (not res!897131)) b!1352463))

(declare-fun m!1239829 () Bool)

(assert (=> b!1352463 m!1239829))

(declare-fun m!1239831 () Bool)

(assert (=> b!1352463 m!1239831))

(declare-fun m!1239833 () Bool)

(assert (=> b!1352452 m!1239833))

(assert (=> b!1352452 m!1239833))

(declare-fun m!1239835 () Bool)

(assert (=> b!1352452 m!1239835))

(assert (=> b!1352461 m!1239833))

(assert (=> b!1352461 m!1239833))

(declare-fun m!1239837 () Bool)

(assert (=> b!1352461 m!1239837))

(declare-fun m!1239839 () Bool)

(assert (=> b!1352461 m!1239839))

(declare-fun m!1239841 () Bool)

(assert (=> b!1352461 m!1239841))

(declare-fun m!1239843 () Bool)

(assert (=> b!1352454 m!1239843))

(declare-fun m!1239845 () Bool)

(assert (=> b!1352455 m!1239845))

(declare-fun m!1239847 () Bool)

(assert (=> b!1352462 m!1239847))

(declare-fun m!1239849 () Bool)

(assert (=> b!1352464 m!1239849))

(declare-fun m!1239851 () Bool)

(assert (=> b!1352451 m!1239851))

(declare-fun m!1239853 () Bool)

(assert (=> start!114146 m!1239853))

(declare-fun m!1239855 () Bool)

(assert (=> b!1352450 m!1239855))

(declare-fun m!1239857 () Bool)

(assert (=> b!1352457 m!1239857))

(declare-fun m!1239859 () Bool)

(assert (=> b!1352460 m!1239859))

(declare-fun m!1239861 () Bool)

(assert (=> b!1352459 m!1239861))

(declare-fun m!1239863 () Bool)

(assert (=> b!1352458 m!1239863))

(push 1)

(assert (not b!1352452))

(assert (not b!1352455))

(assert (not b!1352461))

(assert (not b!1352457))

(assert (not b!1352450))

(assert (not b!1352460))

(assert (not b!1352451))

(assert (not b!1352454))

(assert (not b!1352464))

(assert (not b!1352462))

(assert (not b!1352463))

(assert (not start!114146))

(assert (not b!1352458))

(assert (not b!1352459))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

