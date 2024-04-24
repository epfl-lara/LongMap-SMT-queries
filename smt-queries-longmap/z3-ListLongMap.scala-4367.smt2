; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60288 () Bool)

(assert start!60288)

(declare-fun b!674846 () Bool)

(declare-fun e!385197 () Bool)

(declare-datatypes ((List!12774 0))(
  ( (Nil!12771) (Cons!12770 (h!13818 (_ BitVec 64)) (t!18994 List!12774)) )
))
(declare-fun acc!681 () List!12774)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3426 (List!12774 (_ BitVec 64)) Bool)

(assert (=> b!674846 (= e!385197 (contains!3426 acc!681 k0!2843))))

(declare-fun b!674847 () Bool)

(declare-fun res!441209 () Bool)

(declare-fun e!385201 () Bool)

(assert (=> b!674847 (=> (not res!441209) (not e!385201))))

(declare-datatypes ((array!39273 0))(
  ( (array!39274 (arr!18826 (Array (_ BitVec 32) (_ BitVec 64))) (size!19190 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39273)

(declare-fun arrayContainsKey!0 (array!39273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!674847 (= res!441209 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!674848 () Bool)

(declare-fun res!441212 () Bool)

(assert (=> b!674848 (=> (not res!441212) (not e!385201))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!674848 (= res!441212 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19190 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!674849 () Bool)

(declare-fun res!441198 () Bool)

(declare-fun e!385200 () Bool)

(assert (=> b!674849 (=> (not res!441198) (not e!385200))))

(declare-fun e!385205 () Bool)

(assert (=> b!674849 (= res!441198 e!385205)))

(declare-fun res!441214 () Bool)

(assert (=> b!674849 (=> res!441214 e!385205)))

(declare-fun e!385198 () Bool)

(assert (=> b!674849 (= res!441214 e!385198)))

(declare-fun res!441199 () Bool)

(assert (=> b!674849 (=> (not res!441199) (not e!385198))))

(assert (=> b!674849 (= res!441199 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674850 () Bool)

(declare-fun e!385196 () Bool)

(declare-fun lt!312745 () List!12774)

(assert (=> b!674850 (= e!385196 (not (contains!3426 lt!312745 k0!2843)))))

(declare-fun b!674851 () Bool)

(declare-fun res!441196 () Bool)

(assert (=> b!674851 (=> (not res!441196) (not e!385201))))

(assert (=> b!674851 (= res!441196 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19190 a!3626))))))

(declare-fun b!674852 () Bool)

(declare-fun e!385202 () Bool)

(assert (=> b!674852 (= e!385202 (not (contains!3426 acc!681 k0!2843)))))

(declare-fun b!674853 () Bool)

(declare-fun res!441200 () Bool)

(assert (=> b!674853 (=> (not res!441200) (not e!385201))))

(declare-fun noDuplicate!700 (List!12774) Bool)

(assert (=> b!674853 (= res!441200 (noDuplicate!700 acc!681))))

(declare-fun b!674854 () Bool)

(declare-fun res!441210 () Bool)

(assert (=> b!674854 (=> (not res!441210) (not e!385201))))

(declare-fun arrayNoDuplicates!0 (array!39273 (_ BitVec 32) List!12774) Bool)

(assert (=> b!674854 (= res!441210 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!674855 () Bool)

(declare-fun res!441216 () Bool)

(assert (=> b!674855 (=> (not res!441216) (not e!385201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!674855 (= res!441216 (validKeyInArray!0 k0!2843))))

(declare-fun b!674856 () Bool)

(assert (=> b!674856 (= e!385200 (not true))))

(assert (=> b!674856 (arrayNoDuplicates!0 (array!39274 (store (arr!18826 a!3626) i!1382 k0!2843) (size!19190 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!312745)))

(declare-datatypes ((Unit!23715 0))(
  ( (Unit!23716) )
))
(declare-fun lt!312746 () Unit!23715)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39273 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12774) Unit!23715)

(assert (=> b!674856 (= lt!312746 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!312745))))

(declare-fun b!674857 () Bool)

(assert (=> b!674857 (= e!385198 (contains!3426 lt!312745 k0!2843))))

(declare-fun b!674858 () Bool)

(declare-fun res!441203 () Bool)

(assert (=> b!674858 (=> (not res!441203) (not e!385200))))

(assert (=> b!674858 (= res!441203 (not (contains!3426 lt!312745 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674859 () Bool)

(declare-fun res!441211 () Bool)

(assert (=> b!674859 (=> (not res!441211) (not e!385201))))

(assert (=> b!674859 (= res!441211 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12771))))

(declare-fun b!674860 () Bool)

(declare-fun res!441194 () Bool)

(assert (=> b!674860 (=> (not res!441194) (not e!385200))))

(assert (=> b!674860 (= res!441194 (not (contains!3426 lt!312745 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674861 () Bool)

(declare-fun e!385199 () Bool)

(assert (=> b!674861 (= e!385199 e!385200)))

(declare-fun res!441208 () Bool)

(assert (=> b!674861 (=> (not res!441208) (not e!385200))))

(assert (=> b!674861 (= res!441208 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!296 (List!12774 (_ BitVec 64)) List!12774)

(assert (=> b!674861 (= lt!312745 ($colon$colon!296 acc!681 (select (arr!18826 a!3626) from!3004)))))

(declare-fun b!674862 () Bool)

(declare-fun res!441207 () Bool)

(assert (=> b!674862 (=> (not res!441207) (not e!385201))))

(assert (=> b!674862 (= res!441207 (validKeyInArray!0 (select (arr!18826 a!3626) from!3004)))))

(declare-fun b!674863 () Bool)

(declare-fun e!385206 () Unit!23715)

(declare-fun Unit!23717 () Unit!23715)

(assert (=> b!674863 (= e!385206 Unit!23717)))

(declare-fun b!674864 () Bool)

(declare-fun Unit!23718 () Unit!23715)

(assert (=> b!674864 (= e!385206 Unit!23718)))

(assert (=> b!674864 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312748 () Unit!23715)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39273 (_ BitVec 64) (_ BitVec 32)) Unit!23715)

(assert (=> b!674864 (= lt!312748 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!674864 false))

(declare-fun res!441206 () Bool)

(assert (=> start!60288 (=> (not res!441206) (not e!385201))))

(assert (=> start!60288 (= res!441206 (and (bvslt (size!19190 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19190 a!3626))))))

(assert (=> start!60288 e!385201))

(assert (=> start!60288 true))

(declare-fun array_inv!14685 (array!39273) Bool)

(assert (=> start!60288 (array_inv!14685 a!3626)))

(declare-fun b!674865 () Bool)

(declare-fun res!441217 () Bool)

(assert (=> b!674865 (=> (not res!441217) (not e!385201))))

(assert (=> b!674865 (= res!441217 (not (contains!3426 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674866 () Bool)

(declare-fun res!441213 () Bool)

(assert (=> b!674866 (=> (not res!441213) (not e!385201))))

(assert (=> b!674866 (= res!441213 (not (contains!3426 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674867 () Bool)

(declare-fun res!441195 () Bool)

(assert (=> b!674867 (=> (not res!441195) (not e!385200))))

(assert (=> b!674867 (= res!441195 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312745))))

(declare-fun b!674868 () Bool)

(declare-fun res!441202 () Bool)

(assert (=> b!674868 (=> (not res!441202) (not e!385201))))

(declare-fun e!385204 () Bool)

(assert (=> b!674868 (= res!441202 e!385204)))

(declare-fun res!441205 () Bool)

(assert (=> b!674868 (=> res!441205 e!385204)))

(assert (=> b!674868 (= res!441205 e!385197)))

(declare-fun res!441201 () Bool)

(assert (=> b!674868 (=> (not res!441201) (not e!385197))))

(assert (=> b!674868 (= res!441201 (bvsgt from!3004 i!1382))))

(declare-fun b!674869 () Bool)

(declare-fun res!441197 () Bool)

(assert (=> b!674869 (=> (not res!441197) (not e!385200))))

(assert (=> b!674869 (= res!441197 (noDuplicate!700 lt!312745))))

(declare-fun b!674870 () Bool)

(assert (=> b!674870 (= e!385204 e!385202)))

(declare-fun res!441204 () Bool)

(assert (=> b!674870 (=> (not res!441204) (not e!385202))))

(assert (=> b!674870 (= res!441204 (bvsle from!3004 i!1382))))

(declare-fun b!674871 () Bool)

(assert (=> b!674871 (= e!385201 e!385199)))

(declare-fun res!441193 () Bool)

(assert (=> b!674871 (=> (not res!441193) (not e!385199))))

(assert (=> b!674871 (= res!441193 (not (= (select (arr!18826 a!3626) from!3004) k0!2843)))))

(declare-fun lt!312747 () Unit!23715)

(assert (=> b!674871 (= lt!312747 e!385206)))

(declare-fun c!77195 () Bool)

(assert (=> b!674871 (= c!77195 (= (select (arr!18826 a!3626) from!3004) k0!2843))))

(declare-fun b!674872 () Bool)

(assert (=> b!674872 (= e!385205 e!385196)))

(declare-fun res!441215 () Bool)

(assert (=> b!674872 (=> (not res!441215) (not e!385196))))

(assert (=> b!674872 (= res!441215 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60288 res!441206) b!674853))

(assert (= (and b!674853 res!441200) b!674865))

(assert (= (and b!674865 res!441217) b!674866))

(assert (= (and b!674866 res!441213) b!674868))

(assert (= (and b!674868 res!441201) b!674846))

(assert (= (and b!674868 (not res!441205)) b!674870))

(assert (= (and b!674870 res!441204) b!674852))

(assert (= (and b!674868 res!441202) b!674859))

(assert (= (and b!674859 res!441211) b!674854))

(assert (= (and b!674854 res!441210) b!674851))

(assert (= (and b!674851 res!441196) b!674855))

(assert (= (and b!674855 res!441216) b!674847))

(assert (= (and b!674847 res!441209) b!674848))

(assert (= (and b!674848 res!441212) b!674862))

(assert (= (and b!674862 res!441207) b!674871))

(assert (= (and b!674871 c!77195) b!674864))

(assert (= (and b!674871 (not c!77195)) b!674863))

(assert (= (and b!674871 res!441193) b!674861))

(assert (= (and b!674861 res!441208) b!674869))

(assert (= (and b!674869 res!441197) b!674858))

(assert (= (and b!674858 res!441203) b!674860))

(assert (= (and b!674860 res!441194) b!674849))

(assert (= (and b!674849 res!441199) b!674857))

(assert (= (and b!674849 (not res!441214)) b!674872))

(assert (= (and b!674872 res!441215) b!674850))

(assert (= (and b!674849 res!441198) b!674867))

(assert (= (and b!674867 res!441195) b!674856))

(declare-fun m!643189 () Bool)

(assert (=> b!674857 m!643189))

(declare-fun m!643191 () Bool)

(assert (=> b!674846 m!643191))

(declare-fun m!643193 () Bool)

(assert (=> b!674869 m!643193))

(declare-fun m!643195 () Bool)

(assert (=> b!674864 m!643195))

(declare-fun m!643197 () Bool)

(assert (=> b!674864 m!643197))

(declare-fun m!643199 () Bool)

(assert (=> b!674871 m!643199))

(declare-fun m!643201 () Bool)

(assert (=> b!674847 m!643201))

(assert (=> b!674861 m!643199))

(assert (=> b!674861 m!643199))

(declare-fun m!643203 () Bool)

(assert (=> b!674861 m!643203))

(declare-fun m!643205 () Bool)

(assert (=> b!674865 m!643205))

(assert (=> b!674850 m!643189))

(declare-fun m!643207 () Bool)

(assert (=> start!60288 m!643207))

(assert (=> b!674852 m!643191))

(declare-fun m!643209 () Bool)

(assert (=> b!674860 m!643209))

(declare-fun m!643211 () Bool)

(assert (=> b!674866 m!643211))

(declare-fun m!643213 () Bool)

(assert (=> b!674858 m!643213))

(declare-fun m!643215 () Bool)

(assert (=> b!674856 m!643215))

(declare-fun m!643217 () Bool)

(assert (=> b!674856 m!643217))

(declare-fun m!643219 () Bool)

(assert (=> b!674856 m!643219))

(declare-fun m!643221 () Bool)

(assert (=> b!674853 m!643221))

(assert (=> b!674862 m!643199))

(assert (=> b!674862 m!643199))

(declare-fun m!643223 () Bool)

(assert (=> b!674862 m!643223))

(declare-fun m!643225 () Bool)

(assert (=> b!674855 m!643225))

(declare-fun m!643227 () Bool)

(assert (=> b!674859 m!643227))

(declare-fun m!643229 () Bool)

(assert (=> b!674854 m!643229))

(declare-fun m!643231 () Bool)

(assert (=> b!674867 m!643231))

(check-sat (not b!674855) (not b!674846) (not b!674866) (not b!674853) (not b!674869) (not b!674859) (not b!674862) (not b!674850) (not b!674857) (not b!674865) (not start!60288) (not b!674856) (not b!674847) (not b!674864) (not b!674861) (not b!674860) (not b!674858) (not b!674854) (not b!674867) (not b!674852))
(check-sat)
