; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62486 () Bool)

(assert start!62486)

(declare-fun b!703324 () Bool)

(declare-fun res!467136 () Bool)

(declare-fun e!397597 () Bool)

(assert (=> b!703324 (=> (not res!467136) (not e!397597))))

(declare-datatypes ((array!40165 0))(
  ( (array!40166 (arr!19239 (Array (_ BitVec 32) (_ BitVec 64))) (size!19624 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40165)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!703324 (= res!467136 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!703325 () Bool)

(declare-fun res!467135 () Bool)

(assert (=> b!703325 (=> (not res!467135) (not e!397597))))

(declare-datatypes ((List!13280 0))(
  ( (Nil!13277) (Cons!13276 (h!14321 (_ BitVec 64)) (t!19562 List!13280)) )
))
(declare-fun acc!652 () List!13280)

(declare-fun newAcc!49 () List!13280)

(declare-fun subseq!302 (List!13280 List!13280) Bool)

(assert (=> b!703325 (= res!467135 (subseq!302 acc!652 newAcc!49))))

(declare-fun b!703326 () Bool)

(declare-fun res!467151 () Bool)

(assert (=> b!703326 (=> (not res!467151) (not e!397597))))

(assert (=> b!703326 (= res!467151 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!703327 () Bool)

(declare-fun res!467148 () Bool)

(assert (=> b!703327 (=> (not res!467148) (not e!397597))))

(declare-fun contains!3857 (List!13280 (_ BitVec 64)) Bool)

(assert (=> b!703327 (= res!467148 (not (contains!3857 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703328 () Bool)

(declare-fun res!467137 () Bool)

(assert (=> b!703328 (=> (not res!467137) (not e!397597))))

(assert (=> b!703328 (= res!467137 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!703329 () Bool)

(declare-fun res!467139 () Bool)

(assert (=> b!703329 (=> (not res!467139) (not e!397597))))

(declare-fun noDuplicate!1104 (List!13280) Bool)

(assert (=> b!703329 (= res!467139 (noDuplicate!1104 newAcc!49))))

(declare-fun res!467145 () Bool)

(assert (=> start!62486 (=> (not res!467145) (not e!397597))))

(assert (=> start!62486 (= res!467145 (and (bvslt (size!19624 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19624 a!3591))))))

(assert (=> start!62486 e!397597))

(assert (=> start!62486 true))

(declare-fun array_inv!15035 (array!40165) Bool)

(assert (=> start!62486 (array_inv!15035 a!3591)))

(declare-fun b!703330 () Bool)

(assert (=> b!703330 (= e!397597 false)))

(declare-fun lt!317781 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40165 (_ BitVec 32) List!13280) Bool)

(assert (=> b!703330 (= lt!317781 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!703331 () Bool)

(declare-fun res!467143 () Bool)

(assert (=> b!703331 (=> (not res!467143) (not e!397597))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!703331 (= res!467143 (validKeyInArray!0 k!2824))))

(declare-fun b!703332 () Bool)

(declare-fun res!467138 () Bool)

(assert (=> b!703332 (=> (not res!467138) (not e!397597))))

(assert (=> b!703332 (= res!467138 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19624 a!3591)))))

(declare-fun b!703333 () Bool)

(declare-fun res!467149 () Bool)

(assert (=> b!703333 (=> (not res!467149) (not e!397597))))

(assert (=> b!703333 (= res!467149 (not (contains!3857 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703334 () Bool)

(declare-fun res!467147 () Bool)

(assert (=> b!703334 (=> (not res!467147) (not e!397597))))

(assert (=> b!703334 (= res!467147 (not (contains!3857 acc!652 k!2824)))))

(declare-fun b!703335 () Bool)

(declare-fun res!467144 () Bool)

(assert (=> b!703335 (=> (not res!467144) (not e!397597))))

(assert (=> b!703335 (= res!467144 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!703336 () Bool)

(declare-fun res!467141 () Bool)

(assert (=> b!703336 (=> (not res!467141) (not e!397597))))

(declare-fun -!267 (List!13280 (_ BitVec 64)) List!13280)

(assert (=> b!703336 (= res!467141 (= (-!267 newAcc!49 k!2824) acc!652))))

(declare-fun b!703337 () Bool)

(declare-fun res!467142 () Bool)

(assert (=> b!703337 (=> (not res!467142) (not e!397597))))

(assert (=> b!703337 (= res!467142 (noDuplicate!1104 acc!652))))

(declare-fun b!703338 () Bool)

(declare-fun res!467146 () Bool)

(assert (=> b!703338 (=> (not res!467146) (not e!397597))))

(assert (=> b!703338 (= res!467146 (not (contains!3857 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703339 () Bool)

(declare-fun res!467134 () Bool)

(assert (=> b!703339 (=> (not res!467134) (not e!397597))))

(assert (=> b!703339 (= res!467134 (not (validKeyInArray!0 (select (arr!19239 a!3591) from!2969))))))

(declare-fun b!703340 () Bool)

(declare-fun res!467140 () Bool)

(assert (=> b!703340 (=> (not res!467140) (not e!397597))))

(assert (=> b!703340 (= res!467140 (not (contains!3857 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703341 () Bool)

(declare-fun res!467150 () Bool)

(assert (=> b!703341 (=> (not res!467150) (not e!397597))))

(assert (=> b!703341 (= res!467150 (contains!3857 newAcc!49 k!2824))))

(assert (= (and start!62486 res!467145) b!703337))

(assert (= (and b!703337 res!467142) b!703329))

(assert (= (and b!703329 res!467139) b!703333))

(assert (= (and b!703333 res!467149) b!703340))

(assert (= (and b!703340 res!467140) b!703324))

(assert (= (and b!703324 res!467136) b!703334))

(assert (= (and b!703334 res!467147) b!703331))

(assert (= (and b!703331 res!467143) b!703335))

(assert (= (and b!703335 res!467144) b!703325))

(assert (= (and b!703325 res!467135) b!703341))

(assert (= (and b!703341 res!467150) b!703336))

(assert (= (and b!703336 res!467141) b!703338))

(assert (= (and b!703338 res!467146) b!703327))

(assert (= (and b!703327 res!467148) b!703332))

(assert (= (and b!703332 res!467138) b!703339))

(assert (= (and b!703339 res!467134) b!703328))

(assert (= (and b!703328 res!467137) b!703326))

(assert (= (and b!703326 res!467151) b!703330))

(declare-fun m!662191 () Bool)

(assert (=> b!703329 m!662191))

(declare-fun m!662193 () Bool)

(assert (=> b!703326 m!662193))

(declare-fun m!662195 () Bool)

(assert (=> b!703339 m!662195))

(assert (=> b!703339 m!662195))

(declare-fun m!662197 () Bool)

(assert (=> b!703339 m!662197))

(declare-fun m!662199 () Bool)

(assert (=> b!703325 m!662199))

(declare-fun m!662201 () Bool)

(assert (=> b!703331 m!662201))

(declare-fun m!662203 () Bool)

(assert (=> b!703333 m!662203))

(declare-fun m!662205 () Bool)

(assert (=> b!703335 m!662205))

(declare-fun m!662207 () Bool)

(assert (=> b!703330 m!662207))

(declare-fun m!662209 () Bool)

(assert (=> b!703338 m!662209))

(declare-fun m!662211 () Bool)

(assert (=> b!703336 m!662211))

(declare-fun m!662213 () Bool)

(assert (=> b!703341 m!662213))

(declare-fun m!662215 () Bool)

(assert (=> b!703340 m!662215))

(declare-fun m!662217 () Bool)

(assert (=> b!703337 m!662217))

(declare-fun m!662219 () Bool)

(assert (=> b!703334 m!662219))

(declare-fun m!662221 () Bool)

(assert (=> start!62486 m!662221))

(declare-fun m!662223 () Bool)

(assert (=> b!703324 m!662223))

(declare-fun m!662225 () Bool)

(assert (=> b!703327 m!662225))

(push 1)

(assert (not b!703334))

(assert (not b!703337))

(assert (not b!703339))

(assert (not b!703340))

(assert (not b!703327))

(assert (not b!703335))

(assert (not b!703330))

(assert (not b!703333))

(assert (not b!703338))

(assert (not b!703331))

(assert (not b!703326))

(assert (not start!62486))

(assert (not b!703336))

(assert (not b!703325))

(assert (not b!703324))

(assert (not b!703341))

(assert (not b!703329))

(check-sat)

