; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115102 () Bool)

(assert start!115102)

(declare-fun b!1363054 () Bool)

(declare-fun res!906362 () Bool)

(declare-fun e!773387 () Bool)

(assert (=> b!1363054 (=> (not res!906362) (not e!773387))))

(declare-datatypes ((array!92728 0))(
  ( (array!92729 (arr!44794 (Array (_ BitVec 32) (_ BitVec 64))) (size!45345 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92728)

(declare-datatypes ((List!31822 0))(
  ( (Nil!31819) (Cons!31818 (h!33036 (_ BitVec 64)) (t!46499 List!31822)) )
))
(declare-fun arrayNoDuplicates!0 (array!92728 (_ BitVec 32) List!31822) Bool)

(assert (=> b!1363054 (= res!906362 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31819))))

(declare-fun b!1363055 () Bool)

(declare-fun res!906368 () Bool)

(assert (=> b!1363055 (=> (not res!906368) (not e!773387))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363055 (= res!906368 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45345 a!3742))))))

(declare-fun b!1363056 () Bool)

(declare-fun res!906372 () Bool)

(assert (=> b!1363056 (=> (not res!906372) (not e!773387))))

(declare-fun acc!759 () List!31822)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1363056 (= res!906372 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363057 () Bool)

(declare-datatypes ((Unit!44822 0))(
  ( (Unit!44823) )
))
(declare-fun e!773385 () Unit!44822)

(declare-fun Unit!44824 () Unit!44822)

(assert (=> b!1363057 (= e!773385 Unit!44824)))

(declare-fun b!1363058 () Bool)

(declare-fun res!906359 () Bool)

(declare-fun e!773388 () Bool)

(assert (=> b!1363058 (=> (not res!906359) (not e!773388))))

(declare-fun lt!600746 () List!31822)

(declare-fun noDuplicate!2365 (List!31822) Bool)

(assert (=> b!1363058 (= res!906359 (noDuplicate!2365 lt!600746))))

(declare-fun b!1363059 () Bool)

(declare-fun res!906369 () Bool)

(assert (=> b!1363059 (=> (not res!906369) (not e!773387))))

(declare-fun contains!9534 (List!31822 (_ BitVec 64)) Bool)

(assert (=> b!1363059 (= res!906369 (not (contains!9534 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363060 () Bool)

(declare-fun res!906367 () Bool)

(assert (=> b!1363060 (=> (not res!906367) (not e!773387))))

(assert (=> b!1363060 (= res!906367 (not (contains!9534 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363062 () Bool)

(declare-fun lt!600743 () Unit!44822)

(assert (=> b!1363062 (= e!773385 lt!600743)))

(declare-fun lt!600747 () Unit!44822)

(declare-fun lemmaListSubSeqRefl!0 (List!31822) Unit!44822)

(assert (=> b!1363062 (= lt!600747 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!893 (List!31822 List!31822) Bool)

(assert (=> b!1363062 (subseq!893 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92728 List!31822 List!31822 (_ BitVec 32)) Unit!44822)

(declare-fun $colon$colon!895 (List!31822 (_ BitVec 64)) List!31822)

(assert (=> b!1363062 (= lt!600743 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!895 acc!759 (select (arr!44794 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1363062 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363063 () Bool)

(declare-fun res!906370 () Bool)

(assert (=> b!1363063 (=> (not res!906370) (not e!773387))))

(assert (=> b!1363063 (= res!906370 (noDuplicate!2365 acc!759))))

(declare-fun b!1363064 () Bool)

(declare-fun res!906364 () Bool)

(assert (=> b!1363064 (=> (not res!906364) (not e!773387))))

(assert (=> b!1363064 (= res!906364 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45345 a!3742)))))

(declare-fun b!1363065 () Bool)

(declare-fun res!906366 () Bool)

(assert (=> b!1363065 (=> (not res!906366) (not e!773387))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363065 (= res!906366 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363066 () Bool)

(declare-fun res!906361 () Bool)

(assert (=> b!1363066 (=> (not res!906361) (not e!773388))))

(assert (=> b!1363066 (= res!906361 (not (contains!9534 lt!600746 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!906371 () Bool)

(assert (=> start!115102 (=> (not res!906371) (not e!773387))))

(assert (=> start!115102 (= res!906371 (and (bvslt (size!45345 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45345 a!3742))))))

(assert (=> start!115102 e!773387))

(assert (=> start!115102 true))

(declare-fun array_inv!34075 (array!92728) Bool)

(assert (=> start!115102 (array_inv!34075 a!3742)))

(declare-fun b!1363061 () Bool)

(declare-fun res!906363 () Bool)

(assert (=> b!1363061 (=> (not res!906363) (not e!773388))))

(assert (=> b!1363061 (= res!906363 (not (contains!9534 lt!600746 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363067 () Bool)

(declare-fun e!773389 () Bool)

(assert (=> b!1363067 (= e!773387 e!773389)))

(declare-fun res!906365 () Bool)

(assert (=> b!1363067 (=> (not res!906365) (not e!773389))))

(declare-fun lt!600745 () Bool)

(assert (=> b!1363067 (= res!906365 (and (not (= from!3120 i!1404)) lt!600745))))

(declare-fun lt!600742 () Unit!44822)

(assert (=> b!1363067 (= lt!600742 e!773385)))

(declare-fun c!127795 () Bool)

(assert (=> b!1363067 (= c!127795 lt!600745)))

(assert (=> b!1363067 (= lt!600745 (validKeyInArray!0 (select (arr!44794 a!3742) from!3120)))))

(declare-fun b!1363068 () Bool)

(assert (=> b!1363068 (= e!773388 false)))

(declare-fun lt!600744 () Bool)

(assert (=> b!1363068 (= lt!600744 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600746))))

(declare-fun b!1363069 () Bool)

(assert (=> b!1363069 (= e!773389 e!773388)))

(declare-fun res!906360 () Bool)

(assert (=> b!1363069 (=> (not res!906360) (not e!773388))))

(assert (=> b!1363069 (= res!906360 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1363069 (= lt!600746 ($colon$colon!895 acc!759 (select (arr!44794 a!3742) from!3120)))))

(assert (= (and start!115102 res!906371) b!1363063))

(assert (= (and b!1363063 res!906370) b!1363060))

(assert (= (and b!1363060 res!906367) b!1363059))

(assert (= (and b!1363059 res!906369) b!1363054))

(assert (= (and b!1363054 res!906362) b!1363056))

(assert (= (and b!1363056 res!906372) b!1363055))

(assert (= (and b!1363055 res!906368) b!1363065))

(assert (= (and b!1363065 res!906366) b!1363064))

(assert (= (and b!1363064 res!906364) b!1363067))

(assert (= (and b!1363067 c!127795) b!1363062))

(assert (= (and b!1363067 (not c!127795)) b!1363057))

(assert (= (and b!1363067 res!906365) b!1363069))

(assert (= (and b!1363069 res!906360) b!1363058))

(assert (= (and b!1363058 res!906359) b!1363066))

(assert (= (and b!1363066 res!906361) b!1363061))

(assert (= (and b!1363061 res!906363) b!1363068))

(declare-fun m!1248409 () Bool)

(assert (=> b!1363067 m!1248409))

(assert (=> b!1363067 m!1248409))

(declare-fun m!1248411 () Bool)

(assert (=> b!1363067 m!1248411))

(declare-fun m!1248413 () Bool)

(assert (=> b!1363063 m!1248413))

(declare-fun m!1248415 () Bool)

(assert (=> b!1363065 m!1248415))

(declare-fun m!1248417 () Bool)

(assert (=> b!1363059 m!1248417))

(declare-fun m!1248419 () Bool)

(assert (=> b!1363068 m!1248419))

(declare-fun m!1248421 () Bool)

(assert (=> start!115102 m!1248421))

(declare-fun m!1248423 () Bool)

(assert (=> b!1363058 m!1248423))

(declare-fun m!1248425 () Bool)

(assert (=> b!1363060 m!1248425))

(declare-fun m!1248427 () Bool)

(assert (=> b!1363056 m!1248427))

(assert (=> b!1363069 m!1248409))

(assert (=> b!1363069 m!1248409))

(declare-fun m!1248429 () Bool)

(assert (=> b!1363069 m!1248429))

(declare-fun m!1248431 () Bool)

(assert (=> b!1363054 m!1248431))

(declare-fun m!1248433 () Bool)

(assert (=> b!1363062 m!1248433))

(assert (=> b!1363062 m!1248409))

(assert (=> b!1363062 m!1248429))

(declare-fun m!1248435 () Bool)

(assert (=> b!1363062 m!1248435))

(declare-fun m!1248437 () Bool)

(assert (=> b!1363062 m!1248437))

(assert (=> b!1363062 m!1248409))

(assert (=> b!1363062 m!1248429))

(declare-fun m!1248439 () Bool)

(assert (=> b!1363062 m!1248439))

(declare-fun m!1248441 () Bool)

(assert (=> b!1363066 m!1248441))

(declare-fun m!1248443 () Bool)

(assert (=> b!1363061 m!1248443))

(check-sat (not b!1363054) (not b!1363059) (not b!1363067) (not b!1363062) (not b!1363066) (not start!115102) (not b!1363068) (not b!1363063) (not b!1363060) (not b!1363056) (not b!1363058) (not b!1363065) (not b!1363069) (not b!1363061))
(check-sat)
