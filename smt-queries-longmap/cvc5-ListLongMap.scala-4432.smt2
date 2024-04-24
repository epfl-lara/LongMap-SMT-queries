; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61630 () Bool)

(assert start!61630)

(declare-fun b!689092 () Bool)

(declare-fun e!392442 () Bool)

(declare-datatypes ((List!12971 0))(
  ( (Nil!12968) (Cons!12967 (h!14015 (_ BitVec 64)) (t!19227 List!12971)) )
))
(declare-fun lt!316043 () List!12971)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3623 (List!12971 (_ BitVec 64)) Bool)

(assert (=> b!689092 (= e!392442 (not (contains!3623 lt!316043 k!2843)))))

(declare-fun b!689093 () Bool)

(declare-fun res!453635 () Bool)

(declare-fun e!392444 () Bool)

(assert (=> b!689093 (=> res!453635 e!392444)))

(assert (=> b!689093 (= res!453635 (contains!3623 lt!316043 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689094 () Bool)

(declare-fun e!392447 () Bool)

(assert (=> b!689094 (= e!392447 (contains!3623 lt!316043 k!2843))))

(declare-fun b!689095 () Bool)

(declare-fun res!453626 () Bool)

(assert (=> b!689095 (=> res!453626 e!392444)))

(assert (=> b!689095 (= res!453626 (contains!3623 lt!316043 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689097 () Bool)

(declare-fun res!453630 () Bool)

(declare-fun e!392445 () Bool)

(assert (=> b!689097 (=> (not res!453630) (not e!392445))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39709 0))(
  ( (array!39710 (arr!19023 (Array (_ BitVec 32) (_ BitVec 64))) (size!19403 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39709)

(assert (=> b!689097 (= res!453630 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19403 a!3626))))))

(declare-fun b!689098 () Bool)

(declare-datatypes ((Unit!24286 0))(
  ( (Unit!24287) )
))
(declare-fun e!392441 () Unit!24286)

(declare-fun lt!316047 () Unit!24286)

(assert (=> b!689098 (= e!392441 lt!316047)))

(declare-fun lt!316050 () Unit!24286)

(declare-fun acc!681 () List!12971)

(declare-fun lemmaListSubSeqRefl!0 (List!12971) Unit!24286)

(assert (=> b!689098 (= lt!316050 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!232 (List!12971 List!12971) Bool)

(assert (=> b!689098 (subseq!232 acc!681 acc!681)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39709 List!12971 List!12971 (_ BitVec 32)) Unit!24286)

(declare-fun $colon$colon!394 (List!12971 (_ BitVec 64)) List!12971)

(assert (=> b!689098 (= lt!316047 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!394 acc!681 (select (arr!19023 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39709 (_ BitVec 32) List!12971) Bool)

(assert (=> b!689098 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!689099 () Bool)

(declare-fun res!453636 () Bool)

(assert (=> b!689099 (=> (not res!453636) (not e!392445))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!689099 (= res!453636 (validKeyInArray!0 k!2843))))

(declare-fun b!689100 () Bool)

(declare-fun res!453633 () Bool)

(assert (=> b!689100 (=> (not res!453633) (not e!392445))))

(declare-fun arrayContainsKey!0 (array!39709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!689100 (= res!453633 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!689101 () Bool)

(declare-fun res!453617 () Bool)

(assert (=> b!689101 (=> res!453617 e!392444)))

(declare-fun noDuplicate!897 (List!12971) Bool)

(assert (=> b!689101 (= res!453617 (not (noDuplicate!897 lt!316043)))))

(declare-fun b!689102 () Bool)

(declare-fun res!453621 () Bool)

(assert (=> b!689102 (=> (not res!453621) (not e!392445))))

(assert (=> b!689102 (= res!453621 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19403 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!689103 () Bool)

(declare-fun e!392448 () Unit!24286)

(declare-fun Unit!24288 () Unit!24286)

(assert (=> b!689103 (= e!392448 Unit!24288)))

(declare-fun b!689104 () Bool)

(declare-fun e!392439 () Bool)

(assert (=> b!689104 (= e!392439 (not (contains!3623 acc!681 k!2843)))))

(declare-fun b!689105 () Bool)

(declare-fun Unit!24289 () Unit!24286)

(assert (=> b!689105 (= e!392448 Unit!24289)))

(declare-fun lt!316051 () Unit!24286)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39709 (_ BitVec 64) (_ BitVec 32)) Unit!24286)

(assert (=> b!689105 (= lt!316051 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!689105 false))

(declare-fun b!689106 () Bool)

(declare-fun res!453622 () Bool)

(assert (=> b!689106 (=> (not res!453622) (not e!392445))))

(assert (=> b!689106 (= res!453622 (noDuplicate!897 acc!681))))

(declare-fun b!689107 () Bool)

(declare-fun res!453637 () Bool)

(assert (=> b!689107 (=> (not res!453637) (not e!392445))))

(assert (=> b!689107 (= res!453637 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!453632 () Bool)

(assert (=> start!61630 (=> (not res!453632) (not e!392445))))

(assert (=> start!61630 (= res!453632 (and (bvslt (size!19403 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19403 a!3626))))))

(assert (=> start!61630 e!392445))

(assert (=> start!61630 true))

(declare-fun array_inv!14882 (array!39709) Bool)

(assert (=> start!61630 (array_inv!14882 a!3626)))

(declare-fun b!689096 () Bool)

(assert (=> b!689096 (= e!392445 (not e!392444))))

(declare-fun res!453620 () Bool)

(assert (=> b!689096 (=> res!453620 e!392444)))

(assert (=> b!689096 (= res!453620 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!689096 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316043)))

(declare-fun lt!316045 () Unit!24286)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39709 (_ BitVec 64) (_ BitVec 32) List!12971 List!12971) Unit!24286)

(assert (=> b!689096 (= lt!316045 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!316043))))

(declare-fun -!196 (List!12971 (_ BitVec 64)) List!12971)

(assert (=> b!689096 (= (-!196 lt!316043 k!2843) acc!681)))

(assert (=> b!689096 (= lt!316043 ($colon$colon!394 acc!681 k!2843))))

(declare-fun lt!316046 () Unit!24286)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12971) Unit!24286)

(assert (=> b!689096 (= lt!316046 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!689096 (subseq!232 acc!681 acc!681)))

(declare-fun lt!316044 () Unit!24286)

(assert (=> b!689096 (= lt!316044 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689096 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!316042 () Unit!24286)

(assert (=> b!689096 (= lt!316042 e!392441)))

(declare-fun c!78106 () Bool)

(assert (=> b!689096 (= c!78106 (validKeyInArray!0 (select (arr!19023 a!3626) from!3004)))))

(declare-fun lt!316048 () Unit!24286)

(assert (=> b!689096 (= lt!316048 e!392448)))

(declare-fun c!78107 () Bool)

(assert (=> b!689096 (= c!78107 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!689096 (arrayContainsKey!0 (array!39710 (store (arr!19023 a!3626) i!1382 k!2843) (size!19403 a!3626)) k!2843 from!3004)))

(declare-fun b!689108 () Bool)

(declare-fun res!453634 () Bool)

(assert (=> b!689108 (=> (not res!453634) (not e!392445))))

(assert (=> b!689108 (= res!453634 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12968))))

(declare-fun b!689109 () Bool)

(declare-fun e!392440 () Bool)

(assert (=> b!689109 (= e!392440 (contains!3623 acc!681 k!2843))))

(declare-fun b!689110 () Bool)

(declare-fun e!392443 () Bool)

(assert (=> b!689110 (= e!392443 e!392439)))

(declare-fun res!453619 () Bool)

(assert (=> b!689110 (=> (not res!453619) (not e!392439))))

(assert (=> b!689110 (= res!453619 (bvsle from!3004 i!1382))))

(declare-fun b!689111 () Bool)

(declare-fun e!392446 () Bool)

(assert (=> b!689111 (= e!392446 e!392442)))

(declare-fun res!453627 () Bool)

(assert (=> b!689111 (=> (not res!453627) (not e!392442))))

(assert (=> b!689111 (= res!453627 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689112 () Bool)

(declare-fun Unit!24290 () Unit!24286)

(assert (=> b!689112 (= e!392441 Unit!24290)))

(declare-fun b!689113 () Bool)

(declare-fun res!453629 () Bool)

(assert (=> b!689113 (=> (not res!453629) (not e!392445))))

(assert (=> b!689113 (= res!453629 e!392443)))

(declare-fun res!453628 () Bool)

(assert (=> b!689113 (=> res!453628 e!392443)))

(assert (=> b!689113 (= res!453628 e!392440)))

(declare-fun res!453623 () Bool)

(assert (=> b!689113 (=> (not res!453623) (not e!392440))))

(assert (=> b!689113 (= res!453623 (bvsgt from!3004 i!1382))))

(declare-fun b!689114 () Bool)

(declare-fun res!453625 () Bool)

(assert (=> b!689114 (=> (not res!453625) (not e!392445))))

(assert (=> b!689114 (= res!453625 (not (contains!3623 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689115 () Bool)

(assert (=> b!689115 (= e!392444 true)))

(declare-fun lt!316049 () Bool)

(assert (=> b!689115 (= lt!316049 e!392446)))

(declare-fun res!453624 () Bool)

(assert (=> b!689115 (=> res!453624 e!392446)))

(assert (=> b!689115 (= res!453624 e!392447)))

(declare-fun res!453618 () Bool)

(assert (=> b!689115 (=> (not res!453618) (not e!392447))))

(assert (=> b!689115 (= res!453618 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689116 () Bool)

(declare-fun res!453631 () Bool)

(assert (=> b!689116 (=> (not res!453631) (not e!392445))))

(assert (=> b!689116 (= res!453631 (not (contains!3623 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!61630 res!453632) b!689106))

(assert (= (and b!689106 res!453622) b!689114))

(assert (= (and b!689114 res!453625) b!689116))

(assert (= (and b!689116 res!453631) b!689113))

(assert (= (and b!689113 res!453623) b!689109))

(assert (= (and b!689113 (not res!453628)) b!689110))

(assert (= (and b!689110 res!453619) b!689104))

(assert (= (and b!689113 res!453629) b!689108))

(assert (= (and b!689108 res!453634) b!689107))

(assert (= (and b!689107 res!453637) b!689097))

(assert (= (and b!689097 res!453630) b!689099))

(assert (= (and b!689099 res!453636) b!689100))

(assert (= (and b!689100 res!453633) b!689102))

(assert (= (and b!689102 res!453621) b!689096))

(assert (= (and b!689096 c!78107) b!689105))

(assert (= (and b!689096 (not c!78107)) b!689103))

(assert (= (and b!689096 c!78106) b!689098))

(assert (= (and b!689096 (not c!78106)) b!689112))

(assert (= (and b!689096 (not res!453620)) b!689101))

(assert (= (and b!689101 (not res!453617)) b!689095))

(assert (= (and b!689095 (not res!453626)) b!689093))

(assert (= (and b!689093 (not res!453635)) b!689115))

(assert (= (and b!689115 res!453618) b!689094))

(assert (= (and b!689115 (not res!453624)) b!689111))

(assert (= (and b!689111 res!453627) b!689092))

(declare-fun m!653361 () Bool)

(assert (=> b!689116 m!653361))

(declare-fun m!653363 () Bool)

(assert (=> b!689106 m!653363))

(declare-fun m!653365 () Bool)

(assert (=> b!689098 m!653365))

(declare-fun m!653367 () Bool)

(assert (=> b!689098 m!653367))

(declare-fun m!653369 () Bool)

(assert (=> b!689098 m!653369))

(declare-fun m!653371 () Bool)

(assert (=> b!689098 m!653371))

(assert (=> b!689098 m!653367))

(assert (=> b!689098 m!653369))

(declare-fun m!653373 () Bool)

(assert (=> b!689098 m!653373))

(declare-fun m!653375 () Bool)

(assert (=> b!689098 m!653375))

(declare-fun m!653377 () Bool)

(assert (=> b!689101 m!653377))

(declare-fun m!653379 () Bool)

(assert (=> b!689114 m!653379))

(declare-fun m!653381 () Bool)

(assert (=> b!689094 m!653381))

(assert (=> b!689092 m!653381))

(declare-fun m!653383 () Bool)

(assert (=> b!689107 m!653383))

(declare-fun m!653385 () Bool)

(assert (=> b!689099 m!653385))

(declare-fun m!653387 () Bool)

(assert (=> b!689104 m!653387))

(declare-fun m!653389 () Bool)

(assert (=> b!689093 m!653389))

(declare-fun m!653391 () Bool)

(assert (=> b!689095 m!653391))

(declare-fun m!653393 () Bool)

(assert (=> start!61630 m!653393))

(declare-fun m!653395 () Bool)

(assert (=> b!689100 m!653395))

(assert (=> b!689109 m!653387))

(assert (=> b!689096 m!653365))

(assert (=> b!689096 m!653367))

(declare-fun m!653397 () Bool)

(assert (=> b!689096 m!653397))

(declare-fun m!653399 () Bool)

(assert (=> b!689096 m!653399))

(declare-fun m!653401 () Bool)

(assert (=> b!689096 m!653401))

(declare-fun m!653403 () Bool)

(assert (=> b!689096 m!653403))

(assert (=> b!689096 m!653373))

(declare-fun m!653405 () Bool)

(assert (=> b!689096 m!653405))

(assert (=> b!689096 m!653367))

(declare-fun m!653407 () Bool)

(assert (=> b!689096 m!653407))

(declare-fun m!653409 () Bool)

(assert (=> b!689096 m!653409))

(declare-fun m!653411 () Bool)

(assert (=> b!689096 m!653411))

(declare-fun m!653413 () Bool)

(assert (=> b!689096 m!653413))

(assert (=> b!689096 m!653375))

(declare-fun m!653415 () Bool)

(assert (=> b!689108 m!653415))

(declare-fun m!653417 () Bool)

(assert (=> b!689105 m!653417))

(push 1)

(assert (not b!689116))

(assert (not b!689100))

(assert (not b!689105))

(assert (not b!689107))

(assert (not b!689106))

(assert (not b!689092))

(assert (not b!689093))

(assert (not start!61630))

(assert (not b!689099))

(assert (not b!689096))

(assert (not b!689098))

(assert (not b!689104))

(assert (not b!689114))

(assert (not b!689095))

(assert (not b!689109))

(assert (not b!689094))

(assert (not b!689101))

(assert (not b!689108))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

