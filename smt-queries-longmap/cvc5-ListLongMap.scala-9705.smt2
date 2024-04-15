; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114684 () Bool)

(assert start!114684)

(declare-fun b!1360460 () Bool)

(declare-fun res!904783 () Bool)

(declare-fun e!771804 () Bool)

(assert (=> b!1360460 (=> (not res!904783) (not e!771804))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92521 0))(
  ( (array!92522 (arr!44700 (Array (_ BitVec 32) (_ BitVec 64))) (size!45252 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92521)

(assert (=> b!1360460 (= res!904783 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45252 a!3742))))))

(declare-fun b!1360461 () Bool)

(declare-fun res!904779 () Bool)

(assert (=> b!1360461 (=> (not res!904779) (not e!771804))))

(declare-datatypes ((List!31819 0))(
  ( (Nil!31816) (Cons!31815 (h!33024 (_ BitVec 64)) (t!46487 List!31819)) )
))
(declare-fun acc!759 () List!31819)

(declare-fun noDuplicate!2354 (List!31819) Bool)

(assert (=> b!1360461 (= res!904779 (noDuplicate!2354 acc!759))))

(declare-fun b!1360462 () Bool)

(declare-fun res!904786 () Bool)

(assert (=> b!1360462 (=> (not res!904786) (not e!771804))))

(declare-fun contains!9439 (List!31819 (_ BitVec 64)) Bool)

(assert (=> b!1360462 (= res!904786 (not (contains!9439 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360463 () Bool)

(declare-fun res!904785 () Bool)

(assert (=> b!1360463 (=> (not res!904785) (not e!771804))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360463 (= res!904785 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360465 () Bool)

(declare-fun res!904780 () Bool)

(assert (=> b!1360465 (=> (not res!904780) (not e!771804))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1360465 (= res!904780 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45252 a!3742)))))

(declare-fun b!1360466 () Bool)

(declare-datatypes ((Unit!44676 0))(
  ( (Unit!44677) )
))
(declare-fun e!771805 () Unit!44676)

(declare-fun lt!599729 () Unit!44676)

(assert (=> b!1360466 (= e!771805 lt!599729)))

(declare-fun lt!599730 () Unit!44676)

(declare-fun lemmaListSubSeqRefl!0 (List!31819) Unit!44676)

(assert (=> b!1360466 (= lt!599730 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!877 (List!31819 List!31819) Bool)

(assert (=> b!1360466 (subseq!877 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92521 List!31819 List!31819 (_ BitVec 32)) Unit!44676)

(declare-fun $colon$colon!882 (List!31819 (_ BitVec 64)) List!31819)

(assert (=> b!1360466 (= lt!599729 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!882 acc!759 (select (arr!44700 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92521 (_ BitVec 32) List!31819) Bool)

(assert (=> b!1360466 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360467 () Bool)

(assert (=> b!1360467 (= e!771804 false)))

(declare-fun lt!599731 () Unit!44676)

(assert (=> b!1360467 (= lt!599731 e!771805)))

(declare-fun c!127283 () Bool)

(assert (=> b!1360467 (= c!127283 (validKeyInArray!0 (select (arr!44700 a!3742) from!3120)))))

(declare-fun b!1360468 () Bool)

(declare-fun res!904784 () Bool)

(assert (=> b!1360468 (=> (not res!904784) (not e!771804))))

(assert (=> b!1360468 (= res!904784 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360469 () Bool)

(declare-fun res!904787 () Bool)

(assert (=> b!1360469 (=> (not res!904787) (not e!771804))))

(assert (=> b!1360469 (= res!904787 (not (contains!9439 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360470 () Bool)

(declare-fun Unit!44678 () Unit!44676)

(assert (=> b!1360470 (= e!771805 Unit!44678)))

(declare-fun b!1360464 () Bool)

(declare-fun res!904782 () Bool)

(assert (=> b!1360464 (=> (not res!904782) (not e!771804))))

(assert (=> b!1360464 (= res!904782 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31816))))

(declare-fun res!904781 () Bool)

(assert (=> start!114684 (=> (not res!904781) (not e!771804))))

(assert (=> start!114684 (= res!904781 (and (bvslt (size!45252 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45252 a!3742))))))

(assert (=> start!114684 e!771804))

(assert (=> start!114684 true))

(declare-fun array_inv!33933 (array!92521) Bool)

(assert (=> start!114684 (array_inv!33933 a!3742)))

(assert (= (and start!114684 res!904781) b!1360461))

(assert (= (and b!1360461 res!904779) b!1360469))

(assert (= (and b!1360469 res!904787) b!1360462))

(assert (= (and b!1360462 res!904786) b!1360464))

(assert (= (and b!1360464 res!904782) b!1360468))

(assert (= (and b!1360468 res!904784) b!1360460))

(assert (= (and b!1360460 res!904783) b!1360463))

(assert (= (and b!1360463 res!904785) b!1360465))

(assert (= (and b!1360465 res!904780) b!1360467))

(assert (= (and b!1360467 c!127283) b!1360466))

(assert (= (and b!1360467 (not c!127283)) b!1360470))

(declare-fun m!1245273 () Bool)

(assert (=> b!1360468 m!1245273))

(declare-fun m!1245275 () Bool)

(assert (=> b!1360469 m!1245275))

(declare-fun m!1245277 () Bool)

(assert (=> b!1360463 m!1245277))

(declare-fun m!1245279 () Bool)

(assert (=> b!1360462 m!1245279))

(declare-fun m!1245281 () Bool)

(assert (=> b!1360461 m!1245281))

(declare-fun m!1245283 () Bool)

(assert (=> start!114684 m!1245283))

(declare-fun m!1245285 () Bool)

(assert (=> b!1360464 m!1245285))

(declare-fun m!1245287 () Bool)

(assert (=> b!1360467 m!1245287))

(assert (=> b!1360467 m!1245287))

(declare-fun m!1245289 () Bool)

(assert (=> b!1360467 m!1245289))

(declare-fun m!1245291 () Bool)

(assert (=> b!1360466 m!1245291))

(assert (=> b!1360466 m!1245287))

(declare-fun m!1245293 () Bool)

(assert (=> b!1360466 m!1245293))

(declare-fun m!1245295 () Bool)

(assert (=> b!1360466 m!1245295))

(declare-fun m!1245297 () Bool)

(assert (=> b!1360466 m!1245297))

(assert (=> b!1360466 m!1245287))

(assert (=> b!1360466 m!1245293))

(declare-fun m!1245299 () Bool)

(assert (=> b!1360466 m!1245299))

(push 1)

(assert (not b!1360463))

(assert (not b!1360461))

(assert (not start!114684))

(assert (not b!1360462))

(assert (not b!1360467))

(assert (not b!1360469))

(assert (not b!1360468))

(assert (not b!1360466))

(assert (not b!1360464))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

