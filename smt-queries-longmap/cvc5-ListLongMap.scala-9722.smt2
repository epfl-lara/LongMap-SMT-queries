; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115058 () Bool)

(assert start!115058)

(declare-fun b!1363430 () Bool)

(declare-fun res!907244 () Bool)

(declare-fun e!773260 () Bool)

(assert (=> b!1363430 (=> (not res!907244) (not e!773260))))

(declare-datatypes ((List!31815 0))(
  ( (Nil!31812) (Cons!31811 (h!33020 (_ BitVec 64)) (t!46506 List!31815)) )
))
(declare-fun acc!759 () List!31815)

(declare-fun contains!9524 (List!31815 (_ BitVec 64)) Bool)

(assert (=> b!1363430 (= res!907244 (not (contains!9524 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363431 () Bool)

(declare-fun e!773258 () Bool)

(assert (=> b!1363431 (= e!773258 false)))

(declare-fun lt!600765 () Bool)

(declare-datatypes ((array!92685 0))(
  ( (array!92686 (arr!44774 (Array (_ BitVec 32) (_ BitVec 64))) (size!45324 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92685)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92685 (_ BitVec 32) List!31815) Bool)

(assert (=> b!1363431 (= lt!600765 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1363432 () Bool)

(declare-fun res!907249 () Bool)

(assert (=> b!1363432 (=> (not res!907249) (not e!773260))))

(assert (=> b!1363432 (= res!907249 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31812))))

(declare-fun res!907246 () Bool)

(assert (=> start!115058 (=> (not res!907246) (not e!773260))))

(assert (=> start!115058 (= res!907246 (and (bvslt (size!45324 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45324 a!3742))))))

(assert (=> start!115058 e!773260))

(assert (=> start!115058 true))

(declare-fun array_inv!33802 (array!92685) Bool)

(assert (=> start!115058 (array_inv!33802 a!3742)))

(declare-fun b!1363433 () Bool)

(declare-fun res!907247 () Bool)

(assert (=> b!1363433 (=> (not res!907247) (not e!773260))))

(assert (=> b!1363433 (= res!907247 (not (contains!9524 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363434 () Bool)

(assert (=> b!1363434 (= e!773260 e!773258)))

(declare-fun res!907248 () Bool)

(assert (=> b!1363434 (=> (not res!907248) (not e!773258))))

(declare-fun lt!600764 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363434 (= res!907248 (and (not (= from!3120 i!1404)) (not lt!600764) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44982 0))(
  ( (Unit!44983) )
))
(declare-fun lt!600762 () Unit!44982)

(declare-fun e!773259 () Unit!44982)

(assert (=> b!1363434 (= lt!600762 e!773259)))

(declare-fun c!127535 () Bool)

(assert (=> b!1363434 (= c!127535 lt!600764)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363434 (= lt!600764 (validKeyInArray!0 (select (arr!44774 a!3742) from!3120)))))

(declare-fun b!1363435 () Bool)

(declare-fun res!907241 () Bool)

(assert (=> b!1363435 (=> (not res!907241) (not e!773260))))

(assert (=> b!1363435 (= res!907241 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363436 () Bool)

(declare-fun res!907240 () Bool)

(assert (=> b!1363436 (=> (not res!907240) (not e!773260))))

(assert (=> b!1363436 (= res!907240 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45324 a!3742)))))

(declare-fun b!1363437 () Bool)

(declare-fun lt!600763 () Unit!44982)

(assert (=> b!1363437 (= e!773259 lt!600763)))

(declare-fun lt!600766 () Unit!44982)

(declare-fun lemmaListSubSeqRefl!0 (List!31815) Unit!44982)

(assert (=> b!1363437 (= lt!600766 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!926 (List!31815 List!31815) Bool)

(assert (=> b!1363437 (subseq!926 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92685 List!31815 List!31815 (_ BitVec 32)) Unit!44982)

(declare-fun $colon$colon!929 (List!31815 (_ BitVec 64)) List!31815)

(assert (=> b!1363437 (= lt!600763 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!929 acc!759 (select (arr!44774 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1363437 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363438 () Bool)

(declare-fun res!907243 () Bool)

(assert (=> b!1363438 (=> (not res!907243) (not e!773260))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1363438 (= res!907243 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363439 () Bool)

(declare-fun Unit!44984 () Unit!44982)

(assert (=> b!1363439 (= e!773259 Unit!44984)))

(declare-fun b!1363440 () Bool)

(declare-fun res!907242 () Bool)

(assert (=> b!1363440 (=> (not res!907242) (not e!773260))))

(declare-fun noDuplicate!2381 (List!31815) Bool)

(assert (=> b!1363440 (= res!907242 (noDuplicate!2381 acc!759))))

(declare-fun b!1363441 () Bool)

(declare-fun res!907245 () Bool)

(assert (=> b!1363441 (=> (not res!907245) (not e!773260))))

(assert (=> b!1363441 (= res!907245 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45324 a!3742))))))

(assert (= (and start!115058 res!907246) b!1363440))

(assert (= (and b!1363440 res!907242) b!1363430))

(assert (= (and b!1363430 res!907244) b!1363433))

(assert (= (and b!1363433 res!907247) b!1363432))

(assert (= (and b!1363432 res!907249) b!1363435))

(assert (= (and b!1363435 res!907241) b!1363441))

(assert (= (and b!1363441 res!907245) b!1363438))

(assert (= (and b!1363438 res!907243) b!1363436))

(assert (= (and b!1363436 res!907240) b!1363434))

(assert (= (and b!1363434 c!127535) b!1363437))

(assert (= (and b!1363434 (not c!127535)) b!1363439))

(assert (= (and b!1363434 res!907248) b!1363431))

(declare-fun m!1248241 () Bool)

(assert (=> b!1363440 m!1248241))

(declare-fun m!1248243 () Bool)

(assert (=> b!1363437 m!1248243))

(declare-fun m!1248245 () Bool)

(assert (=> b!1363437 m!1248245))

(declare-fun m!1248247 () Bool)

(assert (=> b!1363437 m!1248247))

(declare-fun m!1248249 () Bool)

(assert (=> b!1363437 m!1248249))

(declare-fun m!1248251 () Bool)

(assert (=> b!1363437 m!1248251))

(assert (=> b!1363437 m!1248245))

(assert (=> b!1363437 m!1248247))

(declare-fun m!1248253 () Bool)

(assert (=> b!1363437 m!1248253))

(declare-fun m!1248255 () Bool)

(assert (=> b!1363435 m!1248255))

(assert (=> b!1363431 m!1248251))

(declare-fun m!1248257 () Bool)

(assert (=> b!1363438 m!1248257))

(declare-fun m!1248259 () Bool)

(assert (=> b!1363433 m!1248259))

(declare-fun m!1248261 () Bool)

(assert (=> b!1363430 m!1248261))

(declare-fun m!1248263 () Bool)

(assert (=> start!115058 m!1248263))

(assert (=> b!1363434 m!1248245))

(assert (=> b!1363434 m!1248245))

(declare-fun m!1248265 () Bool)

(assert (=> b!1363434 m!1248265))

(declare-fun m!1248267 () Bool)

(assert (=> b!1363432 m!1248267))

(push 1)

