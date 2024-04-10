; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113970 () Bool)

(assert start!113970)

(declare-fun b!1352126 () Bool)

(declare-fun res!897521 () Bool)

(declare-fun e!768705 () Bool)

(assert (=> b!1352126 (=> (not res!897521) (not e!768705))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92152 0))(
  ( (array!92153 (arr!44524 (Array (_ BitVec 32) (_ BitVec 64))) (size!45074 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92152)

(assert (=> b!1352126 (= res!897521 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45074 a!3742))))))

(declare-fun b!1352127 () Bool)

(declare-fun res!897515 () Bool)

(assert (=> b!1352127 (=> (not res!897515) (not e!768705))))

(declare-datatypes ((List!31565 0))(
  ( (Nil!31562) (Cons!31561 (h!32770 (_ BitVec 64)) (t!46223 List!31565)) )
))
(declare-fun arrayNoDuplicates!0 (array!92152 (_ BitVec 32) List!31565) Bool)

(assert (=> b!1352127 (= res!897515 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31562))))

(declare-fun res!897520 () Bool)

(assert (=> start!113970 (=> (not res!897520) (not e!768705))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113970 (= res!897520 (and (bvslt (size!45074 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45074 a!3742))))))

(assert (=> start!113970 e!768705))

(assert (=> start!113970 true))

(declare-fun array_inv!33552 (array!92152) Bool)

(assert (=> start!113970 (array_inv!33552 a!3742)))

(declare-fun b!1352128 () Bool)

(declare-fun res!897522 () Bool)

(assert (=> b!1352128 (=> (not res!897522) (not e!768705))))

(declare-fun acc!759 () List!31565)

(assert (=> b!1352128 (= res!897522 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352129 () Bool)

(declare-fun res!897517 () Bool)

(assert (=> b!1352129 (=> (not res!897517) (not e!768705))))

(declare-fun contains!9274 (List!31565 (_ BitVec 64)) Bool)

(assert (=> b!1352129 (= res!897517 (not (contains!9274 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352130 () Bool)

(declare-fun res!897516 () Bool)

(assert (=> b!1352130 (=> (not res!897516) (not e!768705))))

(declare-fun noDuplicate!2131 (List!31565) Bool)

(assert (=> b!1352130 (= res!897516 (noDuplicate!2131 acc!759))))

(declare-fun b!1352131 () Bool)

(declare-fun e!768706 () Bool)

(assert (=> b!1352131 (= e!768705 e!768706)))

(declare-fun res!897523 () Bool)

(assert (=> b!1352131 (=> (not res!897523) (not e!768706))))

(assert (=> b!1352131 (= res!897523 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44313 0))(
  ( (Unit!44314) )
))
(declare-fun lt!597440 () Unit!44313)

(declare-fun e!768704 () Unit!44313)

(assert (=> b!1352131 (= lt!597440 e!768704)))

(declare-fun c!126746 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352131 (= c!126746 (validKeyInArray!0 (select (arr!44524 a!3742) from!3120)))))

(declare-fun b!1352132 () Bool)

(declare-fun res!897519 () Bool)

(assert (=> b!1352132 (=> (not res!897519) (not e!768705))))

(assert (=> b!1352132 (= res!897519 (not (contains!9274 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352133 () Bool)

(assert (=> b!1352133 (= e!768706 false)))

(declare-fun lt!597442 () Bool)

(assert (=> b!1352133 (= lt!597442 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352134 () Bool)

(declare-fun res!897514 () Bool)

(assert (=> b!1352134 (=> (not res!897514) (not e!768705))))

(assert (=> b!1352134 (= res!897514 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45074 a!3742)))))

(declare-fun b!1352135 () Bool)

(declare-fun lt!597441 () Unit!44313)

(assert (=> b!1352135 (= e!768704 lt!597441)))

(declare-fun lt!597439 () Unit!44313)

(declare-fun lemmaListSubSeqRefl!0 (List!31565) Unit!44313)

(assert (=> b!1352135 (= lt!597439 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!694 (List!31565 List!31565) Bool)

(assert (=> b!1352135 (subseq!694 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92152 List!31565 List!31565 (_ BitVec 32)) Unit!44313)

(declare-fun $colon$colon!709 (List!31565 (_ BitVec 64)) List!31565)

(assert (=> b!1352135 (= lt!597441 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!709 acc!759 (select (arr!44524 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352135 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352136 () Bool)

(declare-fun Unit!44315 () Unit!44313)

(assert (=> b!1352136 (= e!768704 Unit!44315)))

(declare-fun b!1352137 () Bool)

(declare-fun res!897518 () Bool)

(assert (=> b!1352137 (=> (not res!897518) (not e!768705))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1352137 (= res!897518 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!113970 res!897520) b!1352130))

(assert (= (and b!1352130 res!897516) b!1352129))

(assert (= (and b!1352129 res!897517) b!1352132))

(assert (= (and b!1352132 res!897519) b!1352127))

(assert (= (and b!1352127 res!897515) b!1352128))

(assert (= (and b!1352128 res!897522) b!1352126))

(assert (= (and b!1352126 res!897521) b!1352137))

(assert (= (and b!1352137 res!897518) b!1352134))

(assert (= (and b!1352134 res!897514) b!1352131))

(assert (= (and b!1352131 c!126746) b!1352135))

(assert (= (and b!1352131 (not c!126746)) b!1352136))

(assert (= (and b!1352131 res!897523) b!1352133))

(declare-fun m!1239009 () Bool)

(assert (=> b!1352135 m!1239009))

(declare-fun m!1239011 () Bool)

(assert (=> b!1352135 m!1239011))

(declare-fun m!1239013 () Bool)

(assert (=> b!1352135 m!1239013))

(declare-fun m!1239015 () Bool)

(assert (=> b!1352135 m!1239015))

(declare-fun m!1239017 () Bool)

(assert (=> b!1352135 m!1239017))

(assert (=> b!1352135 m!1239011))

(assert (=> b!1352135 m!1239013))

(declare-fun m!1239019 () Bool)

(assert (=> b!1352135 m!1239019))

(assert (=> b!1352133 m!1239017))

(declare-fun m!1239021 () Bool)

(assert (=> b!1352127 m!1239021))

(declare-fun m!1239023 () Bool)

(assert (=> b!1352130 m!1239023))

(declare-fun m!1239025 () Bool)

(assert (=> start!113970 m!1239025))

(assert (=> b!1352131 m!1239011))

(assert (=> b!1352131 m!1239011))

(declare-fun m!1239027 () Bool)

(assert (=> b!1352131 m!1239027))

(declare-fun m!1239029 () Bool)

(assert (=> b!1352128 m!1239029))

(declare-fun m!1239031 () Bool)

(assert (=> b!1352129 m!1239031))

(declare-fun m!1239033 () Bool)

(assert (=> b!1352132 m!1239033))

(declare-fun m!1239035 () Bool)

(assert (=> b!1352137 m!1239035))

(push 1)

(assert (not b!1352129))

(assert (not b!1352128))

