; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113964 () Bool)

(assert start!113964)

(declare-fun b!1352018 () Bool)

(declare-fun res!897433 () Bool)

(declare-fun e!768670 () Bool)

(assert (=> b!1352018 (=> (not res!897433) (not e!768670))))

(declare-datatypes ((List!31562 0))(
  ( (Nil!31559) (Cons!31558 (h!32767 (_ BitVec 64)) (t!46220 List!31562)) )
))
(declare-fun acc!759 () List!31562)

(declare-fun contains!9271 (List!31562 (_ BitVec 64)) Bool)

(assert (=> b!1352018 (= res!897433 (not (contains!9271 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352019 () Bool)

(declare-fun res!897432 () Bool)

(assert (=> b!1352019 (=> (not res!897432) (not e!768670))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352019 (= res!897432 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352021 () Bool)

(declare-fun res!897427 () Bool)

(assert (=> b!1352021 (=> (not res!897427) (not e!768670))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92146 0))(
  ( (array!92147 (arr!44521 (Array (_ BitVec 32) (_ BitVec 64))) (size!45071 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92146)

(assert (=> b!1352021 (= res!897427 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45071 a!3742))))))

(declare-fun b!1352022 () Bool)

(declare-fun res!897431 () Bool)

(assert (=> b!1352022 (=> (not res!897431) (not e!768670))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1352022 (= res!897431 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45071 a!3742)))))

(declare-fun b!1352023 () Bool)

(declare-fun e!768667 () Bool)

(assert (=> b!1352023 (= e!768667 false)))

(declare-fun lt!597403 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92146 (_ BitVec 32) List!31562) Bool)

(assert (=> b!1352023 (= lt!597403 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352024 () Bool)

(declare-fun res!897428 () Bool)

(assert (=> b!1352024 (=> (not res!897428) (not e!768670))))

(assert (=> b!1352024 (= res!897428 (not (contains!9271 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352025 () Bool)

(declare-datatypes ((Unit!44304 0))(
  ( (Unit!44305) )
))
(declare-fun e!768669 () Unit!44304)

(declare-fun Unit!44306 () Unit!44304)

(assert (=> b!1352025 (= e!768669 Unit!44306)))

(declare-fun b!1352026 () Bool)

(declare-fun res!897426 () Bool)

(assert (=> b!1352026 (=> (not res!897426) (not e!768670))))

(assert (=> b!1352026 (= res!897426 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31559))))

(declare-fun b!1352020 () Bool)

(declare-fun res!897425 () Bool)

(assert (=> b!1352020 (=> (not res!897425) (not e!768670))))

(assert (=> b!1352020 (= res!897425 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!897424 () Bool)

(assert (=> start!113964 (=> (not res!897424) (not e!768670))))

(assert (=> start!113964 (= res!897424 (and (bvslt (size!45071 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45071 a!3742))))))

(assert (=> start!113964 e!768670))

(assert (=> start!113964 true))

(declare-fun array_inv!33549 (array!92146) Bool)

(assert (=> start!113964 (array_inv!33549 a!3742)))

(declare-fun b!1352027 () Bool)

(assert (=> b!1352027 (= e!768670 e!768667)))

(declare-fun res!897429 () Bool)

(assert (=> b!1352027 (=> (not res!897429) (not e!768667))))

(assert (=> b!1352027 (= res!897429 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597406 () Unit!44304)

(assert (=> b!1352027 (= lt!597406 e!768669)))

(declare-fun c!126737 () Bool)

(assert (=> b!1352027 (= c!126737 (validKeyInArray!0 (select (arr!44521 a!3742) from!3120)))))

(declare-fun b!1352028 () Bool)

(declare-fun res!897430 () Bool)

(assert (=> b!1352028 (=> (not res!897430) (not e!768670))))

(declare-fun noDuplicate!2128 (List!31562) Bool)

(assert (=> b!1352028 (= res!897430 (noDuplicate!2128 acc!759))))

(declare-fun b!1352029 () Bool)

(declare-fun lt!597404 () Unit!44304)

(assert (=> b!1352029 (= e!768669 lt!597404)))

(declare-fun lt!597405 () Unit!44304)

(declare-fun lemmaListSubSeqRefl!0 (List!31562) Unit!44304)

(assert (=> b!1352029 (= lt!597405 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!691 (List!31562 List!31562) Bool)

(assert (=> b!1352029 (subseq!691 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92146 List!31562 List!31562 (_ BitVec 32)) Unit!44304)

(declare-fun $colon$colon!706 (List!31562 (_ BitVec 64)) List!31562)

(assert (=> b!1352029 (= lt!597404 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!706 acc!759 (select (arr!44521 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352029 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!113964 res!897424) b!1352028))

(assert (= (and b!1352028 res!897430) b!1352024))

(assert (= (and b!1352024 res!897428) b!1352018))

(assert (= (and b!1352018 res!897433) b!1352026))

(assert (= (and b!1352026 res!897426) b!1352020))

(assert (= (and b!1352020 res!897425) b!1352021))

(assert (= (and b!1352021 res!897427) b!1352019))

(assert (= (and b!1352019 res!897432) b!1352022))

(assert (= (and b!1352022 res!897431) b!1352027))

(assert (= (and b!1352027 c!126737) b!1352029))

(assert (= (and b!1352027 (not c!126737)) b!1352025))

(assert (= (and b!1352027 res!897429) b!1352023))

(declare-fun m!1238925 () Bool)

(assert (=> b!1352024 m!1238925))

(declare-fun m!1238927 () Bool)

(assert (=> b!1352018 m!1238927))

(declare-fun m!1238929 () Bool)

(assert (=> b!1352027 m!1238929))

(assert (=> b!1352027 m!1238929))

(declare-fun m!1238931 () Bool)

(assert (=> b!1352027 m!1238931))

(declare-fun m!1238933 () Bool)

(assert (=> b!1352020 m!1238933))

(declare-fun m!1238935 () Bool)

(assert (=> b!1352023 m!1238935))

(declare-fun m!1238937 () Bool)

(assert (=> b!1352028 m!1238937))

(declare-fun m!1238939 () Bool)

(assert (=> start!113964 m!1238939))

(declare-fun m!1238941 () Bool)

(assert (=> b!1352026 m!1238941))

(declare-fun m!1238943 () Bool)

(assert (=> b!1352019 m!1238943))

(declare-fun m!1238945 () Bool)

(assert (=> b!1352029 m!1238945))

(assert (=> b!1352029 m!1238929))

(declare-fun m!1238947 () Bool)

(assert (=> b!1352029 m!1238947))

(declare-fun m!1238949 () Bool)

(assert (=> b!1352029 m!1238949))

(assert (=> b!1352029 m!1238935))

(assert (=> b!1352029 m!1238929))

(assert (=> b!1352029 m!1238947))

(declare-fun m!1238951 () Bool)

(assert (=> b!1352029 m!1238951))

(push 1)

(assert (not b!1352028))

(assert (not b!1352019))

(assert (not b!1352027))

