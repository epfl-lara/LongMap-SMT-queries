; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60016 () Bool)

(assert start!60016)

(declare-fun b!667178 () Bool)

(declare-fun res!434437 () Bool)

(declare-fun e!381916 () Bool)

(assert (=> b!667178 (=> (not res!434437) (not e!381916))))

(declare-datatypes ((array!39063 0))(
  ( (array!39064 (arr!18724 (Array (_ BitVec 32) (_ BitVec 64))) (size!19088 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39063)

(declare-datatypes ((List!12765 0))(
  ( (Nil!12762) (Cons!12761 (h!13806 (_ BitVec 64)) (t!18993 List!12765)) )
))
(declare-fun arrayNoDuplicates!0 (array!39063 (_ BitVec 32) List!12765) Bool)

(assert (=> b!667178 (= res!434437 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12762))))

(declare-fun res!434446 () Bool)

(assert (=> start!60016 (=> (not res!434446) (not e!381916))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60016 (= res!434446 (and (bvslt (size!19088 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19088 a!3626))))))

(assert (=> start!60016 e!381916))

(assert (=> start!60016 true))

(declare-fun array_inv!14520 (array!39063) Bool)

(assert (=> start!60016 (array_inv!14520 a!3626)))

(declare-fun b!667179 () Bool)

(declare-fun res!434443 () Bool)

(assert (=> b!667179 (=> (not res!434443) (not e!381916))))

(declare-fun e!381917 () Bool)

(assert (=> b!667179 (= res!434443 e!381917)))

(declare-fun res!434439 () Bool)

(assert (=> b!667179 (=> res!434439 e!381917)))

(declare-fun e!381920 () Bool)

(assert (=> b!667179 (= res!434439 e!381920)))

(declare-fun res!434441 () Bool)

(assert (=> b!667179 (=> (not res!434441) (not e!381920))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!667179 (= res!434441 (bvsgt from!3004 i!1382))))

(declare-fun b!667180 () Bool)

(declare-fun res!434430 () Bool)

(assert (=> b!667180 (=> (not res!434430) (not e!381916))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!667180 (= res!434430 (validKeyInArray!0 k0!2843))))

(declare-fun b!667181 () Bool)

(declare-fun res!434449 () Bool)

(assert (=> b!667181 (=> (not res!434449) (not e!381916))))

(declare-fun acc!681 () List!12765)

(declare-fun contains!3342 (List!12765 (_ BitVec 64)) Bool)

(assert (=> b!667181 (= res!434449 (not (contains!3342 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667182 () Bool)

(declare-datatypes ((Unit!23345 0))(
  ( (Unit!23346) )
))
(declare-fun e!381915 () Unit!23345)

(declare-fun Unit!23347 () Unit!23345)

(assert (=> b!667182 (= e!381915 Unit!23347)))

(declare-fun b!667183 () Bool)

(declare-fun res!434440 () Bool)

(declare-fun e!381918 () Bool)

(assert (=> b!667183 (=> res!434440 e!381918)))

(declare-fun lt!310717 () List!12765)

(declare-fun subseq!81 (List!12765 List!12765) Bool)

(assert (=> b!667183 (= res!434440 (not (subseq!81 acc!681 lt!310717)))))

(declare-fun b!667184 () Bool)

(assert (=> b!667184 (= e!381918 true)))

(declare-fun lt!310720 () Bool)

(assert (=> b!667184 (= lt!310720 (contains!3342 lt!310717 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667185 () Bool)

(declare-fun res!434442 () Bool)

(assert (=> b!667185 (=> (not res!434442) (not e!381916))))

(assert (=> b!667185 (= res!434442 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!667186 () Bool)

(declare-fun res!434444 () Bool)

(assert (=> b!667186 (=> (not res!434444) (not e!381916))))

(assert (=> b!667186 (= res!434444 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19088 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!667187 () Bool)

(declare-fun res!434445 () Bool)

(assert (=> b!667187 (=> (not res!434445) (not e!381916))))

(assert (=> b!667187 (= res!434445 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19088 a!3626))))))

(declare-fun b!667188 () Bool)

(declare-fun e!381914 () Unit!23345)

(declare-fun Unit!23348 () Unit!23345)

(assert (=> b!667188 (= e!381914 Unit!23348)))

(declare-fun b!667189 () Bool)

(declare-fun Unit!23349 () Unit!23345)

(assert (=> b!667189 (= e!381915 Unit!23349)))

(declare-fun lt!310716 () Unit!23345)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39063 (_ BitVec 64) (_ BitVec 32)) Unit!23345)

(assert (=> b!667189 (= lt!310716 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!667189 false))

(declare-fun b!667190 () Bool)

(declare-fun e!381919 () Bool)

(assert (=> b!667190 (= e!381917 e!381919)))

(declare-fun res!434448 () Bool)

(assert (=> b!667190 (=> (not res!434448) (not e!381919))))

(assert (=> b!667190 (= res!434448 (bvsle from!3004 i!1382))))

(declare-fun b!667191 () Bool)

(declare-fun res!434431 () Bool)

(assert (=> b!667191 (=> (not res!434431) (not e!381916))))

(assert (=> b!667191 (= res!434431 (not (contains!3342 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667192 () Bool)

(declare-fun res!434434 () Bool)

(assert (=> b!667192 (=> (not res!434434) (not e!381916))))

(declare-fun arrayContainsKey!0 (array!39063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!667192 (= res!434434 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!667193 () Bool)

(declare-fun res!434432 () Bool)

(assert (=> b!667193 (=> res!434432 e!381918)))

(assert (=> b!667193 (= res!434432 (not (contains!3342 lt!310717 k0!2843)))))

(declare-fun b!667194 () Bool)

(declare-fun res!434436 () Bool)

(assert (=> b!667194 (=> res!434436 e!381918)))

(declare-fun noDuplicate!589 (List!12765) Bool)

(assert (=> b!667194 (= res!434436 (not (noDuplicate!589 lt!310717)))))

(declare-fun b!667195 () Bool)

(assert (=> b!667195 (= e!381920 (contains!3342 acc!681 k0!2843))))

(declare-fun b!667196 () Bool)

(declare-fun lt!310723 () Unit!23345)

(assert (=> b!667196 (= e!381914 lt!310723)))

(declare-fun lt!310715 () Unit!23345)

(declare-fun lemmaListSubSeqRefl!0 (List!12765) Unit!23345)

(assert (=> b!667196 (= lt!310715 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667196 (subseq!81 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39063 List!12765 List!12765 (_ BitVec 32)) Unit!23345)

(declare-fun $colon$colon!213 (List!12765 (_ BitVec 64)) List!12765)

(assert (=> b!667196 (= lt!310723 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!213 acc!681 (select (arr!18724 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667196 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!667197 () Bool)

(declare-fun res!434438 () Bool)

(assert (=> b!667197 (=> (not res!434438) (not e!381916))))

(assert (=> b!667197 (= res!434438 (noDuplicate!589 acc!681))))

(declare-fun b!667198 () Bool)

(assert (=> b!667198 (= e!381916 (not e!381918))))

(declare-fun res!434435 () Bool)

(assert (=> b!667198 (=> res!434435 e!381918)))

(assert (=> b!667198 (= res!434435 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!79 (List!12765 (_ BitVec 64)) List!12765)

(assert (=> b!667198 (= (-!79 lt!310717 k0!2843) acc!681)))

(assert (=> b!667198 (= lt!310717 ($colon$colon!213 acc!681 k0!2843))))

(declare-fun lt!310721 () Unit!23345)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12765) Unit!23345)

(assert (=> b!667198 (= lt!310721 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!667198 (subseq!81 acc!681 acc!681)))

(declare-fun lt!310719 () Unit!23345)

(assert (=> b!667198 (= lt!310719 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667198 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310722 () Unit!23345)

(assert (=> b!667198 (= lt!310722 e!381914)))

(declare-fun c!76741 () Bool)

(assert (=> b!667198 (= c!76741 (validKeyInArray!0 (select (arr!18724 a!3626) from!3004)))))

(declare-fun lt!310718 () Unit!23345)

(assert (=> b!667198 (= lt!310718 e!381915)))

(declare-fun c!76742 () Bool)

(declare-fun lt!310714 () Bool)

(assert (=> b!667198 (= c!76742 lt!310714)))

(assert (=> b!667198 (= lt!310714 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667198 (arrayContainsKey!0 (array!39064 (store (arr!18724 a!3626) i!1382 k0!2843) (size!19088 a!3626)) k0!2843 from!3004)))

(declare-fun b!667199 () Bool)

(assert (=> b!667199 (= e!381919 (not (contains!3342 acc!681 k0!2843)))))

(declare-fun b!667200 () Bool)

(declare-fun res!434447 () Bool)

(assert (=> b!667200 (=> res!434447 e!381918)))

(assert (=> b!667200 (= res!434447 lt!310714)))

(declare-fun b!667201 () Bool)

(declare-fun res!434450 () Bool)

(assert (=> b!667201 (=> res!434450 e!381918)))

(assert (=> b!667201 (= res!434450 (contains!3342 acc!681 k0!2843))))

(declare-fun b!667202 () Bool)

(declare-fun res!434433 () Bool)

(assert (=> b!667202 (=> res!434433 e!381918)))

(assert (=> b!667202 (= res!434433 (contains!3342 lt!310717 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!60016 res!434446) b!667197))

(assert (= (and b!667197 res!434438) b!667181))

(assert (= (and b!667181 res!434449) b!667191))

(assert (= (and b!667191 res!434431) b!667179))

(assert (= (and b!667179 res!434441) b!667195))

(assert (= (and b!667179 (not res!434439)) b!667190))

(assert (= (and b!667190 res!434448) b!667199))

(assert (= (and b!667179 res!434443) b!667178))

(assert (= (and b!667178 res!434437) b!667185))

(assert (= (and b!667185 res!434442) b!667187))

(assert (= (and b!667187 res!434445) b!667180))

(assert (= (and b!667180 res!434430) b!667192))

(assert (= (and b!667192 res!434434) b!667186))

(assert (= (and b!667186 res!434444) b!667198))

(assert (= (and b!667198 c!76742) b!667189))

(assert (= (and b!667198 (not c!76742)) b!667182))

(assert (= (and b!667198 c!76741) b!667196))

(assert (= (and b!667198 (not c!76741)) b!667188))

(assert (= (and b!667198 (not res!434435)) b!667194))

(assert (= (and b!667194 (not res!434436)) b!667200))

(assert (= (and b!667200 (not res!434447)) b!667201))

(assert (= (and b!667201 (not res!434450)) b!667183))

(assert (= (and b!667183 (not res!434440)) b!667193))

(assert (= (and b!667193 (not res!434432)) b!667202))

(assert (= (and b!667202 (not res!434433)) b!667184))

(declare-fun m!637789 () Bool)

(assert (=> b!667178 m!637789))

(declare-fun m!637791 () Bool)

(assert (=> b!667180 m!637791))

(declare-fun m!637793 () Bool)

(assert (=> start!60016 m!637793))

(declare-fun m!637795 () Bool)

(assert (=> b!667183 m!637795))

(declare-fun m!637797 () Bool)

(assert (=> b!667185 m!637797))

(declare-fun m!637799 () Bool)

(assert (=> b!667199 m!637799))

(declare-fun m!637801 () Bool)

(assert (=> b!667192 m!637801))

(assert (=> b!667195 m!637799))

(declare-fun m!637803 () Bool)

(assert (=> b!667193 m!637803))

(assert (=> b!667201 m!637799))

(declare-fun m!637805 () Bool)

(assert (=> b!667189 m!637805))

(declare-fun m!637807 () Bool)

(assert (=> b!667198 m!637807))

(declare-fun m!637809 () Bool)

(assert (=> b!667198 m!637809))

(declare-fun m!637811 () Bool)

(assert (=> b!667198 m!637811))

(declare-fun m!637813 () Bool)

(assert (=> b!667198 m!637813))

(declare-fun m!637815 () Bool)

(assert (=> b!667198 m!637815))

(declare-fun m!637817 () Bool)

(assert (=> b!667198 m!637817))

(declare-fun m!637819 () Bool)

(assert (=> b!667198 m!637819))

(declare-fun m!637821 () Bool)

(assert (=> b!667198 m!637821))

(assert (=> b!667198 m!637809))

(declare-fun m!637823 () Bool)

(assert (=> b!667198 m!637823))

(declare-fun m!637825 () Bool)

(assert (=> b!667198 m!637825))

(declare-fun m!637827 () Bool)

(assert (=> b!667198 m!637827))

(declare-fun m!637829 () Bool)

(assert (=> b!667191 m!637829))

(declare-fun m!637831 () Bool)

(assert (=> b!667181 m!637831))

(assert (=> b!667196 m!637807))

(assert (=> b!667196 m!637809))

(declare-fun m!637833 () Bool)

(assert (=> b!667196 m!637833))

(declare-fun m!637835 () Bool)

(assert (=> b!667196 m!637835))

(assert (=> b!667196 m!637809))

(assert (=> b!667196 m!637833))

(assert (=> b!667196 m!637817))

(assert (=> b!667196 m!637827))

(declare-fun m!637837 () Bool)

(assert (=> b!667184 m!637837))

(declare-fun m!637839 () Bool)

(assert (=> b!667197 m!637839))

(declare-fun m!637841 () Bool)

(assert (=> b!667194 m!637841))

(declare-fun m!637843 () Bool)

(assert (=> b!667202 m!637843))

(check-sat (not b!667189) (not b!667183) (not b!667195) (not b!667185) (not b!667199) (not b!667192) (not b!667193) (not b!667196) (not b!667184) (not b!667181) (not b!667191) (not b!667178) (not b!667194) (not start!60016) (not b!667180) (not b!667202) (not b!667197) (not b!667198) (not b!667201))
(check-sat)
