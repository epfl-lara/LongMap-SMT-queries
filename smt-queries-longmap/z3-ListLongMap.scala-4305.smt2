; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59860 () Bool)

(assert start!59860)

(declare-fun b!661844 () Bool)

(declare-fun e!380092 () Bool)

(declare-datatypes ((List!12687 0))(
  ( (Nil!12684) (Cons!12683 (h!13728 (_ BitVec 64)) (t!18915 List!12687)) )
))
(declare-fun acc!681 () List!12687)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3264 (List!12687 (_ BitVec 64)) Bool)

(assert (=> b!661844 (= e!380092 (contains!3264 acc!681 k0!2843))))

(declare-fun b!661845 () Bool)

(declare-fun res!429911 () Bool)

(declare-fun e!380094 () Bool)

(assert (=> b!661845 (=> res!429911 e!380094)))

(declare-fun lt!308851 () List!12687)

(declare-fun subseq!3 (List!12687 List!12687) Bool)

(assert (=> b!661845 (= res!429911 (not (subseq!3 acc!681 lt!308851)))))

(declare-fun b!661846 () Bool)

(declare-fun res!429908 () Bool)

(declare-fun e!380087 () Bool)

(assert (=> b!661846 (=> (not res!429908) (not e!380087))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661846 (= res!429908 (validKeyInArray!0 k0!2843))))

(declare-fun b!661847 () Bool)

(declare-fun res!429912 () Bool)

(assert (=> b!661847 (=> res!429912 e!380094)))

(assert (=> b!661847 (= res!429912 (contains!3264 lt!308851 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!661848 () Bool)

(declare-fun res!429913 () Bool)

(assert (=> b!661848 (=> (not res!429913) (not e!380087))))

(declare-fun noDuplicate!511 (List!12687) Bool)

(assert (=> b!661848 (= res!429913 (noDuplicate!511 acc!681))))

(declare-fun b!661849 () Bool)

(declare-fun e!380090 () Bool)

(assert (=> b!661849 (= e!380090 e!380094)))

(declare-fun res!429910 () Bool)

(assert (=> b!661849 (=> res!429910 e!380094)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!661849 (= res!429910 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!38907 0))(
  ( (array!38908 (arr!18646 (Array (_ BitVec 32) (_ BitVec 64))) (size!19010 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38907)

(declare-fun $colon$colon!135 (List!12687 (_ BitVec 64)) List!12687)

(assert (=> b!661849 (= lt!308851 ($colon$colon!135 acc!681 (select (arr!18646 a!3626) from!3004)))))

(assert (=> b!661849 (subseq!3 acc!681 acc!681)))

(declare-datatypes ((Unit!22978 0))(
  ( (Unit!22979) )
))
(declare-fun lt!308852 () Unit!22978)

(declare-fun lemmaListSubSeqRefl!0 (List!12687) Unit!22978)

(assert (=> b!661849 (= lt!308852 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!661850 () Bool)

(declare-fun e!380093 () Bool)

(assert (=> b!661850 (= e!380093 (not (contains!3264 acc!681 k0!2843)))))

(declare-fun b!661851 () Bool)

(declare-fun res!429907 () Bool)

(assert (=> b!661851 (=> (not res!429907) (not e!380087))))

(declare-fun e!380089 () Bool)

(assert (=> b!661851 (= res!429907 e!380089)))

(declare-fun res!429916 () Bool)

(assert (=> b!661851 (=> res!429916 e!380089)))

(assert (=> b!661851 (= res!429916 e!380092)))

(declare-fun res!429904 () Bool)

(assert (=> b!661851 (=> (not res!429904) (not e!380092))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!661851 (= res!429904 (bvsgt from!3004 i!1382))))

(declare-fun b!661853 () Bool)

(declare-fun res!429917 () Bool)

(assert (=> b!661853 (=> res!429917 e!380094)))

(assert (=> b!661853 (= res!429917 (not (noDuplicate!511 lt!308851)))))

(declare-fun b!661854 () Bool)

(declare-fun res!429902 () Bool)

(assert (=> b!661854 (=> (not res!429902) (not e!380087))))

(declare-fun arrayNoDuplicates!0 (array!38907 (_ BitVec 32) List!12687) Bool)

(assert (=> b!661854 (= res!429902 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12684))))

(declare-fun b!661855 () Bool)

(assert (=> b!661855 (= e!380094 true)))

(declare-fun lt!308849 () Bool)

(assert (=> b!661855 (= lt!308849 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!308851))))

(declare-fun lt!308854 () Unit!22978)

(declare-fun noDuplicateSubseq!3 (List!12687 List!12687) Unit!22978)

(assert (=> b!661855 (= lt!308854 (noDuplicateSubseq!3 acc!681 lt!308851))))

(declare-fun b!661856 () Bool)

(declare-fun res!429903 () Bool)

(assert (=> b!661856 (=> (not res!429903) (not e!380087))))

(assert (=> b!661856 (= res!429903 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19010 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661857 () Bool)

(declare-fun e!380088 () Unit!22978)

(declare-fun Unit!22980 () Unit!22978)

(assert (=> b!661857 (= e!380088 Unit!22980)))

(declare-fun b!661858 () Bool)

(declare-fun res!429898 () Bool)

(assert (=> b!661858 (=> (not res!429898) (not e!380087))))

(assert (=> b!661858 (= res!429898 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661859 () Bool)

(declare-fun res!429909 () Bool)

(assert (=> b!661859 (=> (not res!429909) (not e!380087))))

(assert (=> b!661859 (= res!429909 (not (contains!3264 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!429914 () Bool)

(assert (=> start!59860 (=> (not res!429914) (not e!380087))))

(assert (=> start!59860 (= res!429914 (and (bvslt (size!19010 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19010 a!3626))))))

(assert (=> start!59860 e!380087))

(assert (=> start!59860 true))

(declare-fun array_inv!14442 (array!38907) Bool)

(assert (=> start!59860 (array_inv!14442 a!3626)))

(declare-fun b!661852 () Bool)

(assert (=> b!661852 (= e!380087 (not e!380090))))

(declare-fun res!429900 () Bool)

(assert (=> b!661852 (=> res!429900 e!380090)))

(assert (=> b!661852 (= res!429900 (not (validKeyInArray!0 (select (arr!18646 a!3626) from!3004))))))

(declare-fun lt!308850 () Unit!22978)

(assert (=> b!661852 (= lt!308850 e!380088)))

(declare-fun c!76340 () Bool)

(declare-fun arrayContainsKey!0 (array!38907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661852 (= c!76340 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!661852 (arrayContainsKey!0 (array!38908 (store (arr!18646 a!3626) i!1382 k0!2843) (size!19010 a!3626)) k0!2843 from!3004)))

(declare-fun b!661860 () Bool)

(declare-fun res!429905 () Bool)

(assert (=> b!661860 (=> (not res!429905) (not e!380087))))

(assert (=> b!661860 (= res!429905 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19010 a!3626))))))

(declare-fun b!661861 () Bool)

(assert (=> b!661861 (= e!380089 e!380093)))

(declare-fun res!429901 () Bool)

(assert (=> b!661861 (=> (not res!429901) (not e!380093))))

(assert (=> b!661861 (= res!429901 (bvsle from!3004 i!1382))))

(declare-fun b!661862 () Bool)

(declare-fun res!429915 () Bool)

(assert (=> b!661862 (=> res!429915 e!380094)))

(assert (=> b!661862 (= res!429915 (contains!3264 lt!308851 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!661863 () Bool)

(declare-fun res!429906 () Bool)

(assert (=> b!661863 (=> (not res!429906) (not e!380087))))

(assert (=> b!661863 (= res!429906 (not (contains!3264 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661864 () Bool)

(declare-fun res!429899 () Bool)

(assert (=> b!661864 (=> (not res!429899) (not e!380087))))

(assert (=> b!661864 (= res!429899 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!661865 () Bool)

(declare-fun Unit!22981 () Unit!22978)

(assert (=> b!661865 (= e!380088 Unit!22981)))

(declare-fun lt!308853 () Unit!22978)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38907 (_ BitVec 64) (_ BitVec 32)) Unit!22978)

(assert (=> b!661865 (= lt!308853 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!661865 false))

(assert (= (and start!59860 res!429914) b!661848))

(assert (= (and b!661848 res!429913) b!661863))

(assert (= (and b!661863 res!429906) b!661859))

(assert (= (and b!661859 res!429909) b!661851))

(assert (= (and b!661851 res!429904) b!661844))

(assert (= (and b!661851 (not res!429916)) b!661861))

(assert (= (and b!661861 res!429901) b!661850))

(assert (= (and b!661851 res!429907) b!661854))

(assert (= (and b!661854 res!429902) b!661858))

(assert (= (and b!661858 res!429898) b!661860))

(assert (= (and b!661860 res!429905) b!661846))

(assert (= (and b!661846 res!429908) b!661864))

(assert (= (and b!661864 res!429899) b!661856))

(assert (= (and b!661856 res!429903) b!661852))

(assert (= (and b!661852 c!76340) b!661865))

(assert (= (and b!661852 (not c!76340)) b!661857))

(assert (= (and b!661852 (not res!429900)) b!661849))

(assert (= (and b!661849 (not res!429910)) b!661853))

(assert (= (and b!661853 (not res!429917)) b!661847))

(assert (= (and b!661847 (not res!429912)) b!661862))

(assert (= (and b!661862 (not res!429915)) b!661845))

(assert (= (and b!661845 (not res!429911)) b!661855))

(declare-fun m!633845 () Bool)

(assert (=> b!661844 m!633845))

(assert (=> b!661850 m!633845))

(declare-fun m!633847 () Bool)

(assert (=> b!661858 m!633847))

(declare-fun m!633849 () Bool)

(assert (=> b!661845 m!633849))

(declare-fun m!633851 () Bool)

(assert (=> b!661848 m!633851))

(declare-fun m!633853 () Bool)

(assert (=> b!661859 m!633853))

(declare-fun m!633855 () Bool)

(assert (=> b!661864 m!633855))

(declare-fun m!633857 () Bool)

(assert (=> b!661849 m!633857))

(assert (=> b!661849 m!633857))

(declare-fun m!633859 () Bool)

(assert (=> b!661849 m!633859))

(declare-fun m!633861 () Bool)

(assert (=> b!661849 m!633861))

(declare-fun m!633863 () Bool)

(assert (=> b!661849 m!633863))

(declare-fun m!633865 () Bool)

(assert (=> b!661855 m!633865))

(declare-fun m!633867 () Bool)

(assert (=> b!661855 m!633867))

(declare-fun m!633869 () Bool)

(assert (=> b!661854 m!633869))

(declare-fun m!633871 () Bool)

(assert (=> b!661847 m!633871))

(declare-fun m!633873 () Bool)

(assert (=> b!661853 m!633873))

(declare-fun m!633875 () Bool)

(assert (=> b!661865 m!633875))

(assert (=> b!661852 m!633857))

(declare-fun m!633877 () Bool)

(assert (=> b!661852 m!633877))

(declare-fun m!633879 () Bool)

(assert (=> b!661852 m!633879))

(assert (=> b!661852 m!633857))

(declare-fun m!633881 () Bool)

(assert (=> b!661852 m!633881))

(declare-fun m!633883 () Bool)

(assert (=> b!661852 m!633883))

(declare-fun m!633885 () Bool)

(assert (=> b!661846 m!633885))

(declare-fun m!633887 () Bool)

(assert (=> start!59860 m!633887))

(declare-fun m!633889 () Bool)

(assert (=> b!661862 m!633889))

(declare-fun m!633891 () Bool)

(assert (=> b!661863 m!633891))

(check-sat (not b!661852) (not b!661863) (not b!661848) (not b!661862) (not b!661844) (not start!59860) (not b!661849) (not b!661846) (not b!661854) (not b!661865) (not b!661858) (not b!661850) (not b!661853) (not b!661855) (not b!661859) (not b!661864) (not b!661845) (not b!661847))
(check-sat)
