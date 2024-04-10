; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114498 () Bool)

(assert start!114498)

(declare-fun b!1358916 () Bool)

(declare-fun res!903489 () Bool)

(declare-fun e!771149 () Bool)

(assert (=> b!1358916 (=> (not res!903489) (not e!771149))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358916 (= res!903489 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358917 () Bool)

(declare-fun res!903487 () Bool)

(assert (=> b!1358917 (=> (not res!903487) (not e!771149))))

(declare-datatypes ((List!31730 0))(
  ( (Nil!31727) (Cons!31726 (h!32935 (_ BitVec 64)) (t!46400 List!31730)) )
))
(declare-fun acc!759 () List!31730)

(declare-datatypes ((array!92494 0))(
  ( (array!92495 (arr!44689 (Array (_ BitVec 32) (_ BitVec 64))) (size!45239 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92494)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92494 (_ BitVec 32) List!31730) Bool)

(assert (=> b!1358917 (= res!903487 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358918 () Bool)

(declare-fun res!903485 () Bool)

(assert (=> b!1358918 (=> (not res!903485) (not e!771149))))

(assert (=> b!1358918 (= res!903485 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45239 a!3742)))))

(declare-fun b!1358919 () Bool)

(declare-fun res!903483 () Bool)

(assert (=> b!1358919 (=> (not res!903483) (not e!771149))))

(declare-fun noDuplicate!2296 (List!31730) Bool)

(assert (=> b!1358919 (= res!903483 (noDuplicate!2296 acc!759))))

(declare-fun res!903484 () Bool)

(assert (=> start!114498 (=> (not res!903484) (not e!771149))))

(assert (=> start!114498 (= res!903484 (and (bvslt (size!45239 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45239 a!3742))))))

(assert (=> start!114498 e!771149))

(assert (=> start!114498 true))

(declare-fun array_inv!33717 (array!92494) Bool)

(assert (=> start!114498 (array_inv!33717 a!3742)))

(declare-fun b!1358920 () Bool)

(declare-fun res!903486 () Bool)

(assert (=> b!1358920 (=> (not res!903486) (not e!771149))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358920 (= res!903486 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45239 a!3742))))))

(declare-fun b!1358921 () Bool)

(declare-fun res!903488 () Bool)

(assert (=> b!1358921 (=> (not res!903488) (not e!771149))))

(assert (=> b!1358921 (= res!903488 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31727))))

(declare-fun b!1358922 () Bool)

(declare-fun res!903482 () Bool)

(assert (=> b!1358922 (=> (not res!903482) (not e!771149))))

(declare-fun contains!9439 (List!31730 (_ BitVec 64)) Bool)

(assert (=> b!1358922 (= res!903482 (not (contains!9439 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358923 () Bool)

(declare-datatypes ((Unit!44727 0))(
  ( (Unit!44728) )
))
(declare-fun e!771151 () Unit!44727)

(declare-fun Unit!44729 () Unit!44727)

(assert (=> b!1358923 (= e!771151 Unit!44729)))

(declare-fun b!1358924 () Bool)

(declare-fun lt!599468 () Unit!44727)

(assert (=> b!1358924 (= e!771151 lt!599468)))

(declare-fun lt!599470 () Unit!44727)

(declare-fun lemmaListSubSeqRefl!0 (List!31730) Unit!44727)

(assert (=> b!1358924 (= lt!599470 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!841 (List!31730 List!31730) Bool)

(assert (=> b!1358924 (subseq!841 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92494 List!31730 List!31730 (_ BitVec 32)) Unit!44727)

(declare-fun $colon$colon!844 (List!31730 (_ BitVec 64)) List!31730)

(assert (=> b!1358924 (= lt!599468 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!844 acc!759 (select (arr!44689 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1358924 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1358925 () Bool)

(declare-fun res!903490 () Bool)

(assert (=> b!1358925 (=> (not res!903490) (not e!771149))))

(assert (=> b!1358925 (= res!903490 (not (contains!9439 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358926 () Bool)

(assert (=> b!1358926 (= e!771149 false)))

(declare-fun lt!599469 () Unit!44727)

(assert (=> b!1358926 (= lt!599469 e!771151)))

(declare-fun c!127157 () Bool)

(assert (=> b!1358926 (= c!127157 (validKeyInArray!0 (select (arr!44689 a!3742) from!3120)))))

(assert (= (and start!114498 res!903484) b!1358919))

(assert (= (and b!1358919 res!903483) b!1358925))

(assert (= (and b!1358925 res!903490) b!1358922))

(assert (= (and b!1358922 res!903482) b!1358921))

(assert (= (and b!1358921 res!903488) b!1358917))

(assert (= (and b!1358917 res!903487) b!1358920))

(assert (= (and b!1358920 res!903486) b!1358916))

(assert (= (and b!1358916 res!903489) b!1358918))

(assert (= (and b!1358918 res!903485) b!1358926))

(assert (= (and b!1358926 c!127157) b!1358924))

(assert (= (and b!1358926 (not c!127157)) b!1358923))

(declare-fun m!1244427 () Bool)

(assert (=> b!1358921 m!1244427))

(declare-fun m!1244429 () Bool)

(assert (=> b!1358919 m!1244429))

(declare-fun m!1244431 () Bool)

(assert (=> b!1358926 m!1244431))

(assert (=> b!1358926 m!1244431))

(declare-fun m!1244433 () Bool)

(assert (=> b!1358926 m!1244433))

(declare-fun m!1244435 () Bool)

(assert (=> b!1358922 m!1244435))

(declare-fun m!1244437 () Bool)

(assert (=> b!1358916 m!1244437))

(declare-fun m!1244439 () Bool)

(assert (=> b!1358917 m!1244439))

(declare-fun m!1244441 () Bool)

(assert (=> b!1358925 m!1244441))

(declare-fun m!1244443 () Bool)

(assert (=> b!1358924 m!1244443))

(assert (=> b!1358924 m!1244431))

(declare-fun m!1244445 () Bool)

(assert (=> b!1358924 m!1244445))

(declare-fun m!1244447 () Bool)

(assert (=> b!1358924 m!1244447))

(declare-fun m!1244449 () Bool)

(assert (=> b!1358924 m!1244449))

(assert (=> b!1358924 m!1244431))

(assert (=> b!1358924 m!1244445))

(declare-fun m!1244451 () Bool)

(assert (=> b!1358924 m!1244451))

(declare-fun m!1244453 () Bool)

(assert (=> start!114498 m!1244453))

(push 1)

(assert (not b!1358916))

(assert (not b!1358924))

(assert (not b!1358919))

(assert (not b!1358925))

(assert (not b!1358926))

(assert (not b!1358917))

(assert (not b!1358922))

(assert (not start!114498))

(assert (not b!1358921))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

