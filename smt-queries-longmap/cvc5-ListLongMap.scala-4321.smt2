; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60016 () Bool)

(assert start!60016)

(declare-fun res!432733 () Bool)

(declare-fun e!381361 () Bool)

(assert (=> start!60016 (=> (not res!432733) (not e!381361))))

(declare-datatypes ((array!39001 0))(
  ( (array!39002 (arr!18690 (Array (_ BitVec 32) (_ BitVec 64))) (size!19054 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39001)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60016 (= res!432733 (and (bvslt (size!19054 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19054 a!3626))))))

(assert (=> start!60016 e!381361))

(assert (=> start!60016 true))

(declare-fun array_inv!14549 (array!39001) Bool)

(assert (=> start!60016 (array_inv!14549 a!3626)))

(declare-fun b!665227 () Bool)

(declare-fun e!381363 () Bool)

(declare-datatypes ((List!12638 0))(
  ( (Nil!12635) (Cons!12634 (h!13682 (_ BitVec 64)) (t!18858 List!12638)) )
))
(declare-fun acc!681 () List!12638)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3290 (List!12638 (_ BitVec 64)) Bool)

(assert (=> b!665227 (= e!381363 (contains!3290 acc!681 k!2843))))

(declare-fun b!665228 () Bool)

(declare-fun res!432730 () Bool)

(assert (=> b!665228 (=> (not res!432730) (not e!381361))))

(assert (=> b!665228 (= res!432730 (not (contains!3290 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665229 () Bool)

(declare-fun res!432732 () Bool)

(assert (=> b!665229 (=> (not res!432732) (not e!381361))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!665229 (= res!432732 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19054 a!3626))))))

(declare-fun b!665230 () Bool)

(declare-fun e!381359 () Bool)

(assert (=> b!665230 (= e!381359 (not (contains!3290 acc!681 k!2843)))))

(declare-fun b!665231 () Bool)

(declare-fun res!432723 () Bool)

(declare-fun e!381362 () Bool)

(assert (=> b!665231 (=> res!432723 e!381362)))

(declare-fun lt!309955 () List!12638)

(assert (=> b!665231 (= res!432723 (contains!3290 lt!309955 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665232 () Bool)

(declare-fun res!432731 () Bool)

(assert (=> b!665232 (=> res!432731 e!381362)))

(assert (=> b!665232 (= res!432731 (not (contains!3290 lt!309955 k!2843)))))

(declare-fun b!665233 () Bool)

(declare-datatypes ((Unit!23179 0))(
  ( (Unit!23180) )
))
(declare-fun e!381365 () Unit!23179)

(declare-fun Unit!23181 () Unit!23179)

(assert (=> b!665233 (= e!381365 Unit!23181)))

(declare-fun lt!309954 () Unit!23179)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39001 (_ BitVec 64) (_ BitVec 32)) Unit!23179)

(assert (=> b!665233 (= lt!309954 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!665233 false))

(declare-fun b!665234 () Bool)

(declare-fun res!432722 () Bool)

(assert (=> b!665234 (=> (not res!432722) (not e!381361))))

(declare-fun noDuplicate!564 (List!12638) Bool)

(assert (=> b!665234 (= res!432722 (noDuplicate!564 acc!681))))

(declare-fun b!665235 () Bool)

(declare-fun res!432720 () Bool)

(assert (=> b!665235 (=> (not res!432720) (not e!381361))))

(declare-fun e!381366 () Bool)

(assert (=> b!665235 (= res!432720 e!381366)))

(declare-fun res!432724 () Bool)

(assert (=> b!665235 (=> res!432724 e!381366)))

(assert (=> b!665235 (= res!432724 e!381363)))

(declare-fun res!432717 () Bool)

(assert (=> b!665235 (=> (not res!432717) (not e!381363))))

(assert (=> b!665235 (= res!432717 (bvsgt from!3004 i!1382))))

(declare-fun b!665236 () Bool)

(declare-fun res!432727 () Bool)

(assert (=> b!665236 (=> (not res!432727) (not e!381361))))

(declare-fun arrayNoDuplicates!0 (array!39001 (_ BitVec 32) List!12638) Bool)

(assert (=> b!665236 (= res!432727 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12635))))

(declare-fun b!665237 () Bool)

(assert (=> b!665237 (= e!381362 true)))

(declare-fun lt!309952 () Bool)

(assert (=> b!665237 (= lt!309952 (contains!3290 lt!309955 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665238 () Bool)

(declare-fun res!432726 () Bool)

(assert (=> b!665238 (=> (not res!432726) (not e!381361))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!665238 (= res!432726 (validKeyInArray!0 k!2843))))

(declare-fun b!665239 () Bool)

(declare-fun Unit!23182 () Unit!23179)

(assert (=> b!665239 (= e!381365 Unit!23182)))

(declare-fun b!665240 () Bool)

(declare-fun res!432734 () Bool)

(assert (=> b!665240 (=> res!432734 e!381362)))

(declare-fun lt!309947 () Bool)

(assert (=> b!665240 (= res!432734 lt!309947)))

(declare-fun b!665241 () Bool)

(declare-fun res!432735 () Bool)

(assert (=> b!665241 (=> (not res!432735) (not e!381361))))

(assert (=> b!665241 (= res!432735 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19054 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!665242 () Bool)

(declare-fun res!432736 () Bool)

(assert (=> b!665242 (=> (not res!432736) (not e!381361))))

(declare-fun arrayContainsKey!0 (array!39001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!665242 (= res!432736 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!665243 () Bool)

(declare-fun e!381360 () Unit!23179)

(declare-fun lt!309953 () Unit!23179)

(assert (=> b!665243 (= e!381360 lt!309953)))

(declare-fun lt!309948 () Unit!23179)

(declare-fun lemmaListSubSeqRefl!0 (List!12638) Unit!23179)

(assert (=> b!665243 (= lt!309948 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!52 (List!12638 List!12638) Bool)

(assert (=> b!665243 (subseq!52 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39001 List!12638 List!12638 (_ BitVec 32)) Unit!23179)

(declare-fun $colon$colon!181 (List!12638 (_ BitVec 64)) List!12638)

(assert (=> b!665243 (= lt!309953 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!181 acc!681 (select (arr!18690 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665243 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!665244 () Bool)

(declare-fun res!432721 () Bool)

(assert (=> b!665244 (=> res!432721 e!381362)))

(assert (=> b!665244 (= res!432721 (contains!3290 acc!681 k!2843))))

(declare-fun b!665245 () Bool)

(declare-fun res!432725 () Bool)

(assert (=> b!665245 (=> (not res!432725) (not e!381361))))

(assert (=> b!665245 (= res!432725 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!665246 () Bool)

(declare-fun res!432716 () Bool)

(assert (=> b!665246 (=> res!432716 e!381362)))

(assert (=> b!665246 (= res!432716 (not (noDuplicate!564 lt!309955)))))

(declare-fun b!665247 () Bool)

(declare-fun Unit!23183 () Unit!23179)

(assert (=> b!665247 (= e!381360 Unit!23183)))

(declare-fun b!665248 () Bool)

(assert (=> b!665248 (= e!381366 e!381359)))

(declare-fun res!432718 () Bool)

(assert (=> b!665248 (=> (not res!432718) (not e!381359))))

(assert (=> b!665248 (= res!432718 (bvsle from!3004 i!1382))))

(declare-fun b!665249 () Bool)

(assert (=> b!665249 (= e!381361 (not e!381362))))

(declare-fun res!432719 () Bool)

(assert (=> b!665249 (=> res!432719 e!381362)))

(assert (=> b!665249 (= res!432719 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!49 (List!12638 (_ BitVec 64)) List!12638)

(assert (=> b!665249 (= (-!49 lt!309955 k!2843) acc!681)))

(assert (=> b!665249 (= lt!309955 ($colon$colon!181 acc!681 k!2843))))

(declare-fun lt!309950 () Unit!23179)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12638) Unit!23179)

(assert (=> b!665249 (= lt!309950 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!665249 (subseq!52 acc!681 acc!681)))

(declare-fun lt!309946 () Unit!23179)

(assert (=> b!665249 (= lt!309946 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665249 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309951 () Unit!23179)

(assert (=> b!665249 (= lt!309951 e!381360)))

(declare-fun c!76625 () Bool)

(assert (=> b!665249 (= c!76625 (validKeyInArray!0 (select (arr!18690 a!3626) from!3004)))))

(declare-fun lt!309949 () Unit!23179)

(assert (=> b!665249 (= lt!309949 e!381365)))

(declare-fun c!76624 () Bool)

(assert (=> b!665249 (= c!76624 lt!309947)))

(assert (=> b!665249 (= lt!309947 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665249 (arrayContainsKey!0 (array!39002 (store (arr!18690 a!3626) i!1382 k!2843) (size!19054 a!3626)) k!2843 from!3004)))

(declare-fun b!665250 () Bool)

(declare-fun res!432729 () Bool)

(assert (=> b!665250 (=> (not res!432729) (not e!381361))))

(assert (=> b!665250 (= res!432729 (not (contains!3290 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665251 () Bool)

(declare-fun res!432728 () Bool)

(assert (=> b!665251 (=> res!432728 e!381362)))

(assert (=> b!665251 (= res!432728 (not (subseq!52 acc!681 lt!309955)))))

(assert (= (and start!60016 res!432733) b!665234))

(assert (= (and b!665234 res!432722) b!665250))

(assert (= (and b!665250 res!432729) b!665228))

(assert (= (and b!665228 res!432730) b!665235))

(assert (= (and b!665235 res!432717) b!665227))

(assert (= (and b!665235 (not res!432724)) b!665248))

(assert (= (and b!665248 res!432718) b!665230))

(assert (= (and b!665235 res!432720) b!665236))

(assert (= (and b!665236 res!432727) b!665245))

(assert (= (and b!665245 res!432725) b!665229))

(assert (= (and b!665229 res!432732) b!665238))

(assert (= (and b!665238 res!432726) b!665242))

(assert (= (and b!665242 res!432736) b!665241))

(assert (= (and b!665241 res!432735) b!665249))

(assert (= (and b!665249 c!76624) b!665233))

(assert (= (and b!665249 (not c!76624)) b!665239))

(assert (= (and b!665249 c!76625) b!665243))

(assert (= (and b!665249 (not c!76625)) b!665247))

(assert (= (and b!665249 (not res!432719)) b!665246))

(assert (= (and b!665246 (not res!432716)) b!665240))

(assert (= (and b!665240 (not res!432734)) b!665244))

(assert (= (and b!665244 (not res!432721)) b!665251))

(assert (= (and b!665251 (not res!432728)) b!665232))

(assert (= (and b!665232 (not res!432731)) b!665231))

(assert (= (and b!665231 (not res!432723)) b!665237))

(declare-fun m!636863 () Bool)

(assert (=> b!665230 m!636863))

(declare-fun m!636865 () Bool)

(assert (=> b!665249 m!636865))

(declare-fun m!636867 () Bool)

(assert (=> b!665249 m!636867))

(declare-fun m!636869 () Bool)

(assert (=> b!665249 m!636869))

(declare-fun m!636871 () Bool)

(assert (=> b!665249 m!636871))

(declare-fun m!636873 () Bool)

(assert (=> b!665249 m!636873))

(declare-fun m!636875 () Bool)

(assert (=> b!665249 m!636875))

(declare-fun m!636877 () Bool)

(assert (=> b!665249 m!636877))

(declare-fun m!636879 () Bool)

(assert (=> b!665249 m!636879))

(assert (=> b!665249 m!636869))

(declare-fun m!636881 () Bool)

(assert (=> b!665249 m!636881))

(declare-fun m!636883 () Bool)

(assert (=> b!665249 m!636883))

(declare-fun m!636885 () Bool)

(assert (=> b!665249 m!636885))

(declare-fun m!636887 () Bool)

(assert (=> b!665245 m!636887))

(declare-fun m!636889 () Bool)

(assert (=> b!665234 m!636889))

(declare-fun m!636891 () Bool)

(assert (=> b!665232 m!636891))

(assert (=> b!665243 m!636867))

(assert (=> b!665243 m!636869))

(declare-fun m!636893 () Bool)

(assert (=> b!665243 m!636893))

(declare-fun m!636895 () Bool)

(assert (=> b!665243 m!636895))

(assert (=> b!665243 m!636869))

(assert (=> b!665243 m!636893))

(assert (=> b!665243 m!636875))

(assert (=> b!665243 m!636885))

(declare-fun m!636897 () Bool)

(assert (=> b!665233 m!636897))

(declare-fun m!636899 () Bool)

(assert (=> b!665246 m!636899))

(declare-fun m!636901 () Bool)

(assert (=> b!665237 m!636901))

(declare-fun m!636903 () Bool)

(assert (=> b!665242 m!636903))

(assert (=> b!665227 m!636863))

(declare-fun m!636905 () Bool)

(assert (=> b!665228 m!636905))

(declare-fun m!636907 () Bool)

(assert (=> b!665238 m!636907))

(declare-fun m!636909 () Bool)

(assert (=> b!665231 m!636909))

(declare-fun m!636911 () Bool)

(assert (=> b!665251 m!636911))

(declare-fun m!636913 () Bool)

(assert (=> start!60016 m!636913))

(declare-fun m!636915 () Bool)

(assert (=> b!665250 m!636915))

(declare-fun m!636917 () Bool)

(assert (=> b!665236 m!636917))

(assert (=> b!665244 m!636863))

(push 1)

(assert (not b!665250))

(assert (not b!665227))

(assert (not b!665230))

(assert (not b!665242))

(assert (not b!665245))

(assert (not b!665232))

(assert (not b!665243))

(assert (not b!665231))

(assert (not b!665251))

(assert (not start!60016))

(assert (not b!665233))

(assert (not b!665234))

(assert (not b!665238))

(assert (not b!665249))

(assert (not b!665228))

(assert (not b!665237))

(assert (not b!665246))

(assert (not b!665236))

(assert (not b!665244))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

