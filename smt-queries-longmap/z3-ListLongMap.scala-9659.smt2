; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114316 () Bool)

(assert start!114316)

(declare-fun b!1356081 () Bool)

(declare-fun res!900330 () Bool)

(declare-fun e!770383 () Bool)

(assert (=> b!1356081 (=> (not res!900330) (not e!770383))))

(declare-datatypes ((List!31666 0))(
  ( (Nil!31663) (Cons!31662 (h!32880 (_ BitVec 64)) (t!46316 List!31666)) )
))
(declare-fun lt!598851 () List!31666)

(declare-fun contains!9378 (List!31666 (_ BitVec 64)) Bool)

(assert (=> b!1356081 (= res!900330 (not (contains!9378 lt!598851 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356082 () Bool)

(declare-fun res!900325 () Bool)

(assert (=> b!1356082 (=> (not res!900325) (not e!770383))))

(assert (=> b!1356082 (= res!900325 (not (contains!9378 lt!598851 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356083 () Bool)

(declare-fun res!900327 () Bool)

(assert (=> b!1356083 (=> (not res!900327) (not e!770383))))

(declare-datatypes ((array!92389 0))(
  ( (array!92390 (arr!44638 (Array (_ BitVec 32) (_ BitVec 64))) (size!45189 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92389)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92389 (_ BitVec 32) List!31666) Bool)

(assert (=> b!1356083 (= res!900327 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598851))))

(declare-fun b!1356084 () Bool)

(declare-fun res!900329 () Bool)

(declare-fun e!770381 () Bool)

(assert (=> b!1356084 (=> (not res!900329) (not e!770381))))

(assert (=> b!1356084 (= res!900329 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31663))))

(declare-fun b!1356085 () Bool)

(declare-fun res!900333 () Bool)

(assert (=> b!1356085 (=> (not res!900333) (not e!770383))))

(declare-fun noDuplicate!2209 (List!31666) Bool)

(assert (=> b!1356085 (= res!900333 (noDuplicate!2209 lt!598851))))

(declare-fun b!1356086 () Bool)

(declare-fun res!900335 () Bool)

(assert (=> b!1356086 (=> (not res!900335) (not e!770381))))

(assert (=> b!1356086 (= res!900335 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45189 a!3742)))))

(declare-fun b!1356088 () Bool)

(declare-datatypes ((Unit!44435 0))(
  ( (Unit!44436) )
))
(declare-fun e!770382 () Unit!44435)

(declare-fun Unit!44437 () Unit!44435)

(assert (=> b!1356088 (= e!770382 Unit!44437)))

(declare-fun b!1356089 () Bool)

(declare-fun res!900326 () Bool)

(assert (=> b!1356089 (=> (not res!900326) (not e!770381))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1356089 (= res!900326 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45189 a!3742))))))

(declare-fun b!1356090 () Bool)

(declare-fun res!900331 () Bool)

(assert (=> b!1356090 (=> (not res!900331) (not e!770381))))

(declare-fun acc!759 () List!31666)

(assert (=> b!1356090 (= res!900331 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356091 () Bool)

(declare-fun res!900334 () Bool)

(assert (=> b!1356091 (=> (not res!900334) (not e!770381))))

(assert (=> b!1356091 (= res!900334 (not (contains!9378 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356092 () Bool)

(declare-fun e!770380 () Bool)

(assert (=> b!1356092 (= e!770381 e!770380)))

(declare-fun res!900332 () Bool)

(assert (=> b!1356092 (=> (not res!900332) (not e!770380))))

(declare-fun lt!598854 () Bool)

(assert (=> b!1356092 (= res!900332 (and (not (= from!3120 i!1404)) lt!598854))))

(declare-fun lt!598852 () Unit!44435)

(assert (=> b!1356092 (= lt!598852 e!770382)))

(declare-fun c!127327 () Bool)

(assert (=> b!1356092 (= c!127327 lt!598854)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356092 (= lt!598854 (validKeyInArray!0 (select (arr!44638 a!3742) from!3120)))))

(declare-fun b!1356093 () Bool)

(declare-fun lt!598853 () Unit!44435)

(assert (=> b!1356093 (= e!770382 lt!598853)))

(declare-fun lt!598849 () Unit!44435)

(declare-fun lemmaListSubSeqRefl!0 (List!31666) Unit!44435)

(assert (=> b!1356093 (= lt!598849 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!755 (List!31666 List!31666) Bool)

(assert (=> b!1356093 (subseq!755 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92389 List!31666 List!31666 (_ BitVec 32)) Unit!44435)

(declare-fun $colon$colon!769 (List!31666 (_ BitVec 64)) List!31666)

(assert (=> b!1356093 (= lt!598853 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!769 acc!759 (select (arr!44638 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1356093 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1356094 () Bool)

(declare-fun res!900323 () Bool)

(assert (=> b!1356094 (=> (not res!900323) (not e!770381))))

(assert (=> b!1356094 (= res!900323 (noDuplicate!2209 acc!759))))

(declare-fun res!900322 () Bool)

(assert (=> start!114316 (=> (not res!900322) (not e!770381))))

(assert (=> start!114316 (= res!900322 (and (bvslt (size!45189 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45189 a!3742))))))

(assert (=> start!114316 e!770381))

(assert (=> start!114316 true))

(declare-fun array_inv!33919 (array!92389) Bool)

(assert (=> start!114316 (array_inv!33919 a!3742)))

(declare-fun b!1356087 () Bool)

(declare-fun res!900328 () Bool)

(assert (=> b!1356087 (=> (not res!900328) (not e!770381))))

(assert (=> b!1356087 (= res!900328 (not (contains!9378 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356095 () Bool)

(declare-fun res!900336 () Bool)

(assert (=> b!1356095 (=> (not res!900336) (not e!770381))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1356095 (= res!900336 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356096 () Bool)

(assert (=> b!1356096 (= e!770383 (not true))))

(assert (=> b!1356096 (arrayNoDuplicates!0 (array!92390 (store (arr!44638 a!3742) i!1404 l!3587) (size!45189 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!598851)))

(declare-fun lt!598850 () Unit!44435)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92389 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31666) Unit!44435)

(assert (=> b!1356096 (= lt!598850 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!598851))))

(declare-fun b!1356097 () Bool)

(assert (=> b!1356097 (= e!770380 e!770383)))

(declare-fun res!900324 () Bool)

(assert (=> b!1356097 (=> (not res!900324) (not e!770383))))

(assert (=> b!1356097 (= res!900324 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1356097 (= lt!598851 ($colon$colon!769 acc!759 (select (arr!44638 a!3742) from!3120)))))

(assert (= (and start!114316 res!900322) b!1356094))

(assert (= (and b!1356094 res!900323) b!1356087))

(assert (= (and b!1356087 res!900328) b!1356091))

(assert (= (and b!1356091 res!900334) b!1356084))

(assert (= (and b!1356084 res!900329) b!1356090))

(assert (= (and b!1356090 res!900331) b!1356089))

(assert (= (and b!1356089 res!900326) b!1356095))

(assert (= (and b!1356095 res!900336) b!1356086))

(assert (= (and b!1356086 res!900335) b!1356092))

(assert (= (and b!1356092 c!127327) b!1356093))

(assert (= (and b!1356092 (not c!127327)) b!1356088))

(assert (= (and b!1356092 res!900332) b!1356097))

(assert (= (and b!1356097 res!900324) b!1356085))

(assert (= (and b!1356085 res!900333) b!1356081))

(assert (= (and b!1356081 res!900330) b!1356082))

(assert (= (and b!1356082 res!900325) b!1356083))

(assert (= (and b!1356083 res!900327) b!1356096))

(declare-fun m!1242685 () Bool)

(assert (=> b!1356091 m!1242685))

(declare-fun m!1242687 () Bool)

(assert (=> b!1356094 m!1242687))

(declare-fun m!1242689 () Bool)

(assert (=> b!1356083 m!1242689))

(declare-fun m!1242691 () Bool)

(assert (=> start!114316 m!1242691))

(declare-fun m!1242693 () Bool)

(assert (=> b!1356081 m!1242693))

(declare-fun m!1242695 () Bool)

(assert (=> b!1356095 m!1242695))

(declare-fun m!1242697 () Bool)

(assert (=> b!1356082 m!1242697))

(declare-fun m!1242699 () Bool)

(assert (=> b!1356085 m!1242699))

(declare-fun m!1242701 () Bool)

(assert (=> b!1356097 m!1242701))

(assert (=> b!1356097 m!1242701))

(declare-fun m!1242703 () Bool)

(assert (=> b!1356097 m!1242703))

(assert (=> b!1356092 m!1242701))

(assert (=> b!1356092 m!1242701))

(declare-fun m!1242705 () Bool)

(assert (=> b!1356092 m!1242705))

(declare-fun m!1242707 () Bool)

(assert (=> b!1356096 m!1242707))

(declare-fun m!1242709 () Bool)

(assert (=> b!1356096 m!1242709))

(declare-fun m!1242711 () Bool)

(assert (=> b!1356096 m!1242711))

(declare-fun m!1242713 () Bool)

(assert (=> b!1356090 m!1242713))

(declare-fun m!1242715 () Bool)

(assert (=> b!1356093 m!1242715))

(assert (=> b!1356093 m!1242701))

(assert (=> b!1356093 m!1242703))

(declare-fun m!1242717 () Bool)

(assert (=> b!1356093 m!1242717))

(declare-fun m!1242719 () Bool)

(assert (=> b!1356093 m!1242719))

(assert (=> b!1356093 m!1242701))

(assert (=> b!1356093 m!1242703))

(declare-fun m!1242721 () Bool)

(assert (=> b!1356093 m!1242721))

(declare-fun m!1242723 () Bool)

(assert (=> b!1356087 m!1242723))

(declare-fun m!1242725 () Bool)

(assert (=> b!1356084 m!1242725))

(check-sat (not start!114316) (not b!1356094) (not b!1356090) (not b!1356081) (not b!1356097) (not b!1356087) (not b!1356095) (not b!1356083) (not b!1356082) (not b!1356093) (not b!1356085) (not b!1356092) (not b!1356084) (not b!1356096) (not b!1356091))
(check-sat)
