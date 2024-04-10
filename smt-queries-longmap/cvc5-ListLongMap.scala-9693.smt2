; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114494 () Bool)

(assert start!114494)

(declare-fun b!1358850 () Bool)

(declare-fun res!903432 () Bool)

(declare-fun e!771132 () Bool)

(assert (=> b!1358850 (=> (not res!903432) (not e!771132))))

(declare-datatypes ((array!92490 0))(
  ( (array!92491 (arr!44687 (Array (_ BitVec 32) (_ BitVec 64))) (size!45237 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92490)

(declare-datatypes ((List!31728 0))(
  ( (Nil!31725) (Cons!31724 (h!32933 (_ BitVec 64)) (t!46398 List!31728)) )
))
(declare-fun arrayNoDuplicates!0 (array!92490 (_ BitVec 32) List!31728) Bool)

(assert (=> b!1358850 (= res!903432 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31725))))

(declare-fun b!1358851 () Bool)

(declare-fun res!903430 () Bool)

(assert (=> b!1358851 (=> (not res!903430) (not e!771132))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358851 (= res!903430 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358852 () Bool)

(declare-fun res!903436 () Bool)

(assert (=> b!1358852 (=> (not res!903436) (not e!771132))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358852 (= res!903436 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45237 a!3742))))))

(declare-fun b!1358853 () Bool)

(declare-datatypes ((Unit!44721 0))(
  ( (Unit!44722) )
))
(declare-fun e!771133 () Unit!44721)

(declare-fun lt!599452 () Unit!44721)

(assert (=> b!1358853 (= e!771133 lt!599452)))

(declare-fun lt!599451 () Unit!44721)

(declare-fun acc!759 () List!31728)

(declare-fun lemmaListSubSeqRefl!0 (List!31728) Unit!44721)

(assert (=> b!1358853 (= lt!599451 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!839 (List!31728 List!31728) Bool)

(assert (=> b!1358853 (subseq!839 acc!759 acc!759)))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92490 List!31728 List!31728 (_ BitVec 32)) Unit!44721)

(declare-fun $colon$colon!842 (List!31728 (_ BitVec 64)) List!31728)

(assert (=> b!1358853 (= lt!599452 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!842 acc!759 (select (arr!44687 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1358853 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun res!903428 () Bool)

(assert (=> start!114494 (=> (not res!903428) (not e!771132))))

(assert (=> start!114494 (= res!903428 (and (bvslt (size!45237 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45237 a!3742))))))

(assert (=> start!114494 e!771132))

(assert (=> start!114494 true))

(declare-fun array_inv!33715 (array!92490) Bool)

(assert (=> start!114494 (array_inv!33715 a!3742)))

(declare-fun b!1358854 () Bool)

(declare-fun res!903434 () Bool)

(assert (=> b!1358854 (=> (not res!903434) (not e!771132))))

(assert (=> b!1358854 (= res!903434 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358855 () Bool)

(declare-fun res!903431 () Bool)

(assert (=> b!1358855 (=> (not res!903431) (not e!771132))))

(declare-fun contains!9437 (List!31728 (_ BitVec 64)) Bool)

(assert (=> b!1358855 (= res!903431 (not (contains!9437 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358856 () Bool)

(declare-fun res!903435 () Bool)

(assert (=> b!1358856 (=> (not res!903435) (not e!771132))))

(assert (=> b!1358856 (= res!903435 (not (contains!9437 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358857 () Bool)

(assert (=> b!1358857 (= e!771132 false)))

(declare-fun lt!599450 () Unit!44721)

(assert (=> b!1358857 (= lt!599450 e!771133)))

(declare-fun c!127151 () Bool)

(assert (=> b!1358857 (= c!127151 (validKeyInArray!0 (select (arr!44687 a!3742) from!3120)))))

(declare-fun b!1358858 () Bool)

(declare-fun res!903429 () Bool)

(assert (=> b!1358858 (=> (not res!903429) (not e!771132))))

(declare-fun noDuplicate!2294 (List!31728) Bool)

(assert (=> b!1358858 (= res!903429 (noDuplicate!2294 acc!759))))

(declare-fun b!1358859 () Bool)

(declare-fun Unit!44723 () Unit!44721)

(assert (=> b!1358859 (= e!771133 Unit!44723)))

(declare-fun b!1358860 () Bool)

(declare-fun res!903433 () Bool)

(assert (=> b!1358860 (=> (not res!903433) (not e!771132))))

(assert (=> b!1358860 (= res!903433 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45237 a!3742)))))

(assert (= (and start!114494 res!903428) b!1358858))

(assert (= (and b!1358858 res!903429) b!1358855))

(assert (= (and b!1358855 res!903431) b!1358856))

(assert (= (and b!1358856 res!903435) b!1358850))

(assert (= (and b!1358850 res!903432) b!1358854))

(assert (= (and b!1358854 res!903434) b!1358852))

(assert (= (and b!1358852 res!903436) b!1358851))

(assert (= (and b!1358851 res!903430) b!1358860))

(assert (= (and b!1358860 res!903433) b!1358857))

(assert (= (and b!1358857 c!127151) b!1358853))

(assert (= (and b!1358857 (not c!127151)) b!1358859))

(declare-fun m!1244371 () Bool)

(assert (=> b!1358857 m!1244371))

(assert (=> b!1358857 m!1244371))

(declare-fun m!1244373 () Bool)

(assert (=> b!1358857 m!1244373))

(declare-fun m!1244375 () Bool)

(assert (=> b!1358858 m!1244375))

(declare-fun m!1244377 () Bool)

(assert (=> b!1358853 m!1244377))

(assert (=> b!1358853 m!1244371))

(declare-fun m!1244379 () Bool)

(assert (=> b!1358853 m!1244379))

(declare-fun m!1244381 () Bool)

(assert (=> b!1358853 m!1244381))

(declare-fun m!1244383 () Bool)

(assert (=> b!1358853 m!1244383))

(assert (=> b!1358853 m!1244371))

(assert (=> b!1358853 m!1244379))

(declare-fun m!1244385 () Bool)

(assert (=> b!1358853 m!1244385))

(declare-fun m!1244387 () Bool)

(assert (=> b!1358856 m!1244387))

(declare-fun m!1244389 () Bool)

(assert (=> b!1358855 m!1244389))

(declare-fun m!1244391 () Bool)

(assert (=> b!1358850 m!1244391))

(declare-fun m!1244393 () Bool)

(assert (=> start!114494 m!1244393))

(declare-fun m!1244395 () Bool)

(assert (=> b!1358854 m!1244395))

(declare-fun m!1244397 () Bool)

(assert (=> b!1358851 m!1244397))

(push 1)

(assert (not b!1358856))

(assert (not b!1358854))

(assert (not b!1358851))

(assert (not start!114494))

(assert (not b!1358855))

(assert (not b!1358857))

(assert (not b!1358850))

(assert (not b!1358858))

(assert (not b!1358853))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

