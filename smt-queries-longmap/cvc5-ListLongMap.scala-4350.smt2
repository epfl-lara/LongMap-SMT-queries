; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60128 () Bool)

(assert start!60128)

(declare-fun b!670964 () Bool)

(declare-fun res!437665 () Bool)

(declare-fun e!383578 () Bool)

(assert (=> b!670964 (=> (not res!437665) (not e!383578))))

(declare-datatypes ((array!39175 0))(
  ( (array!39176 (arr!18780 (Array (_ BitVec 32) (_ BitVec 64))) (size!19144 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39175)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12821 0))(
  ( (Nil!12818) (Cons!12817 (h!13862 (_ BitVec 64)) (t!19049 List!12821)) )
))
(declare-fun acc!681 () List!12821)

(declare-fun arrayNoDuplicates!0 (array!39175 (_ BitVec 32) List!12821) Bool)

(assert (=> b!670964 (= res!437665 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!670966 () Bool)

(declare-fun res!437670 () Bool)

(assert (=> b!670966 (=> (not res!437670) (not e!383578))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!670966 (= res!437670 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19144 a!3626))))))

(declare-fun b!670967 () Bool)

(declare-fun res!437675 () Bool)

(assert (=> b!670967 (=> (not res!437675) (not e!383578))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!670967 (= res!437675 (validKeyInArray!0 (select (arr!18780 a!3626) from!3004)))))

(declare-fun b!670968 () Bool)

(assert (=> b!670968 (= e!383578 (not true))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!670968 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun b!670969 () Bool)

(declare-fun e!383577 () Bool)

(declare-fun contains!3398 (List!12821 (_ BitVec 64)) Bool)

(assert (=> b!670969 (= e!383577 (not (contains!3398 acc!681 k!2843)))))

(declare-fun b!670970 () Bool)

(declare-fun res!437663 () Bool)

(assert (=> b!670970 (=> (not res!437663) (not e!383578))))

(declare-fun noDuplicate!645 (List!12821) Bool)

(assert (=> b!670970 (= res!437663 (noDuplicate!645 acc!681))))

(declare-fun b!670971 () Bool)

(declare-fun res!437668 () Bool)

(assert (=> b!670971 (=> (not res!437668) (not e!383578))))

(assert (=> b!670971 (= res!437668 (not (contains!3398 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670972 () Bool)

(declare-fun res!437669 () Bool)

(assert (=> b!670972 (=> (not res!437669) (not e!383578))))

(assert (=> b!670972 (= res!437669 (validKeyInArray!0 k!2843))))

(declare-fun b!670973 () Bool)

(declare-fun res!437667 () Bool)

(assert (=> b!670973 (=> (not res!437667) (not e!383578))))

(assert (=> b!670973 (= res!437667 (not (contains!3398 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670974 () Bool)

(declare-fun res!437671 () Bool)

(assert (=> b!670974 (=> (not res!437671) (not e!383578))))

(assert (=> b!670974 (= res!437671 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19144 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun res!437672 () Bool)

(assert (=> start!60128 (=> (not res!437672) (not e!383578))))

(assert (=> start!60128 (= res!437672 (and (bvslt (size!19144 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19144 a!3626))))))

(assert (=> start!60128 e!383578))

(assert (=> start!60128 true))

(declare-fun array_inv!14576 (array!39175) Bool)

(assert (=> start!60128 (array_inv!14576 a!3626)))

(declare-fun b!670965 () Bool)

(declare-fun res!437674 () Bool)

(assert (=> b!670965 (=> (not res!437674) (not e!383578))))

(assert (=> b!670965 (= res!437674 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!670975 () Bool)

(declare-fun res!437666 () Bool)

(assert (=> b!670975 (=> (not res!437666) (not e!383578))))

(assert (=> b!670975 (= res!437666 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12818))))

(declare-fun b!670976 () Bool)

(declare-fun res!437660 () Bool)

(assert (=> b!670976 (=> (not res!437660) (not e!383578))))

(assert (=> b!670976 (= res!437660 (= (select (arr!18780 a!3626) from!3004) k!2843))))

(declare-fun b!670977 () Bool)

(declare-fun e!383579 () Bool)

(assert (=> b!670977 (= e!383579 (contains!3398 acc!681 k!2843))))

(declare-fun b!670978 () Bool)

(declare-fun res!437662 () Bool)

(assert (=> b!670978 (=> (not res!437662) (not e!383578))))

(declare-fun e!383576 () Bool)

(assert (=> b!670978 (= res!437662 e!383576)))

(declare-fun res!437661 () Bool)

(assert (=> b!670978 (=> res!437661 e!383576)))

(assert (=> b!670978 (= res!437661 e!383579)))

(declare-fun res!437664 () Bool)

(assert (=> b!670978 (=> (not res!437664) (not e!383579))))

(assert (=> b!670978 (= res!437664 (bvsgt from!3004 i!1382))))

(declare-fun b!670979 () Bool)

(assert (=> b!670979 (= e!383576 e!383577)))

(declare-fun res!437673 () Bool)

(assert (=> b!670979 (=> (not res!437673) (not e!383577))))

(assert (=> b!670979 (= res!437673 (bvsle from!3004 i!1382))))

(assert (= (and start!60128 res!437672) b!670970))

(assert (= (and b!670970 res!437663) b!670973))

(assert (= (and b!670973 res!437667) b!670971))

(assert (= (and b!670971 res!437668) b!670978))

(assert (= (and b!670978 res!437664) b!670977))

(assert (= (and b!670978 (not res!437661)) b!670979))

(assert (= (and b!670979 res!437673) b!670969))

(assert (= (and b!670978 res!437662) b!670975))

(assert (= (and b!670975 res!437666) b!670964))

(assert (= (and b!670964 res!437665) b!670966))

(assert (= (and b!670966 res!437670) b!670972))

(assert (= (and b!670972 res!437669) b!670965))

(assert (= (and b!670965 res!437674) b!670974))

(assert (= (and b!670974 res!437671) b!670967))

(assert (= (and b!670967 res!437675) b!670976))

(assert (= (and b!670976 res!437660) b!670968))

(declare-fun m!640685 () Bool)

(assert (=> b!670968 m!640685))

(declare-fun m!640687 () Bool)

(assert (=> b!670973 m!640687))

(declare-fun m!640689 () Bool)

(assert (=> b!670970 m!640689))

(declare-fun m!640691 () Bool)

(assert (=> b!670977 m!640691))

(declare-fun m!640693 () Bool)

(assert (=> b!670976 m!640693))

(declare-fun m!640695 () Bool)

(assert (=> start!60128 m!640695))

(declare-fun m!640697 () Bool)

(assert (=> b!670975 m!640697))

(declare-fun m!640699 () Bool)

(assert (=> b!670972 m!640699))

(assert (=> b!670967 m!640693))

(assert (=> b!670967 m!640693))

(declare-fun m!640701 () Bool)

(assert (=> b!670967 m!640701))

(declare-fun m!640703 () Bool)

(assert (=> b!670965 m!640703))

(assert (=> b!670969 m!640691))

(declare-fun m!640705 () Bool)

(assert (=> b!670971 m!640705))

(declare-fun m!640707 () Bool)

(assert (=> b!670964 m!640707))

(push 1)

(assert (not b!670965))

(assert (not b!670971))

(assert (not b!670970))

(assert (not b!670973))

(assert (not start!60128))

(assert (not b!670964))

(assert (not b!670972))

(assert (not b!670969))

(assert (not b!670977))

(assert (not b!670968))

(assert (not b!670967))

(assert (not b!670975))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

