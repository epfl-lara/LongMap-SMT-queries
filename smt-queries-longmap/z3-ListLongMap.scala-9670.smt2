; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114382 () Bool)

(assert start!114382)

(declare-fun b!1357351 () Bool)

(declare-fun res!901404 () Bool)

(declare-fun e!770794 () Bool)

(assert (=> b!1357351 (=> (not res!901404) (not e!770794))))

(declare-datatypes ((array!92455 0))(
  ( (array!92456 (arr!44671 (Array (_ BitVec 32) (_ BitVec 64))) (size!45222 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92455)

(declare-datatypes ((List!31699 0))(
  ( (Nil!31696) (Cons!31695 (h!32913 (_ BitVec 64)) (t!46349 List!31699)) )
))
(declare-fun arrayNoDuplicates!0 (array!92455 (_ BitVec 32) List!31699) Bool)

(assert (=> b!1357351 (= res!901404 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31696))))

(declare-fun b!1357352 () Bool)

(declare-fun res!901402 () Bool)

(assert (=> b!1357352 (=> (not res!901402) (not e!770794))))

(declare-fun acc!759 () List!31699)

(declare-fun contains!9411 (List!31699 (_ BitVec 64)) Bool)

(assert (=> b!1357352 (= res!901402 (not (contains!9411 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357353 () Bool)

(declare-fun res!901403 () Bool)

(assert (=> b!1357353 (=> (not res!901403) (not e!770794))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1357353 (= res!901403 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1357355 () Bool)

(declare-fun e!770793 () Bool)

(assert (=> b!1357355 (= e!770793 (not (bvsle from!3120 (size!45222 a!3742))))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1357355 (arrayNoDuplicates!0 (array!92456 (store (arr!44671 a!3742) i!1404 l!3587) (size!45222 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-datatypes ((Unit!44534 0))(
  ( (Unit!44535) )
))
(declare-fun lt!599362 () Unit!44534)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92455 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31699) Unit!44534)

(assert (=> b!1357355 (= lt!599362 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1357356 () Bool)

(declare-fun e!770791 () Unit!44534)

(declare-fun Unit!44536 () Unit!44534)

(assert (=> b!1357356 (= e!770791 Unit!44536)))

(declare-fun b!1357357 () Bool)

(declare-fun res!901401 () Bool)

(assert (=> b!1357357 (=> (not res!901401) (not e!770794))))

(declare-fun noDuplicate!2242 (List!31699) Bool)

(assert (=> b!1357357 (= res!901401 (noDuplicate!2242 acc!759))))

(declare-fun b!1357358 () Bool)

(assert (=> b!1357358 (= e!770794 e!770793)))

(declare-fun res!901396 () Bool)

(assert (=> b!1357358 (=> (not res!901396) (not e!770793))))

(declare-fun lt!599360 () Bool)

(assert (=> b!1357358 (= res!901396 (and (not (= from!3120 i!1404)) (not lt!599360) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599361 () Unit!44534)

(assert (=> b!1357358 (= lt!599361 e!770791)))

(declare-fun c!127426 () Bool)

(assert (=> b!1357358 (= c!127426 lt!599360)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357358 (= lt!599360 (validKeyInArray!0 (select (arr!44671 a!3742) from!3120)))))

(declare-fun b!1357359 () Bool)

(declare-fun res!901400 () Bool)

(assert (=> b!1357359 (=> (not res!901400) (not e!770794))))

(assert (=> b!1357359 (= res!901400 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1357360 () Bool)

(declare-fun res!901399 () Bool)

(assert (=> b!1357360 (=> (not res!901399) (not e!770794))))

(assert (=> b!1357360 (= res!901399 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45222 a!3742))))))

(declare-fun b!1357361 () Bool)

(declare-fun res!901398 () Bool)

(assert (=> b!1357361 (=> (not res!901398) (not e!770793))))

(assert (=> b!1357361 (= res!901398 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1357362 () Bool)

(declare-fun lt!599364 () Unit!44534)

(assert (=> b!1357362 (= e!770791 lt!599364)))

(declare-fun lt!599363 () Unit!44534)

(declare-fun lemmaListSubSeqRefl!0 (List!31699) Unit!44534)

(assert (=> b!1357362 (= lt!599363 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!788 (List!31699 List!31699) Bool)

(assert (=> b!1357362 (subseq!788 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92455 List!31699 List!31699 (_ BitVec 32)) Unit!44534)

(declare-fun $colon$colon!802 (List!31699 (_ BitVec 64)) List!31699)

(assert (=> b!1357362 (= lt!599364 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!802 acc!759 (select (arr!44671 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1357362 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1357363 () Bool)

(declare-fun res!901395 () Bool)

(assert (=> b!1357363 (=> (not res!901395) (not e!770794))))

(assert (=> b!1357363 (= res!901395 (not (contains!9411 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357354 () Bool)

(declare-fun res!901394 () Bool)

(assert (=> b!1357354 (=> (not res!901394) (not e!770794))))

(assert (=> b!1357354 (= res!901394 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45222 a!3742)))))

(declare-fun res!901397 () Bool)

(assert (=> start!114382 (=> (not res!901397) (not e!770794))))

(assert (=> start!114382 (= res!901397 (and (bvslt (size!45222 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45222 a!3742))))))

(assert (=> start!114382 e!770794))

(assert (=> start!114382 true))

(declare-fun array_inv!33952 (array!92455) Bool)

(assert (=> start!114382 (array_inv!33952 a!3742)))

(assert (= (and start!114382 res!901397) b!1357357))

(assert (= (and b!1357357 res!901401) b!1357352))

(assert (= (and b!1357352 res!901402) b!1357363))

(assert (= (and b!1357363 res!901395) b!1357351))

(assert (= (and b!1357351 res!901404) b!1357353))

(assert (= (and b!1357353 res!901403) b!1357360))

(assert (= (and b!1357360 res!901399) b!1357359))

(assert (= (and b!1357359 res!901400) b!1357354))

(assert (= (and b!1357354 res!901394) b!1357358))

(assert (= (and b!1357358 c!127426) b!1357362))

(assert (= (and b!1357358 (not c!127426)) b!1357356))

(assert (= (and b!1357358 res!901396) b!1357361))

(assert (= (and b!1357361 res!901398) b!1357355))

(declare-fun m!1243693 () Bool)

(assert (=> b!1357363 m!1243693))

(declare-fun m!1243695 () Bool)

(assert (=> b!1357358 m!1243695))

(assert (=> b!1357358 m!1243695))

(declare-fun m!1243697 () Bool)

(assert (=> b!1357358 m!1243697))

(declare-fun m!1243699 () Bool)

(assert (=> b!1357357 m!1243699))

(declare-fun m!1243701 () Bool)

(assert (=> b!1357362 m!1243701))

(assert (=> b!1357362 m!1243695))

(declare-fun m!1243703 () Bool)

(assert (=> b!1357362 m!1243703))

(declare-fun m!1243705 () Bool)

(assert (=> b!1357362 m!1243705))

(declare-fun m!1243707 () Bool)

(assert (=> b!1357362 m!1243707))

(assert (=> b!1357362 m!1243695))

(assert (=> b!1357362 m!1243703))

(declare-fun m!1243709 () Bool)

(assert (=> b!1357362 m!1243709))

(assert (=> b!1357361 m!1243707))

(declare-fun m!1243711 () Bool)

(assert (=> b!1357352 m!1243711))

(declare-fun m!1243713 () Bool)

(assert (=> b!1357351 m!1243713))

(declare-fun m!1243715 () Bool)

(assert (=> b!1357353 m!1243715))

(declare-fun m!1243717 () Bool)

(assert (=> b!1357359 m!1243717))

(declare-fun m!1243719 () Bool)

(assert (=> b!1357355 m!1243719))

(declare-fun m!1243721 () Bool)

(assert (=> b!1357355 m!1243721))

(declare-fun m!1243723 () Bool)

(assert (=> b!1357355 m!1243723))

(declare-fun m!1243725 () Bool)

(assert (=> start!114382 m!1243725))

(check-sat (not b!1357357) (not b!1357362) (not b!1357363) (not b!1357355) (not b!1357352) (not b!1357359) (not start!114382) (not b!1357358) (not b!1357361) (not b!1357353) (not b!1357351))
(check-sat)
