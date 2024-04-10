; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114996 () Bool)

(assert start!114996)

(declare-fun b!1363134 () Bool)

(declare-datatypes ((Unit!44970 0))(
  ( (Unit!44971) )
))
(declare-fun e!773074 () Unit!44970)

(declare-fun Unit!44972 () Unit!44970)

(assert (=> b!1363134 (= e!773074 Unit!44972)))

(declare-fun res!907004 () Bool)

(declare-fun e!773073 () Bool)

(assert (=> start!114996 (=> (not res!907004) (not e!773073))))

(declare-datatypes ((array!92674 0))(
  ( (array!92675 (arr!44770 (Array (_ BitVec 32) (_ BitVec 64))) (size!45320 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92674)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114996 (= res!907004 (and (bvslt (size!45320 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45320 a!3742))))))

(assert (=> start!114996 e!773073))

(assert (=> start!114996 true))

(declare-fun array_inv!33798 (array!92674) Bool)

(assert (=> start!114996 (array_inv!33798 a!3742)))

(declare-fun b!1363135 () Bool)

(declare-fun res!907006 () Bool)

(assert (=> b!1363135 (=> (not res!907006) (not e!773073))))

(declare-datatypes ((List!31811 0))(
  ( (Nil!31808) (Cons!31807 (h!33016 (_ BitVec 64)) (t!46499 List!31811)) )
))
(declare-fun arrayNoDuplicates!0 (array!92674 (_ BitVec 32) List!31811) Bool)

(assert (=> b!1363135 (= res!907006 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31808))))

(declare-fun b!1363136 () Bool)

(declare-fun res!907003 () Bool)

(assert (=> b!1363136 (=> (not res!907003) (not e!773073))))

(declare-fun acc!759 () List!31811)

(declare-fun noDuplicate!2377 (List!31811) Bool)

(assert (=> b!1363136 (= res!907003 (noDuplicate!2377 acc!759))))

(declare-fun b!1363137 () Bool)

(declare-fun res!906999 () Bool)

(assert (=> b!1363137 (=> (not res!906999) (not e!773073))))

(declare-fun contains!9520 (List!31811 (_ BitVec 64)) Bool)

(assert (=> b!1363137 (= res!906999 (not (contains!9520 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363138 () Bool)

(declare-fun res!907002 () Bool)

(assert (=> b!1363138 (=> (not res!907002) (not e!773073))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363138 (= res!907002 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45320 a!3742))))))

(declare-fun b!1363139 () Bool)

(declare-fun res!907001 () Bool)

(assert (=> b!1363139 (=> (not res!907001) (not e!773073))))

(assert (=> b!1363139 (= res!907001 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45320 a!3742)))))

(declare-fun b!1363140 () Bool)

(declare-fun res!907000 () Bool)

(assert (=> b!1363140 (=> (not res!907000) (not e!773073))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363140 (= res!907000 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363141 () Bool)

(declare-fun lt!600683 () Unit!44970)

(assert (=> b!1363141 (= e!773074 lt!600683)))

(declare-fun lt!600685 () Unit!44970)

(declare-fun lemmaListSubSeqRefl!0 (List!31811) Unit!44970)

(assert (=> b!1363141 (= lt!600685 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!922 (List!31811 List!31811) Bool)

(assert (=> b!1363141 (subseq!922 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92674 List!31811 List!31811 (_ BitVec 32)) Unit!44970)

(declare-fun $colon$colon!925 (List!31811 (_ BitVec 64)) List!31811)

(assert (=> b!1363141 (= lt!600683 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!925 acc!759 (select (arr!44770 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1363141 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363142 () Bool)

(declare-fun res!907005 () Bool)

(assert (=> b!1363142 (=> (not res!907005) (not e!773073))))

(assert (=> b!1363142 (= res!907005 (not (contains!9520 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363143 () Bool)

(assert (=> b!1363143 (= e!773073 false)))

(declare-fun lt!600684 () Unit!44970)

(assert (=> b!1363143 (= lt!600684 e!773074)))

(declare-fun c!127508 () Bool)

(assert (=> b!1363143 (= c!127508 (validKeyInArray!0 (select (arr!44770 a!3742) from!3120)))))

(declare-fun b!1363144 () Bool)

(declare-fun res!906998 () Bool)

(assert (=> b!1363144 (=> (not res!906998) (not e!773073))))

(assert (=> b!1363144 (= res!906998 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!114996 res!907004) b!1363136))

(assert (= (and b!1363136 res!907003) b!1363137))

(assert (= (and b!1363137 res!906999) b!1363142))

(assert (= (and b!1363142 res!907005) b!1363135))

(assert (= (and b!1363135 res!907006) b!1363144))

(assert (= (and b!1363144 res!906998) b!1363138))

(assert (= (and b!1363138 res!907002) b!1363140))

(assert (= (and b!1363140 res!907000) b!1363139))

(assert (= (and b!1363139 res!907001) b!1363143))

(assert (= (and b!1363143 c!127508) b!1363141))

(assert (= (and b!1363143 (not c!127508)) b!1363134))

(declare-fun m!1248003 () Bool)

(assert (=> b!1363137 m!1248003))

(declare-fun m!1248005 () Bool)

(assert (=> b!1363140 m!1248005))

(declare-fun m!1248007 () Bool)

(assert (=> b!1363141 m!1248007))

(declare-fun m!1248009 () Bool)

(assert (=> b!1363141 m!1248009))

(declare-fun m!1248011 () Bool)

(assert (=> b!1363141 m!1248011))

(declare-fun m!1248013 () Bool)

(assert (=> b!1363141 m!1248013))

(declare-fun m!1248015 () Bool)

(assert (=> b!1363141 m!1248015))

(assert (=> b!1363141 m!1248009))

(assert (=> b!1363141 m!1248011))

(declare-fun m!1248017 () Bool)

(assert (=> b!1363141 m!1248017))

(declare-fun m!1248019 () Bool)

(assert (=> b!1363142 m!1248019))

(declare-fun m!1248021 () Bool)

(assert (=> b!1363135 m!1248021))

(declare-fun m!1248023 () Bool)

(assert (=> b!1363136 m!1248023))

(declare-fun m!1248025 () Bool)

(assert (=> start!114996 m!1248025))

(declare-fun m!1248027 () Bool)

(assert (=> b!1363144 m!1248027))

(assert (=> b!1363143 m!1248009))

(assert (=> b!1363143 m!1248009))

(declare-fun m!1248029 () Bool)

(assert (=> b!1363143 m!1248029))

(push 1)

(assert (not b!1363140))

(assert (not b!1363141))

(assert (not b!1363143))

(assert (not b!1363144))

(assert (not b!1363137))

(assert (not b!1363142))

(assert (not b!1363135))

(assert (not b!1363136))

(assert (not start!114996))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

