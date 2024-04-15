; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114996 () Bool)

(assert start!114996)

(declare-fun b!1363064 () Bool)

(declare-fun res!906972 () Bool)

(declare-fun e!773040 () Bool)

(assert (=> b!1363064 (=> (not res!906972) (not e!773040))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92623 0))(
  ( (array!92624 (arr!44745 (Array (_ BitVec 32) (_ BitVec 64))) (size!45297 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92623)

(assert (=> b!1363064 (= res!906972 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45297 a!3742))))))

(declare-fun b!1363065 () Bool)

(declare-fun res!906970 () Bool)

(assert (=> b!1363065 (=> (not res!906970) (not e!773040))))

(declare-datatypes ((List!31864 0))(
  ( (Nil!31861) (Cons!31860 (h!33069 (_ BitVec 64)) (t!46544 List!31864)) )
))
(declare-fun acc!759 () List!31864)

(declare-fun noDuplicate!2399 (List!31864) Bool)

(assert (=> b!1363065 (= res!906970 (noDuplicate!2399 acc!759))))

(declare-fun b!1363066 () Bool)

(assert (=> b!1363066 (= e!773040 false)))

(declare-datatypes ((Unit!44811 0))(
  ( (Unit!44812) )
))
(declare-fun lt!600498 () Unit!44811)

(declare-fun e!773041 () Unit!44811)

(assert (=> b!1363066 (= lt!600498 e!773041)))

(declare-fun c!127490 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363066 (= c!127490 (validKeyInArray!0 (select (arr!44745 a!3742) from!3120)))))

(declare-fun res!906977 () Bool)

(assert (=> start!114996 (=> (not res!906977) (not e!773040))))

(assert (=> start!114996 (= res!906977 (and (bvslt (size!45297 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45297 a!3742))))))

(assert (=> start!114996 e!773040))

(assert (=> start!114996 true))

(declare-fun array_inv!33978 (array!92623) Bool)

(assert (=> start!114996 (array_inv!33978 a!3742)))

(declare-fun b!1363067 () Bool)

(declare-fun Unit!44813 () Unit!44811)

(assert (=> b!1363067 (= e!773041 Unit!44813)))

(declare-fun b!1363068 () Bool)

(declare-fun res!906969 () Bool)

(assert (=> b!1363068 (=> (not res!906969) (not e!773040))))

(declare-fun contains!9484 (List!31864 (_ BitVec 64)) Bool)

(assert (=> b!1363068 (= res!906969 (not (contains!9484 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363069 () Bool)

(declare-fun res!906975 () Bool)

(assert (=> b!1363069 (=> (not res!906975) (not e!773040))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1363069 (= res!906975 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363070 () Bool)

(declare-fun res!906976 () Bool)

(assert (=> b!1363070 (=> (not res!906976) (not e!773040))))

(assert (=> b!1363070 (= res!906976 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45297 a!3742)))))

(declare-fun b!1363071 () Bool)

(declare-fun res!906973 () Bool)

(assert (=> b!1363071 (=> (not res!906973) (not e!773040))))

(declare-fun arrayNoDuplicates!0 (array!92623 (_ BitVec 32) List!31864) Bool)

(assert (=> b!1363071 (= res!906973 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31861))))

(declare-fun b!1363072 () Bool)

(declare-fun res!906974 () Bool)

(assert (=> b!1363072 (=> (not res!906974) (not e!773040))))

(assert (=> b!1363072 (= res!906974 (not (contains!9484 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363073 () Bool)

(declare-fun res!906971 () Bool)

(assert (=> b!1363073 (=> (not res!906971) (not e!773040))))

(assert (=> b!1363073 (= res!906971 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363074 () Bool)

(declare-fun lt!600497 () Unit!44811)

(assert (=> b!1363074 (= e!773041 lt!600497)))

(declare-fun lt!600499 () Unit!44811)

(declare-fun lemmaListSubSeqRefl!0 (List!31864) Unit!44811)

(assert (=> b!1363074 (= lt!600499 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!922 (List!31864 List!31864) Bool)

(assert (=> b!1363074 (subseq!922 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92623 List!31864 List!31864 (_ BitVec 32)) Unit!44811)

(declare-fun $colon$colon!927 (List!31864 (_ BitVec 64)) List!31864)

(assert (=> b!1363074 (= lt!600497 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!927 acc!759 (select (arr!44745 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1363074 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!114996 res!906977) b!1363065))

(assert (= (and b!1363065 res!906970) b!1363068))

(assert (= (and b!1363068 res!906969) b!1363072))

(assert (= (and b!1363072 res!906974) b!1363071))

(assert (= (and b!1363071 res!906973) b!1363073))

(assert (= (and b!1363073 res!906971) b!1363064))

(assert (= (and b!1363064 res!906972) b!1363069))

(assert (= (and b!1363069 res!906975) b!1363070))

(assert (= (and b!1363070 res!906976) b!1363066))

(assert (= (and b!1363066 c!127490) b!1363074))

(assert (= (and b!1363066 (not c!127490)) b!1363067))

(declare-fun m!1247487 () Bool)

(assert (=> b!1363072 m!1247487))

(declare-fun m!1247489 () Bool)

(assert (=> b!1363069 m!1247489))

(declare-fun m!1247491 () Bool)

(assert (=> b!1363074 m!1247491))

(declare-fun m!1247493 () Bool)

(assert (=> b!1363074 m!1247493))

(declare-fun m!1247495 () Bool)

(assert (=> b!1363074 m!1247495))

(declare-fun m!1247497 () Bool)

(assert (=> b!1363074 m!1247497))

(declare-fun m!1247499 () Bool)

(assert (=> b!1363074 m!1247499))

(assert (=> b!1363074 m!1247493))

(assert (=> b!1363074 m!1247495))

(declare-fun m!1247501 () Bool)

(assert (=> b!1363074 m!1247501))

(declare-fun m!1247503 () Bool)

(assert (=> b!1363071 m!1247503))

(declare-fun m!1247505 () Bool)

(assert (=> start!114996 m!1247505))

(declare-fun m!1247507 () Bool)

(assert (=> b!1363068 m!1247507))

(assert (=> b!1363066 m!1247493))

(assert (=> b!1363066 m!1247493))

(declare-fun m!1247509 () Bool)

(assert (=> b!1363066 m!1247509))

(declare-fun m!1247511 () Bool)

(assert (=> b!1363065 m!1247511))

(declare-fun m!1247513 () Bool)

(assert (=> b!1363073 m!1247513))

(push 1)

(assert (not b!1363065))

(assert (not start!114996))

(assert (not b!1363066))

(assert (not b!1363073))

(assert (not b!1363072))

(assert (not b!1363074))

(assert (not b!1363071))

(assert (not b!1363069))

(assert (not b!1363068))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

