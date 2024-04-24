; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59872 () Bool)

(assert start!59872)

(declare-fun b!661067 () Bool)

(declare-fun res!429026 () Bool)

(declare-fun e!379871 () Bool)

(assert (=> b!661067 (=> (not res!429026) (not e!379871))))

(declare-datatypes ((List!12566 0))(
  ( (Nil!12563) (Cons!12562 (h!13610 (_ BitVec 64)) (t!18786 List!12566)) )
))
(declare-fun acc!681 () List!12566)

(declare-fun contains!3218 (List!12566 (_ BitVec 64)) Bool)

(assert (=> b!661067 (= res!429026 (not (contains!3218 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661068 () Bool)

(declare-fun res!429020 () Bool)

(assert (=> b!661068 (=> (not res!429020) (not e!379871))))

(assert (=> b!661068 (= res!429020 (not (contains!3218 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661069 () Bool)

(declare-fun e!379868 () Bool)

(declare-fun e!379869 () Bool)

(assert (=> b!661069 (= e!379868 e!379869)))

(declare-fun res!429023 () Bool)

(assert (=> b!661069 (=> (not res!429023) (not e!379869))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!661069 (= res!429023 (bvsle from!3004 i!1382))))

(declare-fun b!661070 () Bool)

(declare-fun res!429021 () Bool)

(assert (=> b!661070 (=> (not res!429021) (not e!379871))))

(assert (=> b!661070 (= res!429021 e!379868)))

(declare-fun res!429025 () Bool)

(assert (=> b!661070 (=> res!429025 e!379868)))

(declare-fun e!379870 () Bool)

(assert (=> b!661070 (= res!429025 e!379870)))

(declare-fun res!429028 () Bool)

(assert (=> b!661070 (=> (not res!429028) (not e!379870))))

(assert (=> b!661070 (= res!429028 (bvsgt from!3004 i!1382))))

(declare-fun b!661071 () Bool)

(declare-fun res!429027 () Bool)

(assert (=> b!661071 (=> (not res!429027) (not e!379871))))

(declare-datatypes ((array!38857 0))(
  ( (array!38858 (arr!18618 (Array (_ BitVec 32) (_ BitVec 64))) (size!18982 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38857)

(declare-fun arrayNoDuplicates!0 (array!38857 (_ BitVec 32) List!12566) Bool)

(assert (=> b!661071 (= res!429027 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12563))))

(declare-fun res!429022 () Bool)

(assert (=> start!59872 (=> (not res!429022) (not e!379871))))

(assert (=> start!59872 (= res!429022 (and (bvslt (size!18982 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18982 a!3626))))))

(assert (=> start!59872 e!379871))

(assert (=> start!59872 true))

(declare-fun array_inv!14477 (array!38857) Bool)

(assert (=> start!59872 (array_inv!14477 a!3626)))

(declare-fun b!661072 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!661072 (= e!379869 (not (contains!3218 acc!681 k!2843)))))

(declare-fun b!661073 () Bool)

(assert (=> b!661073 (= e!379871 false)))

(declare-fun lt!308920 () Bool)

(assert (=> b!661073 (= lt!308920 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661074 () Bool)

(declare-fun res!429024 () Bool)

(assert (=> b!661074 (=> (not res!429024) (not e!379871))))

(declare-fun noDuplicate!492 (List!12566) Bool)

(assert (=> b!661074 (= res!429024 (noDuplicate!492 acc!681))))

(declare-fun b!661075 () Bool)

(assert (=> b!661075 (= e!379870 (contains!3218 acc!681 k!2843))))

(assert (= (and start!59872 res!429022) b!661074))

(assert (= (and b!661074 res!429024) b!661067))

(assert (= (and b!661067 res!429026) b!661068))

(assert (= (and b!661068 res!429020) b!661070))

(assert (= (and b!661070 res!429028) b!661075))

(assert (= (and b!661070 (not res!429025)) b!661069))

(assert (= (and b!661069 res!429023) b!661072))

(assert (= (and b!661070 res!429021) b!661071))

(assert (= (and b!661071 res!429027) b!661073))

(declare-fun m!634019 () Bool)

(assert (=> b!661068 m!634019))

(declare-fun m!634021 () Bool)

(assert (=> b!661075 m!634021))

(declare-fun m!634023 () Bool)

(assert (=> b!661073 m!634023))

(declare-fun m!634025 () Bool)

(assert (=> b!661074 m!634025))

(declare-fun m!634027 () Bool)

(assert (=> b!661071 m!634027))

(declare-fun m!634029 () Bool)

(assert (=> start!59872 m!634029))

(assert (=> b!661072 m!634021))

(declare-fun m!634031 () Bool)

(assert (=> b!661067 m!634031))

(push 1)

(assert (not b!661068))

(assert (not b!661067))

(assert (not start!59872))

(assert (not b!661075))

(assert (not b!661072))

(assert (not b!661071))

(assert (not b!661074))

(assert (not b!661073))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

