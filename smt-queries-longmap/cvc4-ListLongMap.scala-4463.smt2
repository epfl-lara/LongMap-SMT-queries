; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62130 () Bool)

(assert start!62130)

(declare-fun b!695634 () Bool)

(declare-fun res!459584 () Bool)

(declare-fun e!395640 () Bool)

(assert (=> b!695634 (=> (not res!459584) (not e!395640))))

(declare-fun e!395639 () Bool)

(assert (=> b!695634 (= res!459584 e!395639)))

(declare-fun res!459588 () Bool)

(assert (=> b!695634 (=> res!459588 e!395639)))

(declare-fun e!395638 () Bool)

(assert (=> b!695634 (= res!459588 e!395638)))

(declare-fun res!459589 () Bool)

(assert (=> b!695634 (=> (not res!459589) (not e!395638))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!695634 (= res!459589 (bvsgt from!3004 i!1382))))

(declare-fun b!695635 () Bool)

(assert (=> b!695635 (= e!395640 false)))

(declare-datatypes ((List!13162 0))(
  ( (Nil!13159) (Cons!13158 (h!14203 (_ BitVec 64)) (t!19444 List!13162)) )
))
(declare-fun acc!681 () List!13162)

(declare-fun lt!317068 () Bool)

(declare-datatypes ((array!39920 0))(
  ( (array!39921 (arr!19121 (Array (_ BitVec 32) (_ BitVec 64))) (size!19506 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39920)

(declare-fun arrayNoDuplicates!0 (array!39920 (_ BitVec 32) List!13162) Bool)

(assert (=> b!695635 (= lt!317068 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!695636 () Bool)

(declare-fun res!459586 () Bool)

(assert (=> b!695636 (=> (not res!459586) (not e!395640))))

(assert (=> b!695636 (= res!459586 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13159))))

(declare-fun b!695637 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3739 (List!13162 (_ BitVec 64)) Bool)

(assert (=> b!695637 (= e!395638 (contains!3739 acc!681 k!2843))))

(declare-fun b!695638 () Bool)

(declare-fun e!395636 () Bool)

(assert (=> b!695638 (= e!395639 e!395636)))

(declare-fun res!459587 () Bool)

(assert (=> b!695638 (=> (not res!459587) (not e!395636))))

(assert (=> b!695638 (= res!459587 (bvsle from!3004 i!1382))))

(declare-fun res!459585 () Bool)

(assert (=> start!62130 (=> (not res!459585) (not e!395640))))

(assert (=> start!62130 (= res!459585 (and (bvslt (size!19506 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19506 a!3626))))))

(assert (=> start!62130 e!395640))

(assert (=> start!62130 true))

(declare-fun array_inv!14917 (array!39920) Bool)

(assert (=> start!62130 (array_inv!14917 a!3626)))

(declare-fun b!695639 () Bool)

(declare-fun res!459590 () Bool)

(assert (=> b!695639 (=> (not res!459590) (not e!395640))))

(assert (=> b!695639 (= res!459590 (not (contains!3739 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695640 () Bool)

(declare-fun res!459582 () Bool)

(assert (=> b!695640 (=> (not res!459582) (not e!395640))))

(declare-fun noDuplicate!986 (List!13162) Bool)

(assert (=> b!695640 (= res!459582 (noDuplicate!986 acc!681))))

(declare-fun b!695641 () Bool)

(assert (=> b!695641 (= e!395636 (not (contains!3739 acc!681 k!2843)))))

(declare-fun b!695642 () Bool)

(declare-fun res!459583 () Bool)

(assert (=> b!695642 (=> (not res!459583) (not e!395640))))

(assert (=> b!695642 (= res!459583 (not (contains!3739 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62130 res!459585) b!695640))

(assert (= (and b!695640 res!459582) b!695642))

(assert (= (and b!695642 res!459583) b!695639))

(assert (= (and b!695639 res!459590) b!695634))

(assert (= (and b!695634 res!459589) b!695637))

(assert (= (and b!695634 (not res!459588)) b!695638))

(assert (= (and b!695638 res!459587) b!695641))

(assert (= (and b!695634 res!459584) b!695636))

(assert (= (and b!695636 res!459586) b!695635))

(declare-fun m!657045 () Bool)

(assert (=> start!62130 m!657045))

(declare-fun m!657047 () Bool)

(assert (=> b!695641 m!657047))

(assert (=> b!695637 m!657047))

(declare-fun m!657049 () Bool)

(assert (=> b!695636 m!657049))

(declare-fun m!657051 () Bool)

(assert (=> b!695635 m!657051))

(declare-fun m!657053 () Bool)

(assert (=> b!695640 m!657053))

(declare-fun m!657055 () Bool)

(assert (=> b!695642 m!657055))

(declare-fun m!657057 () Bool)

(assert (=> b!695639 m!657057))

(push 1)

(assert (not b!695641))

(assert (not b!695635))

(assert (not start!62130))

(assert (not b!695642))

(assert (not b!695639))

(assert (not b!695640))

(assert (not b!695637))

(assert (not b!695636))

(check-sat)

(pop 1)

