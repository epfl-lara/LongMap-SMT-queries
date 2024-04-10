; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62604 () Bool)

(assert start!62604)

(declare-fun b!706425 () Bool)

(declare-fun res!470237 () Bool)

(declare-fun e!397950 () Bool)

(assert (=> b!706425 (=> (not res!470237) (not e!397950))))

(declare-datatypes ((List!13339 0))(
  ( (Nil!13336) (Cons!13335 (h!14380 (_ BitVec 64)) (t!19621 List!13339)) )
))
(declare-fun newAcc!49 () List!13339)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun acc!652 () List!13339)

(declare-fun -!326 (List!13339 (_ BitVec 64)) List!13339)

(assert (=> b!706425 (= res!470237 (= (-!326 newAcc!49 k!2824) acc!652))))

(declare-fun b!706426 () Bool)

(declare-fun res!470243 () Bool)

(assert (=> b!706426 (=> (not res!470243) (not e!397950))))

(declare-fun noDuplicate!1163 (List!13339) Bool)

(assert (=> b!706426 (= res!470243 (noDuplicate!1163 acc!652))))

(declare-fun res!470236 () Bool)

(assert (=> start!62604 (=> (not res!470236) (not e!397950))))

(declare-datatypes ((array!40283 0))(
  ( (array!40284 (arr!19298 (Array (_ BitVec 32) (_ BitVec 64))) (size!19683 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40283)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62604 (= res!470236 (and (bvslt (size!19683 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19683 a!3591))))))

(assert (=> start!62604 e!397950))

(assert (=> start!62604 true))

(declare-fun array_inv!15094 (array!40283) Bool)

(assert (=> start!62604 (array_inv!15094 a!3591)))

(declare-fun b!706427 () Bool)

(declare-fun res!470244 () Bool)

(assert (=> b!706427 (=> (not res!470244) (not e!397950))))

(declare-fun contains!3916 (List!13339 (_ BitVec 64)) Bool)

(assert (=> b!706427 (= res!470244 (not (contains!3916 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706428 () Bool)

(declare-fun res!470245 () Bool)

(assert (=> b!706428 (=> (not res!470245) (not e!397950))))

(declare-fun subseq!361 (List!13339 List!13339) Bool)

(assert (=> b!706428 (= res!470245 (subseq!361 acc!652 newAcc!49))))

(declare-fun b!706429 () Bool)

(declare-fun res!470240 () Bool)

(assert (=> b!706429 (=> (not res!470240) (not e!397950))))

(assert (=> b!706429 (= res!470240 (noDuplicate!1163 newAcc!49))))

(declare-fun b!706430 () Bool)

(declare-fun res!470238 () Bool)

(assert (=> b!706430 (=> (not res!470238) (not e!397950))))

(assert (=> b!706430 (= res!470238 (not (contains!3916 acc!652 k!2824)))))

(declare-fun b!706431 () Bool)

(assert (=> b!706431 (= e!397950 false)))

(declare-fun lt!317949 () Bool)

(assert (=> b!706431 (= lt!317949 (contains!3916 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!706432 () Bool)

(declare-fun res!470246 () Bool)

(assert (=> b!706432 (=> (not res!470246) (not e!397950))))

(declare-fun arrayNoDuplicates!0 (array!40283 (_ BitVec 32) List!13339) Bool)

(assert (=> b!706432 (= res!470246 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706433 () Bool)

(declare-fun res!470242 () Bool)

(assert (=> b!706433 (=> (not res!470242) (not e!397950))))

(assert (=> b!706433 (= res!470242 (not (contains!3916 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706434 () Bool)

(declare-fun res!470241 () Bool)

(assert (=> b!706434 (=> (not res!470241) (not e!397950))))

(assert (=> b!706434 (= res!470241 (not (contains!3916 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706435 () Bool)

(declare-fun res!470247 () Bool)

(assert (=> b!706435 (=> (not res!470247) (not e!397950))))

(declare-fun arrayContainsKey!0 (array!40283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706435 (= res!470247 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!706436 () Bool)

(declare-fun res!470239 () Bool)

(assert (=> b!706436 (=> (not res!470239) (not e!397950))))

(assert (=> b!706436 (= res!470239 (contains!3916 newAcc!49 k!2824))))

(declare-fun b!706437 () Bool)

(declare-fun res!470235 () Bool)

(assert (=> b!706437 (=> (not res!470235) (not e!397950))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706437 (= res!470235 (validKeyInArray!0 k!2824))))

(assert (= (and start!62604 res!470236) b!706426))

(assert (= (and b!706426 res!470243) b!706429))

(assert (= (and b!706429 res!470240) b!706434))

(assert (= (and b!706434 res!470241) b!706427))

(assert (= (and b!706427 res!470244) b!706435))

(assert (= (and b!706435 res!470247) b!706430))

(assert (= (and b!706430 res!470238) b!706437))

(assert (= (and b!706437 res!470235) b!706432))

(assert (= (and b!706432 res!470246) b!706428))

(assert (= (and b!706428 res!470245) b!706436))

(assert (= (and b!706436 res!470239) b!706425))

(assert (= (and b!706425 res!470237) b!706433))

(assert (= (and b!706433 res!470242) b!706431))

(declare-fun m!664299 () Bool)

(assert (=> b!706436 m!664299))

(declare-fun m!664301 () Bool)

(assert (=> b!706431 m!664301))

(declare-fun m!664303 () Bool)

(assert (=> b!706435 m!664303))

(declare-fun m!664305 () Bool)

(assert (=> b!706432 m!664305))

(declare-fun m!664307 () Bool)

(assert (=> b!706433 m!664307))

(declare-fun m!664309 () Bool)

(assert (=> b!706426 m!664309))

(declare-fun m!664311 () Bool)

(assert (=> b!706427 m!664311))

(declare-fun m!664313 () Bool)

(assert (=> start!62604 m!664313))

(declare-fun m!664315 () Bool)

(assert (=> b!706429 m!664315))

(declare-fun m!664317 () Bool)

(assert (=> b!706437 m!664317))

(declare-fun m!664319 () Bool)

(assert (=> b!706434 m!664319))

(declare-fun m!664321 () Bool)

(assert (=> b!706428 m!664321))

(declare-fun m!664323 () Bool)

(assert (=> b!706430 m!664323))

(declare-fun m!664325 () Bool)

(assert (=> b!706425 m!664325))

(push 1)

(assert (not b!706430))

(assert (not b!706433))

(assert (not b!706436))

(assert (not b!706429))

(assert (not b!706426))

(assert (not b!706427))

(assert (not b!706425))

(assert (not b!706437))

(assert (not b!706432))

(assert (not b!706431))

(assert (not start!62604))

(assert (not b!706428))

