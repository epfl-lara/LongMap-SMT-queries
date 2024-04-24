; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60300 () Bool)

(assert start!60300)

(declare-fun b!675318 () Bool)

(declare-fun res!441642 () Bool)

(declare-fun e!385388 () Bool)

(assert (=> b!675318 (=> (not res!441642) (not e!385388))))

(declare-fun e!385390 () Bool)

(assert (=> b!675318 (= res!441642 e!385390)))

(declare-fun res!441643 () Bool)

(assert (=> b!675318 (=> res!441643 e!385390)))

(declare-fun e!385392 () Bool)

(assert (=> b!675318 (= res!441643 e!385392)))

(declare-fun res!441640 () Bool)

(assert (=> b!675318 (=> (not res!441640) (not e!385392))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!675318 (= res!441640 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675319 () Bool)

(declare-fun e!385394 () Bool)

(declare-datatypes ((List!12780 0))(
  ( (Nil!12777) (Cons!12776 (h!13824 (_ BitVec 64)) (t!19000 List!12780)) )
))
(declare-fun acc!681 () List!12780)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3432 (List!12780 (_ BitVec 64)) Bool)

(assert (=> b!675319 (= e!385394 (not (contains!3432 acc!681 k0!2843)))))

(declare-fun b!675321 () Bool)

(declare-fun e!385391 () Bool)

(assert (=> b!675321 (= e!385391 e!385394)))

(declare-fun res!441633 () Bool)

(assert (=> b!675321 (=> (not res!441633) (not e!385394))))

(assert (=> b!675321 (= res!441633 (bvsle from!3004 i!1382))))

(declare-fun b!675322 () Bool)

(declare-fun e!385389 () Bool)

(assert (=> b!675322 (= e!385390 e!385389)))

(declare-fun res!441634 () Bool)

(assert (=> b!675322 (=> (not res!441634) (not e!385389))))

(assert (=> b!675322 (= res!441634 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675323 () Bool)

(declare-fun res!441639 () Bool)

(assert (=> b!675323 (=> (not res!441639) (not e!385388))))

(declare-datatypes ((array!39285 0))(
  ( (array!39286 (arr!18832 (Array (_ BitVec 32) (_ BitVec 64))) (size!19196 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39285)

(assert (=> b!675323 (= res!441639 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19196 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!675324 () Bool)

(declare-fun res!441652 () Bool)

(assert (=> b!675324 (=> (not res!441652) (not e!385388))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!675324 (= res!441652 (validKeyInArray!0 k0!2843))))

(declare-fun b!675325 () Bool)

(declare-fun res!441649 () Bool)

(assert (=> b!675325 (=> (not res!441649) (not e!385388))))

(assert (=> b!675325 (= res!441649 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19196 a!3626))))))

(declare-fun b!675326 () Bool)

(declare-fun res!441641 () Bool)

(assert (=> b!675326 (=> (not res!441641) (not e!385388))))

(assert (=> b!675326 (= res!441641 e!385391)))

(declare-fun res!441650 () Bool)

(assert (=> b!675326 (=> res!441650 e!385391)))

(declare-fun e!385393 () Bool)

(assert (=> b!675326 (= res!441650 e!385393)))

(declare-fun res!441645 () Bool)

(assert (=> b!675326 (=> (not res!441645) (not e!385393))))

(assert (=> b!675326 (= res!441645 (bvsgt from!3004 i!1382))))

(declare-fun b!675327 () Bool)

(declare-fun res!441644 () Bool)

(assert (=> b!675327 (=> (not res!441644) (not e!385388))))

(assert (=> b!675327 (= res!441644 (not (contains!3432 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675328 () Bool)

(declare-fun res!441647 () Bool)

(assert (=> b!675328 (=> (not res!441647) (not e!385388))))

(assert (=> b!675328 (= res!441647 (not (contains!3432 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675329 () Bool)

(assert (=> b!675329 (= e!385389 (not (contains!3432 acc!681 k0!2843)))))

(declare-fun b!675330 () Bool)

(assert (=> b!675330 (= e!385388 false)))

(declare-fun lt!312811 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39285 (_ BitVec 32) List!12780) Bool)

(assert (=> b!675330 (= lt!312811 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!675331 () Bool)

(assert (=> b!675331 (= e!385392 (contains!3432 acc!681 k0!2843))))

(declare-fun b!675332 () Bool)

(assert (=> b!675332 (= e!385393 (contains!3432 acc!681 k0!2843))))

(declare-fun b!675333 () Bool)

(declare-fun res!441646 () Bool)

(assert (=> b!675333 (=> (not res!441646) (not e!385388))))

(assert (=> b!675333 (= res!441646 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!675334 () Bool)

(declare-fun res!441637 () Bool)

(assert (=> b!675334 (=> (not res!441637) (not e!385388))))

(assert (=> b!675334 (= res!441637 (not (validKeyInArray!0 (select (arr!18832 a!3626) from!3004))))))

(declare-fun b!675335 () Bool)

(declare-fun res!441636 () Bool)

(assert (=> b!675335 (=> (not res!441636) (not e!385388))))

(assert (=> b!675335 (= res!441636 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12777))))

(declare-fun b!675320 () Bool)

(declare-fun res!441651 () Bool)

(assert (=> b!675320 (=> (not res!441651) (not e!385388))))

(declare-fun arrayContainsKey!0 (array!39285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!675320 (= res!441651 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun res!441638 () Bool)

(assert (=> start!60300 (=> (not res!441638) (not e!385388))))

(assert (=> start!60300 (= res!441638 (and (bvslt (size!19196 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19196 a!3626))))))

(assert (=> start!60300 e!385388))

(assert (=> start!60300 true))

(declare-fun array_inv!14691 (array!39285) Bool)

(assert (=> start!60300 (array_inv!14691 a!3626)))

(declare-fun b!675336 () Bool)

(declare-fun res!441635 () Bool)

(assert (=> b!675336 (=> (not res!441635) (not e!385388))))

(assert (=> b!675336 (= res!441635 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!675337 () Bool)

(declare-fun res!441648 () Bool)

(assert (=> b!675337 (=> (not res!441648) (not e!385388))))

(declare-fun noDuplicate!706 (List!12780) Bool)

(assert (=> b!675337 (= res!441648 (noDuplicate!706 acc!681))))

(assert (= (and start!60300 res!441638) b!675337))

(assert (= (and b!675337 res!441648) b!675328))

(assert (= (and b!675328 res!441647) b!675327))

(assert (= (and b!675327 res!441644) b!675326))

(assert (= (and b!675326 res!441645) b!675332))

(assert (= (and b!675326 (not res!441650)) b!675321))

(assert (= (and b!675321 res!441633) b!675319))

(assert (= (and b!675326 res!441641) b!675335))

(assert (= (and b!675335 res!441636) b!675336))

(assert (= (and b!675336 res!441635) b!675325))

(assert (= (and b!675325 res!441649) b!675324))

(assert (= (and b!675324 res!441652) b!675320))

(assert (= (and b!675320 res!441651) b!675323))

(assert (= (and b!675323 res!441639) b!675334))

(assert (= (and b!675334 res!441637) b!675333))

(assert (= (and b!675333 res!441646) b!675318))

(assert (= (and b!675318 res!441640) b!675331))

(assert (= (and b!675318 (not res!441643)) b!675322))

(assert (= (and b!675322 res!441634) b!675329))

(assert (= (and b!675318 res!441642) b!675330))

(declare-fun m!643453 () Bool)

(assert (=> b!675324 m!643453))

(declare-fun m!643455 () Bool)

(assert (=> b!675328 m!643455))

(declare-fun m!643457 () Bool)

(assert (=> b!675336 m!643457))

(declare-fun m!643459 () Bool)

(assert (=> b!675330 m!643459))

(declare-fun m!643461 () Bool)

(assert (=> b!675332 m!643461))

(declare-fun m!643463 () Bool)

(assert (=> b!675327 m!643463))

(declare-fun m!643465 () Bool)

(assert (=> b!675320 m!643465))

(assert (=> b!675329 m!643461))

(declare-fun m!643467 () Bool)

(assert (=> start!60300 m!643467))

(assert (=> b!675331 m!643461))

(assert (=> b!675319 m!643461))

(declare-fun m!643469 () Bool)

(assert (=> b!675337 m!643469))

(declare-fun m!643471 () Bool)

(assert (=> b!675334 m!643471))

(assert (=> b!675334 m!643471))

(declare-fun m!643473 () Bool)

(assert (=> b!675334 m!643473))

(declare-fun m!643475 () Bool)

(assert (=> b!675335 m!643475))

(check-sat (not b!675319) (not start!60300) (not b!675320) (not b!675337) (not b!675334) (not b!675324) (not b!675327) (not b!675335) (not b!675331) (not b!675329) (not b!675328) (not b!675332) (not b!675330) (not b!675336))
(check-sat)
