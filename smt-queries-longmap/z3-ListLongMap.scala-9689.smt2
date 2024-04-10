; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114472 () Bool)

(assert start!114472)

(declare-fun res!903132 () Bool)

(declare-fun e!771033 () Bool)

(assert (=> start!114472 (=> (not res!903132) (not e!771033))))

(declare-datatypes ((array!92468 0))(
  ( (array!92469 (arr!44676 (Array (_ BitVec 32) (_ BitVec 64))) (size!45226 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92468)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114472 (= res!903132 (and (bvslt (size!45226 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45226 a!3742))))))

(assert (=> start!114472 e!771033))

(assert (=> start!114472 true))

(declare-fun array_inv!33704 (array!92468) Bool)

(assert (=> start!114472 (array_inv!33704 a!3742)))

(declare-fun b!1358487 () Bool)

(declare-fun res!903138 () Bool)

(assert (=> b!1358487 (=> (not res!903138) (not e!771033))))

(declare-datatypes ((List!31717 0))(
  ( (Nil!31714) (Cons!31713 (h!32922 (_ BitVec 64)) (t!46387 List!31717)) )
))
(declare-fun acc!759 () List!31717)

(declare-fun noDuplicate!2283 (List!31717) Bool)

(assert (=> b!1358487 (= res!903138 (noDuplicate!2283 acc!759))))

(declare-fun b!1358488 () Bool)

(declare-fun res!903137 () Bool)

(assert (=> b!1358488 (=> (not res!903137) (not e!771033))))

(declare-fun contains!9426 (List!31717 (_ BitVec 64)) Bool)

(assert (=> b!1358488 (= res!903137 (not (contains!9426 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358489 () Bool)

(declare-datatypes ((Unit!44688 0))(
  ( (Unit!44689) )
))
(declare-fun e!771032 () Unit!44688)

(declare-fun Unit!44690 () Unit!44688)

(assert (=> b!1358489 (= e!771032 Unit!44690)))

(declare-fun b!1358490 () Bool)

(declare-fun res!903134 () Bool)

(assert (=> b!1358490 (=> (not res!903134) (not e!771033))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358490 (= res!903134 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45226 a!3742))))))

(declare-fun b!1358491 () Bool)

(assert (=> b!1358491 (= e!771033 false)))

(declare-fun lt!599351 () Unit!44688)

(assert (=> b!1358491 (= lt!599351 e!771032)))

(declare-fun c!127118 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358491 (= c!127118 (validKeyInArray!0 (select (arr!44676 a!3742) from!3120)))))

(declare-fun b!1358492 () Bool)

(declare-fun res!903135 () Bool)

(assert (=> b!1358492 (=> (not res!903135) (not e!771033))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1358492 (= res!903135 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358493 () Bool)

(declare-fun res!903139 () Bool)

(assert (=> b!1358493 (=> (not res!903139) (not e!771033))))

(declare-fun arrayNoDuplicates!0 (array!92468 (_ BitVec 32) List!31717) Bool)

(assert (=> b!1358493 (= res!903139 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31714))))

(declare-fun b!1358494 () Bool)

(declare-fun lt!599352 () Unit!44688)

(assert (=> b!1358494 (= e!771032 lt!599352)))

(declare-fun lt!599353 () Unit!44688)

(declare-fun lemmaListSubSeqRefl!0 (List!31717) Unit!44688)

(assert (=> b!1358494 (= lt!599353 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!828 (List!31717 List!31717) Bool)

(assert (=> b!1358494 (subseq!828 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92468 List!31717 List!31717 (_ BitVec 32)) Unit!44688)

(declare-fun $colon$colon!831 (List!31717 (_ BitVec 64)) List!31717)

(assert (=> b!1358494 (= lt!599352 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!831 acc!759 (select (arr!44676 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1358494 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1358495 () Bool)

(declare-fun res!903136 () Bool)

(assert (=> b!1358495 (=> (not res!903136) (not e!771033))))

(assert (=> b!1358495 (= res!903136 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45226 a!3742)))))

(declare-fun b!1358496 () Bool)

(declare-fun res!903131 () Bool)

(assert (=> b!1358496 (=> (not res!903131) (not e!771033))))

(assert (=> b!1358496 (= res!903131 (not (contains!9426 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358497 () Bool)

(declare-fun res!903133 () Bool)

(assert (=> b!1358497 (=> (not res!903133) (not e!771033))))

(assert (=> b!1358497 (= res!903133 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!114472 res!903132) b!1358487))

(assert (= (and b!1358487 res!903138) b!1358488))

(assert (= (and b!1358488 res!903137) b!1358496))

(assert (= (and b!1358496 res!903131) b!1358493))

(assert (= (and b!1358493 res!903139) b!1358497))

(assert (= (and b!1358497 res!903133) b!1358490))

(assert (= (and b!1358490 res!903134) b!1358492))

(assert (= (and b!1358492 res!903135) b!1358495))

(assert (= (and b!1358495 res!903136) b!1358491))

(assert (= (and b!1358491 c!127118) b!1358494))

(assert (= (and b!1358491 (not c!127118)) b!1358489))

(declare-fun m!1244063 () Bool)

(assert (=> b!1358496 m!1244063))

(declare-fun m!1244065 () Bool)

(assert (=> b!1358497 m!1244065))

(declare-fun m!1244067 () Bool)

(assert (=> b!1358492 m!1244067))

(declare-fun m!1244069 () Bool)

(assert (=> b!1358491 m!1244069))

(assert (=> b!1358491 m!1244069))

(declare-fun m!1244071 () Bool)

(assert (=> b!1358491 m!1244071))

(declare-fun m!1244073 () Bool)

(assert (=> b!1358487 m!1244073))

(declare-fun m!1244075 () Bool)

(assert (=> b!1358488 m!1244075))

(declare-fun m!1244077 () Bool)

(assert (=> start!114472 m!1244077))

(declare-fun m!1244079 () Bool)

(assert (=> b!1358494 m!1244079))

(assert (=> b!1358494 m!1244069))

(declare-fun m!1244081 () Bool)

(assert (=> b!1358494 m!1244081))

(declare-fun m!1244083 () Bool)

(assert (=> b!1358494 m!1244083))

(declare-fun m!1244085 () Bool)

(assert (=> b!1358494 m!1244085))

(assert (=> b!1358494 m!1244069))

(assert (=> b!1358494 m!1244081))

(declare-fun m!1244087 () Bool)

(assert (=> b!1358494 m!1244087))

(declare-fun m!1244089 () Bool)

(assert (=> b!1358493 m!1244089))

(check-sat (not start!114472) (not b!1358494) (not b!1358487) (not b!1358492) (not b!1358488) (not b!1358493) (not b!1358497) (not b!1358496) (not b!1358491))
(check-sat)
