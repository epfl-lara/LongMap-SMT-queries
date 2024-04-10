; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60140 () Bool)

(assert start!60140)

(declare-fun b!671252 () Bool)

(declare-fun res!437955 () Bool)

(declare-fun e!383666 () Bool)

(assert (=> b!671252 (=> (not res!437955) (not e!383666))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39187 0))(
  ( (array!39188 (arr!18786 (Array (_ BitVec 32) (_ BitVec 64))) (size!19150 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39187)

(assert (=> b!671252 (= res!437955 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19150 a!3626))))))

(declare-fun b!671253 () Bool)

(assert (=> b!671253 (= e!383666 (not true))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!39187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671253 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun b!671254 () Bool)

(declare-fun e!383670 () Bool)

(declare-datatypes ((List!12827 0))(
  ( (Nil!12824) (Cons!12823 (h!13868 (_ BitVec 64)) (t!19055 List!12827)) )
))
(declare-fun acc!681 () List!12827)

(declare-fun contains!3404 (List!12827 (_ BitVec 64)) Bool)

(assert (=> b!671254 (= e!383670 (contains!3404 acc!681 k!2843))))

(declare-fun b!671255 () Bool)

(declare-fun res!437962 () Bool)

(assert (=> b!671255 (=> (not res!437962) (not e!383666))))

(declare-fun arrayNoDuplicates!0 (array!39187 (_ BitVec 32) List!12827) Bool)

(assert (=> b!671255 (= res!437962 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!671256 () Bool)

(declare-fun res!437954 () Bool)

(assert (=> b!671256 (=> (not res!437954) (not e!383666))))

(declare-fun noDuplicate!651 (List!12827) Bool)

(assert (=> b!671256 (= res!437954 (noDuplicate!651 acc!681))))

(declare-fun b!671257 () Bool)

(declare-fun res!437963 () Bool)

(assert (=> b!671257 (=> (not res!437963) (not e!383666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671257 (= res!437963 (validKeyInArray!0 k!2843))))

(declare-fun res!437958 () Bool)

(assert (=> start!60140 (=> (not res!437958) (not e!383666))))

(assert (=> start!60140 (= res!437958 (and (bvslt (size!19150 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19150 a!3626))))))

(assert (=> start!60140 e!383666))

(assert (=> start!60140 true))

(declare-fun array_inv!14582 (array!39187) Bool)

(assert (=> start!60140 (array_inv!14582 a!3626)))

(declare-fun b!671258 () Bool)

(declare-fun e!383669 () Bool)

(assert (=> b!671258 (= e!383669 (not (contains!3404 acc!681 k!2843)))))

(declare-fun b!671259 () Bool)

(declare-fun res!437956 () Bool)

(assert (=> b!671259 (=> (not res!437956) (not e!383666))))

(assert (=> b!671259 (= res!437956 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19150 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!671260 () Bool)

(declare-fun res!437960 () Bool)

(assert (=> b!671260 (=> (not res!437960) (not e!383666))))

(assert (=> b!671260 (= res!437960 (= (select (arr!18786 a!3626) from!3004) k!2843))))

(declare-fun b!671261 () Bool)

(declare-fun res!437957 () Bool)

(assert (=> b!671261 (=> (not res!437957) (not e!383666))))

(assert (=> b!671261 (= res!437957 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!671262 () Bool)

(declare-fun res!437953 () Bool)

(assert (=> b!671262 (=> (not res!437953) (not e!383666))))

(assert (=> b!671262 (= res!437953 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12824))))

(declare-fun b!671263 () Bool)

(declare-fun res!437948 () Bool)

(assert (=> b!671263 (=> (not res!437948) (not e!383666))))

(assert (=> b!671263 (= res!437948 (not (contains!3404 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671264 () Bool)

(declare-fun res!437950 () Bool)

(assert (=> b!671264 (=> (not res!437950) (not e!383666))))

(assert (=> b!671264 (= res!437950 (not (contains!3404 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671265 () Bool)

(declare-fun res!437961 () Bool)

(assert (=> b!671265 (=> (not res!437961) (not e!383666))))

(declare-fun e!383668 () Bool)

(assert (=> b!671265 (= res!437961 e!383668)))

(declare-fun res!437951 () Bool)

(assert (=> b!671265 (=> res!437951 e!383668)))

(assert (=> b!671265 (= res!437951 e!383670)))

(declare-fun res!437949 () Bool)

(assert (=> b!671265 (=> (not res!437949) (not e!383670))))

(assert (=> b!671265 (= res!437949 (bvsgt from!3004 i!1382))))

(declare-fun b!671266 () Bool)

(declare-fun res!437952 () Bool)

(assert (=> b!671266 (=> (not res!437952) (not e!383666))))

(assert (=> b!671266 (= res!437952 (validKeyInArray!0 (select (arr!18786 a!3626) from!3004)))))

(declare-fun b!671267 () Bool)

(assert (=> b!671267 (= e!383668 e!383669)))

(declare-fun res!437959 () Bool)

(assert (=> b!671267 (=> (not res!437959) (not e!383669))))

(assert (=> b!671267 (= res!437959 (bvsle from!3004 i!1382))))

(assert (= (and start!60140 res!437958) b!671256))

(assert (= (and b!671256 res!437954) b!671264))

(assert (= (and b!671264 res!437950) b!671263))

(assert (= (and b!671263 res!437948) b!671265))

(assert (= (and b!671265 res!437949) b!671254))

(assert (= (and b!671265 (not res!437951)) b!671267))

(assert (= (and b!671267 res!437959) b!671258))

(assert (= (and b!671265 res!437961) b!671262))

(assert (= (and b!671262 res!437953) b!671255))

(assert (= (and b!671255 res!437962) b!671252))

(assert (= (and b!671252 res!437955) b!671257))

(assert (= (and b!671257 res!437963) b!671261))

(assert (= (and b!671261 res!437957) b!671259))

(assert (= (and b!671259 res!437956) b!671266))

(assert (= (and b!671266 res!437952) b!671260))

(assert (= (and b!671260 res!437960) b!671253))

(declare-fun m!640829 () Bool)

(assert (=> b!671264 m!640829))

(declare-fun m!640831 () Bool)

(assert (=> b!671256 m!640831))

(declare-fun m!640833 () Bool)

(assert (=> b!671260 m!640833))

(assert (=> b!671266 m!640833))

(assert (=> b!671266 m!640833))

(declare-fun m!640835 () Bool)

(assert (=> b!671266 m!640835))

(declare-fun m!640837 () Bool)

(assert (=> b!671263 m!640837))

(declare-fun m!640839 () Bool)

(assert (=> b!671253 m!640839))

(declare-fun m!640841 () Bool)

(assert (=> b!671261 m!640841))

(declare-fun m!640843 () Bool)

(assert (=> b!671258 m!640843))

(declare-fun m!640845 () Bool)

(assert (=> b!671257 m!640845))

(declare-fun m!640847 () Bool)

(assert (=> start!60140 m!640847))

(declare-fun m!640849 () Bool)

(assert (=> b!671255 m!640849))

(declare-fun m!640851 () Bool)

(assert (=> b!671262 m!640851))

(assert (=> b!671254 m!640843))

(push 1)

(assert (not b!671256))

(assert (not b!671263))

(assert (not b!671262))

(assert (not b!671266))

(assert (not start!60140))

(assert (not b!671264))

(assert (not b!671254))

(assert (not b!671258))

(assert (not b!671255))

(assert (not b!671261))

(assert (not b!671253))

(assert (not b!671257))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

