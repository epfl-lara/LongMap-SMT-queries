; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60990 () Bool)

(assert start!60990)

(declare-fun b!684111 () Bool)

(declare-fun res!449743 () Bool)

(declare-fun e!389646 () Bool)

(assert (=> b!684111 (=> res!449743 e!389646)))

(declare-datatypes ((List!13021 0))(
  ( (Nil!13018) (Cons!13017 (h!14062 (_ BitVec 64)) (t!19267 List!13021)) )
))
(declare-fun lt!314175 () List!13021)

(declare-fun noDuplicate!845 (List!13021) Bool)

(assert (=> b!684111 (= res!449743 (not (noDuplicate!845 lt!314175)))))

(declare-fun b!684112 () Bool)

(declare-datatypes ((Unit!24067 0))(
  ( (Unit!24068) )
))
(declare-fun e!389649 () Unit!24067)

(declare-fun Unit!24069 () Unit!24067)

(assert (=> b!684112 (= e!389649 Unit!24069)))

(declare-fun b!684113 () Bool)

(declare-fun res!449739 () Bool)

(declare-fun e!389648 () Bool)

(assert (=> b!684113 (=> (not res!449739) (not e!389648))))

(declare-datatypes ((array!39599 0))(
  ( (array!39600 (arr!18980 (Array (_ BitVec 32) (_ BitVec 64))) (size!19347 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39599)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!684113 (= res!449739 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!684114 () Bool)

(declare-fun e!389652 () Bool)

(declare-fun acc!681 () List!13021)

(declare-fun contains!3598 (List!13021 (_ BitVec 64)) Bool)

(assert (=> b!684114 (= e!389652 (contains!3598 acc!681 k!2843))))

(declare-fun b!684115 () Bool)

(assert (=> b!684115 (= e!389646 (not (contains!3598 acc!681 k!2843)))))

(declare-fun b!684116 () Bool)

(declare-fun res!449738 () Bool)

(assert (=> b!684116 (=> (not res!449738) (not e!389648))))

(declare-fun arrayNoDuplicates!0 (array!39599 (_ BitVec 32) List!13021) Bool)

(assert (=> b!684116 (= res!449738 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13018))))

(declare-fun b!684118 () Bool)

(assert (=> b!684118 (= e!389648 (not e!389646))))

(declare-fun res!449749 () Bool)

(assert (=> b!684118 (=> res!449749 e!389646)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!684118 (= res!449749 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!149 (List!13021 (_ BitVec 64)) List!13021)

(assert (=> b!684118 (= (-!149 lt!314175 k!2843) acc!681)))

(declare-fun $colon$colon!349 (List!13021 (_ BitVec 64)) List!13021)

(assert (=> b!684118 (= lt!314175 ($colon$colon!349 acc!681 k!2843))))

(declare-fun lt!314171 () Unit!24067)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13021) Unit!24067)

(assert (=> b!684118 (= lt!314171 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!184 (List!13021 List!13021) Bool)

(assert (=> b!684118 (subseq!184 acc!681 acc!681)))

(declare-fun lt!314176 () Unit!24067)

(declare-fun lemmaListSubSeqRefl!0 (List!13021) Unit!24067)

(assert (=> b!684118 (= lt!314176 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!684118 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314170 () Unit!24067)

(assert (=> b!684118 (= lt!314170 e!389649)))

(declare-fun c!77554 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!684118 (= c!77554 (validKeyInArray!0 (select (arr!18980 a!3626) from!3004)))))

(declare-fun lt!314172 () Unit!24067)

(declare-fun e!389647 () Unit!24067)

(assert (=> b!684118 (= lt!314172 e!389647)))

(declare-fun c!77555 () Bool)

(declare-fun lt!314169 () Bool)

(assert (=> b!684118 (= c!77555 lt!314169)))

(assert (=> b!684118 (= lt!314169 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!684118 (arrayContainsKey!0 (array!39600 (store (arr!18980 a!3626) i!1382 k!2843) (size!19347 a!3626)) k!2843 from!3004)))

(declare-fun b!684119 () Bool)

(declare-fun res!449750 () Bool)

(assert (=> b!684119 (=> res!449750 e!389646)))

(assert (=> b!684119 (= res!449750 lt!314169)))

(declare-fun b!684120 () Bool)

(declare-fun e!389651 () Bool)

(assert (=> b!684120 (= e!389651 (not (contains!3598 acc!681 k!2843)))))

(declare-fun b!684121 () Bool)

(declare-fun res!449745 () Bool)

(assert (=> b!684121 (=> (not res!449745) (not e!389648))))

(assert (=> b!684121 (= res!449745 (noDuplicate!845 acc!681))))

(declare-fun b!684122 () Bool)

(declare-fun res!449740 () Bool)

(assert (=> b!684122 (=> (not res!449740) (not e!389648))))

(assert (=> b!684122 (= res!449740 (not (contains!3598 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684123 () Bool)

(declare-fun Unit!24070 () Unit!24067)

(assert (=> b!684123 (= e!389647 Unit!24070)))

(declare-fun lt!314168 () Unit!24067)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39599 (_ BitVec 64) (_ BitVec 32)) Unit!24067)

(assert (=> b!684123 (= lt!314168 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!684123 false))

(declare-fun b!684124 () Bool)

(declare-fun res!449747 () Bool)

(assert (=> b!684124 (=> (not res!449747) (not e!389648))))

(assert (=> b!684124 (= res!449747 (not (contains!3598 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684125 () Bool)

(declare-fun res!449746 () Bool)

(assert (=> b!684125 (=> (not res!449746) (not e!389648))))

(assert (=> b!684125 (= res!449746 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19347 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!684126 () Bool)

(declare-fun res!449748 () Bool)

(assert (=> b!684126 (=> (not res!449748) (not e!389648))))

(assert (=> b!684126 (= res!449748 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19347 a!3626))))))

(declare-fun b!684127 () Bool)

(declare-fun e!389650 () Bool)

(assert (=> b!684127 (= e!389650 e!389651)))

(declare-fun res!449737 () Bool)

(assert (=> b!684127 (=> (not res!449737) (not e!389651))))

(assert (=> b!684127 (= res!449737 (bvsle from!3004 i!1382))))

(declare-fun b!684117 () Bool)

(declare-fun res!449752 () Bool)

(assert (=> b!684117 (=> (not res!449752) (not e!389648))))

(assert (=> b!684117 (= res!449752 e!389650)))

(declare-fun res!449741 () Bool)

(assert (=> b!684117 (=> res!449741 e!389650)))

(assert (=> b!684117 (= res!449741 e!389652)))

(declare-fun res!449744 () Bool)

(assert (=> b!684117 (=> (not res!449744) (not e!389652))))

(assert (=> b!684117 (= res!449744 (bvsgt from!3004 i!1382))))

(declare-fun res!449742 () Bool)

(assert (=> start!60990 (=> (not res!449742) (not e!389648))))

(assert (=> start!60990 (= res!449742 (and (bvslt (size!19347 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19347 a!3626))))))

(assert (=> start!60990 e!389648))

(assert (=> start!60990 true))

(declare-fun array_inv!14776 (array!39599) Bool)

(assert (=> start!60990 (array_inv!14776 a!3626)))

(declare-fun b!684128 () Bool)

(declare-fun Unit!24071 () Unit!24067)

(assert (=> b!684128 (= e!389647 Unit!24071)))

(declare-fun b!684129 () Bool)

(declare-fun res!449753 () Bool)

(assert (=> b!684129 (=> (not res!449753) (not e!389648))))

(assert (=> b!684129 (= res!449753 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!684130 () Bool)

(declare-fun lt!314174 () Unit!24067)

(assert (=> b!684130 (= e!389649 lt!314174)))

(declare-fun lt!314173 () Unit!24067)

(assert (=> b!684130 (= lt!314173 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!684130 (subseq!184 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39599 List!13021 List!13021 (_ BitVec 32)) Unit!24067)

(assert (=> b!684130 (= lt!314174 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!349 acc!681 (select (arr!18980 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684130 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!684131 () Bool)

(declare-fun res!449751 () Bool)

(assert (=> b!684131 (=> (not res!449751) (not e!389648))))

(assert (=> b!684131 (= res!449751 (validKeyInArray!0 k!2843))))

(assert (= (and start!60990 res!449742) b!684121))

(assert (= (and b!684121 res!449745) b!684124))

(assert (= (and b!684124 res!449747) b!684122))

(assert (= (and b!684122 res!449740) b!684117))

(assert (= (and b!684117 res!449744) b!684114))

(assert (= (and b!684117 (not res!449741)) b!684127))

(assert (= (and b!684127 res!449737) b!684120))

(assert (= (and b!684117 res!449752) b!684116))

(assert (= (and b!684116 res!449738) b!684129))

(assert (= (and b!684129 res!449753) b!684126))

(assert (= (and b!684126 res!449748) b!684131))

(assert (= (and b!684131 res!449751) b!684113))

(assert (= (and b!684113 res!449739) b!684125))

(assert (= (and b!684125 res!449746) b!684118))

(assert (= (and b!684118 c!77555) b!684123))

(assert (= (and b!684118 (not c!77555)) b!684128))

(assert (= (and b!684118 c!77554) b!684130))

(assert (= (and b!684118 (not c!77554)) b!684112))

(assert (= (and b!684118 (not res!449749)) b!684111))

(assert (= (and b!684111 (not res!449743)) b!684119))

(assert (= (and b!684119 (not res!449750)) b!684115))

(declare-fun m!648545 () Bool)

(assert (=> b!684111 m!648545))

(declare-fun m!648547 () Bool)

(assert (=> b!684122 m!648547))

(declare-fun m!648549 () Bool)

(assert (=> b!684129 m!648549))

(declare-fun m!648551 () Bool)

(assert (=> b!684131 m!648551))

(declare-fun m!648553 () Bool)

(assert (=> start!60990 m!648553))

(declare-fun m!648555 () Bool)

(assert (=> b!684116 m!648555))

(declare-fun m!648557 () Bool)

(assert (=> b!684130 m!648557))

(declare-fun m!648559 () Bool)

(assert (=> b!684130 m!648559))

(declare-fun m!648561 () Bool)

(assert (=> b!684130 m!648561))

(declare-fun m!648563 () Bool)

(assert (=> b!684130 m!648563))

(assert (=> b!684130 m!648559))

(assert (=> b!684130 m!648561))

(declare-fun m!648565 () Bool)

(assert (=> b!684130 m!648565))

(declare-fun m!648567 () Bool)

(assert (=> b!684130 m!648567))

(declare-fun m!648569 () Bool)

(assert (=> b!684120 m!648569))

(declare-fun m!648571 () Bool)

(assert (=> b!684113 m!648571))

(declare-fun m!648573 () Bool)

(assert (=> b!684123 m!648573))

(declare-fun m!648575 () Bool)

(assert (=> b!684121 m!648575))

(assert (=> b!684115 m!648569))

(declare-fun m!648577 () Bool)

(assert (=> b!684124 m!648577))

(assert (=> b!684114 m!648569))

(declare-fun m!648579 () Bool)

(assert (=> b!684118 m!648579))

(assert (=> b!684118 m!648557))

(assert (=> b!684118 m!648559))

(declare-fun m!648581 () Bool)

(assert (=> b!684118 m!648581))

(declare-fun m!648583 () Bool)

(assert (=> b!684118 m!648583))

(assert (=> b!684118 m!648565))

(declare-fun m!648585 () Bool)

(assert (=> b!684118 m!648585))

(declare-fun m!648587 () Bool)

(assert (=> b!684118 m!648587))

(assert (=> b!684118 m!648559))

(declare-fun m!648589 () Bool)

(assert (=> b!684118 m!648589))

(declare-fun m!648591 () Bool)

(assert (=> b!684118 m!648591))

(assert (=> b!684118 m!648567))

(push 1)

(assert (not b!684129))

(assert (not b!684130))

(assert (not b!684131))

(assert (not b!684115))

(assert (not b!684121))

(assert (not b!684111))

(assert (not b!684114))

(assert (not b!684118))

(assert (not b!684124))

(assert (not b!684122))

(assert (not start!60990))

(assert (not b!684123))

(assert (not b!684116))

(assert (not b!684120))

(assert (not b!684113))

(check-sat)

(pop 1)

(push 1)

(check-sat)

