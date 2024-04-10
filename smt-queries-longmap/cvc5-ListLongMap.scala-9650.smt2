; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114038 () Bool)

(assert start!114038)

(declare-fun b!1353466 () Bool)

(declare-fun res!898652 () Bool)

(declare-fun e!769133 () Bool)

(assert (=> b!1353466 (=> (not res!898652) (not e!769133))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92220 0))(
  ( (array!92221 (arr!44558 (Array (_ BitVec 32) (_ BitVec 64))) (size!45108 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92220)

(assert (=> b!1353466 (= res!898652 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45108 a!3742))))))

(declare-fun b!1353467 () Bool)

(declare-datatypes ((Unit!44415 0))(
  ( (Unit!44416) )
))
(declare-fun e!769134 () Unit!44415)

(declare-fun Unit!44417 () Unit!44415)

(assert (=> b!1353467 (= e!769134 Unit!44417)))

(declare-fun b!1353468 () Bool)

(declare-fun res!898661 () Bool)

(assert (=> b!1353468 (=> (not res!898661) (not e!769133))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1353468 (= res!898661 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45108 a!3742)))))

(declare-fun b!1353469 () Bool)

(declare-fun e!769132 () Bool)

(declare-fun e!769135 () Bool)

(assert (=> b!1353469 (= e!769132 e!769135)))

(declare-fun res!898651 () Bool)

(assert (=> b!1353469 (=> (not res!898651) (not e!769135))))

(assert (=> b!1353469 (= res!898651 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-datatypes ((List!31599 0))(
  ( (Nil!31596) (Cons!31595 (h!32804 (_ BitVec 64)) (t!46257 List!31599)) )
))
(declare-fun lt!597887 () List!31599)

(declare-fun acc!759 () List!31599)

(declare-fun $colon$colon!743 (List!31599 (_ BitVec 64)) List!31599)

(assert (=> b!1353469 (= lt!597887 ($colon$colon!743 acc!759 (select (arr!44558 a!3742) from!3120)))))

(declare-fun b!1353470 () Bool)

(declare-fun res!898657 () Bool)

(assert (=> b!1353470 (=> (not res!898657) (not e!769133))))

(declare-fun contains!9308 (List!31599 (_ BitVec 64)) Bool)

(assert (=> b!1353470 (= res!898657 (not (contains!9308 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353471 () Bool)

(declare-fun res!898660 () Bool)

(assert (=> b!1353471 (=> (not res!898660) (not e!769133))))

(declare-fun arrayNoDuplicates!0 (array!92220 (_ BitVec 32) List!31599) Bool)

(assert (=> b!1353471 (= res!898660 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353472 () Bool)

(declare-fun res!898659 () Bool)

(assert (=> b!1353472 (=> (not res!898659) (not e!769133))))

(declare-fun noDuplicate!2165 (List!31599) Bool)

(assert (=> b!1353472 (= res!898659 (noDuplicate!2165 acc!759))))

(declare-fun b!1353473 () Bool)

(declare-fun res!898658 () Bool)

(assert (=> b!1353473 (=> (not res!898658) (not e!769133))))

(assert (=> b!1353473 (= res!898658 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31596))))

(declare-fun b!1353474 () Bool)

(declare-fun res!898654 () Bool)

(assert (=> b!1353474 (=> (not res!898654) (not e!769133))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353474 (= res!898654 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353475 () Bool)

(declare-fun res!898656 () Bool)

(assert (=> b!1353475 (=> (not res!898656) (not e!769135))))

(assert (=> b!1353475 (= res!898656 (not (contains!9308 lt!597887 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353476 () Bool)

(assert (=> b!1353476 (= e!769133 e!769132)))

(declare-fun res!898662 () Bool)

(assert (=> b!1353476 (=> (not res!898662) (not e!769132))))

(declare-fun lt!597891 () Bool)

(assert (=> b!1353476 (= res!898662 (and (not (= from!3120 i!1404)) lt!597891))))

(declare-fun lt!597892 () Unit!44415)

(assert (=> b!1353476 (= lt!597892 e!769134)))

(declare-fun c!126848 () Bool)

(assert (=> b!1353476 (= c!126848 lt!597891)))

(assert (=> b!1353476 (= lt!597891 (validKeyInArray!0 (select (arr!44558 a!3742) from!3120)))))

(declare-fun b!1353477 () Bool)

(assert (=> b!1353477 (= e!769135 false)))

(declare-fun lt!597889 () Bool)

(assert (=> b!1353477 (= lt!597889 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597887))))

(declare-fun b!1353478 () Bool)

(declare-fun res!898650 () Bool)

(assert (=> b!1353478 (=> (not res!898650) (not e!769135))))

(assert (=> b!1353478 (= res!898650 (not (contains!9308 lt!597887 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353479 () Bool)

(declare-fun res!898653 () Bool)

(assert (=> b!1353479 (=> (not res!898653) (not e!769135))))

(assert (=> b!1353479 (= res!898653 (noDuplicate!2165 lt!597887))))

(declare-fun res!898663 () Bool)

(assert (=> start!114038 (=> (not res!898663) (not e!769133))))

(assert (=> start!114038 (= res!898663 (and (bvslt (size!45108 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45108 a!3742))))))

(assert (=> start!114038 e!769133))

(assert (=> start!114038 true))

(declare-fun array_inv!33586 (array!92220) Bool)

(assert (=> start!114038 (array_inv!33586 a!3742)))

(declare-fun b!1353480 () Bool)

(declare-fun res!898655 () Bool)

(assert (=> b!1353480 (=> (not res!898655) (not e!769133))))

(assert (=> b!1353480 (= res!898655 (not (contains!9308 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353481 () Bool)

(declare-fun lt!597888 () Unit!44415)

(assert (=> b!1353481 (= e!769134 lt!597888)))

(declare-fun lt!597890 () Unit!44415)

(declare-fun lemmaListSubSeqRefl!0 (List!31599) Unit!44415)

(assert (=> b!1353481 (= lt!597890 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!728 (List!31599 List!31599) Bool)

(assert (=> b!1353481 (subseq!728 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92220 List!31599 List!31599 (_ BitVec 32)) Unit!44415)

(assert (=> b!1353481 (= lt!597888 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!743 acc!759 (select (arr!44558 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1353481 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!114038 res!898663) b!1353472))

(assert (= (and b!1353472 res!898659) b!1353470))

(assert (= (and b!1353470 res!898657) b!1353480))

(assert (= (and b!1353480 res!898655) b!1353473))

(assert (= (and b!1353473 res!898658) b!1353471))

(assert (= (and b!1353471 res!898660) b!1353466))

(assert (= (and b!1353466 res!898652) b!1353474))

(assert (= (and b!1353474 res!898654) b!1353468))

(assert (= (and b!1353468 res!898661) b!1353476))

(assert (= (and b!1353476 c!126848) b!1353481))

(assert (= (and b!1353476 (not c!126848)) b!1353467))

(assert (= (and b!1353476 res!898662) b!1353469))

(assert (= (and b!1353469 res!898651) b!1353479))

(assert (= (and b!1353479 res!898653) b!1353478))

(assert (= (and b!1353478 res!898650) b!1353475))

(assert (= (and b!1353475 res!898656) b!1353477))

(declare-fun m!1240081 () Bool)

(assert (=> start!114038 m!1240081))

(declare-fun m!1240083 () Bool)

(assert (=> b!1353480 m!1240083))

(declare-fun m!1240085 () Bool)

(assert (=> b!1353469 m!1240085))

(assert (=> b!1353469 m!1240085))

(declare-fun m!1240087 () Bool)

(assert (=> b!1353469 m!1240087))

(declare-fun m!1240089 () Bool)

(assert (=> b!1353471 m!1240089))

(declare-fun m!1240091 () Bool)

(assert (=> b!1353478 m!1240091))

(declare-fun m!1240093 () Bool)

(assert (=> b!1353470 m!1240093))

(declare-fun m!1240095 () Bool)

(assert (=> b!1353473 m!1240095))

(declare-fun m!1240097 () Bool)

(assert (=> b!1353477 m!1240097))

(declare-fun m!1240099 () Bool)

(assert (=> b!1353481 m!1240099))

(assert (=> b!1353481 m!1240085))

(assert (=> b!1353481 m!1240087))

(declare-fun m!1240101 () Bool)

(assert (=> b!1353481 m!1240101))

(declare-fun m!1240103 () Bool)

(assert (=> b!1353481 m!1240103))

(assert (=> b!1353481 m!1240085))

(assert (=> b!1353481 m!1240087))

(declare-fun m!1240105 () Bool)

(assert (=> b!1353481 m!1240105))

(declare-fun m!1240107 () Bool)

(assert (=> b!1353475 m!1240107))

(declare-fun m!1240109 () Bool)

(assert (=> b!1353479 m!1240109))

(declare-fun m!1240111 () Bool)

(assert (=> b!1353474 m!1240111))

(assert (=> b!1353476 m!1240085))

(assert (=> b!1353476 m!1240085))

(declare-fun m!1240113 () Bool)

(assert (=> b!1353476 m!1240113))

(declare-fun m!1240115 () Bool)

(assert (=> b!1353472 m!1240115))

(push 1)

