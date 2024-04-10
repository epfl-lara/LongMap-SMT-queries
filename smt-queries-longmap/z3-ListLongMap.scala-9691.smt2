; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114484 () Bool)

(assert start!114484)

(declare-fun b!1358685 () Bool)

(declare-fun res!903296 () Bool)

(declare-fun e!771087 () Bool)

(assert (=> b!1358685 (=> (not res!903296) (not e!771087))))

(declare-datatypes ((List!31723 0))(
  ( (Nil!31720) (Cons!31719 (h!32928 (_ BitVec 64)) (t!46393 List!31723)) )
))
(declare-fun acc!759 () List!31723)

(declare-fun noDuplicate!2289 (List!31723) Bool)

(assert (=> b!1358685 (= res!903296 (noDuplicate!2289 acc!759))))

(declare-fun b!1358686 () Bool)

(declare-fun res!903298 () Bool)

(assert (=> b!1358686 (=> (not res!903298) (not e!771087))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358686 (= res!903298 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!903294 () Bool)

(assert (=> start!114484 (=> (not res!903294) (not e!771087))))

(declare-datatypes ((array!92480 0))(
  ( (array!92481 (arr!44682 (Array (_ BitVec 32) (_ BitVec 64))) (size!45232 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92480)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114484 (= res!903294 (and (bvslt (size!45232 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45232 a!3742))))))

(assert (=> start!114484 e!771087))

(assert (=> start!114484 true))

(declare-fun array_inv!33710 (array!92480) Bool)

(assert (=> start!114484 (array_inv!33710 a!3742)))

(declare-fun b!1358687 () Bool)

(assert (=> b!1358687 (= e!771087 false)))

(declare-datatypes ((Unit!44706 0))(
  ( (Unit!44707) )
))
(declare-fun lt!599407 () Unit!44706)

(declare-fun e!771088 () Unit!44706)

(assert (=> b!1358687 (= lt!599407 e!771088)))

(declare-fun c!127136 () Bool)

(assert (=> b!1358687 (= c!127136 (validKeyInArray!0 (select (arr!44682 a!3742) from!3120)))))

(declare-fun b!1358688 () Bool)

(declare-fun res!903295 () Bool)

(assert (=> b!1358688 (=> (not res!903295) (not e!771087))))

(declare-fun contains!9432 (List!31723 (_ BitVec 64)) Bool)

(assert (=> b!1358688 (= res!903295 (not (contains!9432 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358689 () Bool)

(declare-fun Unit!44708 () Unit!44706)

(assert (=> b!1358689 (= e!771088 Unit!44708)))

(declare-fun b!1358690 () Bool)

(declare-fun res!903299 () Bool)

(assert (=> b!1358690 (=> (not res!903299) (not e!771087))))

(declare-fun arrayNoDuplicates!0 (array!92480 (_ BitVec 32) List!31723) Bool)

(assert (=> b!1358690 (= res!903299 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31720))))

(declare-fun b!1358691 () Bool)

(declare-fun res!903301 () Bool)

(assert (=> b!1358691 (=> (not res!903301) (not e!771087))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358691 (= res!903301 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45232 a!3742))))))

(declare-fun b!1358692 () Bool)

(declare-fun res!903300 () Bool)

(assert (=> b!1358692 (=> (not res!903300) (not e!771087))))

(assert (=> b!1358692 (= res!903300 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45232 a!3742)))))

(declare-fun b!1358693 () Bool)

(declare-fun res!903293 () Bool)

(assert (=> b!1358693 (=> (not res!903293) (not e!771087))))

(assert (=> b!1358693 (= res!903293 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358694 () Bool)

(declare-fun lt!599405 () Unit!44706)

(assert (=> b!1358694 (= e!771088 lt!599405)))

(declare-fun lt!599406 () Unit!44706)

(declare-fun lemmaListSubSeqRefl!0 (List!31723) Unit!44706)

(assert (=> b!1358694 (= lt!599406 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!834 (List!31723 List!31723) Bool)

(assert (=> b!1358694 (subseq!834 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92480 List!31723 List!31723 (_ BitVec 32)) Unit!44706)

(declare-fun $colon$colon!837 (List!31723 (_ BitVec 64)) List!31723)

(assert (=> b!1358694 (= lt!599405 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!837 acc!759 (select (arr!44682 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1358694 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1358695 () Bool)

(declare-fun res!903297 () Bool)

(assert (=> b!1358695 (=> (not res!903297) (not e!771087))))

(assert (=> b!1358695 (= res!903297 (not (contains!9432 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114484 res!903294) b!1358685))

(assert (= (and b!1358685 res!903296) b!1358688))

(assert (= (and b!1358688 res!903295) b!1358695))

(assert (= (and b!1358695 res!903297) b!1358690))

(assert (= (and b!1358690 res!903299) b!1358693))

(assert (= (and b!1358693 res!903293) b!1358691))

(assert (= (and b!1358691 res!903301) b!1358686))

(assert (= (and b!1358686 res!903298) b!1358692))

(assert (= (and b!1358692 res!903300) b!1358687))

(assert (= (and b!1358687 c!127136) b!1358694))

(assert (= (and b!1358687 (not c!127136)) b!1358689))

(declare-fun m!1244231 () Bool)

(assert (=> b!1358693 m!1244231))

(declare-fun m!1244233 () Bool)

(assert (=> b!1358688 m!1244233))

(declare-fun m!1244235 () Bool)

(assert (=> b!1358686 m!1244235))

(declare-fun m!1244237 () Bool)

(assert (=> b!1358685 m!1244237))

(declare-fun m!1244239 () Bool)

(assert (=> b!1358687 m!1244239))

(assert (=> b!1358687 m!1244239))

(declare-fun m!1244241 () Bool)

(assert (=> b!1358687 m!1244241))

(declare-fun m!1244243 () Bool)

(assert (=> b!1358690 m!1244243))

(declare-fun m!1244245 () Bool)

(assert (=> start!114484 m!1244245))

(declare-fun m!1244247 () Bool)

(assert (=> b!1358694 m!1244247))

(assert (=> b!1358694 m!1244239))

(declare-fun m!1244249 () Bool)

(assert (=> b!1358694 m!1244249))

(declare-fun m!1244251 () Bool)

(assert (=> b!1358694 m!1244251))

(declare-fun m!1244253 () Bool)

(assert (=> b!1358694 m!1244253))

(assert (=> b!1358694 m!1244239))

(assert (=> b!1358694 m!1244249))

(declare-fun m!1244255 () Bool)

(assert (=> b!1358694 m!1244255))

(declare-fun m!1244257 () Bool)

(assert (=> b!1358695 m!1244257))

(check-sat (not b!1358688) (not b!1358695) (not b!1358690) (not b!1358687) (not b!1358686) (not start!114484) (not b!1358685) (not b!1358694) (not b!1358693))
