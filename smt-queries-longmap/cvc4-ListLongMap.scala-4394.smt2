; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60418 () Bool)

(assert start!60418)

(declare-fun b!678785 () Bool)

(declare-fun res!445338 () Bool)

(declare-fun e!386726 () Bool)

(assert (=> b!678785 (=> (not res!445338) (not e!386726))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!678785 (= res!445338 (validKeyInArray!0 k!2843))))

(declare-fun b!678787 () Bool)

(declare-fun res!445339 () Bool)

(assert (=> b!678787 (=> (not res!445339) (not e!386726))))

(declare-datatypes ((List!12992 0))(
  ( (Nil!12989) (Cons!12988 (h!14033 (_ BitVec 64)) (t!19211 List!12992)) )
))
(declare-fun acc!681 () List!12992)

(declare-fun noDuplicate!783 (List!12992) Bool)

(assert (=> b!678787 (= res!445339 (noDuplicate!783 acc!681))))

(declare-fun b!678788 () Bool)

(declare-fun res!445342 () Bool)

(assert (=> b!678788 (=> (not res!445342) (not e!386726))))

(declare-datatypes ((array!39443 0))(
  ( (array!39444 (arr!18912 (Array (_ BitVec 32) (_ BitVec 64))) (size!19277 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39443)

(declare-fun arrayContainsKey!0 (array!39443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!678788 (= res!445342 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!678789 () Bool)

(declare-fun e!386728 () Bool)

(declare-fun e!386727 () Bool)

(assert (=> b!678789 (= e!386728 e!386727)))

(declare-fun res!445337 () Bool)

(assert (=> b!678789 (=> (not res!445337) (not e!386727))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678789 (= res!445337 (bvsle from!3004 i!1382))))

(declare-fun b!678790 () Bool)

(declare-fun res!445336 () Bool)

(assert (=> b!678790 (=> (not res!445336) (not e!386726))))

(assert (=> b!678790 (= res!445336 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19277 a!3626))))))

(declare-fun b!678791 () Bool)

(declare-fun res!445329 () Bool)

(assert (=> b!678791 (=> (not res!445329) (not e!386726))))

(assert (=> b!678791 (= res!445329 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19277 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!678792 () Bool)

(declare-fun res!445341 () Bool)

(assert (=> b!678792 (=> (not res!445341) (not e!386726))))

(declare-fun arrayNoDuplicates!0 (array!39443 (_ BitVec 32) List!12992) Bool)

(assert (=> b!678792 (= res!445341 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678793 () Bool)

(assert (=> b!678793 (= e!386726 (not true))))

(assert (=> b!678793 (arrayContainsKey!0 (array!39444 (store (arr!18912 a!3626) i!1382 k!2843) (size!19277 a!3626)) k!2843 from!3004)))

(declare-fun b!678794 () Bool)

(declare-fun res!445332 () Bool)

(assert (=> b!678794 (=> (not res!445332) (not e!386726))))

(assert (=> b!678794 (= res!445332 e!386728)))

(declare-fun res!445331 () Bool)

(assert (=> b!678794 (=> res!445331 e!386728)))

(declare-fun e!386725 () Bool)

(assert (=> b!678794 (= res!445331 e!386725)))

(declare-fun res!445334 () Bool)

(assert (=> b!678794 (=> (not res!445334) (not e!386725))))

(assert (=> b!678794 (= res!445334 (bvsgt from!3004 i!1382))))

(declare-fun b!678795 () Bool)

(declare-fun res!445333 () Bool)

(assert (=> b!678795 (=> (not res!445333) (not e!386726))))

(declare-fun contains!3514 (List!12992 (_ BitVec 64)) Bool)

(assert (=> b!678795 (= res!445333 (not (contains!3514 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678796 () Bool)

(declare-fun res!445335 () Bool)

(assert (=> b!678796 (=> (not res!445335) (not e!386726))))

(assert (=> b!678796 (= res!445335 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12989))))

(declare-fun res!445340 () Bool)

(assert (=> start!60418 (=> (not res!445340) (not e!386726))))

(assert (=> start!60418 (= res!445340 (and (bvslt (size!19277 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19277 a!3626))))))

(assert (=> start!60418 e!386726))

(assert (=> start!60418 true))

(declare-fun array_inv!14795 (array!39443) Bool)

(assert (=> start!60418 (array_inv!14795 a!3626)))

(declare-fun b!678786 () Bool)

(assert (=> b!678786 (= e!386725 (contains!3514 acc!681 k!2843))))

(declare-fun b!678797 () Bool)

(declare-fun res!445330 () Bool)

(assert (=> b!678797 (=> (not res!445330) (not e!386726))))

(assert (=> b!678797 (= res!445330 (not (contains!3514 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678798 () Bool)

(assert (=> b!678798 (= e!386727 (not (contains!3514 acc!681 k!2843)))))

(assert (= (and start!60418 res!445340) b!678787))

(assert (= (and b!678787 res!445339) b!678795))

(assert (= (and b!678795 res!445333) b!678797))

(assert (= (and b!678797 res!445330) b!678794))

(assert (= (and b!678794 res!445334) b!678786))

(assert (= (and b!678794 (not res!445331)) b!678789))

(assert (= (and b!678789 res!445337) b!678798))

(assert (= (and b!678794 res!445332) b!678796))

(assert (= (and b!678796 res!445335) b!678792))

(assert (= (and b!678792 res!445341) b!678790))

(assert (= (and b!678790 res!445336) b!678785))

(assert (= (and b!678785 res!445338) b!678788))

(assert (= (and b!678788 res!445342) b!678791))

(assert (= (and b!678791 res!445329) b!678793))

(declare-fun m!643819 () Bool)

(assert (=> b!678786 m!643819))

(declare-fun m!643821 () Bool)

(assert (=> b!678788 m!643821))

(declare-fun m!643823 () Bool)

(assert (=> start!60418 m!643823))

(declare-fun m!643825 () Bool)

(assert (=> b!678795 m!643825))

(declare-fun m!643827 () Bool)

(assert (=> b!678793 m!643827))

(declare-fun m!643829 () Bool)

(assert (=> b!678793 m!643829))

(declare-fun m!643831 () Bool)

(assert (=> b!678796 m!643831))

(declare-fun m!643833 () Bool)

(assert (=> b!678797 m!643833))

(assert (=> b!678798 m!643819))

(declare-fun m!643835 () Bool)

(assert (=> b!678787 m!643835))

(declare-fun m!643837 () Bool)

(assert (=> b!678792 m!643837))

(declare-fun m!643839 () Bool)

(assert (=> b!678785 m!643839))

(push 1)

(assert (not b!678793))

(assert (not b!678796))

(assert (not b!678785))

(assert (not b!678786))

(assert (not b!678788))

(assert (not b!678792))

(assert (not start!60418))

(assert (not b!678787))

(assert (not b!678798))

(assert (not b!678795))

(assert (not b!678797))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

