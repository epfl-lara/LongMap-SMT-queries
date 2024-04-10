; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62562 () Bool)

(assert start!62562)

(declare-fun b!705376 () Bool)

(declare-fun res!469186 () Bool)

(declare-fun e!397824 () Bool)

(assert (=> b!705376 (=> (not res!469186) (not e!397824))))

(declare-datatypes ((array!40241 0))(
  ( (array!40242 (arr!19277 (Array (_ BitVec 32) (_ BitVec 64))) (size!19662 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40241)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!705376 (= res!469186 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!705377 () Bool)

(declare-fun res!469196 () Bool)

(assert (=> b!705377 (=> (not res!469196) (not e!397824))))

(declare-datatypes ((List!13318 0))(
  ( (Nil!13315) (Cons!13314 (h!14359 (_ BitVec 64)) (t!19600 List!13318)) )
))
(declare-fun newAcc!49 () List!13318)

(declare-fun contains!3895 (List!13318 (_ BitVec 64)) Bool)

(assert (=> b!705377 (= res!469196 (not (contains!3895 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705378 () Bool)

(declare-fun res!469200 () Bool)

(assert (=> b!705378 (=> (not res!469200) (not e!397824))))

(declare-fun noDuplicate!1142 (List!13318) Bool)

(assert (=> b!705378 (= res!469200 (noDuplicate!1142 newAcc!49))))

(declare-fun b!705379 () Bool)

(declare-fun res!469198 () Bool)

(assert (=> b!705379 (=> (not res!469198) (not e!397824))))

(assert (=> b!705379 (= res!469198 (not (contains!3895 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705380 () Bool)

(declare-fun res!469199 () Bool)

(assert (=> b!705380 (=> (not res!469199) (not e!397824))))

(declare-fun acc!652 () List!13318)

(assert (=> b!705380 (= res!469199 (noDuplicate!1142 acc!652))))

(declare-fun b!705381 () Bool)

(declare-fun res!469194 () Bool)

(assert (=> b!705381 (=> (not res!469194) (not e!397824))))

(assert (=> b!705381 (= res!469194 (not (contains!3895 acc!652 k!2824)))))

(declare-fun b!705382 () Bool)

(declare-fun res!469187 () Bool)

(assert (=> b!705382 (=> (not res!469187) (not e!397824))))

(assert (=> b!705382 (= res!469187 (contains!3895 newAcc!49 k!2824))))

(declare-fun res!469191 () Bool)

(assert (=> start!62562 (=> (not res!469191) (not e!397824))))

(assert (=> start!62562 (= res!469191 (and (bvslt (size!19662 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19662 a!3591))))))

(assert (=> start!62562 e!397824))

(assert (=> start!62562 true))

(declare-fun array_inv!15073 (array!40241) Bool)

(assert (=> start!62562 (array_inv!15073 a!3591)))

(declare-fun b!705383 () Bool)

(assert (=> b!705383 (= e!397824 false)))

(declare-fun lt!317895 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40241 (_ BitVec 32) List!13318) Bool)

(assert (=> b!705383 (= lt!317895 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!705384 () Bool)

(declare-fun res!469189 () Bool)

(assert (=> b!705384 (=> (not res!469189) (not e!397824))))

(assert (=> b!705384 (= res!469189 (not (contains!3895 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705385 () Bool)

(declare-fun res!469202 () Bool)

(assert (=> b!705385 (=> (not res!469202) (not e!397824))))

(declare-fun -!305 (List!13318 (_ BitVec 64)) List!13318)

(assert (=> b!705385 (= res!469202 (= (-!305 newAcc!49 k!2824) acc!652))))

(declare-fun b!705386 () Bool)

(declare-fun res!469192 () Bool)

(assert (=> b!705386 (=> (not res!469192) (not e!397824))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!705386 (= res!469192 (validKeyInArray!0 k!2824))))

(declare-fun b!705387 () Bool)

(declare-fun res!469188 () Bool)

(assert (=> b!705387 (=> (not res!469188) (not e!397824))))

(assert (=> b!705387 (= res!469188 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!705388 () Bool)

(declare-fun res!469193 () Bool)

(assert (=> b!705388 (=> (not res!469193) (not e!397824))))

(assert (=> b!705388 (= res!469193 (not (validKeyInArray!0 (select (arr!19277 a!3591) from!2969))))))

(declare-fun b!705389 () Bool)

(declare-fun res!469190 () Bool)

(assert (=> b!705389 (=> (not res!469190) (not e!397824))))

(assert (=> b!705389 (= res!469190 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!705390 () Bool)

(declare-fun res!469203 () Bool)

(assert (=> b!705390 (=> (not res!469203) (not e!397824))))

(assert (=> b!705390 (= res!469203 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!705391 () Bool)

(declare-fun res!469197 () Bool)

(assert (=> b!705391 (=> (not res!469197) (not e!397824))))

(declare-fun subseq!340 (List!13318 List!13318) Bool)

(assert (=> b!705391 (= res!469197 (subseq!340 acc!652 newAcc!49))))

(declare-fun b!705392 () Bool)

(declare-fun res!469201 () Bool)

(assert (=> b!705392 (=> (not res!469201) (not e!397824))))

(assert (=> b!705392 (= res!469201 (not (contains!3895 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705393 () Bool)

(declare-fun res!469195 () Bool)

(assert (=> b!705393 (=> (not res!469195) (not e!397824))))

(assert (=> b!705393 (= res!469195 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19662 a!3591)))))

(assert (= (and start!62562 res!469191) b!705380))

(assert (= (and b!705380 res!469199) b!705378))

(assert (= (and b!705378 res!469200) b!705392))

(assert (= (and b!705392 res!469201) b!705384))

(assert (= (and b!705384 res!469189) b!705390))

(assert (= (and b!705390 res!469203) b!705381))

(assert (= (and b!705381 res!469194) b!705386))

(assert (= (and b!705386 res!469192) b!705387))

(assert (= (and b!705387 res!469188) b!705391))

(assert (= (and b!705391 res!469197) b!705382))

(assert (= (and b!705382 res!469187) b!705385))

(assert (= (and b!705385 res!469202) b!705379))

(assert (= (and b!705379 res!469198) b!705377))

(assert (= (and b!705377 res!469196) b!705393))

(assert (= (and b!705393 res!469195) b!705388))

(assert (= (and b!705388 res!469193) b!705389))

(assert (= (and b!705389 res!469190) b!705376))

(assert (= (and b!705376 res!469186) b!705383))

(declare-fun m!663559 () Bool)

(assert (=> b!705383 m!663559))

(declare-fun m!663561 () Bool)

(assert (=> b!705386 m!663561))

(declare-fun m!663563 () Bool)

(assert (=> b!705380 m!663563))

(declare-fun m!663565 () Bool)

(assert (=> b!705390 m!663565))

(declare-fun m!663567 () Bool)

(assert (=> b!705381 m!663567))

(declare-fun m!663569 () Bool)

(assert (=> b!705392 m!663569))

(declare-fun m!663571 () Bool)

(assert (=> b!705382 m!663571))

(declare-fun m!663573 () Bool)

(assert (=> b!705379 m!663573))

(declare-fun m!663575 () Bool)

(assert (=> b!705376 m!663575))

(declare-fun m!663577 () Bool)

(assert (=> b!705387 m!663577))

(declare-fun m!663579 () Bool)

(assert (=> b!705384 m!663579))

(declare-fun m!663581 () Bool)

(assert (=> b!705378 m!663581))

(declare-fun m!663583 () Bool)

(assert (=> start!62562 m!663583))

(declare-fun m!663585 () Bool)

(assert (=> b!705391 m!663585))

(declare-fun m!663587 () Bool)

(assert (=> b!705388 m!663587))

(assert (=> b!705388 m!663587))

(declare-fun m!663589 () Bool)

(assert (=> b!705388 m!663589))

(declare-fun m!663591 () Bool)

(assert (=> b!705385 m!663591))

(declare-fun m!663593 () Bool)

(assert (=> b!705377 m!663593))

(push 1)

(assert (not b!705390))

(assert (not b!705381))

(assert (not b!705379))

(assert (not b!705376))

(assert (not b!705382))

(assert (not start!62562))

(assert (not b!705384))

(assert (not b!705391))

(assert (not b!705387))

(assert (not b!705378))

(assert (not b!705386))

(assert (not b!705377))

(assert (not b!705388))

(assert (not b!705383))

(assert (not b!705385))

(assert (not b!705380))

(assert (not b!705392))

(check-sat)

