; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113960 () Bool)

(assert start!113960)

(declare-fun b!1351946 () Bool)

(declare-fun e!768645 () Bool)

(declare-fun e!768643 () Bool)

(assert (=> b!1351946 (= e!768645 e!768643)))

(declare-fun res!897367 () Bool)

(assert (=> b!1351946 (=> (not res!897367) (not e!768643))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351946 (= res!897367 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44298 0))(
  ( (Unit!44299) )
))
(declare-fun lt!597382 () Unit!44298)

(declare-fun e!768646 () Unit!44298)

(assert (=> b!1351946 (= lt!597382 e!768646)))

(declare-fun c!126731 () Bool)

(declare-datatypes ((array!92142 0))(
  ( (array!92143 (arr!44519 (Array (_ BitVec 32) (_ BitVec 64))) (size!45069 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92142)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351946 (= c!126731 (validKeyInArray!0 (select (arr!44519 a!3742) from!3120)))))

(declare-fun b!1351947 () Bool)

(declare-fun res!897369 () Bool)

(assert (=> b!1351947 (=> (not res!897369) (not e!768645))))

(declare-datatypes ((List!31560 0))(
  ( (Nil!31557) (Cons!31556 (h!32765 (_ BitVec 64)) (t!46218 List!31560)) )
))
(declare-fun acc!759 () List!31560)

(declare-fun noDuplicate!2126 (List!31560) Bool)

(assert (=> b!1351947 (= res!897369 (noDuplicate!2126 acc!759))))

(declare-fun b!1351948 () Bool)

(declare-fun res!897372 () Bool)

(assert (=> b!1351948 (=> (not res!897372) (not e!768645))))

(declare-fun contains!9269 (List!31560 (_ BitVec 64)) Bool)

(assert (=> b!1351948 (= res!897372 (not (contains!9269 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351949 () Bool)

(declare-fun res!897366 () Bool)

(assert (=> b!1351949 (=> (not res!897366) (not e!768645))))

(declare-fun arrayNoDuplicates!0 (array!92142 (_ BitVec 32) List!31560) Bool)

(assert (=> b!1351949 (= res!897366 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351951 () Bool)

(declare-fun lt!597381 () Unit!44298)

(assert (=> b!1351951 (= e!768646 lt!597381)))

(declare-fun lt!597380 () Unit!44298)

(declare-fun lemmaListSubSeqRefl!0 (List!31560) Unit!44298)

(assert (=> b!1351951 (= lt!597380 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!689 (List!31560 List!31560) Bool)

(assert (=> b!1351951 (subseq!689 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92142 List!31560 List!31560 (_ BitVec 32)) Unit!44298)

(declare-fun $colon$colon!704 (List!31560 (_ BitVec 64)) List!31560)

(assert (=> b!1351951 (= lt!597381 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!704 acc!759 (select (arr!44519 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1351951 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1351952 () Bool)

(declare-fun res!897370 () Bool)

(assert (=> b!1351952 (=> (not res!897370) (not e!768645))))

(assert (=> b!1351952 (= res!897370 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45069 a!3742)))))

(declare-fun b!1351953 () Bool)

(assert (=> b!1351953 (= e!768643 false)))

(declare-fun lt!597379 () Bool)

(assert (=> b!1351953 (= lt!597379 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1351954 () Bool)

(declare-fun res!897364 () Bool)

(assert (=> b!1351954 (=> (not res!897364) (not e!768645))))

(assert (=> b!1351954 (= res!897364 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45069 a!3742))))))

(declare-fun b!1351955 () Bool)

(declare-fun res!897368 () Bool)

(assert (=> b!1351955 (=> (not res!897368) (not e!768645))))

(assert (=> b!1351955 (= res!897368 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31557))))

(declare-fun res!897371 () Bool)

(assert (=> start!113960 (=> (not res!897371) (not e!768645))))

(assert (=> start!113960 (= res!897371 (and (bvslt (size!45069 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45069 a!3742))))))

(assert (=> start!113960 e!768645))

(assert (=> start!113960 true))

(declare-fun array_inv!33547 (array!92142) Bool)

(assert (=> start!113960 (array_inv!33547 a!3742)))

(declare-fun b!1351950 () Bool)

(declare-fun res!897365 () Bool)

(assert (=> b!1351950 (=> (not res!897365) (not e!768645))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1351950 (= res!897365 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1351956 () Bool)

(declare-fun Unit!44300 () Unit!44298)

(assert (=> b!1351956 (= e!768646 Unit!44300)))

(declare-fun b!1351957 () Bool)

(declare-fun res!897373 () Bool)

(assert (=> b!1351957 (=> (not res!897373) (not e!768645))))

(assert (=> b!1351957 (= res!897373 (not (contains!9269 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!113960 res!897371) b!1351947))

(assert (= (and b!1351947 res!897369) b!1351957))

(assert (= (and b!1351957 res!897373) b!1351948))

(assert (= (and b!1351948 res!897372) b!1351955))

(assert (= (and b!1351955 res!897368) b!1351949))

(assert (= (and b!1351949 res!897366) b!1351954))

(assert (= (and b!1351954 res!897364) b!1351950))

(assert (= (and b!1351950 res!897365) b!1351952))

(assert (= (and b!1351952 res!897370) b!1351946))

(assert (= (and b!1351946 c!126731) b!1351951))

(assert (= (and b!1351946 (not c!126731)) b!1351956))

(assert (= (and b!1351946 res!897367) b!1351953))

(declare-fun m!1238869 () Bool)

(assert (=> b!1351955 m!1238869))

(declare-fun m!1238871 () Bool)

(assert (=> b!1351957 m!1238871))

(declare-fun m!1238873 () Bool)

(assert (=> b!1351953 m!1238873))

(declare-fun m!1238875 () Bool)

(assert (=> b!1351950 m!1238875))

(declare-fun m!1238877 () Bool)

(assert (=> b!1351951 m!1238877))

(declare-fun m!1238879 () Bool)

(assert (=> b!1351951 m!1238879))

(declare-fun m!1238881 () Bool)

(assert (=> b!1351951 m!1238881))

(declare-fun m!1238883 () Bool)

(assert (=> b!1351951 m!1238883))

(assert (=> b!1351951 m!1238873))

(assert (=> b!1351951 m!1238879))

(assert (=> b!1351951 m!1238881))

(declare-fun m!1238885 () Bool)

(assert (=> b!1351951 m!1238885))

(declare-fun m!1238887 () Bool)

(assert (=> b!1351949 m!1238887))

(declare-fun m!1238889 () Bool)

(assert (=> b!1351947 m!1238889))

(declare-fun m!1238891 () Bool)

(assert (=> start!113960 m!1238891))

(assert (=> b!1351946 m!1238879))

(assert (=> b!1351946 m!1238879))

(declare-fun m!1238893 () Bool)

(assert (=> b!1351946 m!1238893))

(declare-fun m!1238895 () Bool)

(assert (=> b!1351948 m!1238895))

(push 1)

