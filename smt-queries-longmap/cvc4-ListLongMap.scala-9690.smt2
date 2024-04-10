; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114480 () Bool)

(assert start!114480)

(declare-fun b!1358619 () Bool)

(declare-fun e!771069 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358619 (= e!771069 (and (= from!3120 i!1404) (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44700 0))(
  ( (Unit!44701) )
))
(declare-fun lt!599388 () Unit!44700)

(declare-fun e!771070 () Unit!44700)

(assert (=> b!1358619 (= lt!599388 e!771070)))

(declare-fun c!127130 () Bool)

(declare-datatypes ((array!92476 0))(
  ( (array!92477 (arr!44680 (Array (_ BitVec 32) (_ BitVec 64))) (size!45230 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92476)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358619 (= c!127130 (validKeyInArray!0 (select (arr!44680 a!3742) from!3120)))))

(declare-fun b!1358620 () Bool)

(declare-fun res!903245 () Bool)

(assert (=> b!1358620 (=> (not res!903245) (not e!771069))))

(declare-datatypes ((List!31721 0))(
  ( (Nil!31718) (Cons!31717 (h!32926 (_ BitVec 64)) (t!46391 List!31721)) )
))
(declare-fun acc!759 () List!31721)

(declare-fun arrayNoDuplicates!0 (array!92476 (_ BitVec 32) List!31721) Bool)

(assert (=> b!1358620 (= res!903245 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358621 () Bool)

(declare-fun res!903246 () Bool)

(assert (=> b!1358621 (=> (not res!903246) (not e!771069))))

(declare-fun noDuplicate!2287 (List!31721) Bool)

(assert (=> b!1358621 (= res!903246 (noDuplicate!2287 acc!759))))

(declare-fun b!1358622 () Bool)

(declare-fun res!903240 () Bool)

(assert (=> b!1358622 (=> (not res!903240) (not e!771069))))

(declare-fun contains!9430 (List!31721 (_ BitVec 64)) Bool)

(assert (=> b!1358622 (= res!903240 (not (contains!9430 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358623 () Bool)

(declare-fun res!903242 () Bool)

(assert (=> b!1358623 (=> (not res!903242) (not e!771069))))

(assert (=> b!1358623 (= res!903242 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45230 a!3742))))))

(declare-fun b!1358624 () Bool)

(declare-fun res!903241 () Bool)

(assert (=> b!1358624 (=> (not res!903241) (not e!771069))))

(assert (=> b!1358624 (= res!903241 (not (contains!9430 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358625 () Bool)

(declare-fun res!903243 () Bool)

(assert (=> b!1358625 (=> (not res!903243) (not e!771069))))

(assert (=> b!1358625 (= res!903243 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45230 a!3742)))))

(declare-fun b!1358626 () Bool)

(declare-fun Unit!44702 () Unit!44700)

(assert (=> b!1358626 (= e!771070 Unit!44702)))

(declare-fun b!1358627 () Bool)

(declare-fun lt!599389 () Unit!44700)

(assert (=> b!1358627 (= e!771070 lt!599389)))

(declare-fun lt!599387 () Unit!44700)

(declare-fun lemmaListSubSeqRefl!0 (List!31721) Unit!44700)

(assert (=> b!1358627 (= lt!599387 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!832 (List!31721 List!31721) Bool)

(assert (=> b!1358627 (subseq!832 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92476 List!31721 List!31721 (_ BitVec 32)) Unit!44700)

(declare-fun $colon$colon!835 (List!31721 (_ BitVec 64)) List!31721)

(assert (=> b!1358627 (= lt!599389 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!835 acc!759 (select (arr!44680 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1358627 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun res!903239 () Bool)

(assert (=> start!114480 (=> (not res!903239) (not e!771069))))

(assert (=> start!114480 (= res!903239 (and (bvslt (size!45230 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45230 a!3742))))))

(assert (=> start!114480 e!771069))

(assert (=> start!114480 true))

(declare-fun array_inv!33708 (array!92476) Bool)

(assert (=> start!114480 (array_inv!33708 a!3742)))

(declare-fun b!1358628 () Bool)

(declare-fun res!903247 () Bool)

(assert (=> b!1358628 (=> (not res!903247) (not e!771069))))

(assert (=> b!1358628 (= res!903247 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31718))))

(declare-fun b!1358629 () Bool)

(declare-fun res!903244 () Bool)

(assert (=> b!1358629 (=> (not res!903244) (not e!771069))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1358629 (= res!903244 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!114480 res!903239) b!1358621))

(assert (= (and b!1358621 res!903246) b!1358624))

(assert (= (and b!1358624 res!903241) b!1358622))

(assert (= (and b!1358622 res!903240) b!1358628))

(assert (= (and b!1358628 res!903247) b!1358620))

(assert (= (and b!1358620 res!903245) b!1358623))

(assert (= (and b!1358623 res!903242) b!1358629))

(assert (= (and b!1358629 res!903244) b!1358625))

(assert (= (and b!1358625 res!903243) b!1358619))

(assert (= (and b!1358619 c!127130) b!1358627))

(assert (= (and b!1358619 (not c!127130)) b!1358626))

(declare-fun m!1244175 () Bool)

(assert (=> b!1358621 m!1244175))

(declare-fun m!1244177 () Bool)

(assert (=> start!114480 m!1244177))

(declare-fun m!1244179 () Bool)

(assert (=> b!1358628 m!1244179))

(declare-fun m!1244181 () Bool)

(assert (=> b!1358624 m!1244181))

(declare-fun m!1244183 () Bool)

(assert (=> b!1358627 m!1244183))

(declare-fun m!1244185 () Bool)

(assert (=> b!1358627 m!1244185))

(declare-fun m!1244187 () Bool)

(assert (=> b!1358627 m!1244187))

(declare-fun m!1244189 () Bool)

(assert (=> b!1358627 m!1244189))

(declare-fun m!1244191 () Bool)

(assert (=> b!1358627 m!1244191))

(assert (=> b!1358627 m!1244185))

(assert (=> b!1358627 m!1244187))

(declare-fun m!1244193 () Bool)

(assert (=> b!1358627 m!1244193))

(assert (=> b!1358619 m!1244185))

(assert (=> b!1358619 m!1244185))

(declare-fun m!1244195 () Bool)

(assert (=> b!1358619 m!1244195))

(declare-fun m!1244197 () Bool)

(assert (=> b!1358622 m!1244197))

(declare-fun m!1244199 () Bool)

(assert (=> b!1358620 m!1244199))

(declare-fun m!1244201 () Bool)

(assert (=> b!1358629 m!1244201))

(push 1)

(assert (not b!1358628))

(assert (not start!114480))

(assert (not b!1358619))

(assert (not b!1358624))

