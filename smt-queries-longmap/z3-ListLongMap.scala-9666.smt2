; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114134 () Bool)

(assert start!114134)

(declare-fun b!1355548 () Bool)

(declare-datatypes ((Unit!44400 0))(
  ( (Unit!44401) )
))
(declare-fun e!769771 () Unit!44400)

(declare-fun lt!598520 () Unit!44400)

(assert (=> b!1355548 (= e!769771 lt!598520)))

(declare-fun lt!598522 () Unit!44400)

(declare-datatypes ((List!31700 0))(
  ( (Nil!31697) (Cons!31696 (h!32905 (_ BitVec 64)) (t!46350 List!31700)) )
))
(declare-fun acc!759 () List!31700)

(declare-fun lemmaListSubSeqRefl!0 (List!31700) Unit!44400)

(assert (=> b!1355548 (= lt!598522 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!776 (List!31700 List!31700) Bool)

(assert (=> b!1355548 (subseq!776 acc!759 acc!759)))

(declare-datatypes ((array!92265 0))(
  ( (array!92266 (arr!44581 (Array (_ BitVec 32) (_ BitVec 64))) (size!45133 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92265)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92265 List!31700 List!31700 (_ BitVec 32)) Unit!44400)

(declare-fun $colon$colon!793 (List!31700 (_ BitVec 64)) List!31700)

(assert (=> b!1355548 (= lt!598520 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!793 acc!759 (select (arr!44581 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92265 (_ BitVec 32) List!31700) Bool)

(assert (=> b!1355548 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355549 () Bool)

(declare-fun res!900490 () Bool)

(declare-fun e!769773 () Bool)

(assert (=> b!1355549 (=> (not res!900490) (not e!769773))))

(declare-fun contains!9320 (List!31700 (_ BitVec 64)) Bool)

(assert (=> b!1355549 (= res!900490 (not (contains!9320 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355551 () Bool)

(declare-fun res!900494 () Bool)

(assert (=> b!1355551 (=> (not res!900494) (not e!769773))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355551 (= res!900494 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355552 () Bool)

(declare-fun Unit!44402 () Unit!44400)

(assert (=> b!1355552 (= e!769771 Unit!44402)))

(declare-fun b!1355553 () Bool)

(declare-fun res!900489 () Bool)

(assert (=> b!1355553 (=> (not res!900489) (not e!769773))))

(assert (=> b!1355553 (= res!900489 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355554 () Bool)

(declare-fun res!900486 () Bool)

(assert (=> b!1355554 (=> (not res!900486) (not e!769773))))

(assert (=> b!1355554 (= res!900486 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31697))))

(declare-fun b!1355555 () Bool)

(declare-fun res!900485 () Bool)

(assert (=> b!1355555 (=> (not res!900485) (not e!769773))))

(assert (=> b!1355555 (= res!900485 (not (contains!9320 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355556 () Bool)

(declare-fun res!900487 () Bool)

(assert (=> b!1355556 (=> (not res!900487) (not e!769773))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355556 (= res!900487 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45133 a!3742))))))

(declare-fun b!1355557 () Bool)

(declare-fun e!769774 () Bool)

(assert (=> b!1355557 (= e!769774 false)))

(declare-fun lt!598521 () Bool)

(assert (=> b!1355557 (= lt!598521 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355558 () Bool)

(declare-fun res!900492 () Bool)

(assert (=> b!1355558 (=> (not res!900492) (not e!769773))))

(assert (=> b!1355558 (= res!900492 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45133 a!3742)))))

(declare-fun b!1355559 () Bool)

(declare-fun res!900491 () Bool)

(assert (=> b!1355559 (=> (not res!900491) (not e!769773))))

(declare-fun noDuplicate!2235 (List!31700) Bool)

(assert (=> b!1355559 (= res!900491 (noDuplicate!2235 acc!759))))

(declare-fun b!1355550 () Bool)

(assert (=> b!1355550 (= e!769773 e!769774)))

(declare-fun res!900488 () Bool)

(assert (=> b!1355550 (=> (not res!900488) (not e!769774))))

(declare-fun lt!598519 () Bool)

(assert (=> b!1355550 (= res!900488 (and (not (= from!3120 i!1404)) (not lt!598519) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598518 () Unit!44400)

(assert (=> b!1355550 (= lt!598518 e!769771)))

(declare-fun c!126974 () Bool)

(assert (=> b!1355550 (= c!126974 lt!598519)))

(assert (=> b!1355550 (= lt!598519 (validKeyInArray!0 (select (arr!44581 a!3742) from!3120)))))

(declare-fun res!900493 () Bool)

(assert (=> start!114134 (=> (not res!900493) (not e!769773))))

(assert (=> start!114134 (= res!900493 (and (bvslt (size!45133 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45133 a!3742))))))

(assert (=> start!114134 e!769773))

(assert (=> start!114134 true))

(declare-fun array_inv!33814 (array!92265) Bool)

(assert (=> start!114134 (array_inv!33814 a!3742)))

(assert (= (and start!114134 res!900493) b!1355559))

(assert (= (and b!1355559 res!900491) b!1355549))

(assert (= (and b!1355549 res!900490) b!1355555))

(assert (= (and b!1355555 res!900485) b!1355554))

(assert (= (and b!1355554 res!900486) b!1355553))

(assert (= (and b!1355553 res!900489) b!1355556))

(assert (= (and b!1355556 res!900487) b!1355551))

(assert (= (and b!1355551 res!900494) b!1355558))

(assert (= (and b!1355558 res!900492) b!1355550))

(assert (= (and b!1355550 c!126974) b!1355548))

(assert (= (and b!1355550 (not c!126974)) b!1355552))

(assert (= (and b!1355550 res!900488) b!1355557))

(declare-fun m!1241245 () Bool)

(assert (=> b!1355557 m!1241245))

(declare-fun m!1241247 () Bool)

(assert (=> b!1355559 m!1241247))

(declare-fun m!1241249 () Bool)

(assert (=> b!1355550 m!1241249))

(assert (=> b!1355550 m!1241249))

(declare-fun m!1241251 () Bool)

(assert (=> b!1355550 m!1241251))

(declare-fun m!1241253 () Bool)

(assert (=> b!1355553 m!1241253))

(declare-fun m!1241255 () Bool)

(assert (=> b!1355551 m!1241255))

(declare-fun m!1241257 () Bool)

(assert (=> start!114134 m!1241257))

(declare-fun m!1241259 () Bool)

(assert (=> b!1355548 m!1241259))

(assert (=> b!1355548 m!1241249))

(declare-fun m!1241261 () Bool)

(assert (=> b!1355548 m!1241261))

(declare-fun m!1241263 () Bool)

(assert (=> b!1355548 m!1241263))

(assert (=> b!1355548 m!1241245))

(assert (=> b!1355548 m!1241249))

(assert (=> b!1355548 m!1241261))

(declare-fun m!1241265 () Bool)

(assert (=> b!1355548 m!1241265))

(declare-fun m!1241267 () Bool)

(assert (=> b!1355549 m!1241267))

(declare-fun m!1241269 () Bool)

(assert (=> b!1355554 m!1241269))

(declare-fun m!1241271 () Bool)

(assert (=> b!1355555 m!1241271))

(check-sat (not b!1355548) (not b!1355550) (not b!1355551) (not b!1355549) (not b!1355554) (not b!1355555) (not b!1355559) (not b!1355557) (not b!1355553) (not start!114134))
(check-sat)
