; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60288 () Bool)

(assert start!60288)

(declare-fun b!676538 () Bool)

(declare-fun res!443131 () Bool)

(declare-fun e!385759 () Bool)

(assert (=> b!676538 (=> (not res!443131) (not e!385759))))

(declare-datatypes ((List!12945 0))(
  ( (Nil!12942) (Cons!12941 (h!13986 (_ BitVec 64)) (t!19164 List!12945)) )
))
(declare-fun acc!681 () List!12945)

(declare-fun contains!3467 (List!12945 (_ BitVec 64)) Bool)

(assert (=> b!676538 (= res!443131 (not (contains!3467 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676539 () Bool)

(declare-fun res!443136 () Bool)

(assert (=> b!676539 (=> (not res!443136) (not e!385759))))

(declare-datatypes ((array!39346 0))(
  ( (array!39347 (arr!18865 (Array (_ BitVec 32) (_ BitVec 64))) (size!19230 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39346)

(declare-fun arrayNoDuplicates!0 (array!39346 (_ BitVec 32) List!12945) Bool)

(assert (=> b!676539 (= res!443136 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12942))))

(declare-fun b!676540 () Bool)

(declare-fun e!385756 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!676540 (= e!385756 (contains!3467 acc!681 k!2843))))

(declare-fun b!676541 () Bool)

(declare-fun res!443126 () Bool)

(assert (=> b!676541 (=> (not res!443126) (not e!385759))))

(assert (=> b!676541 (= res!443126 (not (contains!3467 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676542 () Bool)

(declare-fun e!385753 () Bool)

(assert (=> b!676542 (= e!385753 (contains!3467 acc!681 k!2843))))

(declare-fun b!676543 () Bool)

(declare-fun res!443140 () Bool)

(assert (=> b!676543 (=> (not res!443140) (not e!385759))))

(declare-fun e!385755 () Bool)

(assert (=> b!676543 (= res!443140 e!385755)))

(declare-fun res!443127 () Bool)

(assert (=> b!676543 (=> res!443127 e!385755)))

(assert (=> b!676543 (= res!443127 e!385753)))

(declare-fun res!443143 () Bool)

(assert (=> b!676543 (=> (not res!443143) (not e!385753))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!676543 (= res!443143 (bvsgt from!3004 i!1382))))

(declare-fun b!676544 () Bool)

(declare-fun res!443134 () Bool)

(assert (=> b!676544 (=> (not res!443134) (not e!385759))))

(declare-fun arrayContainsKey!0 (array!39346 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!676544 (= res!443134 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!676545 () Bool)

(declare-fun res!443130 () Bool)

(assert (=> b!676545 (=> (not res!443130) (not e!385759))))

(declare-fun e!385758 () Bool)

(assert (=> b!676545 (= res!443130 e!385758)))

(declare-fun res!443137 () Bool)

(assert (=> b!676545 (=> res!443137 e!385758)))

(assert (=> b!676545 (= res!443137 e!385756)))

(declare-fun res!443129 () Bool)

(assert (=> b!676545 (=> (not res!443129) (not e!385756))))

(assert (=> b!676545 (= res!443129 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676546 () Bool)

(declare-fun res!443124 () Bool)

(assert (=> b!676546 (=> (not res!443124) (not e!385759))))

(declare-fun noDuplicate!736 (List!12945) Bool)

(assert (=> b!676546 (= res!443124 (noDuplicate!736 acc!681))))

(declare-fun b!676548 () Bool)

(declare-fun e!385754 () Bool)

(assert (=> b!676548 (= e!385754 (not (contains!3467 acc!681 k!2843)))))

(declare-fun b!676549 () Bool)

(assert (=> b!676549 (= e!385758 e!385754)))

(declare-fun res!443133 () Bool)

(assert (=> b!676549 (=> (not res!443133) (not e!385754))))

(assert (=> b!676549 (= res!443133 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676550 () Bool)

(declare-fun res!443132 () Bool)

(assert (=> b!676550 (=> (not res!443132) (not e!385759))))

(assert (=> b!676550 (= res!443132 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!676551 () Bool)

(declare-fun e!385757 () Bool)

(assert (=> b!676551 (= e!385757 (not (contains!3467 acc!681 k!2843)))))

(declare-fun b!676552 () Bool)

(declare-fun res!443125 () Bool)

(assert (=> b!676552 (=> (not res!443125) (not e!385759))))

(assert (=> b!676552 (= res!443125 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19230 a!3626))))))

(declare-fun b!676553 () Bool)

(declare-fun res!443141 () Bool)

(assert (=> b!676553 (=> (not res!443141) (not e!385759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!676553 (= res!443141 (validKeyInArray!0 k!2843))))

(declare-fun res!443142 () Bool)

(assert (=> start!60288 (=> (not res!443142) (not e!385759))))

(assert (=> start!60288 (= res!443142 (and (bvslt (size!19230 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19230 a!3626))))))

(assert (=> start!60288 e!385759))

(assert (=> start!60288 true))

(declare-fun array_inv!14748 (array!39346) Bool)

(assert (=> start!60288 (array_inv!14748 a!3626)))

(declare-fun b!676547 () Bool)

(declare-fun res!443138 () Bool)

(assert (=> b!676547 (=> (not res!443138) (not e!385759))))

(assert (=> b!676547 (= res!443138 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!676554 () Bool)

(declare-fun res!443128 () Bool)

(assert (=> b!676554 (=> (not res!443128) (not e!385759))))

(assert (=> b!676554 (= res!443128 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19230 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!676555 () Bool)

(declare-fun res!443135 () Bool)

(assert (=> b!676555 (=> (not res!443135) (not e!385759))))

(assert (=> b!676555 (= res!443135 (not (validKeyInArray!0 (select (arr!18865 a!3626) from!3004))))))

(declare-fun b!676556 () Bool)

(assert (=> b!676556 (= e!385759 false)))

(declare-fun lt!312540 () Bool)

(assert (=> b!676556 (= lt!312540 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!676557 () Bool)

(assert (=> b!676557 (= e!385755 e!385757)))

(declare-fun res!443139 () Bool)

(assert (=> b!676557 (=> (not res!443139) (not e!385757))))

(assert (=> b!676557 (= res!443139 (bvsle from!3004 i!1382))))

(assert (= (and start!60288 res!443142) b!676546))

(assert (= (and b!676546 res!443124) b!676541))

(assert (= (and b!676541 res!443126) b!676538))

(assert (= (and b!676538 res!443131) b!676543))

(assert (= (and b!676543 res!443143) b!676542))

(assert (= (and b!676543 (not res!443127)) b!676557))

(assert (= (and b!676557 res!443139) b!676551))

(assert (= (and b!676543 res!443140) b!676539))

(assert (= (and b!676539 res!443136) b!676547))

(assert (= (and b!676547 res!443138) b!676552))

(assert (= (and b!676552 res!443125) b!676553))

(assert (= (and b!676553 res!443141) b!676544))

(assert (= (and b!676544 res!443134) b!676554))

(assert (= (and b!676554 res!443128) b!676555))

(assert (= (and b!676555 res!443135) b!676550))

(assert (= (and b!676550 res!443132) b!676545))

(assert (= (and b!676545 res!443129) b!676540))

(assert (= (and b!676545 (not res!443137)) b!676549))

(assert (= (and b!676549 res!443133) b!676548))

(assert (= (and b!676545 res!443130) b!676556))

(declare-fun m!642669 () Bool)

(assert (=> b!676555 m!642669))

(assert (=> b!676555 m!642669))

(declare-fun m!642671 () Bool)

(assert (=> b!676555 m!642671))

(declare-fun m!642673 () Bool)

(assert (=> b!676542 m!642673))

(declare-fun m!642675 () Bool)

(assert (=> b!676556 m!642675))

(declare-fun m!642677 () Bool)

(assert (=> b!676538 m!642677))

(assert (=> b!676540 m!642673))

(declare-fun m!642679 () Bool)

(assert (=> b!676544 m!642679))

(declare-fun m!642681 () Bool)

(assert (=> b!676547 m!642681))

(declare-fun m!642683 () Bool)

(assert (=> b!676546 m!642683))

(declare-fun m!642685 () Bool)

(assert (=> start!60288 m!642685))

(assert (=> b!676548 m!642673))

(declare-fun m!642687 () Bool)

(assert (=> b!676553 m!642687))

(declare-fun m!642689 () Bool)

(assert (=> b!676541 m!642689))

(assert (=> b!676551 m!642673))

(declare-fun m!642691 () Bool)

(assert (=> b!676539 m!642691))

(push 1)

(assert (not b!676542))

(assert (not b!676556))

(assert (not b!676548))

(assert (not b!676546))

(assert (not start!60288))

(assert (not b!676540))

(assert (not b!676541))

(assert (not b!676555))

(assert (not b!676553))

(assert (not b!676551))

(assert (not b!676539))

(assert (not b!676547))

(assert (not b!676538))

(assert (not b!676544))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

