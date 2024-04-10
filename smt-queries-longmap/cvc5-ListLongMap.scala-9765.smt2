; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115712 () Bool)

(assert start!115712)

(declare-fun b!1368279 () Bool)

(declare-fun res!911791 () Bool)

(declare-fun e!775290 () Bool)

(assert (=> b!1368279 (=> (not res!911791) (not e!775290))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!92904 0))(
  ( (array!92905 (arr!44876 (Array (_ BitVec 32) (_ BitVec 64))) (size!45426 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92904)

(assert (=> b!1368279 (= res!911791 (bvslt from!3239 (size!45426 a!3861)))))

(declare-fun b!1368280 () Bool)

(declare-fun e!775289 () Bool)

(assert (=> b!1368280 (= e!775289 e!775290)))

(declare-fun res!911796 () Bool)

(assert (=> b!1368280 (=> (not res!911796) (not e!775290))))

(declare-datatypes ((List!31944 0))(
  ( (Nil!31941) (Cons!31940 (h!33149 (_ BitVec 64)) (t!46638 List!31944)) )
))
(declare-fun acc!866 () List!31944)

(declare-fun arrayNoDuplicates!0 (array!92904 (_ BitVec 32) List!31944) Bool)

(assert (=> b!1368280 (= res!911796 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45189 0))(
  ( (Unit!45190) )
))
(declare-fun lt!602038 () Unit!45189)

(declare-fun newAcc!98 () List!31944)

(declare-fun noDuplicateSubseq!215 (List!31944 List!31944) Unit!45189)

(assert (=> b!1368280 (= lt!602038 (noDuplicateSubseq!215 newAcc!98 acc!866))))

(declare-fun b!1368281 () Bool)

(declare-fun res!911788 () Bool)

(assert (=> b!1368281 (=> (not res!911788) (not e!775289))))

(declare-fun contains!9626 (List!31944 (_ BitVec 64)) Bool)

(assert (=> b!1368281 (= res!911788 (not (contains!9626 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368282 () Bool)

(declare-fun res!911789 () Bool)

(assert (=> b!1368282 (=> (not res!911789) (not e!775290))))

(assert (=> b!1368282 (= res!911789 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368283 () Bool)

(declare-fun res!911794 () Bool)

(assert (=> b!1368283 (=> (not res!911794) (not e!775289))))

(declare-fun subseq!1028 (List!31944 List!31944) Bool)

(assert (=> b!1368283 (= res!911794 (subseq!1028 newAcc!98 acc!866))))

(declare-fun res!911797 () Bool)

(assert (=> start!115712 (=> (not res!911797) (not e!775289))))

(assert (=> start!115712 (= res!911797 (and (bvslt (size!45426 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45426 a!3861))))))

(assert (=> start!115712 e!775289))

(declare-fun array_inv!33904 (array!92904) Bool)

(assert (=> start!115712 (array_inv!33904 a!3861)))

(assert (=> start!115712 true))

(declare-fun b!1368284 () Bool)

(declare-fun res!911795 () Bool)

(assert (=> b!1368284 (=> (not res!911795) (not e!775289))))

(declare-fun noDuplicate!2483 (List!31944) Bool)

(assert (=> b!1368284 (= res!911795 (noDuplicate!2483 acc!866))))

(declare-fun b!1368285 () Bool)

(declare-fun res!911792 () Bool)

(assert (=> b!1368285 (=> (not res!911792) (not e!775289))))

(assert (=> b!1368285 (= res!911792 (not (contains!9626 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368286 () Bool)

(declare-fun res!911793 () Bool)

(assert (=> b!1368286 (=> (not res!911793) (not e!775289))))

(assert (=> b!1368286 (= res!911793 (not (contains!9626 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368287 () Bool)

(declare-fun res!911787 () Bool)

(assert (=> b!1368287 (=> (not res!911787) (not e!775290))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368287 (= res!911787 (not (validKeyInArray!0 (select (arr!44876 a!3861) from!3239))))))

(declare-fun b!1368288 () Bool)

(declare-fun res!911790 () Bool)

(assert (=> b!1368288 (=> (not res!911790) (not e!775289))))

(assert (=> b!1368288 (= res!911790 (not (contains!9626 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368289 () Bool)

(assert (=> b!1368289 (= e!775290 false)))

(declare-fun lt!602037 () Bool)

(assert (=> b!1368289 (= lt!602037 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(assert (= (and start!115712 res!911797) b!1368284))

(assert (= (and b!1368284 res!911795) b!1368286))

(assert (= (and b!1368286 res!911793) b!1368281))

(assert (= (and b!1368281 res!911788) b!1368285))

(assert (= (and b!1368285 res!911792) b!1368288))

(assert (= (and b!1368288 res!911790) b!1368283))

(assert (= (and b!1368283 res!911794) b!1368280))

(assert (= (and b!1368280 res!911796) b!1368279))

(assert (= (and b!1368279 res!911791) b!1368287))

(assert (= (and b!1368287 res!911787) b!1368282))

(assert (= (and b!1368282 res!911789) b!1368289))

(declare-fun m!1252291 () Bool)

(assert (=> b!1368283 m!1252291))

(declare-fun m!1252293 () Bool)

(assert (=> start!115712 m!1252293))

(declare-fun m!1252295 () Bool)

(assert (=> b!1368286 m!1252295))

(declare-fun m!1252297 () Bool)

(assert (=> b!1368284 m!1252297))

(declare-fun m!1252299 () Bool)

(assert (=> b!1368288 m!1252299))

(declare-fun m!1252301 () Bool)

(assert (=> b!1368289 m!1252301))

(declare-fun m!1252303 () Bool)

(assert (=> b!1368287 m!1252303))

(assert (=> b!1368287 m!1252303))

(declare-fun m!1252305 () Bool)

(assert (=> b!1368287 m!1252305))

(declare-fun m!1252307 () Bool)

(assert (=> b!1368280 m!1252307))

(declare-fun m!1252309 () Bool)

(assert (=> b!1368280 m!1252309))

(declare-fun m!1252311 () Bool)

(assert (=> b!1368285 m!1252311))

(declare-fun m!1252313 () Bool)

(assert (=> b!1368281 m!1252313))

(push 1)

