; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114672 () Bool)

(assert start!114672)

(declare-fun b!1360332 () Bool)

(declare-fun res!904652 () Bool)

(declare-fun e!771784 () Bool)

(assert (=> b!1360332 (=> (not res!904652) (not e!771784))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92560 0))(
  ( (array!92561 (arr!44719 (Array (_ BitVec 32) (_ BitVec 64))) (size!45269 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92560)

(assert (=> b!1360332 (= res!904652 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45269 a!3742))))))

(declare-fun res!904646 () Bool)

(assert (=> start!114672 (=> (not res!904646) (not e!771784))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114672 (= res!904646 (and (bvslt (size!45269 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45269 a!3742))))))

(assert (=> start!114672 e!771784))

(assert (=> start!114672 true))

(declare-fun array_inv!33747 (array!92560) Bool)

(assert (=> start!114672 (array_inv!33747 a!3742)))

(declare-fun b!1360333 () Bool)

(declare-datatypes ((Unit!44817 0))(
  ( (Unit!44818) )
))
(declare-fun e!771782 () Unit!44817)

(declare-fun Unit!44819 () Unit!44817)

(assert (=> b!1360333 (= e!771782 Unit!44819)))

(declare-fun b!1360334 () Bool)

(declare-fun res!904647 () Bool)

(assert (=> b!1360334 (=> (not res!904647) (not e!771784))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360334 (= res!904647 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360335 () Bool)

(declare-fun res!904648 () Bool)

(assert (=> b!1360335 (=> (not res!904648) (not e!771784))))

(declare-datatypes ((List!31760 0))(
  ( (Nil!31757) (Cons!31756 (h!32965 (_ BitVec 64)) (t!46436 List!31760)) )
))
(declare-fun acc!759 () List!31760)

(declare-fun contains!9469 (List!31760 (_ BitVec 64)) Bool)

(assert (=> b!1360335 (= res!904648 (not (contains!9469 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360336 () Bool)

(declare-fun lt!599852 () Unit!44817)

(assert (=> b!1360336 (= e!771782 lt!599852)))

(declare-fun lt!599854 () Unit!44817)

(declare-fun lemmaListSubSeqRefl!0 (List!31760) Unit!44817)

(assert (=> b!1360336 (= lt!599854 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!871 (List!31760 List!31760) Bool)

(assert (=> b!1360336 (subseq!871 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92560 List!31760 List!31760 (_ BitVec 32)) Unit!44817)

(declare-fun $colon$colon!874 (List!31760 (_ BitVec 64)) List!31760)

(assert (=> b!1360336 (= lt!599852 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!874 acc!759 (select (arr!44719 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92560 (_ BitVec 32) List!31760) Bool)

(assert (=> b!1360336 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360337 () Bool)

(declare-fun res!904651 () Bool)

(assert (=> b!1360337 (=> (not res!904651) (not e!771784))))

(assert (=> b!1360337 (= res!904651 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45269 a!3742)))))

(declare-fun b!1360338 () Bool)

(declare-fun res!904649 () Bool)

(assert (=> b!1360338 (=> (not res!904649) (not e!771784))))

(assert (=> b!1360338 (= res!904649 (not (contains!9469 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360339 () Bool)

(declare-fun res!904654 () Bool)

(assert (=> b!1360339 (=> (not res!904654) (not e!771784))))

(assert (=> b!1360339 (= res!904654 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31757))))

(declare-fun b!1360340 () Bool)

(assert (=> b!1360340 (= e!771784 false)))

(declare-fun lt!599853 () Unit!44817)

(assert (=> b!1360340 (= lt!599853 e!771782)))

(declare-fun c!127283 () Bool)

(assert (=> b!1360340 (= c!127283 (validKeyInArray!0 (select (arr!44719 a!3742) from!3120)))))

(declare-fun b!1360341 () Bool)

(declare-fun res!904653 () Bool)

(assert (=> b!1360341 (=> (not res!904653) (not e!771784))))

(declare-fun noDuplicate!2326 (List!31760) Bool)

(assert (=> b!1360341 (= res!904653 (noDuplicate!2326 acc!759))))

(declare-fun b!1360342 () Bool)

(declare-fun res!904650 () Bool)

(assert (=> b!1360342 (=> (not res!904650) (not e!771784))))

(assert (=> b!1360342 (= res!904650 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!114672 res!904646) b!1360341))

(assert (= (and b!1360341 res!904653) b!1360335))

(assert (= (and b!1360335 res!904648) b!1360338))

(assert (= (and b!1360338 res!904649) b!1360339))

(assert (= (and b!1360339 res!904654) b!1360342))

(assert (= (and b!1360342 res!904650) b!1360332))

(assert (= (and b!1360332 res!904652) b!1360334))

(assert (= (and b!1360334 res!904647) b!1360337))

(assert (= (and b!1360337 res!904651) b!1360340))

(assert (= (and b!1360340 c!127283) b!1360336))

(assert (= (and b!1360340 (not c!127283)) b!1360333))

(declare-fun m!1245621 () Bool)

(assert (=> start!114672 m!1245621))

(declare-fun m!1245623 () Bool)

(assert (=> b!1360338 m!1245623))

(declare-fun m!1245625 () Bool)

(assert (=> b!1360340 m!1245625))

(assert (=> b!1360340 m!1245625))

(declare-fun m!1245627 () Bool)

(assert (=> b!1360340 m!1245627))

(declare-fun m!1245629 () Bool)

(assert (=> b!1360341 m!1245629))

(declare-fun m!1245631 () Bool)

(assert (=> b!1360335 m!1245631))

(declare-fun m!1245633 () Bool)

(assert (=> b!1360339 m!1245633))

(declare-fun m!1245635 () Bool)

(assert (=> b!1360342 m!1245635))

(declare-fun m!1245637 () Bool)

(assert (=> b!1360336 m!1245637))

(assert (=> b!1360336 m!1245625))

(declare-fun m!1245639 () Bool)

(assert (=> b!1360336 m!1245639))

(declare-fun m!1245641 () Bool)

(assert (=> b!1360336 m!1245641))

(declare-fun m!1245643 () Bool)

(assert (=> b!1360336 m!1245643))

(assert (=> b!1360336 m!1245625))

(assert (=> b!1360336 m!1245639))

(declare-fun m!1245645 () Bool)

(assert (=> b!1360336 m!1245645))

(declare-fun m!1245647 () Bool)

(assert (=> b!1360334 m!1245647))

(push 1)

(assert (not b!1360339))

(assert (not start!114672))

(assert (not b!1360335))

(assert (not b!1360340))

(assert (not b!1360342))

(assert (not b!1360338))

(assert (not b!1360341))

(assert (not b!1360336))

