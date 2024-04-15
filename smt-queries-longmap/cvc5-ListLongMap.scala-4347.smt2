; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60102 () Bool)

(assert start!60102)

(declare-fun b!670465 () Bool)

(declare-fun res!437322 () Bool)

(declare-fun e!383284 () Bool)

(assert (=> b!670465 (=> (not res!437322) (not e!383284))))

(declare-datatypes ((List!12852 0))(
  ( (Nil!12849) (Cons!12848 (h!13893 (_ BitVec 64)) (t!19071 List!12852)) )
))
(declare-fun acc!681 () List!12852)

(declare-fun noDuplicate!643 (List!12852) Bool)

(assert (=> b!670465 (= res!437322 (noDuplicate!643 acc!681))))

(declare-fun b!670466 () Bool)

(declare-fun res!437328 () Bool)

(assert (=> b!670466 (=> (not res!437328) (not e!383284))))

(declare-datatypes ((array!39160 0))(
  ( (array!39161 (arr!18772 (Array (_ BitVec 32) (_ BitVec 64))) (size!19137 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39160)

(declare-fun arrayNoDuplicates!0 (array!39160 (_ BitVec 32) List!12852) Bool)

(assert (=> b!670466 (= res!437328 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12849))))

(declare-fun b!670467 () Bool)

(declare-fun e!383283 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3374 (List!12852 (_ BitVec 64)) Bool)

(assert (=> b!670467 (= e!383283 (not (contains!3374 acc!681 k!2843)))))

(declare-fun b!670468 () Bool)

(declare-fun e!383285 () Bool)

(assert (=> b!670468 (= e!383285 (contains!3374 acc!681 k!2843))))

(declare-fun res!437327 () Bool)

(assert (=> start!60102 (=> (not res!437327) (not e!383284))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60102 (= res!437327 (and (bvslt (size!19137 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19137 a!3626))))))

(assert (=> start!60102 e!383284))

(assert (=> start!60102 true))

(declare-fun array_inv!14655 (array!39160) Bool)

(assert (=> start!60102 (array_inv!14655 a!3626)))

(declare-fun b!670469 () Bool)

(declare-fun res!437324 () Bool)

(assert (=> b!670469 (=> (not res!437324) (not e!383284))))

(assert (=> b!670469 (= res!437324 (not (contains!3374 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670470 () Bool)

(declare-fun res!437325 () Bool)

(assert (=> b!670470 (=> (not res!437325) (not e!383284))))

(assert (=> b!670470 (= res!437325 (not (contains!3374 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670471 () Bool)

(declare-fun e!383281 () Bool)

(assert (=> b!670471 (= e!383281 e!383283)))

(declare-fun res!437321 () Bool)

(assert (=> b!670471 (=> (not res!437321) (not e!383283))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!670471 (= res!437321 (bvsle from!3004 i!1382))))

(declare-fun b!670472 () Bool)

(declare-fun res!437326 () Bool)

(assert (=> b!670472 (=> (not res!437326) (not e!383284))))

(assert (=> b!670472 (= res!437326 e!383281)))

(declare-fun res!437329 () Bool)

(assert (=> b!670472 (=> res!437329 e!383281)))

(assert (=> b!670472 (= res!437329 e!383285)))

(declare-fun res!437323 () Bool)

(assert (=> b!670472 (=> (not res!437323) (not e!383285))))

(assert (=> b!670472 (= res!437323 (bvsgt from!3004 i!1382))))

(declare-fun b!670473 () Bool)

(assert (=> b!670473 (= e!383284 false)))

(declare-fun lt!311892 () Bool)

(assert (=> b!670473 (= lt!311892 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!60102 res!437327) b!670465))

(assert (= (and b!670465 res!437322) b!670470))

(assert (= (and b!670470 res!437325) b!670469))

(assert (= (and b!670469 res!437324) b!670472))

(assert (= (and b!670472 res!437323) b!670468))

(assert (= (and b!670472 (not res!437329)) b!670471))

(assert (= (and b!670471 res!437321) b!670467))

(assert (= (and b!670472 res!437326) b!670466))

(assert (= (and b!670466 res!437328) b!670473))

(declare-fun m!639805 () Bool)

(assert (=> b!670466 m!639805))

(declare-fun m!639807 () Bool)

(assert (=> b!670465 m!639807))

(declare-fun m!639809 () Bool)

(assert (=> start!60102 m!639809))

(declare-fun m!639811 () Bool)

(assert (=> b!670473 m!639811))

(declare-fun m!639813 () Bool)

(assert (=> b!670469 m!639813))

(declare-fun m!639815 () Bool)

(assert (=> b!670470 m!639815))

(declare-fun m!639817 () Bool)

(assert (=> b!670468 m!639817))

(assert (=> b!670467 m!639817))

(push 1)

(assert (not b!670468))

(assert (not b!670473))

(assert (not b!670467))

(assert (not b!670465))

(assert (not b!670466))

(assert (not start!60102))

(assert (not b!670469))

(assert (not b!670470))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

