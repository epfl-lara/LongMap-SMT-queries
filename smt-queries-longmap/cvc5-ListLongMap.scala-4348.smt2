; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60178 () Bool)

(assert start!60178)

(declare-fun b!671066 () Bool)

(declare-fun e!383658 () Bool)

(declare-fun e!383660 () Bool)

(assert (=> b!671066 (= e!383658 e!383660)))

(declare-fun res!437655 () Bool)

(assert (=> b!671066 (=> (not res!437655) (not e!383660))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!671066 (= res!437655 (bvsle from!3004 i!1382))))

(declare-fun b!671067 () Bool)

(declare-fun res!437651 () Bool)

(declare-fun e!383659 () Bool)

(assert (=> b!671067 (=> (not res!437651) (not e!383659))))

(declare-datatypes ((List!12719 0))(
  ( (Nil!12716) (Cons!12715 (h!13763 (_ BitVec 64)) (t!18939 List!12719)) )
))
(declare-fun acc!681 () List!12719)

(declare-fun contains!3371 (List!12719 (_ BitVec 64)) Bool)

(assert (=> b!671067 (= res!437651 (not (contains!3371 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671068 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!671068 (= e!383660 (not (contains!3371 acc!681 k!2843)))))

(declare-fun b!671069 () Bool)

(declare-fun res!437657 () Bool)

(assert (=> b!671069 (=> (not res!437657) (not e!383659))))

(assert (=> b!671069 (= res!437657 (not (contains!3371 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671070 () Bool)

(declare-fun e!383657 () Bool)

(assert (=> b!671070 (= e!383657 (contains!3371 acc!681 k!2843))))

(declare-fun b!671071 () Bool)

(declare-fun res!437656 () Bool)

(assert (=> b!671071 (=> (not res!437656) (not e!383659))))

(declare-fun noDuplicate!645 (List!12719) Bool)

(assert (=> b!671071 (= res!437656 (noDuplicate!645 acc!681))))

(declare-fun b!671072 () Bool)

(declare-fun res!437652 () Bool)

(assert (=> b!671072 (=> (not res!437652) (not e!383659))))

(declare-datatypes ((array!39163 0))(
  ( (array!39164 (arr!18771 (Array (_ BitVec 32) (_ BitVec 64))) (size!19135 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39163)

(declare-fun arrayNoDuplicates!0 (array!39163 (_ BitVec 32) List!12719) Bool)

(assert (=> b!671072 (= res!437652 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12716))))

(declare-fun b!671073 () Bool)

(assert (=> b!671073 (= e!383659 false)))

(declare-fun lt!312259 () Bool)

(assert (=> b!671073 (= lt!312259 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!437654 () Bool)

(assert (=> start!60178 (=> (not res!437654) (not e!383659))))

(assert (=> start!60178 (= res!437654 (and (bvslt (size!19135 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19135 a!3626))))))

(assert (=> start!60178 e!383659))

(assert (=> start!60178 true))

(declare-fun array_inv!14630 (array!39163) Bool)

(assert (=> start!60178 (array_inv!14630 a!3626)))

(declare-fun b!671074 () Bool)

(declare-fun res!437658 () Bool)

(assert (=> b!671074 (=> (not res!437658) (not e!383659))))

(assert (=> b!671074 (= res!437658 e!383658)))

(declare-fun res!437659 () Bool)

(assert (=> b!671074 (=> res!437659 e!383658)))

(assert (=> b!671074 (= res!437659 e!383657)))

(declare-fun res!437653 () Bool)

(assert (=> b!671074 (=> (not res!437653) (not e!383657))))

(assert (=> b!671074 (= res!437653 (bvsgt from!3004 i!1382))))

(assert (= (and start!60178 res!437654) b!671071))

(assert (= (and b!671071 res!437656) b!671067))

(assert (= (and b!671067 res!437651) b!671069))

(assert (= (and b!671069 res!437657) b!671074))

(assert (= (and b!671074 res!437653) b!671070))

(assert (= (and b!671074 (not res!437659)) b!671066))

(assert (= (and b!671066 res!437655) b!671068))

(assert (= (and b!671074 res!437658) b!671072))

(assert (= (and b!671072 res!437652) b!671073))

(declare-fun m!641327 () Bool)

(assert (=> b!671072 m!641327))

(declare-fun m!641329 () Bool)

(assert (=> b!671069 m!641329))

(declare-fun m!641331 () Bool)

(assert (=> b!671068 m!641331))

(assert (=> b!671070 m!641331))

(declare-fun m!641333 () Bool)

(assert (=> start!60178 m!641333))

(declare-fun m!641335 () Bool)

(assert (=> b!671073 m!641335))

(declare-fun m!641337 () Bool)

(assert (=> b!671067 m!641337))

(declare-fun m!641339 () Bool)

(assert (=> b!671071 m!641339))

(push 1)

(assert (not b!671070))

(assert (not b!671069))

(assert (not b!671067))

(assert (not b!671072))

(assert (not start!60178))

(assert (not b!671073))

(assert (not b!671068))

(assert (not b!671071))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

