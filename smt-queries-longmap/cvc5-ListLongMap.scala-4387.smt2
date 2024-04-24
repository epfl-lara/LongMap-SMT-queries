; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60412 () Bool)

(assert start!60412)

(declare-fun b!678365 () Bool)

(declare-fun e!386628 () Bool)

(declare-datatypes ((List!12836 0))(
  ( (Nil!12833) (Cons!12832 (h!13880 (_ BitVec 64)) (t!19056 List!12836)) )
))
(declare-fun acc!681 () List!12836)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3488 (List!12836 (_ BitVec 64)) Bool)

(assert (=> b!678365 (= e!386628 (not (contains!3488 acc!681 k!2843)))))

(declare-fun b!678366 () Bool)

(declare-fun e!386629 () Bool)

(assert (=> b!678366 (= e!386629 (contains!3488 acc!681 k!2843))))

(declare-fun res!444687 () Bool)

(declare-fun e!386630 () Bool)

(assert (=> start!60412 (=> (not res!444687) (not e!386630))))

(declare-datatypes ((array!39397 0))(
  ( (array!39398 (arr!18888 (Array (_ BitVec 32) (_ BitVec 64))) (size!19252 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39397)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60412 (= res!444687 (and (bvslt (size!19252 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19252 a!3626))))))

(assert (=> start!60412 e!386630))

(assert (=> start!60412 true))

(declare-fun array_inv!14747 (array!39397) Bool)

(assert (=> start!60412 (array_inv!14747 a!3626)))

(declare-fun b!678367 () Bool)

(declare-fun res!444683 () Bool)

(assert (=> b!678367 (=> (not res!444683) (not e!386630))))

(declare-fun noDuplicate!762 (List!12836) Bool)

(assert (=> b!678367 (= res!444683 (noDuplicate!762 acc!681))))

(declare-fun b!678368 () Bool)

(declare-fun e!386631 () Bool)

(assert (=> b!678368 (= e!386631 e!386628)))

(declare-fun res!444688 () Bool)

(assert (=> b!678368 (=> (not res!444688) (not e!386628))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678368 (= res!444688 (bvsle from!3004 i!1382))))

(declare-fun b!678369 () Bool)

(declare-fun res!444686 () Bool)

(assert (=> b!678369 (=> (not res!444686) (not e!386630))))

(assert (=> b!678369 (= res!444686 (not (contains!3488 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678370 () Bool)

(declare-fun res!444685 () Bool)

(assert (=> b!678370 (=> (not res!444685) (not e!386630))))

(declare-fun arrayNoDuplicates!0 (array!39397 (_ BitVec 32) List!12836) Bool)

(assert (=> b!678370 (= res!444685 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12833))))

(declare-fun b!678371 () Bool)

(declare-fun res!444682 () Bool)

(assert (=> b!678371 (=> (not res!444682) (not e!386630))))

(assert (=> b!678371 (= res!444682 e!386631)))

(declare-fun res!444684 () Bool)

(assert (=> b!678371 (=> res!444684 e!386631)))

(assert (=> b!678371 (= res!444684 e!386629)))

(declare-fun res!444681 () Bool)

(assert (=> b!678371 (=> (not res!444681) (not e!386629))))

(assert (=> b!678371 (= res!444681 (bvsgt from!3004 i!1382))))

(declare-fun b!678372 () Bool)

(assert (=> b!678372 (= e!386630 false)))

(declare-fun lt!312970 () Bool)

(assert (=> b!678372 (= lt!312970 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678373 () Bool)

(declare-fun res!444680 () Bool)

(assert (=> b!678373 (=> (not res!444680) (not e!386630))))

(assert (=> b!678373 (= res!444680 (not (contains!3488 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60412 res!444687) b!678367))

(assert (= (and b!678367 res!444683) b!678373))

(assert (= (and b!678373 res!444680) b!678369))

(assert (= (and b!678369 res!444686) b!678371))

(assert (= (and b!678371 res!444681) b!678366))

(assert (= (and b!678371 (not res!444684)) b!678368))

(assert (= (and b!678368 res!444688) b!678365))

(assert (= (and b!678371 res!444682) b!678370))

(assert (= (and b!678370 res!444685) b!678372))

(declare-fun m!644771 () Bool)

(assert (=> b!678367 m!644771))

(declare-fun m!644773 () Bool)

(assert (=> b!678366 m!644773))

(declare-fun m!644775 () Bool)

(assert (=> b!678370 m!644775))

(declare-fun m!644777 () Bool)

(assert (=> b!678373 m!644777))

(declare-fun m!644779 () Bool)

(assert (=> b!678369 m!644779))

(declare-fun m!644781 () Bool)

(assert (=> b!678372 m!644781))

(assert (=> b!678365 m!644773))

(declare-fun m!644783 () Bool)

(assert (=> start!60412 m!644783))

(push 1)

(assert (not b!678373))

(assert (not b!678366))

(assert (not b!678372))

(assert (not b!678367))

(assert (not b!678370))

(assert (not b!678365))

(assert (not start!60412))

(assert (not b!678369))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

