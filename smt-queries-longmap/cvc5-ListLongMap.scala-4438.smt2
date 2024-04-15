; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61686 () Bool)

(assert start!61686)

(declare-fun b!689989 () Bool)

(declare-fun e!392876 () Bool)

(declare-fun e!392874 () Bool)

(assert (=> b!689989 (= e!392876 e!392874)))

(declare-fun res!454561 () Bool)

(assert (=> b!689989 (=> (not res!454561) (not e!392874))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!689989 (= res!454561 (bvsle from!3004 i!1382))))

(declare-fun res!454553 () Bool)

(declare-fun e!392875 () Bool)

(assert (=> start!61686 (=> (not res!454553) (not e!392875))))

(declare-datatypes ((array!39751 0))(
  ( (array!39752 (arr!19045 (Array (_ BitVec 32) (_ BitVec 64))) (size!19427 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39751)

(assert (=> start!61686 (= res!454553 (and (bvslt (size!19427 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19427 a!3626))))))

(assert (=> start!61686 e!392875))

(assert (=> start!61686 true))

(declare-fun array_inv!14928 (array!39751) Bool)

(assert (=> start!61686 (array_inv!14928 a!3626)))

(declare-fun b!689990 () Bool)

(declare-fun res!454556 () Bool)

(assert (=> b!689990 (=> (not res!454556) (not e!392875))))

(assert (=> b!689990 (= res!454556 e!392876)))

(declare-fun res!454557 () Bool)

(assert (=> b!689990 (=> res!454557 e!392876)))

(declare-fun e!392872 () Bool)

(assert (=> b!689990 (= res!454557 e!392872)))

(declare-fun res!454560 () Bool)

(assert (=> b!689990 (=> (not res!454560) (not e!392872))))

(assert (=> b!689990 (= res!454560 (bvsgt from!3004 i!1382))))

(declare-fun b!689991 () Bool)

(declare-datatypes ((List!13125 0))(
  ( (Nil!13122) (Cons!13121 (h!14166 (_ BitVec 64)) (t!19383 List!13125)) )
))
(declare-fun acc!681 () List!13125)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3647 (List!13125 (_ BitVec 64)) Bool)

(assert (=> b!689991 (= e!392874 (not (contains!3647 acc!681 k!2843)))))

(declare-fun b!689992 () Bool)

(declare-fun res!454558 () Bool)

(assert (=> b!689992 (=> (not res!454558) (not e!392875))))

(declare-fun arrayNoDuplicates!0 (array!39751 (_ BitVec 32) List!13125) Bool)

(assert (=> b!689992 (= res!454558 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13122))))

(declare-fun b!689993 () Bool)

(declare-fun res!454559 () Bool)

(assert (=> b!689993 (=> (not res!454559) (not e!392875))))

(assert (=> b!689993 (= res!454559 (not (contains!3647 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689994 () Bool)

(declare-fun res!454554 () Bool)

(assert (=> b!689994 (=> (not res!454554) (not e!392875))))

(assert (=> b!689994 (= res!454554 (not (contains!3647 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689995 () Bool)

(declare-fun res!454555 () Bool)

(assert (=> b!689995 (=> (not res!454555) (not e!392875))))

(declare-fun noDuplicate!916 (List!13125) Bool)

(assert (=> b!689995 (= res!454555 (noDuplicate!916 acc!681))))

(declare-fun b!689996 () Bool)

(assert (=> b!689996 (= e!392875 false)))

(declare-fun lt!316167 () Bool)

(assert (=> b!689996 (= lt!316167 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!689997 () Bool)

(assert (=> b!689997 (= e!392872 (contains!3647 acc!681 k!2843))))

(assert (= (and start!61686 res!454553) b!689995))

(assert (= (and b!689995 res!454555) b!689994))

(assert (= (and b!689994 res!454554) b!689993))

(assert (= (and b!689993 res!454559) b!689990))

(assert (= (and b!689990 res!454560) b!689997))

(assert (= (and b!689990 (not res!454557)) b!689989))

(assert (= (and b!689989 res!454561) b!689991))

(assert (= (and b!689990 res!454556) b!689992))

(assert (= (and b!689992 res!454558) b!689996))

(declare-fun m!653071 () Bool)

(assert (=> b!689996 m!653071))

(declare-fun m!653073 () Bool)

(assert (=> b!689993 m!653073))

(declare-fun m!653075 () Bool)

(assert (=> b!689991 m!653075))

(declare-fun m!653077 () Bool)

(assert (=> b!689992 m!653077))

(declare-fun m!653079 () Bool)

(assert (=> b!689994 m!653079))

(declare-fun m!653081 () Bool)

(assert (=> b!689995 m!653081))

(assert (=> b!689997 m!653075))

(declare-fun m!653083 () Bool)

(assert (=> start!61686 m!653083))

(push 1)

(assert (not b!689994))

(assert (not b!689997))

(assert (not b!689991))

(assert (not b!689993))

(assert (not b!689996))

(assert (not b!689992))

(assert (not b!689995))

(assert (not start!61686))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

