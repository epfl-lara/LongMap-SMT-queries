; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114580 () Bool)

(assert start!114580)

(declare-fun res!904024 () Bool)

(declare-fun e!771448 () Bool)

(assert (=> start!114580 (=> (not res!904024) (not e!771448))))

(declare-datatypes ((array!92525 0))(
  ( (array!92526 (arr!44703 (Array (_ BitVec 32) (_ BitVec 64))) (size!45253 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92525)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114580 (= res!904024 (and (bvslt (size!45253 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45253 a!3742))))))

(assert (=> start!114580 e!771448))

(assert (=> start!114580 true))

(declare-fun array_inv!33731 (array!92525) Bool)

(assert (=> start!114580 (array_inv!33731 a!3742)))

(declare-fun b!1359568 () Bool)

(declare-fun e!771445 () Bool)

(assert (=> b!1359568 (= e!771448 e!771445)))

(declare-fun res!904027 () Bool)

(assert (=> b!1359568 (=> (not res!904027) (not e!771445))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1359568 (= res!904027 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44769 0))(
  ( (Unit!44770) )
))
(declare-fun lt!599643 () Unit!44769)

(declare-fun e!771446 () Unit!44769)

(assert (=> b!1359568 (= lt!599643 e!771446)))

(declare-fun c!127214 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359568 (= c!127214 (validKeyInArray!0 (select (arr!44703 a!3742) from!3120)))))

(declare-fun b!1359569 () Bool)

(declare-fun res!904026 () Bool)

(assert (=> b!1359569 (=> (not res!904026) (not e!771448))))

(declare-datatypes ((List!31744 0))(
  ( (Nil!31741) (Cons!31740 (h!32949 (_ BitVec 64)) (t!46417 List!31744)) )
))
(declare-fun arrayNoDuplicates!0 (array!92525 (_ BitVec 32) List!31744) Bool)

(assert (=> b!1359569 (= res!904026 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31741))))

(declare-fun b!1359570 () Bool)

(declare-fun res!904022 () Bool)

(assert (=> b!1359570 (=> (not res!904022) (not e!771448))))

(declare-fun acc!759 () List!31744)

(declare-fun contains!9453 (List!31744 (_ BitVec 64)) Bool)

(assert (=> b!1359570 (= res!904022 (not (contains!9453 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359571 () Bool)

(declare-fun res!904023 () Bool)

(assert (=> b!1359571 (=> (not res!904023) (not e!771448))))

(assert (=> b!1359571 (= res!904023 (not (contains!9453 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359572 () Bool)

(declare-fun lt!599644 () Unit!44769)

(assert (=> b!1359572 (= e!771446 lt!599644)))

(declare-fun lt!599642 () Unit!44769)

(declare-fun lemmaListSubSeqRefl!0 (List!31744) Unit!44769)

(assert (=> b!1359572 (= lt!599642 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!855 (List!31744 List!31744) Bool)

(assert (=> b!1359572 (subseq!855 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92525 List!31744 List!31744 (_ BitVec 32)) Unit!44769)

(declare-fun $colon$colon!858 (List!31744 (_ BitVec 64)) List!31744)

(assert (=> b!1359572 (= lt!599644 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!858 acc!759 (select (arr!44703 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1359572 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1359573 () Bool)

(declare-fun res!904028 () Bool)

(assert (=> b!1359573 (=> (not res!904028) (not e!771448))))

(declare-fun noDuplicate!2310 (List!31744) Bool)

(assert (=> b!1359573 (= res!904028 (noDuplicate!2310 acc!759))))

(declare-fun b!1359574 () Bool)

(declare-fun res!904030 () Bool)

(assert (=> b!1359574 (=> (not res!904030) (not e!771445))))

(assert (=> b!1359574 (= res!904030 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1359575 () Bool)

(declare-fun Unit!44771 () Unit!44769)

(assert (=> b!1359575 (= e!771446 Unit!44771)))

(declare-fun b!1359576 () Bool)

(declare-fun res!904029 () Bool)

(assert (=> b!1359576 (=> (not res!904029) (not e!771448))))

(assert (=> b!1359576 (= res!904029 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45253 a!3742))))))

(declare-fun b!1359577 () Bool)

(declare-fun res!904021 () Bool)

(assert (=> b!1359577 (=> (not res!904021) (not e!771448))))

(assert (=> b!1359577 (= res!904021 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1359578 () Bool)

(assert (=> b!1359578 (= e!771445 (bvsge (bvsub (size!45253 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) (bvsub (size!45253 a!3742) from!3120)))))

(declare-fun b!1359579 () Bool)

(declare-fun res!904025 () Bool)

(assert (=> b!1359579 (=> (not res!904025) (not e!771448))))

(assert (=> b!1359579 (= res!904025 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45253 a!3742)))))

(declare-fun b!1359580 () Bool)

(declare-fun res!904020 () Bool)

(assert (=> b!1359580 (=> (not res!904020) (not e!771448))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1359580 (= res!904020 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!114580 res!904024) b!1359573))

(assert (= (and b!1359573 res!904028) b!1359571))

(assert (= (and b!1359571 res!904023) b!1359570))

(assert (= (and b!1359570 res!904022) b!1359569))

(assert (= (and b!1359569 res!904026) b!1359577))

(assert (= (and b!1359577 res!904021) b!1359576))

(assert (= (and b!1359576 res!904029) b!1359580))

(assert (= (and b!1359580 res!904020) b!1359579))

(assert (= (and b!1359579 res!904025) b!1359568))

(assert (= (and b!1359568 c!127214) b!1359572))

(assert (= (and b!1359568 (not c!127214)) b!1359575))

(assert (= (and b!1359568 res!904027) b!1359574))

(assert (= (and b!1359574 res!904030) b!1359578))

(declare-fun m!1244945 () Bool)

(assert (=> b!1359569 m!1244945))

(declare-fun m!1244947 () Bool)

(assert (=> b!1359577 m!1244947))

(declare-fun m!1244949 () Bool)

(assert (=> b!1359568 m!1244949))

(assert (=> b!1359568 m!1244949))

(declare-fun m!1244951 () Bool)

(assert (=> b!1359568 m!1244951))

(declare-fun m!1244953 () Bool)

(assert (=> start!114580 m!1244953))

(declare-fun m!1244955 () Bool)

(assert (=> b!1359570 m!1244955))

(declare-fun m!1244957 () Bool)

(assert (=> b!1359574 m!1244957))

(declare-fun m!1244959 () Bool)

(assert (=> b!1359572 m!1244959))

(assert (=> b!1359572 m!1244949))

(declare-fun m!1244961 () Bool)

(assert (=> b!1359572 m!1244961))

(declare-fun m!1244963 () Bool)

(assert (=> b!1359572 m!1244963))

(assert (=> b!1359572 m!1244957))

(assert (=> b!1359572 m!1244949))

(assert (=> b!1359572 m!1244961))

(declare-fun m!1244965 () Bool)

(assert (=> b!1359572 m!1244965))

(declare-fun m!1244967 () Bool)

(assert (=> b!1359573 m!1244967))

(declare-fun m!1244969 () Bool)

(assert (=> b!1359580 m!1244969))

(declare-fun m!1244971 () Bool)

(assert (=> b!1359571 m!1244971))

(check-sat (not b!1359573) (not b!1359570) (not b!1359580) (not b!1359568) (not b!1359574) (not b!1359577) (not b!1359572) (not start!114580) (not b!1359569) (not b!1359571))
(check-sat)
