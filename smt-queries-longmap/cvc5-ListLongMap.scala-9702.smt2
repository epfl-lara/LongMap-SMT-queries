; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114890 () Bool)

(assert start!114890)

(declare-fun b!1361532 () Bool)

(declare-fun res!905085 () Bool)

(declare-fun e!772599 () Bool)

(assert (=> b!1361532 (=> (not res!905085) (not e!772599))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92669 0))(
  ( (array!92670 (arr!44769 (Array (_ BitVec 32) (_ BitVec 64))) (size!45320 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92669)

(assert (=> b!1361532 (= res!905085 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45320 a!3742))))))

(declare-fun b!1361533 () Bool)

(declare-fun res!905084 () Bool)

(assert (=> b!1361533 (=> (not res!905084) (not e!772599))))

(declare-datatypes ((List!31797 0))(
  ( (Nil!31794) (Cons!31793 (h!33011 (_ BitVec 64)) (t!46465 List!31797)) )
))
(declare-fun acc!759 () List!31797)

(declare-fun contains!9509 (List!31797 (_ BitVec 64)) Bool)

(assert (=> b!1361533 (= res!905084 (not (contains!9509 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361534 () Bool)

(declare-fun res!905091 () Bool)

(assert (=> b!1361534 (=> (not res!905091) (not e!772599))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92669 (_ BitVec 32) List!31797) Bool)

(assert (=> b!1361534 (= res!905091 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1361535 () Bool)

(assert (=> b!1361535 (= e!772599 false)))

(declare-datatypes ((Unit!44747 0))(
  ( (Unit!44748) )
))
(declare-fun lt!600303 () Unit!44747)

(declare-fun e!772598 () Unit!44747)

(assert (=> b!1361535 (= lt!600303 e!772598)))

(declare-fun c!127672 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1361535 (= c!127672 (validKeyInArray!0 (select (arr!44769 a!3742) from!3120)))))

(declare-fun b!1361536 () Bool)

(declare-fun lt!600301 () Unit!44747)

(assert (=> b!1361536 (= e!772598 lt!600301)))

(declare-fun lt!600302 () Unit!44747)

(declare-fun lemmaListSubSeqRefl!0 (List!31797) Unit!44747)

(assert (=> b!1361536 (= lt!600302 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!868 (List!31797 List!31797) Bool)

(assert (=> b!1361536 (subseq!868 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92669 List!31797 List!31797 (_ BitVec 32)) Unit!44747)

(declare-fun $colon$colon!870 (List!31797 (_ BitVec 64)) List!31797)

(assert (=> b!1361536 (= lt!600301 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!870 acc!759 (select (arr!44769 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1361536 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1361537 () Bool)

(declare-fun res!905088 () Bool)

(assert (=> b!1361537 (=> (not res!905088) (not e!772599))))

(assert (=> b!1361537 (= res!905088 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31794))))

(declare-fun b!1361538 () Bool)

(declare-fun Unit!44749 () Unit!44747)

(assert (=> b!1361538 (= e!772598 Unit!44749)))

(declare-fun b!1361539 () Bool)

(declare-fun res!905083 () Bool)

(assert (=> b!1361539 (=> (not res!905083) (not e!772599))))

(assert (=> b!1361539 (= res!905083 (not (contains!9509 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!905087 () Bool)

(assert (=> start!114890 (=> (not res!905087) (not e!772599))))

(assert (=> start!114890 (= res!905087 (and (bvslt (size!45320 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45320 a!3742))))))

(assert (=> start!114890 e!772599))

(assert (=> start!114890 true))

(declare-fun array_inv!34050 (array!92669) Bool)

(assert (=> start!114890 (array_inv!34050 a!3742)))

(declare-fun b!1361540 () Bool)

(declare-fun res!905089 () Bool)

(assert (=> b!1361540 (=> (not res!905089) (not e!772599))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1361540 (= res!905089 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1361541 () Bool)

(declare-fun res!905090 () Bool)

(assert (=> b!1361541 (=> (not res!905090) (not e!772599))))

(assert (=> b!1361541 (= res!905090 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45320 a!3742)))))

(declare-fun b!1361542 () Bool)

(declare-fun res!905086 () Bool)

(assert (=> b!1361542 (=> (not res!905086) (not e!772599))))

(declare-fun noDuplicate!2340 (List!31797) Bool)

(assert (=> b!1361542 (= res!905086 (noDuplicate!2340 acc!759))))

(assert (= (and start!114890 res!905087) b!1361542))

(assert (= (and b!1361542 res!905086) b!1361539))

(assert (= (and b!1361539 res!905083) b!1361533))

(assert (= (and b!1361533 res!905084) b!1361537))

(assert (= (and b!1361537 res!905088) b!1361534))

(assert (= (and b!1361534 res!905091) b!1361532))

(assert (= (and b!1361532 res!905085) b!1361540))

(assert (= (and b!1361540 res!905089) b!1361541))

(assert (= (and b!1361541 res!905090) b!1361535))

(assert (= (and b!1361535 c!127672) b!1361536))

(assert (= (and b!1361535 (not c!127672)) b!1361538))

(declare-fun m!1247133 () Bool)

(assert (=> start!114890 m!1247133))

(declare-fun m!1247135 () Bool)

(assert (=> b!1361534 m!1247135))

(declare-fun m!1247137 () Bool)

(assert (=> b!1361542 m!1247137))

(declare-fun m!1247139 () Bool)

(assert (=> b!1361533 m!1247139))

(declare-fun m!1247141 () Bool)

(assert (=> b!1361539 m!1247141))

(declare-fun m!1247143 () Bool)

(assert (=> b!1361536 m!1247143))

(declare-fun m!1247145 () Bool)

(assert (=> b!1361536 m!1247145))

(declare-fun m!1247147 () Bool)

(assert (=> b!1361536 m!1247147))

(declare-fun m!1247149 () Bool)

(assert (=> b!1361536 m!1247149))

(declare-fun m!1247151 () Bool)

(assert (=> b!1361536 m!1247151))

(assert (=> b!1361536 m!1247145))

(assert (=> b!1361536 m!1247147))

(declare-fun m!1247153 () Bool)

(assert (=> b!1361536 m!1247153))

(assert (=> b!1361535 m!1247145))

(assert (=> b!1361535 m!1247145))

(declare-fun m!1247155 () Bool)

(assert (=> b!1361535 m!1247155))

(declare-fun m!1247157 () Bool)

(assert (=> b!1361540 m!1247157))

(declare-fun m!1247159 () Bool)

(assert (=> b!1361537 m!1247159))

(push 1)

(assert (not b!1361539))

(assert (not b!1361542))

(assert (not b!1361537))

(assert (not b!1361540))

(assert (not b!1361534))

(assert (not start!114890))

(assert (not b!1361536))

(assert (not b!1361535))

(assert (not b!1361533))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

