; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59960 () Bool)

(assert start!59960)

(declare-fun b!665232 () Bool)

(declare-fun e!381198 () Bool)

(declare-datatypes ((List!12781 0))(
  ( (Nil!12778) (Cons!12777 (h!13822 (_ BitVec 64)) (t!19000 List!12781)) )
))
(declare-fun acc!681 () List!12781)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3303 (List!12781 (_ BitVec 64)) Bool)

(assert (=> b!665232 (= e!381198 (contains!3303 acc!681 k0!2843))))

(declare-fun b!665233 () Bool)

(declare-fun res!432921 () Bool)

(declare-fun e!381202 () Bool)

(assert (=> b!665233 (=> (not res!432921) (not e!381202))))

(declare-fun noDuplicate!572 (List!12781) Bool)

(assert (=> b!665233 (= res!432921 (noDuplicate!572 acc!681))))

(declare-fun b!665234 () Bool)

(declare-fun res!432925 () Bool)

(declare-fun e!381197 () Bool)

(assert (=> b!665234 (=> res!432925 e!381197)))

(assert (=> b!665234 (= res!432925 (contains!3303 acc!681 k0!2843))))

(declare-fun b!665235 () Bool)

(assert (=> b!665235 (= e!381197 true)))

(declare-fun lt!309807 () Bool)

(declare-fun lt!309805 () List!12781)

(assert (=> b!665235 (= lt!309807 (contains!3303 lt!309805 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665236 () Bool)

(declare-datatypes ((Unit!23213 0))(
  ( (Unit!23214) )
))
(declare-fun e!381196 () Unit!23213)

(declare-fun Unit!23215 () Unit!23213)

(assert (=> b!665236 (= e!381196 Unit!23215)))

(declare-fun b!665237 () Bool)

(declare-fun res!432927 () Bool)

(assert (=> b!665237 (=> (not res!432927) (not e!381202))))

(declare-datatypes ((array!39018 0))(
  ( (array!39019 (arr!18701 (Array (_ BitVec 32) (_ BitVec 64))) (size!19066 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39018)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39018 (_ BitVec 32) List!12781) Bool)

(assert (=> b!665237 (= res!432927 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!665239 () Bool)

(declare-fun Unit!23216 () Unit!23213)

(assert (=> b!665239 (= e!381196 Unit!23216)))

(declare-fun lt!309798 () Unit!23213)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39018 (_ BitVec 64) (_ BitVec 32)) Unit!23213)

(assert (=> b!665239 (= lt!309798 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!665239 false))

(declare-fun b!665240 () Bool)

(declare-fun res!432912 () Bool)

(assert (=> b!665240 (=> (not res!432912) (not e!381202))))

(assert (=> b!665240 (= res!432912 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12778))))

(declare-fun b!665241 () Bool)

(declare-fun res!432924 () Bool)

(assert (=> b!665241 (=> res!432924 e!381197)))

(assert (=> b!665241 (= res!432924 (contains!3303 lt!309805 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665242 () Bool)

(declare-fun res!432922 () Bool)

(assert (=> b!665242 (=> (not res!432922) (not e!381202))))

(assert (=> b!665242 (= res!432922 (not (contains!3303 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665243 () Bool)

(declare-fun e!381203 () Unit!23213)

(declare-fun Unit!23217 () Unit!23213)

(assert (=> b!665243 (= e!381203 Unit!23217)))

(declare-fun b!665244 () Bool)

(declare-fun e!381199 () Bool)

(declare-fun e!381201 () Bool)

(assert (=> b!665244 (= e!381199 e!381201)))

(declare-fun res!432908 () Bool)

(assert (=> b!665244 (=> (not res!432908) (not e!381201))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!665244 (= res!432908 (bvsle from!3004 i!1382))))

(declare-fun b!665245 () Bool)

(declare-fun res!432910 () Bool)

(assert (=> b!665245 (=> (not res!432910) (not e!381202))))

(assert (=> b!665245 (= res!432910 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19066 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!665246 () Bool)

(assert (=> b!665246 (= e!381201 (not (contains!3303 acc!681 k0!2843)))))

(declare-fun b!665247 () Bool)

(declare-fun res!432917 () Bool)

(assert (=> b!665247 (=> res!432917 e!381197)))

(declare-fun lt!309803 () Bool)

(assert (=> b!665247 (= res!432917 lt!309803)))

(declare-fun b!665248 () Bool)

(declare-fun res!432913 () Bool)

(assert (=> b!665248 (=> (not res!432913) (not e!381202))))

(assert (=> b!665248 (= res!432913 (not (contains!3303 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665249 () Bool)

(declare-fun res!432909 () Bool)

(assert (=> b!665249 (=> (not res!432909) (not e!381202))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!665249 (= res!432909 (validKeyInArray!0 k0!2843))))

(declare-fun b!665250 () Bool)

(declare-fun lt!309800 () Unit!23213)

(assert (=> b!665250 (= e!381203 lt!309800)))

(declare-fun lt!309802 () Unit!23213)

(declare-fun lemmaListSubSeqRefl!0 (List!12781) Unit!23213)

(assert (=> b!665250 (= lt!309802 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!59 (List!12781 List!12781) Bool)

(assert (=> b!665250 (subseq!59 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39018 List!12781 List!12781 (_ BitVec 32)) Unit!23213)

(declare-fun $colon$colon!190 (List!12781 (_ BitVec 64)) List!12781)

(assert (=> b!665250 (= lt!309800 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!190 acc!681 (select (arr!18701 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665250 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!665251 () Bool)

(declare-fun res!432926 () Bool)

(assert (=> b!665251 (=> (not res!432926) (not e!381202))))

(declare-fun arrayContainsKey!0 (array!39018 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!665251 (= res!432926 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!665252 () Bool)

(declare-fun res!432923 () Bool)

(assert (=> b!665252 (=> (not res!432923) (not e!381202))))

(assert (=> b!665252 (= res!432923 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19066 a!3626))))))

(declare-fun b!665253 () Bool)

(declare-fun res!432919 () Bool)

(assert (=> b!665253 (=> res!432919 e!381197)))

(assert (=> b!665253 (= res!432919 (not (contains!3303 lt!309805 k0!2843)))))

(declare-fun b!665254 () Bool)

(declare-fun res!432918 () Bool)

(assert (=> b!665254 (=> (not res!432918) (not e!381202))))

(assert (=> b!665254 (= res!432918 e!381199)))

(declare-fun res!432911 () Bool)

(assert (=> b!665254 (=> res!432911 e!381199)))

(assert (=> b!665254 (= res!432911 e!381198)))

(declare-fun res!432928 () Bool)

(assert (=> b!665254 (=> (not res!432928) (not e!381198))))

(assert (=> b!665254 (= res!432928 (bvsgt from!3004 i!1382))))

(declare-fun b!665255 () Bool)

(declare-fun res!432915 () Bool)

(assert (=> b!665255 (=> res!432915 e!381197)))

(assert (=> b!665255 (= res!432915 (not (subseq!59 acc!681 lt!309805)))))

(declare-fun b!665256 () Bool)

(assert (=> b!665256 (= e!381202 (not e!381197))))

(declare-fun res!432920 () Bool)

(assert (=> b!665256 (=> res!432920 e!381197)))

(assert (=> b!665256 (= res!432920 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!57 (List!12781 (_ BitVec 64)) List!12781)

(assert (=> b!665256 (= (-!57 lt!309805 k0!2843) acc!681)))

(assert (=> b!665256 (= lt!309805 ($colon$colon!190 acc!681 k0!2843))))

(declare-fun lt!309801 () Unit!23213)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12781) Unit!23213)

(assert (=> b!665256 (= lt!309801 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!665256 (subseq!59 acc!681 acc!681)))

(declare-fun lt!309804 () Unit!23213)

(assert (=> b!665256 (= lt!309804 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665256 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309806 () Unit!23213)

(assert (=> b!665256 (= lt!309806 e!381203)))

(declare-fun c!76529 () Bool)

(assert (=> b!665256 (= c!76529 (validKeyInArray!0 (select (arr!18701 a!3626) from!3004)))))

(declare-fun lt!309799 () Unit!23213)

(assert (=> b!665256 (= lt!309799 e!381196)))

(declare-fun c!76530 () Bool)

(assert (=> b!665256 (= c!76530 lt!309803)))

(assert (=> b!665256 (= lt!309803 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665256 (arrayContainsKey!0 (array!39019 (store (arr!18701 a!3626) i!1382 k0!2843) (size!19066 a!3626)) k0!2843 from!3004)))

(declare-fun res!432916 () Bool)

(assert (=> start!59960 (=> (not res!432916) (not e!381202))))

(assert (=> start!59960 (= res!432916 (and (bvslt (size!19066 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19066 a!3626))))))

(assert (=> start!59960 e!381202))

(assert (=> start!59960 true))

(declare-fun array_inv!14584 (array!39018) Bool)

(assert (=> start!59960 (array_inv!14584 a!3626)))

(declare-fun b!665238 () Bool)

(declare-fun res!432914 () Bool)

(assert (=> b!665238 (=> res!432914 e!381197)))

(assert (=> b!665238 (= res!432914 (not (noDuplicate!572 lt!309805)))))

(assert (= (and start!59960 res!432916) b!665233))

(assert (= (and b!665233 res!432921) b!665248))

(assert (= (and b!665248 res!432913) b!665242))

(assert (= (and b!665242 res!432922) b!665254))

(assert (= (and b!665254 res!432928) b!665232))

(assert (= (and b!665254 (not res!432911)) b!665244))

(assert (= (and b!665244 res!432908) b!665246))

(assert (= (and b!665254 res!432918) b!665240))

(assert (= (and b!665240 res!432912) b!665237))

(assert (= (and b!665237 res!432927) b!665252))

(assert (= (and b!665252 res!432923) b!665249))

(assert (= (and b!665249 res!432909) b!665251))

(assert (= (and b!665251 res!432926) b!665245))

(assert (= (and b!665245 res!432910) b!665256))

(assert (= (and b!665256 c!76530) b!665239))

(assert (= (and b!665256 (not c!76530)) b!665236))

(assert (= (and b!665256 c!76529) b!665250))

(assert (= (and b!665256 (not c!76529)) b!665243))

(assert (= (and b!665256 (not res!432920)) b!665238))

(assert (= (and b!665238 (not res!432914)) b!665247))

(assert (= (and b!665247 (not res!432917)) b!665234))

(assert (= (and b!665234 (not res!432925)) b!665255))

(assert (= (and b!665255 (not res!432915)) b!665253))

(assert (= (and b!665253 (not res!432919)) b!665241))

(assert (= (and b!665241 (not res!432924)) b!665235))

(declare-fun m!635775 () Bool)

(assert (=> start!59960 m!635775))

(declare-fun m!635777 () Bool)

(assert (=> b!665241 m!635777))

(declare-fun m!635779 () Bool)

(assert (=> b!665239 m!635779))

(declare-fun m!635781 () Bool)

(assert (=> b!665255 m!635781))

(declare-fun m!635783 () Bool)

(assert (=> b!665235 m!635783))

(declare-fun m!635785 () Bool)

(assert (=> b!665246 m!635785))

(declare-fun m!635787 () Bool)

(assert (=> b!665238 m!635787))

(declare-fun m!635789 () Bool)

(assert (=> b!665256 m!635789))

(declare-fun m!635791 () Bool)

(assert (=> b!665256 m!635791))

(declare-fun m!635793 () Bool)

(assert (=> b!665256 m!635793))

(declare-fun m!635795 () Bool)

(assert (=> b!665256 m!635795))

(declare-fun m!635797 () Bool)

(assert (=> b!665256 m!635797))

(declare-fun m!635799 () Bool)

(assert (=> b!665256 m!635799))

(assert (=> b!665256 m!635791))

(declare-fun m!635801 () Bool)

(assert (=> b!665256 m!635801))

(declare-fun m!635803 () Bool)

(assert (=> b!665256 m!635803))

(declare-fun m!635805 () Bool)

(assert (=> b!665256 m!635805))

(declare-fun m!635807 () Bool)

(assert (=> b!665256 m!635807))

(declare-fun m!635809 () Bool)

(assert (=> b!665256 m!635809))

(declare-fun m!635811 () Bool)

(assert (=> b!665253 m!635811))

(declare-fun m!635813 () Bool)

(assert (=> b!665251 m!635813))

(declare-fun m!635815 () Bool)

(assert (=> b!665248 m!635815))

(declare-fun m!635817 () Bool)

(assert (=> b!665237 m!635817))

(assert (=> b!665234 m!635785))

(declare-fun m!635819 () Bool)

(assert (=> b!665240 m!635819))

(declare-fun m!635821 () Bool)

(assert (=> b!665233 m!635821))

(declare-fun m!635823 () Bool)

(assert (=> b!665242 m!635823))

(declare-fun m!635825 () Bool)

(assert (=> b!665249 m!635825))

(assert (=> b!665232 m!635785))

(assert (=> b!665250 m!635789))

(assert (=> b!665250 m!635791))

(declare-fun m!635827 () Bool)

(assert (=> b!665250 m!635827))

(declare-fun m!635829 () Bool)

(assert (=> b!665250 m!635829))

(assert (=> b!665250 m!635791))

(assert (=> b!665250 m!635827))

(assert (=> b!665250 m!635795))

(assert (=> b!665250 m!635809))

(check-sat (not b!665253) (not b!665241) (not b!665242) (not b!665237) (not b!665256) (not b!665249) (not b!665239) (not b!665246) (not b!665232) (not b!665240) (not b!665250) (not b!665248) (not b!665235) (not b!665233) (not b!665234) (not b!665238) (not b!665255) (not start!59960) (not b!665251))
(check-sat)
