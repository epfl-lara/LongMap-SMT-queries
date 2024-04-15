; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62130 () Bool)

(assert start!62130)

(declare-fun res!459616 () Bool)

(declare-fun e!395539 () Bool)

(assert (=> start!62130 (=> (not res!459616) (not e!395539))))

(declare-datatypes ((array!39931 0))(
  ( (array!39932 (arr!19126 (Array (_ BitVec 32) (_ BitVec 64))) (size!19508 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39931)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!62130 (= res!459616 (and (bvslt (size!19508 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19508 a!3626))))))

(assert (=> start!62130 e!395539))

(assert (=> start!62130 true))

(declare-fun array_inv!15009 (array!39931) Bool)

(assert (=> start!62130 (array_inv!15009 a!3626)))

(declare-fun b!695500 () Bool)

(assert (=> b!695500 (= e!395539 false)))

(declare-fun lt!316830 () Bool)

(declare-datatypes ((List!13206 0))(
  ( (Nil!13203) (Cons!13202 (h!14247 (_ BitVec 64)) (t!19479 List!13206)) )
))
(declare-fun acc!681 () List!13206)

(declare-fun arrayNoDuplicates!0 (array!39931 (_ BitVec 32) List!13206) Bool)

(assert (=> b!695500 (= lt!316830 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!695501 () Bool)

(declare-fun e!395538 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3728 (List!13206 (_ BitVec 64)) Bool)

(assert (=> b!695501 (= e!395538 (not (contains!3728 acc!681 k!2843)))))

(declare-fun b!695502 () Bool)

(declare-fun res!459611 () Bool)

(assert (=> b!695502 (=> (not res!459611) (not e!395539))))

(assert (=> b!695502 (= res!459611 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13203))))

(declare-fun b!695503 () Bool)

(declare-fun res!459615 () Bool)

(assert (=> b!695503 (=> (not res!459615) (not e!395539))))

(assert (=> b!695503 (= res!459615 (not (contains!3728 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695504 () Bool)

(declare-fun res!459608 () Bool)

(assert (=> b!695504 (=> (not res!459608) (not e!395539))))

(declare-fun e!395537 () Bool)

(assert (=> b!695504 (= res!459608 e!395537)))

(declare-fun res!459612 () Bool)

(assert (=> b!695504 (=> res!459612 e!395537)))

(declare-fun e!395540 () Bool)

(assert (=> b!695504 (= res!459612 e!395540)))

(declare-fun res!459610 () Bool)

(assert (=> b!695504 (=> (not res!459610) (not e!395540))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!695504 (= res!459610 (bvsgt from!3004 i!1382))))

(declare-fun b!695505 () Bool)

(declare-fun res!459614 () Bool)

(assert (=> b!695505 (=> (not res!459614) (not e!395539))))

(assert (=> b!695505 (= res!459614 (not (contains!3728 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695506 () Bool)

(assert (=> b!695506 (= e!395537 e!395538)))

(declare-fun res!459609 () Bool)

(assert (=> b!695506 (=> (not res!459609) (not e!395538))))

(assert (=> b!695506 (= res!459609 (bvsle from!3004 i!1382))))

(declare-fun b!695507 () Bool)

(assert (=> b!695507 (= e!395540 (contains!3728 acc!681 k!2843))))

(declare-fun b!695508 () Bool)

(declare-fun res!459613 () Bool)

(assert (=> b!695508 (=> (not res!459613) (not e!395539))))

(declare-fun noDuplicate!997 (List!13206) Bool)

(assert (=> b!695508 (= res!459613 (noDuplicate!997 acc!681))))

(assert (= (and start!62130 res!459616) b!695508))

(assert (= (and b!695508 res!459613) b!695505))

(assert (= (and b!695505 res!459614) b!695503))

(assert (= (and b!695503 res!459615) b!695504))

(assert (= (and b!695504 res!459610) b!695507))

(assert (= (and b!695504 (not res!459612)) b!695506))

(assert (= (and b!695506 res!459609) b!695501))

(assert (= (and b!695504 res!459608) b!695502))

(assert (= (and b!695502 res!459611) b!695500))

(declare-fun m!656347 () Bool)

(assert (=> b!695502 m!656347))

(declare-fun m!656349 () Bool)

(assert (=> b!695501 m!656349))

(declare-fun m!656351 () Bool)

(assert (=> b!695503 m!656351))

(declare-fun m!656353 () Bool)

(assert (=> b!695505 m!656353))

(declare-fun m!656355 () Bool)

(assert (=> b!695508 m!656355))

(declare-fun m!656357 () Bool)

(assert (=> b!695500 m!656357))

(assert (=> b!695507 m!656349))

(declare-fun m!656359 () Bool)

(assert (=> start!62130 m!656359))

(push 1)

(assert (not b!695503))

(assert (not start!62130))

(assert (not b!695502))

(assert (not b!695505))

(assert (not b!695501))

(assert (not b!695500))

(assert (not b!695507))

(assert (not b!695508))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

