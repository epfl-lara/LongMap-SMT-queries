; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60146 () Bool)

(assert start!60146)

(declare-fun b!671396 () Bool)

(declare-fun res!438103 () Bool)

(declare-fun e!383712 () Bool)

(assert (=> b!671396 (=> (not res!438103) (not e!383712))))

(declare-datatypes ((List!12830 0))(
  ( (Nil!12827) (Cons!12826 (h!13871 (_ BitVec 64)) (t!19058 List!12830)) )
))
(declare-fun acc!681 () List!12830)

(declare-fun noDuplicate!654 (List!12830) Bool)

(assert (=> b!671396 (= res!438103 (noDuplicate!654 acc!681))))

(declare-fun b!671397 () Bool)

(assert (=> b!671397 (= e!383712 (not true))))

(declare-datatypes ((array!39193 0))(
  ( (array!39194 (arr!18789 (Array (_ BitVec 32) (_ BitVec 64))) (size!19153 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39193)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!39193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671397 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun b!671398 () Bool)

(declare-fun res!438106 () Bool)

(assert (=> b!671398 (=> (not res!438106) (not e!383712))))

(assert (=> b!671398 (= res!438106 (= (select (arr!18789 a!3626) from!3004) k!2843))))

(declare-fun b!671399 () Bool)

(declare-fun res!438102 () Bool)

(assert (=> b!671399 (=> (not res!438102) (not e!383712))))

(assert (=> b!671399 (= res!438102 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!671400 () Bool)

(declare-fun res!438095 () Bool)

(assert (=> b!671400 (=> (not res!438095) (not e!383712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671400 (= res!438095 (validKeyInArray!0 k!2843))))

(declare-fun b!671401 () Bool)

(declare-fun res!438092 () Bool)

(assert (=> b!671401 (=> (not res!438092) (not e!383712))))

(assert (=> b!671401 (= res!438092 (validKeyInArray!0 (select (arr!18789 a!3626) from!3004)))))

(declare-fun b!671402 () Bool)

(declare-fun res!438100 () Bool)

(assert (=> b!671402 (=> (not res!438100) (not e!383712))))

(declare-fun arrayNoDuplicates!0 (array!39193 (_ BitVec 32) List!12830) Bool)

(assert (=> b!671402 (= res!438100 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12827))))

(declare-fun b!671403 () Bool)

(declare-fun res!438104 () Bool)

(assert (=> b!671403 (=> (not res!438104) (not e!383712))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!671403 (= res!438104 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19153 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!671404 () Bool)

(declare-fun res!438094 () Bool)

(assert (=> b!671404 (=> (not res!438094) (not e!383712))))

(declare-fun e!383714 () Bool)

(assert (=> b!671404 (= res!438094 e!383714)))

(declare-fun res!438096 () Bool)

(assert (=> b!671404 (=> res!438096 e!383714)))

(declare-fun e!383713 () Bool)

(assert (=> b!671404 (= res!438096 e!383713)))

(declare-fun res!438097 () Bool)

(assert (=> b!671404 (=> (not res!438097) (not e!383713))))

(assert (=> b!671404 (= res!438097 (bvsgt from!3004 i!1382))))

(declare-fun res!438099 () Bool)

(assert (=> start!60146 (=> (not res!438099) (not e!383712))))

(assert (=> start!60146 (= res!438099 (and (bvslt (size!19153 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19153 a!3626))))))

(assert (=> start!60146 e!383712))

(assert (=> start!60146 true))

(declare-fun array_inv!14585 (array!39193) Bool)

(assert (=> start!60146 (array_inv!14585 a!3626)))

(declare-fun b!671405 () Bool)

(declare-fun e!383711 () Bool)

(declare-fun contains!3407 (List!12830 (_ BitVec 64)) Bool)

(assert (=> b!671405 (= e!383711 (not (contains!3407 acc!681 k!2843)))))

(declare-fun b!671406 () Bool)

(assert (=> b!671406 (= e!383713 (contains!3407 acc!681 k!2843))))

(declare-fun b!671407 () Bool)

(declare-fun res!438105 () Bool)

(assert (=> b!671407 (=> (not res!438105) (not e!383712))))

(assert (=> b!671407 (= res!438105 (not (contains!3407 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671408 () Bool)

(declare-fun res!438098 () Bool)

(assert (=> b!671408 (=> (not res!438098) (not e!383712))))

(assert (=> b!671408 (= res!438098 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19153 a!3626))))))

(declare-fun b!671409 () Bool)

(declare-fun res!438107 () Bool)

(assert (=> b!671409 (=> (not res!438107) (not e!383712))))

(assert (=> b!671409 (= res!438107 (not (contains!3407 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671410 () Bool)

(assert (=> b!671410 (= e!383714 e!383711)))

(declare-fun res!438101 () Bool)

(assert (=> b!671410 (=> (not res!438101) (not e!383711))))

(assert (=> b!671410 (= res!438101 (bvsle from!3004 i!1382))))

(declare-fun b!671411 () Bool)

(declare-fun res!438093 () Bool)

(assert (=> b!671411 (=> (not res!438093) (not e!383712))))

(assert (=> b!671411 (= res!438093 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!60146 res!438099) b!671396))

(assert (= (and b!671396 res!438103) b!671407))

(assert (= (and b!671407 res!438105) b!671409))

(assert (= (and b!671409 res!438107) b!671404))

(assert (= (and b!671404 res!438097) b!671406))

(assert (= (and b!671404 (not res!438096)) b!671410))

(assert (= (and b!671410 res!438101) b!671405))

(assert (= (and b!671404 res!438094) b!671402))

(assert (= (and b!671402 res!438100) b!671411))

(assert (= (and b!671411 res!438093) b!671408))

(assert (= (and b!671408 res!438098) b!671400))

(assert (= (and b!671400 res!438095) b!671399))

(assert (= (and b!671399 res!438102) b!671403))

(assert (= (and b!671403 res!438104) b!671401))

(assert (= (and b!671401 res!438092) b!671398))

(assert (= (and b!671398 res!438106) b!671397))

(declare-fun m!640901 () Bool)

(assert (=> b!671396 m!640901))

(declare-fun m!640903 () Bool)

(assert (=> b!671398 m!640903))

(declare-fun m!640905 () Bool)

(assert (=> b!671407 m!640905))

(declare-fun m!640907 () Bool)

(assert (=> b!671400 m!640907))

(declare-fun m!640909 () Bool)

(assert (=> b!671409 m!640909))

(assert (=> b!671401 m!640903))

(assert (=> b!671401 m!640903))

(declare-fun m!640911 () Bool)

(assert (=> b!671401 m!640911))

(declare-fun m!640913 () Bool)

(assert (=> b!671399 m!640913))

(declare-fun m!640915 () Bool)

(assert (=> start!60146 m!640915))

(declare-fun m!640917 () Bool)

(assert (=> b!671402 m!640917))

(declare-fun m!640919 () Bool)

(assert (=> b!671406 m!640919))

(declare-fun m!640921 () Bool)

(assert (=> b!671411 m!640921))

(assert (=> b!671405 m!640919))

(declare-fun m!640923 () Bool)

(assert (=> b!671397 m!640923))

(push 1)

(assert (not b!671411))

(assert (not b!671396))

(assert (not b!671405))

(assert (not b!671400))

(assert (not start!60146))

(assert (not b!671399))

(assert (not b!671397))

(assert (not b!671406))

(assert (not b!671402))

(assert (not b!671407))

(assert (not b!671401))

(assert (not b!671409))

(check-sat)

