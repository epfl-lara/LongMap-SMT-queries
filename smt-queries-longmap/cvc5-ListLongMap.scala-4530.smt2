; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62648 () Bool)

(assert start!62648)

(declare-fun b!707319 () Bool)

(declare-fun res!471135 () Bool)

(declare-fun e!398082 () Bool)

(assert (=> b!707319 (=> (not res!471135) (not e!398082))))

(declare-datatypes ((List!13361 0))(
  ( (Nil!13358) (Cons!13357 (h!14402 (_ BitVec 64)) (t!19643 List!13361)) )
))
(declare-fun acc!652 () List!13361)

(declare-fun newAcc!49 () List!13361)

(declare-fun subseq!383 (List!13361 List!13361) Bool)

(assert (=> b!707319 (= res!471135 (subseq!383 acc!652 newAcc!49))))

(declare-fun b!707320 () Bool)

(declare-fun res!471133 () Bool)

(assert (=> b!707320 (=> (not res!471133) (not e!398082))))

(declare-fun noDuplicate!1185 (List!13361) Bool)

(assert (=> b!707320 (= res!471133 (noDuplicate!1185 acc!652))))

(declare-fun b!707321 () Bool)

(declare-fun res!471140 () Bool)

(assert (=> b!707321 (=> (not res!471140) (not e!398082))))

(declare-datatypes ((array!40327 0))(
  ( (array!40328 (arr!19320 (Array (_ BitVec 32) (_ BitVec 64))) (size!19705 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40327)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!707321 (= res!471140 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!707322 () Bool)

(assert (=> b!707322 (= e!398082 false)))

(declare-fun lt!317997 () Bool)

(declare-fun contains!3938 (List!13361 (_ BitVec 64)) Bool)

(assert (=> b!707322 (= lt!317997 (contains!3938 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707323 () Bool)

(declare-fun res!471131 () Bool)

(assert (=> b!707323 (=> (not res!471131) (not e!398082))))

(assert (=> b!707323 (= res!471131 (contains!3938 newAcc!49 k!2824))))

(declare-fun b!707324 () Bool)

(declare-fun res!471129 () Bool)

(assert (=> b!707324 (=> (not res!471129) (not e!398082))))

(assert (=> b!707324 (= res!471129 (not (contains!3938 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707325 () Bool)

(declare-fun res!471130 () Bool)

(assert (=> b!707325 (=> (not res!471130) (not e!398082))))

(assert (=> b!707325 (= res!471130 (noDuplicate!1185 newAcc!49))))

(declare-fun b!707326 () Bool)

(declare-fun res!471141 () Bool)

(assert (=> b!707326 (=> (not res!471141) (not e!398082))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!707326 (= res!471141 (validKeyInArray!0 k!2824))))

(declare-fun b!707328 () Bool)

(declare-fun res!471134 () Bool)

(assert (=> b!707328 (=> (not res!471134) (not e!398082))))

(declare-fun arrayNoDuplicates!0 (array!40327 (_ BitVec 32) List!13361) Bool)

(assert (=> b!707328 (= res!471134 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!707329 () Bool)

(declare-fun res!471132 () Bool)

(assert (=> b!707329 (=> (not res!471132) (not e!398082))))

(declare-fun -!348 (List!13361 (_ BitVec 64)) List!13361)

(assert (=> b!707329 (= res!471132 (= (-!348 newAcc!49 k!2824) acc!652))))

(declare-fun b!707330 () Bool)

(declare-fun res!471139 () Bool)

(assert (=> b!707330 (=> (not res!471139) (not e!398082))))

(assert (=> b!707330 (= res!471139 (not (contains!3938 acc!652 k!2824)))))

(declare-fun b!707331 () Bool)

(declare-fun res!471136 () Bool)

(assert (=> b!707331 (=> (not res!471136) (not e!398082))))

(assert (=> b!707331 (= res!471136 (not (contains!3938 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707327 () Bool)

(declare-fun res!471138 () Bool)

(assert (=> b!707327 (=> (not res!471138) (not e!398082))))

(assert (=> b!707327 (= res!471138 (not (contains!3938 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!471137 () Bool)

(assert (=> start!62648 (=> (not res!471137) (not e!398082))))

(assert (=> start!62648 (= res!471137 (and (bvslt (size!19705 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19705 a!3591))))))

(assert (=> start!62648 e!398082))

(assert (=> start!62648 true))

(declare-fun array_inv!15116 (array!40327) Bool)

(assert (=> start!62648 (array_inv!15116 a!3591)))

(assert (= (and start!62648 res!471137) b!707320))

(assert (= (and b!707320 res!471133) b!707325))

(assert (= (and b!707325 res!471130) b!707324))

(assert (= (and b!707324 res!471129) b!707327))

(assert (= (and b!707327 res!471138) b!707321))

(assert (= (and b!707321 res!471140) b!707330))

(assert (= (and b!707330 res!471139) b!707326))

(assert (= (and b!707326 res!471141) b!707328))

(assert (= (and b!707328 res!471134) b!707319))

(assert (= (and b!707319 res!471135) b!707323))

(assert (= (and b!707323 res!471131) b!707329))

(assert (= (and b!707329 res!471132) b!707331))

(assert (= (and b!707331 res!471136) b!707322))

(declare-fun m!664927 () Bool)

(assert (=> b!707319 m!664927))

(declare-fun m!664929 () Bool)

(assert (=> b!707329 m!664929))

(declare-fun m!664931 () Bool)

(assert (=> b!707331 m!664931))

(declare-fun m!664933 () Bool)

(assert (=> b!707327 m!664933))

(declare-fun m!664935 () Bool)

(assert (=> b!707328 m!664935))

(declare-fun m!664937 () Bool)

(assert (=> b!707320 m!664937))

(declare-fun m!664939 () Bool)

(assert (=> b!707326 m!664939))

(declare-fun m!664941 () Bool)

(assert (=> b!707324 m!664941))

(declare-fun m!664943 () Bool)

(assert (=> b!707323 m!664943))

(declare-fun m!664945 () Bool)

(assert (=> b!707321 m!664945))

(declare-fun m!664947 () Bool)

(assert (=> b!707330 m!664947))

(declare-fun m!664949 () Bool)

(assert (=> start!62648 m!664949))

(declare-fun m!664951 () Bool)

(assert (=> b!707325 m!664951))

(declare-fun m!664953 () Bool)

(assert (=> b!707322 m!664953))

(push 1)

(assert (not b!707327))

(assert (not b!707325))

(assert (not b!707321))

(assert (not start!62648))

(assert (not b!707324))

(assert (not b!707328))

(assert (not b!707329))

(assert (not b!707323))

(assert (not b!707330))

(assert (not b!707322))

(assert (not b!707320))

(assert (not b!707326))

(assert (not b!707319))

(assert (not b!707331))

(check-sat)

