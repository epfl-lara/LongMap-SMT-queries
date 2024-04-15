; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62552 () Bool)

(assert start!62552)

(declare-fun b!705144 () Bool)

(declare-fun res!469126 () Bool)

(declare-fun e!397649 () Bool)

(assert (=> b!705144 (=> (not res!469126) (not e!397649))))

(declare-datatypes ((List!13357 0))(
  ( (Nil!13354) (Cons!13353 (h!14398 (_ BitVec 64)) (t!19630 List!13357)) )
))
(declare-fun acc!652 () List!13357)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3879 (List!13357 (_ BitVec 64)) Bool)

(assert (=> b!705144 (= res!469126 (not (contains!3879 acc!652 k0!2824)))))

(declare-fun b!705145 () Bool)

(declare-fun res!469125 () Bool)

(assert (=> b!705145 (=> (not res!469125) (not e!397649))))

(declare-datatypes ((array!40242 0))(
  ( (array!40243 (arr!19277 (Array (_ BitVec 32) (_ BitVec 64))) (size!19659 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40242)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40242 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!705145 (= res!469125 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!705146 () Bool)

(declare-fun res!469131 () Bool)

(assert (=> b!705146 (=> (not res!469131) (not e!397649))))

(declare-fun arrayNoDuplicates!0 (array!40242 (_ BitVec 32) List!13357) Bool)

(assert (=> b!705146 (= res!469131 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!705147 () Bool)

(declare-fun res!469128 () Bool)

(assert (=> b!705147 (=> (not res!469128) (not e!397649))))

(assert (=> b!705147 (= res!469128 (not (contains!3879 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705148 () Bool)

(declare-fun res!469114 () Bool)

(assert (=> b!705148 (=> (not res!469114) (not e!397649))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!705148 (= res!469114 (not (validKeyInArray!0 (select (arr!19277 a!3591) from!2969))))))

(declare-fun b!705149 () Bool)

(declare-fun res!469132 () Bool)

(assert (=> b!705149 (=> (not res!469132) (not e!397649))))

(assert (=> b!705149 (= res!469132 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!705151 () Bool)

(declare-fun res!469122 () Bool)

(assert (=> b!705151 (=> (not res!469122) (not e!397649))))

(assert (=> b!705151 (= res!469122 (not (contains!3879 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705152 () Bool)

(declare-fun res!469130 () Bool)

(assert (=> b!705152 (=> (not res!469130) (not e!397649))))

(assert (=> b!705152 (= res!469130 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19659 a!3591)))))

(declare-fun b!705153 () Bool)

(declare-fun res!469115 () Bool)

(assert (=> b!705153 (=> (not res!469115) (not e!397649))))

(declare-fun newAcc!49 () List!13357)

(assert (=> b!705153 (= res!469115 (not (contains!3879 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705154 () Bool)

(declare-fun res!469117 () Bool)

(assert (=> b!705154 (=> (not res!469117) (not e!397649))))

(declare-fun noDuplicate!1148 (List!13357) Bool)

(assert (=> b!705154 (= res!469117 (noDuplicate!1148 acc!652))))

(declare-fun b!705155 () Bool)

(declare-fun res!469127 () Bool)

(assert (=> b!705155 (=> (not res!469127) (not e!397649))))

(declare-fun subseq!341 (List!13357 List!13357) Bool)

(assert (=> b!705155 (= res!469127 (subseq!341 acc!652 newAcc!49))))

(declare-fun b!705156 () Bool)

(declare-fun res!469124 () Bool)

(assert (=> b!705156 (=> (not res!469124) (not e!397649))))

(assert (=> b!705156 (= res!469124 (noDuplicate!1148 newAcc!49))))

(declare-fun b!705157 () Bool)

(declare-fun res!469116 () Bool)

(assert (=> b!705157 (=> (not res!469116) (not e!397649))))

(assert (=> b!705157 (= res!469116 (not (contains!3879 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705158 () Bool)

(declare-fun res!469121 () Bool)

(assert (=> b!705158 (=> (not res!469121) (not e!397649))))

(assert (=> b!705158 (= res!469121 (contains!3879 newAcc!49 k0!2824))))

(declare-fun b!705150 () Bool)

(declare-fun res!469129 () Bool)

(assert (=> b!705150 (=> (not res!469129) (not e!397649))))

(assert (=> b!705150 (= res!469129 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun res!469120 () Bool)

(assert (=> start!62552 (=> (not res!469120) (not e!397649))))

(assert (=> start!62552 (= res!469120 (and (bvslt (size!19659 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19659 a!3591))))))

(assert (=> start!62552 e!397649))

(assert (=> start!62552 true))

(declare-fun array_inv!15160 (array!40242) Bool)

(assert (=> start!62552 (array_inv!15160 a!3591)))

(declare-fun b!705159 () Bool)

(assert (=> b!705159 (= e!397649 (not (bvsle from!2969 (size!19659 a!3591))))))

(assert (=> b!705159 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-datatypes ((Unit!24584 0))(
  ( (Unit!24585) )
))
(declare-fun lt!317646 () Unit!24584)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40242 (_ BitVec 64) (_ BitVec 32) List!13357 List!13357) Unit!24584)

(assert (=> b!705159 (= lt!317646 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(declare-fun b!705160 () Bool)

(declare-fun res!469118 () Bool)

(assert (=> b!705160 (=> (not res!469118) (not e!397649))))

(assert (=> b!705160 (= res!469118 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!705161 () Bool)

(declare-fun res!469123 () Bool)

(assert (=> b!705161 (=> (not res!469123) (not e!397649))))

(declare-fun -!306 (List!13357 (_ BitVec 64)) List!13357)

(assert (=> b!705161 (= res!469123 (= (-!306 newAcc!49 k0!2824) acc!652))))

(declare-fun b!705162 () Bool)

(declare-fun res!469119 () Bool)

(assert (=> b!705162 (=> (not res!469119) (not e!397649))))

(assert (=> b!705162 (= res!469119 (validKeyInArray!0 k0!2824))))

(assert (= (and start!62552 res!469120) b!705154))

(assert (= (and b!705154 res!469117) b!705156))

(assert (= (and b!705156 res!469124) b!705151))

(assert (= (and b!705151 res!469122) b!705147))

(assert (= (and b!705147 res!469128) b!705149))

(assert (= (and b!705149 res!469132) b!705144))

(assert (= (and b!705144 res!469126) b!705162))

(assert (= (and b!705162 res!469119) b!705146))

(assert (= (and b!705146 res!469131) b!705155))

(assert (= (and b!705155 res!469127) b!705158))

(assert (= (and b!705158 res!469121) b!705161))

(assert (= (and b!705161 res!469123) b!705157))

(assert (= (and b!705157 res!469116) b!705153))

(assert (= (and b!705153 res!469115) b!705152))

(assert (= (and b!705152 res!469130) b!705148))

(assert (= (and b!705148 res!469114) b!705150))

(assert (= (and b!705150 res!469129) b!705145))

(assert (= (and b!705145 res!469125) b!705160))

(assert (= (and b!705160 res!469118) b!705159))

(declare-fun m!662835 () Bool)

(assert (=> b!705154 m!662835))

(declare-fun m!662837 () Bool)

(assert (=> b!705158 m!662837))

(declare-fun m!662839 () Bool)

(assert (=> b!705155 m!662839))

(declare-fun m!662841 () Bool)

(assert (=> b!705149 m!662841))

(declare-fun m!662843 () Bool)

(assert (=> b!705147 m!662843))

(declare-fun m!662845 () Bool)

(assert (=> b!705145 m!662845))

(declare-fun m!662847 () Bool)

(assert (=> b!705144 m!662847))

(declare-fun m!662849 () Bool)

(assert (=> b!705160 m!662849))

(declare-fun m!662851 () Bool)

(assert (=> start!62552 m!662851))

(declare-fun m!662853 () Bool)

(assert (=> b!705162 m!662853))

(declare-fun m!662855 () Bool)

(assert (=> b!705151 m!662855))

(declare-fun m!662857 () Bool)

(assert (=> b!705156 m!662857))

(declare-fun m!662859 () Bool)

(assert (=> b!705159 m!662859))

(declare-fun m!662861 () Bool)

(assert (=> b!705159 m!662861))

(declare-fun m!662863 () Bool)

(assert (=> b!705148 m!662863))

(assert (=> b!705148 m!662863))

(declare-fun m!662865 () Bool)

(assert (=> b!705148 m!662865))

(declare-fun m!662867 () Bool)

(assert (=> b!705161 m!662867))

(declare-fun m!662869 () Bool)

(assert (=> b!705153 m!662869))

(declare-fun m!662871 () Bool)

(assert (=> b!705157 m!662871))

(declare-fun m!662873 () Bool)

(assert (=> b!705146 m!662873))

(check-sat (not b!705147) (not b!705151) (not b!705148) (not b!705162) (not b!705159) (not b!705149) (not b!705155) (not start!62552) (not b!705160) (not b!705158) (not b!705144) (not b!705156) (not b!705145) (not b!705161) (not b!705153) (not b!705146) (not b!705154) (not b!705157))
(check-sat)
