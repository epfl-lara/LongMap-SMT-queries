; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114048 () Bool)

(assert start!114048)

(declare-fun b!1353706 () Bool)

(declare-fun e!769210 () Bool)

(declare-fun e!769209 () Bool)

(assert (=> b!1353706 (= e!769210 e!769209)))

(declare-fun res!898865 () Bool)

(assert (=> b!1353706 (=> (not res!898865) (not e!769209))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1353706 (= res!898865 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-datatypes ((List!31604 0))(
  ( (Nil!31601) (Cons!31600 (h!32809 (_ BitVec 64)) (t!46262 List!31604)) )
))
(declare-fun acc!759 () List!31604)

(declare-fun lt!597982 () List!31604)

(declare-datatypes ((array!92230 0))(
  ( (array!92231 (arr!44563 (Array (_ BitVec 32) (_ BitVec 64))) (size!45113 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92230)

(declare-fun $colon$colon!748 (List!31604 (_ BitVec 64)) List!31604)

(assert (=> b!1353706 (= lt!597982 ($colon$colon!748 acc!759 (select (arr!44563 a!3742) from!3120)))))

(declare-fun b!1353707 () Bool)

(declare-fun res!898871 () Bool)

(assert (=> b!1353707 (=> (not res!898871) (not e!769209))))

(declare-fun noDuplicate!2170 (List!31604) Bool)

(assert (=> b!1353707 (= res!898871 (noDuplicate!2170 lt!597982))))

(declare-fun b!1353708 () Bool)

(declare-datatypes ((Unit!44430 0))(
  ( (Unit!44431) )
))
(declare-fun e!769206 () Unit!44430)

(declare-fun lt!597979 () Unit!44430)

(assert (=> b!1353708 (= e!769206 lt!597979)))

(declare-fun lt!597981 () Unit!44430)

(declare-fun lemmaListSubSeqRefl!0 (List!31604) Unit!44430)

(assert (=> b!1353708 (= lt!597981 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!733 (List!31604 List!31604) Bool)

(assert (=> b!1353708 (subseq!733 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92230 List!31604 List!31604 (_ BitVec 32)) Unit!44430)

(assert (=> b!1353708 (= lt!597979 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!748 acc!759 (select (arr!44563 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92230 (_ BitVec 32) List!31604) Bool)

(assert (=> b!1353708 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353709 () Bool)

(declare-fun res!898860 () Bool)

(declare-fun e!769207 () Bool)

(assert (=> b!1353709 (=> (not res!898860) (not e!769207))))

(assert (=> b!1353709 (= res!898860 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31601))))

(declare-fun b!1353710 () Bool)

(assert (=> b!1353710 (= e!769207 e!769210)))

(declare-fun res!898868 () Bool)

(assert (=> b!1353710 (=> (not res!898868) (not e!769210))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun lt!597980 () Bool)

(assert (=> b!1353710 (= res!898868 (and (not (= from!3120 i!1404)) lt!597980))))

(declare-fun lt!597978 () Unit!44430)

(assert (=> b!1353710 (= lt!597978 e!769206)))

(declare-fun c!126863 () Bool)

(assert (=> b!1353710 (= c!126863 lt!597980)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353710 (= lt!597980 (validKeyInArray!0 (select (arr!44563 a!3742) from!3120)))))

(declare-fun b!1353711 () Bool)

(declare-fun res!898872 () Bool)

(assert (=> b!1353711 (=> (not res!898872) (not e!769207))))

(assert (=> b!1353711 (= res!898872 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45113 a!3742)))))

(declare-fun res!898867 () Bool)

(assert (=> start!114048 (=> (not res!898867) (not e!769207))))

(assert (=> start!114048 (= res!898867 (and (bvslt (size!45113 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45113 a!3742))))))

(assert (=> start!114048 e!769207))

(assert (=> start!114048 true))

(declare-fun array_inv!33591 (array!92230) Bool)

(assert (=> start!114048 (array_inv!33591 a!3742)))

(declare-fun b!1353712 () Bool)

(declare-fun res!898863 () Bool)

(assert (=> b!1353712 (=> (not res!898863) (not e!769209))))

(declare-fun contains!9313 (List!31604 (_ BitVec 64)) Bool)

(assert (=> b!1353712 (= res!898863 (not (contains!9313 lt!597982 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353713 () Bool)

(declare-fun res!898864 () Bool)

(assert (=> b!1353713 (=> (not res!898864) (not e!769207))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1353713 (= res!898864 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353714 () Bool)

(declare-fun Unit!44432 () Unit!44430)

(assert (=> b!1353714 (= e!769206 Unit!44432)))

(declare-fun b!1353715 () Bool)

(declare-fun res!898862 () Bool)

(assert (=> b!1353715 (=> (not res!898862) (not e!769207))))

(assert (=> b!1353715 (= res!898862 (not (contains!9313 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353716 () Bool)

(assert (=> b!1353716 (= e!769209 false)))

(declare-fun lt!597977 () Bool)

(assert (=> b!1353716 (= lt!597977 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597982))))

(declare-fun b!1353717 () Bool)

(declare-fun res!898869 () Bool)

(assert (=> b!1353717 (=> (not res!898869) (not e!769207))))

(assert (=> b!1353717 (= res!898869 (noDuplicate!2170 acc!759))))

(declare-fun b!1353718 () Bool)

(declare-fun res!898873 () Bool)

(assert (=> b!1353718 (=> (not res!898873) (not e!769207))))

(assert (=> b!1353718 (= res!898873 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353719 () Bool)

(declare-fun res!898870 () Bool)

(assert (=> b!1353719 (=> (not res!898870) (not e!769207))))

(assert (=> b!1353719 (= res!898870 (not (contains!9313 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353720 () Bool)

(declare-fun res!898866 () Bool)

(assert (=> b!1353720 (=> (not res!898866) (not e!769207))))

(assert (=> b!1353720 (= res!898866 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45113 a!3742))))))

(declare-fun b!1353721 () Bool)

(declare-fun res!898861 () Bool)

(assert (=> b!1353721 (=> (not res!898861) (not e!769209))))

(assert (=> b!1353721 (= res!898861 (not (contains!9313 lt!597982 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114048 res!898867) b!1353717))

(assert (= (and b!1353717 res!898869) b!1353715))

(assert (= (and b!1353715 res!898862) b!1353719))

(assert (= (and b!1353719 res!898870) b!1353709))

(assert (= (and b!1353709 res!898860) b!1353718))

(assert (= (and b!1353718 res!898873) b!1353720))

(assert (= (and b!1353720 res!898866) b!1353713))

(assert (= (and b!1353713 res!898864) b!1353711))

(assert (= (and b!1353711 res!898872) b!1353710))

(assert (= (and b!1353710 c!126863) b!1353708))

(assert (= (and b!1353710 (not c!126863)) b!1353714))

(assert (= (and b!1353710 res!898868) b!1353706))

(assert (= (and b!1353706 res!898865) b!1353707))

(assert (= (and b!1353707 res!898871) b!1353721))

(assert (= (and b!1353721 res!898861) b!1353712))

(assert (= (and b!1353712 res!898863) b!1353716))

(declare-fun m!1240261 () Bool)

(assert (=> b!1353715 m!1240261))

(declare-fun m!1240263 () Bool)

(assert (=> b!1353706 m!1240263))

(assert (=> b!1353706 m!1240263))

(declare-fun m!1240265 () Bool)

(assert (=> b!1353706 m!1240265))

(declare-fun m!1240267 () Bool)

(assert (=> b!1353721 m!1240267))

(declare-fun m!1240269 () Bool)

(assert (=> b!1353709 m!1240269))

(declare-fun m!1240271 () Bool)

(assert (=> b!1353719 m!1240271))

(declare-fun m!1240273 () Bool)

(assert (=> b!1353707 m!1240273))

(declare-fun m!1240275 () Bool)

(assert (=> b!1353712 m!1240275))

(declare-fun m!1240277 () Bool)

(assert (=> b!1353718 m!1240277))

(declare-fun m!1240279 () Bool)

(assert (=> b!1353708 m!1240279))

(assert (=> b!1353708 m!1240263))

(assert (=> b!1353708 m!1240265))

(declare-fun m!1240281 () Bool)

(assert (=> b!1353708 m!1240281))

(declare-fun m!1240283 () Bool)

(assert (=> b!1353708 m!1240283))

(assert (=> b!1353708 m!1240263))

(assert (=> b!1353708 m!1240265))

(declare-fun m!1240285 () Bool)

(assert (=> b!1353708 m!1240285))

(declare-fun m!1240287 () Bool)

(assert (=> b!1353716 m!1240287))

(declare-fun m!1240289 () Bool)

(assert (=> b!1353713 m!1240289))

(declare-fun m!1240291 () Bool)

(assert (=> start!114048 m!1240291))

(declare-fun m!1240293 () Bool)

(assert (=> b!1353717 m!1240293))

(assert (=> b!1353710 m!1240263))

(assert (=> b!1353710 m!1240263))

(declare-fun m!1240295 () Bool)

(assert (=> b!1353710 m!1240295))

(push 1)

