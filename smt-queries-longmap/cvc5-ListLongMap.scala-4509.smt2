; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62522 () Bool)

(assert start!62522)

(declare-fun b!704296 () Bool)

(declare-fun res!468115 () Bool)

(declare-fun e!397705 () Bool)

(assert (=> b!704296 (=> (not res!468115) (not e!397705))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!704296 (= res!468115 (validKeyInArray!0 k!2824))))

(declare-fun b!704297 () Bool)

(declare-fun res!468121 () Bool)

(assert (=> b!704297 (=> (not res!468121) (not e!397705))))

(declare-datatypes ((List!13298 0))(
  ( (Nil!13295) (Cons!13294 (h!14339 (_ BitVec 64)) (t!19580 List!13298)) )
))
(declare-fun newAcc!49 () List!13298)

(declare-fun noDuplicate!1122 (List!13298) Bool)

(assert (=> b!704297 (= res!468121 (noDuplicate!1122 newAcc!49))))

(declare-fun b!704298 () Bool)

(declare-fun res!468111 () Bool)

(assert (=> b!704298 (=> (not res!468111) (not e!397705))))

(declare-fun contains!3875 (List!13298 (_ BitVec 64)) Bool)

(assert (=> b!704298 (= res!468111 (not (contains!3875 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704299 () Bool)

(declare-fun res!468119 () Bool)

(assert (=> b!704299 (=> (not res!468119) (not e!397705))))

(declare-fun acc!652 () List!13298)

(declare-fun -!285 (List!13298 (_ BitVec 64)) List!13298)

(assert (=> b!704299 (= res!468119 (= (-!285 newAcc!49 k!2824) acc!652))))

(declare-fun b!704300 () Bool)

(declare-fun res!468109 () Bool)

(assert (=> b!704300 (=> (not res!468109) (not e!397705))))

(declare-datatypes ((array!40201 0))(
  ( (array!40202 (arr!19257 (Array (_ BitVec 32) (_ BitVec 64))) (size!19642 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40201)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40201 (_ BitVec 32) List!13298) Bool)

(assert (=> b!704300 (= res!468109 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun res!468114 () Bool)

(assert (=> start!62522 (=> (not res!468114) (not e!397705))))

(assert (=> start!62522 (= res!468114 (and (bvslt (size!19642 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19642 a!3591))))))

(assert (=> start!62522 e!397705))

(assert (=> start!62522 true))

(declare-fun array_inv!15053 (array!40201) Bool)

(assert (=> start!62522 (array_inv!15053 a!3591)))

(declare-fun b!704301 () Bool)

(declare-fun res!468112 () Bool)

(assert (=> b!704301 (=> (not res!468112) (not e!397705))))

(declare-fun arrayContainsKey!0 (array!40201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!704301 (= res!468112 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!704302 () Bool)

(declare-fun res!468118 () Bool)

(assert (=> b!704302 (=> (not res!468118) (not e!397705))))

(assert (=> b!704302 (= res!468118 (not (contains!3875 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704303 () Bool)

(declare-fun res!468123 () Bool)

(assert (=> b!704303 (=> (not res!468123) (not e!397705))))

(assert (=> b!704303 (= res!468123 (not (contains!3875 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704304 () Bool)

(declare-fun res!468108 () Bool)

(assert (=> b!704304 (=> (not res!468108) (not e!397705))))

(assert (=> b!704304 (= res!468108 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!704305 () Bool)

(declare-fun res!468120 () Bool)

(assert (=> b!704305 (=> (not res!468120) (not e!397705))))

(assert (=> b!704305 (= res!468120 (noDuplicate!1122 acc!652))))

(declare-fun b!704306 () Bool)

(declare-fun res!468122 () Bool)

(assert (=> b!704306 (=> (not res!468122) (not e!397705))))

(assert (=> b!704306 (= res!468122 (not (validKeyInArray!0 (select (arr!19257 a!3591) from!2969))))))

(declare-fun b!704307 () Bool)

(declare-fun res!468106 () Bool)

(assert (=> b!704307 (=> (not res!468106) (not e!397705))))

(declare-fun subseq!320 (List!13298 List!13298) Bool)

(assert (=> b!704307 (= res!468106 (subseq!320 acc!652 newAcc!49))))

(declare-fun b!704308 () Bool)

(declare-fun res!468117 () Bool)

(assert (=> b!704308 (=> (not res!468117) (not e!397705))))

(assert (=> b!704308 (= res!468117 (not (contains!3875 acc!652 k!2824)))))

(declare-fun b!704309 () Bool)

(declare-fun res!468116 () Bool)

(assert (=> b!704309 (=> (not res!468116) (not e!397705))))

(assert (=> b!704309 (= res!468116 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19642 a!3591)))))

(declare-fun b!704310 () Bool)

(declare-fun res!468107 () Bool)

(assert (=> b!704310 (=> (not res!468107) (not e!397705))))

(assert (=> b!704310 (= res!468107 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!704311 () Bool)

(declare-fun res!468113 () Bool)

(assert (=> b!704311 (=> (not res!468113) (not e!397705))))

(assert (=> b!704311 (= res!468113 (contains!3875 newAcc!49 k!2824))))

(declare-fun b!704312 () Bool)

(assert (=> b!704312 (= e!397705 false)))

(declare-fun lt!317835 () Bool)

(assert (=> b!704312 (= lt!317835 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!704313 () Bool)

(declare-fun res!468110 () Bool)

(assert (=> b!704313 (=> (not res!468110) (not e!397705))))

(assert (=> b!704313 (= res!468110 (not (contains!3875 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62522 res!468114) b!704305))

(assert (= (and b!704305 res!468120) b!704297))

(assert (= (and b!704297 res!468121) b!704303))

(assert (= (and b!704303 res!468123) b!704302))

(assert (= (and b!704302 res!468118) b!704301))

(assert (= (and b!704301 res!468112) b!704308))

(assert (= (and b!704308 res!468117) b!704296))

(assert (= (and b!704296 res!468115) b!704300))

(assert (= (and b!704300 res!468109) b!704307))

(assert (= (and b!704307 res!468106) b!704311))

(assert (= (and b!704311 res!468113) b!704299))

(assert (= (and b!704299 res!468119) b!704313))

(assert (= (and b!704313 res!468110) b!704298))

(assert (= (and b!704298 res!468111) b!704309))

(assert (= (and b!704309 res!468116) b!704306))

(assert (= (and b!704306 res!468122) b!704304))

(assert (= (and b!704304 res!468108) b!704310))

(assert (= (and b!704310 res!468107) b!704312))

(declare-fun m!662839 () Bool)

(assert (=> b!704299 m!662839))

(declare-fun m!662841 () Bool)

(assert (=> b!704297 m!662841))

(declare-fun m!662843 () Bool)

(assert (=> b!704311 m!662843))

(declare-fun m!662845 () Bool)

(assert (=> b!704303 m!662845))

(declare-fun m!662847 () Bool)

(assert (=> start!62522 m!662847))

(declare-fun m!662849 () Bool)

(assert (=> b!704306 m!662849))

(assert (=> b!704306 m!662849))

(declare-fun m!662851 () Bool)

(assert (=> b!704306 m!662851))

(declare-fun m!662853 () Bool)

(assert (=> b!704312 m!662853))

(declare-fun m!662855 () Bool)

(assert (=> b!704308 m!662855))

(declare-fun m!662857 () Bool)

(assert (=> b!704300 m!662857))

(declare-fun m!662859 () Bool)

(assert (=> b!704307 m!662859))

(declare-fun m!662861 () Bool)

(assert (=> b!704298 m!662861))

(declare-fun m!662863 () Bool)

(assert (=> b!704302 m!662863))

(declare-fun m!662865 () Bool)

(assert (=> b!704305 m!662865))

(declare-fun m!662867 () Bool)

(assert (=> b!704313 m!662867))

(declare-fun m!662869 () Bool)

(assert (=> b!704296 m!662869))

(declare-fun m!662871 () Bool)

(assert (=> b!704301 m!662871))

(declare-fun m!662873 () Bool)

(assert (=> b!704310 m!662873))

(push 1)

(assert (not b!704301))

(assert (not start!62522))

(assert (not b!704311))

(assert (not b!704297))

(assert (not b!704303))

(assert (not b!704307))

(assert (not b!704305))

(assert (not b!704308))

(assert (not b!704302))

(assert (not b!704313))

(assert (not b!704310))

(assert (not b!704296))

(assert (not b!704312))

(assert (not b!704298))

(assert (not b!704299))

(assert (not b!704306))

(assert (not b!704300))

(check-sat)

(pop 1)

