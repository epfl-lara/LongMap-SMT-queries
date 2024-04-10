; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60110 () Bool)

(assert start!60110)

(declare-fun res!437407 () Bool)

(declare-fun e!383441 () Bool)

(assert (=> start!60110 (=> (not res!437407) (not e!383441))))

(declare-datatypes ((array!39157 0))(
  ( (array!39158 (arr!18771 (Array (_ BitVec 32) (_ BitVec 64))) (size!19135 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39157)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60110 (= res!437407 (and (bvslt (size!19135 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19135 a!3626))))))

(assert (=> start!60110 e!383441))

(assert (=> start!60110 true))

(declare-fun array_inv!14567 (array!39157) Bool)

(assert (=> start!60110 (array_inv!14567 a!3626)))

(declare-fun b!670707 () Bool)

(declare-fun res!437405 () Bool)

(assert (=> b!670707 (=> (not res!437405) (not e!383441))))

(declare-datatypes ((List!12812 0))(
  ( (Nil!12809) (Cons!12808 (h!13853 (_ BitVec 64)) (t!19040 List!12812)) )
))
(declare-fun acc!681 () List!12812)

(declare-fun noDuplicate!636 (List!12812) Bool)

(assert (=> b!670707 (= res!437405 (noDuplicate!636 acc!681))))

(declare-fun b!670708 () Bool)

(declare-fun res!437404 () Bool)

(assert (=> b!670708 (=> (not res!437404) (not e!383441))))

(declare-fun contains!3389 (List!12812 (_ BitVec 64)) Bool)

(assert (=> b!670708 (= res!437404 (not (contains!3389 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670709 () Bool)

(declare-fun res!437410 () Bool)

(assert (=> b!670709 (=> (not res!437410) (not e!383441))))

(assert (=> b!670709 (= res!437410 (not (contains!3389 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670710 () Bool)

(declare-fun res!437408 () Bool)

(assert (=> b!670710 (=> (not res!437408) (not e!383441))))

(declare-fun e!383443 () Bool)

(assert (=> b!670710 (= res!437408 e!383443)))

(declare-fun res!437403 () Bool)

(assert (=> b!670710 (=> res!437403 e!383443)))

(declare-fun e!383442 () Bool)

(assert (=> b!670710 (= res!437403 e!383442)))

(declare-fun res!437409 () Bool)

(assert (=> b!670710 (=> (not res!437409) (not e!383442))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!670710 (= res!437409 (bvsgt from!3004 i!1382))))

(declare-fun b!670711 () Bool)

(declare-fun res!437411 () Bool)

(assert (=> b!670711 (=> (not res!437411) (not e!383441))))

(declare-fun arrayNoDuplicates!0 (array!39157 (_ BitVec 32) List!12812) Bool)

(assert (=> b!670711 (= res!437411 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12809))))

(declare-fun b!670712 () Bool)

(declare-fun e!383445 () Bool)

(assert (=> b!670712 (= e!383443 e!383445)))

(declare-fun res!437406 () Bool)

(assert (=> b!670712 (=> (not res!437406) (not e!383445))))

(assert (=> b!670712 (= res!437406 (bvsle from!3004 i!1382))))

(declare-fun b!670713 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!670713 (= e!383445 (not (contains!3389 acc!681 k!2843)))))

(declare-fun b!670714 () Bool)

(assert (=> b!670714 (= e!383442 (contains!3389 acc!681 k!2843))))

(declare-fun b!670715 () Bool)

(assert (=> b!670715 (= e!383441 false)))

(declare-fun lt!312142 () Bool)

(assert (=> b!670715 (= lt!312142 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!60110 res!437407) b!670707))

(assert (= (and b!670707 res!437405) b!670708))

(assert (= (and b!670708 res!437404) b!670709))

(assert (= (and b!670709 res!437410) b!670710))

(assert (= (and b!670710 res!437409) b!670714))

(assert (= (and b!670710 (not res!437403)) b!670712))

(assert (= (and b!670712 res!437406) b!670713))

(assert (= (and b!670710 res!437408) b!670711))

(assert (= (and b!670711 res!437411) b!670715))

(declare-fun m!640559 () Bool)

(assert (=> b!670709 m!640559))

(declare-fun m!640561 () Bool)

(assert (=> b!670714 m!640561))

(declare-fun m!640563 () Bool)

(assert (=> b!670715 m!640563))

(assert (=> b!670713 m!640561))

(declare-fun m!640565 () Bool)

(assert (=> b!670707 m!640565))

(declare-fun m!640567 () Bool)

(assert (=> start!60110 m!640567))

(declare-fun m!640569 () Bool)

(assert (=> b!670708 m!640569))

(declare-fun m!640571 () Bool)

(assert (=> b!670711 m!640571))

(push 1)

(assert (not b!670715))

(assert (not start!60110))

(assert (not b!670713))

(assert (not b!670714))

(assert (not b!670711))

(assert (not b!670709))

(assert (not b!670708))

(assert (not b!670707))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

