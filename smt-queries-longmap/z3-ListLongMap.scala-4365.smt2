; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60220 () Bool)

(assert start!60220)

(declare-fun b!674217 () Bool)

(declare-fun e!384892 () Bool)

(declare-fun e!384899 () Bool)

(assert (=> b!674217 (= e!384892 e!384899)))

(declare-fun res!440709 () Bool)

(assert (=> b!674217 (=> (not res!440709) (not e!384899))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!674217 (= res!440709 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674218 () Bool)

(declare-fun res!440716 () Bool)

(declare-fun e!384898 () Bool)

(assert (=> b!674218 (=> (not res!440716) (not e!384898))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!674218 (= res!440716 (validKeyInArray!0 k0!2843))))

(declare-fun b!674219 () Bool)

(declare-fun res!440723 () Bool)

(assert (=> b!674219 (=> (not res!440723) (not e!384898))))

(declare-datatypes ((List!12867 0))(
  ( (Nil!12864) (Cons!12863 (h!13908 (_ BitVec 64)) (t!19095 List!12867)) )
))
(declare-fun acc!681 () List!12867)

(declare-fun contains!3444 (List!12867 (_ BitVec 64)) Bool)

(assert (=> b!674219 (= res!440723 (not (contains!3444 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674220 () Bool)

(declare-fun e!384890 () Bool)

(assert (=> b!674220 (= e!384890 (contains!3444 acc!681 k0!2843))))

(declare-fun b!674221 () Bool)

(declare-datatypes ((Unit!23716 0))(
  ( (Unit!23717) )
))
(declare-fun e!384896 () Unit!23716)

(declare-fun Unit!23718 () Unit!23716)

(assert (=> b!674221 (= e!384896 Unit!23718)))

(declare-datatypes ((array!39267 0))(
  ( (array!39268 (arr!18826 (Array (_ BitVec 32) (_ BitVec 64))) (size!19190 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39267)

(declare-fun arrayContainsKey!0 (array!39267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!674221 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312583 () Unit!23716)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39267 (_ BitVec 64) (_ BitVec 32)) Unit!23716)

(assert (=> b!674221 (= lt!312583 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!674221 false))

(declare-fun b!674222 () Bool)

(declare-fun res!440724 () Bool)

(assert (=> b!674222 (=> (not res!440724) (not e!384898))))

(declare-fun arrayNoDuplicates!0 (array!39267 (_ BitVec 32) List!12867) Bool)

(assert (=> b!674222 (= res!440724 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12864))))

(declare-fun b!674223 () Bool)

(declare-fun res!440719 () Bool)

(assert (=> b!674223 (=> (not res!440719) (not e!384898))))

(assert (=> b!674223 (= res!440719 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19190 a!3626))))))

(declare-fun b!674224 () Bool)

(declare-fun lt!312586 () List!12867)

(assert (=> b!674224 (= e!384899 (not (contains!3444 lt!312586 k0!2843)))))

(declare-fun b!674225 () Bool)

(declare-fun res!440725 () Bool)

(assert (=> b!674225 (=> (not res!440725) (not e!384898))))

(assert (=> b!674225 (= res!440725 (not (contains!3444 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674226 () Bool)

(declare-fun res!440710 () Bool)

(declare-fun e!384900 () Bool)

(assert (=> b!674226 (=> (not res!440710) (not e!384900))))

(assert (=> b!674226 (= res!440710 e!384892)))

(declare-fun res!440720 () Bool)

(assert (=> b!674226 (=> res!440720 e!384892)))

(declare-fun e!384891 () Bool)

(assert (=> b!674226 (= res!440720 e!384891)))

(declare-fun res!440728 () Bool)

(assert (=> b!674226 (=> (not res!440728) (not e!384891))))

(assert (=> b!674226 (= res!440728 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674227 () Bool)

(declare-fun res!440715 () Bool)

(assert (=> b!674227 (=> (not res!440715) (not e!384900))))

(assert (=> b!674227 (= res!440715 (not (contains!3444 lt!312586 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674228 () Bool)

(assert (=> b!674228 (= e!384900 (not (bvsle from!3004 (size!19190 a!3626))))))

(assert (=> b!674228 (arrayNoDuplicates!0 (array!39268 (store (arr!18826 a!3626) i!1382 k0!2843) (size!19190 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!312586)))

(declare-fun lt!312585 () Unit!23716)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39267 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12867) Unit!23716)

(assert (=> b!674228 (= lt!312585 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!312586))))

(declare-fun b!674229 () Bool)

(declare-fun Unit!23719 () Unit!23716)

(assert (=> b!674229 (= e!384896 Unit!23719)))

(declare-fun b!674230 () Bool)

(declare-fun res!440706 () Bool)

(assert (=> b!674230 (=> (not res!440706) (not e!384898))))

(assert (=> b!674230 (= res!440706 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!674231 () Bool)

(declare-fun res!440726 () Bool)

(assert (=> b!674231 (=> (not res!440726) (not e!384898))))

(assert (=> b!674231 (= res!440726 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!674232 () Bool)

(declare-fun res!440717 () Bool)

(assert (=> b!674232 (=> (not res!440717) (not e!384898))))

(assert (=> b!674232 (= res!440717 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19190 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun res!440712 () Bool)

(assert (=> start!60220 (=> (not res!440712) (not e!384898))))

(assert (=> start!60220 (= res!440712 (and (bvslt (size!19190 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19190 a!3626))))))

(assert (=> start!60220 e!384898))

(assert (=> start!60220 true))

(declare-fun array_inv!14622 (array!39267) Bool)

(assert (=> start!60220 (array_inv!14622 a!3626)))

(declare-fun b!674233 () Bool)

(declare-fun res!440705 () Bool)

(assert (=> b!674233 (=> (not res!440705) (not e!384898))))

(declare-fun e!384894 () Bool)

(assert (=> b!674233 (= res!440705 e!384894)))

(declare-fun res!440707 () Bool)

(assert (=> b!674233 (=> res!440707 e!384894)))

(assert (=> b!674233 (= res!440707 e!384890)))

(declare-fun res!440718 () Bool)

(assert (=> b!674233 (=> (not res!440718) (not e!384890))))

(assert (=> b!674233 (= res!440718 (bvsgt from!3004 i!1382))))

(declare-fun b!674234 () Bool)

(declare-fun e!384893 () Bool)

(assert (=> b!674234 (= e!384893 e!384900)))

(declare-fun res!440722 () Bool)

(assert (=> b!674234 (=> (not res!440722) (not e!384900))))

(assert (=> b!674234 (= res!440722 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!294 (List!12867 (_ BitVec 64)) List!12867)

(assert (=> b!674234 (= lt!312586 ($colon$colon!294 acc!681 (select (arr!18826 a!3626) from!3004)))))

(declare-fun b!674235 () Bool)

(declare-fun res!440711 () Bool)

(assert (=> b!674235 (=> (not res!440711) (not e!384898))))

(assert (=> b!674235 (= res!440711 (validKeyInArray!0 (select (arr!18826 a!3626) from!3004)))))

(declare-fun b!674236 () Bool)

(declare-fun res!440729 () Bool)

(assert (=> b!674236 (=> (not res!440729) (not e!384900))))

(assert (=> b!674236 (= res!440729 (not (contains!3444 lt!312586 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674237 () Bool)

(declare-fun e!384895 () Bool)

(assert (=> b!674237 (= e!384895 (not (contains!3444 acc!681 k0!2843)))))

(declare-fun b!674238 () Bool)

(declare-fun res!440713 () Bool)

(assert (=> b!674238 (=> (not res!440713) (not e!384900))))

(declare-fun noDuplicate!691 (List!12867) Bool)

(assert (=> b!674238 (= res!440713 (noDuplicate!691 lt!312586))))

(declare-fun b!674239 () Bool)

(declare-fun res!440721 () Bool)

(assert (=> b!674239 (=> (not res!440721) (not e!384898))))

(assert (=> b!674239 (= res!440721 (noDuplicate!691 acc!681))))

(declare-fun b!674240 () Bool)

(assert (=> b!674240 (= e!384894 e!384895)))

(declare-fun res!440714 () Bool)

(assert (=> b!674240 (=> (not res!440714) (not e!384895))))

(assert (=> b!674240 (= res!440714 (bvsle from!3004 i!1382))))

(declare-fun b!674241 () Bool)

(declare-fun res!440727 () Bool)

(assert (=> b!674241 (=> (not res!440727) (not e!384900))))

(assert (=> b!674241 (= res!440727 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312586))))

(declare-fun b!674242 () Bool)

(assert (=> b!674242 (= e!384891 (contains!3444 lt!312586 k0!2843))))

(declare-fun b!674243 () Bool)

(assert (=> b!674243 (= e!384898 e!384893)))

(declare-fun res!440708 () Bool)

(assert (=> b!674243 (=> (not res!440708) (not e!384893))))

(assert (=> b!674243 (= res!440708 (not (= (select (arr!18826 a!3626) from!3004) k0!2843)))))

(declare-fun lt!312584 () Unit!23716)

(assert (=> b!674243 (= lt!312584 e!384896)))

(declare-fun c!77123 () Bool)

(assert (=> b!674243 (= c!77123 (= (select (arr!18826 a!3626) from!3004) k0!2843))))

(assert (= (and start!60220 res!440712) b!674239))

(assert (= (and b!674239 res!440721) b!674225))

(assert (= (and b!674225 res!440725) b!674219))

(assert (= (and b!674219 res!440723) b!674233))

(assert (= (and b!674233 res!440718) b!674220))

(assert (= (and b!674233 (not res!440707)) b!674240))

(assert (= (and b!674240 res!440714) b!674237))

(assert (= (and b!674233 res!440705) b!674222))

(assert (= (and b!674222 res!440724) b!674230))

(assert (= (and b!674230 res!440706) b!674223))

(assert (= (and b!674223 res!440719) b!674218))

(assert (= (and b!674218 res!440716) b!674231))

(assert (= (and b!674231 res!440726) b!674232))

(assert (= (and b!674232 res!440717) b!674235))

(assert (= (and b!674235 res!440711) b!674243))

(assert (= (and b!674243 c!77123) b!674221))

(assert (= (and b!674243 (not c!77123)) b!674229))

(assert (= (and b!674243 res!440708) b!674234))

(assert (= (and b!674234 res!440722) b!674238))

(assert (= (and b!674238 res!440713) b!674227))

(assert (= (and b!674227 res!440715) b!674236))

(assert (= (and b!674236 res!440729) b!674226))

(assert (= (and b!674226 res!440728) b!674242))

(assert (= (and b!674226 (not res!440720)) b!674217))

(assert (= (and b!674217 res!440709) b!674224))

(assert (= (and b!674226 res!440710) b!674241))

(assert (= (and b!674241 res!440727) b!674228))

(declare-fun m!642271 () Bool)

(assert (=> b!674242 m!642271))

(declare-fun m!642273 () Bool)

(assert (=> b!674234 m!642273))

(assert (=> b!674234 m!642273))

(declare-fun m!642275 () Bool)

(assert (=> b!674234 m!642275))

(declare-fun m!642277 () Bool)

(assert (=> b!674230 m!642277))

(assert (=> b!674243 m!642273))

(declare-fun m!642279 () Bool)

(assert (=> b!674222 m!642279))

(declare-fun m!642281 () Bool)

(assert (=> b!674237 m!642281))

(assert (=> b!674235 m!642273))

(assert (=> b!674235 m!642273))

(declare-fun m!642283 () Bool)

(assert (=> b!674235 m!642283))

(declare-fun m!642285 () Bool)

(assert (=> b!674228 m!642285))

(declare-fun m!642287 () Bool)

(assert (=> b!674228 m!642287))

(declare-fun m!642289 () Bool)

(assert (=> b!674228 m!642289))

(declare-fun m!642291 () Bool)

(assert (=> b!674239 m!642291))

(declare-fun m!642293 () Bool)

(assert (=> b!674218 m!642293))

(declare-fun m!642295 () Bool)

(assert (=> b!674236 m!642295))

(declare-fun m!642297 () Bool)

(assert (=> start!60220 m!642297))

(declare-fun m!642299 () Bool)

(assert (=> b!674231 m!642299))

(declare-fun m!642301 () Bool)

(assert (=> b!674219 m!642301))

(assert (=> b!674220 m!642281))

(declare-fun m!642303 () Bool)

(assert (=> b!674227 m!642303))

(declare-fun m!642305 () Bool)

(assert (=> b!674221 m!642305))

(declare-fun m!642307 () Bool)

(assert (=> b!674221 m!642307))

(declare-fun m!642309 () Bool)

(assert (=> b!674225 m!642309))

(declare-fun m!642311 () Bool)

(assert (=> b!674241 m!642311))

(assert (=> b!674224 m!642271))

(declare-fun m!642313 () Bool)

(assert (=> b!674238 m!642313))

(check-sat (not start!60220) (not b!674221) (not b!674236) (not b!674237) (not b!674227) (not b!674228) (not b!674231) (not b!674224) (not b!674218) (not b!674242) (not b!674239) (not b!674234) (not b!674225) (not b!674235) (not b!674230) (not b!674220) (not b!674238) (not b!674241) (not b!674219) (not b!674222))
(check-sat)
