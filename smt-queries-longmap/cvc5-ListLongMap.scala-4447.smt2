; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61846 () Bool)

(assert start!61846)

(declare-fun b!691956 () Bool)

(declare-fun res!456176 () Bool)

(declare-fun e!393755 () Bool)

(assert (=> b!691956 (=> (not res!456176) (not e!393755))))

(declare-datatypes ((List!13016 0))(
  ( (Nil!13013) (Cons!13012 (h!14060 (_ BitVec 64)) (t!19275 List!13016)) )
))
(declare-fun acc!681 () List!13016)

(declare-fun contains!3668 (List!13016 (_ BitVec 64)) Bool)

(assert (=> b!691956 (= res!456176 (not (contains!3668 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691957 () Bool)

(declare-fun res!456178 () Bool)

(assert (=> b!691957 (=> (not res!456178) (not e!393755))))

(declare-datatypes ((array!39805 0))(
  ( (array!39806 (arr!19068 (Array (_ BitVec 32) (_ BitVec 64))) (size!19451 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39805)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691957 (= res!456178 (validKeyInArray!0 (select (arr!19068 a!3626) from!3004)))))

(declare-fun b!691958 () Bool)

(declare-fun res!456182 () Bool)

(assert (=> b!691958 (=> (not res!456182) (not e!393755))))

(declare-fun noDuplicate!942 (List!13016) Bool)

(assert (=> b!691958 (= res!456182 (noDuplicate!942 acc!681))))

(declare-fun b!691959 () Bool)

(declare-datatypes ((Unit!24389 0))(
  ( (Unit!24390) )
))
(declare-fun e!393758 () Unit!24389)

(declare-fun Unit!24391 () Unit!24389)

(assert (=> b!691959 (= e!393758 Unit!24391)))

(declare-fun b!691960 () Bool)

(assert (=> b!691960 (= e!393755 false)))

(declare-fun lt!316603 () Unit!24389)

(assert (=> b!691960 (= lt!316603 e!393758)))

(declare-fun c!78260 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!691960 (= c!78260 (= (select (arr!19068 a!3626) from!3004) k!2843))))

(declare-fun res!456186 () Bool)

(assert (=> start!61846 (=> (not res!456186) (not e!393755))))

(assert (=> start!61846 (= res!456186 (and (bvslt (size!19451 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19451 a!3626))))))

(assert (=> start!61846 e!393755))

(assert (=> start!61846 true))

(declare-fun array_inv!14927 (array!39805) Bool)

(assert (=> start!61846 (array_inv!14927 a!3626)))

(declare-fun b!691961 () Bool)

(declare-fun res!456187 () Bool)

(assert (=> b!691961 (=> (not res!456187) (not e!393755))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691961 (= res!456187 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19451 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691962 () Bool)

(declare-fun e!393759 () Bool)

(declare-fun e!393757 () Bool)

(assert (=> b!691962 (= e!393759 e!393757)))

(declare-fun res!456177 () Bool)

(assert (=> b!691962 (=> (not res!456177) (not e!393757))))

(assert (=> b!691962 (= res!456177 (bvsle from!3004 i!1382))))

(declare-fun b!691963 () Bool)

(declare-fun res!456184 () Bool)

(assert (=> b!691963 (=> (not res!456184) (not e!393755))))

(declare-fun arrayContainsKey!0 (array!39805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691963 (= res!456184 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!691964 () Bool)

(declare-fun res!456179 () Bool)

(assert (=> b!691964 (=> (not res!456179) (not e!393755))))

(assert (=> b!691964 (= res!456179 e!393759)))

(declare-fun res!456174 () Bool)

(assert (=> b!691964 (=> res!456174 e!393759)))

(declare-fun e!393754 () Bool)

(assert (=> b!691964 (= res!456174 e!393754)))

(declare-fun res!456175 () Bool)

(assert (=> b!691964 (=> (not res!456175) (not e!393754))))

(assert (=> b!691964 (= res!456175 (bvsgt from!3004 i!1382))))

(declare-fun b!691965 () Bool)

(assert (=> b!691965 (= e!393757 (not (contains!3668 acc!681 k!2843)))))

(declare-fun b!691966 () Bool)

(declare-fun res!456185 () Bool)

(assert (=> b!691966 (=> (not res!456185) (not e!393755))))

(assert (=> b!691966 (= res!456185 (not (contains!3668 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691967 () Bool)

(declare-fun res!456181 () Bool)

(assert (=> b!691967 (=> (not res!456181) (not e!393755))))

(declare-fun arrayNoDuplicates!0 (array!39805 (_ BitVec 32) List!13016) Bool)

(assert (=> b!691967 (= res!456181 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13013))))

(declare-fun b!691968 () Bool)

(declare-fun res!456180 () Bool)

(assert (=> b!691968 (=> (not res!456180) (not e!393755))))

(assert (=> b!691968 (= res!456180 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691969 () Bool)

(declare-fun res!456183 () Bool)

(assert (=> b!691969 (=> (not res!456183) (not e!393755))))

(assert (=> b!691969 (= res!456183 (validKeyInArray!0 k!2843))))

(declare-fun b!691970 () Bool)

(assert (=> b!691970 (= e!393754 (contains!3668 acc!681 k!2843))))

(declare-fun b!691971 () Bool)

(declare-fun Unit!24392 () Unit!24389)

(assert (=> b!691971 (= e!393758 Unit!24392)))

(assert (=> b!691971 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316602 () Unit!24389)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39805 (_ BitVec 64) (_ BitVec 32)) Unit!24389)

(assert (=> b!691971 (= lt!316602 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!691971 false))

(declare-fun b!691972 () Bool)

(declare-fun res!456173 () Bool)

(assert (=> b!691972 (=> (not res!456173) (not e!393755))))

(assert (=> b!691972 (= res!456173 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19451 a!3626))))))

(assert (= (and start!61846 res!456186) b!691958))

(assert (= (and b!691958 res!456182) b!691966))

(assert (= (and b!691966 res!456185) b!691956))

(assert (= (and b!691956 res!456176) b!691964))

(assert (= (and b!691964 res!456175) b!691970))

(assert (= (and b!691964 (not res!456174)) b!691962))

(assert (= (and b!691962 res!456177) b!691965))

(assert (= (and b!691964 res!456179) b!691967))

(assert (= (and b!691967 res!456181) b!691968))

(assert (= (and b!691968 res!456180) b!691972))

(assert (= (and b!691972 res!456173) b!691969))

(assert (= (and b!691969 res!456183) b!691963))

(assert (= (and b!691963 res!456184) b!691961))

(assert (= (and b!691961 res!456187) b!691957))

(assert (= (and b!691957 res!456178) b!691960))

(assert (= (and b!691960 c!78260) b!691971))

(assert (= (and b!691960 (not c!78260)) b!691959))

(declare-fun m!655313 () Bool)

(assert (=> b!691957 m!655313))

(assert (=> b!691957 m!655313))

(declare-fun m!655315 () Bool)

(assert (=> b!691957 m!655315))

(assert (=> b!691960 m!655313))

(declare-fun m!655317 () Bool)

(assert (=> b!691963 m!655317))

(declare-fun m!655319 () Bool)

(assert (=> b!691969 m!655319))

(declare-fun m!655321 () Bool)

(assert (=> b!691971 m!655321))

(declare-fun m!655323 () Bool)

(assert (=> b!691971 m!655323))

(declare-fun m!655325 () Bool)

(assert (=> b!691967 m!655325))

(declare-fun m!655327 () Bool)

(assert (=> b!691966 m!655327))

(declare-fun m!655329 () Bool)

(assert (=> b!691970 m!655329))

(declare-fun m!655331 () Bool)

(assert (=> start!61846 m!655331))

(assert (=> b!691965 m!655329))

(declare-fun m!655333 () Bool)

(assert (=> b!691958 m!655333))

(declare-fun m!655335 () Bool)

(assert (=> b!691956 m!655335))

(declare-fun m!655337 () Bool)

(assert (=> b!691968 m!655337))

(push 1)

(assert (not start!61846))

(assert (not b!691970))

(assert (not b!691966))

(assert (not b!691968))

(assert (not b!691967))

(assert (not b!691957))

(assert (not b!691958))

(assert (not b!691956))

(assert (not b!691971))

(assert (not b!691969))

(assert (not b!691963))

(assert (not b!691965))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

