; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60334 () Bool)

(assert start!60334)

(declare-fun b!676338 () Bool)

(declare-fun e!385803 () Bool)

(declare-datatypes ((List!12797 0))(
  ( (Nil!12794) (Cons!12793 (h!13841 (_ BitVec 64)) (t!19017 List!12797)) )
))
(declare-fun acc!681 () List!12797)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3449 (List!12797 (_ BitVec 64)) Bool)

(assert (=> b!676338 (= e!385803 (contains!3449 acc!681 k!2843))))

(declare-fun b!676339 () Bool)

(declare-fun res!442672 () Bool)

(declare-fun e!385800 () Bool)

(assert (=> b!676339 (=> (not res!442672) (not e!385800))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!676339 (= res!442672 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!676340 () Bool)

(declare-fun res!442653 () Bool)

(assert (=> b!676340 (=> (not res!442653) (not e!385800))))

(declare-datatypes ((array!39319 0))(
  ( (array!39320 (arr!18849 (Array (_ BitVec 32) (_ BitVec 64))) (size!19213 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39319)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!676340 (= res!442653 (not (validKeyInArray!0 (select (arr!18849 a!3626) from!3004))))))

(declare-fun b!676341 () Bool)

(declare-fun e!385797 () Bool)

(declare-fun e!385796 () Bool)

(assert (=> b!676341 (= e!385797 e!385796)))

(declare-fun res!442655 () Bool)

(assert (=> b!676341 (=> (not res!442655) (not e!385796))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!676341 (= res!442655 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676342 () Bool)

(assert (=> b!676342 (= e!385800 false)))

(declare-fun lt!312862 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39319 (_ BitVec 32) List!12797) Bool)

(assert (=> b!676342 (= lt!312862 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!676343 () Bool)

(declare-fun e!385802 () Bool)

(assert (=> b!676343 (= e!385802 (not (contains!3449 acc!681 k!2843)))))

(declare-fun b!676344 () Bool)

(declare-fun res!442659 () Bool)

(assert (=> b!676344 (=> (not res!442659) (not e!385800))))

(declare-fun noDuplicate!723 (List!12797) Bool)

(assert (=> b!676344 (= res!442659 (noDuplicate!723 acc!681))))

(declare-fun b!676345 () Bool)

(declare-fun res!442654 () Bool)

(assert (=> b!676345 (=> (not res!442654) (not e!385800))))

(declare-fun e!385799 () Bool)

(assert (=> b!676345 (= res!442654 e!385799)))

(declare-fun res!442660 () Bool)

(assert (=> b!676345 (=> res!442660 e!385799)))

(assert (=> b!676345 (= res!442660 e!385803)))

(declare-fun res!442665 () Bool)

(assert (=> b!676345 (=> (not res!442665) (not e!385803))))

(assert (=> b!676345 (= res!442665 (bvsgt from!3004 i!1382))))

(declare-fun b!676346 () Bool)

(declare-fun res!442661 () Bool)

(assert (=> b!676346 (=> (not res!442661) (not e!385800))))

(assert (=> b!676346 (= res!442661 (not (contains!3449 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676347 () Bool)

(declare-fun res!442663 () Bool)

(assert (=> b!676347 (=> (not res!442663) (not e!385800))))

(assert (=> b!676347 (= res!442663 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19213 a!3626))))))

(declare-fun b!676348 () Bool)

(assert (=> b!676348 (= e!385796 (not (contains!3449 acc!681 k!2843)))))

(declare-fun b!676349 () Bool)

(declare-fun res!442657 () Bool)

(assert (=> b!676349 (=> (not res!442657) (not e!385800))))

(assert (=> b!676349 (= res!442657 e!385797)))

(declare-fun res!442656 () Bool)

(assert (=> b!676349 (=> res!442656 e!385797)))

(declare-fun e!385801 () Bool)

(assert (=> b!676349 (= res!442656 e!385801)))

(declare-fun res!442666 () Bool)

(assert (=> b!676349 (=> (not res!442666) (not e!385801))))

(assert (=> b!676349 (= res!442666 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676350 () Bool)

(declare-fun res!442671 () Bool)

(assert (=> b!676350 (=> (not res!442671) (not e!385800))))

(assert (=> b!676350 (= res!442671 (validKeyInArray!0 k!2843))))

(declare-fun b!676351 () Bool)

(assert (=> b!676351 (= e!385801 (contains!3449 acc!681 k!2843))))

(declare-fun b!676352 () Bool)

(declare-fun res!442664 () Bool)

(assert (=> b!676352 (=> (not res!442664) (not e!385800))))

(assert (=> b!676352 (= res!442664 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19213 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!676353 () Bool)

(declare-fun res!442670 () Bool)

(assert (=> b!676353 (=> (not res!442670) (not e!385800))))

(assert (=> b!676353 (= res!442670 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12794))))

(declare-fun b!676354 () Bool)

(declare-fun res!442658 () Bool)

(assert (=> b!676354 (=> (not res!442658) (not e!385800))))

(assert (=> b!676354 (= res!442658 (not (contains!3449 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676355 () Bool)

(declare-fun res!442667 () Bool)

(assert (=> b!676355 (=> (not res!442667) (not e!385800))))

(assert (=> b!676355 (= res!442667 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!676356 () Bool)

(assert (=> b!676356 (= e!385799 e!385802)))

(declare-fun res!442662 () Bool)

(assert (=> b!676356 (=> (not res!442662) (not e!385802))))

(assert (=> b!676356 (= res!442662 (bvsle from!3004 i!1382))))

(declare-fun res!442669 () Bool)

(assert (=> start!60334 (=> (not res!442669) (not e!385800))))

(assert (=> start!60334 (= res!442669 (and (bvslt (size!19213 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19213 a!3626))))))

(assert (=> start!60334 e!385800))

(assert (=> start!60334 true))

(declare-fun array_inv!14708 (array!39319) Bool)

(assert (=> start!60334 (array_inv!14708 a!3626)))

(declare-fun b!676357 () Bool)

(declare-fun res!442668 () Bool)

(assert (=> b!676357 (=> (not res!442668) (not e!385800))))

(declare-fun arrayContainsKey!0 (array!39319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!676357 (= res!442668 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!60334 res!442669) b!676344))

(assert (= (and b!676344 res!442659) b!676354))

(assert (= (and b!676354 res!442658) b!676346))

(assert (= (and b!676346 res!442661) b!676345))

(assert (= (and b!676345 res!442665) b!676338))

(assert (= (and b!676345 (not res!442660)) b!676356))

(assert (= (and b!676356 res!442662) b!676343))

(assert (= (and b!676345 res!442654) b!676353))

(assert (= (and b!676353 res!442670) b!676355))

(assert (= (and b!676355 res!442667) b!676347))

(assert (= (and b!676347 res!442663) b!676350))

(assert (= (and b!676350 res!442671) b!676357))

(assert (= (and b!676357 res!442668) b!676352))

(assert (= (and b!676352 res!442664) b!676340))

(assert (= (and b!676340 res!442653) b!676339))

(assert (= (and b!676339 res!442672) b!676349))

(assert (= (and b!676349 res!442666) b!676351))

(assert (= (and b!676349 (not res!442656)) b!676341))

(assert (= (and b!676341 res!442655) b!676348))

(assert (= (and b!676349 res!442657) b!676342))

(declare-fun m!643861 () Bool)

(assert (=> start!60334 m!643861))

(declare-fun m!643863 () Bool)

(assert (=> b!676354 m!643863))

(declare-fun m!643865 () Bool)

(assert (=> b!676357 m!643865))

(declare-fun m!643867 () Bool)

(assert (=> b!676351 m!643867))

(declare-fun m!643869 () Bool)

(assert (=> b!676340 m!643869))

(assert (=> b!676340 m!643869))

(declare-fun m!643871 () Bool)

(assert (=> b!676340 m!643871))

(assert (=> b!676343 m!643867))

(assert (=> b!676348 m!643867))

(declare-fun m!643873 () Bool)

(assert (=> b!676342 m!643873))

(declare-fun m!643875 () Bool)

(assert (=> b!676346 m!643875))

(declare-fun m!643877 () Bool)

(assert (=> b!676353 m!643877))

(assert (=> b!676338 m!643867))

(declare-fun m!643879 () Bool)

(assert (=> b!676355 m!643879))

(declare-fun m!643881 () Bool)

(assert (=> b!676350 m!643881))

(declare-fun m!643883 () Bool)

(assert (=> b!676344 m!643883))

(push 1)

(assert (not b!676343))

(assert (not b!676353))

(assert (not b!676351))

(assert (not b!676348))

(assert (not b!676344))

(assert (not b!676355))

(assert (not b!676357))

(assert (not b!676338))

(assert (not b!676350))

(assert (not start!60334))

(assert (not b!676340))

(assert (not b!676346))

(assert (not b!676354))

(assert (not b!676342))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

