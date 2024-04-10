; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59802 () Bool)

(assert start!59802)

(declare-fun b!660681 () Bool)

(declare-fun e!379637 () Bool)

(declare-datatypes ((List!12658 0))(
  ( (Nil!12655) (Cons!12654 (h!13699 (_ BitVec 64)) (t!18886 List!12658)) )
))
(declare-fun acc!681 () List!12658)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3235 (List!12658 (_ BitVec 64)) Bool)

(assert (=> b!660681 (= e!379637 (contains!3235 acc!681 k!2843))))

(declare-fun b!660682 () Bool)

(declare-fun e!379640 () Bool)

(assert (=> b!660682 (= e!379640 false)))

(declare-datatypes ((array!38849 0))(
  ( (array!38850 (arr!18617 (Array (_ BitVec 32) (_ BitVec 64))) (size!18981 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38849)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!308800 () Bool)

(declare-fun arrayNoDuplicates!0 (array!38849 (_ BitVec 32) List!12658) Bool)

(assert (=> b!660682 (= lt!308800 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660683 () Bool)

(declare-fun res!428747 () Bool)

(assert (=> b!660683 (=> (not res!428747) (not e!379640))))

(assert (=> b!660683 (= res!428747 (not (contains!3235 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660684 () Bool)

(declare-fun res!428746 () Bool)

(assert (=> b!660684 (=> (not res!428746) (not e!379640))))

(assert (=> b!660684 (= res!428746 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12655))))

(declare-fun res!428748 () Bool)

(assert (=> start!59802 (=> (not res!428748) (not e!379640))))

(assert (=> start!59802 (= res!428748 (and (bvslt (size!18981 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18981 a!3626))))))

(assert (=> start!59802 e!379640))

(assert (=> start!59802 true))

(declare-fun array_inv!14413 (array!38849) Bool)

(assert (=> start!59802 (array_inv!14413 a!3626)))

(declare-fun b!660685 () Bool)

(declare-fun res!428753 () Bool)

(assert (=> b!660685 (=> (not res!428753) (not e!379640))))

(declare-fun noDuplicate!482 (List!12658) Bool)

(assert (=> b!660685 (= res!428753 (noDuplicate!482 acc!681))))

(declare-fun b!660686 () Bool)

(declare-fun e!379641 () Bool)

(declare-fun e!379638 () Bool)

(assert (=> b!660686 (= e!379641 e!379638)))

(declare-fun res!428751 () Bool)

(assert (=> b!660686 (=> (not res!428751) (not e!379638))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660686 (= res!428751 (bvsle from!3004 i!1382))))

(declare-fun b!660687 () Bool)

(declare-fun res!428749 () Bool)

(assert (=> b!660687 (=> (not res!428749) (not e!379640))))

(assert (=> b!660687 (= res!428749 (not (contains!3235 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660688 () Bool)

(declare-fun res!428752 () Bool)

(assert (=> b!660688 (=> (not res!428752) (not e!379640))))

(assert (=> b!660688 (= res!428752 e!379641)))

(declare-fun res!428750 () Bool)

(assert (=> b!660688 (=> res!428750 e!379641)))

(assert (=> b!660688 (= res!428750 e!379637)))

(declare-fun res!428745 () Bool)

(assert (=> b!660688 (=> (not res!428745) (not e!379637))))

(assert (=> b!660688 (= res!428745 (bvsgt from!3004 i!1382))))

(declare-fun b!660689 () Bool)

(assert (=> b!660689 (= e!379638 (not (contains!3235 acc!681 k!2843)))))

(assert (= (and start!59802 res!428748) b!660685))

(assert (= (and b!660685 res!428753) b!660683))

(assert (= (and b!660683 res!428747) b!660687))

(assert (= (and b!660687 res!428749) b!660688))

(assert (= (and b!660688 res!428745) b!660681))

(assert (= (and b!660688 (not res!428750)) b!660686))

(assert (= (and b!660686 res!428751) b!660689))

(assert (= (and b!660688 res!428752) b!660684))

(assert (= (and b!660684 res!428746) b!660682))

(declare-fun m!633237 () Bool)

(assert (=> b!660684 m!633237))

(declare-fun m!633239 () Bool)

(assert (=> b!660685 m!633239))

(declare-fun m!633241 () Bool)

(assert (=> start!59802 m!633241))

(declare-fun m!633243 () Bool)

(assert (=> b!660682 m!633243))

(declare-fun m!633245 () Bool)

(assert (=> b!660681 m!633245))

(assert (=> b!660689 m!633245))

(declare-fun m!633247 () Bool)

(assert (=> b!660683 m!633247))

(declare-fun m!633249 () Bool)

(assert (=> b!660687 m!633249))

(push 1)

(assert (not b!660681))

(assert (not b!660684))

(assert (not b!660689))

(assert (not b!660687))

(assert (not start!59802))

(assert (not b!660682))

(assert (not b!660683))

(assert (not b!660685))

(check-sat)

(pop 1)

