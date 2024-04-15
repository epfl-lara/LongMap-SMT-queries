; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114566 () Bool)

(assert start!114566)

(declare-fun b!1359241 () Bool)

(declare-fun res!903784 () Bool)

(declare-fun e!771331 () Bool)

(assert (=> b!1359241 (=> (not res!903784) (not e!771331))))

(declare-datatypes ((List!31790 0))(
  ( (Nil!31787) (Cons!31786 (h!32995 (_ BitVec 64)) (t!46455 List!31790)) )
))
(declare-fun acc!759 () List!31790)

(declare-fun noDuplicate!2325 (List!31790) Bool)

(assert (=> b!1359241 (= res!903784 (noDuplicate!2325 acc!759))))

(declare-fun b!1359242 () Bool)

(declare-fun res!903783 () Bool)

(assert (=> b!1359242 (=> (not res!903783) (not e!771331))))

(declare-fun contains!9410 (List!31790 (_ BitVec 64)) Bool)

(assert (=> b!1359242 (= res!903783 (not (contains!9410 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359243 () Bool)

(declare-fun res!903780 () Bool)

(assert (=> b!1359243 (=> (not res!903780) (not e!771331))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92460 0))(
  ( (array!92461 (arr!44671 (Array (_ BitVec 32) (_ BitVec 64))) (size!45223 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92460)

(assert (=> b!1359243 (= res!903780 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45223 a!3742)))))

(declare-fun b!1359244 () Bool)

(declare-fun res!903785 () Bool)

(assert (=> b!1359244 (=> (not res!903785) (not e!771331))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359244 (= res!903785 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1359245 () Bool)

(declare-datatypes ((Unit!44589 0))(
  ( (Unit!44590) )
))
(declare-fun e!771329 () Unit!44589)

(declare-fun lt!599377 () Unit!44589)

(assert (=> b!1359245 (= e!771329 lt!599377)))

(declare-fun lt!599380 () Unit!44589)

(declare-fun lemmaListSubSeqRefl!0 (List!31790) Unit!44589)

(assert (=> b!1359245 (= lt!599380 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!848 (List!31790 List!31790) Bool)

(assert (=> b!1359245 (subseq!848 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92460 List!31790 List!31790 (_ BitVec 32)) Unit!44589)

(declare-fun $colon$colon!853 (List!31790 (_ BitVec 64)) List!31790)

(assert (=> b!1359245 (= lt!599377 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!853 acc!759 (select (arr!44671 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92460 (_ BitVec 32) List!31790) Bool)

(assert (=> b!1359245 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1359246 () Bool)

(declare-fun Unit!44591 () Unit!44589)

(assert (=> b!1359246 (= e!771329 Unit!44591)))

(declare-fun b!1359247 () Bool)

(declare-fun e!771330 () Bool)

(assert (=> b!1359247 (= e!771330 false)))

(declare-fun lt!599378 () Bool)

(assert (=> b!1359247 (= lt!599378 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1359248 () Bool)

(declare-fun res!903781 () Bool)

(assert (=> b!1359248 (=> (not res!903781) (not e!771331))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1359248 (= res!903781 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45223 a!3742))))))

(declare-fun b!1359249 () Bool)

(declare-fun res!903777 () Bool)

(assert (=> b!1359249 (=> (not res!903777) (not e!771331))))

(assert (=> b!1359249 (= res!903777 (not (contains!9410 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359251 () Bool)

(declare-fun res!903779 () Bool)

(assert (=> b!1359251 (=> (not res!903779) (not e!771331))))

(assert (=> b!1359251 (= res!903779 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1359252 () Bool)

(declare-fun res!903782 () Bool)

(assert (=> b!1359252 (=> (not res!903782) (not e!771331))))

(assert (=> b!1359252 (= res!903782 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31787))))

(declare-fun b!1359250 () Bool)

(assert (=> b!1359250 (= e!771331 e!771330)))

(declare-fun res!903778 () Bool)

(assert (=> b!1359250 (=> (not res!903778) (not e!771330))))

(assert (=> b!1359250 (= res!903778 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599379 () Unit!44589)

(assert (=> b!1359250 (= lt!599379 e!771329)))

(declare-fun c!127175 () Bool)

(assert (=> b!1359250 (= c!127175 (validKeyInArray!0 (select (arr!44671 a!3742) from!3120)))))

(declare-fun res!903776 () Bool)

(assert (=> start!114566 (=> (not res!903776) (not e!771331))))

(assert (=> start!114566 (= res!903776 (and (bvslt (size!45223 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45223 a!3742))))))

(assert (=> start!114566 e!771331))

(assert (=> start!114566 true))

(declare-fun array_inv!33904 (array!92460) Bool)

(assert (=> start!114566 (array_inv!33904 a!3742)))

(assert (= (and start!114566 res!903776) b!1359241))

(assert (= (and b!1359241 res!903784) b!1359242))

(assert (= (and b!1359242 res!903783) b!1359249))

(assert (= (and b!1359249 res!903777) b!1359252))

(assert (= (and b!1359252 res!903782) b!1359251))

(assert (= (and b!1359251 res!903779) b!1359248))

(assert (= (and b!1359248 res!903781) b!1359244))

(assert (= (and b!1359244 res!903785) b!1359243))

(assert (= (and b!1359243 res!903780) b!1359250))

(assert (= (and b!1359250 c!127175) b!1359245))

(assert (= (and b!1359250 (not c!127175)) b!1359246))

(assert (= (and b!1359250 res!903778) b!1359247))

(declare-fun m!1244233 () Bool)

(assert (=> b!1359245 m!1244233))

(declare-fun m!1244235 () Bool)

(assert (=> b!1359245 m!1244235))

(declare-fun m!1244237 () Bool)

(assert (=> b!1359245 m!1244237))

(declare-fun m!1244239 () Bool)

(assert (=> b!1359245 m!1244239))

(declare-fun m!1244241 () Bool)

(assert (=> b!1359245 m!1244241))

(assert (=> b!1359245 m!1244235))

(assert (=> b!1359245 m!1244237))

(declare-fun m!1244243 () Bool)

(assert (=> b!1359245 m!1244243))

(assert (=> b!1359250 m!1244235))

(assert (=> b!1359250 m!1244235))

(declare-fun m!1244245 () Bool)

(assert (=> b!1359250 m!1244245))

(declare-fun m!1244247 () Bool)

(assert (=> b!1359249 m!1244247))

(declare-fun m!1244249 () Bool)

(assert (=> b!1359251 m!1244249))

(declare-fun m!1244251 () Bool)

(assert (=> start!114566 m!1244251))

(declare-fun m!1244253 () Bool)

(assert (=> b!1359252 m!1244253))

(assert (=> b!1359247 m!1244241))

(declare-fun m!1244255 () Bool)

(assert (=> b!1359244 m!1244255))

(declare-fun m!1244257 () Bool)

(assert (=> b!1359242 m!1244257))

(declare-fun m!1244259 () Bool)

(assert (=> b!1359241 m!1244259))

(check-sat (not b!1359242) (not b!1359250) (not b!1359247) (not b!1359245) (not start!114566) (not b!1359244) (not b!1359252) (not b!1359251) (not b!1359249) (not b!1359241))
(check-sat)
