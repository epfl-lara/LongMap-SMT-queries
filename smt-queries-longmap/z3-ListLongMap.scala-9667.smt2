; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114364 () Bool)

(assert start!114364)

(declare-fun b!1357025 () Bool)

(declare-fun res!901130 () Bool)

(declare-fun e!770684 () Bool)

(assert (=> b!1357025 (=> (not res!901130) (not e!770684))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92437 0))(
  ( (array!92438 (arr!44662 (Array (_ BitVec 32) (_ BitVec 64))) (size!45213 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92437)

(assert (=> b!1357025 (= res!901130 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45213 a!3742)))))

(declare-fun b!1357026 () Bool)

(declare-fun res!901131 () Bool)

(assert (=> b!1357026 (=> (not res!901131) (not e!770684))))

(declare-datatypes ((List!31690 0))(
  ( (Nil!31687) (Cons!31686 (h!32904 (_ BitVec 64)) (t!46340 List!31690)) )
))
(declare-fun acc!759 () List!31690)

(declare-fun contains!9402 (List!31690 (_ BitVec 64)) Bool)

(assert (=> b!1357026 (= res!901131 (not (contains!9402 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357027 () Bool)

(declare-fun res!901123 () Bool)

(assert (=> b!1357027 (=> (not res!901123) (not e!770684))))

(declare-fun noDuplicate!2233 (List!31690) Bool)

(assert (=> b!1357027 (= res!901123 (noDuplicate!2233 acc!759))))

(declare-fun b!1357028 () Bool)

(declare-datatypes ((Unit!44507 0))(
  ( (Unit!44508) )
))
(declare-fun e!770686 () Unit!44507)

(declare-fun lt!599227 () Unit!44507)

(assert (=> b!1357028 (= e!770686 lt!599227)))

(declare-fun lt!599228 () Unit!44507)

(declare-fun lemmaListSubSeqRefl!0 (List!31690) Unit!44507)

(assert (=> b!1357028 (= lt!599228 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!779 (List!31690 List!31690) Bool)

(assert (=> b!1357028 (subseq!779 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92437 List!31690 List!31690 (_ BitVec 32)) Unit!44507)

(declare-fun $colon$colon!793 (List!31690 (_ BitVec 64)) List!31690)

(assert (=> b!1357028 (= lt!599227 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!793 acc!759 (select (arr!44662 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92437 (_ BitVec 32) List!31690) Bool)

(assert (=> b!1357028 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1357029 () Bool)

(declare-fun res!901129 () Bool)

(assert (=> b!1357029 (=> (not res!901129) (not e!770684))))

(assert (=> b!1357029 (= res!901129 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1357030 () Bool)

(declare-fun e!770683 () Bool)

(assert (=> b!1357030 (= e!770683 false)))

(declare-fun lt!599225 () Bool)

(assert (=> b!1357030 (= lt!599225 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1357031 () Bool)

(declare-fun res!901128 () Bool)

(assert (=> b!1357031 (=> (not res!901128) (not e!770684))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1357031 (= res!901128 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45213 a!3742))))))

(declare-fun b!1357032 () Bool)

(declare-fun Unit!44509 () Unit!44507)

(assert (=> b!1357032 (= e!770686 Unit!44509)))

(declare-fun b!1357034 () Bool)

(declare-fun res!901124 () Bool)

(assert (=> b!1357034 (=> (not res!901124) (not e!770684))))

(assert (=> b!1357034 (= res!901124 (not (contains!9402 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357035 () Bool)

(declare-fun res!901126 () Bool)

(assert (=> b!1357035 (=> (not res!901126) (not e!770684))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357035 (= res!901126 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1357036 () Bool)

(declare-fun res!901125 () Bool)

(assert (=> b!1357036 (=> (not res!901125) (not e!770684))))

(assert (=> b!1357036 (= res!901125 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31687))))

(declare-fun res!901127 () Bool)

(assert (=> start!114364 (=> (not res!901127) (not e!770684))))

(assert (=> start!114364 (= res!901127 (and (bvslt (size!45213 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45213 a!3742))))))

(assert (=> start!114364 e!770684))

(assert (=> start!114364 true))

(declare-fun array_inv!33943 (array!92437) Bool)

(assert (=> start!114364 (array_inv!33943 a!3742)))

(declare-fun b!1357033 () Bool)

(assert (=> b!1357033 (= e!770684 e!770683)))

(declare-fun res!901122 () Bool)

(assert (=> b!1357033 (=> (not res!901122) (not e!770683))))

(declare-fun lt!599226 () Bool)

(assert (=> b!1357033 (= res!901122 (and (not (= from!3120 i!1404)) (not lt!599226) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599229 () Unit!44507)

(assert (=> b!1357033 (= lt!599229 e!770686)))

(declare-fun c!127399 () Bool)

(assert (=> b!1357033 (= c!127399 lt!599226)))

(assert (=> b!1357033 (= lt!599226 (validKeyInArray!0 (select (arr!44662 a!3742) from!3120)))))

(assert (= (and start!114364 res!901127) b!1357027))

(assert (= (and b!1357027 res!901123) b!1357034))

(assert (= (and b!1357034 res!901124) b!1357026))

(assert (= (and b!1357026 res!901131) b!1357036))

(assert (= (and b!1357036 res!901125) b!1357029))

(assert (= (and b!1357029 res!901129) b!1357031))

(assert (= (and b!1357031 res!901128) b!1357035))

(assert (= (and b!1357035 res!901126) b!1357025))

(assert (= (and b!1357025 res!901130) b!1357033))

(assert (= (and b!1357033 c!127399) b!1357028))

(assert (= (and b!1357033 (not c!127399)) b!1357032))

(assert (= (and b!1357033 res!901122) b!1357030))

(declare-fun m!1243441 () Bool)

(assert (=> b!1357033 m!1243441))

(assert (=> b!1357033 m!1243441))

(declare-fun m!1243443 () Bool)

(assert (=> b!1357033 m!1243443))

(declare-fun m!1243445 () Bool)

(assert (=> start!114364 m!1243445))

(declare-fun m!1243447 () Bool)

(assert (=> b!1357036 m!1243447))

(declare-fun m!1243449 () Bool)

(assert (=> b!1357034 m!1243449))

(declare-fun m!1243451 () Bool)

(assert (=> b!1357030 m!1243451))

(declare-fun m!1243453 () Bool)

(assert (=> b!1357026 m!1243453))

(declare-fun m!1243455 () Bool)

(assert (=> b!1357029 m!1243455))

(declare-fun m!1243457 () Bool)

(assert (=> b!1357035 m!1243457))

(declare-fun m!1243459 () Bool)

(assert (=> b!1357028 m!1243459))

(assert (=> b!1357028 m!1243441))

(declare-fun m!1243461 () Bool)

(assert (=> b!1357028 m!1243461))

(declare-fun m!1243463 () Bool)

(assert (=> b!1357028 m!1243463))

(assert (=> b!1357028 m!1243451))

(assert (=> b!1357028 m!1243441))

(assert (=> b!1357028 m!1243461))

(declare-fun m!1243465 () Bool)

(assert (=> b!1357028 m!1243465))

(declare-fun m!1243467 () Bool)

(assert (=> b!1357027 m!1243467))

(check-sat (not b!1357034) (not b!1357036) (not b!1357027) (not b!1357029) (not b!1357035) (not b!1357030) (not start!114364) (not b!1357033) (not b!1357026) (not b!1357028))
(check-sat)
