; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60188 () Bool)

(assert start!60188)

(declare-fun b!673136 () Bool)

(declare-fun res!439846 () Bool)

(declare-fun e!384372 () Bool)

(assert (=> b!673136 (=> (not res!439846) (not e!384372))))

(declare-datatypes ((List!12895 0))(
  ( (Nil!12892) (Cons!12891 (h!13936 (_ BitVec 64)) (t!19114 List!12895)) )
))
(declare-fun lt!312210 () List!12895)

(declare-fun contains!3417 (List!12895 (_ BitVec 64)) Bool)

(assert (=> b!673136 (= res!439846 (not (contains!3417 lt!312210 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673137 () Bool)

(declare-fun res!439859 () Bool)

(declare-fun e!384377 () Bool)

(assert (=> b!673137 (=> (not res!439859) (not e!384377))))

(declare-datatypes ((array!39246 0))(
  ( (array!39247 (arr!18815 (Array (_ BitVec 32) (_ BitVec 64))) (size!19180 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39246)

(declare-fun arrayNoDuplicates!0 (array!39246 (_ BitVec 32) List!12895) Bool)

(assert (=> b!673137 (= res!439859 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12892))))

(declare-fun b!673138 () Bool)

(declare-fun e!384378 () Bool)

(declare-fun e!384376 () Bool)

(assert (=> b!673138 (= e!384378 e!384376)))

(declare-fun res!439844 () Bool)

(assert (=> b!673138 (=> (not res!439844) (not e!384376))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!673138 (= res!439844 (bvsle from!3004 i!1382))))

(declare-fun b!673139 () Bool)

(declare-fun res!439854 () Bool)

(assert (=> b!673139 (=> (not res!439854) (not e!384372))))

(declare-fun noDuplicate!686 (List!12895) Bool)

(assert (=> b!673139 (= res!439854 (noDuplicate!686 lt!312210))))

(declare-fun b!673140 () Bool)

(declare-fun res!439858 () Bool)

(assert (=> b!673140 (=> (not res!439858) (not e!384377))))

(declare-fun acc!681 () List!12895)

(assert (=> b!673140 (= res!439858 (not (contains!3417 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673141 () Bool)

(declare-fun res!439860 () Bool)

(assert (=> b!673141 (=> (not res!439860) (not e!384377))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!673141 (= res!439860 (validKeyInArray!0 k0!2843))))

(declare-fun b!673142 () Bool)

(declare-fun e!384370 () Bool)

(assert (=> b!673142 (= e!384370 (not (contains!3417 lt!312210 k0!2843)))))

(declare-fun b!673143 () Bool)

(declare-fun res!439862 () Bool)

(assert (=> b!673143 (=> (not res!439862) (not e!384377))))

(assert (=> b!673143 (= res!439862 (noDuplicate!686 acc!681))))

(declare-fun b!673144 () Bool)

(declare-fun e!384374 () Bool)

(assert (=> b!673144 (= e!384374 (contains!3417 acc!681 k0!2843))))

(declare-fun res!439863 () Bool)

(assert (=> start!60188 (=> (not res!439863) (not e!384377))))

(assert (=> start!60188 (= res!439863 (and (bvslt (size!19180 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19180 a!3626))))))

(assert (=> start!60188 e!384377))

(assert (=> start!60188 true))

(declare-fun array_inv!14698 (array!39246) Bool)

(assert (=> start!60188 (array_inv!14698 a!3626)))

(declare-fun b!673145 () Bool)

(declare-fun res!439853 () Bool)

(assert (=> b!673145 (=> (not res!439853) (not e!384377))))

(assert (=> b!673145 (= res!439853 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19180 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!673146 () Bool)

(declare-fun res!439866 () Bool)

(assert (=> b!673146 (=> (not res!439866) (not e!384377))))

(assert (=> b!673146 (= res!439866 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!673147 () Bool)

(declare-fun res!439845 () Bool)

(assert (=> b!673147 (=> (not res!439845) (not e!384372))))

(assert (=> b!673147 (= res!439845 (not (contains!3417 lt!312210 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673148 () Bool)

(declare-datatypes ((Unit!23654 0))(
  ( (Unit!23655) )
))
(declare-fun e!384380 () Unit!23654)

(declare-fun Unit!23656 () Unit!23654)

(assert (=> b!673148 (= e!384380 Unit!23656)))

(declare-fun b!673149 () Bool)

(declare-fun res!439856 () Bool)

(assert (=> b!673149 (=> (not res!439856) (not e!384377))))

(declare-fun arrayContainsKey!0 (array!39246 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!673149 (= res!439856 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!673150 () Bool)

(declare-fun res!439865 () Bool)

(assert (=> b!673150 (=> (not res!439865) (not e!384377))))

(assert (=> b!673150 (= res!439865 (not (contains!3417 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673151 () Bool)

(declare-fun res!439864 () Bool)

(assert (=> b!673151 (=> (not res!439864) (not e!384377))))

(assert (=> b!673151 (= res!439864 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19180 a!3626))))))

(declare-fun b!673152 () Bool)

(declare-fun e!384371 () Bool)

(assert (=> b!673152 (= e!384377 e!384371)))

(declare-fun res!439855 () Bool)

(assert (=> b!673152 (=> (not res!439855) (not e!384371))))

(assert (=> b!673152 (= res!439855 (not (= (select (arr!18815 a!3626) from!3004) k0!2843)))))

(declare-fun lt!312207 () Unit!23654)

(assert (=> b!673152 (= lt!312207 e!384380)))

(declare-fun c!77013 () Bool)

(assert (=> b!673152 (= c!77013 (= (select (arr!18815 a!3626) from!3004) k0!2843))))

(declare-fun b!673153 () Bool)

(assert (=> b!673153 (= e!384372 false)))

(declare-fun lt!312209 () Bool)

(assert (=> b!673153 (= lt!312209 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312210))))

(declare-fun b!673154 () Bool)

(declare-fun res!439867 () Bool)

(assert (=> b!673154 (=> (not res!439867) (not e!384372))))

(declare-fun e!384375 () Bool)

(assert (=> b!673154 (= res!439867 e!384375)))

(declare-fun res!439857 () Bool)

(assert (=> b!673154 (=> res!439857 e!384375)))

(declare-fun e!384379 () Bool)

(assert (=> b!673154 (= res!439857 e!384379)))

(declare-fun res!439847 () Bool)

(assert (=> b!673154 (=> (not res!439847) (not e!384379))))

(assert (=> b!673154 (= res!439847 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673155 () Bool)

(declare-fun res!439851 () Bool)

(assert (=> b!673155 (=> (not res!439851) (not e!384377))))

(assert (=> b!673155 (= res!439851 e!384378)))

(declare-fun res!439849 () Bool)

(assert (=> b!673155 (=> res!439849 e!384378)))

(assert (=> b!673155 (= res!439849 e!384374)))

(declare-fun res!439850 () Bool)

(assert (=> b!673155 (=> (not res!439850) (not e!384374))))

(assert (=> b!673155 (= res!439850 (bvsgt from!3004 i!1382))))

(declare-fun b!673156 () Bool)

(assert (=> b!673156 (= e!384379 (contains!3417 lt!312210 k0!2843))))

(declare-fun b!673157 () Bool)

(declare-fun Unit!23657 () Unit!23654)

(assert (=> b!673157 (= e!384380 Unit!23657)))

(assert (=> b!673157 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312208 () Unit!23654)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39246 (_ BitVec 64) (_ BitVec 32)) Unit!23654)

(assert (=> b!673157 (= lt!312208 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!673157 false))

(declare-fun b!673158 () Bool)

(assert (=> b!673158 (= e!384376 (not (contains!3417 acc!681 k0!2843)))))

(declare-fun b!673159 () Bool)

(declare-fun res!439861 () Bool)

(assert (=> b!673159 (=> (not res!439861) (not e!384377))))

(assert (=> b!673159 (= res!439861 (validKeyInArray!0 (select (arr!18815 a!3626) from!3004)))))

(declare-fun b!673160 () Bool)

(assert (=> b!673160 (= e!384371 e!384372)))

(declare-fun res!439848 () Bool)

(assert (=> b!673160 (=> (not res!439848) (not e!384372))))

(assert (=> b!673160 (= res!439848 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!283 (List!12895 (_ BitVec 64)) List!12895)

(assert (=> b!673160 (= lt!312210 ($colon$colon!283 acc!681 (select (arr!18815 a!3626) from!3004)))))

(declare-fun b!673161 () Bool)

(assert (=> b!673161 (= e!384375 e!384370)))

(declare-fun res!439852 () Bool)

(assert (=> b!673161 (=> (not res!439852) (not e!384370))))

(assert (=> b!673161 (= res!439852 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60188 res!439863) b!673143))

(assert (= (and b!673143 res!439862) b!673140))

(assert (= (and b!673140 res!439858) b!673150))

(assert (= (and b!673150 res!439865) b!673155))

(assert (= (and b!673155 res!439850) b!673144))

(assert (= (and b!673155 (not res!439849)) b!673138))

(assert (= (and b!673138 res!439844) b!673158))

(assert (= (and b!673155 res!439851) b!673137))

(assert (= (and b!673137 res!439859) b!673146))

(assert (= (and b!673146 res!439866) b!673151))

(assert (= (and b!673151 res!439864) b!673141))

(assert (= (and b!673141 res!439860) b!673149))

(assert (= (and b!673149 res!439856) b!673145))

(assert (= (and b!673145 res!439853) b!673159))

(assert (= (and b!673159 res!439861) b!673152))

(assert (= (and b!673152 c!77013) b!673157))

(assert (= (and b!673152 (not c!77013)) b!673148))

(assert (= (and b!673152 res!439855) b!673160))

(assert (= (and b!673160 res!439848) b!673139))

(assert (= (and b!673139 res!439854) b!673147))

(assert (= (and b!673147 res!439845) b!673136))

(assert (= (and b!673136 res!439846) b!673154))

(assert (= (and b!673154 res!439847) b!673156))

(assert (= (and b!673154 (not res!439857)) b!673161))

(assert (= (and b!673161 res!439852) b!673142))

(assert (= (and b!673154 res!439867) b!673153))

(declare-fun m!641103 () Bool)

(assert (=> b!673136 m!641103))

(declare-fun m!641105 () Bool)

(assert (=> b!673152 m!641105))

(declare-fun m!641107 () Bool)

(assert (=> b!673150 m!641107))

(declare-fun m!641109 () Bool)

(assert (=> b!673143 m!641109))

(declare-fun m!641111 () Bool)

(assert (=> b!673158 m!641111))

(declare-fun m!641113 () Bool)

(assert (=> b!673149 m!641113))

(assert (=> b!673160 m!641105))

(assert (=> b!673160 m!641105))

(declare-fun m!641115 () Bool)

(assert (=> b!673160 m!641115))

(declare-fun m!641117 () Bool)

(assert (=> b!673139 m!641117))

(declare-fun m!641119 () Bool)

(assert (=> b!673137 m!641119))

(assert (=> b!673144 m!641111))

(declare-fun m!641121 () Bool)

(assert (=> b!673141 m!641121))

(declare-fun m!641123 () Bool)

(assert (=> b!673147 m!641123))

(declare-fun m!641125 () Bool)

(assert (=> b!673142 m!641125))

(declare-fun m!641127 () Bool)

(assert (=> b!673146 m!641127))

(declare-fun m!641129 () Bool)

(assert (=> b!673140 m!641129))

(assert (=> b!673159 m!641105))

(assert (=> b!673159 m!641105))

(declare-fun m!641131 () Bool)

(assert (=> b!673159 m!641131))

(declare-fun m!641133 () Bool)

(assert (=> b!673153 m!641133))

(declare-fun m!641135 () Bool)

(assert (=> b!673157 m!641135))

(declare-fun m!641137 () Bool)

(assert (=> b!673157 m!641137))

(declare-fun m!641139 () Bool)

(assert (=> start!60188 m!641139))

(assert (=> b!673156 m!641125))

(check-sat (not b!673142) (not b!673136) (not b!673153) (not b!673141) (not b!673137) (not b!673159) (not b!673146) (not start!60188) (not b!673158) (not b!673149) (not b!673157) (not b!673156) (not b!673140) (not b!673150) (not b!673144) (not b!673160) (not b!673147) (not b!673143) (not b!673139))
(check-sat)
