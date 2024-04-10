; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114014 () Bool)

(assert start!114014)

(declare-fun res!898194 () Bool)

(declare-fun e!768967 () Bool)

(assert (=> start!114014 (=> (not res!898194) (not e!768967))))

(declare-datatypes ((array!92196 0))(
  ( (array!92197 (arr!44546 (Array (_ BitVec 32) (_ BitVec 64))) (size!45096 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92196)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114014 (= res!898194 (and (bvslt (size!45096 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45096 a!3742))))))

(assert (=> start!114014 e!768967))

(assert (=> start!114014 true))

(declare-fun array_inv!33574 (array!92196) Bool)

(assert (=> start!114014 (array_inv!33574 a!3742)))

(declare-fun b!1352938 () Bool)

(declare-fun e!768969 () Bool)

(assert (=> b!1352938 (= e!768967 e!768969)))

(declare-fun res!898195 () Bool)

(assert (=> b!1352938 (=> (not res!898195) (not e!768969))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352938 (= res!898195 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44379 0))(
  ( (Unit!44380) )
))
(declare-fun lt!597703 () Unit!44379)

(declare-fun e!768970 () Unit!44379)

(assert (=> b!1352938 (= lt!597703 e!768970)))

(declare-fun c!126812 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352938 (= c!126812 (validKeyInArray!0 (select (arr!44546 a!3742) from!3120)))))

(declare-fun b!1352939 () Bool)

(declare-fun res!898201 () Bool)

(assert (=> b!1352939 (=> (not res!898201) (not e!768969))))

(declare-datatypes ((List!31587 0))(
  ( (Nil!31584) (Cons!31583 (h!32792 (_ BitVec 64)) (t!46245 List!31587)) )
))
(declare-fun acc!759 () List!31587)

(declare-fun arrayNoDuplicates!0 (array!92196 (_ BitVec 32) List!31587) Bool)

(assert (=> b!1352939 (= res!898201 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352940 () Bool)

(declare-fun lt!597706 () Unit!44379)

(assert (=> b!1352940 (= e!768970 lt!597706)))

(declare-fun lt!597704 () Unit!44379)

(declare-fun lemmaListSubSeqRefl!0 (List!31587) Unit!44379)

(assert (=> b!1352940 (= lt!597704 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!716 (List!31587 List!31587) Bool)

(assert (=> b!1352940 (subseq!716 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92196 List!31587 List!31587 (_ BitVec 32)) Unit!44379)

(declare-fun $colon$colon!731 (List!31587 (_ BitVec 64)) List!31587)

(assert (=> b!1352940 (= lt!597706 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!731 acc!759 (select (arr!44546 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352940 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352941 () Bool)

(declare-fun res!898196 () Bool)

(assert (=> b!1352941 (=> (not res!898196) (not e!768967))))

(assert (=> b!1352941 (= res!898196 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45096 a!3742))))))

(declare-fun b!1352942 () Bool)

(declare-fun res!898200 () Bool)

(assert (=> b!1352942 (=> (not res!898200) (not e!768967))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1352942 (= res!898200 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352943 () Bool)

(declare-fun res!898203 () Bool)

(assert (=> b!1352943 (=> (not res!898203) (not e!768967))))

(assert (=> b!1352943 (= res!898203 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31584))))

(declare-fun b!1352944 () Bool)

(assert (=> b!1352944 (= e!768969 (not true))))

(assert (=> b!1352944 (arrayNoDuplicates!0 (array!92197 (store (arr!44546 a!3742) i!1404 l!3587) (size!45096 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!597705 () Unit!44379)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92196 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31587) Unit!44379)

(assert (=> b!1352944 (= lt!597705 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352945 () Bool)

(declare-fun res!898202 () Bool)

(assert (=> b!1352945 (=> (not res!898202) (not e!768967))))

(declare-fun contains!9296 (List!31587 (_ BitVec 64)) Bool)

(assert (=> b!1352945 (= res!898202 (not (contains!9296 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352946 () Bool)

(declare-fun res!898197 () Bool)

(assert (=> b!1352946 (=> (not res!898197) (not e!768967))))

(assert (=> b!1352946 (= res!898197 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352947 () Bool)

(declare-fun res!898198 () Bool)

(assert (=> b!1352947 (=> (not res!898198) (not e!768967))))

(assert (=> b!1352947 (= res!898198 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45096 a!3742)))))

(declare-fun b!1352948 () Bool)

(declare-fun Unit!44381 () Unit!44379)

(assert (=> b!1352948 (= e!768970 Unit!44381)))

(declare-fun b!1352949 () Bool)

(declare-fun res!898204 () Bool)

(assert (=> b!1352949 (=> (not res!898204) (not e!768967))))

(assert (=> b!1352949 (= res!898204 (not (contains!9296 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352950 () Bool)

(declare-fun res!898199 () Bool)

(assert (=> b!1352950 (=> (not res!898199) (not e!768967))))

(declare-fun noDuplicate!2153 (List!31587) Bool)

(assert (=> b!1352950 (= res!898199 (noDuplicate!2153 acc!759))))

(assert (= (and start!114014 res!898194) b!1352950))

(assert (= (and b!1352950 res!898199) b!1352949))

(assert (= (and b!1352949 res!898204) b!1352945))

(assert (= (and b!1352945 res!898202) b!1352943))

(assert (= (and b!1352943 res!898203) b!1352946))

(assert (= (and b!1352946 res!898197) b!1352941))

(assert (= (and b!1352941 res!898196) b!1352942))

(assert (= (and b!1352942 res!898200) b!1352947))

(assert (= (and b!1352947 res!898198) b!1352938))

(assert (= (and b!1352938 c!126812) b!1352940))

(assert (= (and b!1352938 (not c!126812)) b!1352948))

(assert (= (and b!1352938 res!898195) b!1352939))

(assert (= (and b!1352939 res!898201) b!1352944))

(declare-fun m!1239661 () Bool)

(assert (=> b!1352949 m!1239661))

(declare-fun m!1239663 () Bool)

(assert (=> start!114014 m!1239663))

(declare-fun m!1239665 () Bool)

(assert (=> b!1352940 m!1239665))

(declare-fun m!1239667 () Bool)

(assert (=> b!1352940 m!1239667))

(declare-fun m!1239669 () Bool)

(assert (=> b!1352940 m!1239669))

(declare-fun m!1239671 () Bool)

(assert (=> b!1352940 m!1239671))

(declare-fun m!1239673 () Bool)

(assert (=> b!1352940 m!1239673))

(assert (=> b!1352940 m!1239667))

(assert (=> b!1352940 m!1239669))

(declare-fun m!1239675 () Bool)

(assert (=> b!1352940 m!1239675))

(declare-fun m!1239677 () Bool)

(assert (=> b!1352942 m!1239677))

(declare-fun m!1239679 () Bool)

(assert (=> b!1352943 m!1239679))

(declare-fun m!1239681 () Bool)

(assert (=> b!1352946 m!1239681))

(assert (=> b!1352939 m!1239673))

(declare-fun m!1239683 () Bool)

(assert (=> b!1352945 m!1239683))

(assert (=> b!1352938 m!1239667))

(assert (=> b!1352938 m!1239667))

(declare-fun m!1239685 () Bool)

(assert (=> b!1352938 m!1239685))

(declare-fun m!1239687 () Bool)

(assert (=> b!1352950 m!1239687))

(declare-fun m!1239689 () Bool)

(assert (=> b!1352944 m!1239689))

(declare-fun m!1239691 () Bool)

(assert (=> b!1352944 m!1239691))

(declare-fun m!1239693 () Bool)

(assert (=> b!1352944 m!1239693))

(push 1)

