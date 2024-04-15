; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60126 () Bool)

(assert start!60126)

(declare-fun b!670908 () Bool)

(declare-fun res!437779 () Bool)

(declare-fun e!383464 () Bool)

(assert (=> b!670908 (=> (not res!437779) (not e!383464))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39184 0))(
  ( (array!39185 (arr!18784 (Array (_ BitVec 32) (_ BitVec 64))) (size!19149 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39184)

(assert (=> b!670908 (= res!437779 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19149 a!3626))))))

(declare-fun b!670910 () Bool)

(declare-fun res!437768 () Bool)

(assert (=> b!670910 (=> (not res!437768) (not e!383464))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!670910 (= res!437768 (validKeyInArray!0 k!2843))))

(declare-fun b!670911 () Bool)

(declare-fun e!383461 () Bool)

(declare-datatypes ((List!12864 0))(
  ( (Nil!12861) (Cons!12860 (h!13905 (_ BitVec 64)) (t!19083 List!12864)) )
))
(declare-fun acc!681 () List!12864)

(declare-fun contains!3386 (List!12864 (_ BitVec 64)) Bool)

(assert (=> b!670911 (= e!383461 (contains!3386 acc!681 k!2843))))

(declare-fun b!670912 () Bool)

(declare-fun res!437766 () Bool)

(assert (=> b!670912 (=> (not res!437766) (not e!383464))))

(declare-fun arrayContainsKey!0 (array!39184 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!670912 (= res!437766 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!670913 () Bool)

(declare-fun res!437775 () Bool)

(assert (=> b!670913 (=> (not res!437775) (not e!383464))))

(declare-fun arrayNoDuplicates!0 (array!39184 (_ BitVec 32) List!12864) Bool)

(assert (=> b!670913 (= res!437775 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12861))))

(declare-fun b!670914 () Bool)

(declare-fun res!437771 () Bool)

(assert (=> b!670914 (=> (not res!437771) (not e!383464))))

(declare-fun e!383465 () Bool)

(assert (=> b!670914 (= res!437771 e!383465)))

(declare-fun res!437778 () Bool)

(assert (=> b!670914 (=> res!437778 e!383465)))

(assert (=> b!670914 (= res!437778 e!383461)))

(declare-fun res!437772 () Bool)

(assert (=> b!670914 (=> (not res!437772) (not e!383461))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!670914 (= res!437772 (bvsgt from!3004 i!1382))))

(declare-fun b!670915 () Bool)

(declare-fun res!437776 () Bool)

(assert (=> b!670915 (=> (not res!437776) (not e!383464))))

(declare-fun noDuplicate!655 (List!12864) Bool)

(assert (=> b!670915 (= res!437776 (noDuplicate!655 acc!681))))

(declare-fun b!670916 () Bool)

(declare-fun res!437767 () Bool)

(assert (=> b!670916 (=> (not res!437767) (not e!383464))))

(assert (=> b!670916 (= res!437767 (not (contains!3386 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670909 () Bool)

(declare-fun res!437774 () Bool)

(assert (=> b!670909 (=> (not res!437774) (not e!383464))))

(assert (=> b!670909 (= res!437774 (not (contains!3386 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!437764 () Bool)

(assert (=> start!60126 (=> (not res!437764) (not e!383464))))

(assert (=> start!60126 (= res!437764 (and (bvslt (size!19149 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19149 a!3626))))))

(assert (=> start!60126 e!383464))

(assert (=> start!60126 true))

(declare-fun array_inv!14667 (array!39184) Bool)

(assert (=> start!60126 (array_inv!14667 a!3626)))

(declare-fun b!670917 () Bool)

(declare-fun e!383462 () Bool)

(assert (=> b!670917 (= e!383462 (not (contains!3386 acc!681 k!2843)))))

(declare-fun b!670918 () Bool)

(assert (=> b!670918 (= e!383465 e!383462)))

(declare-fun res!437770 () Bool)

(assert (=> b!670918 (=> (not res!437770) (not e!383462))))

(assert (=> b!670918 (= res!437770 (bvsle from!3004 i!1382))))

(declare-fun b!670919 () Bool)

(declare-fun res!437765 () Bool)

(assert (=> b!670919 (=> (not res!437765) (not e!383464))))

(assert (=> b!670919 (= res!437765 (validKeyInArray!0 (select (arr!18784 a!3626) from!3004)))))

(declare-fun b!670920 () Bool)

(assert (=> b!670920 (= e!383464 (not true))))

(assert (=> b!670920 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun b!670921 () Bool)

(declare-fun res!437773 () Bool)

(assert (=> b!670921 (=> (not res!437773) (not e!383464))))

(assert (=> b!670921 (= res!437773 (= (select (arr!18784 a!3626) from!3004) k!2843))))

(declare-fun b!670922 () Bool)

(declare-fun res!437769 () Bool)

(assert (=> b!670922 (=> (not res!437769) (not e!383464))))

(assert (=> b!670922 (= res!437769 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19149 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!670923 () Bool)

(declare-fun res!437777 () Bool)

(assert (=> b!670923 (=> (not res!437777) (not e!383464))))

(assert (=> b!670923 (= res!437777 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!60126 res!437764) b!670915))

(assert (= (and b!670915 res!437776) b!670916))

(assert (= (and b!670916 res!437767) b!670909))

(assert (= (and b!670909 res!437774) b!670914))

(assert (= (and b!670914 res!437772) b!670911))

(assert (= (and b!670914 (not res!437778)) b!670918))

(assert (= (and b!670918 res!437770) b!670917))

(assert (= (and b!670914 res!437771) b!670913))

(assert (= (and b!670913 res!437775) b!670923))

(assert (= (and b!670923 res!437777) b!670908))

(assert (= (and b!670908 res!437779) b!670910))

(assert (= (and b!670910 res!437768) b!670912))

(assert (= (and b!670912 res!437766) b!670922))

(assert (= (and b!670922 res!437769) b!670919))

(assert (= (and b!670919 res!437765) b!670921))

(assert (= (and b!670921 res!437773) b!670920))

(declare-fun m!640023 () Bool)

(assert (=> b!670916 m!640023))

(declare-fun m!640025 () Bool)

(assert (=> b!670919 m!640025))

(assert (=> b!670919 m!640025))

(declare-fun m!640027 () Bool)

(assert (=> b!670919 m!640027))

(declare-fun m!640029 () Bool)

(assert (=> start!60126 m!640029))

(declare-fun m!640031 () Bool)

(assert (=> b!670910 m!640031))

(declare-fun m!640033 () Bool)

(assert (=> b!670923 m!640033))

(declare-fun m!640035 () Bool)

(assert (=> b!670913 m!640035))

(declare-fun m!640037 () Bool)

(assert (=> b!670909 m!640037))

(declare-fun m!640039 () Bool)

(assert (=> b!670912 m!640039))

(assert (=> b!670921 m!640025))

(declare-fun m!640041 () Bool)

(assert (=> b!670911 m!640041))

(declare-fun m!640043 () Bool)

(assert (=> b!670920 m!640043))

(declare-fun m!640045 () Bool)

(assert (=> b!670915 m!640045))

(assert (=> b!670917 m!640041))

(push 1)

(assert (not b!670919))

(assert (not b!670915))

(assert (not b!670920))

(assert (not b!670910))

(assert (not start!60126))

(assert (not b!670911))

(assert (not b!670913))

(assert (not b!670912))

(assert (not b!670916))

(assert (not b!670909))

(assert (not b!670917))

(assert (not b!670923))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

