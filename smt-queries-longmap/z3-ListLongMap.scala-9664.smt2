; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114346 () Bool)

(assert start!114346)

(declare-fun b!1356701 () Bool)

(declare-fun res!900860 () Bool)

(declare-fun e!770576 () Bool)

(assert (=> b!1356701 (=> (not res!900860) (not e!770576))))

(declare-datatypes ((List!31681 0))(
  ( (Nil!31678) (Cons!31677 (h!32895 (_ BitVec 64)) (t!46331 List!31681)) )
))
(declare-fun acc!759 () List!31681)

(declare-datatypes ((array!92419 0))(
  ( (array!92420 (arr!44653 (Array (_ BitVec 32) (_ BitVec 64))) (size!45204 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92419)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92419 (_ BitVec 32) List!31681) Bool)

(assert (=> b!1356701 (= res!900860 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!900856 () Bool)

(assert (=> start!114346 (=> (not res!900856) (not e!770576))))

(assert (=> start!114346 (= res!900856 (and (bvslt (size!45204 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45204 a!3742))))))

(assert (=> start!114346 e!770576))

(assert (=> start!114346 true))

(declare-fun array_inv!33934 (array!92419) Bool)

(assert (=> start!114346 (array_inv!33934 a!3742)))

(declare-fun b!1356702 () Bool)

(declare-fun e!770577 () Bool)

(assert (=> b!1356702 (= e!770577 false)))

(declare-fun lt!599093 () Bool)

(assert (=> b!1356702 (= lt!599093 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356703 () Bool)

(declare-fun res!900861 () Bool)

(assert (=> b!1356703 (=> (not res!900861) (not e!770576))))

(declare-fun contains!9393 (List!31681 (_ BitVec 64)) Bool)

(assert (=> b!1356703 (= res!900861 (not (contains!9393 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356704 () Bool)

(declare-datatypes ((Unit!44480 0))(
  ( (Unit!44481) )
))
(declare-fun e!770578 () Unit!44480)

(declare-fun lt!599092 () Unit!44480)

(assert (=> b!1356704 (= e!770578 lt!599092)))

(declare-fun lt!599090 () Unit!44480)

(declare-fun lemmaListSubSeqRefl!0 (List!31681) Unit!44480)

(assert (=> b!1356704 (= lt!599090 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!770 (List!31681 List!31681) Bool)

(assert (=> b!1356704 (subseq!770 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92419 List!31681 List!31681 (_ BitVec 32)) Unit!44480)

(declare-fun $colon$colon!784 (List!31681 (_ BitVec 64)) List!31681)

(assert (=> b!1356704 (= lt!599092 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!784 acc!759 (select (arr!44653 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1356704 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1356705 () Bool)

(declare-fun res!900854 () Bool)

(assert (=> b!1356705 (=> (not res!900854) (not e!770576))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1356705 (= res!900854 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45204 a!3742))))))

(declare-fun b!1356706 () Bool)

(declare-fun res!900859 () Bool)

(assert (=> b!1356706 (=> (not res!900859) (not e!770576))))

(assert (=> b!1356706 (= res!900859 (not (contains!9393 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356707 () Bool)

(declare-fun Unit!44482 () Unit!44480)

(assert (=> b!1356707 (= e!770578 Unit!44482)))

(declare-fun b!1356708 () Bool)

(assert (=> b!1356708 (= e!770576 e!770577)))

(declare-fun res!900853 () Bool)

(assert (=> b!1356708 (=> (not res!900853) (not e!770577))))

(declare-fun lt!599094 () Bool)

(assert (=> b!1356708 (= res!900853 (and (not (= from!3120 i!1404)) (not lt!599094) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599091 () Unit!44480)

(assert (=> b!1356708 (= lt!599091 e!770578)))

(declare-fun c!127372 () Bool)

(assert (=> b!1356708 (= c!127372 lt!599094)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356708 (= lt!599094 (validKeyInArray!0 (select (arr!44653 a!3742) from!3120)))))

(declare-fun b!1356709 () Bool)

(declare-fun res!900855 () Bool)

(assert (=> b!1356709 (=> (not res!900855) (not e!770576))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1356709 (= res!900855 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356710 () Bool)

(declare-fun res!900857 () Bool)

(assert (=> b!1356710 (=> (not res!900857) (not e!770576))))

(declare-fun noDuplicate!2224 (List!31681) Bool)

(assert (=> b!1356710 (= res!900857 (noDuplicate!2224 acc!759))))

(declare-fun b!1356711 () Bool)

(declare-fun res!900852 () Bool)

(assert (=> b!1356711 (=> (not res!900852) (not e!770576))))

(assert (=> b!1356711 (= res!900852 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31678))))

(declare-fun b!1356712 () Bool)

(declare-fun res!900858 () Bool)

(assert (=> b!1356712 (=> (not res!900858) (not e!770576))))

(assert (=> b!1356712 (= res!900858 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45204 a!3742)))))

(assert (= (and start!114346 res!900856) b!1356710))

(assert (= (and b!1356710 res!900857) b!1356703))

(assert (= (and b!1356703 res!900861) b!1356706))

(assert (= (and b!1356706 res!900859) b!1356711))

(assert (= (and b!1356711 res!900852) b!1356701))

(assert (= (and b!1356701 res!900860) b!1356705))

(assert (= (and b!1356705 res!900854) b!1356709))

(assert (= (and b!1356709 res!900855) b!1356712))

(assert (= (and b!1356712 res!900858) b!1356708))

(assert (= (and b!1356708 c!127372) b!1356704))

(assert (= (and b!1356708 (not c!127372)) b!1356707))

(assert (= (and b!1356708 res!900853) b!1356702))

(declare-fun m!1243189 () Bool)

(assert (=> start!114346 m!1243189))

(declare-fun m!1243191 () Bool)

(assert (=> b!1356701 m!1243191))

(declare-fun m!1243193 () Bool)

(assert (=> b!1356708 m!1243193))

(assert (=> b!1356708 m!1243193))

(declare-fun m!1243195 () Bool)

(assert (=> b!1356708 m!1243195))

(declare-fun m!1243197 () Bool)

(assert (=> b!1356703 m!1243197))

(declare-fun m!1243199 () Bool)

(assert (=> b!1356711 m!1243199))

(declare-fun m!1243201 () Bool)

(assert (=> b!1356704 m!1243201))

(assert (=> b!1356704 m!1243193))

(declare-fun m!1243203 () Bool)

(assert (=> b!1356704 m!1243203))

(declare-fun m!1243205 () Bool)

(assert (=> b!1356704 m!1243205))

(declare-fun m!1243207 () Bool)

(assert (=> b!1356704 m!1243207))

(assert (=> b!1356704 m!1243193))

(assert (=> b!1356704 m!1243203))

(declare-fun m!1243209 () Bool)

(assert (=> b!1356704 m!1243209))

(assert (=> b!1356702 m!1243207))

(declare-fun m!1243211 () Bool)

(assert (=> b!1356709 m!1243211))

(declare-fun m!1243213 () Bool)

(assert (=> b!1356706 m!1243213))

(declare-fun m!1243215 () Bool)

(assert (=> b!1356710 m!1243215))

(check-sat (not start!114346) (not b!1356703) (not b!1356704) (not b!1356711) (not b!1356706) (not b!1356701) (not b!1356709) (not b!1356702) (not b!1356710) (not b!1356708))
(check-sat)
