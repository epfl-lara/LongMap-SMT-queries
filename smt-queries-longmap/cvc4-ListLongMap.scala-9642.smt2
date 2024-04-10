; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113994 () Bool)

(assert start!113994)

(declare-fun b!1352558 () Bool)

(declare-datatypes ((Unit!44349 0))(
  ( (Unit!44350) )
))
(declare-fun e!768850 () Unit!44349)

(declare-fun lt!597583 () Unit!44349)

(assert (=> b!1352558 (= e!768850 lt!597583)))

(declare-fun lt!597586 () Unit!44349)

(declare-datatypes ((List!31577 0))(
  ( (Nil!31574) (Cons!31573 (h!32782 (_ BitVec 64)) (t!46235 List!31577)) )
))
(declare-fun acc!759 () List!31577)

(declare-fun lemmaListSubSeqRefl!0 (List!31577) Unit!44349)

(assert (=> b!1352558 (= lt!597586 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!706 (List!31577 List!31577) Bool)

(assert (=> b!1352558 (subseq!706 acc!759 acc!759)))

(declare-datatypes ((array!92176 0))(
  ( (array!92177 (arr!44536 (Array (_ BitVec 32) (_ BitVec 64))) (size!45086 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92176)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92176 List!31577 List!31577 (_ BitVec 32)) Unit!44349)

(declare-fun $colon$colon!721 (List!31577 (_ BitVec 64)) List!31577)

(assert (=> b!1352558 (= lt!597583 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!721 acc!759 (select (arr!44536 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92176 (_ BitVec 32) List!31577) Bool)

(assert (=> b!1352558 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352559 () Bool)

(declare-fun res!897875 () Bool)

(declare-fun e!768848 () Bool)

(assert (=> b!1352559 (=> (not res!897875) (not e!768848))))

(assert (=> b!1352559 (= res!897875 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352560 () Bool)

(declare-fun e!768849 () Bool)

(assert (=> b!1352560 (= e!768848 e!768849)))

(declare-fun res!897874 () Bool)

(assert (=> b!1352560 (=> (not res!897874) (not e!768849))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352560 (= res!897874 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597585 () Unit!44349)

(assert (=> b!1352560 (= lt!597585 e!768850)))

(declare-fun c!126782 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352560 (= c!126782 (validKeyInArray!0 (select (arr!44536 a!3742) from!3120)))))

(declare-fun b!1352561 () Bool)

(declare-fun res!897881 () Bool)

(assert (=> b!1352561 (=> (not res!897881) (not e!768848))))

(declare-fun contains!9286 (List!31577 (_ BitVec 64)) Bool)

(assert (=> b!1352561 (= res!897881 (not (contains!9286 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352562 () Bool)

(assert (=> b!1352562 (= e!768849 false)))

(declare-fun lt!597584 () Bool)

(assert (=> b!1352562 (= lt!597584 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352563 () Bool)

(declare-fun res!897878 () Bool)

(assert (=> b!1352563 (=> (not res!897878) (not e!768848))))

(assert (=> b!1352563 (= res!897878 (not (contains!9286 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352564 () Bool)

(declare-fun res!897879 () Bool)

(assert (=> b!1352564 (=> (not res!897879) (not e!768848))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1352564 (= res!897879 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352565 () Bool)

(declare-fun res!897880 () Bool)

(assert (=> b!1352565 (=> (not res!897880) (not e!768848))))

(assert (=> b!1352565 (= res!897880 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45086 a!3742)))))

(declare-fun res!897882 () Bool)

(assert (=> start!113994 (=> (not res!897882) (not e!768848))))

(assert (=> start!113994 (= res!897882 (and (bvslt (size!45086 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45086 a!3742))))))

(assert (=> start!113994 e!768848))

(assert (=> start!113994 true))

(declare-fun array_inv!33564 (array!92176) Bool)

(assert (=> start!113994 (array_inv!33564 a!3742)))

(declare-fun b!1352566 () Bool)

(declare-fun Unit!44351 () Unit!44349)

(assert (=> b!1352566 (= e!768850 Unit!44351)))

(declare-fun b!1352567 () Bool)

(declare-fun res!897883 () Bool)

(assert (=> b!1352567 (=> (not res!897883) (not e!768848))))

(assert (=> b!1352567 (= res!897883 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45086 a!3742))))))

(declare-fun b!1352568 () Bool)

(declare-fun res!897876 () Bool)

(assert (=> b!1352568 (=> (not res!897876) (not e!768848))))

(assert (=> b!1352568 (= res!897876 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31574))))

(declare-fun b!1352569 () Bool)

(declare-fun res!897877 () Bool)

(assert (=> b!1352569 (=> (not res!897877) (not e!768848))))

(declare-fun noDuplicate!2143 (List!31577) Bool)

(assert (=> b!1352569 (= res!897877 (noDuplicate!2143 acc!759))))

(assert (= (and start!113994 res!897882) b!1352569))

(assert (= (and b!1352569 res!897877) b!1352561))

(assert (= (and b!1352561 res!897881) b!1352563))

(assert (= (and b!1352563 res!897878) b!1352568))

(assert (= (and b!1352568 res!897876) b!1352559))

(assert (= (and b!1352559 res!897875) b!1352567))

(assert (= (and b!1352567 res!897883) b!1352564))

(assert (= (and b!1352564 res!897879) b!1352565))

(assert (= (and b!1352565 res!897880) b!1352560))

(assert (= (and b!1352560 c!126782) b!1352558))

(assert (= (and b!1352560 (not c!126782)) b!1352566))

(assert (= (and b!1352560 res!897874) b!1352562))

(declare-fun m!1239345 () Bool)

(assert (=> b!1352562 m!1239345))

(declare-fun m!1239347 () Bool)

(assert (=> b!1352559 m!1239347))

(declare-fun m!1239349 () Bool)

(assert (=> b!1352568 m!1239349))

(declare-fun m!1239351 () Bool)

(assert (=> b!1352564 m!1239351))

(declare-fun m!1239353 () Bool)

(assert (=> b!1352563 m!1239353))

(declare-fun m!1239355 () Bool)

(assert (=> b!1352561 m!1239355))

(declare-fun m!1239357 () Bool)

(assert (=> b!1352569 m!1239357))

(declare-fun m!1239359 () Bool)

(assert (=> b!1352558 m!1239359))

(declare-fun m!1239361 () Bool)

(assert (=> b!1352558 m!1239361))

(declare-fun m!1239363 () Bool)

(assert (=> b!1352558 m!1239363))

(declare-fun m!1239365 () Bool)

(assert (=> b!1352558 m!1239365))

(assert (=> b!1352558 m!1239345))

(assert (=> b!1352558 m!1239361))

(assert (=> b!1352558 m!1239363))

(declare-fun m!1239367 () Bool)

(assert (=> b!1352558 m!1239367))

(assert (=> b!1352560 m!1239361))

(assert (=> b!1352560 m!1239361))

(declare-fun m!1239369 () Bool)

(assert (=> b!1352560 m!1239369))

(declare-fun m!1239371 () Bool)

(assert (=> start!113994 m!1239371))

(push 1)

(assert (not b!1352568))

(assert (not b!1352559))

