; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60168 () Bool)

(assert start!60168)

(declare-fun b!672184 () Bool)

(declare-fun res!438837 () Bool)

(declare-fun e!384037 () Bool)

(assert (=> b!672184 (=> (not res!438837) (not e!384037))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39215 0))(
  ( (array!39216 (arr!18800 (Array (_ BitVec 32) (_ BitVec 64))) (size!19164 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39215)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!672184 (= res!438837 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19164 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!672185 () Bool)

(declare-fun res!438829 () Bool)

(declare-fun e!384034 () Bool)

(assert (=> b!672185 (=> (not res!438829) (not e!384034))))

(declare-datatypes ((List!12841 0))(
  ( (Nil!12838) (Cons!12837 (h!13882 (_ BitVec 64)) (t!19069 List!12841)) )
))
(declare-fun lt!312271 () List!12841)

(declare-fun contains!3418 (List!12841 (_ BitVec 64)) Bool)

(assert (=> b!672185 (= res!438829 (not (contains!3418 lt!312271 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672186 () Bool)

(declare-fun e!384038 () Bool)

(assert (=> b!672186 (= e!384037 e!384038)))

(declare-fun res!438842 () Bool)

(assert (=> b!672186 (=> (not res!438842) (not e!384038))))

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!672186 (= res!438842 (not (= (select (arr!18800 a!3626) from!3004) k!2843)))))

(declare-datatypes ((Unit!23612 0))(
  ( (Unit!23613) )
))
(declare-fun lt!312274 () Unit!23612)

(declare-fun e!384036 () Unit!23612)

(assert (=> b!672186 (= lt!312274 e!384036)))

(declare-fun c!77045 () Bool)

(assert (=> b!672186 (= c!77045 (= (select (arr!18800 a!3626) from!3004) k!2843))))

(declare-fun b!672187 () Bool)

(declare-fun Unit!23614 () Unit!23612)

(assert (=> b!672187 (= e!384036 Unit!23614)))

(declare-fun b!672188 () Bool)

(assert (=> b!672188 (= e!384038 e!384034)))

(declare-fun res!438836 () Bool)

(assert (=> b!672188 (=> (not res!438836) (not e!384034))))

(assert (=> b!672188 (= res!438836 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun acc!681 () List!12841)

(declare-fun $colon$colon!268 (List!12841 (_ BitVec 64)) List!12841)

(assert (=> b!672188 (= lt!312271 ($colon$colon!268 acc!681 (select (arr!18800 a!3626) from!3004)))))

(declare-fun b!672189 () Bool)

(declare-fun Unit!23615 () Unit!23612)

(assert (=> b!672189 (= e!384036 Unit!23615)))

(declare-fun arrayContainsKey!0 (array!39215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!672189 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312272 () Unit!23612)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39215 (_ BitVec 64) (_ BitVec 32)) Unit!23612)

(assert (=> b!672189 (= lt!312272 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!672189 false))

(declare-fun b!672190 () Bool)

(declare-fun res!438846 () Bool)

(assert (=> b!672190 (=> (not res!438846) (not e!384037))))

(declare-fun noDuplicate!665 (List!12841) Bool)

(assert (=> b!672190 (= res!438846 (noDuplicate!665 acc!681))))

(declare-fun b!672191 () Bool)

(declare-fun res!438843 () Bool)

(assert (=> b!672191 (=> (not res!438843) (not e!384037))))

(declare-fun e!384042 () Bool)

(assert (=> b!672191 (= res!438843 e!384042)))

(declare-fun res!438848 () Bool)

(assert (=> b!672191 (=> res!438848 e!384042)))

(declare-fun e!384041 () Bool)

(assert (=> b!672191 (= res!438848 e!384041)))

(declare-fun res!438841 () Bool)

(assert (=> b!672191 (=> (not res!438841) (not e!384041))))

(assert (=> b!672191 (= res!438841 (bvsgt from!3004 i!1382))))

(declare-fun b!672192 () Bool)

(declare-fun res!438828 () Bool)

(assert (=> b!672192 (=> (not res!438828) (not e!384037))))

(declare-fun arrayNoDuplicates!0 (array!39215 (_ BitVec 32) List!12841) Bool)

(assert (=> b!672192 (= res!438828 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12838))))

(declare-fun b!672193 () Bool)

(declare-fun res!438832 () Bool)

(assert (=> b!672193 (=> (not res!438832) (not e!384037))))

(assert (=> b!672193 (= res!438832 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!672194 () Bool)

(declare-fun res!438830 () Bool)

(assert (=> b!672194 (=> (not res!438830) (not e!384034))))

(declare-fun e!384035 () Bool)

(assert (=> b!672194 (= res!438830 e!384035)))

(declare-fun res!438844 () Bool)

(assert (=> b!672194 (=> res!438844 e!384035)))

(declare-fun e!384040 () Bool)

(assert (=> b!672194 (= res!438844 e!384040)))

(declare-fun res!438838 () Bool)

(assert (=> b!672194 (=> (not res!438838) (not e!384040))))

(assert (=> b!672194 (= res!438838 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun res!438850 () Bool)

(assert (=> start!60168 (=> (not res!438850) (not e!384037))))

(assert (=> start!60168 (= res!438850 (and (bvslt (size!19164 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19164 a!3626))))))

(assert (=> start!60168 e!384037))

(assert (=> start!60168 true))

(declare-fun array_inv!14596 (array!39215) Bool)

(assert (=> start!60168 (array_inv!14596 a!3626)))

(declare-fun b!672195 () Bool)

(declare-fun res!438851 () Bool)

(assert (=> b!672195 (=> (not res!438851) (not e!384037))))

(assert (=> b!672195 (= res!438851 (not (contains!3418 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672196 () Bool)

(declare-fun res!438840 () Bool)

(assert (=> b!672196 (=> (not res!438840) (not e!384037))))

(assert (=> b!672196 (= res!438840 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19164 a!3626))))))

(declare-fun b!672197 () Bool)

(declare-fun res!438831 () Bool)

(assert (=> b!672197 (=> (not res!438831) (not e!384034))))

(assert (=> b!672197 (= res!438831 (not (contains!3418 lt!312271 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672198 () Bool)

(declare-fun res!438835 () Bool)

(assert (=> b!672198 (=> (not res!438835) (not e!384034))))

(assert (=> b!672198 (= res!438835 (noDuplicate!665 lt!312271))))

(declare-fun b!672199 () Bool)

(declare-fun res!438833 () Bool)

(assert (=> b!672199 (=> (not res!438833) (not e!384037))))

(assert (=> b!672199 (= res!438833 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!672200 () Bool)

(declare-fun e!384039 () Bool)

(assert (=> b!672200 (= e!384042 e!384039)))

(declare-fun res!438845 () Bool)

(assert (=> b!672200 (=> (not res!438845) (not e!384039))))

(assert (=> b!672200 (= res!438845 (bvsle from!3004 i!1382))))

(declare-fun b!672201 () Bool)

(assert (=> b!672201 (= e!384041 (contains!3418 acc!681 k!2843))))

(declare-fun b!672202 () Bool)

(assert (=> b!672202 (= e!384039 (not (contains!3418 acc!681 k!2843)))))

(declare-fun b!672203 () Bool)

(declare-fun res!438839 () Bool)

(assert (=> b!672203 (=> (not res!438839) (not e!384037))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!672203 (= res!438839 (validKeyInArray!0 k!2843))))

(declare-fun b!672204 () Bool)

(declare-fun e!384033 () Bool)

(assert (=> b!672204 (= e!384035 e!384033)))

(declare-fun res!438834 () Bool)

(assert (=> b!672204 (=> (not res!438834) (not e!384033))))

(assert (=> b!672204 (= res!438834 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672205 () Bool)

(declare-fun res!438849 () Bool)

(assert (=> b!672205 (=> (not res!438849) (not e!384037))))

(assert (=> b!672205 (= res!438849 (validKeyInArray!0 (select (arr!18800 a!3626) from!3004)))))

(declare-fun b!672206 () Bool)

(assert (=> b!672206 (= e!384040 (contains!3418 lt!312271 k!2843))))

(declare-fun b!672207 () Bool)

(assert (=> b!672207 (= e!384034 false)))

(declare-fun lt!312273 () Bool)

(assert (=> b!672207 (= lt!312273 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312271))))

(declare-fun b!672208 () Bool)

(declare-fun res!438847 () Bool)

(assert (=> b!672208 (=> (not res!438847) (not e!384037))))

(assert (=> b!672208 (= res!438847 (not (contains!3418 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672209 () Bool)

(assert (=> b!672209 (= e!384033 (not (contains!3418 lt!312271 k!2843)))))

(assert (= (and start!60168 res!438850) b!672190))

(assert (= (and b!672190 res!438846) b!672195))

(assert (= (and b!672195 res!438851) b!672208))

(assert (= (and b!672208 res!438847) b!672191))

(assert (= (and b!672191 res!438841) b!672201))

(assert (= (and b!672191 (not res!438848)) b!672200))

(assert (= (and b!672200 res!438845) b!672202))

(assert (= (and b!672191 res!438843) b!672192))

(assert (= (and b!672192 res!438828) b!672193))

(assert (= (and b!672193 res!438832) b!672196))

(assert (= (and b!672196 res!438840) b!672203))

(assert (= (and b!672203 res!438839) b!672199))

(assert (= (and b!672199 res!438833) b!672184))

(assert (= (and b!672184 res!438837) b!672205))

(assert (= (and b!672205 res!438849) b!672186))

(assert (= (and b!672186 c!77045) b!672189))

(assert (= (and b!672186 (not c!77045)) b!672187))

(assert (= (and b!672186 res!438842) b!672188))

(assert (= (and b!672188 res!438836) b!672198))

(assert (= (and b!672198 res!438835) b!672185))

(assert (= (and b!672185 res!438829) b!672197))

(assert (= (and b!672197 res!438831) b!672194))

(assert (= (and b!672194 res!438838) b!672206))

(assert (= (and b!672194 (not res!438844)) b!672204))

(assert (= (and b!672204 res!438834) b!672209))

(assert (= (and b!672194 res!438830) b!672207))

(declare-fun m!641277 () Bool)

(assert (=> b!672202 m!641277))

(declare-fun m!641279 () Bool)

(assert (=> b!672198 m!641279))

(declare-fun m!641281 () Bool)

(assert (=> b!672192 m!641281))

(declare-fun m!641283 () Bool)

(assert (=> b!672197 m!641283))

(declare-fun m!641285 () Bool)

(assert (=> b!672185 m!641285))

(declare-fun m!641287 () Bool)

(assert (=> b!672195 m!641287))

(declare-fun m!641289 () Bool)

(assert (=> b!672189 m!641289))

(declare-fun m!641291 () Bool)

(assert (=> b!672189 m!641291))

(assert (=> b!672201 m!641277))

(declare-fun m!641293 () Bool)

(assert (=> b!672208 m!641293))

(declare-fun m!641295 () Bool)

(assert (=> start!60168 m!641295))

(declare-fun m!641297 () Bool)

(assert (=> b!672207 m!641297))

(declare-fun m!641299 () Bool)

(assert (=> b!672203 m!641299))

(declare-fun m!641301 () Bool)

(assert (=> b!672190 m!641301))

(declare-fun m!641303 () Bool)

(assert (=> b!672193 m!641303))

(declare-fun m!641305 () Bool)

(assert (=> b!672206 m!641305))

(declare-fun m!641307 () Bool)

(assert (=> b!672205 m!641307))

(assert (=> b!672205 m!641307))

(declare-fun m!641309 () Bool)

(assert (=> b!672205 m!641309))

(assert (=> b!672209 m!641305))

(assert (=> b!672188 m!641307))

(assert (=> b!672188 m!641307))

(declare-fun m!641311 () Bool)

(assert (=> b!672188 m!641311))

(declare-fun m!641313 () Bool)

(assert (=> b!672199 m!641313))

(assert (=> b!672186 m!641307))

(push 1)

