; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59914 () Bool)

(assert start!59914)

(declare-fun b!661944 () Bool)

(declare-fun res!429900 () Bool)

(declare-fun e!380187 () Bool)

(assert (=> b!661944 (=> (not res!429900) (not e!380187))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38899 0))(
  ( (array!38900 (arr!18639 (Array (_ BitVec 32) (_ BitVec 64))) (size!19003 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38899)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!661944 (= res!429900 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19003 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661945 () Bool)

(declare-fun res!429903 () Bool)

(assert (=> b!661945 (=> (not res!429903) (not e!380187))))

(assert (=> b!661945 (= res!429903 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19003 a!3626))))))

(declare-fun b!661946 () Bool)

(declare-fun res!429906 () Bool)

(assert (=> b!661946 (=> (not res!429906) (not e!380187))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661946 (= res!429906 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!429897 () Bool)

(assert (=> start!59914 (=> (not res!429897) (not e!380187))))

(assert (=> start!59914 (= res!429897 (and (bvslt (size!19003 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19003 a!3626))))))

(assert (=> start!59914 e!380187))

(assert (=> start!59914 true))

(declare-fun array_inv!14498 (array!38899) Bool)

(assert (=> start!59914 (array_inv!14498 a!3626)))

(declare-fun b!661947 () Bool)

(declare-fun res!429908 () Bool)

(assert (=> b!661947 (=> (not res!429908) (not e!380187))))

(declare-datatypes ((List!12587 0))(
  ( (Nil!12584) (Cons!12583 (h!13631 (_ BitVec 64)) (t!18807 List!12587)) )
))
(declare-fun acc!681 () List!12587)

(declare-fun arrayNoDuplicates!0 (array!38899 (_ BitVec 32) List!12587) Bool)

(assert (=> b!661947 (= res!429908 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661948 () Bool)

(declare-fun e!380186 () Bool)

(declare-fun contains!3239 (List!12587 (_ BitVec 64)) Bool)

(assert (=> b!661948 (= e!380186 (not (contains!3239 acc!681 k!2843)))))

(declare-fun b!661949 () Bool)

(declare-fun res!429904 () Bool)

(assert (=> b!661949 (=> (not res!429904) (not e!380187))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661949 (= res!429904 (validKeyInArray!0 k!2843))))

(declare-fun b!661950 () Bool)

(declare-fun res!429907 () Bool)

(assert (=> b!661950 (=> (not res!429907) (not e!380187))))

(declare-fun noDuplicate!513 (List!12587) Bool)

(assert (=> b!661950 (= res!429907 (noDuplicate!513 acc!681))))

(declare-fun b!661951 () Bool)

(declare-fun res!429901 () Bool)

(assert (=> b!661951 (=> (not res!429901) (not e!380187))))

(declare-fun e!380184 () Bool)

(assert (=> b!661951 (= res!429901 e!380184)))

(declare-fun res!429910 () Bool)

(assert (=> b!661951 (=> res!429910 e!380184)))

(declare-fun e!380185 () Bool)

(assert (=> b!661951 (= res!429910 e!380185)))

(declare-fun res!429898 () Bool)

(assert (=> b!661951 (=> (not res!429898) (not e!380185))))

(assert (=> b!661951 (= res!429898 (bvsgt from!3004 i!1382))))

(declare-fun b!661952 () Bool)

(declare-fun res!429902 () Bool)

(assert (=> b!661952 (=> (not res!429902) (not e!380187))))

(assert (=> b!661952 (= res!429902 (not (contains!3239 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661953 () Bool)

(assert (=> b!661953 (= e!380185 (contains!3239 acc!681 k!2843))))

(declare-fun b!661954 () Bool)

(declare-fun res!429905 () Bool)

(assert (=> b!661954 (=> (not res!429905) (not e!380187))))

(assert (=> b!661954 (= res!429905 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12584))))

(declare-fun b!661955 () Bool)

(declare-fun res!429899 () Bool)

(assert (=> b!661955 (=> (not res!429899) (not e!380187))))

(assert (=> b!661955 (= res!429899 (not (contains!3239 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661956 () Bool)

(assert (=> b!661956 (= e!380187 (not true))))

(assert (=> b!661956 (arrayContainsKey!0 (array!38900 (store (arr!18639 a!3626) i!1382 k!2843) (size!19003 a!3626)) k!2843 from!3004)))

(declare-fun b!661957 () Bool)

(assert (=> b!661957 (= e!380184 e!380186)))

(declare-fun res!429909 () Bool)

(assert (=> b!661957 (=> (not res!429909) (not e!380186))))

(assert (=> b!661957 (= res!429909 (bvsle from!3004 i!1382))))

(assert (= (and start!59914 res!429897) b!661950))

(assert (= (and b!661950 res!429907) b!661952))

(assert (= (and b!661952 res!429902) b!661955))

(assert (= (and b!661955 res!429899) b!661951))

(assert (= (and b!661951 res!429898) b!661953))

(assert (= (and b!661951 (not res!429910)) b!661957))

(assert (= (and b!661957 res!429909) b!661948))

(assert (= (and b!661951 res!429901) b!661954))

(assert (= (and b!661954 res!429905) b!661947))

(assert (= (and b!661947 res!429908) b!661945))

(assert (= (and b!661945 res!429903) b!661949))

(assert (= (and b!661949 res!429904) b!661946))

(assert (= (and b!661946 res!429906) b!661944))

(assert (= (and b!661944 res!429900) b!661956))

(declare-fun m!634473 () Bool)

(assert (=> b!661952 m!634473))

(declare-fun m!634475 () Bool)

(assert (=> b!661950 m!634475))

(declare-fun m!634477 () Bool)

(assert (=> b!661947 m!634477))

(declare-fun m!634479 () Bool)

(assert (=> start!59914 m!634479))

(declare-fun m!634481 () Bool)

(assert (=> b!661954 m!634481))

(declare-fun m!634483 () Bool)

(assert (=> b!661955 m!634483))

(declare-fun m!634485 () Bool)

(assert (=> b!661949 m!634485))

(declare-fun m!634487 () Bool)

(assert (=> b!661946 m!634487))

(declare-fun m!634489 () Bool)

(assert (=> b!661953 m!634489))

(declare-fun m!634491 () Bool)

(assert (=> b!661956 m!634491))

(declare-fun m!634493 () Bool)

(assert (=> b!661956 m!634493))

(assert (=> b!661948 m!634489))

(push 1)

(assert (not b!661949))

(assert (not b!661947))

(assert (not start!59914))

(assert (not b!661955))

(assert (not b!661946))

(assert (not b!661950))

(assert (not b!661953))

(assert (not b!661954))

(assert (not b!661948))

(assert (not b!661952))

(assert (not b!661956))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

