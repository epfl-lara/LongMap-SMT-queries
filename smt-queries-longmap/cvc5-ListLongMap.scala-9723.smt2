; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115064 () Bool)

(assert start!115064)

(declare-fun b!1363538 () Bool)

(declare-fun res!907337 () Bool)

(declare-fun e!773294 () Bool)

(assert (=> b!1363538 (=> (not res!907337) (not e!773294))))

(declare-datatypes ((List!31818 0))(
  ( (Nil!31815) (Cons!31814 (h!33023 (_ BitVec 64)) (t!46509 List!31818)) )
))
(declare-fun acc!759 () List!31818)

(declare-fun noDuplicate!2384 (List!31818) Bool)

(assert (=> b!1363538 (= res!907337 (noDuplicate!2384 acc!759))))

(declare-fun b!1363539 () Bool)

(declare-fun e!773296 () Bool)

(assert (=> b!1363539 (= e!773296 false)))

(declare-fun lt!600809 () Bool)

(declare-datatypes ((array!92691 0))(
  ( (array!92692 (arr!44777 (Array (_ BitVec 32) (_ BitVec 64))) (size!45327 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92691)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92691 (_ BitVec 32) List!31818) Bool)

(assert (=> b!1363539 (= lt!600809 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1363540 () Bool)

(declare-fun res!907338 () Bool)

(assert (=> b!1363540 (=> (not res!907338) (not e!773294))))

(declare-fun contains!9527 (List!31818 (_ BitVec 64)) Bool)

(assert (=> b!1363540 (= res!907338 (not (contains!9527 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!907333 () Bool)

(assert (=> start!115064 (=> (not res!907333) (not e!773294))))

(assert (=> start!115064 (= res!907333 (and (bvslt (size!45327 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45327 a!3742))))))

(assert (=> start!115064 e!773294))

(assert (=> start!115064 true))

(declare-fun array_inv!33805 (array!92691) Bool)

(assert (=> start!115064 (array_inv!33805 a!3742)))

(declare-fun b!1363541 () Bool)

(assert (=> b!1363541 (= e!773294 e!773296)))

(declare-fun res!907331 () Bool)

(assert (=> b!1363541 (=> (not res!907331) (not e!773296))))

(declare-fun lt!600811 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363541 (= res!907331 (and (not (= from!3120 i!1404)) (not lt!600811) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44991 0))(
  ( (Unit!44992) )
))
(declare-fun lt!600807 () Unit!44991)

(declare-fun e!773293 () Unit!44991)

(assert (=> b!1363541 (= lt!600807 e!773293)))

(declare-fun c!127544 () Bool)

(assert (=> b!1363541 (= c!127544 lt!600811)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363541 (= lt!600811 (validKeyInArray!0 (select (arr!44777 a!3742) from!3120)))))

(declare-fun b!1363542 () Bool)

(declare-fun res!907334 () Bool)

(assert (=> b!1363542 (=> (not res!907334) (not e!773294))))

(assert (=> b!1363542 (= res!907334 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45327 a!3742))))))

(declare-fun b!1363543 () Bool)

(declare-fun res!907335 () Bool)

(assert (=> b!1363543 (=> (not res!907335) (not e!773294))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1363543 (= res!907335 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363544 () Bool)

(declare-fun res!907330 () Bool)

(assert (=> b!1363544 (=> (not res!907330) (not e!773294))))

(assert (=> b!1363544 (= res!907330 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363545 () Bool)

(declare-fun res!907339 () Bool)

(assert (=> b!1363545 (=> (not res!907339) (not e!773294))))

(assert (=> b!1363545 (= res!907339 (not (contains!9527 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363546 () Bool)

(declare-fun res!907332 () Bool)

(assert (=> b!1363546 (=> (not res!907332) (not e!773294))))

(assert (=> b!1363546 (= res!907332 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45327 a!3742)))))

(declare-fun b!1363547 () Bool)

(declare-fun res!907336 () Bool)

(assert (=> b!1363547 (=> (not res!907336) (not e!773294))))

(assert (=> b!1363547 (= res!907336 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31815))))

(declare-fun b!1363548 () Bool)

(declare-fun Unit!44993 () Unit!44991)

(assert (=> b!1363548 (= e!773293 Unit!44993)))

(declare-fun b!1363549 () Bool)

(declare-fun lt!600810 () Unit!44991)

(assert (=> b!1363549 (= e!773293 lt!600810)))

(declare-fun lt!600808 () Unit!44991)

(declare-fun lemmaListSubSeqRefl!0 (List!31818) Unit!44991)

(assert (=> b!1363549 (= lt!600808 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!929 (List!31818 List!31818) Bool)

(assert (=> b!1363549 (subseq!929 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92691 List!31818 List!31818 (_ BitVec 32)) Unit!44991)

(declare-fun $colon$colon!932 (List!31818 (_ BitVec 64)) List!31818)

(assert (=> b!1363549 (= lt!600810 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!932 acc!759 (select (arr!44777 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1363549 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!115064 res!907333) b!1363538))

(assert (= (and b!1363538 res!907337) b!1363545))

(assert (= (and b!1363545 res!907339) b!1363540))

(assert (= (and b!1363540 res!907338) b!1363547))

(assert (= (and b!1363547 res!907336) b!1363544))

(assert (= (and b!1363544 res!907330) b!1363542))

(assert (= (and b!1363542 res!907334) b!1363543))

(assert (= (and b!1363543 res!907335) b!1363546))

(assert (= (and b!1363546 res!907332) b!1363541))

(assert (= (and b!1363541 c!127544) b!1363549))

(assert (= (and b!1363541 (not c!127544)) b!1363548))

(assert (= (and b!1363541 res!907331) b!1363539))

(declare-fun m!1248325 () Bool)

(assert (=> b!1363549 m!1248325))

(declare-fun m!1248327 () Bool)

(assert (=> b!1363549 m!1248327))

(declare-fun m!1248329 () Bool)

(assert (=> b!1363549 m!1248329))

(declare-fun m!1248331 () Bool)

(assert (=> b!1363549 m!1248331))

(declare-fun m!1248333 () Bool)

(assert (=> b!1363549 m!1248333))

(assert (=> b!1363549 m!1248327))

(assert (=> b!1363549 m!1248329))

(declare-fun m!1248335 () Bool)

(assert (=> b!1363549 m!1248335))

(declare-fun m!1248337 () Bool)

(assert (=> b!1363543 m!1248337))

(declare-fun m!1248339 () Bool)

(assert (=> start!115064 m!1248339))

(declare-fun m!1248341 () Bool)

(assert (=> b!1363540 m!1248341))

(declare-fun m!1248343 () Bool)

(assert (=> b!1363538 m!1248343))

(assert (=> b!1363539 m!1248333))

(declare-fun m!1248345 () Bool)

(assert (=> b!1363547 m!1248345))

(assert (=> b!1363541 m!1248327))

(assert (=> b!1363541 m!1248327))

(declare-fun m!1248347 () Bool)

(assert (=> b!1363541 m!1248347))

(declare-fun m!1248349 () Bool)

(assert (=> b!1363544 m!1248349))

(declare-fun m!1248351 () Bool)

(assert (=> b!1363545 m!1248351))

(push 1)

