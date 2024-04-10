; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62342 () Bool)

(assert start!62342)

(declare-fun b!698295 () Bool)

(declare-fun e!397002 () Bool)

(assert (=> b!698295 (= e!397002 false)))

(declare-fun lt!317250 () Bool)

(declare-datatypes ((List!13208 0))(
  ( (Nil!13205) (Cons!13204 (h!14249 (_ BitVec 64)) (t!19490 List!13208)) )
))
(declare-fun acc!652 () List!13208)

(declare-fun contains!3785 (List!13208 (_ BitVec 64)) Bool)

(assert (=> b!698295 (= lt!317250 (contains!3785 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!462103 () Bool)

(assert (=> start!62342 (=> (not res!462103) (not e!397002))))

(declare-datatypes ((array!40021 0))(
  ( (array!40022 (arr!19167 (Array (_ BitVec 32) (_ BitVec 64))) (size!19552 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40021)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62342 (= res!462103 (and (bvslt (size!19552 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19552 a!3591))))))

(assert (=> start!62342 e!397002))

(declare-fun array_inv!14963 (array!40021) Bool)

(assert (=> start!62342 (array_inv!14963 a!3591)))

(assert (=> start!62342 true))

(declare-fun b!698292 () Bool)

(declare-fun res!462102 () Bool)

(assert (=> b!698292 (=> (not res!462102) (not e!397002))))

(declare-fun noDuplicate!1032 (List!13208) Bool)

(assert (=> b!698292 (= res!462102 (noDuplicate!1032 acc!652))))

(declare-fun b!698294 () Bool)

(declare-fun res!462104 () Bool)

(assert (=> b!698294 (=> (not res!462104) (not e!397002))))

(assert (=> b!698294 (= res!462104 (not (contains!3785 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698293 () Bool)

(declare-fun res!462105 () Bool)

(assert (=> b!698293 (=> (not res!462105) (not e!397002))))

(declare-fun newAcc!49 () List!13208)

(assert (=> b!698293 (= res!462105 (noDuplicate!1032 newAcc!49))))

(assert (= (and start!62342 res!462103) b!698292))

(assert (= (and b!698292 res!462102) b!698293))

(assert (= (and b!698293 res!462105) b!698294))

(assert (= (and b!698294 res!462104) b!698295))

(declare-fun m!658591 () Bool)

(assert (=> b!698294 m!658591))

(declare-fun m!658593 () Bool)

(assert (=> b!698293 m!658593))

(declare-fun m!658595 () Bool)

(assert (=> b!698295 m!658595))

(declare-fun m!658597 () Bool)

(assert (=> b!698292 m!658597))

(declare-fun m!658599 () Bool)

(assert (=> start!62342 m!658599))

(push 1)

(assert (not b!698294))

(assert (not b!698292))

(assert (not start!62342))

(assert (not b!698295))

(assert (not b!698293))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

