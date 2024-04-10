; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113900 () Bool)

(assert start!113900)

(declare-fun b!1350656 () Bool)

(declare-fun res!896117 () Bool)

(declare-fun e!768353 () Bool)

(assert (=> b!1350656 (=> res!896117 e!768353)))

(declare-datatypes ((List!31530 0))(
  ( (Nil!31527) (Cons!31526 (h!32735 (_ BitVec 64)) (t!46188 List!31530)) )
))
(declare-fun lt!597022 () List!31530)

(declare-fun noDuplicate!2096 (List!31530) Bool)

(assert (=> b!1350656 (= res!896117 (not (noDuplicate!2096 lt!597022)))))

(declare-fun b!1350657 () Bool)

(assert (=> b!1350657 (= e!768353 true)))

(declare-fun lt!597020 () Bool)

(declare-datatypes ((array!92082 0))(
  ( (array!92083 (arr!44489 (Array (_ BitVec 32) (_ BitVec 64))) (size!45039 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92082)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92082 (_ BitVec 32) List!31530) Bool)

(assert (=> b!1350657 (= lt!597020 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597022))))

(declare-datatypes ((Unit!44232 0))(
  ( (Unit!44233) )
))
(declare-fun lt!597021 () Unit!44232)

(declare-fun acc!759 () List!31530)

(declare-fun noDuplicateSubseq!110 (List!31530 List!31530) Unit!44232)

(assert (=> b!1350657 (= lt!597021 (noDuplicateSubseq!110 acc!759 lt!597022))))

(declare-fun b!1350658 () Bool)

(declare-fun res!896116 () Bool)

(declare-fun e!768355 () Bool)

(assert (=> b!1350658 (=> (not res!896116) (not e!768355))))

(assert (=> b!1350658 (= res!896116 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31527))))

(declare-fun b!1350659 () Bool)

(declare-fun res!896128 () Bool)

(assert (=> b!1350659 (=> (not res!896128) (not e!768355))))

(assert (=> b!1350659 (= res!896128 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45039 a!3742)))))

(declare-fun b!1350660 () Bool)

(declare-fun res!896127 () Bool)

(assert (=> b!1350660 (=> (not res!896127) (not e!768355))))

(declare-fun contains!9239 (List!31530 (_ BitVec 64)) Bool)

(assert (=> b!1350660 (= res!896127 (not (contains!9239 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!896123 () Bool)

(assert (=> start!113900 (=> (not res!896123) (not e!768355))))

(assert (=> start!113900 (= res!896123 (and (bvslt (size!45039 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45039 a!3742))))))

(assert (=> start!113900 e!768355))

(assert (=> start!113900 true))

(declare-fun array_inv!33517 (array!92082) Bool)

(assert (=> start!113900 (array_inv!33517 a!3742)))

(declare-fun b!1350661 () Bool)

(declare-fun res!896124 () Bool)

(assert (=> b!1350661 (=> res!896124 e!768353)))

(declare-fun subseq!659 (List!31530 List!31530) Bool)

(assert (=> b!1350661 (= res!896124 (not (subseq!659 acc!759 lt!597022)))))

(declare-fun b!1350662 () Bool)

(declare-fun res!896119 () Bool)

(assert (=> b!1350662 (=> (not res!896119) (not e!768355))))

(assert (=> b!1350662 (= res!896119 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1350663 () Bool)

(assert (=> b!1350663 (= e!768355 (not e!768353))))

(declare-fun res!896125 () Bool)

(assert (=> b!1350663 (=> res!896125 e!768353)))

(assert (=> b!1350663 (= res!896125 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!674 (List!31530 (_ BitVec 64)) List!31530)

(assert (=> b!1350663 (= lt!597022 ($colon$colon!674 acc!759 (select (arr!44489 a!3742) from!3120)))))

(assert (=> b!1350663 (subseq!659 acc!759 acc!759)))

(declare-fun lt!597019 () Unit!44232)

(declare-fun lemmaListSubSeqRefl!0 (List!31530) Unit!44232)

(assert (=> b!1350663 (= lt!597019 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1350664 () Bool)

(declare-fun res!896115 () Bool)

(assert (=> b!1350664 (=> (not res!896115) (not e!768355))))

(assert (=> b!1350664 (= res!896115 (not (contains!9239 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350665 () Bool)

(declare-fun res!896118 () Bool)

(assert (=> b!1350665 (=> (not res!896118) (not e!768355))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1350665 (= res!896118 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1350666 () Bool)

(declare-fun res!896126 () Bool)

(assert (=> b!1350666 (=> (not res!896126) (not e!768355))))

(assert (=> b!1350666 (= res!896126 (noDuplicate!2096 acc!759))))

(declare-fun b!1350667 () Bool)

(declare-fun res!896114 () Bool)

(assert (=> b!1350667 (=> res!896114 e!768353)))

(assert (=> b!1350667 (= res!896114 (contains!9239 lt!597022 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350668 () Bool)

(declare-fun res!896120 () Bool)

(assert (=> b!1350668 (=> (not res!896120) (not e!768355))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1350668 (= res!896120 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45039 a!3742))))))

(declare-fun b!1350669 () Bool)

(declare-fun res!896122 () Bool)

(assert (=> b!1350669 (=> res!896122 e!768353)))

(assert (=> b!1350669 (= res!896122 (contains!9239 lt!597022 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350670 () Bool)

(declare-fun res!896121 () Bool)

(assert (=> b!1350670 (=> (not res!896121) (not e!768355))))

(assert (=> b!1350670 (= res!896121 (validKeyInArray!0 (select (arr!44489 a!3742) from!3120)))))

(assert (= (and start!113900 res!896123) b!1350666))

(assert (= (and b!1350666 res!896126) b!1350664))

(assert (= (and b!1350664 res!896115) b!1350660))

(assert (= (and b!1350660 res!896127) b!1350658))

(assert (= (and b!1350658 res!896116) b!1350662))

(assert (= (and b!1350662 res!896119) b!1350668))

(assert (= (and b!1350668 res!896120) b!1350665))

(assert (= (and b!1350665 res!896118) b!1350659))

(assert (= (and b!1350659 res!896128) b!1350670))

(assert (= (and b!1350670 res!896121) b!1350663))

(assert (= (and b!1350663 (not res!896125)) b!1350656))

(assert (= (and b!1350656 (not res!896117)) b!1350667))

(assert (= (and b!1350667 (not res!896114)) b!1350669))

(assert (= (and b!1350669 (not res!896122)) b!1350661))

(assert (= (and b!1350661 (not res!896124)) b!1350657))

(declare-fun m!1237837 () Bool)

(assert (=> start!113900 m!1237837))

(declare-fun m!1237839 () Bool)

(assert (=> b!1350670 m!1237839))

(assert (=> b!1350670 m!1237839))

(declare-fun m!1237841 () Bool)

(assert (=> b!1350670 m!1237841))

(declare-fun m!1237843 () Bool)

(assert (=> b!1350667 m!1237843))

(declare-fun m!1237845 () Bool)

(assert (=> b!1350658 m!1237845))

(declare-fun m!1237847 () Bool)

(assert (=> b!1350669 m!1237847))

(declare-fun m!1237849 () Bool)

(assert (=> b!1350656 m!1237849))

(declare-fun m!1237851 () Bool)

(assert (=> b!1350665 m!1237851))

(declare-fun m!1237853 () Bool)

(assert (=> b!1350666 m!1237853))

(assert (=> b!1350663 m!1237839))

(assert (=> b!1350663 m!1237839))

(declare-fun m!1237855 () Bool)

(assert (=> b!1350663 m!1237855))

(declare-fun m!1237857 () Bool)

(assert (=> b!1350663 m!1237857))

(declare-fun m!1237859 () Bool)

(assert (=> b!1350663 m!1237859))

(declare-fun m!1237861 () Bool)

(assert (=> b!1350664 m!1237861))

(declare-fun m!1237863 () Bool)

(assert (=> b!1350660 m!1237863))

(declare-fun m!1237865 () Bool)

(assert (=> b!1350657 m!1237865))

(declare-fun m!1237867 () Bool)

(assert (=> b!1350657 m!1237867))

(declare-fun m!1237869 () Bool)

(assert (=> b!1350661 m!1237869))

(declare-fun m!1237871 () Bool)

(assert (=> b!1350662 m!1237871))

(push 1)

(assert (not b!1350664))

(assert (not b!1350663))

(assert (not b!1350667))

(assert (not b!1350657))

(assert (not b!1350656))

(assert (not b!1350669))

(assert (not start!113900))

(assert (not b!1350660))

(assert (not b!1350662))

(assert (not b!1350665))

(assert (not b!1350661))

(assert (not b!1350670))

(assert (not b!1350666))

(assert (not b!1350658))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

