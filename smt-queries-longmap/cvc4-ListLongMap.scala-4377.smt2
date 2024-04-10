; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60294 () Bool)

(assert start!60294)

(declare-fun b!676654 () Bool)

(declare-fun res!443081 () Bool)

(declare-fun e!385876 () Bool)

(assert (=> b!676654 (=> (not res!443081) (not e!385876))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!676654 (= res!443081 (validKeyInArray!0 k!2843))))

(declare-fun b!676655 () Bool)

(declare-fun e!385871 () Bool)

(declare-datatypes ((List!12904 0))(
  ( (Nil!12901) (Cons!12900 (h!13945 (_ BitVec 64)) (t!19132 List!12904)) )
))
(declare-fun acc!681 () List!12904)

(declare-fun contains!3481 (List!12904 (_ BitVec 64)) Bool)

(assert (=> b!676655 (= e!385871 (contains!3481 acc!681 k!2843))))

(declare-fun b!676656 () Bool)

(declare-fun res!443093 () Bool)

(assert (=> b!676656 (=> (not res!443093) (not e!385876))))

(declare-datatypes ((array!39341 0))(
  ( (array!39342 (arr!18863 (Array (_ BitVec 32) (_ BitVec 64))) (size!19227 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39341)

(declare-fun arrayContainsKey!0 (array!39341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!676656 (= res!443093 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!676657 () Bool)

(declare-fun res!443089 () Bool)

(assert (=> b!676657 (=> (not res!443089) (not e!385876))))

(declare-fun e!385875 () Bool)

(assert (=> b!676657 (= res!443089 e!385875)))

(declare-fun res!443098 () Bool)

(assert (=> b!676657 (=> res!443098 e!385875)))

(assert (=> b!676657 (= res!443098 e!385871)))

(declare-fun res!443095 () Bool)

(assert (=> b!676657 (=> (not res!443095) (not e!385871))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!676657 (= res!443095 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676658 () Bool)

(declare-fun e!385873 () Bool)

(assert (=> b!676658 (= e!385873 (not (contains!3481 acc!681 k!2843)))))

(declare-fun b!676659 () Bool)

(declare-fun res!443099 () Bool)

(assert (=> b!676659 (=> (not res!443099) (not e!385876))))

(assert (=> b!676659 (= res!443099 (not (validKeyInArray!0 (select (arr!18863 a!3626) from!3004))))))

(declare-fun b!676661 () Bool)

(declare-fun res!443080 () Bool)

(assert (=> b!676661 (=> (not res!443080) (not e!385876))))

(assert (=> b!676661 (= res!443080 (not (contains!3481 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676662 () Bool)

(assert (=> b!676662 (= e!385876 false)))

(declare-fun lt!312787 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39341 (_ BitVec 32) List!12904) Bool)

(assert (=> b!676662 (= lt!312787 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!676663 () Bool)

(declare-fun res!443086 () Bool)

(assert (=> b!676663 (=> (not res!443086) (not e!385876))))

(assert (=> b!676663 (= res!443086 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!676664 () Bool)

(declare-fun e!385874 () Bool)

(assert (=> b!676664 (= e!385874 (contains!3481 acc!681 k!2843))))

(declare-fun b!676665 () Bool)

(declare-fun e!385872 () Bool)

(assert (=> b!676665 (= e!385872 (not (contains!3481 acc!681 k!2843)))))

(declare-fun b!676666 () Bool)

(declare-fun res!443087 () Bool)

(assert (=> b!676666 (=> (not res!443087) (not e!385876))))

(declare-fun noDuplicate!728 (List!12904) Bool)

(assert (=> b!676666 (= res!443087 (noDuplicate!728 acc!681))))

(declare-fun b!676667 () Bool)

(declare-fun res!443090 () Bool)

(assert (=> b!676667 (=> (not res!443090) (not e!385876))))

(assert (=> b!676667 (= res!443090 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19227 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!676668 () Bool)

(assert (=> b!676668 (= e!385875 e!385872)))

(declare-fun res!443082 () Bool)

(assert (=> b!676668 (=> (not res!443082) (not e!385872))))

(assert (=> b!676668 (= res!443082 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676669 () Bool)

(declare-fun e!385878 () Bool)

(assert (=> b!676669 (= e!385878 e!385873)))

(declare-fun res!443091 () Bool)

(assert (=> b!676669 (=> (not res!443091) (not e!385873))))

(assert (=> b!676669 (= res!443091 (bvsle from!3004 i!1382))))

(declare-fun b!676670 () Bool)

(declare-fun res!443097 () Bool)

(assert (=> b!676670 (=> (not res!443097) (not e!385876))))

(assert (=> b!676670 (= res!443097 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!676671 () Bool)

(declare-fun res!443088 () Bool)

(assert (=> b!676671 (=> (not res!443088) (not e!385876))))

(assert (=> b!676671 (= res!443088 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19227 a!3626))))))

(declare-fun b!676660 () Bool)

(declare-fun res!443083 () Bool)

(assert (=> b!676660 (=> (not res!443083) (not e!385876))))

(assert (=> b!676660 (= res!443083 (not (contains!3481 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!443085 () Bool)

(assert (=> start!60294 (=> (not res!443085) (not e!385876))))

(assert (=> start!60294 (= res!443085 (and (bvslt (size!19227 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19227 a!3626))))))

(assert (=> start!60294 e!385876))

(assert (=> start!60294 true))

(declare-fun array_inv!14659 (array!39341) Bool)

(assert (=> start!60294 (array_inv!14659 a!3626)))

(declare-fun b!676672 () Bool)

(declare-fun res!443096 () Bool)

(assert (=> b!676672 (=> (not res!443096) (not e!385876))))

(assert (=> b!676672 (= res!443096 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12901))))

(declare-fun b!676673 () Bool)

(declare-fun res!443084 () Bool)

(assert (=> b!676673 (=> (not res!443084) (not e!385876))))

(assert (=> b!676673 (= res!443084 e!385878)))

(declare-fun res!443092 () Bool)

(assert (=> b!676673 (=> res!443092 e!385878)))

(assert (=> b!676673 (= res!443092 e!385874)))

(declare-fun res!443094 () Bool)

(assert (=> b!676673 (=> (not res!443094) (not e!385874))))

(assert (=> b!676673 (= res!443094 (bvsgt from!3004 i!1382))))

(assert (= (and start!60294 res!443085) b!676666))

(assert (= (and b!676666 res!443087) b!676661))

(assert (= (and b!676661 res!443080) b!676660))

(assert (= (and b!676660 res!443083) b!676673))

(assert (= (and b!676673 res!443094) b!676664))

(assert (= (and b!676673 (not res!443092)) b!676669))

(assert (= (and b!676669 res!443091) b!676658))

(assert (= (and b!676673 res!443084) b!676672))

(assert (= (and b!676672 res!443096) b!676670))

(assert (= (and b!676670 res!443097) b!676671))

(assert (= (and b!676671 res!443088) b!676654))

(assert (= (and b!676654 res!443081) b!676656))

(assert (= (and b!676656 res!443093) b!676667))

(assert (= (and b!676667 res!443090) b!676659))

(assert (= (and b!676659 res!443099) b!676663))

(assert (= (and b!676663 res!443086) b!676657))

(assert (= (and b!676657 res!443095) b!676655))

(assert (= (and b!676657 (not res!443098)) b!676668))

(assert (= (and b!676668 res!443082) b!676665))

(assert (= (and b!676657 res!443089) b!676662))

(declare-fun m!643379 () Bool)

(assert (=> b!676656 m!643379))

(declare-fun m!643381 () Bool)

(assert (=> b!676670 m!643381))

(declare-fun m!643383 () Bool)

(assert (=> start!60294 m!643383))

(declare-fun m!643385 () Bool)

(assert (=> b!676661 m!643385))

(declare-fun m!643387 () Bool)

(assert (=> b!676654 m!643387))

(declare-fun m!643389 () Bool)

(assert (=> b!676658 m!643389))

(declare-fun m!643391 () Bool)

(assert (=> b!676660 m!643391))

(declare-fun m!643393 () Bool)

(assert (=> b!676672 m!643393))

(declare-fun m!643395 () Bool)

(assert (=> b!676662 m!643395))

(assert (=> b!676665 m!643389))

(assert (=> b!676664 m!643389))

(declare-fun m!643397 () Bool)

(assert (=> b!676659 m!643397))

(assert (=> b!676659 m!643397))

(declare-fun m!643399 () Bool)

(assert (=> b!676659 m!643399))

(declare-fun m!643401 () Bool)

(assert (=> b!676666 m!643401))

(assert (=> b!676655 m!643389))

(push 1)

(assert (not b!676659))

(assert (not b!676661))

(assert (not b!676672))

(assert (not b!676662))

(assert (not b!676655))

(assert (not b!676658))

(assert (not start!60294))

(assert (not b!676665))

(assert (not b!676654))

(assert (not b!676670))

(assert (not b!676664))

(assert (not b!676660))

(assert (not b!676666))

(assert (not b!676656))

