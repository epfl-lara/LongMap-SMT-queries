; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61688 () Bool)

(assert start!61688)

(declare-fun b!690150 () Bool)

(declare-fun res!454559 () Bool)

(declare-fun e!392987 () Bool)

(assert (=> b!690150 (=> (not res!454559) (not e!392987))))

(declare-datatypes ((array!39742 0))(
  ( (array!39743 (arr!19041 (Array (_ BitVec 32) (_ BitVec 64))) (size!19426 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39742)

(declare-datatypes ((List!13082 0))(
  ( (Nil!13079) (Cons!13078 (h!14123 (_ BitVec 64)) (t!19349 List!13082)) )
))
(declare-fun arrayNoDuplicates!0 (array!39742 (_ BitVec 32) List!13082) Bool)

(assert (=> b!690150 (= res!454559 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13079))))

(declare-fun b!690151 () Bool)

(declare-fun res!454561 () Bool)

(assert (=> b!690151 (=> (not res!454561) (not e!392987))))

(declare-fun acc!681 () List!13082)

(declare-fun contains!3659 (List!13082 (_ BitVec 64)) Bool)

(assert (=> b!690151 (= res!454561 (not (contains!3659 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690152 () Bool)

(declare-fun res!454554 () Bool)

(assert (=> b!690152 (=> (not res!454554) (not e!392987))))

(assert (=> b!690152 (= res!454554 (not (contains!3659 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690153 () Bool)

(declare-fun e!392988 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!690153 (= e!392988 (not (contains!3659 acc!681 k!2843)))))

(declare-fun b!690154 () Bool)

(declare-fun res!454555 () Bool)

(assert (=> b!690154 (=> (not res!454555) (not e!392987))))

(declare-fun noDuplicate!906 (List!13082) Bool)

(assert (=> b!690154 (= res!454555 (noDuplicate!906 acc!681))))

(declare-fun res!454557 () Bool)

(assert (=> start!61688 (=> (not res!454557) (not e!392987))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!61688 (= res!454557 (and (bvslt (size!19426 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19426 a!3626))))))

(assert (=> start!61688 e!392987))

(assert (=> start!61688 true))

(declare-fun array_inv!14837 (array!39742) Bool)

(assert (=> start!61688 (array_inv!14837 a!3626)))

(declare-fun b!690155 () Bool)

(declare-fun e!392990 () Bool)

(assert (=> b!690155 (= e!392990 (contains!3659 acc!681 k!2843))))

(declare-fun b!690156 () Bool)

(assert (=> b!690156 (= e!392987 false)))

(declare-fun lt!316408 () Bool)

(assert (=> b!690156 (= lt!316408 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!690157 () Bool)

(declare-fun res!454560 () Bool)

(assert (=> b!690157 (=> (not res!454560) (not e!392987))))

(declare-fun e!392989 () Bool)

(assert (=> b!690157 (= res!454560 e!392989)))

(declare-fun res!454562 () Bool)

(assert (=> b!690157 (=> res!454562 e!392989)))

(assert (=> b!690157 (= res!454562 e!392990)))

(declare-fun res!454556 () Bool)

(assert (=> b!690157 (=> (not res!454556) (not e!392990))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!690157 (= res!454556 (bvsgt from!3004 i!1382))))

(declare-fun b!690158 () Bool)

(assert (=> b!690158 (= e!392989 e!392988)))

(declare-fun res!454558 () Bool)

(assert (=> b!690158 (=> (not res!454558) (not e!392988))))

(assert (=> b!690158 (= res!454558 (bvsle from!3004 i!1382))))

(assert (= (and start!61688 res!454557) b!690154))

(assert (= (and b!690154 res!454555) b!690152))

(assert (= (and b!690152 res!454554) b!690151))

(assert (= (and b!690151 res!454561) b!690157))

(assert (= (and b!690157 res!454556) b!690155))

(assert (= (and b!690157 (not res!454562)) b!690158))

(assert (= (and b!690158 res!454558) b!690153))

(assert (= (and b!690157 res!454560) b!690150))

(assert (= (and b!690150 res!454559) b!690156))

(declare-fun m!653783 () Bool)

(assert (=> b!690150 m!653783))

(declare-fun m!653785 () Bool)

(assert (=> start!61688 m!653785))

(declare-fun m!653787 () Bool)

(assert (=> b!690156 m!653787))

(declare-fun m!653789 () Bool)

(assert (=> b!690155 m!653789))

(declare-fun m!653791 () Bool)

(assert (=> b!690154 m!653791))

(declare-fun m!653793 () Bool)

(assert (=> b!690151 m!653793))

(assert (=> b!690153 m!653789))

(declare-fun m!653795 () Bool)

(assert (=> b!690152 m!653795))

(push 1)

(assert (not b!690154))

(assert (not b!690153))

(assert (not b!690152))

(assert (not b!690150))

(assert (not start!61688))

(assert (not b!690155))

(assert (not b!690156))

(assert (not b!690151))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

