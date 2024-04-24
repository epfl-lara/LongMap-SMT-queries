; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59866 () Bool)

(assert start!59866)

(declare-fun b!660986 () Bool)

(declare-fun e!379825 () Bool)

(declare-datatypes ((List!12563 0))(
  ( (Nil!12560) (Cons!12559 (h!13607 (_ BitVec 64)) (t!18783 List!12563)) )
))
(declare-fun acc!681 () List!12563)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3215 (List!12563 (_ BitVec 64)) Bool)

(assert (=> b!660986 (= e!379825 (contains!3215 acc!681 k!2843))))

(declare-fun b!660987 () Bool)

(declare-fun e!379827 () Bool)

(assert (=> b!660987 (= e!379827 (not (contains!3215 acc!681 k!2843)))))

(declare-fun b!660988 () Bool)

(declare-fun e!379826 () Bool)

(assert (=> b!660988 (= e!379826 e!379827)))

(declare-fun res!428942 () Bool)

(assert (=> b!660988 (=> (not res!428942) (not e!379827))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660988 (= res!428942 (bvsle from!3004 i!1382))))

(declare-fun b!660989 () Bool)

(declare-fun e!379823 () Bool)

(assert (=> b!660989 (= e!379823 false)))

(declare-datatypes ((array!38851 0))(
  ( (array!38852 (arr!18615 (Array (_ BitVec 32) (_ BitVec 64))) (size!18979 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38851)

(declare-fun lt!308911 () Bool)

(declare-fun arrayNoDuplicates!0 (array!38851 (_ BitVec 32) List!12563) Bool)

(assert (=> b!660989 (= lt!308911 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660990 () Bool)

(declare-fun res!428943 () Bool)

(assert (=> b!660990 (=> (not res!428943) (not e!379823))))

(assert (=> b!660990 (= res!428943 (not (contains!3215 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660991 () Bool)

(declare-fun res!428941 () Bool)

(assert (=> b!660991 (=> (not res!428941) (not e!379823))))

(assert (=> b!660991 (= res!428941 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12560))))

(declare-fun res!428945 () Bool)

(assert (=> start!59866 (=> (not res!428945) (not e!379823))))

(assert (=> start!59866 (= res!428945 (and (bvslt (size!18979 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18979 a!3626))))))

(assert (=> start!59866 e!379823))

(assert (=> start!59866 true))

(declare-fun array_inv!14474 (array!38851) Bool)

(assert (=> start!59866 (array_inv!14474 a!3626)))

(declare-fun b!660992 () Bool)

(declare-fun res!428944 () Bool)

(assert (=> b!660992 (=> (not res!428944) (not e!379823))))

(assert (=> b!660992 (= res!428944 (not (contains!3215 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660993 () Bool)

(declare-fun res!428947 () Bool)

(assert (=> b!660993 (=> (not res!428947) (not e!379823))))

(assert (=> b!660993 (= res!428947 e!379826)))

(declare-fun res!428939 () Bool)

(assert (=> b!660993 (=> res!428939 e!379826)))

(assert (=> b!660993 (= res!428939 e!379825)))

(declare-fun res!428940 () Bool)

(assert (=> b!660993 (=> (not res!428940) (not e!379825))))

(assert (=> b!660993 (= res!428940 (bvsgt from!3004 i!1382))))

(declare-fun b!660994 () Bool)

(declare-fun res!428946 () Bool)

(assert (=> b!660994 (=> (not res!428946) (not e!379823))))

(declare-fun noDuplicate!489 (List!12563) Bool)

(assert (=> b!660994 (= res!428946 (noDuplicate!489 acc!681))))

(assert (= (and start!59866 res!428945) b!660994))

(assert (= (and b!660994 res!428946) b!660992))

(assert (= (and b!660992 res!428944) b!660990))

(assert (= (and b!660990 res!428943) b!660993))

(assert (= (and b!660993 res!428940) b!660986))

(assert (= (and b!660993 (not res!428939)) b!660988))

(assert (= (and b!660988 res!428942) b!660987))

(assert (= (and b!660993 res!428947) b!660991))

(assert (= (and b!660991 res!428941) b!660989))

(declare-fun m!633977 () Bool)

(assert (=> b!660989 m!633977))

(declare-fun m!633979 () Bool)

(assert (=> b!660986 m!633979))

(assert (=> b!660987 m!633979))

(declare-fun m!633981 () Bool)

(assert (=> b!660992 m!633981))

(declare-fun m!633983 () Bool)

(assert (=> start!59866 m!633983))

(declare-fun m!633985 () Bool)

(assert (=> b!660994 m!633985))

(declare-fun m!633987 () Bool)

(assert (=> b!660991 m!633987))

(declare-fun m!633989 () Bool)

(assert (=> b!660990 m!633989))

(push 1)

(assert (not b!660990))

(assert (not b!660991))

(assert (not b!660992))

(assert (not b!660986))

(assert (not b!660994))

(assert (not start!59866))

(assert (not b!660987))

(assert (not b!660989))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

