; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60306 () Bool)

(assert start!60306)

(declare-fun b!677095 () Bool)

(declare-fun res!443684 () Bool)

(declare-fun e!385970 () Bool)

(assert (=> b!677095 (=> (not res!443684) (not e!385970))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!677095 (= res!443684 (validKeyInArray!0 k!2843))))

(declare-fun b!677096 () Bool)

(declare-fun res!443683 () Bool)

(assert (=> b!677096 (=> (not res!443683) (not e!385970))))

(declare-datatypes ((array!39364 0))(
  ( (array!39365 (arr!18874 (Array (_ BitVec 32) (_ BitVec 64))) (size!19239 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39364)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!677096 (= res!443683 (not (validKeyInArray!0 (select (arr!18874 a!3626) from!3004))))))

(declare-fun b!677097 () Bool)

(declare-fun e!385972 () Bool)

(declare-datatypes ((List!12954 0))(
  ( (Nil!12951) (Cons!12950 (h!13995 (_ BitVec 64)) (t!19173 List!12954)) )
))
(declare-fun acc!681 () List!12954)

(declare-fun contains!3476 (List!12954 (_ BitVec 64)) Bool)

(assert (=> b!677097 (= e!385972 (contains!3476 acc!681 k!2843))))

(declare-fun b!677098 () Bool)

(declare-fun res!443701 () Bool)

(assert (=> b!677098 (=> (not res!443701) (not e!385970))))

(declare-fun e!385975 () Bool)

(assert (=> b!677098 (= res!443701 e!385975)))

(declare-fun res!443686 () Bool)

(assert (=> b!677098 (=> res!443686 e!385975)))

(assert (=> b!677098 (= res!443686 e!385972)))

(declare-fun res!443687 () Bool)

(assert (=> b!677098 (=> (not res!443687) (not e!385972))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677098 (= res!443687 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677099 () Bool)

(declare-fun res!443691 () Bool)

(assert (=> b!677099 (=> (not res!443691) (not e!385970))))

(declare-fun arrayNoDuplicates!0 (array!39364 (_ BitVec 32) List!12954) Bool)

(assert (=> b!677099 (= res!443691 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12951))))

(declare-fun b!677100 () Bool)

(declare-fun res!443697 () Bool)

(assert (=> b!677100 (=> (not res!443697) (not e!385970))))

(assert (=> b!677100 (= res!443697 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677101 () Bool)

(declare-fun res!443692 () Bool)

(assert (=> b!677101 (=> (not res!443692) (not e!385970))))

(declare-fun noDuplicate!745 (List!12954) Bool)

(assert (=> b!677101 (= res!443692 (noDuplicate!745 acc!681))))

(declare-fun b!677102 () Bool)

(declare-fun e!385971 () Bool)

(assert (=> b!677102 (= e!385975 e!385971)))

(declare-fun res!443700 () Bool)

(assert (=> b!677102 (=> (not res!443700) (not e!385971))))

(assert (=> b!677102 (= res!443700 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677103 () Bool)

(declare-fun e!385969 () Bool)

(assert (=> b!677103 (= e!385969 (contains!3476 acc!681 k!2843))))

(declare-fun b!677104 () Bool)

(declare-fun res!443696 () Bool)

(assert (=> b!677104 (=> (not res!443696) (not e!385970))))

(declare-fun arrayContainsKey!0 (array!39364 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!677104 (= res!443696 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!677105 () Bool)

(declare-fun res!443690 () Bool)

(assert (=> b!677105 (=> (not res!443690) (not e!385970))))

(assert (=> b!677105 (= res!443690 (not (contains!3476 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677106 () Bool)

(declare-fun res!443698 () Bool)

(assert (=> b!677106 (=> (not res!443698) (not e!385970))))

(assert (=> b!677106 (= res!443698 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19239 a!3626))))))

(declare-fun b!677107 () Bool)

(declare-fun res!443693 () Bool)

(assert (=> b!677107 (=> (not res!443693) (not e!385970))))

(assert (=> b!677107 (= res!443693 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!677108 () Bool)

(declare-fun e!385973 () Bool)

(assert (=> b!677108 (= e!385973 (not (contains!3476 acc!681 k!2843)))))

(declare-fun b!677109 () Bool)

(assert (=> b!677109 (= e!385970 (not true))))

(assert (=> b!677109 (arrayNoDuplicates!0 (array!39365 (store (arr!18874 a!3626) i!1382 k!2843) (size!19239 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-datatypes ((Unit!23748 0))(
  ( (Unit!23749) )
))
(declare-fun lt!312567 () Unit!23748)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39364 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12954) Unit!23748)

(assert (=> b!677109 (= lt!312567 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677110 () Bool)

(declare-fun e!385976 () Bool)

(assert (=> b!677110 (= e!385976 e!385973)))

(declare-fun res!443681 () Bool)

(assert (=> b!677110 (=> (not res!443681) (not e!385973))))

(assert (=> b!677110 (= res!443681 (bvsle from!3004 i!1382))))

(declare-fun b!677111 () Bool)

(declare-fun res!443699 () Bool)

(assert (=> b!677111 (=> (not res!443699) (not e!385970))))

(assert (=> b!677111 (= res!443699 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19239 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!677112 () Bool)

(declare-fun res!443694 () Bool)

(assert (=> b!677112 (=> (not res!443694) (not e!385970))))

(assert (=> b!677112 (= res!443694 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!677113 () Bool)

(assert (=> b!677113 (= e!385971 (not (contains!3476 acc!681 k!2843)))))

(declare-fun b!677114 () Bool)

(declare-fun res!443695 () Bool)

(assert (=> b!677114 (=> (not res!443695) (not e!385970))))

(assert (=> b!677114 (= res!443695 e!385976)))

(declare-fun res!443689 () Bool)

(assert (=> b!677114 (=> res!443689 e!385976)))

(assert (=> b!677114 (= res!443689 e!385969)))

(declare-fun res!443685 () Bool)

(assert (=> b!677114 (=> (not res!443685) (not e!385969))))

(assert (=> b!677114 (= res!443685 (bvsgt from!3004 i!1382))))

(declare-fun res!443682 () Bool)

(assert (=> start!60306 (=> (not res!443682) (not e!385970))))

(assert (=> start!60306 (= res!443682 (and (bvslt (size!19239 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19239 a!3626))))))

(assert (=> start!60306 e!385970))

(assert (=> start!60306 true))

(declare-fun array_inv!14757 (array!39364) Bool)

(assert (=> start!60306 (array_inv!14757 a!3626)))

(declare-fun b!677115 () Bool)

(declare-fun res!443688 () Bool)

(assert (=> b!677115 (=> (not res!443688) (not e!385970))))

(assert (=> b!677115 (= res!443688 (not (contains!3476 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60306 res!443682) b!677101))

(assert (= (and b!677101 res!443692) b!677105))

(assert (= (and b!677105 res!443690) b!677115))

(assert (= (and b!677115 res!443688) b!677114))

(assert (= (and b!677114 res!443685) b!677103))

(assert (= (and b!677114 (not res!443689)) b!677110))

(assert (= (and b!677110 res!443681) b!677108))

(assert (= (and b!677114 res!443695) b!677099))

(assert (= (and b!677099 res!443691) b!677112))

(assert (= (and b!677112 res!443694) b!677106))

(assert (= (and b!677106 res!443698) b!677095))

(assert (= (and b!677095 res!443684) b!677104))

(assert (= (and b!677104 res!443696) b!677111))

(assert (= (and b!677111 res!443699) b!677096))

(assert (= (and b!677096 res!443683) b!677107))

(assert (= (and b!677107 res!443693) b!677098))

(assert (= (and b!677098 res!443687) b!677097))

(assert (= (and b!677098 (not res!443686)) b!677102))

(assert (= (and b!677102 res!443700) b!677113))

(assert (= (and b!677098 res!443701) b!677100))

(assert (= (and b!677100 res!443697) b!677109))

(declare-fun m!642915 () Bool)

(assert (=> b!677097 m!642915))

(assert (=> b!677113 m!642915))

(declare-fun m!642917 () Bool)

(assert (=> b!677104 m!642917))

(declare-fun m!642919 () Bool)

(assert (=> b!677095 m!642919))

(declare-fun m!642921 () Bool)

(assert (=> b!677100 m!642921))

(declare-fun m!642923 () Bool)

(assert (=> start!60306 m!642923))

(declare-fun m!642925 () Bool)

(assert (=> b!677105 m!642925))

(declare-fun m!642927 () Bool)

(assert (=> b!677115 m!642927))

(declare-fun m!642929 () Bool)

(assert (=> b!677112 m!642929))

(assert (=> b!677108 m!642915))

(declare-fun m!642931 () Bool)

(assert (=> b!677109 m!642931))

(declare-fun m!642933 () Bool)

(assert (=> b!677109 m!642933))

(declare-fun m!642935 () Bool)

(assert (=> b!677109 m!642935))

(declare-fun m!642937 () Bool)

(assert (=> b!677099 m!642937))

(assert (=> b!677103 m!642915))

(declare-fun m!642939 () Bool)

(assert (=> b!677096 m!642939))

(assert (=> b!677096 m!642939))

(declare-fun m!642941 () Bool)

(assert (=> b!677096 m!642941))

(declare-fun m!642943 () Bool)

(assert (=> b!677101 m!642943))

(push 1)

(assert (not b!677095))

(assert (not b!677109))

(assert (not b!677105))

(assert (not b!677113))

(assert (not b!677103))

(assert (not b!677097))

(assert (not start!60306))

(assert (not b!677099))

(assert (not b!677108))

(assert (not b!677096))

(assert (not b!677101))

(assert (not b!677112))

(assert (not b!677115))

(assert (not b!677104))

(assert (not b!677100))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

