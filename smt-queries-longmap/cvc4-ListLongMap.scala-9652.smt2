; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114054 () Bool)

(assert start!114054)

(declare-fun b!1353850 () Bool)

(declare-fun e!769255 () Bool)

(declare-fun e!769251 () Bool)

(assert (=> b!1353850 (= e!769255 e!769251)))

(declare-fun res!898998 () Bool)

(assert (=> b!1353850 (=> (not res!898998) (not e!769251))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun lt!598034 () Bool)

(assert (=> b!1353850 (= res!898998 (and (not (= from!3120 i!1404)) lt!598034))))

(declare-datatypes ((Unit!44439 0))(
  ( (Unit!44440) )
))
(declare-fun lt!598033 () Unit!44439)

(declare-fun e!769252 () Unit!44439)

(assert (=> b!1353850 (= lt!598033 e!769252)))

(declare-fun c!126872 () Bool)

(assert (=> b!1353850 (= c!126872 lt!598034)))

(declare-datatypes ((array!92236 0))(
  ( (array!92237 (arr!44566 (Array (_ BitVec 32) (_ BitVec 64))) (size!45116 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92236)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353850 (= lt!598034 (validKeyInArray!0 (select (arr!44566 a!3742) from!3120)))))

(declare-fun b!1353851 () Bool)

(declare-fun res!898991 () Bool)

(declare-fun e!769254 () Bool)

(assert (=> b!1353851 (=> (not res!898991) (not e!769254))))

(declare-datatypes ((List!31607 0))(
  ( (Nil!31604) (Cons!31603 (h!32812 (_ BitVec 64)) (t!46265 List!31607)) )
))
(declare-fun lt!598032 () List!31607)

(declare-fun noDuplicate!2173 (List!31607) Bool)

(assert (=> b!1353851 (= res!898991 (noDuplicate!2173 lt!598032))))

(declare-fun b!1353852 () Bool)

(declare-fun res!898996 () Bool)

(assert (=> b!1353852 (=> (not res!898996) (not e!769254))))

(declare-fun contains!9316 (List!31607 (_ BitVec 64)) Bool)

(assert (=> b!1353852 (= res!898996 (not (contains!9316 lt!598032 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353853 () Bool)

(declare-fun lt!598035 () Unit!44439)

(assert (=> b!1353853 (= e!769252 lt!598035)))

(declare-fun lt!598031 () Unit!44439)

(declare-fun acc!759 () List!31607)

(declare-fun lemmaListSubSeqRefl!0 (List!31607) Unit!44439)

(assert (=> b!1353853 (= lt!598031 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!736 (List!31607 List!31607) Bool)

(assert (=> b!1353853 (subseq!736 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92236 List!31607 List!31607 (_ BitVec 32)) Unit!44439)

(declare-fun $colon$colon!751 (List!31607 (_ BitVec 64)) List!31607)

(assert (=> b!1353853 (= lt!598035 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!751 acc!759 (select (arr!44566 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92236 (_ BitVec 32) List!31607) Bool)

(assert (=> b!1353853 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353854 () Bool)

(declare-fun res!898992 () Bool)

(assert (=> b!1353854 (=> (not res!898992) (not e!769255))))

(assert (=> b!1353854 (= res!898992 (not (contains!9316 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353855 () Bool)

(declare-fun res!898989 () Bool)

(assert (=> b!1353855 (=> (not res!898989) (not e!769255))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1353855 (= res!898989 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!898987 () Bool)

(assert (=> start!114054 (=> (not res!898987) (not e!769255))))

(assert (=> start!114054 (= res!898987 (and (bvslt (size!45116 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45116 a!3742))))))

(assert (=> start!114054 e!769255))

(assert (=> start!114054 true))

(declare-fun array_inv!33594 (array!92236) Bool)

(assert (=> start!114054 (array_inv!33594 a!3742)))

(declare-fun b!1353856 () Bool)

(declare-fun res!898990 () Bool)

(assert (=> b!1353856 (=> (not res!898990) (not e!769254))))

(assert (=> b!1353856 (= res!898990 (not (contains!9316 lt!598032 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353857 () Bool)

(declare-fun res!898995 () Bool)

(assert (=> b!1353857 (=> (not res!898995) (not e!769255))))

(assert (=> b!1353857 (= res!898995 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353858 () Bool)

(declare-fun res!898986 () Bool)

(assert (=> b!1353858 (=> (not res!898986) (not e!769255))))

(assert (=> b!1353858 (= res!898986 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31604))))

(declare-fun b!1353859 () Bool)

(declare-fun res!898993 () Bool)

(assert (=> b!1353859 (=> (not res!898993) (not e!769255))))

(assert (=> b!1353859 (= res!898993 (not (contains!9316 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353860 () Bool)

(assert (=> b!1353860 (= e!769251 e!769254)))

(declare-fun res!898997 () Bool)

(assert (=> b!1353860 (=> (not res!898997) (not e!769254))))

(assert (=> b!1353860 (= res!898997 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1353860 (= lt!598032 ($colon$colon!751 acc!759 (select (arr!44566 a!3742) from!3120)))))

(declare-fun b!1353861 () Bool)

(declare-fun res!898994 () Bool)

(assert (=> b!1353861 (=> (not res!898994) (not e!769255))))

(assert (=> b!1353861 (= res!898994 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45116 a!3742)))))

(declare-fun b!1353862 () Bool)

(declare-fun Unit!44441 () Unit!44439)

(assert (=> b!1353862 (= e!769252 Unit!44441)))

(declare-fun b!1353863 () Bool)

(declare-fun res!898999 () Bool)

(assert (=> b!1353863 (=> (not res!898999) (not e!769255))))

(assert (=> b!1353863 (= res!898999 (noDuplicate!2173 acc!759))))

(declare-fun b!1353864 () Bool)

(assert (=> b!1353864 (= e!769254 false)))

(declare-fun lt!598036 () Bool)

(assert (=> b!1353864 (= lt!598036 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598032))))

(declare-fun b!1353865 () Bool)

(declare-fun res!898988 () Bool)

(assert (=> b!1353865 (=> (not res!898988) (not e!769255))))

(assert (=> b!1353865 (= res!898988 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45116 a!3742))))))

(assert (= (and start!114054 res!898987) b!1353863))

(assert (= (and b!1353863 res!898999) b!1353854))

(assert (= (and b!1353854 res!898992) b!1353859))

(assert (= (and b!1353859 res!898993) b!1353858))

(assert (= (and b!1353858 res!898986) b!1353857))

(assert (= (and b!1353857 res!898995) b!1353865))

(assert (= (and b!1353865 res!898988) b!1353855))

(assert (= (and b!1353855 res!898989) b!1353861))

(assert (= (and b!1353861 res!898994) b!1353850))

(assert (= (and b!1353850 c!126872) b!1353853))

(assert (= (and b!1353850 (not c!126872)) b!1353862))

(assert (= (and b!1353850 res!898998) b!1353860))

(assert (= (and b!1353860 res!898997) b!1353851))

(assert (= (and b!1353851 res!898991) b!1353856))

(assert (= (and b!1353856 res!898990) b!1353852))

(assert (= (and b!1353852 res!898996) b!1353864))

(declare-fun m!1240369 () Bool)

(assert (=> b!1353852 m!1240369))

(declare-fun m!1240371 () Bool)

(assert (=> b!1353855 m!1240371))

(declare-fun m!1240373 () Bool)

(assert (=> b!1353856 m!1240373))

(declare-fun m!1240375 () Bool)

(assert (=> b!1353859 m!1240375))

(declare-fun m!1240377 () Bool)

(assert (=> b!1353851 m!1240377))

(declare-fun m!1240379 () Bool)

(assert (=> b!1353864 m!1240379))

(declare-fun m!1240381 () Bool)

(assert (=> start!114054 m!1240381))

(declare-fun m!1240383 () Bool)

(assert (=> b!1353857 m!1240383))

(declare-fun m!1240385 () Bool)

(assert (=> b!1353853 m!1240385))

(declare-fun m!1240387 () Bool)

(assert (=> b!1353853 m!1240387))

(declare-fun m!1240389 () Bool)

(assert (=> b!1353853 m!1240389))

(declare-fun m!1240391 () Bool)

(assert (=> b!1353853 m!1240391))

(declare-fun m!1240393 () Bool)

(assert (=> b!1353853 m!1240393))

(assert (=> b!1353853 m!1240387))

(assert (=> b!1353853 m!1240389))

(declare-fun m!1240395 () Bool)

(assert (=> b!1353853 m!1240395))

(assert (=> b!1353860 m!1240387))

(assert (=> b!1353860 m!1240387))

(assert (=> b!1353860 m!1240389))

(declare-fun m!1240397 () Bool)

(assert (=> b!1353858 m!1240397))

(assert (=> b!1353850 m!1240387))

(assert (=> b!1353850 m!1240387))

(declare-fun m!1240399 () Bool)

(assert (=> b!1353850 m!1240399))

(declare-fun m!1240401 () Bool)

(assert (=> b!1353854 m!1240401))

(declare-fun m!1240403 () Bool)

(assert (=> b!1353863 m!1240403))

(push 1)

