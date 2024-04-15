; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114122 () Bool)

(assert start!114122)

(declare-fun b!1355332 () Bool)

(declare-fun res!900313 () Bool)

(declare-fun e!769699 () Bool)

(assert (=> b!1355332 (=> (not res!900313) (not e!769699))))

(declare-datatypes ((List!31694 0))(
  ( (Nil!31691) (Cons!31690 (h!32899 (_ BitVec 64)) (t!46344 List!31694)) )
))
(declare-fun acc!759 () List!31694)

(declare-fun noDuplicate!2229 (List!31694) Bool)

(assert (=> b!1355332 (= res!900313 (noDuplicate!2229 acc!759))))

(declare-fun b!1355334 () Bool)

(declare-datatypes ((Unit!44382 0))(
  ( (Unit!44383) )
))
(declare-fun e!769701 () Unit!44382)

(declare-fun Unit!44384 () Unit!44382)

(assert (=> b!1355334 (= e!769701 Unit!44384)))

(declare-fun b!1355335 () Bool)

(declare-fun res!900309 () Bool)

(assert (=> b!1355335 (=> (not res!900309) (not e!769699))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355335 (= res!900309 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355336 () Bool)

(declare-fun lt!598428 () Unit!44382)

(assert (=> b!1355336 (= e!769701 lt!598428)))

(declare-fun lt!598429 () Unit!44382)

(declare-fun lemmaListSubSeqRefl!0 (List!31694) Unit!44382)

(assert (=> b!1355336 (= lt!598429 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!770 (List!31694 List!31694) Bool)

(assert (=> b!1355336 (subseq!770 acc!759 acc!759)))

(declare-datatypes ((array!92253 0))(
  ( (array!92254 (arr!44575 (Array (_ BitVec 32) (_ BitVec 64))) (size!45127 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92253)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92253 List!31694 List!31694 (_ BitVec 32)) Unit!44382)

(declare-fun $colon$colon!787 (List!31694 (_ BitVec 64)) List!31694)

(assert (=> b!1355336 (= lt!598428 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!787 acc!759 (select (arr!44575 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92253 (_ BitVec 32) List!31694) Bool)

(assert (=> b!1355336 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355337 () Bool)

(declare-fun e!769700 () Bool)

(assert (=> b!1355337 (= e!769700 false)))

(declare-fun lt!598430 () Bool)

(assert (=> b!1355337 (= lt!598430 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355338 () Bool)

(declare-fun res!900311 () Bool)

(assert (=> b!1355338 (=> (not res!900311) (not e!769699))))

(assert (=> b!1355338 (= res!900311 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31691))))

(declare-fun b!1355339 () Bool)

(declare-fun res!900314 () Bool)

(assert (=> b!1355339 (=> (not res!900314) (not e!769699))))

(declare-fun contains!9314 (List!31694 (_ BitVec 64)) Bool)

(assert (=> b!1355339 (= res!900314 (not (contains!9314 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355333 () Bool)

(assert (=> b!1355333 (= e!769699 e!769700)))

(declare-fun res!900306 () Bool)

(assert (=> b!1355333 (=> (not res!900306) (not e!769700))))

(declare-fun lt!598432 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355333 (= res!900306 (and (not (= from!3120 i!1404)) (not lt!598432) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598431 () Unit!44382)

(assert (=> b!1355333 (= lt!598431 e!769701)))

(declare-fun c!126956 () Bool)

(assert (=> b!1355333 (= c!126956 lt!598432)))

(assert (=> b!1355333 (= lt!598432 (validKeyInArray!0 (select (arr!44575 a!3742) from!3120)))))

(declare-fun res!900308 () Bool)

(assert (=> start!114122 (=> (not res!900308) (not e!769699))))

(assert (=> start!114122 (= res!900308 (and (bvslt (size!45127 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45127 a!3742))))))

(assert (=> start!114122 e!769699))

(assert (=> start!114122 true))

(declare-fun array_inv!33808 (array!92253) Bool)

(assert (=> start!114122 (array_inv!33808 a!3742)))

(declare-fun b!1355340 () Bool)

(declare-fun res!900312 () Bool)

(assert (=> b!1355340 (=> (not res!900312) (not e!769699))))

(assert (=> b!1355340 (= res!900312 (not (contains!9314 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355341 () Bool)

(declare-fun res!900305 () Bool)

(assert (=> b!1355341 (=> (not res!900305) (not e!769699))))

(assert (=> b!1355341 (= res!900305 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45127 a!3742))))))

(declare-fun b!1355342 () Bool)

(declare-fun res!900310 () Bool)

(assert (=> b!1355342 (=> (not res!900310) (not e!769699))))

(assert (=> b!1355342 (= res!900310 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355343 () Bool)

(declare-fun res!900307 () Bool)

(assert (=> b!1355343 (=> (not res!900307) (not e!769699))))

(assert (=> b!1355343 (= res!900307 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45127 a!3742)))))

(assert (= (and start!114122 res!900308) b!1355332))

(assert (= (and b!1355332 res!900313) b!1355339))

(assert (= (and b!1355339 res!900314) b!1355340))

(assert (= (and b!1355340 res!900312) b!1355338))

(assert (= (and b!1355338 res!900311) b!1355342))

(assert (= (and b!1355342 res!900310) b!1355341))

(assert (= (and b!1355341 res!900305) b!1355335))

(assert (= (and b!1355335 res!900309) b!1355343))

(assert (= (and b!1355343 res!900307) b!1355333))

(assert (= (and b!1355333 c!126956) b!1355336))

(assert (= (and b!1355333 (not c!126956)) b!1355334))

(assert (= (and b!1355333 res!900306) b!1355337))

(declare-fun m!1241077 () Bool)

(assert (=> b!1355332 m!1241077))

(declare-fun m!1241079 () Bool)

(assert (=> b!1355335 m!1241079))

(declare-fun m!1241081 () Bool)

(assert (=> b!1355336 m!1241081))

(declare-fun m!1241083 () Bool)

(assert (=> b!1355336 m!1241083))

(declare-fun m!1241085 () Bool)

(assert (=> b!1355336 m!1241085))

(declare-fun m!1241087 () Bool)

(assert (=> b!1355336 m!1241087))

(declare-fun m!1241089 () Bool)

(assert (=> b!1355336 m!1241089))

(assert (=> b!1355336 m!1241083))

(assert (=> b!1355336 m!1241085))

(declare-fun m!1241091 () Bool)

(assert (=> b!1355336 m!1241091))

(declare-fun m!1241093 () Bool)

(assert (=> b!1355338 m!1241093))

(declare-fun m!1241095 () Bool)

(assert (=> b!1355339 m!1241095))

(declare-fun m!1241097 () Bool)

(assert (=> start!114122 m!1241097))

(assert (=> b!1355337 m!1241089))

(assert (=> b!1355333 m!1241083))

(assert (=> b!1355333 m!1241083))

(declare-fun m!1241099 () Bool)

(assert (=> b!1355333 m!1241099))

(declare-fun m!1241101 () Bool)

(assert (=> b!1355342 m!1241101))

(declare-fun m!1241103 () Bool)

(assert (=> b!1355340 m!1241103))

(check-sat (not b!1355338) (not b!1355336) (not b!1355332) (not start!114122) (not b!1355335) (not b!1355337) (not b!1355342) (not b!1355333) (not b!1355340) (not b!1355339))
(check-sat)
