; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60138 () Bool)

(assert start!60138)

(declare-fun b!671196 () Bool)

(declare-fun res!438062 () Bool)

(declare-fun e!383555 () Bool)

(assert (=> b!671196 (=> (not res!438062) (not e!383555))))

(declare-datatypes ((array!39196 0))(
  ( (array!39197 (arr!18790 (Array (_ BitVec 32) (_ BitVec 64))) (size!19155 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39196)

(declare-datatypes ((List!12870 0))(
  ( (Nil!12867) (Cons!12866 (h!13911 (_ BitVec 64)) (t!19089 List!12870)) )
))
(declare-fun arrayNoDuplicates!0 (array!39196 (_ BitVec 32) List!12870) Bool)

(assert (=> b!671196 (= res!438062 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12867))))

(declare-fun b!671197 () Bool)

(declare-fun res!438058 () Bool)

(assert (=> b!671197 (=> (not res!438058) (not e!383555))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671197 (= res!438058 (validKeyInArray!0 k!2843))))

(declare-fun b!671198 () Bool)

(declare-fun res!438064 () Bool)

(assert (=> b!671198 (=> (not res!438064) (not e!383555))))

(declare-fun acc!681 () List!12870)

(declare-fun noDuplicate!661 (List!12870) Bool)

(assert (=> b!671198 (= res!438064 (noDuplicate!661 acc!681))))

(declare-fun b!671199 () Bool)

(declare-fun res!438065 () Bool)

(assert (=> b!671199 (=> (not res!438065) (not e!383555))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!671199 (= res!438065 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19155 a!3626))))))

(declare-fun b!671200 () Bool)

(assert (=> b!671200 (= e!383555 (not true))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!39196 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671200 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun b!671201 () Bool)

(declare-fun res!438052 () Bool)

(assert (=> b!671201 (=> (not res!438052) (not e!383555))))

(assert (=> b!671201 (= res!438052 (validKeyInArray!0 (select (arr!18790 a!3626) from!3004)))))

(declare-fun b!671202 () Bool)

(declare-fun res!438057 () Bool)

(assert (=> b!671202 (=> (not res!438057) (not e!383555))))

(declare-fun contains!3392 (List!12870 (_ BitVec 64)) Bool)

(assert (=> b!671202 (= res!438057 (not (contains!3392 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671203 () Bool)

(declare-fun res!438061 () Bool)

(assert (=> b!671203 (=> (not res!438061) (not e!383555))))

(assert (=> b!671203 (= res!438061 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!438055 () Bool)

(assert (=> start!60138 (=> (not res!438055) (not e!383555))))

(assert (=> start!60138 (= res!438055 (and (bvslt (size!19155 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19155 a!3626))))))

(assert (=> start!60138 e!383555))

(assert (=> start!60138 true))

(declare-fun array_inv!14673 (array!39196) Bool)

(assert (=> start!60138 (array_inv!14673 a!3626)))

(declare-fun b!671204 () Bool)

(declare-fun res!438067 () Bool)

(assert (=> b!671204 (=> (not res!438067) (not e!383555))))

(assert (=> b!671204 (= res!438067 (= (select (arr!18790 a!3626) from!3004) k!2843))))

(declare-fun b!671205 () Bool)

(declare-fun e!383552 () Bool)

(assert (=> b!671205 (= e!383552 (contains!3392 acc!681 k!2843))))

(declare-fun b!671206 () Bool)

(declare-fun e!383553 () Bool)

(declare-fun e!383554 () Bool)

(assert (=> b!671206 (= e!383553 e!383554)))

(declare-fun res!438054 () Bool)

(assert (=> b!671206 (=> (not res!438054) (not e!383554))))

(assert (=> b!671206 (= res!438054 (bvsle from!3004 i!1382))))

(declare-fun b!671207 () Bool)

(assert (=> b!671207 (= e!383554 (not (contains!3392 acc!681 k!2843)))))

(declare-fun b!671208 () Bool)

(declare-fun res!438053 () Bool)

(assert (=> b!671208 (=> (not res!438053) (not e!383555))))

(assert (=> b!671208 (= res!438053 (not (contains!3392 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671209 () Bool)

(declare-fun res!438056 () Bool)

(assert (=> b!671209 (=> (not res!438056) (not e!383555))))

(assert (=> b!671209 (= res!438056 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!671210 () Bool)

(declare-fun res!438063 () Bool)

(assert (=> b!671210 (=> (not res!438063) (not e!383555))))

(assert (=> b!671210 (= res!438063 e!383553)))

(declare-fun res!438059 () Bool)

(assert (=> b!671210 (=> res!438059 e!383553)))

(assert (=> b!671210 (= res!438059 e!383552)))

(declare-fun res!438066 () Bool)

(assert (=> b!671210 (=> (not res!438066) (not e!383552))))

(assert (=> b!671210 (= res!438066 (bvsgt from!3004 i!1382))))

(declare-fun b!671211 () Bool)

(declare-fun res!438060 () Bool)

(assert (=> b!671211 (=> (not res!438060) (not e!383555))))

(assert (=> b!671211 (= res!438060 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19155 a!3626)) (not (= from!3004 i!1382))))))

(assert (= (and start!60138 res!438055) b!671198))

(assert (= (and b!671198 res!438064) b!671208))

(assert (= (and b!671208 res!438053) b!671202))

(assert (= (and b!671202 res!438057) b!671210))

(assert (= (and b!671210 res!438066) b!671205))

(assert (= (and b!671210 (not res!438059)) b!671206))

(assert (= (and b!671206 res!438054) b!671207))

(assert (= (and b!671210 res!438063) b!671196))

(assert (= (and b!671196 res!438062) b!671209))

(assert (= (and b!671209 res!438056) b!671199))

(assert (= (and b!671199 res!438065) b!671197))

(assert (= (and b!671197 res!438058) b!671203))

(assert (= (and b!671203 res!438061) b!671211))

(assert (= (and b!671211 res!438060) b!671201))

(assert (= (and b!671201 res!438052) b!671204))

(assert (= (and b!671204 res!438067) b!671200))

(declare-fun m!640167 () Bool)

(assert (=> b!671207 m!640167))

(declare-fun m!640169 () Bool)

(assert (=> b!671198 m!640169))

(declare-fun m!640171 () Bool)

(assert (=> b!671197 m!640171))

(declare-fun m!640173 () Bool)

(assert (=> b!671208 m!640173))

(declare-fun m!640175 () Bool)

(assert (=> b!671204 m!640175))

(declare-fun m!640177 () Bool)

(assert (=> b!671203 m!640177))

(declare-fun m!640179 () Bool)

(assert (=> b!671200 m!640179))

(assert (=> b!671201 m!640175))

(assert (=> b!671201 m!640175))

(declare-fun m!640181 () Bool)

(assert (=> b!671201 m!640181))

(declare-fun m!640183 () Bool)

(assert (=> start!60138 m!640183))

(declare-fun m!640185 () Bool)

(assert (=> b!671209 m!640185))

(declare-fun m!640187 () Bool)

(assert (=> b!671196 m!640187))

(assert (=> b!671205 m!640167))

(declare-fun m!640189 () Bool)

(assert (=> b!671202 m!640189))

(push 1)

(assert (not b!671198))

(assert (not b!671209))

(assert (not b!671196))

(assert (not b!671201))

(assert (not b!671202))

(assert (not b!671203))

(assert (not b!671207))

(assert (not b!671205))

(assert (not b!671197))

(assert (not b!671200))

(assert (not b!671208))

(assert (not start!60138))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

