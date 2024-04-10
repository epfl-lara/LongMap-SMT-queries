; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59696 () Bool)

(assert start!59696)

(declare-fun res!427688 () Bool)

(declare-fun e!378985 () Bool)

(assert (=> start!59696 (=> (not res!427688) (not e!378985))))

(declare-datatypes ((array!38773 0))(
  ( (array!38774 (arr!18582 (Array (_ BitVec 32) (_ BitVec 64))) (size!18946 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38773)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59696 (= res!427688 (and (bvslt (size!18946 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18946 a!3626))))))

(assert (=> start!59696 e!378985))

(assert (=> start!59696 true))

(declare-fun array_inv!14378 (array!38773) Bool)

(assert (=> start!59696 (array_inv!14378 a!3626)))

(declare-fun b!659623 () Bool)

(declare-fun res!427691 () Bool)

(assert (=> b!659623 (=> (not res!427691) (not e!378985))))

(declare-fun e!378986 () Bool)

(assert (=> b!659623 (= res!427691 e!378986)))

(declare-fun res!427687 () Bool)

(assert (=> b!659623 (=> res!427687 e!378986)))

(declare-fun e!378984 () Bool)

(assert (=> b!659623 (= res!427687 e!378984)))

(declare-fun res!427694 () Bool)

(assert (=> b!659623 (=> (not res!427694) (not e!378984))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!659623 (= res!427694 (bvsgt from!3004 i!1382))))

(declare-fun b!659624 () Bool)

(declare-fun res!427692 () Bool)

(assert (=> b!659624 (=> (not res!427692) (not e!378985))))

(declare-datatypes ((List!12623 0))(
  ( (Nil!12620) (Cons!12619 (h!13664 (_ BitVec 64)) (t!18851 List!12623)) )
))
(declare-fun acc!681 () List!12623)

(declare-fun contains!3200 (List!12623 (_ BitVec 64)) Bool)

(assert (=> b!659624 (= res!427692 (not (contains!3200 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659625 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!659625 (= e!378984 (contains!3200 acc!681 k!2843))))

(declare-fun b!659626 () Bool)

(declare-fun res!427693 () Bool)

(assert (=> b!659626 (=> (not res!427693) (not e!378985))))

(declare-fun noDuplicate!447 (List!12623) Bool)

(assert (=> b!659626 (= res!427693 (noDuplicate!447 acc!681))))

(declare-fun b!659627 () Bool)

(declare-fun e!378987 () Bool)

(assert (=> b!659627 (= e!378986 e!378987)))

(declare-fun res!427690 () Bool)

(assert (=> b!659627 (=> (not res!427690) (not e!378987))))

(assert (=> b!659627 (= res!427690 (bvsle from!3004 i!1382))))

(declare-fun b!659628 () Bool)

(assert (=> b!659628 (= e!378985 (bvsgt #b00000000000000000000000000000000 (size!18946 a!3626)))))

(declare-fun b!659629 () Bool)

(assert (=> b!659629 (= e!378987 (not (contains!3200 acc!681 k!2843)))))

(declare-fun b!659630 () Bool)

(declare-fun res!427689 () Bool)

(assert (=> b!659630 (=> (not res!427689) (not e!378985))))

(assert (=> b!659630 (= res!427689 (not (contains!3200 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59696 res!427688) b!659626))

(assert (= (and b!659626 res!427693) b!659630))

(assert (= (and b!659630 res!427689) b!659624))

(assert (= (and b!659624 res!427692) b!659623))

(assert (= (and b!659623 res!427694) b!659625))

(assert (= (and b!659623 (not res!427687)) b!659627))

(assert (= (and b!659627 res!427690) b!659629))

(assert (= (and b!659623 res!427691) b!659628))

(declare-fun m!632627 () Bool)

(assert (=> b!659624 m!632627))

(declare-fun m!632629 () Bool)

(assert (=> b!659630 m!632629))

(declare-fun m!632631 () Bool)

(assert (=> b!659626 m!632631))

(declare-fun m!632633 () Bool)

(assert (=> b!659629 m!632633))

(declare-fun m!632635 () Bool)

(assert (=> start!59696 m!632635))

(assert (=> b!659625 m!632633))

(push 1)

