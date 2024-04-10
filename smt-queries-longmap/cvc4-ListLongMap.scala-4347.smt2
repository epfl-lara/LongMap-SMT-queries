; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60114 () Bool)

(assert start!60114)

(declare-fun b!670761 () Bool)

(declare-fun e!383475 () Bool)

(assert (=> b!670761 (= e!383475 false)))

(declare-datatypes ((array!39161 0))(
  ( (array!39162 (arr!18773 (Array (_ BitVec 32) (_ BitVec 64))) (size!19137 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39161)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12814 0))(
  ( (Nil!12811) (Cons!12810 (h!13855 (_ BitVec 64)) (t!19042 List!12814)) )
))
(declare-fun acc!681 () List!12814)

(declare-fun lt!312148 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39161 (_ BitVec 32) List!12814) Bool)

(assert (=> b!670761 (= lt!312148 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!437464 () Bool)

(assert (=> start!60114 (=> (not res!437464) (not e!383475))))

(assert (=> start!60114 (= res!437464 (and (bvslt (size!19137 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19137 a!3626))))))

(assert (=> start!60114 e!383475))

(assert (=> start!60114 true))

(declare-fun array_inv!14569 (array!39161) Bool)

(assert (=> start!60114 (array_inv!14569 a!3626)))

(declare-fun b!670762 () Bool)

(declare-fun e!383473 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3391 (List!12814 (_ BitVec 64)) Bool)

(assert (=> b!670762 (= e!383473 (contains!3391 acc!681 k!2843))))

(declare-fun b!670763 () Bool)

(declare-fun res!437458 () Bool)

(assert (=> b!670763 (=> (not res!437458) (not e!383475))))

(declare-fun e!383472 () Bool)

(assert (=> b!670763 (= res!437458 e!383472)))

(declare-fun res!437459 () Bool)

(assert (=> b!670763 (=> res!437459 e!383472)))

(assert (=> b!670763 (= res!437459 e!383473)))

(declare-fun res!437457 () Bool)

(assert (=> b!670763 (=> (not res!437457) (not e!383473))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!670763 (= res!437457 (bvsgt from!3004 i!1382))))

(declare-fun b!670764 () Bool)

(declare-fun res!437462 () Bool)

(assert (=> b!670764 (=> (not res!437462) (not e!383475))))

(assert (=> b!670764 (= res!437462 (not (contains!3391 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670765 () Bool)

(declare-fun res!437460 () Bool)

(assert (=> b!670765 (=> (not res!437460) (not e!383475))))

(assert (=> b!670765 (= res!437460 (not (contains!3391 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670766 () Bool)

(declare-fun e!383474 () Bool)

(assert (=> b!670766 (= e!383474 (not (contains!3391 acc!681 k!2843)))))

(declare-fun b!670767 () Bool)

(declare-fun res!437461 () Bool)

(assert (=> b!670767 (=> (not res!437461) (not e!383475))))

(declare-fun noDuplicate!638 (List!12814) Bool)

(assert (=> b!670767 (= res!437461 (noDuplicate!638 acc!681))))

(declare-fun b!670768 () Bool)

(assert (=> b!670768 (= e!383472 e!383474)))

(declare-fun res!437465 () Bool)

(assert (=> b!670768 (=> (not res!437465) (not e!383474))))

(assert (=> b!670768 (= res!437465 (bvsle from!3004 i!1382))))

(declare-fun b!670769 () Bool)

(declare-fun res!437463 () Bool)

(assert (=> b!670769 (=> (not res!437463) (not e!383475))))

(assert (=> b!670769 (= res!437463 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12811))))

(assert (= (and start!60114 res!437464) b!670767))

(assert (= (and b!670767 res!437461) b!670764))

(assert (= (and b!670764 res!437462) b!670765))

(assert (= (and b!670765 res!437460) b!670763))

(assert (= (and b!670763 res!437457) b!670762))

(assert (= (and b!670763 (not res!437459)) b!670768))

(assert (= (and b!670768 res!437465) b!670766))

(assert (= (and b!670763 res!437458) b!670769))

(assert (= (and b!670769 res!437463) b!670761))

(declare-fun m!640587 () Bool)

(assert (=> b!670769 m!640587))

(declare-fun m!640589 () Bool)

(assert (=> b!670762 m!640589))

(declare-fun m!640591 () Bool)

(assert (=> b!670767 m!640591))

(declare-fun m!640593 () Bool)

(assert (=> start!60114 m!640593))

(assert (=> b!670766 m!640589))

(declare-fun m!640595 () Bool)

(assert (=> b!670761 m!640595))

(declare-fun m!640597 () Bool)

(assert (=> b!670765 m!640597))

(declare-fun m!640599 () Bool)

(assert (=> b!670764 m!640599))

(push 1)

(assert (not b!670761))

(assert (not b!670766))

(assert (not b!670767))

(assert (not b!670764))

(assert (not b!670762))

(assert (not b!670769))

(assert (not b!670765))

(assert (not start!60114))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

