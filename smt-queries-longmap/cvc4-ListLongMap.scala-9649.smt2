; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114036 () Bool)

(assert start!114036)

(declare-fun res!898610 () Bool)

(declare-fun e!769118 () Bool)

(assert (=> start!114036 (=> (not res!898610) (not e!769118))))

(declare-datatypes ((array!92218 0))(
  ( (array!92219 (arr!44557 (Array (_ BitVec 32) (_ BitVec 64))) (size!45107 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92218)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114036 (= res!898610 (and (bvslt (size!45107 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45107 a!3742))))))

(assert (=> start!114036 e!769118))

(assert (=> start!114036 true))

(declare-fun array_inv!33585 (array!92218) Bool)

(assert (=> start!114036 (array_inv!33585 a!3742)))

(declare-fun b!1353418 () Bool)

(declare-fun e!769120 () Bool)

(declare-fun e!769116 () Bool)

(assert (=> b!1353418 (= e!769120 e!769116)))

(declare-fun res!898618 () Bool)

(assert (=> b!1353418 (=> (not res!898618) (not e!769116))))

(assert (=> b!1353418 (= res!898618 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-datatypes ((List!31598 0))(
  ( (Nil!31595) (Cons!31594 (h!32803 (_ BitVec 64)) (t!46256 List!31598)) )
))
(declare-fun acc!759 () List!31598)

(declare-fun lt!597872 () List!31598)

(declare-fun $colon$colon!742 (List!31598 (_ BitVec 64)) List!31598)

(assert (=> b!1353418 (= lt!597872 ($colon$colon!742 acc!759 (select (arr!44557 a!3742) from!3120)))))

(declare-fun b!1353419 () Bool)

(declare-datatypes ((Unit!44412 0))(
  ( (Unit!44413) )
))
(declare-fun e!769117 () Unit!44412)

(declare-fun lt!597869 () Unit!44412)

(assert (=> b!1353419 (= e!769117 lt!597869)))

(declare-fun lt!597871 () Unit!44412)

(declare-fun lemmaListSubSeqRefl!0 (List!31598) Unit!44412)

(assert (=> b!1353419 (= lt!597871 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!727 (List!31598 List!31598) Bool)

(assert (=> b!1353419 (subseq!727 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92218 List!31598 List!31598 (_ BitVec 32)) Unit!44412)

(assert (=> b!1353419 (= lt!597869 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!742 acc!759 (select (arr!44557 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92218 (_ BitVec 32) List!31598) Bool)

(assert (=> b!1353419 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353420 () Bool)

(assert (=> b!1353420 (= e!769116 false)))

(declare-fun lt!597874 () Bool)

(assert (=> b!1353420 (= lt!597874 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597872))))

(declare-fun b!1353421 () Bool)

(declare-fun res!898615 () Bool)

(assert (=> b!1353421 (=> (not res!898615) (not e!769118))))

(assert (=> b!1353421 (= res!898615 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45107 a!3742)))))

(declare-fun b!1353422 () Bool)

(declare-fun res!898611 () Bool)

(assert (=> b!1353422 (=> (not res!898611) (not e!769116))))

(declare-fun contains!9307 (List!31598 (_ BitVec 64)) Bool)

(assert (=> b!1353422 (= res!898611 (not (contains!9307 lt!597872 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353423 () Bool)

(declare-fun res!898608 () Bool)

(assert (=> b!1353423 (=> (not res!898608) (not e!769118))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353423 (= res!898608 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353424 () Bool)

(declare-fun res!898613 () Bool)

(assert (=> b!1353424 (=> (not res!898613) (not e!769116))))

(declare-fun noDuplicate!2164 (List!31598) Bool)

(assert (=> b!1353424 (= res!898613 (noDuplicate!2164 lt!597872))))

(declare-fun b!1353425 () Bool)

(assert (=> b!1353425 (= e!769118 e!769120)))

(declare-fun res!898617 () Bool)

(assert (=> b!1353425 (=> (not res!898617) (not e!769120))))

(declare-fun lt!597873 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353425 (= res!898617 (and (not (= from!3120 i!1404)) lt!597873))))

(declare-fun lt!597870 () Unit!44412)

(assert (=> b!1353425 (= lt!597870 e!769117)))

(declare-fun c!126845 () Bool)

(assert (=> b!1353425 (= c!126845 lt!597873)))

(assert (=> b!1353425 (= lt!597873 (validKeyInArray!0 (select (arr!44557 a!3742) from!3120)))))

(declare-fun b!1353426 () Bool)

(declare-fun res!898614 () Bool)

(assert (=> b!1353426 (=> (not res!898614) (not e!769118))))

(assert (=> b!1353426 (= res!898614 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45107 a!3742))))))

(declare-fun b!1353427 () Bool)

(declare-fun Unit!44414 () Unit!44412)

(assert (=> b!1353427 (= e!769117 Unit!44414)))

(declare-fun b!1353428 () Bool)

(declare-fun res!898616 () Bool)

(assert (=> b!1353428 (=> (not res!898616) (not e!769118))))

(assert (=> b!1353428 (= res!898616 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353429 () Bool)

(declare-fun res!898619 () Bool)

(assert (=> b!1353429 (=> (not res!898619) (not e!769118))))

(assert (=> b!1353429 (= res!898619 (not (contains!9307 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353430 () Bool)

(declare-fun res!898609 () Bool)

(assert (=> b!1353430 (=> (not res!898609) (not e!769118))))

(assert (=> b!1353430 (= res!898609 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31595))))

(declare-fun b!1353431 () Bool)

(declare-fun res!898612 () Bool)

(assert (=> b!1353431 (=> (not res!898612) (not e!769118))))

(assert (=> b!1353431 (= res!898612 (not (contains!9307 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353432 () Bool)

(declare-fun res!898621 () Bool)

(assert (=> b!1353432 (=> (not res!898621) (not e!769116))))

(assert (=> b!1353432 (= res!898621 (not (contains!9307 lt!597872 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353433 () Bool)

(declare-fun res!898620 () Bool)

(assert (=> b!1353433 (=> (not res!898620) (not e!769118))))

(assert (=> b!1353433 (= res!898620 (noDuplicate!2164 acc!759))))

(assert (= (and start!114036 res!898610) b!1353433))

(assert (= (and b!1353433 res!898620) b!1353429))

(assert (= (and b!1353429 res!898619) b!1353431))

(assert (= (and b!1353431 res!898612) b!1353430))

(assert (= (and b!1353430 res!898609) b!1353428))

(assert (= (and b!1353428 res!898616) b!1353426))

(assert (= (and b!1353426 res!898614) b!1353423))

(assert (= (and b!1353423 res!898608) b!1353421))

(assert (= (and b!1353421 res!898615) b!1353425))

(assert (= (and b!1353425 c!126845) b!1353419))

(assert (= (and b!1353425 (not c!126845)) b!1353427))

(assert (= (and b!1353425 res!898617) b!1353418))

(assert (= (and b!1353418 res!898618) b!1353424))

(assert (= (and b!1353424 res!898613) b!1353432))

(assert (= (and b!1353432 res!898621) b!1353422))

(assert (= (and b!1353422 res!898611) b!1353420))

(declare-fun m!1240045 () Bool)

(assert (=> b!1353423 m!1240045))

(declare-fun m!1240047 () Bool)

(assert (=> b!1353422 m!1240047))

(declare-fun m!1240049 () Bool)

(assert (=> b!1353431 m!1240049))

(declare-fun m!1240051 () Bool)

(assert (=> b!1353424 m!1240051))

(declare-fun m!1240053 () Bool)

(assert (=> b!1353418 m!1240053))

(assert (=> b!1353418 m!1240053))

(declare-fun m!1240055 () Bool)

(assert (=> b!1353418 m!1240055))

(declare-fun m!1240057 () Bool)

(assert (=> start!114036 m!1240057))

(declare-fun m!1240059 () Bool)

(assert (=> b!1353433 m!1240059))

(declare-fun m!1240061 () Bool)

(assert (=> b!1353428 m!1240061))

(declare-fun m!1240063 () Bool)

(assert (=> b!1353430 m!1240063))

(declare-fun m!1240065 () Bool)

(assert (=> b!1353419 m!1240065))

(assert (=> b!1353419 m!1240053))

(assert (=> b!1353419 m!1240055))

(declare-fun m!1240067 () Bool)

(assert (=> b!1353419 m!1240067))

(declare-fun m!1240069 () Bool)

(assert (=> b!1353419 m!1240069))

(assert (=> b!1353419 m!1240053))

(assert (=> b!1353419 m!1240055))

(declare-fun m!1240071 () Bool)

(assert (=> b!1353419 m!1240071))

(declare-fun m!1240073 () Bool)

(assert (=> b!1353432 m!1240073))

(declare-fun m!1240075 () Bool)

(assert (=> b!1353420 m!1240075))

(declare-fun m!1240077 () Bool)

(assert (=> b!1353429 m!1240077))

(assert (=> b!1353425 m!1240053))

(assert (=> b!1353425 m!1240053))

(declare-fun m!1240079 () Bool)

(assert (=> b!1353425 m!1240079))

(push 1)

