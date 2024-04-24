; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114172 () Bool)

(assert start!114172)

(declare-fun b!1353029 () Bool)

(declare-fun res!897705 () Bool)

(declare-fun e!769416 () Bool)

(assert (=> b!1353029 (=> (not res!897705) (not e!769416))))

(declare-datatypes ((List!31594 0))(
  ( (Nil!31591) (Cons!31590 (h!32808 (_ BitVec 64)) (t!46244 List!31594)) )
))
(declare-fun acc!759 () List!31594)

(declare-fun noDuplicate!2137 (List!31594) Bool)

(assert (=> b!1353029 (= res!897705 (noDuplicate!2137 acc!759))))

(declare-fun b!1353030 () Bool)

(declare-fun res!897710 () Bool)

(assert (=> b!1353030 (=> (not res!897710) (not e!769416))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353030 (= res!897710 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353031 () Bool)

(declare-fun res!897711 () Bool)

(assert (=> b!1353031 (=> (not res!897711) (not e!769416))))

(declare-fun contains!9306 (List!31594 (_ BitVec 64)) Bool)

(assert (=> b!1353031 (= res!897711 (not (contains!9306 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353032 () Bool)

(declare-fun e!769417 () Bool)

(assert (=> b!1353032 (= e!769416 e!769417)))

(declare-fun res!897703 () Bool)

(assert (=> b!1353032 (=> (not res!897703) (not e!769417))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353032 (= res!897703 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44219 0))(
  ( (Unit!44220) )
))
(declare-fun lt!597786 () Unit!44219)

(declare-fun e!769414 () Unit!44219)

(assert (=> b!1353032 (= lt!597786 e!769414)))

(declare-fun c!127111 () Bool)

(declare-datatypes ((array!92245 0))(
  ( (array!92246 (arr!44566 (Array (_ BitVec 32) (_ BitVec 64))) (size!45117 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92245)

(assert (=> b!1353032 (= c!127111 (validKeyInArray!0 (select (arr!44566 a!3742) from!3120)))))

(declare-fun b!1353033 () Bool)

(declare-fun Unit!44221 () Unit!44219)

(assert (=> b!1353033 (= e!769414 Unit!44221)))

(declare-fun b!1353035 () Bool)

(declare-fun res!897702 () Bool)

(assert (=> b!1353035 (=> (not res!897702) (not e!769416))))

(declare-fun arrayNoDuplicates!0 (array!92245 (_ BitVec 32) List!31594) Bool)

(assert (=> b!1353035 (= res!897702 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353036 () Bool)

(declare-fun lt!597785 () Unit!44219)

(assert (=> b!1353036 (= e!769414 lt!597785)))

(declare-fun lt!597784 () Unit!44219)

(declare-fun lemmaListSubSeqRefl!0 (List!31594) Unit!44219)

(assert (=> b!1353036 (= lt!597784 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!683 (List!31594 List!31594) Bool)

(assert (=> b!1353036 (subseq!683 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92245 List!31594 List!31594 (_ BitVec 32)) Unit!44219)

(declare-fun $colon$colon!697 (List!31594 (_ BitVec 64)) List!31594)

(assert (=> b!1353036 (= lt!597785 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!697 acc!759 (select (arr!44566 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1353036 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353037 () Bool)

(declare-fun res!897706 () Bool)

(assert (=> b!1353037 (=> (not res!897706) (not e!769416))))

(assert (=> b!1353037 (= res!897706 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45117 a!3742))))))

(declare-fun b!1353038 () Bool)

(declare-fun res!897708 () Bool)

(assert (=> b!1353038 (=> (not res!897708) (not e!769416))))

(assert (=> b!1353038 (= res!897708 (not (contains!9306 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!897707 () Bool)

(assert (=> start!114172 (=> (not res!897707) (not e!769416))))

(assert (=> start!114172 (= res!897707 (and (bvslt (size!45117 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45117 a!3742))))))

(assert (=> start!114172 e!769416))

(assert (=> start!114172 true))

(declare-fun array_inv!33847 (array!92245) Bool)

(assert (=> start!114172 (array_inv!33847 a!3742)))

(declare-fun b!1353034 () Bool)

(declare-fun res!897709 () Bool)

(assert (=> b!1353034 (=> (not res!897709) (not e!769416))))

(assert (=> b!1353034 (= res!897709 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45117 a!3742)))))

(declare-fun b!1353039 () Bool)

(assert (=> b!1353039 (= e!769417 false)))

(declare-fun lt!597783 () Bool)

(assert (=> b!1353039 (= lt!597783 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1353040 () Bool)

(declare-fun res!897704 () Bool)

(assert (=> b!1353040 (=> (not res!897704) (not e!769416))))

(assert (=> b!1353040 (= res!897704 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31591))))

(assert (= (and start!114172 res!897707) b!1353029))

(assert (= (and b!1353029 res!897705) b!1353031))

(assert (= (and b!1353031 res!897711) b!1353038))

(assert (= (and b!1353038 res!897708) b!1353040))

(assert (= (and b!1353040 res!897704) b!1353035))

(assert (= (and b!1353035 res!897702) b!1353037))

(assert (= (and b!1353037 res!897706) b!1353030))

(assert (= (and b!1353030 res!897710) b!1353034))

(assert (= (and b!1353034 res!897709) b!1353032))

(assert (= (and b!1353032 c!127111) b!1353036))

(assert (= (and b!1353032 (not c!127111)) b!1353033))

(assert (= (and b!1353032 res!897703) b!1353039))

(declare-fun m!1240297 () Bool)

(assert (=> b!1353031 m!1240297))

(declare-fun m!1240299 () Bool)

(assert (=> start!114172 m!1240299))

(declare-fun m!1240301 () Bool)

(assert (=> b!1353029 m!1240301))

(declare-fun m!1240303 () Bool)

(assert (=> b!1353032 m!1240303))

(assert (=> b!1353032 m!1240303))

(declare-fun m!1240305 () Bool)

(assert (=> b!1353032 m!1240305))

(declare-fun m!1240307 () Bool)

(assert (=> b!1353038 m!1240307))

(declare-fun m!1240309 () Bool)

(assert (=> b!1353039 m!1240309))

(declare-fun m!1240311 () Bool)

(assert (=> b!1353040 m!1240311))

(declare-fun m!1240313 () Bool)

(assert (=> b!1353030 m!1240313))

(declare-fun m!1240315 () Bool)

(assert (=> b!1353035 m!1240315))

(declare-fun m!1240317 () Bool)

(assert (=> b!1353036 m!1240317))

(assert (=> b!1353036 m!1240303))

(declare-fun m!1240319 () Bool)

(assert (=> b!1353036 m!1240319))

(declare-fun m!1240321 () Bool)

(assert (=> b!1353036 m!1240321))

(assert (=> b!1353036 m!1240309))

(assert (=> b!1353036 m!1240303))

(assert (=> b!1353036 m!1240319))

(declare-fun m!1240323 () Bool)

(assert (=> b!1353036 m!1240323))

(check-sat (not start!114172) (not b!1353032) (not b!1353040) (not b!1353030) (not b!1353036) (not b!1353039) (not b!1353038) (not b!1353029) (not b!1353031) (not b!1353035))
(check-sat)
