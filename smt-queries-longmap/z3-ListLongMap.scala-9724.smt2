; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115070 () Bool)

(assert start!115070)

(declare-fun b!1363578 () Bool)

(declare-fun res!907401 () Bool)

(declare-fun e!773296 () Bool)

(assert (=> b!1363578 (=> (not res!907401) (not e!773296))))

(declare-datatypes ((array!92646 0))(
  ( (array!92647 (arr!44755 (Array (_ BitVec 32) (_ BitVec 64))) (size!45307 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92646)

(declare-datatypes ((List!31874 0))(
  ( (Nil!31871) (Cons!31870 (h!33079 (_ BitVec 64)) (t!46557 List!31874)) )
))
(declare-fun arrayNoDuplicates!0 (array!92646 (_ BitVec 32) List!31874) Bool)

(assert (=> b!1363578 (= res!907401 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31871))))

(declare-fun b!1363579 () Bool)

(declare-datatypes ((Unit!44841 0))(
  ( (Unit!44842) )
))
(declare-fun e!773297 () Unit!44841)

(declare-fun Unit!44843 () Unit!44841)

(assert (=> b!1363579 (= e!773297 Unit!44843)))

(declare-fun b!1363580 () Bool)

(declare-fun lt!600665 () Unit!44841)

(assert (=> b!1363580 (= e!773297 lt!600665)))

(declare-fun lt!600664 () Unit!44841)

(declare-fun acc!759 () List!31874)

(declare-fun lemmaListSubSeqRefl!0 (List!31874) Unit!44841)

(assert (=> b!1363580 (= lt!600664 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!932 (List!31874 List!31874) Bool)

(assert (=> b!1363580 (subseq!932 acc!759 acc!759)))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92646 List!31874 List!31874 (_ BitVec 32)) Unit!44841)

(declare-fun $colon$colon!937 (List!31874 (_ BitVec 64)) List!31874)

(assert (=> b!1363580 (= lt!600665 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!937 acc!759 (select (arr!44755 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1363580 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363581 () Bool)

(declare-fun res!907399 () Bool)

(assert (=> b!1363581 (=> (not res!907399) (not e!773296))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363581 (= res!907399 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363582 () Bool)

(declare-fun res!907394 () Bool)

(assert (=> b!1363582 (=> (not res!907394) (not e!773296))))

(declare-fun noDuplicate!2409 (List!31874) Bool)

(assert (=> b!1363582 (= res!907394 (noDuplicate!2409 acc!759))))

(declare-fun b!1363584 () Bool)

(declare-fun res!907393 () Bool)

(assert (=> b!1363584 (=> (not res!907393) (not e!773296))))

(declare-fun contains!9494 (List!31874 (_ BitVec 64)) Bool)

(assert (=> b!1363584 (= res!907393 (not (contains!9494 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363585 () Bool)

(declare-fun e!773299 () Bool)

(assert (=> b!1363585 (= e!773296 e!773299)))

(declare-fun res!907403 () Bool)

(assert (=> b!1363585 (=> (not res!907403) (not e!773299))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun lt!600667 () Bool)

(assert (=> b!1363585 (= res!907403 (and (not (= from!3120 i!1404)) (not lt!600667) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!600666 () Unit!44841)

(assert (=> b!1363585 (= lt!600666 e!773297)))

(declare-fun c!127535 () Bool)

(assert (=> b!1363585 (= c!127535 lt!600667)))

(assert (=> b!1363585 (= lt!600667 (validKeyInArray!0 (select (arr!44755 a!3742) from!3120)))))

(declare-fun b!1363586 () Bool)

(declare-fun res!907398 () Bool)

(assert (=> b!1363586 (=> (not res!907398) (not e!773296))))

(assert (=> b!1363586 (= res!907398 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45307 a!3742)))))

(declare-fun b!1363587 () Bool)

(declare-fun res!907397 () Bool)

(assert (=> b!1363587 (=> (not res!907397) (not e!773296))))

(assert (=> b!1363587 (= res!907397 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363588 () Bool)

(declare-fun res!907396 () Bool)

(assert (=> b!1363588 (=> (not res!907396) (not e!773299))))

(assert (=> b!1363588 (= res!907396 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1363589 () Bool)

(declare-fun res!907400 () Bool)

(assert (=> b!1363589 (=> (not res!907400) (not e!773296))))

(assert (=> b!1363589 (= res!907400 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45307 a!3742))))))

(declare-fun b!1363590 () Bool)

(assert (=> b!1363590 (= e!773299 (bvsge (bvsub (size!45307 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) (bvsub (size!45307 a!3742) from!3120)))))

(declare-fun res!907402 () Bool)

(assert (=> start!115070 (=> (not res!907402) (not e!773296))))

(assert (=> start!115070 (= res!907402 (and (bvslt (size!45307 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45307 a!3742))))))

(assert (=> start!115070 e!773296))

(assert (=> start!115070 true))

(declare-fun array_inv!33988 (array!92646) Bool)

(assert (=> start!115070 (array_inv!33988 a!3742)))

(declare-fun b!1363583 () Bool)

(declare-fun res!907395 () Bool)

(assert (=> b!1363583 (=> (not res!907395) (not e!773296))))

(assert (=> b!1363583 (= res!907395 (not (contains!9494 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115070 res!907402) b!1363582))

(assert (= (and b!1363582 res!907394) b!1363583))

(assert (= (and b!1363583 res!907395) b!1363584))

(assert (= (and b!1363584 res!907393) b!1363578))

(assert (= (and b!1363578 res!907401) b!1363587))

(assert (= (and b!1363587 res!907397) b!1363589))

(assert (= (and b!1363589 res!907400) b!1363581))

(assert (= (and b!1363581 res!907399) b!1363586))

(assert (= (and b!1363586 res!907398) b!1363585))

(assert (= (and b!1363585 c!127535) b!1363580))

(assert (= (and b!1363585 (not c!127535)) b!1363579))

(assert (= (and b!1363585 res!907403) b!1363588))

(assert (= (and b!1363588 res!907396) b!1363590))

(declare-fun m!1247893 () Bool)

(assert (=> start!115070 m!1247893))

(declare-fun m!1247895 () Bool)

(assert (=> b!1363584 m!1247895))

(declare-fun m!1247897 () Bool)

(assert (=> b!1363578 m!1247897))

(declare-fun m!1247899 () Bool)

(assert (=> b!1363582 m!1247899))

(declare-fun m!1247901 () Bool)

(assert (=> b!1363583 m!1247901))

(declare-fun m!1247903 () Bool)

(assert (=> b!1363580 m!1247903))

(declare-fun m!1247905 () Bool)

(assert (=> b!1363580 m!1247905))

(declare-fun m!1247907 () Bool)

(assert (=> b!1363580 m!1247907))

(declare-fun m!1247909 () Bool)

(assert (=> b!1363580 m!1247909))

(declare-fun m!1247911 () Bool)

(assert (=> b!1363580 m!1247911))

(assert (=> b!1363580 m!1247905))

(assert (=> b!1363580 m!1247907))

(declare-fun m!1247913 () Bool)

(assert (=> b!1363580 m!1247913))

(assert (=> b!1363588 m!1247911))

(assert (=> b!1363585 m!1247905))

(assert (=> b!1363585 m!1247905))

(declare-fun m!1247915 () Bool)

(assert (=> b!1363585 m!1247915))

(declare-fun m!1247917 () Bool)

(assert (=> b!1363581 m!1247917))

(declare-fun m!1247919 () Bool)

(assert (=> b!1363587 m!1247919))

(check-sat (not b!1363588) (not b!1363580) (not b!1363578) (not b!1363585) (not start!115070) (not b!1363582) (not b!1363587) (not b!1363584) (not b!1363581) (not b!1363583))
(check-sat)
