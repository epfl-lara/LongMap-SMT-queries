; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59896 () Bool)

(assert start!59896)

(declare-fun b!661567 () Bool)

(declare-fun e!380051 () Bool)

(assert (=> b!661567 (= e!380051 (not true))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!38881 0))(
  ( (array!38882 (arr!18630 (Array (_ BitVec 32) (_ BitVec 64))) (size!18994 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38881)

(declare-fun arrayContainsKey!0 (array!38881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661567 (arrayContainsKey!0 (array!38882 (store (arr!18630 a!3626) i!1382 k!2843) (size!18994 a!3626)) k!2843 from!3004)))

(declare-fun b!661568 () Bool)

(declare-fun res!429528 () Bool)

(assert (=> b!661568 (=> (not res!429528) (not e!380051))))

(assert (=> b!661568 (= res!429528 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!18994 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661569 () Bool)

(declare-fun e!380049 () Bool)

(declare-datatypes ((List!12578 0))(
  ( (Nil!12575) (Cons!12574 (h!13622 (_ BitVec 64)) (t!18798 List!12578)) )
))
(declare-fun acc!681 () List!12578)

(declare-fun contains!3230 (List!12578 (_ BitVec 64)) Bool)

(assert (=> b!661569 (= e!380049 (not (contains!3230 acc!681 k!2843)))))

(declare-fun b!661570 () Bool)

(declare-fun res!429531 () Bool)

(assert (=> b!661570 (=> (not res!429531) (not e!380051))))

(declare-fun e!380050 () Bool)

(assert (=> b!661570 (= res!429531 e!380050)))

(declare-fun res!429519 () Bool)

(assert (=> b!661570 (=> res!429519 e!380050)))

(declare-fun e!380048 () Bool)

(assert (=> b!661570 (= res!429519 e!380048)))

(declare-fun res!429530 () Bool)

(assert (=> b!661570 (=> (not res!429530) (not e!380048))))

(assert (=> b!661570 (= res!429530 (bvsgt from!3004 i!1382))))

(declare-fun b!661571 () Bool)

(declare-fun res!429527 () Bool)

(assert (=> b!661571 (=> (not res!429527) (not e!380051))))

(declare-fun noDuplicate!504 (List!12578) Bool)

(assert (=> b!661571 (= res!429527 (noDuplicate!504 acc!681))))

(declare-fun b!661572 () Bool)

(declare-fun res!429523 () Bool)

(assert (=> b!661572 (=> (not res!429523) (not e!380051))))

(assert (=> b!661572 (= res!429523 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!18994 a!3626))))))

(declare-fun b!661573 () Bool)

(declare-fun res!429525 () Bool)

(assert (=> b!661573 (=> (not res!429525) (not e!380051))))

(assert (=> b!661573 (= res!429525 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!429520 () Bool)

(assert (=> start!59896 (=> (not res!429520) (not e!380051))))

(assert (=> start!59896 (= res!429520 (and (bvslt (size!18994 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18994 a!3626))))))

(assert (=> start!59896 e!380051))

(assert (=> start!59896 true))

(declare-fun array_inv!14489 (array!38881) Bool)

(assert (=> start!59896 (array_inv!14489 a!3626)))

(declare-fun b!661566 () Bool)

(declare-fun res!429522 () Bool)

(assert (=> b!661566 (=> (not res!429522) (not e!380051))))

(declare-fun arrayNoDuplicates!0 (array!38881 (_ BitVec 32) List!12578) Bool)

(assert (=> b!661566 (= res!429522 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661574 () Bool)

(assert (=> b!661574 (= e!380048 (contains!3230 acc!681 k!2843))))

(declare-fun b!661575 () Bool)

(assert (=> b!661575 (= e!380050 e!380049)))

(declare-fun res!429524 () Bool)

(assert (=> b!661575 (=> (not res!429524) (not e!380049))))

(assert (=> b!661575 (= res!429524 (bvsle from!3004 i!1382))))

(declare-fun b!661576 () Bool)

(declare-fun res!429521 () Bool)

(assert (=> b!661576 (=> (not res!429521) (not e!380051))))

(assert (=> b!661576 (= res!429521 (not (contains!3230 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661577 () Bool)

(declare-fun res!429529 () Bool)

(assert (=> b!661577 (=> (not res!429529) (not e!380051))))

(assert (=> b!661577 (= res!429529 (not (contains!3230 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661578 () Bool)

(declare-fun res!429526 () Bool)

(assert (=> b!661578 (=> (not res!429526) (not e!380051))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661578 (= res!429526 (validKeyInArray!0 k!2843))))

(declare-fun b!661579 () Bool)

(declare-fun res!429532 () Bool)

(assert (=> b!661579 (=> (not res!429532) (not e!380051))))

(assert (=> b!661579 (= res!429532 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12575))))

(assert (= (and start!59896 res!429520) b!661571))

(assert (= (and b!661571 res!429527) b!661576))

(assert (= (and b!661576 res!429521) b!661577))

(assert (= (and b!661577 res!429529) b!661570))

(assert (= (and b!661570 res!429530) b!661574))

(assert (= (and b!661570 (not res!429519)) b!661575))

(assert (= (and b!661575 res!429524) b!661569))

(assert (= (and b!661570 res!429531) b!661579))

(assert (= (and b!661579 res!429532) b!661566))

(assert (= (and b!661566 res!429522) b!661572))

(assert (= (and b!661572 res!429523) b!661578))

(assert (= (and b!661578 res!429526) b!661573))

(assert (= (and b!661573 res!429525) b!661568))

(assert (= (and b!661568 res!429528) b!661567))

(declare-fun m!634275 () Bool)

(assert (=> b!661578 m!634275))

(declare-fun m!634277 () Bool)

(assert (=> b!661569 m!634277))

(declare-fun m!634279 () Bool)

(assert (=> b!661576 m!634279))

(declare-fun m!634281 () Bool)

(assert (=> b!661577 m!634281))

(declare-fun m!634283 () Bool)

(assert (=> b!661573 m!634283))

(declare-fun m!634285 () Bool)

(assert (=> b!661579 m!634285))

(assert (=> b!661574 m!634277))

(declare-fun m!634287 () Bool)

(assert (=> b!661571 m!634287))

(declare-fun m!634289 () Bool)

(assert (=> start!59896 m!634289))

(declare-fun m!634291 () Bool)

(assert (=> b!661567 m!634291))

(declare-fun m!634293 () Bool)

(assert (=> b!661567 m!634293))

(declare-fun m!634295 () Bool)

(assert (=> b!661566 m!634295))

(push 1)

(assert (not b!661576))

(assert (not b!661571))

(assert (not start!59896))

(assert (not b!661578))

(assert (not b!661566))

(assert (not b!661579))

(assert (not b!661573))

(assert (not b!661574))

(assert (not b!661577))

(assert (not b!661567))

(assert (not b!661569))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

