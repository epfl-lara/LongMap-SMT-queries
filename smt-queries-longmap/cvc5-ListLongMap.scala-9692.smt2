; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114492 () Bool)

(assert start!114492)

(declare-fun b!1358747 () Bool)

(declare-datatypes ((Unit!44559 0))(
  ( (Unit!44560) )
))
(declare-fun e!771089 () Unit!44559)

(declare-fun lt!599255 () Unit!44559)

(assert (=> b!1358747 (= e!771089 lt!599255)))

(declare-fun lt!599257 () Unit!44559)

(declare-datatypes ((List!31780 0))(
  ( (Nil!31777) (Cons!31776 (h!32985 (_ BitVec 64)) (t!46442 List!31780)) )
))
(declare-fun acc!759 () List!31780)

(declare-fun lemmaListSubSeqRefl!0 (List!31780) Unit!44559)

(assert (=> b!1358747 (= lt!599257 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!838 (List!31780 List!31780) Bool)

(assert (=> b!1358747 (subseq!838 acc!759 acc!759)))

(declare-datatypes ((array!92437 0))(
  ( (array!92438 (arr!44661 (Array (_ BitVec 32) (_ BitVec 64))) (size!45213 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92437)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92437 List!31780 List!31780 (_ BitVec 32)) Unit!44559)

(declare-fun $colon$colon!843 (List!31780 (_ BitVec 64)) List!31780)

(assert (=> b!1358747 (= lt!599255 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!843 acc!759 (select (arr!44661 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92437 (_ BitVec 32) List!31780) Bool)

(assert (=> b!1358747 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1358748 () Bool)

(declare-fun res!903374 () Bool)

(declare-fun e!771090 () Bool)

(assert (=> b!1358748 (=> (not res!903374) (not e!771090))))

(declare-fun contains!9400 (List!31780 (_ BitVec 64)) Bool)

(assert (=> b!1358748 (= res!903374 (not (contains!9400 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358749 () Bool)

(declare-fun res!903377 () Bool)

(assert (=> b!1358749 (=> (not res!903377) (not e!771090))))

(assert (=> b!1358749 (= res!903377 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45213 a!3742)))))

(declare-fun b!1358750 () Bool)

(declare-fun res!903379 () Bool)

(assert (=> b!1358750 (=> (not res!903379) (not e!771090))))

(assert (=> b!1358750 (= res!903379 (not (contains!9400 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358751 () Bool)

(assert (=> b!1358751 (= e!771090 false)))

(declare-fun lt!599256 () Unit!44559)

(assert (=> b!1358751 (= lt!599256 e!771089)))

(declare-fun c!127130 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358751 (= c!127130 (validKeyInArray!0 (select (arr!44661 a!3742) from!3120)))))

(declare-fun res!903376 () Bool)

(assert (=> start!114492 (=> (not res!903376) (not e!771090))))

(assert (=> start!114492 (= res!903376 (and (bvslt (size!45213 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45213 a!3742))))))

(assert (=> start!114492 e!771090))

(assert (=> start!114492 true))

(declare-fun array_inv!33894 (array!92437) Bool)

(assert (=> start!114492 (array_inv!33894 a!3742)))

(declare-fun b!1358752 () Bool)

(declare-fun res!903373 () Bool)

(assert (=> b!1358752 (=> (not res!903373) (not e!771090))))

(assert (=> b!1358752 (= res!903373 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31777))))

(declare-fun b!1358753 () Bool)

(declare-fun res!903378 () Bool)

(assert (=> b!1358753 (=> (not res!903378) (not e!771090))))

(assert (=> b!1358753 (= res!903378 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358754 () Bool)

(declare-fun res!903375 () Bool)

(assert (=> b!1358754 (=> (not res!903375) (not e!771090))))

(declare-fun noDuplicate!2315 (List!31780) Bool)

(assert (=> b!1358754 (= res!903375 (noDuplicate!2315 acc!759))))

(declare-fun b!1358755 () Bool)

(declare-fun res!903372 () Bool)

(assert (=> b!1358755 (=> (not res!903372) (not e!771090))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358755 (= res!903372 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45213 a!3742))))))

(declare-fun b!1358756 () Bool)

(declare-fun Unit!44561 () Unit!44559)

(assert (=> b!1358756 (= e!771089 Unit!44561)))

(declare-fun b!1358757 () Bool)

(declare-fun res!903380 () Bool)

(assert (=> b!1358757 (=> (not res!903380) (not e!771090))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1358757 (= res!903380 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!114492 res!903376) b!1358754))

(assert (= (and b!1358754 res!903375) b!1358750))

(assert (= (and b!1358750 res!903379) b!1358748))

(assert (= (and b!1358748 res!903374) b!1358752))

(assert (= (and b!1358752 res!903373) b!1358753))

(assert (= (and b!1358753 res!903378) b!1358755))

(assert (= (and b!1358755 res!903372) b!1358757))

(assert (= (and b!1358757 res!903380) b!1358749))

(assert (= (and b!1358749 res!903377) b!1358751))

(assert (= (and b!1358751 c!127130) b!1358747))

(assert (= (and b!1358751 (not c!127130)) b!1358756))

(declare-fun m!1243827 () Bool)

(assert (=> b!1358757 m!1243827))

(declare-fun m!1243829 () Bool)

(assert (=> b!1358751 m!1243829))

(assert (=> b!1358751 m!1243829))

(declare-fun m!1243831 () Bool)

(assert (=> b!1358751 m!1243831))

(declare-fun m!1243833 () Bool)

(assert (=> b!1358754 m!1243833))

(declare-fun m!1243835 () Bool)

(assert (=> b!1358747 m!1243835))

(assert (=> b!1358747 m!1243829))

(declare-fun m!1243837 () Bool)

(assert (=> b!1358747 m!1243837))

(declare-fun m!1243839 () Bool)

(assert (=> b!1358747 m!1243839))

(declare-fun m!1243841 () Bool)

(assert (=> b!1358747 m!1243841))

(assert (=> b!1358747 m!1243829))

(assert (=> b!1358747 m!1243837))

(declare-fun m!1243843 () Bool)

(assert (=> b!1358747 m!1243843))

(declare-fun m!1243845 () Bool)

(assert (=> b!1358753 m!1243845))

(declare-fun m!1243847 () Bool)

(assert (=> start!114492 m!1243847))

(declare-fun m!1243849 () Bool)

(assert (=> b!1358750 m!1243849))

(declare-fun m!1243851 () Bool)

(assert (=> b!1358748 m!1243851))

(declare-fun m!1243853 () Bool)

(assert (=> b!1358752 m!1243853))

(push 1)

(assert (not b!1358757))

(assert (not b!1358751))

(assert (not b!1358748))

(assert (not b!1358754))

(assert (not b!1358750))

(assert (not start!114492))

(assert (not b!1358747))

(assert (not b!1358753))

(assert (not b!1358752))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

