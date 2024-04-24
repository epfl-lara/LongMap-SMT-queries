; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60222 () Bool)

(assert start!60222)

(declare-fun b!672252 () Bool)

(declare-fun e!384113 () Bool)

(declare-fun e!384109 () Bool)

(assert (=> b!672252 (= e!384113 e!384109)))

(declare-fun res!438799 () Bool)

(assert (=> b!672252 (=> (not res!438799) (not e!384109))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-datatypes ((array!39207 0))(
  ( (array!39208 (arr!18793 (Array (_ BitVec 32) (_ BitVec 64))) (size!19157 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39207)

(assert (=> b!672252 (= res!438799 (not (= (select (arr!18793 a!3626) from!3004) k0!2843)))))

(declare-datatypes ((Unit!23583 0))(
  ( (Unit!23584) )
))
(declare-fun lt!312349 () Unit!23583)

(declare-fun e!384114 () Unit!23583)

(assert (=> b!672252 (= lt!312349 e!384114)))

(declare-fun c!77096 () Bool)

(assert (=> b!672252 (= c!77096 (= (select (arr!18793 a!3626) from!3004) k0!2843))))

(declare-fun b!672254 () Bool)

(declare-fun res!438812 () Bool)

(assert (=> b!672254 (=> (not res!438812) (not e!384113))))

(declare-datatypes ((List!12741 0))(
  ( (Nil!12738) (Cons!12737 (h!13785 (_ BitVec 64)) (t!18961 List!12741)) )
))
(declare-fun arrayNoDuplicates!0 (array!39207 (_ BitVec 32) List!12741) Bool)

(assert (=> b!672254 (= res!438812 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12738))))

(declare-fun b!672255 () Bool)

(declare-fun res!438814 () Bool)

(assert (=> b!672255 (=> (not res!438814) (not e!384113))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!672255 (= res!438814 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19157 a!3626))))))

(declare-fun b!672256 () Bool)

(declare-fun res!438798 () Bool)

(assert (=> b!672256 (=> (not res!438798) (not e!384113))))

(declare-fun arrayContainsKey!0 (array!39207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!672256 (= res!438798 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!672257 () Bool)

(declare-fun e!384115 () Bool)

(assert (=> b!672257 (= e!384115 false)))

(declare-fun lt!312351 () Bool)

(declare-fun lt!312352 () List!12741)

(assert (=> b!672257 (= lt!312351 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312352))))

(declare-fun b!672258 () Bool)

(declare-fun e!384110 () Bool)

(declare-fun contains!3393 (List!12741 (_ BitVec 64)) Bool)

(assert (=> b!672258 (= e!384110 (not (contains!3393 lt!312352 k0!2843)))))

(declare-fun b!672259 () Bool)

(declare-fun res!438820 () Bool)

(assert (=> b!672259 (=> (not res!438820) (not e!384115))))

(assert (=> b!672259 (= res!438820 (not (contains!3393 lt!312352 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672260 () Bool)

(declare-fun e!384111 () Bool)

(declare-fun e!384117 () Bool)

(assert (=> b!672260 (= e!384111 e!384117)))

(declare-fun res!438806 () Bool)

(assert (=> b!672260 (=> (not res!438806) (not e!384117))))

(assert (=> b!672260 (= res!438806 (bvsle from!3004 i!1382))))

(declare-fun b!672261 () Bool)

(assert (=> b!672261 (= e!384109 e!384115)))

(declare-fun res!438808 () Bool)

(assert (=> b!672261 (=> (not res!438808) (not e!384115))))

(assert (=> b!672261 (= res!438808 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun acc!681 () List!12741)

(declare-fun $colon$colon!263 (List!12741 (_ BitVec 64)) List!12741)

(assert (=> b!672261 (= lt!312352 ($colon$colon!263 acc!681 (select (arr!18793 a!3626) from!3004)))))

(declare-fun b!672262 () Bool)

(declare-fun res!438804 () Bool)

(assert (=> b!672262 (=> (not res!438804) (not e!384115))))

(declare-fun e!384108 () Bool)

(assert (=> b!672262 (= res!438804 e!384108)))

(declare-fun res!438811 () Bool)

(assert (=> b!672262 (=> res!438811 e!384108)))

(declare-fun e!384107 () Bool)

(assert (=> b!672262 (= res!438811 e!384107)))

(declare-fun res!438800 () Bool)

(assert (=> b!672262 (=> (not res!438800) (not e!384107))))

(assert (=> b!672262 (= res!438800 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672263 () Bool)

(assert (=> b!672263 (= e!384107 (contains!3393 lt!312352 k0!2843))))

(declare-fun b!672264 () Bool)

(declare-fun res!438818 () Bool)

(assert (=> b!672264 (=> (not res!438818) (not e!384113))))

(assert (=> b!672264 (= res!438818 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!672265 () Bool)

(declare-fun Unit!23585 () Unit!23583)

(assert (=> b!672265 (= e!384114 Unit!23585)))

(declare-fun b!672266 () Bool)

(declare-fun Unit!23586 () Unit!23583)

(assert (=> b!672266 (= e!384114 Unit!23586)))

(assert (=> b!672266 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312350 () Unit!23583)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39207 (_ BitVec 64) (_ BitVec 32)) Unit!23583)

(assert (=> b!672266 (= lt!312350 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!672266 false))

(declare-fun b!672253 () Bool)

(assert (=> b!672253 (= e!384117 (not (contains!3393 acc!681 k0!2843)))))

(declare-fun res!438810 () Bool)

(assert (=> start!60222 (=> (not res!438810) (not e!384113))))

(assert (=> start!60222 (= res!438810 (and (bvslt (size!19157 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19157 a!3626))))))

(assert (=> start!60222 e!384113))

(assert (=> start!60222 true))

(declare-fun array_inv!14652 (array!39207) Bool)

(assert (=> start!60222 (array_inv!14652 a!3626)))

(declare-fun b!672267 () Bool)

(declare-fun res!438815 () Bool)

(assert (=> b!672267 (=> (not res!438815) (not e!384113))))

(assert (=> b!672267 (= res!438815 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19157 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!672268 () Bool)

(declare-fun res!438797 () Bool)

(assert (=> b!672268 (=> (not res!438797) (not e!384115))))

(assert (=> b!672268 (= res!438797 (not (contains!3393 lt!312352 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672269 () Bool)

(declare-fun res!438801 () Bool)

(assert (=> b!672269 (=> (not res!438801) (not e!384113))))

(declare-fun noDuplicate!667 (List!12741) Bool)

(assert (=> b!672269 (= res!438801 (noDuplicate!667 acc!681))))

(declare-fun b!672270 () Bool)

(declare-fun res!438813 () Bool)

(assert (=> b!672270 (=> (not res!438813) (not e!384113))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!672270 (= res!438813 (validKeyInArray!0 k0!2843))))

(declare-fun b!672271 () Bool)

(declare-fun res!438819 () Bool)

(assert (=> b!672271 (=> (not res!438819) (not e!384115))))

(assert (=> b!672271 (= res!438819 (noDuplicate!667 lt!312352))))

(declare-fun b!672272 () Bool)

(declare-fun e!384116 () Bool)

(assert (=> b!672272 (= e!384116 (contains!3393 acc!681 k0!2843))))

(declare-fun b!672273 () Bool)

(declare-fun res!438803 () Bool)

(assert (=> b!672273 (=> (not res!438803) (not e!384113))))

(assert (=> b!672273 (= res!438803 e!384111)))

(declare-fun res!438816 () Bool)

(assert (=> b!672273 (=> res!438816 e!384111)))

(assert (=> b!672273 (= res!438816 e!384116)))

(declare-fun res!438805 () Bool)

(assert (=> b!672273 (=> (not res!438805) (not e!384116))))

(assert (=> b!672273 (= res!438805 (bvsgt from!3004 i!1382))))

(declare-fun b!672274 () Bool)

(assert (=> b!672274 (= e!384108 e!384110)))

(declare-fun res!438817 () Bool)

(assert (=> b!672274 (=> (not res!438817) (not e!384110))))

(assert (=> b!672274 (= res!438817 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672275 () Bool)

(declare-fun res!438807 () Bool)

(assert (=> b!672275 (=> (not res!438807) (not e!384113))))

(assert (=> b!672275 (= res!438807 (not (contains!3393 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672276 () Bool)

(declare-fun res!438802 () Bool)

(assert (=> b!672276 (=> (not res!438802) (not e!384113))))

(assert (=> b!672276 (= res!438802 (validKeyInArray!0 (select (arr!18793 a!3626) from!3004)))))

(declare-fun b!672277 () Bool)

(declare-fun res!438809 () Bool)

(assert (=> b!672277 (=> (not res!438809) (not e!384113))))

(assert (=> b!672277 (= res!438809 (not (contains!3393 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60222 res!438810) b!672269))

(assert (= (and b!672269 res!438801) b!672275))

(assert (= (and b!672275 res!438807) b!672277))

(assert (= (and b!672277 res!438809) b!672273))

(assert (= (and b!672273 res!438805) b!672272))

(assert (= (and b!672273 (not res!438816)) b!672260))

(assert (= (and b!672260 res!438806) b!672253))

(assert (= (and b!672273 res!438803) b!672254))

(assert (= (and b!672254 res!438812) b!672264))

(assert (= (and b!672264 res!438818) b!672255))

(assert (= (and b!672255 res!438814) b!672270))

(assert (= (and b!672270 res!438813) b!672256))

(assert (= (and b!672256 res!438798) b!672267))

(assert (= (and b!672267 res!438815) b!672276))

(assert (= (and b!672276 res!438802) b!672252))

(assert (= (and b!672252 c!77096) b!672266))

(assert (= (and b!672252 (not c!77096)) b!672265))

(assert (= (and b!672252 res!438799) b!672261))

(assert (= (and b!672261 res!438808) b!672271))

(assert (= (and b!672271 res!438819) b!672268))

(assert (= (and b!672268 res!438797) b!672259))

(assert (= (and b!672259 res!438820) b!672262))

(assert (= (and b!672262 res!438800) b!672263))

(assert (= (and b!672262 (not res!438811)) b!672274))

(assert (= (and b!672274 res!438817) b!672258))

(assert (= (and b!672262 res!438804) b!672257))

(declare-fun m!641899 () Bool)

(assert (=> b!672256 m!641899))

(declare-fun m!641901 () Bool)

(assert (=> b!672258 m!641901))

(declare-fun m!641903 () Bool)

(assert (=> b!672266 m!641903))

(declare-fun m!641905 () Bool)

(assert (=> b!672266 m!641905))

(declare-fun m!641907 () Bool)

(assert (=> b!672268 m!641907))

(declare-fun m!641909 () Bool)

(assert (=> start!60222 m!641909))

(declare-fun m!641911 () Bool)

(assert (=> b!672252 m!641911))

(declare-fun m!641913 () Bool)

(assert (=> b!672253 m!641913))

(declare-fun m!641915 () Bool)

(assert (=> b!672270 m!641915))

(declare-fun m!641917 () Bool)

(assert (=> b!672254 m!641917))

(declare-fun m!641919 () Bool)

(assert (=> b!672275 m!641919))

(declare-fun m!641921 () Bool)

(assert (=> b!672259 m!641921))

(declare-fun m!641923 () Bool)

(assert (=> b!672271 m!641923))

(assert (=> b!672276 m!641911))

(assert (=> b!672276 m!641911))

(declare-fun m!641925 () Bool)

(assert (=> b!672276 m!641925))

(declare-fun m!641927 () Bool)

(assert (=> b!672277 m!641927))

(assert (=> b!672272 m!641913))

(declare-fun m!641929 () Bool)

(assert (=> b!672269 m!641929))

(assert (=> b!672261 m!641911))

(assert (=> b!672261 m!641911))

(declare-fun m!641931 () Bool)

(assert (=> b!672261 m!641931))

(assert (=> b!672263 m!641901))

(declare-fun m!641933 () Bool)

(assert (=> b!672264 m!641933))

(declare-fun m!641935 () Bool)

(assert (=> b!672257 m!641935))

(check-sat (not b!672256) (not b!672261) (not b!672271) (not b!672253) (not start!60222) (not b!672258) (not b!672270) (not b!672276) (not b!672263) (not b!672254) (not b!672272) (not b!672268) (not b!672277) (not b!672259) (not b!672269) (not b!672264) (not b!672266) (not b!672275) (not b!672257))
(check-sat)
