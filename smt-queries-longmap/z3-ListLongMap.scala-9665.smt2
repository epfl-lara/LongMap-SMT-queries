; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114352 () Bool)

(assert start!114352)

(declare-fun b!1356809 () Bool)

(declare-fun res!900942 () Bool)

(declare-fun e!770614 () Bool)

(assert (=> b!1356809 (=> (not res!900942) (not e!770614))))

(declare-datatypes ((List!31684 0))(
  ( (Nil!31681) (Cons!31680 (h!32898 (_ BitVec 64)) (t!46334 List!31684)) )
))
(declare-fun acc!759 () List!31684)

(declare-datatypes ((array!92425 0))(
  ( (array!92426 (arr!44656 (Array (_ BitVec 32) (_ BitVec 64))) (size!45207 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92425)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92425 (_ BitVec 32) List!31684) Bool)

(assert (=> b!1356809 (= res!900942 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356810 () Bool)

(declare-fun res!900943 () Bool)

(assert (=> b!1356810 (=> (not res!900943) (not e!770614))))

(assert (=> b!1356810 (= res!900943 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31681))))

(declare-fun b!1356811 () Bool)

(declare-fun res!900946 () Bool)

(assert (=> b!1356811 (=> (not res!900946) (not e!770614))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356811 (= res!900946 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356812 () Bool)

(declare-datatypes ((Unit!44489 0))(
  ( (Unit!44490) )
))
(declare-fun e!770613 () Unit!44489)

(declare-fun Unit!44491 () Unit!44489)

(assert (=> b!1356812 (= e!770613 Unit!44491)))

(declare-fun b!1356813 () Bool)

(declare-fun res!900944 () Bool)

(assert (=> b!1356813 (=> (not res!900944) (not e!770614))))

(declare-fun contains!9396 (List!31684 (_ BitVec 64)) Bool)

(assert (=> b!1356813 (= res!900944 (not (contains!9396 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356814 () Bool)

(declare-fun e!770611 () Bool)

(assert (=> b!1356814 (= e!770614 e!770611)))

(declare-fun res!900951 () Bool)

(assert (=> b!1356814 (=> (not res!900951) (not e!770611))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun lt!599136 () Bool)

(assert (=> b!1356814 (= res!900951 (and (not (= from!3120 i!1404)) (not lt!599136) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599135 () Unit!44489)

(assert (=> b!1356814 (= lt!599135 e!770613)))

(declare-fun c!127381 () Bool)

(assert (=> b!1356814 (= c!127381 lt!599136)))

(assert (=> b!1356814 (= lt!599136 (validKeyInArray!0 (select (arr!44656 a!3742) from!3120)))))

(declare-fun b!1356815 () Bool)

(declare-fun res!900950 () Bool)

(assert (=> b!1356815 (=> (not res!900950) (not e!770614))))

(assert (=> b!1356815 (= res!900950 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45207 a!3742)))))

(declare-fun b!1356816 () Bool)

(declare-fun res!900948 () Bool)

(assert (=> b!1356816 (=> (not res!900948) (not e!770614))))

(declare-fun noDuplicate!2227 (List!31684) Bool)

(assert (=> b!1356816 (= res!900948 (noDuplicate!2227 acc!759))))

(declare-fun b!1356817 () Bool)

(declare-fun res!900947 () Bool)

(assert (=> b!1356817 (=> (not res!900947) (not e!770614))))

(assert (=> b!1356817 (= res!900947 (not (contains!9396 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356818 () Bool)

(declare-fun lt!599139 () Unit!44489)

(assert (=> b!1356818 (= e!770613 lt!599139)))

(declare-fun lt!599138 () Unit!44489)

(declare-fun lemmaListSubSeqRefl!0 (List!31684) Unit!44489)

(assert (=> b!1356818 (= lt!599138 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!773 (List!31684 List!31684) Bool)

(assert (=> b!1356818 (subseq!773 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92425 List!31684 List!31684 (_ BitVec 32)) Unit!44489)

(declare-fun $colon$colon!787 (List!31684 (_ BitVec 64)) List!31684)

(assert (=> b!1356818 (= lt!599139 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!787 acc!759 (select (arr!44656 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1356818 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun res!900945 () Bool)

(assert (=> start!114352 (=> (not res!900945) (not e!770614))))

(assert (=> start!114352 (= res!900945 (and (bvslt (size!45207 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45207 a!3742))))))

(assert (=> start!114352 e!770614))

(assert (=> start!114352 true))

(declare-fun array_inv!33937 (array!92425) Bool)

(assert (=> start!114352 (array_inv!33937 a!3742)))

(declare-fun b!1356819 () Bool)

(assert (=> b!1356819 (= e!770611 false)))

(declare-fun lt!599137 () Bool)

(assert (=> b!1356819 (= lt!599137 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356820 () Bool)

(declare-fun res!900949 () Bool)

(assert (=> b!1356820 (=> (not res!900949) (not e!770614))))

(assert (=> b!1356820 (= res!900949 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45207 a!3742))))))

(assert (= (and start!114352 res!900945) b!1356816))

(assert (= (and b!1356816 res!900948) b!1356817))

(assert (= (and b!1356817 res!900947) b!1356813))

(assert (= (and b!1356813 res!900944) b!1356810))

(assert (= (and b!1356810 res!900943) b!1356809))

(assert (= (and b!1356809 res!900942) b!1356820))

(assert (= (and b!1356820 res!900949) b!1356811))

(assert (= (and b!1356811 res!900946) b!1356815))

(assert (= (and b!1356815 res!900950) b!1356814))

(assert (= (and b!1356814 c!127381) b!1356818))

(assert (= (and b!1356814 (not c!127381)) b!1356812))

(assert (= (and b!1356814 res!900951) b!1356819))

(declare-fun m!1243273 () Bool)

(assert (=> b!1356813 m!1243273))

(declare-fun m!1243275 () Bool)

(assert (=> start!114352 m!1243275))

(declare-fun m!1243277 () Bool)

(assert (=> b!1356809 m!1243277))

(declare-fun m!1243279 () Bool)

(assert (=> b!1356817 m!1243279))

(declare-fun m!1243281 () Bool)

(assert (=> b!1356816 m!1243281))

(declare-fun m!1243283 () Bool)

(assert (=> b!1356814 m!1243283))

(assert (=> b!1356814 m!1243283))

(declare-fun m!1243285 () Bool)

(assert (=> b!1356814 m!1243285))

(declare-fun m!1243287 () Bool)

(assert (=> b!1356819 m!1243287))

(declare-fun m!1243289 () Bool)

(assert (=> b!1356818 m!1243289))

(assert (=> b!1356818 m!1243283))

(declare-fun m!1243291 () Bool)

(assert (=> b!1356818 m!1243291))

(declare-fun m!1243293 () Bool)

(assert (=> b!1356818 m!1243293))

(assert (=> b!1356818 m!1243287))

(assert (=> b!1356818 m!1243283))

(assert (=> b!1356818 m!1243291))

(declare-fun m!1243295 () Bool)

(assert (=> b!1356818 m!1243295))

(declare-fun m!1243297 () Bool)

(assert (=> b!1356811 m!1243297))

(declare-fun m!1243299 () Bool)

(assert (=> b!1356810 m!1243299))

(check-sat (not b!1356818) (not b!1356817) (not b!1356814) (not b!1356811) (not b!1356813) (not b!1356819) (not start!114352) (not b!1356809) (not b!1356816) (not b!1356810))
(check-sat)
