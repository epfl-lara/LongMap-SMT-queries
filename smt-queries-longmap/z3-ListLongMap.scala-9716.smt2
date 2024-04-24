; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115192 () Bool)

(assert start!115192)

(declare-fun b!1363971 () Bool)

(declare-datatypes ((Unit!44867 0))(
  ( (Unit!44868) )
))
(declare-fun e!773789 () Unit!44867)

(declare-fun lt!601026 () Unit!44867)

(assert (=> b!1363971 (= e!773789 lt!601026)))

(declare-fun lt!601028 () Unit!44867)

(declare-datatypes ((List!31837 0))(
  ( (Nil!31834) (Cons!31833 (h!33051 (_ BitVec 64)) (t!46517 List!31837)) )
))
(declare-fun acc!759 () List!31837)

(declare-fun lemmaListSubSeqRefl!0 (List!31837) Unit!44867)

(assert (=> b!1363971 (= lt!601028 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!908 (List!31837 List!31837) Bool)

(assert (=> b!1363971 (subseq!908 acc!759 acc!759)))

(declare-datatypes ((array!92761 0))(
  ( (array!92762 (arr!44809 (Array (_ BitVec 32) (_ BitVec 64))) (size!45360 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92761)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92761 List!31837 List!31837 (_ BitVec 32)) Unit!44867)

(declare-fun $colon$colon!910 (List!31837 (_ BitVec 64)) List!31837)

(assert (=> b!1363971 (= lt!601026 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!910 acc!759 (select (arr!44809 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92761 (_ BitVec 32) List!31837) Bool)

(assert (=> b!1363971 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363972 () Bool)

(declare-fun res!907146 () Bool)

(declare-fun e!773790 () Bool)

(assert (=> b!1363972 (=> (not res!907146) (not e!773790))))

(assert (=> b!1363972 (= res!907146 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363974 () Bool)

(declare-fun Unit!44869 () Unit!44867)

(assert (=> b!1363974 (= e!773789 Unit!44869)))

(declare-fun b!1363975 () Bool)

(declare-fun res!907144 () Bool)

(assert (=> b!1363975 (=> (not res!907144) (not e!773790))))

(assert (=> b!1363975 (= res!907144 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45360 a!3742)))))

(declare-fun lt!601027 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun b!1363976 () Bool)

(assert (=> b!1363976 (= e!773790 (and (not (= from!3120 i!1404)) (not lt!601027) (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!601029 () Unit!44867)

(assert (=> b!1363976 (= lt!601029 e!773789)))

(declare-fun c!127864 () Bool)

(assert (=> b!1363976 (= c!127864 lt!601027)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363976 (= lt!601027 (validKeyInArray!0 (select (arr!44809 a!3742) from!3120)))))

(declare-fun b!1363977 () Bool)

(declare-fun res!907145 () Bool)

(assert (=> b!1363977 (=> (not res!907145) (not e!773790))))

(assert (=> b!1363977 (= res!907145 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45360 a!3742))))))

(declare-fun b!1363973 () Bool)

(declare-fun res!907139 () Bool)

(assert (=> b!1363973 (=> (not res!907139) (not e!773790))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1363973 (= res!907139 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!907142 () Bool)

(assert (=> start!115192 (=> (not res!907142) (not e!773790))))

(assert (=> start!115192 (= res!907142 (and (bvslt (size!45360 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45360 a!3742))))))

(assert (=> start!115192 e!773790))

(assert (=> start!115192 true))

(declare-fun array_inv!34090 (array!92761) Bool)

(assert (=> start!115192 (array_inv!34090 a!3742)))

(declare-fun b!1363978 () Bool)

(declare-fun res!907141 () Bool)

(assert (=> b!1363978 (=> (not res!907141) (not e!773790))))

(declare-fun contains!9549 (List!31837 (_ BitVec 64)) Bool)

(assert (=> b!1363978 (= res!907141 (not (contains!9549 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363979 () Bool)

(declare-fun res!907140 () Bool)

(assert (=> b!1363979 (=> (not res!907140) (not e!773790))))

(assert (=> b!1363979 (= res!907140 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31834))))

(declare-fun b!1363980 () Bool)

(declare-fun res!907143 () Bool)

(assert (=> b!1363980 (=> (not res!907143) (not e!773790))))

(assert (=> b!1363980 (= res!907143 (not (contains!9549 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363981 () Bool)

(declare-fun res!907138 () Bool)

(assert (=> b!1363981 (=> (not res!907138) (not e!773790))))

(declare-fun noDuplicate!2380 (List!31837) Bool)

(assert (=> b!1363981 (= res!907138 (noDuplicate!2380 acc!759))))

(assert (= (and start!115192 res!907142) b!1363981))

(assert (= (and b!1363981 res!907138) b!1363980))

(assert (= (and b!1363980 res!907143) b!1363978))

(assert (= (and b!1363978 res!907141) b!1363979))

(assert (= (and b!1363979 res!907140) b!1363972))

(assert (= (and b!1363972 res!907146) b!1363977))

(assert (= (and b!1363977 res!907145) b!1363973))

(assert (= (and b!1363973 res!907139) b!1363975))

(assert (= (and b!1363975 res!907144) b!1363976))

(assert (= (and b!1363976 c!127864) b!1363971))

(assert (= (and b!1363976 (not c!127864)) b!1363974))

(declare-fun m!1249207 () Bool)

(assert (=> b!1363976 m!1249207))

(assert (=> b!1363976 m!1249207))

(declare-fun m!1249209 () Bool)

(assert (=> b!1363976 m!1249209))

(declare-fun m!1249211 () Bool)

(assert (=> b!1363981 m!1249211))

(declare-fun m!1249213 () Bool)

(assert (=> b!1363972 m!1249213))

(declare-fun m!1249215 () Bool)

(assert (=> start!115192 m!1249215))

(declare-fun m!1249217 () Bool)

(assert (=> b!1363971 m!1249217))

(assert (=> b!1363971 m!1249207))

(declare-fun m!1249219 () Bool)

(assert (=> b!1363971 m!1249219))

(declare-fun m!1249221 () Bool)

(assert (=> b!1363971 m!1249221))

(declare-fun m!1249223 () Bool)

(assert (=> b!1363971 m!1249223))

(assert (=> b!1363971 m!1249207))

(assert (=> b!1363971 m!1249219))

(declare-fun m!1249225 () Bool)

(assert (=> b!1363971 m!1249225))

(declare-fun m!1249227 () Bool)

(assert (=> b!1363980 m!1249227))

(declare-fun m!1249229 () Bool)

(assert (=> b!1363979 m!1249229))

(declare-fun m!1249231 () Bool)

(assert (=> b!1363978 m!1249231))

(declare-fun m!1249233 () Bool)

(assert (=> b!1363973 m!1249233))

(check-sat (not b!1363978) (not b!1363972) (not start!115192) (not b!1363971) (not b!1363979) (not b!1363981) (not b!1363976) (not b!1363980) (not b!1363973))
(check-sat)
