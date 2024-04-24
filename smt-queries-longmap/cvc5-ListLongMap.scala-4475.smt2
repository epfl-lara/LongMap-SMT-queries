; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62338 () Bool)

(assert start!62338)

(declare-fun b!698051 () Bool)

(declare-fun res!461819 () Bool)

(declare-fun e!396839 () Bool)

(assert (=> b!698051 (=> (not res!461819) (not e!396839))))

(declare-datatypes ((array!39994 0))(
  ( (array!39995 (arr!19152 (Array (_ BitVec 32) (_ BitVec 64))) (size!19535 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39994)

(declare-datatypes ((List!13100 0))(
  ( (Nil!13097) (Cons!13096 (h!14144 (_ BitVec 64)) (t!19374 List!13100)) )
))
(declare-fun arrayNoDuplicates!0 (array!39994 (_ BitVec 32) List!13100) Bool)

(assert (=> b!698051 (= res!461819 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13097))))

(declare-fun res!461820 () Bool)

(assert (=> start!62338 (=> (not res!461820) (not e!396839))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!62338 (= res!461820 (and (bvslt (size!19535 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19535 a!3626))))))

(assert (=> start!62338 e!396839))

(assert (=> start!62338 true))

(declare-fun array_inv!15011 (array!39994) Bool)

(assert (=> start!62338 (array_inv!15011 a!3626)))

(declare-fun b!698052 () Bool)

(declare-fun res!461817 () Bool)

(assert (=> b!698052 (=> (not res!461817) (not e!396839))))

(declare-fun e!396840 () Bool)

(assert (=> b!698052 (= res!461817 e!396840)))

(declare-fun res!461821 () Bool)

(assert (=> b!698052 (=> res!461821 e!396840)))

(declare-fun e!396836 () Bool)

(assert (=> b!698052 (= res!461821 e!396836)))

(declare-fun res!461824 () Bool)

(assert (=> b!698052 (=> (not res!461824) (not e!396836))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!698052 (= res!461824 (bvsgt from!3004 i!1382))))

(declare-fun b!698053 () Bool)

(declare-fun res!461822 () Bool)

(assert (=> b!698053 (=> (not res!461822) (not e!396839))))

(declare-fun acc!681 () List!13100)

(declare-fun contains!3752 (List!13100 (_ BitVec 64)) Bool)

(assert (=> b!698053 (= res!461822 (not (contains!3752 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698054 () Bool)

(declare-fun e!396838 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!698054 (= e!396838 (not (contains!3752 acc!681 k!2843)))))

(declare-fun b!698055 () Bool)

(assert (=> b!698055 (= e!396839 false)))

(declare-fun lt!317299 () Bool)

(assert (=> b!698055 (= lt!317299 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!698056 () Bool)

(assert (=> b!698056 (= e!396840 e!396838)))

(declare-fun res!461818 () Bool)

(assert (=> b!698056 (=> (not res!461818) (not e!396838))))

(assert (=> b!698056 (= res!461818 (bvsle from!3004 i!1382))))

(declare-fun b!698057 () Bool)

(declare-fun res!461823 () Bool)

(assert (=> b!698057 (=> (not res!461823) (not e!396839))))

(assert (=> b!698057 (= res!461823 (not (contains!3752 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698058 () Bool)

(assert (=> b!698058 (= e!396836 (contains!3752 acc!681 k!2843))))

(declare-fun b!698059 () Bool)

(declare-fun res!461816 () Bool)

(assert (=> b!698059 (=> (not res!461816) (not e!396839))))

(declare-fun noDuplicate!1026 (List!13100) Bool)

(assert (=> b!698059 (= res!461816 (noDuplicate!1026 acc!681))))

(assert (= (and start!62338 res!461820) b!698059))

(assert (= (and b!698059 res!461816) b!698057))

(assert (= (and b!698057 res!461823) b!698053))

(assert (= (and b!698053 res!461822) b!698052))

(assert (= (and b!698052 res!461824) b!698058))

(assert (= (and b!698052 (not res!461821)) b!698056))

(assert (= (and b!698056 res!461818) b!698054))

(assert (= (and b!698052 res!461817) b!698051))

(assert (= (and b!698051 res!461819) b!698055))

(declare-fun m!658847 () Bool)

(assert (=> start!62338 m!658847))

(declare-fun m!658849 () Bool)

(assert (=> b!698054 m!658849))

(declare-fun m!658851 () Bool)

(assert (=> b!698055 m!658851))

(declare-fun m!658853 () Bool)

(assert (=> b!698059 m!658853))

(assert (=> b!698058 m!658849))

(declare-fun m!658855 () Bool)

(assert (=> b!698053 m!658855))

(declare-fun m!658857 () Bool)

(assert (=> b!698057 m!658857))

(declare-fun m!658859 () Bool)

(assert (=> b!698051 m!658859))

(push 1)

(assert (not b!698051))

(assert (not b!698058))

(assert (not b!698054))

(assert (not b!698059))

(assert (not start!62338))

(assert (not b!698057))

(assert (not b!698053))

(assert (not b!698055))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

