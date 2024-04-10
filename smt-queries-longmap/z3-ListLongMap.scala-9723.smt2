; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115066 () Bool)

(assert start!115066)

(declare-fun b!1363574 () Bool)

(declare-fun e!773305 () Bool)

(assert (=> b!1363574 (= e!773305 false)))

(declare-datatypes ((List!31819 0))(
  ( (Nil!31816) (Cons!31815 (h!33024 (_ BitVec 64)) (t!46510 List!31819)) )
))
(declare-fun acc!759 () List!31819)

(declare-fun lt!600822 () Bool)

(declare-datatypes ((array!92693 0))(
  ( (array!92694 (arr!44778 (Array (_ BitVec 32) (_ BitVec 64))) (size!45328 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92693)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92693 (_ BitVec 32) List!31819) Bool)

(assert (=> b!1363574 (= lt!600822 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1363575 () Bool)

(declare-datatypes ((Unit!44994 0))(
  ( (Unit!44995) )
))
(declare-fun e!773308 () Unit!44994)

(declare-fun lt!600826 () Unit!44994)

(assert (=> b!1363575 (= e!773308 lt!600826)))

(declare-fun lt!600824 () Unit!44994)

(declare-fun lemmaListSubSeqRefl!0 (List!31819) Unit!44994)

(assert (=> b!1363575 (= lt!600824 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!930 (List!31819 List!31819) Bool)

(assert (=> b!1363575 (subseq!930 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92693 List!31819 List!31819 (_ BitVec 32)) Unit!44994)

(declare-fun $colon$colon!933 (List!31819 (_ BitVec 64)) List!31819)

(assert (=> b!1363575 (= lt!600826 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!933 acc!759 (select (arr!44778 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1363575 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363576 () Bool)

(declare-fun Unit!44996 () Unit!44994)

(assert (=> b!1363576 (= e!773308 Unit!44996)))

(declare-fun b!1363577 () Bool)

(declare-fun e!773307 () Bool)

(assert (=> b!1363577 (= e!773307 e!773305)))

(declare-fun res!907368 () Bool)

(assert (=> b!1363577 (=> (not res!907368) (not e!773305))))

(declare-fun lt!600823 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363577 (= res!907368 (and (not (= from!3120 i!1404)) (not lt!600823) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!600825 () Unit!44994)

(assert (=> b!1363577 (= lt!600825 e!773308)))

(declare-fun c!127547 () Bool)

(assert (=> b!1363577 (= c!127547 lt!600823)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363577 (= lt!600823 (validKeyInArray!0 (select (arr!44778 a!3742) from!3120)))))

(declare-fun b!1363579 () Bool)

(declare-fun res!907360 () Bool)

(assert (=> b!1363579 (=> (not res!907360) (not e!773307))))

(declare-fun contains!9528 (List!31819 (_ BitVec 64)) Bool)

(assert (=> b!1363579 (= res!907360 (not (contains!9528 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363580 () Bool)

(declare-fun res!907369 () Bool)

(assert (=> b!1363580 (=> (not res!907369) (not e!773307))))

(assert (=> b!1363580 (= res!907369 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45328 a!3742)))))

(declare-fun b!1363581 () Bool)

(declare-fun res!907364 () Bool)

(assert (=> b!1363581 (=> (not res!907364) (not e!773307))))

(assert (=> b!1363581 (= res!907364 (not (contains!9528 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363582 () Bool)

(declare-fun res!907367 () Bool)

(assert (=> b!1363582 (=> (not res!907367) (not e!773307))))

(assert (=> b!1363582 (= res!907367 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31816))))

(declare-fun b!1363583 () Bool)

(declare-fun res!907366 () Bool)

(assert (=> b!1363583 (=> (not res!907366) (not e!773307))))

(assert (=> b!1363583 (= res!907366 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45328 a!3742))))))

(declare-fun b!1363578 () Bool)

(declare-fun res!907365 () Bool)

(assert (=> b!1363578 (=> (not res!907365) (not e!773307))))

(declare-fun noDuplicate!2385 (List!31819) Bool)

(assert (=> b!1363578 (= res!907365 (noDuplicate!2385 acc!759))))

(declare-fun res!907362 () Bool)

(assert (=> start!115066 (=> (not res!907362) (not e!773307))))

(assert (=> start!115066 (= res!907362 (and (bvslt (size!45328 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45328 a!3742))))))

(assert (=> start!115066 e!773307))

(assert (=> start!115066 true))

(declare-fun array_inv!33806 (array!92693) Bool)

(assert (=> start!115066 (array_inv!33806 a!3742)))

(declare-fun b!1363584 () Bool)

(declare-fun res!907363 () Bool)

(assert (=> b!1363584 (=> (not res!907363) (not e!773307))))

(assert (=> b!1363584 (= res!907363 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363585 () Bool)

(declare-fun res!907361 () Bool)

(assert (=> b!1363585 (=> (not res!907361) (not e!773307))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1363585 (= res!907361 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!115066 res!907362) b!1363578))

(assert (= (and b!1363578 res!907365) b!1363581))

(assert (= (and b!1363581 res!907364) b!1363579))

(assert (= (and b!1363579 res!907360) b!1363582))

(assert (= (and b!1363582 res!907367) b!1363584))

(assert (= (and b!1363584 res!907363) b!1363583))

(assert (= (and b!1363583 res!907366) b!1363585))

(assert (= (and b!1363585 res!907361) b!1363580))

(assert (= (and b!1363580 res!907369) b!1363577))

(assert (= (and b!1363577 c!127547) b!1363575))

(assert (= (and b!1363577 (not c!127547)) b!1363576))

(assert (= (and b!1363577 res!907368) b!1363574))

(declare-fun m!1248353 () Bool)

(assert (=> b!1363585 m!1248353))

(declare-fun m!1248355 () Bool)

(assert (=> b!1363575 m!1248355))

(declare-fun m!1248357 () Bool)

(assert (=> b!1363575 m!1248357))

(declare-fun m!1248359 () Bool)

(assert (=> b!1363575 m!1248359))

(declare-fun m!1248361 () Bool)

(assert (=> b!1363575 m!1248361))

(declare-fun m!1248363 () Bool)

(assert (=> b!1363575 m!1248363))

(assert (=> b!1363575 m!1248357))

(assert (=> b!1363575 m!1248359))

(declare-fun m!1248365 () Bool)

(assert (=> b!1363575 m!1248365))

(declare-fun m!1248367 () Bool)

(assert (=> b!1363581 m!1248367))

(declare-fun m!1248369 () Bool)

(assert (=> b!1363578 m!1248369))

(declare-fun m!1248371 () Bool)

(assert (=> b!1363579 m!1248371))

(declare-fun m!1248373 () Bool)

(assert (=> start!115066 m!1248373))

(declare-fun m!1248375 () Bool)

(assert (=> b!1363582 m!1248375))

(assert (=> b!1363577 m!1248357))

(assert (=> b!1363577 m!1248357))

(declare-fun m!1248377 () Bool)

(assert (=> b!1363577 m!1248377))

(assert (=> b!1363574 m!1248363))

(declare-fun m!1248379 () Bool)

(assert (=> b!1363584 m!1248379))

(check-sat (not b!1363584) (not b!1363579) (not b!1363581) (not b!1363574) (not b!1363578) (not b!1363577) (not start!115066) (not b!1363582) (not b!1363585) (not b!1363575))
(check-sat)
