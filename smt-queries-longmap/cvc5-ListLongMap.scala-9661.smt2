; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114104 () Bool)

(assert start!114104)

(declare-fun b!1355078 () Bool)

(declare-fun res!900068 () Bool)

(declare-fun e!769627 () Bool)

(assert (=> b!1355078 (=> (not res!900068) (not e!769627))))

(declare-datatypes ((List!31632 0))(
  ( (Nil!31629) (Cons!31628 (h!32837 (_ BitVec 64)) (t!46290 List!31632)) )
))
(declare-fun acc!759 () List!31632)

(declare-fun contains!9341 (List!31632 (_ BitVec 64)) Bool)

(assert (=> b!1355078 (= res!900068 (not (contains!9341 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355079 () Bool)

(declare-fun e!769626 () Bool)

(assert (=> b!1355079 (= e!769626 false)))

(declare-fun lt!598479 () Bool)

(declare-datatypes ((array!92286 0))(
  ( (array!92287 (arr!44591 (Array (_ BitVec 32) (_ BitVec 64))) (size!45141 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92286)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92286 (_ BitVec 32) List!31632) Bool)

(assert (=> b!1355079 (= lt!598479 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355080 () Bool)

(declare-fun res!900066 () Bool)

(assert (=> b!1355080 (=> (not res!900066) (not e!769627))))

(declare-fun noDuplicate!2198 (List!31632) Bool)

(assert (=> b!1355080 (= res!900066 (noDuplicate!2198 acc!759))))

(declare-fun res!900071 () Bool)

(assert (=> start!114104 (=> (not res!900071) (not e!769627))))

(assert (=> start!114104 (= res!900071 (and (bvslt (size!45141 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45141 a!3742))))))

(assert (=> start!114104 e!769627))

(assert (=> start!114104 true))

(declare-fun array_inv!33619 (array!92286) Bool)

(assert (=> start!114104 (array_inv!33619 a!3742)))

(declare-fun b!1355081 () Bool)

(declare-fun res!900064 () Bool)

(assert (=> b!1355081 (=> (not res!900064) (not e!769627))))

(assert (=> b!1355081 (= res!900064 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45141 a!3742)))))

(declare-fun b!1355082 () Bool)

(declare-fun res!900065 () Bool)

(assert (=> b!1355082 (=> (not res!900065) (not e!769627))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355082 (= res!900065 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45141 a!3742))))))

(declare-fun b!1355083 () Bool)

(declare-datatypes ((Unit!44514 0))(
  ( (Unit!44515) )
))
(declare-fun e!769624 () Unit!44514)

(declare-fun Unit!44516 () Unit!44514)

(assert (=> b!1355083 (= e!769624 Unit!44516)))

(declare-fun b!1355084 () Bool)

(declare-fun res!900072 () Bool)

(assert (=> b!1355084 (=> (not res!900072) (not e!769627))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355084 (= res!900072 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355085 () Bool)

(declare-fun res!900069 () Bool)

(assert (=> b!1355085 (=> (not res!900069) (not e!769627))))

(assert (=> b!1355085 (= res!900069 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31629))))

(declare-fun b!1355086 () Bool)

(declare-fun lt!598480 () Unit!44514)

(assert (=> b!1355086 (= e!769624 lt!598480)))

(declare-fun lt!598482 () Unit!44514)

(declare-fun lemmaListSubSeqRefl!0 (List!31632) Unit!44514)

(assert (=> b!1355086 (= lt!598482 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!761 (List!31632 List!31632) Bool)

(assert (=> b!1355086 (subseq!761 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92286 List!31632 List!31632 (_ BitVec 32)) Unit!44514)

(declare-fun $colon$colon!776 (List!31632 (_ BitVec 64)) List!31632)

(assert (=> b!1355086 (= lt!598480 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!776 acc!759 (select (arr!44591 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355086 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355087 () Bool)

(declare-fun res!900073 () Bool)

(assert (=> b!1355087 (=> (not res!900073) (not e!769627))))

(assert (=> b!1355087 (= res!900073 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355088 () Bool)

(assert (=> b!1355088 (= e!769627 e!769626)))

(declare-fun res!900070 () Bool)

(assert (=> b!1355088 (=> (not res!900070) (not e!769626))))

(declare-fun lt!598483 () Bool)

(assert (=> b!1355088 (= res!900070 (and (not (= from!3120 i!1404)) (not lt!598483) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598481 () Unit!44514)

(assert (=> b!1355088 (= lt!598481 e!769624)))

(declare-fun c!126947 () Bool)

(assert (=> b!1355088 (= c!126947 lt!598483)))

(assert (=> b!1355088 (= lt!598483 (validKeyInArray!0 (select (arr!44591 a!3742) from!3120)))))

(declare-fun b!1355089 () Bool)

(declare-fun res!900067 () Bool)

(assert (=> b!1355089 (=> (not res!900067) (not e!769627))))

(assert (=> b!1355089 (= res!900067 (not (contains!9341 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114104 res!900071) b!1355080))

(assert (= (and b!1355080 res!900066) b!1355089))

(assert (= (and b!1355089 res!900067) b!1355078))

(assert (= (and b!1355078 res!900068) b!1355085))

(assert (= (and b!1355085 res!900069) b!1355087))

(assert (= (and b!1355087 res!900073) b!1355082))

(assert (= (and b!1355082 res!900065) b!1355084))

(assert (= (and b!1355084 res!900072) b!1355081))

(assert (= (and b!1355081 res!900064) b!1355088))

(assert (= (and b!1355088 c!126947) b!1355086))

(assert (= (and b!1355088 (not c!126947)) b!1355083))

(assert (= (and b!1355088 res!900070) b!1355079))

(declare-fun m!1241341 () Bool)

(assert (=> b!1355089 m!1241341))

(declare-fun m!1241343 () Bool)

(assert (=> start!114104 m!1241343))

(declare-fun m!1241345 () Bool)

(assert (=> b!1355084 m!1241345))

(declare-fun m!1241347 () Bool)

(assert (=> b!1355080 m!1241347))

(declare-fun m!1241349 () Bool)

(assert (=> b!1355086 m!1241349))

(declare-fun m!1241351 () Bool)

(assert (=> b!1355086 m!1241351))

(declare-fun m!1241353 () Bool)

(assert (=> b!1355086 m!1241353))

(declare-fun m!1241355 () Bool)

(assert (=> b!1355086 m!1241355))

(declare-fun m!1241357 () Bool)

(assert (=> b!1355086 m!1241357))

(assert (=> b!1355086 m!1241351))

(assert (=> b!1355086 m!1241353))

(declare-fun m!1241359 () Bool)

(assert (=> b!1355086 m!1241359))

(declare-fun m!1241361 () Bool)

(assert (=> b!1355087 m!1241361))

(assert (=> b!1355088 m!1241351))

(assert (=> b!1355088 m!1241351))

(declare-fun m!1241363 () Bool)

(assert (=> b!1355088 m!1241363))

(declare-fun m!1241365 () Bool)

(assert (=> b!1355078 m!1241365))

(declare-fun m!1241367 () Bool)

(assert (=> b!1355085 m!1241367))

(assert (=> b!1355079 m!1241357))

(push 1)

