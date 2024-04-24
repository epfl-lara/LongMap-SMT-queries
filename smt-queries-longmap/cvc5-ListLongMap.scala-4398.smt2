; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60550 () Bool)

(assert start!60550)

(declare-fun b!680055 () Bool)

(declare-fun res!446271 () Bool)

(declare-fun e!387432 () Bool)

(assert (=> b!680055 (=> (not res!446271) (not e!387432))))

(declare-fun e!387428 () Bool)

(assert (=> b!680055 (= res!446271 e!387428)))

(declare-fun res!446273 () Bool)

(assert (=> b!680055 (=> res!446273 e!387428)))

(declare-fun e!387431 () Bool)

(assert (=> b!680055 (= res!446273 e!387431)))

(declare-fun res!446283 () Bool)

(assert (=> b!680055 (=> (not res!446283) (not e!387431))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!680055 (= res!446283 (bvsgt from!3004 i!1382))))

(declare-fun b!680057 () Bool)

(declare-fun e!387429 () Bool)

(assert (=> b!680057 (= e!387428 e!387429)))

(declare-fun res!446270 () Bool)

(assert (=> b!680057 (=> (not res!446270) (not e!387429))))

(assert (=> b!680057 (= res!446270 (bvsle from!3004 i!1382))))

(declare-fun b!680058 () Bool)

(declare-fun e!387427 () Bool)

(assert (=> b!680058 (= e!387432 (not e!387427))))

(declare-fun res!446279 () Bool)

(assert (=> b!680058 (=> res!446279 e!387427)))

(declare-datatypes ((array!39469 0))(
  ( (array!39470 (arr!18921 (Array (_ BitVec 32) (_ BitVec 64))) (size!19285 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39469)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!680058 (= res!446279 (not (validKeyInArray!0 (select (arr!18921 a!3626) from!3004))))))

(declare-datatypes ((Unit!23801 0))(
  ( (Unit!23802) )
))
(declare-fun lt!313080 () Unit!23801)

(declare-fun e!387426 () Unit!23801)

(assert (=> b!680058 (= lt!313080 e!387426)))

(declare-fun c!77261 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!680058 (= c!77261 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!680058 (arrayContainsKey!0 (array!39470 (store (arr!18921 a!3626) i!1382 k!2843) (size!19285 a!3626)) k!2843 from!3004)))

(declare-fun b!680059 () Bool)

(declare-fun res!446281 () Bool)

(assert (=> b!680059 (=> (not res!446281) (not e!387432))))

(assert (=> b!680059 (= res!446281 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19285 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!680060 () Bool)

(declare-fun res!446278 () Bool)

(assert (=> b!680060 (=> (not res!446278) (not e!387432))))

(declare-datatypes ((List!12869 0))(
  ( (Nil!12866) (Cons!12865 (h!13913 (_ BitVec 64)) (t!19089 List!12869)) )
))
(declare-fun acc!681 () List!12869)

(declare-fun arrayNoDuplicates!0 (array!39469 (_ BitVec 32) List!12869) Bool)

(assert (=> b!680060 (= res!446278 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!680061 () Bool)

(declare-fun res!446275 () Bool)

(assert (=> b!680061 (=> (not res!446275) (not e!387432))))

(assert (=> b!680061 (= res!446275 (validKeyInArray!0 k!2843))))

(declare-fun b!680062 () Bool)

(assert (=> b!680062 (= e!387427 true)))

(declare-fun subseq!130 (List!12869 List!12869) Bool)

(assert (=> b!680062 (subseq!130 acc!681 acc!681)))

(declare-fun lt!313081 () Unit!23801)

(declare-fun lemmaListSubSeqRefl!0 (List!12869) Unit!23801)

(assert (=> b!680062 (= lt!313081 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!680063 () Bool)

(declare-fun contains!3521 (List!12869 (_ BitVec 64)) Bool)

(assert (=> b!680063 (= e!387429 (not (contains!3521 acc!681 k!2843)))))

(declare-fun b!680064 () Bool)

(assert (=> b!680064 (= e!387431 (contains!3521 acc!681 k!2843))))

(declare-fun b!680065 () Bool)

(declare-fun res!446274 () Bool)

(assert (=> b!680065 (=> (not res!446274) (not e!387432))))

(assert (=> b!680065 (= res!446274 (not (contains!3521 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680056 () Bool)

(declare-fun res!446280 () Bool)

(assert (=> b!680056 (=> (not res!446280) (not e!387432))))

(declare-fun noDuplicate!795 (List!12869) Bool)

(assert (=> b!680056 (= res!446280 (noDuplicate!795 acc!681))))

(declare-fun res!446272 () Bool)

(assert (=> start!60550 (=> (not res!446272) (not e!387432))))

(assert (=> start!60550 (= res!446272 (and (bvslt (size!19285 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19285 a!3626))))))

(assert (=> start!60550 e!387432))

(assert (=> start!60550 true))

(declare-fun array_inv!14780 (array!39469) Bool)

(assert (=> start!60550 (array_inv!14780 a!3626)))

(declare-fun b!680066 () Bool)

(declare-fun res!446277 () Bool)

(assert (=> b!680066 (=> (not res!446277) (not e!387432))))

(assert (=> b!680066 (= res!446277 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!680067 () Bool)

(declare-fun Unit!23803 () Unit!23801)

(assert (=> b!680067 (= e!387426 Unit!23803)))

(declare-fun lt!313079 () Unit!23801)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39469 (_ BitVec 64) (_ BitVec 32)) Unit!23801)

(assert (=> b!680067 (= lt!313079 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!680067 false))

(declare-fun b!680068 () Bool)

(declare-fun res!446276 () Bool)

(assert (=> b!680068 (=> (not res!446276) (not e!387432))))

(assert (=> b!680068 (= res!446276 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12866))))

(declare-fun b!680069 () Bool)

(declare-fun Unit!23804 () Unit!23801)

(assert (=> b!680069 (= e!387426 Unit!23804)))

(declare-fun b!680070 () Bool)

(declare-fun res!446284 () Bool)

(assert (=> b!680070 (=> (not res!446284) (not e!387432))))

(assert (=> b!680070 (= res!446284 (not (contains!3521 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680071 () Bool)

(declare-fun res!446282 () Bool)

(assert (=> b!680071 (=> (not res!446282) (not e!387432))))

(assert (=> b!680071 (= res!446282 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19285 a!3626))))))

(assert (= (and start!60550 res!446272) b!680056))

(assert (= (and b!680056 res!446280) b!680065))

(assert (= (and b!680065 res!446274) b!680070))

(assert (= (and b!680070 res!446284) b!680055))

(assert (= (and b!680055 res!446283) b!680064))

(assert (= (and b!680055 (not res!446273)) b!680057))

(assert (= (and b!680057 res!446270) b!680063))

(assert (= (and b!680055 res!446271) b!680068))

(assert (= (and b!680068 res!446276) b!680060))

(assert (= (and b!680060 res!446278) b!680071))

(assert (= (and b!680071 res!446282) b!680061))

(assert (= (and b!680061 res!446275) b!680066))

(assert (= (and b!680066 res!446277) b!680059))

(assert (= (and b!680059 res!446281) b!680058))

(assert (= (and b!680058 c!77261) b!680067))

(assert (= (and b!680058 (not c!77261)) b!680069))

(assert (= (and b!680058 (not res!446279)) b!680062))

(declare-fun m!645783 () Bool)

(assert (=> b!680064 m!645783))

(declare-fun m!645785 () Bool)

(assert (=> b!680061 m!645785))

(declare-fun m!645787 () Bool)

(assert (=> b!680062 m!645787))

(declare-fun m!645789 () Bool)

(assert (=> b!680062 m!645789))

(assert (=> b!680063 m!645783))

(declare-fun m!645791 () Bool)

(assert (=> start!60550 m!645791))

(declare-fun m!645793 () Bool)

(assert (=> b!680068 m!645793))

(declare-fun m!645795 () Bool)

(assert (=> b!680060 m!645795))

(declare-fun m!645797 () Bool)

(assert (=> b!680065 m!645797))

(declare-fun m!645799 () Bool)

(assert (=> b!680067 m!645799))

(declare-fun m!645801 () Bool)

(assert (=> b!680056 m!645801))

(declare-fun m!645803 () Bool)

(assert (=> b!680066 m!645803))

(declare-fun m!645805 () Bool)

(assert (=> b!680058 m!645805))

(declare-fun m!645807 () Bool)

(assert (=> b!680058 m!645807))

(declare-fun m!645809 () Bool)

(assert (=> b!680058 m!645809))

(assert (=> b!680058 m!645805))

(declare-fun m!645811 () Bool)

(assert (=> b!680058 m!645811))

(declare-fun m!645813 () Bool)

(assert (=> b!680058 m!645813))

(declare-fun m!645815 () Bool)

(assert (=> b!680070 m!645815))

(push 1)

(assert (not b!680064))

(assert (not b!680060))

(assert (not b!680067))

(assert (not b!680068))

(assert (not b!680062))

(assert (not b!680061))

(assert (not b!680070))

(assert (not b!680056))

(assert (not start!60550))

(assert (not b!680058))

(assert (not b!680065))

(assert (not b!680066))

(assert (not b!680063))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

