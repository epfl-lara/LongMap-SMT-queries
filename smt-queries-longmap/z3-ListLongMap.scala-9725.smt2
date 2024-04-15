; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115076 () Bool)

(assert start!115076)

(declare-fun b!1363695 () Bool)

(declare-datatypes ((Unit!44850 0))(
  ( (Unit!44851) )
))
(declare-fun e!773334 () Unit!44850)

(declare-fun lt!600702 () Unit!44850)

(assert (=> b!1363695 (= e!773334 lt!600702)))

(declare-fun lt!600706 () Unit!44850)

(declare-datatypes ((List!31877 0))(
  ( (Nil!31874) (Cons!31873 (h!33082 (_ BitVec 64)) (t!46560 List!31877)) )
))
(declare-fun acc!759 () List!31877)

(declare-fun lemmaListSubSeqRefl!0 (List!31877) Unit!44850)

(assert (=> b!1363695 (= lt!600706 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!935 (List!31877 List!31877) Bool)

(assert (=> b!1363695 (subseq!935 acc!759 acc!759)))

(declare-datatypes ((array!92652 0))(
  ( (array!92653 (arr!44758 (Array (_ BitVec 32) (_ BitVec 64))) (size!45310 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92652)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92652 List!31877 List!31877 (_ BitVec 32)) Unit!44850)

(declare-fun $colon$colon!940 (List!31877 (_ BitVec 64)) List!31877)

(assert (=> b!1363695 (= lt!600702 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!940 acc!759 (select (arr!44758 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92652 (_ BitVec 32) List!31877) Bool)

(assert (=> b!1363695 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363696 () Bool)

(declare-fun res!907498 () Bool)

(declare-fun e!773335 () Bool)

(assert (=> b!1363696 (=> (not res!907498) (not e!773335))))

(declare-fun contains!9497 (List!31877 (_ BitVec 64)) Bool)

(assert (=> b!1363696 (= res!907498 (not (contains!9497 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363697 () Bool)

(declare-fun e!773333 () Bool)

(assert (=> b!1363697 (= e!773335 e!773333)))

(declare-fun res!907495 () Bool)

(assert (=> b!1363697 (=> (not res!907495) (not e!773333))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun lt!600705 () Bool)

(assert (=> b!1363697 (= res!907495 (and (not (= from!3120 i!1404)) (not lt!600705) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!600704 () Unit!44850)

(assert (=> b!1363697 (= lt!600704 e!773334)))

(declare-fun c!127544 () Bool)

(assert (=> b!1363697 (= c!127544 lt!600705)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363697 (= lt!600705 (validKeyInArray!0 (select (arr!44758 a!3742) from!3120)))))

(declare-fun b!1363698 () Bool)

(declare-fun res!907493 () Bool)

(assert (=> b!1363698 (=> (not res!907493) (not e!773335))))

(assert (=> b!1363698 (= res!907493 (not (contains!9497 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363699 () Bool)

(assert (=> b!1363699 (= e!773333 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1363699 (arrayNoDuplicates!0 (array!92653 (store (arr!44758 a!3742) i!1404 l!3587) (size!45310 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!600703 () Unit!44850)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92652 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31877) Unit!44850)

(assert (=> b!1363699 (= lt!600703 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1363701 () Bool)

(declare-fun res!907496 () Bool)

(assert (=> b!1363701 (=> (not res!907496) (not e!773333))))

(assert (=> b!1363701 (= res!907496 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1363702 () Bool)

(declare-fun res!907500 () Bool)

(assert (=> b!1363702 (=> (not res!907500) (not e!773335))))

(assert (=> b!1363702 (= res!907500 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45310 a!3742))))))

(declare-fun b!1363703 () Bool)

(declare-fun res!907499 () Bool)

(assert (=> b!1363703 (=> (not res!907499) (not e!773335))))

(assert (=> b!1363703 (= res!907499 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45310 a!3742)))))

(declare-fun b!1363704 () Bool)

(declare-fun Unit!44852 () Unit!44850)

(assert (=> b!1363704 (= e!773334 Unit!44852)))

(declare-fun b!1363705 () Bool)

(declare-fun res!907497 () Bool)

(assert (=> b!1363705 (=> (not res!907497) (not e!773335))))

(assert (=> b!1363705 (= res!907497 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363706 () Bool)

(declare-fun res!907501 () Bool)

(assert (=> b!1363706 (=> (not res!907501) (not e!773335))))

(assert (=> b!1363706 (= res!907501 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363707 () Bool)

(declare-fun res!907502 () Bool)

(assert (=> b!1363707 (=> (not res!907502) (not e!773335))))

(declare-fun noDuplicate!2412 (List!31877) Bool)

(assert (=> b!1363707 (= res!907502 (noDuplicate!2412 acc!759))))

(declare-fun res!907492 () Bool)

(assert (=> start!115076 (=> (not res!907492) (not e!773335))))

(assert (=> start!115076 (= res!907492 (and (bvslt (size!45310 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45310 a!3742))))))

(assert (=> start!115076 e!773335))

(assert (=> start!115076 true))

(declare-fun array_inv!33991 (array!92652) Bool)

(assert (=> start!115076 (array_inv!33991 a!3742)))

(declare-fun b!1363700 () Bool)

(declare-fun res!907494 () Bool)

(assert (=> b!1363700 (=> (not res!907494) (not e!773335))))

(assert (=> b!1363700 (= res!907494 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31874))))

(assert (= (and start!115076 res!907492) b!1363707))

(assert (= (and b!1363707 res!907502) b!1363696))

(assert (= (and b!1363696 res!907498) b!1363698))

(assert (= (and b!1363698 res!907493) b!1363700))

(assert (= (and b!1363700 res!907494) b!1363706))

(assert (= (and b!1363706 res!907501) b!1363702))

(assert (= (and b!1363702 res!907500) b!1363705))

(assert (= (and b!1363705 res!907497) b!1363703))

(assert (= (and b!1363703 res!907499) b!1363697))

(assert (= (and b!1363697 c!127544) b!1363695))

(assert (= (and b!1363697 (not c!127544)) b!1363704))

(assert (= (and b!1363697 res!907495) b!1363701))

(assert (= (and b!1363701 res!907496) b!1363699))

(declare-fun m!1247977 () Bool)

(assert (=> b!1363701 m!1247977))

(declare-fun m!1247979 () Bool)

(assert (=> b!1363705 m!1247979))

(declare-fun m!1247981 () Bool)

(assert (=> b!1363699 m!1247981))

(declare-fun m!1247983 () Bool)

(assert (=> b!1363699 m!1247983))

(declare-fun m!1247985 () Bool)

(assert (=> b!1363699 m!1247985))

(declare-fun m!1247987 () Bool)

(assert (=> b!1363707 m!1247987))

(declare-fun m!1247989 () Bool)

(assert (=> b!1363698 m!1247989))

(declare-fun m!1247991 () Bool)

(assert (=> b!1363697 m!1247991))

(assert (=> b!1363697 m!1247991))

(declare-fun m!1247993 () Bool)

(assert (=> b!1363697 m!1247993))

(declare-fun m!1247995 () Bool)

(assert (=> start!115076 m!1247995))

(declare-fun m!1247997 () Bool)

(assert (=> b!1363696 m!1247997))

(declare-fun m!1247999 () Bool)

(assert (=> b!1363695 m!1247999))

(assert (=> b!1363695 m!1247991))

(declare-fun m!1248001 () Bool)

(assert (=> b!1363695 m!1248001))

(declare-fun m!1248003 () Bool)

(assert (=> b!1363695 m!1248003))

(assert (=> b!1363695 m!1247977))

(assert (=> b!1363695 m!1247991))

(assert (=> b!1363695 m!1248001))

(declare-fun m!1248005 () Bool)

(assert (=> b!1363695 m!1248005))

(declare-fun m!1248007 () Bool)

(assert (=> b!1363706 m!1248007))

(declare-fun m!1248009 () Bool)

(assert (=> b!1363700 m!1248009))

(check-sat (not b!1363706) (not b!1363697) (not b!1363698) (not b!1363707) (not start!115076) (not b!1363699) (not b!1363701) (not b!1363705) (not b!1363695) (not b!1363696) (not b!1363700))
(check-sat)
