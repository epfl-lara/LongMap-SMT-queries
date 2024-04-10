; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60154 () Bool)

(assert start!60154)

(declare-fun b!671638 () Bool)

(declare-fun e!383809 () Bool)

(declare-datatypes ((List!12834 0))(
  ( (Nil!12831) (Cons!12830 (h!13875 (_ BitVec 64)) (t!19062 List!12834)) )
))
(declare-fun lt!312187 () List!12834)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3411 (List!12834 (_ BitVec 64)) Bool)

(assert (=> b!671638 (= e!383809 (contains!3411 lt!312187 k0!2843))))

(declare-fun b!671639 () Bool)

(declare-fun res!438336 () Bool)

(declare-fun e!383810 () Bool)

(assert (=> b!671639 (=> (not res!438336) (not e!383810))))

(declare-datatypes ((array!39201 0))(
  ( (array!39202 (arr!18793 (Array (_ BitVec 32) (_ BitVec 64))) (size!19157 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39201)

(declare-fun arrayContainsKey!0 (array!39201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671639 (= res!438336 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!671640 () Bool)

(declare-fun res!438344 () Bool)

(assert (=> b!671640 (=> (not res!438344) (not e!383810))))

(declare-fun acc!681 () List!12834)

(assert (=> b!671640 (= res!438344 (not (contains!3411 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671641 () Bool)

(declare-fun res!438328 () Bool)

(assert (=> b!671641 (=> (not res!438328) (not e!383810))))

(declare-fun noDuplicate!658 (List!12834) Bool)

(assert (=> b!671641 (= res!438328 (noDuplicate!658 acc!681))))

(declare-fun b!671642 () Bool)

(declare-fun res!438332 () Bool)

(assert (=> b!671642 (=> (not res!438332) (not e!383810))))

(declare-fun arrayNoDuplicates!0 (array!39201 (_ BitVec 32) List!12834) Bool)

(assert (=> b!671642 (= res!438332 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12831))))

(declare-fun b!671643 () Bool)

(declare-fun res!438330 () Bool)

(assert (=> b!671643 (=> (not res!438330) (not e!383810))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671643 (= res!438330 (validKeyInArray!0 k0!2843))))

(declare-fun res!438340 () Bool)

(assert (=> start!60154 (=> (not res!438340) (not e!383810))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60154 (= res!438340 (and (bvslt (size!19157 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19157 a!3626))))))

(assert (=> start!60154 e!383810))

(assert (=> start!60154 true))

(declare-fun array_inv!14589 (array!39201) Bool)

(assert (=> start!60154 (array_inv!14589 a!3626)))

(declare-fun b!671644 () Bool)

(declare-fun e!383807 () Bool)

(assert (=> b!671644 (= e!383807 (not (contains!3411 lt!312187 k0!2843)))))

(declare-fun b!671645 () Bool)

(declare-fun e!383811 () Bool)

(assert (=> b!671645 (= e!383811 (not (contains!3411 acc!681 k0!2843)))))

(declare-fun b!671646 () Bool)

(declare-fun res!438327 () Bool)

(declare-fun e!383806 () Bool)

(assert (=> b!671646 (=> (not res!438327) (not e!383806))))

(assert (=> b!671646 (= res!438327 (noDuplicate!658 lt!312187))))

(declare-fun b!671647 () Bool)

(declare-fun res!438333 () Bool)

(assert (=> b!671647 (=> (not res!438333) (not e!383806))))

(assert (=> b!671647 (= res!438333 (not (contains!3411 lt!312187 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671648 () Bool)

(declare-fun res!438338 () Bool)

(assert (=> b!671648 (=> (not res!438338) (not e!383806))))

(assert (=> b!671648 (= res!438338 (not (contains!3411 lt!312187 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671649 () Bool)

(declare-fun e!383803 () Bool)

(assert (=> b!671649 (= e!383803 e!383806)))

(declare-fun res!438324 () Bool)

(assert (=> b!671649 (=> (not res!438324) (not e!383806))))

(assert (=> b!671649 (= res!438324 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!261 (List!12834 (_ BitVec 64)) List!12834)

(assert (=> b!671649 (= lt!312187 ($colon$colon!261 acc!681 (select (arr!18793 a!3626) from!3004)))))

(declare-fun b!671650 () Bool)

(declare-fun res!438337 () Bool)

(assert (=> b!671650 (=> (not res!438337) (not e!383810))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!671650 (= res!438337 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19157 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!671651 () Bool)

(declare-fun res!438341 () Bool)

(assert (=> b!671651 (=> (not res!438341) (not e!383810))))

(assert (=> b!671651 (= res!438341 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19157 a!3626))))))

(declare-fun b!671652 () Bool)

(declare-fun res!438345 () Bool)

(assert (=> b!671652 (=> (not res!438345) (not e!383810))))

(assert (=> b!671652 (= res!438345 (not (contains!3411 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671653 () Bool)

(declare-fun e!383805 () Bool)

(assert (=> b!671653 (= e!383805 (contains!3411 acc!681 k0!2843))))

(declare-fun b!671654 () Bool)

(declare-fun e!383802 () Bool)

(assert (=> b!671654 (= e!383802 e!383807)))

(declare-fun res!438335 () Bool)

(assert (=> b!671654 (=> (not res!438335) (not e!383807))))

(assert (=> b!671654 (= res!438335 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!671655 () Bool)

(declare-fun res!438329 () Bool)

(assert (=> b!671655 (=> (not res!438329) (not e!383806))))

(assert (=> b!671655 (= res!438329 e!383802)))

(declare-fun res!438326 () Bool)

(assert (=> b!671655 (=> res!438326 e!383802)))

(assert (=> b!671655 (= res!438326 e!383809)))

(declare-fun res!438325 () Bool)

(assert (=> b!671655 (=> (not res!438325) (not e!383809))))

(assert (=> b!671655 (= res!438325 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!671656 () Bool)

(declare-datatypes ((Unit!23584 0))(
  ( (Unit!23585) )
))
(declare-fun e!383804 () Unit!23584)

(declare-fun Unit!23586 () Unit!23584)

(assert (=> b!671656 (= e!383804 Unit!23586)))

(assert (=> b!671656 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312188 () Unit!23584)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39201 (_ BitVec 64) (_ BitVec 32)) Unit!23584)

(assert (=> b!671656 (= lt!312188 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!671656 false))

(declare-fun b!671657 () Bool)

(assert (=> b!671657 (= e!383806 false)))

(declare-fun lt!312190 () Bool)

(assert (=> b!671657 (= lt!312190 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312187))))

(declare-fun b!671658 () Bool)

(declare-fun res!438334 () Bool)

(assert (=> b!671658 (=> (not res!438334) (not e!383810))))

(declare-fun e!383801 () Bool)

(assert (=> b!671658 (= res!438334 e!383801)))

(declare-fun res!438347 () Bool)

(assert (=> b!671658 (=> res!438347 e!383801)))

(assert (=> b!671658 (= res!438347 e!383805)))

(declare-fun res!438346 () Bool)

(assert (=> b!671658 (=> (not res!438346) (not e!383805))))

(assert (=> b!671658 (= res!438346 (bvsgt from!3004 i!1382))))

(declare-fun b!671659 () Bool)

(assert (=> b!671659 (= e!383810 e!383803)))

(declare-fun res!438339 () Bool)

(assert (=> b!671659 (=> (not res!438339) (not e!383803))))

(assert (=> b!671659 (= res!438339 (not (= (select (arr!18793 a!3626) from!3004) k0!2843)))))

(declare-fun lt!312189 () Unit!23584)

(assert (=> b!671659 (= lt!312189 e!383804)))

(declare-fun c!77024 () Bool)

(assert (=> b!671659 (= c!77024 (= (select (arr!18793 a!3626) from!3004) k0!2843))))

(declare-fun b!671660 () Bool)

(declare-fun Unit!23587 () Unit!23584)

(assert (=> b!671660 (= e!383804 Unit!23587)))

(declare-fun b!671661 () Bool)

(declare-fun res!438343 () Bool)

(assert (=> b!671661 (=> (not res!438343) (not e!383810))))

(assert (=> b!671661 (= res!438343 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!671662 () Bool)

(declare-fun res!438342 () Bool)

(assert (=> b!671662 (=> (not res!438342) (not e!383810))))

(assert (=> b!671662 (= res!438342 (validKeyInArray!0 (select (arr!18793 a!3626) from!3004)))))

(declare-fun b!671663 () Bool)

(assert (=> b!671663 (= e!383801 e!383811)))

(declare-fun res!438331 () Bool)

(assert (=> b!671663 (=> (not res!438331) (not e!383811))))

(assert (=> b!671663 (= res!438331 (bvsle from!3004 i!1382))))

(assert (= (and start!60154 res!438340) b!671641))

(assert (= (and b!671641 res!438328) b!671640))

(assert (= (and b!671640 res!438344) b!671652))

(assert (= (and b!671652 res!438345) b!671658))

(assert (= (and b!671658 res!438346) b!671653))

(assert (= (and b!671658 (not res!438347)) b!671663))

(assert (= (and b!671663 res!438331) b!671645))

(assert (= (and b!671658 res!438334) b!671642))

(assert (= (and b!671642 res!438332) b!671661))

(assert (= (and b!671661 res!438343) b!671651))

(assert (= (and b!671651 res!438341) b!671643))

(assert (= (and b!671643 res!438330) b!671639))

(assert (= (and b!671639 res!438336) b!671650))

(assert (= (and b!671650 res!438337) b!671662))

(assert (= (and b!671662 res!438342) b!671659))

(assert (= (and b!671659 c!77024) b!671656))

(assert (= (and b!671659 (not c!77024)) b!671660))

(assert (= (and b!671659 res!438339) b!671649))

(assert (= (and b!671649 res!438324) b!671646))

(assert (= (and b!671646 res!438327) b!671648))

(assert (= (and b!671648 res!438338) b!671647))

(assert (= (and b!671647 res!438333) b!671655))

(assert (= (and b!671655 res!438325) b!671638))

(assert (= (and b!671655 (not res!438326)) b!671654))

(assert (= (and b!671654 res!438335) b!671644))

(assert (= (and b!671655 res!438329) b!671657))

(declare-fun m!641011 () Bool)

(assert (=> b!671644 m!641011))

(declare-fun m!641013 () Bool)

(assert (=> b!671639 m!641013))

(declare-fun m!641015 () Bool)

(assert (=> b!671656 m!641015))

(declare-fun m!641017 () Bool)

(assert (=> b!671656 m!641017))

(declare-fun m!641019 () Bool)

(assert (=> b!671662 m!641019))

(assert (=> b!671662 m!641019))

(declare-fun m!641021 () Bool)

(assert (=> b!671662 m!641021))

(declare-fun m!641023 () Bool)

(assert (=> b!671652 m!641023))

(declare-fun m!641025 () Bool)

(assert (=> b!671645 m!641025))

(assert (=> b!671638 m!641011))

(declare-fun m!641027 () Bool)

(assert (=> b!671643 m!641027))

(assert (=> b!671659 m!641019))

(assert (=> b!671653 m!641025))

(declare-fun m!641029 () Bool)

(assert (=> b!671646 m!641029))

(declare-fun m!641031 () Bool)

(assert (=> b!671648 m!641031))

(declare-fun m!641033 () Bool)

(assert (=> b!671657 m!641033))

(declare-fun m!641035 () Bool)

(assert (=> b!671647 m!641035))

(declare-fun m!641037 () Bool)

(assert (=> b!671661 m!641037))

(declare-fun m!641039 () Bool)

(assert (=> b!671642 m!641039))

(declare-fun m!641041 () Bool)

(assert (=> b!671641 m!641041))

(declare-fun m!641043 () Bool)

(assert (=> b!671640 m!641043))

(declare-fun m!641045 () Bool)

(assert (=> start!60154 m!641045))

(assert (=> b!671649 m!641019))

(assert (=> b!671649 m!641019))

(declare-fun m!641047 () Bool)

(assert (=> b!671649 m!641047))

(check-sat (not b!671649) (not start!60154) (not b!671639) (not b!671656) (not b!671661) (not b!671645) (not b!671644) (not b!671648) (not b!671653) (not b!671640) (not b!671642) (not b!671638) (not b!671643) (not b!671652) (not b!671646) (not b!671662) (not b!671647) (not b!671657) (not b!671641))
(check-sat)
