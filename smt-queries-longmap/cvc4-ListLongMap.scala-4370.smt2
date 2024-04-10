; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60252 () Bool)

(assert start!60252)

(declare-fun b!675394 () Bool)

(declare-fun res!441838 () Bool)

(declare-fun e!385374 () Bool)

(assert (=> b!675394 (=> (not res!441838) (not e!385374))))

(declare-datatypes ((array!39299 0))(
  ( (array!39300 (arr!18842 (Array (_ BitVec 32) (_ BitVec 64))) (size!19206 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39299)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12883 0))(
  ( (Nil!12880) (Cons!12879 (h!13924 (_ BitVec 64)) (t!19111 List!12883)) )
))
(declare-fun acc!681 () List!12883)

(declare-fun arrayNoDuplicates!0 (array!39299 (_ BitVec 32) List!12883) Bool)

(assert (=> b!675394 (= res!441838 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!675395 () Bool)

(declare-fun res!441828 () Bool)

(assert (=> b!675395 (=> (not res!441828) (not e!385374))))

(declare-fun noDuplicate!707 (List!12883) Bool)

(assert (=> b!675395 (= res!441828 (noDuplicate!707 acc!681))))

(declare-fun b!675396 () Bool)

(declare-fun res!441836 () Bool)

(assert (=> b!675396 (=> (not res!441836) (not e!385374))))

(declare-fun contains!3460 (List!12883 (_ BitVec 64)) Bool)

(assert (=> b!675396 (= res!441836 (not (contains!3460 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675397 () Bool)

(declare-fun res!441839 () Bool)

(assert (=> b!675397 (=> (not res!441839) (not e!385374))))

(assert (=> b!675397 (= res!441839 (not (contains!3460 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675398 () Bool)

(declare-fun res!441835 () Bool)

(assert (=> b!675398 (=> (not res!441835) (not e!385374))))

(assert (=> b!675398 (= res!441835 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12880))))

(declare-fun b!675399 () Bool)

(assert (=> b!675399 (= e!385374 false)))

(declare-fun lt!312724 () Bool)

(assert (=> b!675399 (= lt!312724 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!675400 () Bool)

(declare-fun res!441824 () Bool)

(assert (=> b!675400 (=> (not res!441824) (not e!385374))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!675400 (= res!441824 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!441821 () Bool)

(assert (=> start!60252 (=> (not res!441821) (not e!385374))))

(assert (=> start!60252 (= res!441821 (and (bvslt (size!19206 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19206 a!3626))))))

(assert (=> start!60252 e!385374))

(assert (=> start!60252 true))

(declare-fun array_inv!14638 (array!39299) Bool)

(assert (=> start!60252 (array_inv!14638 a!3626)))

(declare-fun b!675401 () Bool)

(declare-fun e!385368 () Bool)

(assert (=> b!675401 (= e!385368 (contains!3460 acc!681 k!2843))))

(declare-fun b!675402 () Bool)

(declare-fun res!441833 () Bool)

(assert (=> b!675402 (=> (not res!441833) (not e!385374))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!675402 (= res!441833 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19206 a!3626))))))

(declare-fun b!675403 () Bool)

(declare-fun res!441822 () Bool)

(assert (=> b!675403 (=> (not res!441822) (not e!385374))))

(declare-fun e!385370 () Bool)

(assert (=> b!675403 (= res!441822 e!385370)))

(declare-fun res!441832 () Bool)

(assert (=> b!675403 (=> res!441832 e!385370)))

(assert (=> b!675403 (= res!441832 e!385368)))

(declare-fun res!441830 () Bool)

(assert (=> b!675403 (=> (not res!441830) (not e!385368))))

(assert (=> b!675403 (= res!441830 (bvsgt from!3004 i!1382))))

(declare-fun b!675404 () Bool)

(declare-fun e!385373 () Bool)

(assert (=> b!675404 (= e!385373 (not (contains!3460 acc!681 k!2843)))))

(declare-fun b!675405 () Bool)

(declare-fun res!441827 () Bool)

(assert (=> b!675405 (=> (not res!441827) (not e!385374))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!675405 (= res!441827 (not (validKeyInArray!0 (select (arr!18842 a!3626) from!3004))))))

(declare-fun b!675406 () Bool)

(declare-fun e!385367 () Bool)

(assert (=> b!675406 (= e!385367 (contains!3460 acc!681 k!2843))))

(declare-fun b!675407 () Bool)

(declare-fun res!441820 () Bool)

(assert (=> b!675407 (=> (not res!441820) (not e!385374))))

(assert (=> b!675407 (= res!441820 (validKeyInArray!0 k!2843))))

(declare-fun b!675408 () Bool)

(declare-fun res!441837 () Bool)

(assert (=> b!675408 (=> (not res!441837) (not e!385374))))

(declare-fun e!385371 () Bool)

(assert (=> b!675408 (= res!441837 e!385371)))

(declare-fun res!441825 () Bool)

(assert (=> b!675408 (=> res!441825 e!385371)))

(assert (=> b!675408 (= res!441825 e!385367)))

(declare-fun res!441834 () Bool)

(assert (=> b!675408 (=> (not res!441834) (not e!385367))))

(assert (=> b!675408 (= res!441834 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675409 () Bool)

(declare-fun e!385369 () Bool)

(assert (=> b!675409 (= e!385371 e!385369)))

(declare-fun res!441826 () Bool)

(assert (=> b!675409 (=> (not res!441826) (not e!385369))))

(assert (=> b!675409 (= res!441826 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675410 () Bool)

(declare-fun res!441829 () Bool)

(assert (=> b!675410 (=> (not res!441829) (not e!385374))))

(assert (=> b!675410 (= res!441829 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!675411 () Bool)

(declare-fun res!441831 () Bool)

(assert (=> b!675411 (=> (not res!441831) (not e!385374))))

(assert (=> b!675411 (= res!441831 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19206 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!675412 () Bool)

(assert (=> b!675412 (= e!385369 (not (contains!3460 acc!681 k!2843)))))

(declare-fun b!675413 () Bool)

(assert (=> b!675413 (= e!385370 e!385373)))

(declare-fun res!441823 () Bool)

(assert (=> b!675413 (=> (not res!441823) (not e!385373))))

(assert (=> b!675413 (= res!441823 (bvsle from!3004 i!1382))))

(assert (= (and start!60252 res!441821) b!675395))

(assert (= (and b!675395 res!441828) b!675396))

(assert (= (and b!675396 res!441836) b!675397))

(assert (= (and b!675397 res!441839) b!675403))

(assert (= (and b!675403 res!441830) b!675401))

(assert (= (and b!675403 (not res!441832)) b!675413))

(assert (= (and b!675413 res!441823) b!675404))

(assert (= (and b!675403 res!441822) b!675398))

(assert (= (and b!675398 res!441835) b!675394))

(assert (= (and b!675394 res!441838) b!675402))

(assert (= (and b!675402 res!441833) b!675407))

(assert (= (and b!675407 res!441820) b!675400))

(assert (= (and b!675400 res!441824) b!675411))

(assert (= (and b!675411 res!441831) b!675405))

(assert (= (and b!675405 res!441827) b!675410))

(assert (= (and b!675410 res!441829) b!675408))

(assert (= (and b!675408 res!441834) b!675406))

(assert (= (and b!675408 (not res!441825)) b!675409))

(assert (= (and b!675409 res!441826) b!675412))

(assert (= (and b!675408 res!441837) b!675399))

(declare-fun m!642875 () Bool)

(assert (=> b!675396 m!642875))

(declare-fun m!642877 () Bool)

(assert (=> b!675404 m!642877))

(declare-fun m!642879 () Bool)

(assert (=> b!675400 m!642879))

(declare-fun m!642881 () Bool)

(assert (=> b!675399 m!642881))

(declare-fun m!642883 () Bool)

(assert (=> b!675394 m!642883))

(assert (=> b!675401 m!642877))

(declare-fun m!642885 () Bool)

(assert (=> b!675405 m!642885))

(assert (=> b!675405 m!642885))

(declare-fun m!642887 () Bool)

(assert (=> b!675405 m!642887))

(declare-fun m!642889 () Bool)

(assert (=> start!60252 m!642889))

(assert (=> b!675406 m!642877))

(declare-fun m!642891 () Bool)

(assert (=> b!675398 m!642891))

(assert (=> b!675412 m!642877))

(declare-fun m!642893 () Bool)

(assert (=> b!675407 m!642893))

(declare-fun m!642895 () Bool)

(assert (=> b!675397 m!642895))

(declare-fun m!642897 () Bool)

(assert (=> b!675395 m!642897))

(push 1)

(assert (not b!675406))

(assert (not b!675399))

(assert (not b!675400))

(assert (not b!675404))

(assert (not b!675397))

(assert (not b!675395))

(assert (not b!675394))

(assert (not b!675396))

(assert (not b!675407))

(assert (not b!675412))

(assert (not start!60252))

(assert (not b!675401))

(assert (not b!675398))

(assert (not b!675405))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

