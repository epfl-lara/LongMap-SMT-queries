; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114138 () Bool)

(assert start!114138)

(declare-fun b!1355690 () Bool)

(declare-fun e!769829 () Bool)

(assert (=> b!1355690 (= e!769829 false)))

(declare-datatypes ((List!31649 0))(
  ( (Nil!31646) (Cons!31645 (h!32854 (_ BitVec 64)) (t!46307 List!31649)) )
))
(declare-fun acc!759 () List!31649)

(declare-fun lt!598738 () Bool)

(declare-datatypes ((array!92320 0))(
  ( (array!92321 (arr!44608 (Array (_ BitVec 32) (_ BitVec 64))) (size!45158 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92320)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92320 (_ BitVec 32) List!31649) Bool)

(assert (=> b!1355690 (= lt!598738 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355692 () Bool)

(declare-fun e!769831 () Bool)

(assert (=> b!1355692 (= e!769831 e!769829)))

(declare-fun res!900579 () Bool)

(assert (=> b!1355692 (=> (not res!900579) (not e!769829))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun lt!598736 () Bool)

(assert (=> b!1355692 (= res!900579 (and (not (= from!3120 i!1404)) (not lt!598736) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44565 0))(
  ( (Unit!44566) )
))
(declare-fun lt!598734 () Unit!44565)

(declare-fun e!769828 () Unit!44565)

(assert (=> b!1355692 (= lt!598734 e!769828)))

(declare-fun c!126998 () Bool)

(assert (=> b!1355692 (= c!126998 lt!598736)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355692 (= lt!598736 (validKeyInArray!0 (select (arr!44608 a!3742) from!3120)))))

(declare-fun b!1355693 () Bool)

(declare-fun res!900582 () Bool)

(assert (=> b!1355693 (=> (not res!900582) (not e!769831))))

(assert (=> b!1355693 (= res!900582 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45158 a!3742)))))

(declare-fun b!1355694 () Bool)

(declare-fun res!900576 () Bool)

(assert (=> b!1355694 (=> (not res!900576) (not e!769831))))

(declare-fun noDuplicate!2215 (List!31649) Bool)

(assert (=> b!1355694 (= res!900576 (noDuplicate!2215 acc!759))))

(declare-fun b!1355695 () Bool)

(declare-fun res!900575 () Bool)

(assert (=> b!1355695 (=> (not res!900575) (not e!769831))))

(assert (=> b!1355695 (= res!900575 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45158 a!3742))))))

(declare-fun b!1355696 () Bool)

(declare-fun res!900580 () Bool)

(assert (=> b!1355696 (=> (not res!900580) (not e!769831))))

(assert (=> b!1355696 (= res!900580 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355697 () Bool)

(declare-fun lt!598737 () Unit!44565)

(assert (=> b!1355697 (= e!769828 lt!598737)))

(declare-fun lt!598735 () Unit!44565)

(declare-fun lemmaListSubSeqRefl!0 (List!31649) Unit!44565)

(assert (=> b!1355697 (= lt!598735 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!778 (List!31649 List!31649) Bool)

(assert (=> b!1355697 (subseq!778 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92320 List!31649 List!31649 (_ BitVec 32)) Unit!44565)

(declare-fun $colon$colon!793 (List!31649 (_ BitVec 64)) List!31649)

(assert (=> b!1355697 (= lt!598737 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!793 acc!759 (select (arr!44608 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355697 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355698 () Bool)

(declare-fun res!900581 () Bool)

(assert (=> b!1355698 (=> (not res!900581) (not e!769831))))

(declare-fun contains!9358 (List!31649 (_ BitVec 64)) Bool)

(assert (=> b!1355698 (= res!900581 (not (contains!9358 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355699 () Bool)

(declare-fun res!900578 () Bool)

(assert (=> b!1355699 (=> (not res!900578) (not e!769831))))

(assert (=> b!1355699 (= res!900578 (not (contains!9358 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!900583 () Bool)

(assert (=> start!114138 (=> (not res!900583) (not e!769831))))

(assert (=> start!114138 (= res!900583 (and (bvslt (size!45158 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45158 a!3742))))))

(assert (=> start!114138 e!769831))

(assert (=> start!114138 true))

(declare-fun array_inv!33636 (array!92320) Bool)

(assert (=> start!114138 (array_inv!33636 a!3742)))

(declare-fun b!1355691 () Bool)

(declare-fun res!900574 () Bool)

(assert (=> b!1355691 (=> (not res!900574) (not e!769831))))

(assert (=> b!1355691 (= res!900574 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31646))))

(declare-fun b!1355700 () Bool)

(declare-fun Unit!44567 () Unit!44565)

(assert (=> b!1355700 (= e!769828 Unit!44567)))

(declare-fun b!1355701 () Bool)

(declare-fun res!900577 () Bool)

(assert (=> b!1355701 (=> (not res!900577) (not e!769831))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1355701 (= res!900577 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!114138 res!900583) b!1355694))

(assert (= (and b!1355694 res!900576) b!1355699))

(assert (= (and b!1355699 res!900578) b!1355698))

(assert (= (and b!1355698 res!900581) b!1355691))

(assert (= (and b!1355691 res!900574) b!1355696))

(assert (= (and b!1355696 res!900580) b!1355695))

(assert (= (and b!1355695 res!900575) b!1355701))

(assert (= (and b!1355701 res!900577) b!1355693))

(assert (= (and b!1355693 res!900582) b!1355692))

(assert (= (and b!1355692 c!126998) b!1355697))

(assert (= (and b!1355692 (not c!126998)) b!1355700))

(assert (= (and b!1355692 res!900579) b!1355690))

(declare-fun m!1241817 () Bool)

(assert (=> b!1355699 m!1241817))

(declare-fun m!1241819 () Bool)

(assert (=> b!1355697 m!1241819))

(declare-fun m!1241821 () Bool)

(assert (=> b!1355697 m!1241821))

(declare-fun m!1241823 () Bool)

(assert (=> b!1355697 m!1241823))

(declare-fun m!1241825 () Bool)

(assert (=> b!1355697 m!1241825))

(declare-fun m!1241827 () Bool)

(assert (=> b!1355697 m!1241827))

(assert (=> b!1355697 m!1241821))

(assert (=> b!1355697 m!1241823))

(declare-fun m!1241829 () Bool)

(assert (=> b!1355697 m!1241829))

(declare-fun m!1241831 () Bool)

(assert (=> b!1355701 m!1241831))

(declare-fun m!1241833 () Bool)

(assert (=> b!1355696 m!1241833))

(assert (=> b!1355692 m!1241821))

(assert (=> b!1355692 m!1241821))

(declare-fun m!1241835 () Bool)

(assert (=> b!1355692 m!1241835))

(declare-fun m!1241837 () Bool)

(assert (=> b!1355698 m!1241837))

(assert (=> b!1355690 m!1241827))

(declare-fun m!1241839 () Bool)

(assert (=> b!1355694 m!1241839))

(declare-fun m!1241841 () Bool)

(assert (=> b!1355691 m!1241841))

(declare-fun m!1241843 () Bool)

(assert (=> start!114138 m!1241843))

(push 1)

(assert (not b!1355696))

(assert (not start!114138))

(assert (not b!1355691))

(assert (not b!1355690))

(assert (not b!1355697))

(assert (not b!1355694))

(assert (not b!1355698))

(assert (not b!1355701))

(assert (not b!1355692))

(assert (not b!1355699))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

