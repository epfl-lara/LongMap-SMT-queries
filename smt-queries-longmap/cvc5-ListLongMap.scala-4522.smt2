; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62600 () Bool)

(assert start!62600)

(declare-fun b!706347 () Bool)

(declare-fun e!397938 () Bool)

(assert (=> b!706347 (= e!397938 false)))

(declare-fun lt!317943 () Bool)

(declare-datatypes ((List!13337 0))(
  ( (Nil!13334) (Cons!13333 (h!14378 (_ BitVec 64)) (t!19619 List!13337)) )
))
(declare-fun newAcc!49 () List!13337)

(declare-fun contains!3914 (List!13337 (_ BitVec 64)) Bool)

(assert (=> b!706347 (= lt!317943 (contains!3914 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!706348 () Bool)

(declare-fun res!470166 () Bool)

(assert (=> b!706348 (=> (not res!470166) (not e!397938))))

(assert (=> b!706348 (= res!470166 (not (contains!3914 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!470168 () Bool)

(assert (=> start!62600 (=> (not res!470168) (not e!397938))))

(declare-datatypes ((array!40279 0))(
  ( (array!40280 (arr!19296 (Array (_ BitVec 32) (_ BitVec 64))) (size!19681 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40279)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62600 (= res!470168 (and (bvslt (size!19681 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19681 a!3591))))))

(assert (=> start!62600 e!397938))

(assert (=> start!62600 true))

(declare-fun array_inv!15092 (array!40279) Bool)

(assert (=> start!62600 (array_inv!15092 a!3591)))

(declare-fun b!706349 () Bool)

(declare-fun res!470157 () Bool)

(assert (=> b!706349 (=> (not res!470157) (not e!397938))))

(declare-fun acc!652 () List!13337)

(declare-fun arrayNoDuplicates!0 (array!40279 (_ BitVec 32) List!13337) Bool)

(assert (=> b!706349 (= res!470157 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706350 () Bool)

(declare-fun res!470162 () Bool)

(assert (=> b!706350 (=> (not res!470162) (not e!397938))))

(declare-fun k!2824 () (_ BitVec 64))

(assert (=> b!706350 (= res!470162 (contains!3914 newAcc!49 k!2824))))

(declare-fun b!706351 () Bool)

(declare-fun res!470163 () Bool)

(assert (=> b!706351 (=> (not res!470163) (not e!397938))))

(assert (=> b!706351 (= res!470163 (not (contains!3914 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706352 () Bool)

(declare-fun res!470161 () Bool)

(assert (=> b!706352 (=> (not res!470161) (not e!397938))))

(declare-fun noDuplicate!1161 (List!13337) Bool)

(assert (=> b!706352 (= res!470161 (noDuplicate!1161 newAcc!49))))

(declare-fun b!706353 () Bool)

(declare-fun res!470167 () Bool)

(assert (=> b!706353 (=> (not res!470167) (not e!397938))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706353 (= res!470167 (validKeyInArray!0 k!2824))))

(declare-fun b!706354 () Bool)

(declare-fun res!470164 () Bool)

(assert (=> b!706354 (=> (not res!470164) (not e!397938))))

(assert (=> b!706354 (= res!470164 (noDuplicate!1161 acc!652))))

(declare-fun b!706355 () Bool)

(declare-fun res!470160 () Bool)

(assert (=> b!706355 (=> (not res!470160) (not e!397938))))

(assert (=> b!706355 (= res!470160 (not (contains!3914 acc!652 k!2824)))))

(declare-fun b!706356 () Bool)

(declare-fun res!470169 () Bool)

(assert (=> b!706356 (=> (not res!470169) (not e!397938))))

(declare-fun arrayContainsKey!0 (array!40279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706356 (= res!470169 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!706357 () Bool)

(declare-fun res!470159 () Bool)

(assert (=> b!706357 (=> (not res!470159) (not e!397938))))

(assert (=> b!706357 (= res!470159 (not (contains!3914 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706358 () Bool)

(declare-fun res!470165 () Bool)

(assert (=> b!706358 (=> (not res!470165) (not e!397938))))

(declare-fun -!324 (List!13337 (_ BitVec 64)) List!13337)

(assert (=> b!706358 (= res!470165 (= (-!324 newAcc!49 k!2824) acc!652))))

(declare-fun b!706359 () Bool)

(declare-fun res!470158 () Bool)

(assert (=> b!706359 (=> (not res!470158) (not e!397938))))

(declare-fun subseq!359 (List!13337 List!13337) Bool)

(assert (=> b!706359 (= res!470158 (subseq!359 acc!652 newAcc!49))))

(assert (= (and start!62600 res!470168) b!706354))

(assert (= (and b!706354 res!470164) b!706352))

(assert (= (and b!706352 res!470161) b!706351))

(assert (= (and b!706351 res!470163) b!706357))

(assert (= (and b!706357 res!470159) b!706356))

(assert (= (and b!706356 res!470169) b!706355))

(assert (= (and b!706355 res!470160) b!706353))

(assert (= (and b!706353 res!470167) b!706349))

(assert (= (and b!706349 res!470157) b!706359))

(assert (= (and b!706359 res!470158) b!706350))

(assert (= (and b!706350 res!470162) b!706358))

(assert (= (and b!706358 res!470165) b!706348))

(assert (= (and b!706348 res!470166) b!706347))

(declare-fun m!664243 () Bool)

(assert (=> start!62600 m!664243))

(declare-fun m!664245 () Bool)

(assert (=> b!706359 m!664245))

(declare-fun m!664247 () Bool)

(assert (=> b!706348 m!664247))

(declare-fun m!664249 () Bool)

(assert (=> b!706352 m!664249))

(declare-fun m!664251 () Bool)

(assert (=> b!706350 m!664251))

(declare-fun m!664253 () Bool)

(assert (=> b!706347 m!664253))

(declare-fun m!664255 () Bool)

(assert (=> b!706358 m!664255))

(declare-fun m!664257 () Bool)

(assert (=> b!706355 m!664257))

(declare-fun m!664259 () Bool)

(assert (=> b!706357 m!664259))

(declare-fun m!664261 () Bool)

(assert (=> b!706351 m!664261))

(declare-fun m!664263 () Bool)

(assert (=> b!706349 m!664263))

(declare-fun m!664265 () Bool)

(assert (=> b!706354 m!664265))

(declare-fun m!664267 () Bool)

(assert (=> b!706353 m!664267))

(declare-fun m!664269 () Bool)

(assert (=> b!706356 m!664269))

(push 1)

(assert (not b!706358))

(assert (not start!62600))

(assert (not b!706353))

(assert (not b!706348))

(assert (not b!706351))

(assert (not b!706350))

(assert (not b!706359))

(assert (not b!706349))

(assert (not b!706355))

(assert (not b!706356))

(assert (not b!706357))

(assert (not b!706352))

(assert (not b!706354))

(assert (not b!706347))

(check-sat)

