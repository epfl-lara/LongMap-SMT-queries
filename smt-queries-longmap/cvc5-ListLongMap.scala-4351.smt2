; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60196 () Bool)

(assert start!60196)

(declare-fun b!671428 () Bool)

(declare-fun res!438019 () Bool)

(declare-fun e!383794 () Bool)

(assert (=> b!671428 (=> (not res!438019) (not e!383794))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671428 (= res!438019 (validKeyInArray!0 k!2843))))

(declare-fun b!671429 () Bool)

(declare-fun e!383792 () Bool)

(declare-fun e!383795 () Bool)

(assert (=> b!671429 (= e!383792 e!383795)))

(declare-fun res!438023 () Bool)

(assert (=> b!671429 (=> (not res!438023) (not e!383795))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!671429 (= res!438023 (bvsle from!3004 i!1382))))

(declare-fun b!671430 () Bool)

(declare-fun res!438020 () Bool)

(assert (=> b!671430 (=> (not res!438020) (not e!383794))))

(declare-datatypes ((array!39181 0))(
  ( (array!39182 (arr!18780 (Array (_ BitVec 32) (_ BitVec 64))) (size!19144 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39181)

(assert (=> b!671430 (= res!438020 (validKeyInArray!0 (select (arr!18780 a!3626) from!3004)))))

(declare-fun b!671431 () Bool)

(declare-fun res!438016 () Bool)

(assert (=> b!671431 (=> (not res!438016) (not e!383794))))

(declare-datatypes ((List!12728 0))(
  ( (Nil!12725) (Cons!12724 (h!13772 (_ BitVec 64)) (t!18948 List!12728)) )
))
(declare-fun acc!681 () List!12728)

(declare-fun contains!3380 (List!12728 (_ BitVec 64)) Bool)

(assert (=> b!671431 (= res!438016 (not (contains!3380 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671432 () Bool)

(declare-fun res!438022 () Bool)

(assert (=> b!671432 (=> (not res!438022) (not e!383794))))

(declare-fun arrayNoDuplicates!0 (array!39181 (_ BitVec 32) List!12728) Bool)

(assert (=> b!671432 (= res!438022 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12725))))

(declare-fun b!671433 () Bool)

(assert (=> b!671433 (= e!383794 (not true))))

(declare-fun arrayContainsKey!0 (array!39181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671433 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun b!671434 () Bool)

(declare-fun e!383796 () Bool)

(assert (=> b!671434 (= e!383796 (contains!3380 acc!681 k!2843))))

(declare-fun b!671435 () Bool)

(assert (=> b!671435 (= e!383795 (not (contains!3380 acc!681 k!2843)))))

(declare-fun b!671436 () Bool)

(declare-fun res!438024 () Bool)

(assert (=> b!671436 (=> (not res!438024) (not e!383794))))

(assert (=> b!671436 (= res!438024 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!438018 () Bool)

(assert (=> start!60196 (=> (not res!438018) (not e!383794))))

(assert (=> start!60196 (= res!438018 (and (bvslt (size!19144 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19144 a!3626))))))

(assert (=> start!60196 e!383794))

(assert (=> start!60196 true))

(declare-fun array_inv!14639 (array!39181) Bool)

(assert (=> start!60196 (array_inv!14639 a!3626)))

(declare-fun b!671437 () Bool)

(declare-fun res!438015 () Bool)

(assert (=> b!671437 (=> (not res!438015) (not e!383794))))

(assert (=> b!671437 (= res!438015 (= (select (arr!18780 a!3626) from!3004) k!2843))))

(declare-fun b!671438 () Bool)

(declare-fun res!438027 () Bool)

(assert (=> b!671438 (=> (not res!438027) (not e!383794))))

(assert (=> b!671438 (= res!438027 e!383792)))

(declare-fun res!438017 () Bool)

(assert (=> b!671438 (=> res!438017 e!383792)))

(assert (=> b!671438 (= res!438017 e!383796)))

(declare-fun res!438013 () Bool)

(assert (=> b!671438 (=> (not res!438013) (not e!383796))))

(assert (=> b!671438 (= res!438013 (bvsgt from!3004 i!1382))))

(declare-fun b!671439 () Bool)

(declare-fun res!438026 () Bool)

(assert (=> b!671439 (=> (not res!438026) (not e!383794))))

(assert (=> b!671439 (= res!438026 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!671440 () Bool)

(declare-fun res!438014 () Bool)

(assert (=> b!671440 (=> (not res!438014) (not e!383794))))

(declare-fun noDuplicate!654 (List!12728) Bool)

(assert (=> b!671440 (= res!438014 (noDuplicate!654 acc!681))))

(declare-fun b!671441 () Bool)

(declare-fun res!438025 () Bool)

(assert (=> b!671441 (=> (not res!438025) (not e!383794))))

(assert (=> b!671441 (= res!438025 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19144 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!671442 () Bool)

(declare-fun res!438028 () Bool)

(assert (=> b!671442 (=> (not res!438028) (not e!383794))))

(assert (=> b!671442 (= res!438028 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19144 a!3626))))))

(declare-fun b!671443 () Bool)

(declare-fun res!438021 () Bool)

(assert (=> b!671443 (=> (not res!438021) (not e!383794))))

(assert (=> b!671443 (= res!438021 (not (contains!3380 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60196 res!438018) b!671440))

(assert (= (and b!671440 res!438014) b!671443))

(assert (= (and b!671443 res!438021) b!671431))

(assert (= (and b!671431 res!438016) b!671438))

(assert (= (and b!671438 res!438013) b!671434))

(assert (= (and b!671438 (not res!438017)) b!671429))

(assert (= (and b!671429 res!438023) b!671435))

(assert (= (and b!671438 res!438027) b!671432))

(assert (= (and b!671432 res!438022) b!671436))

(assert (= (and b!671436 res!438024) b!671442))

(assert (= (and b!671442 res!438028) b!671428))

(assert (= (and b!671428 res!438019) b!671439))

(assert (= (and b!671439 res!438026) b!671441))

(assert (= (and b!671441 res!438025) b!671430))

(assert (= (and b!671430 res!438020) b!671437))

(assert (= (and b!671437 res!438015) b!671433))

(declare-fun m!641503 () Bool)

(assert (=> b!671435 m!641503))

(declare-fun m!641505 () Bool)

(assert (=> b!671428 m!641505))

(declare-fun m!641507 () Bool)

(assert (=> b!671433 m!641507))

(declare-fun m!641509 () Bool)

(assert (=> b!671430 m!641509))

(assert (=> b!671430 m!641509))

(declare-fun m!641511 () Bool)

(assert (=> b!671430 m!641511))

(declare-fun m!641513 () Bool)

(assert (=> start!60196 m!641513))

(assert (=> b!671434 m!641503))

(declare-fun m!641515 () Bool)

(assert (=> b!671432 m!641515))

(assert (=> b!671437 m!641509))

(declare-fun m!641517 () Bool)

(assert (=> b!671436 m!641517))

(declare-fun m!641519 () Bool)

(assert (=> b!671443 m!641519))

(declare-fun m!641521 () Bool)

(assert (=> b!671439 m!641521))

(declare-fun m!641523 () Bool)

(assert (=> b!671440 m!641523))

(declare-fun m!641525 () Bool)

(assert (=> b!671431 m!641525))

(push 1)

(assert (not b!671436))

(assert (not b!671439))

(assert (not b!671434))

(assert (not b!671428))

(assert (not b!671430))

(assert (not b!671433))

(assert (not b!671431))

(assert (not start!60196))

(assert (not b!671440))

(assert (not b!671435))

(assert (not b!671443))

(assert (not b!671432))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

