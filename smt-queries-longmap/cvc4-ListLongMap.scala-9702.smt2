; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114666 () Bool)

(assert start!114666)

(declare-fun b!1360233 () Bool)

(declare-fun res!904567 () Bool)

(declare-fun e!771756 () Bool)

(assert (=> b!1360233 (=> (not res!904567) (not e!771756))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92554 0))(
  ( (array!92555 (arr!44716 (Array (_ BitVec 32) (_ BitVec 64))) (size!45266 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92554)

(assert (=> b!1360233 (= res!904567 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45266 a!3742))))))

(declare-fun b!1360234 () Bool)

(declare-fun res!904565 () Bool)

(assert (=> b!1360234 (=> (not res!904565) (not e!771756))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360234 (= res!904565 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360235 () Bool)

(declare-datatypes ((Unit!44808 0))(
  ( (Unit!44809) )
))
(declare-fun e!771757 () Unit!44808)

(declare-fun lt!599826 () Unit!44808)

(assert (=> b!1360235 (= e!771757 lt!599826)))

(declare-fun lt!599827 () Unit!44808)

(declare-datatypes ((List!31757 0))(
  ( (Nil!31754) (Cons!31753 (h!32962 (_ BitVec 64)) (t!46433 List!31757)) )
))
(declare-fun acc!759 () List!31757)

(declare-fun lemmaListSubSeqRefl!0 (List!31757) Unit!44808)

(assert (=> b!1360235 (= lt!599827 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!868 (List!31757 List!31757) Bool)

(assert (=> b!1360235 (subseq!868 acc!759 acc!759)))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92554 List!31757 List!31757 (_ BitVec 32)) Unit!44808)

(declare-fun $colon$colon!871 (List!31757 (_ BitVec 64)) List!31757)

(assert (=> b!1360235 (= lt!599826 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!871 acc!759 (select (arr!44716 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92554 (_ BitVec 32) List!31757) Bool)

(assert (=> b!1360235 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360236 () Bool)

(declare-fun Unit!44810 () Unit!44808)

(assert (=> b!1360236 (= e!771757 Unit!44810)))

(declare-fun b!1360237 () Bool)

(declare-fun res!904568 () Bool)

(assert (=> b!1360237 (=> (not res!904568) (not e!771756))))

(assert (=> b!1360237 (= res!904568 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360238 () Bool)

(declare-fun res!904570 () Bool)

(assert (=> b!1360238 (=> (not res!904570) (not e!771756))))

(declare-fun noDuplicate!2323 (List!31757) Bool)

(assert (=> b!1360238 (= res!904570 (noDuplicate!2323 acc!759))))

(declare-fun b!1360239 () Bool)

(declare-fun res!904569 () Bool)

(assert (=> b!1360239 (=> (not res!904569) (not e!771756))))

(declare-fun contains!9466 (List!31757 (_ BitVec 64)) Bool)

(assert (=> b!1360239 (= res!904569 (not (contains!9466 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!904572 () Bool)

(assert (=> start!114666 (=> (not res!904572) (not e!771756))))

(assert (=> start!114666 (= res!904572 (and (bvslt (size!45266 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45266 a!3742))))))

(assert (=> start!114666 e!771756))

(assert (=> start!114666 true))

(declare-fun array_inv!33744 (array!92554) Bool)

(assert (=> start!114666 (array_inv!33744 a!3742)))

(declare-fun b!1360240 () Bool)

(assert (=> b!1360240 (= e!771756 false)))

(declare-fun lt!599825 () Unit!44808)

(assert (=> b!1360240 (= lt!599825 e!771757)))

(declare-fun c!127274 () Bool)

(assert (=> b!1360240 (= c!127274 (validKeyInArray!0 (select (arr!44716 a!3742) from!3120)))))

(declare-fun b!1360241 () Bool)

(declare-fun res!904571 () Bool)

(assert (=> b!1360241 (=> (not res!904571) (not e!771756))))

(assert (=> b!1360241 (= res!904571 (not (contains!9466 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360242 () Bool)

(declare-fun res!904566 () Bool)

(assert (=> b!1360242 (=> (not res!904566) (not e!771756))))

(assert (=> b!1360242 (= res!904566 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45266 a!3742)))))

(declare-fun b!1360243 () Bool)

(declare-fun res!904573 () Bool)

(assert (=> b!1360243 (=> (not res!904573) (not e!771756))))

(assert (=> b!1360243 (= res!904573 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31754))))

(assert (= (and start!114666 res!904572) b!1360238))

(assert (= (and b!1360238 res!904570) b!1360241))

(assert (= (and b!1360241 res!904571) b!1360239))

(assert (= (and b!1360239 res!904569) b!1360243))

(assert (= (and b!1360243 res!904573) b!1360237))

(assert (= (and b!1360237 res!904568) b!1360233))

(assert (= (and b!1360233 res!904567) b!1360234))

(assert (= (and b!1360234 res!904565) b!1360242))

(assert (= (and b!1360242 res!904566) b!1360240))

(assert (= (and b!1360240 c!127274) b!1360235))

(assert (= (and b!1360240 (not c!127274)) b!1360236))

(declare-fun m!1245537 () Bool)

(assert (=> b!1360238 m!1245537))

(declare-fun m!1245539 () Bool)

(assert (=> b!1360234 m!1245539))

(declare-fun m!1245541 () Bool)

(assert (=> b!1360239 m!1245541))

(declare-fun m!1245543 () Bool)

(assert (=> b!1360243 m!1245543))

(declare-fun m!1245545 () Bool)

(assert (=> b!1360241 m!1245545))

(declare-fun m!1245547 () Bool)

(assert (=> start!114666 m!1245547))

(declare-fun m!1245549 () Bool)

(assert (=> b!1360237 m!1245549))

(declare-fun m!1245551 () Bool)

(assert (=> b!1360240 m!1245551))

(assert (=> b!1360240 m!1245551))

(declare-fun m!1245553 () Bool)

(assert (=> b!1360240 m!1245553))

(declare-fun m!1245555 () Bool)

(assert (=> b!1360235 m!1245555))

(assert (=> b!1360235 m!1245551))

(declare-fun m!1245557 () Bool)

(assert (=> b!1360235 m!1245557))

(declare-fun m!1245559 () Bool)

(assert (=> b!1360235 m!1245559))

(declare-fun m!1245561 () Bool)

(assert (=> b!1360235 m!1245561))

(assert (=> b!1360235 m!1245551))

(assert (=> b!1360235 m!1245557))

(declare-fun m!1245563 () Bool)

(assert (=> b!1360235 m!1245563))

(push 1)

(assert (not b!1360237))

(assert (not b!1360238))

(assert (not b!1360243))

(assert (not b!1360239))

(assert (not b!1360234))

(assert (not start!114666))

(assert (not b!1360235))

(assert (not b!1360241))

(assert (not b!1360240))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

