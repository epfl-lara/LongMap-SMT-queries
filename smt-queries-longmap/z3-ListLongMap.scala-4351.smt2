; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60136 () Bool)

(assert start!60136)

(declare-fun b!671156 () Bool)

(declare-fun res!437864 () Bool)

(declare-fun e!383639 () Bool)

(assert (=> b!671156 (=> (not res!437864) (not e!383639))))

(declare-datatypes ((List!12825 0))(
  ( (Nil!12822) (Cons!12821 (h!13866 (_ BitVec 64)) (t!19053 List!12825)) )
))
(declare-fun acc!681 () List!12825)

(declare-fun contains!3402 (List!12825 (_ BitVec 64)) Bool)

(assert (=> b!671156 (= res!437864 (not (contains!3402 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671157 () Bool)

(declare-fun res!437863 () Bool)

(assert (=> b!671157 (=> (not res!437863) (not e!383639))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-datatypes ((array!39183 0))(
  ( (array!39184 (arr!18784 (Array (_ BitVec 32) (_ BitVec 64))) (size!19148 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39183)

(assert (=> b!671157 (= res!437863 (= (select (arr!18784 a!3626) from!3004) k0!2843))))

(declare-fun b!671158 () Bool)

(declare-fun res!437861 () Bool)

(assert (=> b!671158 (=> (not res!437861) (not e!383639))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671158 (= res!437861 (validKeyInArray!0 (select (arr!18784 a!3626) from!3004)))))

(declare-fun b!671159 () Bool)

(declare-fun e!383640 () Bool)

(assert (=> b!671159 (= e!383640 (not (contains!3402 acc!681 k0!2843)))))

(declare-fun b!671160 () Bool)

(declare-fun res!437858 () Bool)

(assert (=> b!671160 (=> (not res!437858) (not e!383639))))

(declare-fun arrayNoDuplicates!0 (array!39183 (_ BitVec 32) List!12825) Bool)

(assert (=> b!671160 (= res!437858 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!671161 () Bool)

(declare-fun e!383636 () Bool)

(assert (=> b!671161 (= e!383636 e!383640)))

(declare-fun res!437854 () Bool)

(assert (=> b!671161 (=> (not res!437854) (not e!383640))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!671161 (= res!437854 (bvsle from!3004 i!1382))))

(declare-fun b!671162 () Bool)

(declare-fun res!437862 () Bool)

(assert (=> b!671162 (=> (not res!437862) (not e!383639))))

(assert (=> b!671162 (= res!437862 e!383636)))

(declare-fun res!437852 () Bool)

(assert (=> b!671162 (=> res!437852 e!383636)))

(declare-fun e!383638 () Bool)

(assert (=> b!671162 (= res!437852 e!383638)))

(declare-fun res!437856 () Bool)

(assert (=> b!671162 (=> (not res!437856) (not e!383638))))

(assert (=> b!671162 (= res!437856 (bvsgt from!3004 i!1382))))

(declare-fun res!437860 () Bool)

(assert (=> start!60136 (=> (not res!437860) (not e!383639))))

(assert (=> start!60136 (= res!437860 (and (bvslt (size!19148 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19148 a!3626))))))

(assert (=> start!60136 e!383639))

(assert (=> start!60136 true))

(declare-fun array_inv!14580 (array!39183) Bool)

(assert (=> start!60136 (array_inv!14580 a!3626)))

(declare-fun b!671163 () Bool)

(declare-fun res!437855 () Bool)

(assert (=> b!671163 (=> (not res!437855) (not e!383639))))

(assert (=> b!671163 (= res!437855 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12822))))

(declare-fun b!671164 () Bool)

(assert (=> b!671164 (= e!383639 (not true))))

(declare-fun arrayContainsKey!0 (array!39183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671164 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun b!671165 () Bool)

(declare-fun res!437857 () Bool)

(assert (=> b!671165 (=> (not res!437857) (not e!383639))))

(assert (=> b!671165 (= res!437857 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19148 a!3626))))))

(declare-fun b!671166 () Bool)

(declare-fun res!437867 () Bool)

(assert (=> b!671166 (=> (not res!437867) (not e!383639))))

(assert (=> b!671166 (= res!437867 (validKeyInArray!0 k0!2843))))

(declare-fun b!671167 () Bool)

(assert (=> b!671167 (= e!383638 (contains!3402 acc!681 k0!2843))))

(declare-fun b!671168 () Bool)

(declare-fun res!437866 () Bool)

(assert (=> b!671168 (=> (not res!437866) (not e!383639))))

(declare-fun noDuplicate!649 (List!12825) Bool)

(assert (=> b!671168 (= res!437866 (noDuplicate!649 acc!681))))

(declare-fun b!671169 () Bool)

(declare-fun res!437859 () Bool)

(assert (=> b!671169 (=> (not res!437859) (not e!383639))))

(assert (=> b!671169 (= res!437859 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!671170 () Bool)

(declare-fun res!437853 () Bool)

(assert (=> b!671170 (=> (not res!437853) (not e!383639))))

(assert (=> b!671170 (= res!437853 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19148 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!671171 () Bool)

(declare-fun res!437865 () Bool)

(assert (=> b!671171 (=> (not res!437865) (not e!383639))))

(assert (=> b!671171 (= res!437865 (not (contains!3402 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60136 res!437860) b!671168))

(assert (= (and b!671168 res!437866) b!671156))

(assert (= (and b!671156 res!437864) b!671171))

(assert (= (and b!671171 res!437865) b!671162))

(assert (= (and b!671162 res!437856) b!671167))

(assert (= (and b!671162 (not res!437852)) b!671161))

(assert (= (and b!671161 res!437854) b!671159))

(assert (= (and b!671162 res!437862) b!671163))

(assert (= (and b!671163 res!437855) b!671160))

(assert (= (and b!671160 res!437858) b!671165))

(assert (= (and b!671165 res!437857) b!671166))

(assert (= (and b!671166 res!437867) b!671169))

(assert (= (and b!671169 res!437859) b!671170))

(assert (= (and b!671170 res!437853) b!671158))

(assert (= (and b!671158 res!437861) b!671157))

(assert (= (and b!671157 res!437863) b!671164))

(declare-fun m!640781 () Bool)

(assert (=> b!671168 m!640781))

(declare-fun m!640783 () Bool)

(assert (=> b!671163 m!640783))

(declare-fun m!640785 () Bool)

(assert (=> b!671157 m!640785))

(declare-fun m!640787 () Bool)

(assert (=> b!671164 m!640787))

(declare-fun m!640789 () Bool)

(assert (=> b!671156 m!640789))

(declare-fun m!640791 () Bool)

(assert (=> b!671167 m!640791))

(declare-fun m!640793 () Bool)

(assert (=> b!671171 m!640793))

(declare-fun m!640795 () Bool)

(assert (=> b!671160 m!640795))

(assert (=> b!671158 m!640785))

(assert (=> b!671158 m!640785))

(declare-fun m!640797 () Bool)

(assert (=> b!671158 m!640797))

(declare-fun m!640799 () Bool)

(assert (=> b!671166 m!640799))

(assert (=> b!671159 m!640791))

(declare-fun m!640801 () Bool)

(assert (=> start!60136 m!640801))

(declare-fun m!640803 () Bool)

(assert (=> b!671169 m!640803))

(check-sat (not b!671167) (not b!671158) (not b!671171) (not b!671156) (not b!671166) (not b!671159) (not start!60136) (not b!671164) (not b!671160) (not b!671163) (not b!671168) (not b!671169))
(check-sat)
