; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62148 () Bool)

(assert start!62148)

(declare-fun b!695957 () Bool)

(declare-fun res!459914 () Bool)

(declare-fun e!395791 () Bool)

(assert (=> b!695957 (=> (not res!459914) (not e!395791))))

(declare-fun e!395793 () Bool)

(assert (=> b!695957 (= res!459914 e!395793)))

(declare-fun res!459923 () Bool)

(assert (=> b!695957 (=> res!459923 e!395793)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!695957 (= res!459923 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!695958 () Bool)

(declare-fun res!459919 () Bool)

(assert (=> b!695958 (=> (not res!459919) (not e!395791))))

(declare-datatypes ((array!39938 0))(
  ( (array!39939 (arr!19130 (Array (_ BitVec 32) (_ BitVec 64))) (size!19515 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39938)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!695958 (= res!459919 (not (validKeyInArray!0 (select (arr!19130 a!3626) from!3004))))))

(declare-fun b!695959 () Bool)

(declare-fun e!395789 () Bool)

(declare-datatypes ((List!13171 0))(
  ( (Nil!13168) (Cons!13167 (h!14212 (_ BitVec 64)) (t!19453 List!13171)) )
))
(declare-fun acc!681 () List!13171)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3748 (List!13171 (_ BitVec 64)) Bool)

(assert (=> b!695959 (= e!395789 (not (contains!3748 acc!681 k!2843)))))

(declare-fun b!695960 () Bool)

(declare-fun e!395792 () Bool)

(assert (=> b!695960 (= e!395792 (contains!3748 acc!681 k!2843))))

(declare-fun b!695961 () Bool)

(declare-fun res!459917 () Bool)

(assert (=> b!695961 (=> (not res!459917) (not e!395791))))

(declare-fun arrayNoDuplicates!0 (array!39938 (_ BitVec 32) List!13171) Bool)

(assert (=> b!695961 (= res!459917 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!695962 () Bool)

(declare-fun res!459910 () Bool)

(assert (=> b!695962 (=> (not res!459910) (not e!395791))))

(assert (=> b!695962 (= res!459910 (validKeyInArray!0 k!2843))))

(declare-fun b!695963 () Bool)

(declare-fun res!459918 () Bool)

(assert (=> b!695963 (=> (not res!459918) (not e!395791))))

(declare-fun e!395788 () Bool)

(assert (=> b!695963 (= res!459918 e!395788)))

(declare-fun res!459907 () Bool)

(assert (=> b!695963 (=> res!459907 e!395788)))

(assert (=> b!695963 (= res!459907 e!395792)))

(declare-fun res!459916 () Bool)

(assert (=> b!695963 (=> (not res!459916) (not e!395792))))

(assert (=> b!695963 (= res!459916 (bvsgt from!3004 i!1382))))

(declare-fun b!695964 () Bool)

(declare-fun res!459920 () Bool)

(assert (=> b!695964 (=> (not res!459920) (not e!395791))))

(assert (=> b!695964 (= res!459920 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13168))))

(declare-fun b!695965 () Bool)

(declare-fun res!459908 () Bool)

(assert (=> b!695965 (=> (not res!459908) (not e!395791))))

(declare-fun noDuplicate!995 (List!13171) Bool)

(assert (=> b!695965 (= res!459908 (noDuplicate!995 acc!681))))

(declare-fun b!695967 () Bool)

(declare-fun res!459905 () Bool)

(assert (=> b!695967 (=> (not res!459905) (not e!395791))))

(assert (=> b!695967 (= res!459905 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!695968 () Bool)

(declare-fun e!395787 () Bool)

(assert (=> b!695968 (= e!395791 e!395787)))

(declare-fun res!459909 () Bool)

(assert (=> b!695968 (=> res!459909 e!395787)))

(assert (=> b!695968 (= res!459909 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!695969 () Bool)

(declare-fun res!459913 () Bool)

(assert (=> b!695969 (=> (not res!459913) (not e!395791))))

(assert (=> b!695969 (= res!459913 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19515 a!3626))))))

(declare-fun b!695970 () Bool)

(declare-fun res!459921 () Bool)

(assert (=> b!695970 (=> (not res!459921) (not e!395791))))

(assert (=> b!695970 (= res!459921 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19515 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!695971 () Bool)

(declare-fun res!459911 () Bool)

(assert (=> b!695971 (=> (not res!459911) (not e!395791))))

(declare-fun arrayContainsKey!0 (array!39938 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!695971 (= res!459911 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!695972 () Bool)

(assert (=> b!695972 (= e!395787 (contains!3748 acc!681 k!2843))))

(declare-fun b!695973 () Bool)

(declare-fun res!459915 () Bool)

(assert (=> b!695973 (=> (not res!459915) (not e!395791))))

(assert (=> b!695973 (= res!459915 (not (contains!3748 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695966 () Bool)

(assert (=> b!695966 (= e!395793 (not (contains!3748 acc!681 k!2843)))))

(declare-fun res!459922 () Bool)

(assert (=> start!62148 (=> (not res!459922) (not e!395791))))

(assert (=> start!62148 (= res!459922 (and (bvslt (size!19515 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19515 a!3626))))))

(assert (=> start!62148 e!395791))

(assert (=> start!62148 true))

(declare-fun array_inv!14926 (array!39938) Bool)

(assert (=> start!62148 (array_inv!14926 a!3626)))

(declare-fun b!695974 () Bool)

(declare-fun res!459912 () Bool)

(assert (=> b!695974 (=> (not res!459912) (not e!395791))))

(assert (=> b!695974 (= res!459912 (not (contains!3748 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695975 () Bool)

(assert (=> b!695975 (= e!395788 e!395789)))

(declare-fun res!459906 () Bool)

(assert (=> b!695975 (=> (not res!459906) (not e!395789))))

(assert (=> b!695975 (= res!459906 (bvsle from!3004 i!1382))))

(assert (= (and start!62148 res!459922) b!695965))

(assert (= (and b!695965 res!459908) b!695973))

(assert (= (and b!695973 res!459915) b!695974))

(assert (= (and b!695974 res!459912) b!695963))

(assert (= (and b!695963 res!459916) b!695960))

(assert (= (and b!695963 (not res!459907)) b!695975))

(assert (= (and b!695975 res!459906) b!695959))

(assert (= (and b!695963 res!459918) b!695964))

(assert (= (and b!695964 res!459920) b!695961))

(assert (= (and b!695961 res!459917) b!695969))

(assert (= (and b!695969 res!459913) b!695962))

(assert (= (and b!695962 res!459910) b!695971))

(assert (= (and b!695971 res!459911) b!695970))

(assert (= (and b!695970 res!459921) b!695958))

(assert (= (and b!695958 res!459919) b!695967))

(assert (= (and b!695967 res!459905) b!695957))

(assert (= (and b!695957 (not res!459923)) b!695966))

(assert (= (and b!695957 res!459914) b!695968))

(assert (= (and b!695968 (not res!459909)) b!695972))

(declare-fun m!657187 () Bool)

(assert (=> b!695960 m!657187))

(declare-fun m!657189 () Bool)

(assert (=> start!62148 m!657189))

(declare-fun m!657191 () Bool)

(assert (=> b!695973 m!657191))

(declare-fun m!657193 () Bool)

(assert (=> b!695971 m!657193))

(assert (=> b!695966 m!657187))

(declare-fun m!657195 () Bool)

(assert (=> b!695974 m!657195))

(assert (=> b!695972 m!657187))

(declare-fun m!657197 () Bool)

(assert (=> b!695958 m!657197))

(assert (=> b!695958 m!657197))

(declare-fun m!657199 () Bool)

(assert (=> b!695958 m!657199))

(assert (=> b!695959 m!657187))

(declare-fun m!657201 () Bool)

(assert (=> b!695961 m!657201))

(declare-fun m!657203 () Bool)

(assert (=> b!695965 m!657203))

(declare-fun m!657205 () Bool)

(assert (=> b!695964 m!657205))

(declare-fun m!657207 () Bool)

(assert (=> b!695962 m!657207))

(push 1)

(assert (not b!695966))

(assert (not b!695971))

(assert (not b!695960))

(assert (not b!695958))

(assert (not b!695965))

(assert (not b!695959))

(assert (not start!62148))

(assert (not b!695964))

(assert (not b!695961))

(assert (not b!695974))

(assert (not b!695973))

(assert (not b!695972))

(assert (not b!695962))

(check-sat)

(pop 1)

(push 1)

(check-sat)

