; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62552 () Bool)

(assert start!62552)

(declare-fun b!705106 () Bool)

(declare-fun res!468921 () Bool)

(declare-fun e!397794 () Bool)

(assert (=> b!705106 (=> (not res!468921) (not e!397794))))

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!705106 (= res!468921 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!705107 () Bool)

(declare-fun res!468918 () Bool)

(assert (=> b!705107 (=> (not res!468918) (not e!397794))))

(declare-datatypes ((array!40231 0))(
  ( (array!40232 (arr!19272 (Array (_ BitVec 32) (_ BitVec 64))) (size!19657 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40231)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!705107 (= res!468918 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!705108 () Bool)

(declare-fun res!468927 () Bool)

(assert (=> b!705108 (=> (not res!468927) (not e!397794))))

(declare-datatypes ((List!13313 0))(
  ( (Nil!13310) (Cons!13309 (h!14354 (_ BitVec 64)) (t!19595 List!13313)) )
))
(declare-fun newAcc!49 () List!13313)

(declare-fun contains!3890 (List!13313 (_ BitVec 64)) Bool)

(assert (=> b!705108 (= res!468927 (not (contains!3890 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705109 () Bool)

(declare-fun res!468919 () Bool)

(assert (=> b!705109 (=> (not res!468919) (not e!397794))))

(declare-fun acc!652 () List!13313)

(assert (=> b!705109 (= res!468919 (not (contains!3890 acc!652 k!2824)))))

(declare-fun b!705110 () Bool)

(declare-fun res!468928 () Bool)

(assert (=> b!705110 (=> (not res!468928) (not e!397794))))

(declare-fun subseq!335 (List!13313 List!13313) Bool)

(assert (=> b!705110 (= res!468928 (subseq!335 acc!652 newAcc!49))))

(declare-fun res!468933 () Bool)

(assert (=> start!62552 (=> (not res!468933) (not e!397794))))

(assert (=> start!62552 (= res!468933 (and (bvslt (size!19657 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19657 a!3591))))))

(assert (=> start!62552 e!397794))

(assert (=> start!62552 true))

(declare-fun array_inv!15068 (array!40231) Bool)

(assert (=> start!62552 (array_inv!15068 a!3591)))

(declare-fun b!705111 () Bool)

(declare-fun res!468925 () Bool)

(assert (=> b!705111 (=> (not res!468925) (not e!397794))))

(assert (=> b!705111 (= res!468925 (not (contains!3890 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705112 () Bool)

(declare-fun res!468920 () Bool)

(assert (=> b!705112 (=> (not res!468920) (not e!397794))))

(declare-fun -!300 (List!13313 (_ BitVec 64)) List!13313)

(assert (=> b!705112 (= res!468920 (= (-!300 newAcc!49 k!2824) acc!652))))

(declare-fun b!705113 () Bool)

(declare-fun res!468917 () Bool)

(assert (=> b!705113 (=> (not res!468917) (not e!397794))))

(assert (=> b!705113 (= res!468917 (not (contains!3890 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705114 () Bool)

(declare-fun res!468929 () Bool)

(assert (=> b!705114 (=> (not res!468929) (not e!397794))))

(assert (=> b!705114 (= res!468929 (contains!3890 newAcc!49 k!2824))))

(declare-fun b!705115 () Bool)

(declare-fun res!468932 () Bool)

(assert (=> b!705115 (=> (not res!468932) (not e!397794))))

(declare-fun noDuplicate!1137 (List!13313) Bool)

(assert (=> b!705115 (= res!468932 (noDuplicate!1137 newAcc!49))))

(declare-fun b!705116 () Bool)

(declare-fun res!468923 () Bool)

(assert (=> b!705116 (=> (not res!468923) (not e!397794))))

(assert (=> b!705116 (= res!468923 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19657 a!3591)))))

(declare-fun b!705117 () Bool)

(declare-fun res!468931 () Bool)

(assert (=> b!705117 (=> (not res!468931) (not e!397794))))

(assert (=> b!705117 (= res!468931 (noDuplicate!1137 acc!652))))

(declare-fun b!705118 () Bool)

(declare-fun res!468924 () Bool)

(assert (=> b!705118 (=> (not res!468924) (not e!397794))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!705118 (= res!468924 (validKeyInArray!0 k!2824))))

(declare-fun b!705119 () Bool)

(declare-fun res!468930 () Bool)

(assert (=> b!705119 (=> (not res!468930) (not e!397794))))

(assert (=> b!705119 (= res!468930 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!705120 () Bool)

(declare-fun res!468926 () Bool)

(assert (=> b!705120 (=> (not res!468926) (not e!397794))))

(assert (=> b!705120 (= res!468926 (not (validKeyInArray!0 (select (arr!19272 a!3591) from!2969))))))

(declare-fun b!705121 () Bool)

(declare-fun res!468916 () Bool)

(assert (=> b!705121 (=> (not res!468916) (not e!397794))))

(assert (=> b!705121 (= res!468916 (not (contains!3890 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705122 () Bool)

(assert (=> b!705122 (= e!397794 false)))

(declare-fun lt!317880 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40231 (_ BitVec 32) List!13313) Bool)

(assert (=> b!705122 (= lt!317880 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!705123 () Bool)

(declare-fun res!468922 () Bool)

(assert (=> b!705123 (=> (not res!468922) (not e!397794))))

(assert (=> b!705123 (= res!468922 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(assert (= (and start!62552 res!468933) b!705117))

(assert (= (and b!705117 res!468931) b!705115))

(assert (= (and b!705115 res!468932) b!705111))

(assert (= (and b!705111 res!468925) b!705121))

(assert (= (and b!705121 res!468916) b!705107))

(assert (= (and b!705107 res!468918) b!705109))

(assert (= (and b!705109 res!468919) b!705118))

(assert (= (and b!705118 res!468924) b!705123))

(assert (= (and b!705123 res!468922) b!705110))

(assert (= (and b!705110 res!468928) b!705114))

(assert (= (and b!705114 res!468929) b!705112))

(assert (= (and b!705112 res!468920) b!705108))

(assert (= (and b!705108 res!468927) b!705113))

(assert (= (and b!705113 res!468917) b!705116))

(assert (= (and b!705116 res!468923) b!705120))

(assert (= (and b!705120 res!468926) b!705106))

(assert (= (and b!705106 res!468921) b!705119))

(assert (= (and b!705119 res!468930) b!705122))

(declare-fun m!663379 () Bool)

(assert (=> b!705110 m!663379))

(declare-fun m!663381 () Bool)

(assert (=> b!705123 m!663381))

(declare-fun m!663383 () Bool)

(assert (=> b!705122 m!663383))

(declare-fun m!663385 () Bool)

(assert (=> start!62552 m!663385))

(declare-fun m!663387 () Bool)

(assert (=> b!705114 m!663387))

(declare-fun m!663389 () Bool)

(assert (=> b!705118 m!663389))

(declare-fun m!663391 () Bool)

(assert (=> b!705107 m!663391))

(declare-fun m!663393 () Bool)

(assert (=> b!705120 m!663393))

(assert (=> b!705120 m!663393))

(declare-fun m!663395 () Bool)

(assert (=> b!705120 m!663395))

(declare-fun m!663397 () Bool)

(assert (=> b!705109 m!663397))

(declare-fun m!663399 () Bool)

(assert (=> b!705115 m!663399))

(declare-fun m!663401 () Bool)

(assert (=> b!705108 m!663401))

(declare-fun m!663403 () Bool)

(assert (=> b!705119 m!663403))

(declare-fun m!663405 () Bool)

(assert (=> b!705117 m!663405))

(declare-fun m!663407 () Bool)

(assert (=> b!705112 m!663407))

(declare-fun m!663409 () Bool)

(assert (=> b!705113 m!663409))

(declare-fun m!663411 () Bool)

(assert (=> b!705111 m!663411))

(declare-fun m!663413 () Bool)

(assert (=> b!705121 m!663413))

(push 1)

(assert (not b!705117))

(assert (not start!62552))

(assert (not b!705119))

(assert (not b!705114))

(assert (not b!705123))

(assert (not b!705108))

(assert (not b!705109))

(assert (not b!705113))

(assert (not b!705111))

(assert (not b!705122))

(assert (not b!705115))

(assert (not b!705112))

(assert (not b!705121))

(assert (not b!705120))

(assert (not b!705107))

(assert (not b!705110))

(assert (not b!705118))

(check-sat)

(pop 1)

