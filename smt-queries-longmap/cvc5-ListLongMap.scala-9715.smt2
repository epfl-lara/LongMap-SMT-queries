; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115190 () Bool)

(assert start!115190)

(declare-fun b!1363938 () Bool)

(declare-fun res!907118 () Bool)

(declare-fun e!773782 () Bool)

(assert (=> b!1363938 (=> (not res!907118) (not e!773782))))

(declare-datatypes ((List!31836 0))(
  ( (Nil!31833) (Cons!31832 (h!33050 (_ BitVec 64)) (t!46516 List!31836)) )
))
(declare-fun acc!759 () List!31836)

(declare-fun noDuplicate!2379 (List!31836) Bool)

(assert (=> b!1363938 (= res!907118 (noDuplicate!2379 acc!759))))

(declare-fun b!1363939 () Bool)

(assert (=> b!1363939 (= e!773782 false)))

(declare-datatypes ((Unit!44864 0))(
  ( (Unit!44865) )
))
(declare-fun lt!601016 () Unit!44864)

(declare-fun e!773781 () Unit!44864)

(assert (=> b!1363939 (= lt!601016 e!773781)))

(declare-fun c!127861 () Bool)

(declare-datatypes ((array!92759 0))(
  ( (array!92760 (arr!44808 (Array (_ BitVec 32) (_ BitVec 64))) (size!45359 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92759)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363939 (= c!127861 (validKeyInArray!0 (select (arr!44808 a!3742) from!3120)))))

(declare-fun b!1363940 () Bool)

(declare-fun Unit!44866 () Unit!44864)

(assert (=> b!1363940 (= e!773781 Unit!44866)))

(declare-fun b!1363941 () Bool)

(declare-fun lt!601017 () Unit!44864)

(assert (=> b!1363941 (= e!773781 lt!601017)))

(declare-fun lt!601015 () Unit!44864)

(declare-fun lemmaListSubSeqRefl!0 (List!31836) Unit!44864)

(assert (=> b!1363941 (= lt!601015 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!907 (List!31836 List!31836) Bool)

(assert (=> b!1363941 (subseq!907 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92759 List!31836 List!31836 (_ BitVec 32)) Unit!44864)

(declare-fun $colon$colon!909 (List!31836 (_ BitVec 64)) List!31836)

(assert (=> b!1363941 (= lt!601017 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!909 acc!759 (select (arr!44808 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92759 (_ BitVec 32) List!31836) Bool)

(assert (=> b!1363941 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363942 () Bool)

(declare-fun res!907119 () Bool)

(assert (=> b!1363942 (=> (not res!907119) (not e!773782))))

(declare-fun contains!9548 (List!31836 (_ BitVec 64)) Bool)

(assert (=> b!1363942 (= res!907119 (not (contains!9548 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363943 () Bool)

(declare-fun res!907114 () Bool)

(assert (=> b!1363943 (=> (not res!907114) (not e!773782))))

(assert (=> b!1363943 (= res!907114 (not (contains!9548 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363944 () Bool)

(declare-fun res!907112 () Bool)

(assert (=> b!1363944 (=> (not res!907112) (not e!773782))))

(assert (=> b!1363944 (= res!907112 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31833))))

(declare-fun b!1363945 () Bool)

(declare-fun res!907111 () Bool)

(assert (=> b!1363945 (=> (not res!907111) (not e!773782))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363945 (= res!907111 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45359 a!3742))))))

(declare-fun b!1363946 () Bool)

(declare-fun res!907117 () Bool)

(assert (=> b!1363946 (=> (not res!907117) (not e!773782))))

(assert (=> b!1363946 (= res!907117 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45359 a!3742)))))

(declare-fun res!907115 () Bool)

(assert (=> start!115190 (=> (not res!907115) (not e!773782))))

(assert (=> start!115190 (= res!907115 (and (bvslt (size!45359 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45359 a!3742))))))

(assert (=> start!115190 e!773782))

(assert (=> start!115190 true))

(declare-fun array_inv!34089 (array!92759) Bool)

(assert (=> start!115190 (array_inv!34089 a!3742)))

(declare-fun b!1363947 () Bool)

(declare-fun res!907116 () Bool)

(assert (=> b!1363947 (=> (not res!907116) (not e!773782))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1363947 (= res!907116 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363948 () Bool)

(declare-fun res!907113 () Bool)

(assert (=> b!1363948 (=> (not res!907113) (not e!773782))))

(assert (=> b!1363948 (= res!907113 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!115190 res!907115) b!1363938))

(assert (= (and b!1363938 res!907118) b!1363943))

(assert (= (and b!1363943 res!907114) b!1363942))

(assert (= (and b!1363942 res!907119) b!1363944))

(assert (= (and b!1363944 res!907112) b!1363948))

(assert (= (and b!1363948 res!907113) b!1363945))

(assert (= (and b!1363945 res!907111) b!1363947))

(assert (= (and b!1363947 res!907116) b!1363946))

(assert (= (and b!1363946 res!907117) b!1363939))

(assert (= (and b!1363939 c!127861) b!1363941))

(assert (= (and b!1363939 (not c!127861)) b!1363940))

(declare-fun m!1249179 () Bool)

(assert (=> b!1363948 m!1249179))

(declare-fun m!1249181 () Bool)

(assert (=> b!1363941 m!1249181))

(declare-fun m!1249183 () Bool)

(assert (=> b!1363941 m!1249183))

(declare-fun m!1249185 () Bool)

(assert (=> b!1363941 m!1249185))

(declare-fun m!1249187 () Bool)

(assert (=> b!1363941 m!1249187))

(declare-fun m!1249189 () Bool)

(assert (=> b!1363941 m!1249189))

(assert (=> b!1363941 m!1249183))

(assert (=> b!1363941 m!1249185))

(declare-fun m!1249191 () Bool)

(assert (=> b!1363941 m!1249191))

(declare-fun m!1249193 () Bool)

(assert (=> b!1363942 m!1249193))

(declare-fun m!1249195 () Bool)

(assert (=> b!1363938 m!1249195))

(declare-fun m!1249197 () Bool)

(assert (=> start!115190 m!1249197))

(declare-fun m!1249199 () Bool)

(assert (=> b!1363947 m!1249199))

(assert (=> b!1363939 m!1249183))

(assert (=> b!1363939 m!1249183))

(declare-fun m!1249201 () Bool)

(assert (=> b!1363939 m!1249201))

(declare-fun m!1249203 () Bool)

(assert (=> b!1363943 m!1249203))

(declare-fun m!1249205 () Bool)

(assert (=> b!1363944 m!1249205))

(push 1)

(assert (not b!1363948))

(assert (not start!115190))

(assert (not b!1363944))

(assert (not b!1363947))

(assert (not b!1363939))

(assert (not b!1363943))

(assert (not b!1363941))

(assert (not b!1363938))

(assert (not b!1363942))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

