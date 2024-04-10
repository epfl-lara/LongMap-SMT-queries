; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113922 () Bool)

(assert start!113922)

(declare-fun b!1351151 () Bool)

(declare-fun res!896611 () Bool)

(declare-fun e!768454 () Bool)

(assert (=> b!1351151 (=> (not res!896611) (not e!768454))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92104 0))(
  ( (array!92105 (arr!44500 (Array (_ BitVec 32) (_ BitVec 64))) (size!45050 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92104)

(assert (=> b!1351151 (= res!896611 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45050 a!3742))))))

(declare-fun b!1351152 () Bool)

(declare-fun res!896616 () Bool)

(declare-fun e!768452 () Bool)

(assert (=> b!1351152 (=> res!896616 e!768452)))

(declare-datatypes ((List!31541 0))(
  ( (Nil!31538) (Cons!31537 (h!32746 (_ BitVec 64)) (t!46199 List!31541)) )
))
(declare-fun lt!597154 () List!31541)

(declare-fun noDuplicate!2107 (List!31541) Bool)

(assert (=> b!1351152 (= res!896616 (not (noDuplicate!2107 lt!597154)))))

(declare-fun b!1351154 () Bool)

(declare-fun res!896609 () Bool)

(assert (=> b!1351154 (=> (not res!896609) (not e!768454))))

(declare-fun acc!759 () List!31541)

(declare-fun contains!9250 (List!31541 (_ BitVec 64)) Bool)

(assert (=> b!1351154 (= res!896609 (not (contains!9250 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351155 () Bool)

(declare-fun res!896612 () Bool)

(assert (=> b!1351155 (=> (not res!896612) (not e!768454))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351155 (= res!896612 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1351156 () Bool)

(declare-fun res!896617 () Bool)

(assert (=> b!1351156 (=> (not res!896617) (not e!768454))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1351156 (= res!896617 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45050 a!3742)))))

(declare-fun b!1351157 () Bool)

(assert (=> b!1351157 (= e!768452 true)))

(declare-fun lt!597152 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92104 (_ BitVec 32) List!31541) Bool)

(assert (=> b!1351157 (= lt!597152 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597154))))

(declare-datatypes ((Unit!44254 0))(
  ( (Unit!44255) )
))
(declare-fun lt!597151 () Unit!44254)

(declare-fun noDuplicateSubseq!121 (List!31541 List!31541) Unit!44254)

(assert (=> b!1351157 (= lt!597151 (noDuplicateSubseq!121 acc!759 lt!597154))))

(declare-fun b!1351158 () Bool)

(declare-fun res!896619 () Bool)

(assert (=> b!1351158 (=> (not res!896619) (not e!768454))))

(assert (=> b!1351158 (= res!896619 (noDuplicate!2107 acc!759))))

(declare-fun b!1351159 () Bool)

(declare-fun res!896610 () Bool)

(assert (=> b!1351159 (=> res!896610 e!768452)))

(assert (=> b!1351159 (= res!896610 (contains!9250 lt!597154 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351160 () Bool)

(declare-fun res!896614 () Bool)

(assert (=> b!1351160 (=> (not res!896614) (not e!768454))))

(assert (=> b!1351160 (= res!896614 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31538))))

(declare-fun b!1351161 () Bool)

(declare-fun res!896613 () Bool)

(assert (=> b!1351161 (=> (not res!896613) (not e!768454))))

(assert (=> b!1351161 (= res!896613 (not (contains!9250 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351162 () Bool)

(declare-fun res!896620 () Bool)

(assert (=> b!1351162 (=> (not res!896620) (not e!768454))))

(assert (=> b!1351162 (= res!896620 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351163 () Bool)

(declare-fun res!896621 () Bool)

(assert (=> b!1351163 (=> res!896621 e!768452)))

(assert (=> b!1351163 (= res!896621 (contains!9250 lt!597154 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351153 () Bool)

(assert (=> b!1351153 (= e!768454 (not e!768452))))

(declare-fun res!896622 () Bool)

(assert (=> b!1351153 (=> res!896622 e!768452)))

(assert (=> b!1351153 (= res!896622 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!685 (List!31541 (_ BitVec 64)) List!31541)

(assert (=> b!1351153 (= lt!597154 ($colon$colon!685 acc!759 (select (arr!44500 a!3742) from!3120)))))

(declare-fun subseq!670 (List!31541 List!31541) Bool)

(assert (=> b!1351153 (subseq!670 acc!759 acc!759)))

(declare-fun lt!597153 () Unit!44254)

(declare-fun lemmaListSubSeqRefl!0 (List!31541) Unit!44254)

(assert (=> b!1351153 (= lt!597153 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun res!896615 () Bool)

(assert (=> start!113922 (=> (not res!896615) (not e!768454))))

(assert (=> start!113922 (= res!896615 (and (bvslt (size!45050 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45050 a!3742))))))

(assert (=> start!113922 e!768454))

(assert (=> start!113922 true))

(declare-fun array_inv!33528 (array!92104) Bool)

(assert (=> start!113922 (array_inv!33528 a!3742)))

(declare-fun b!1351164 () Bool)

(declare-fun res!896623 () Bool)

(assert (=> b!1351164 (=> (not res!896623) (not e!768454))))

(assert (=> b!1351164 (= res!896623 (validKeyInArray!0 (select (arr!44500 a!3742) from!3120)))))

(declare-fun b!1351165 () Bool)

(declare-fun res!896618 () Bool)

(assert (=> b!1351165 (=> res!896618 e!768452)))

(assert (=> b!1351165 (= res!896618 (not (subseq!670 acc!759 lt!597154)))))

(assert (= (and start!113922 res!896615) b!1351158))

(assert (= (and b!1351158 res!896619) b!1351161))

(assert (= (and b!1351161 res!896613) b!1351154))

(assert (= (and b!1351154 res!896609) b!1351160))

(assert (= (and b!1351160 res!896614) b!1351162))

(assert (= (and b!1351162 res!896620) b!1351151))

(assert (= (and b!1351151 res!896611) b!1351155))

(assert (= (and b!1351155 res!896612) b!1351156))

(assert (= (and b!1351156 res!896617) b!1351164))

(assert (= (and b!1351164 res!896623) b!1351153))

(assert (= (and b!1351153 (not res!896622)) b!1351152))

(assert (= (and b!1351152 (not res!896616)) b!1351159))

(assert (= (and b!1351159 (not res!896610)) b!1351163))

(assert (= (and b!1351163 (not res!896621)) b!1351165))

(assert (= (and b!1351165 (not res!896618)) b!1351157))

(declare-fun m!1238233 () Bool)

(assert (=> b!1351164 m!1238233))

(assert (=> b!1351164 m!1238233))

(declare-fun m!1238235 () Bool)

(assert (=> b!1351164 m!1238235))

(declare-fun m!1238237 () Bool)

(assert (=> b!1351160 m!1238237))

(declare-fun m!1238239 () Bool)

(assert (=> start!113922 m!1238239))

(declare-fun m!1238241 () Bool)

(assert (=> b!1351155 m!1238241))

(declare-fun m!1238243 () Bool)

(assert (=> b!1351152 m!1238243))

(declare-fun m!1238245 () Bool)

(assert (=> b!1351158 m!1238245))

(declare-fun m!1238247 () Bool)

(assert (=> b!1351157 m!1238247))

(declare-fun m!1238249 () Bool)

(assert (=> b!1351157 m!1238249))

(declare-fun m!1238251 () Bool)

(assert (=> b!1351161 m!1238251))

(declare-fun m!1238253 () Bool)

(assert (=> b!1351165 m!1238253))

(declare-fun m!1238255 () Bool)

(assert (=> b!1351162 m!1238255))

(declare-fun m!1238257 () Bool)

(assert (=> b!1351159 m!1238257))

(assert (=> b!1351153 m!1238233))

(assert (=> b!1351153 m!1238233))

(declare-fun m!1238259 () Bool)

(assert (=> b!1351153 m!1238259))

(declare-fun m!1238261 () Bool)

(assert (=> b!1351153 m!1238261))

(declare-fun m!1238263 () Bool)

(assert (=> b!1351153 m!1238263))

(declare-fun m!1238265 () Bool)

(assert (=> b!1351154 m!1238265))

(declare-fun m!1238267 () Bool)

(assert (=> b!1351163 m!1238267))

(push 1)

(assert (not b!1351152))

(assert (not b!1351157))

(assert (not b!1351164))

(assert (not b!1351158))

(assert (not b!1351162))

(assert (not b!1351160))

(assert (not b!1351155))

(assert (not b!1351165))

(assert (not b!1351159))

(assert (not b!1351153))

(assert (not start!113922))

(assert (not b!1351163))

(assert (not b!1351161))

(assert (not b!1351154))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

