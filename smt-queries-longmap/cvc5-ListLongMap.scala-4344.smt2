; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60092 () Bool)

(assert start!60092)

(declare-fun b!670039 () Bool)

(declare-fun res!436838 () Bool)

(declare-fun e!383161 () Bool)

(assert (=> b!670039 (=> (not res!436838) (not e!383161))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39139 0))(
  ( (array!39140 (arr!18762 (Array (_ BitVec 32) (_ BitVec 64))) (size!19126 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39139)

(assert (=> b!670039 (= res!436838 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19126 a!3626))))))

(declare-fun b!670040 () Bool)

(declare-fun res!436846 () Bool)

(assert (=> b!670040 (=> (not res!436846) (not e!383161))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!670040 (= res!436846 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19126 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!670041 () Bool)

(declare-fun res!436852 () Bool)

(assert (=> b!670041 (=> (not res!436852) (not e!383161))))

(declare-datatypes ((List!12803 0))(
  ( (Nil!12800) (Cons!12799 (h!13844 (_ BitVec 64)) (t!19031 List!12803)) )
))
(declare-fun acc!681 () List!12803)

(declare-fun contains!3380 (List!12803 (_ BitVec 64)) Bool)

(assert (=> b!670041 (= res!436852 (not (contains!3380 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670042 () Bool)

(declare-fun res!436856 () Bool)

(assert (=> b!670042 (=> (not res!436856) (not e!383161))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!670042 (= res!436856 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!670044 () Bool)

(declare-fun e!383166 () Bool)

(declare-fun lt!311870 () List!12803)

(assert (=> b!670044 (= e!383166 (not (contains!3380 lt!311870 k!2843)))))

(declare-fun b!670045 () Bool)

(declare-fun res!436850 () Bool)

(assert (=> b!670045 (=> (not res!436850) (not e!383161))))

(assert (=> b!670045 (= res!436850 (not (contains!3380 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670046 () Bool)

(declare-fun res!436837 () Bool)

(declare-fun e!383157 () Bool)

(assert (=> b!670046 (=> res!436837 e!383157)))

(declare-fun e!383162 () Bool)

(assert (=> b!670046 (= res!436837 e!383162)))

(declare-fun res!436836 () Bool)

(assert (=> b!670046 (=> (not res!436836) (not e!383162))))

(assert (=> b!670046 (= res!436836 e!383166)))

(declare-fun res!436848 () Bool)

(assert (=> b!670046 (=> res!436848 e!383166)))

(assert (=> b!670046 (= res!436848 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!670047 () Bool)

(declare-datatypes ((Unit!23535 0))(
  ( (Unit!23536) )
))
(declare-fun e!383163 () Unit!23535)

(declare-fun Unit!23537 () Unit!23535)

(assert (=> b!670047 (= e!383163 Unit!23537)))

(declare-fun lt!311865 () Unit!23535)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39139 (_ BitVec 64) (_ BitVec 32)) Unit!23535)

(assert (=> b!670047 (= lt!311865 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!670047 false))

(declare-fun b!670048 () Bool)

(declare-fun e!383156 () Bool)

(assert (=> b!670048 (= e!383162 e!383156)))

(declare-fun res!436851 () Bool)

(assert (=> b!670048 (=> res!436851 e!383156)))

(assert (=> b!670048 (= res!436851 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!670049 () Bool)

(assert (=> b!670049 (= e!383157 true)))

(declare-fun lt!311874 () array!39139)

(declare-fun arrayNoDuplicates!0 (array!39139 (_ BitVec 32) List!12803) Bool)

(assert (=> b!670049 (arrayNoDuplicates!0 lt!311874 (bvadd #b00000000000000000000000000000001 from!3004) lt!311870)))

(declare-fun lt!311867 () Unit!23535)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39139 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12803) Unit!23535)

(assert (=> b!670049 (= lt!311867 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!311870))))

(declare-fun b!670050 () Bool)

(declare-fun e!383164 () Unit!23535)

(declare-fun lt!311866 () Unit!23535)

(assert (=> b!670050 (= e!383164 lt!311866)))

(declare-fun lt!311868 () Unit!23535)

(declare-fun lemmaListSubSeqRefl!0 (List!12803) Unit!23535)

(assert (=> b!670050 (= lt!311868 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!119 (List!12803 List!12803) Bool)

(assert (=> b!670050 (subseq!119 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39139 List!12803 List!12803 (_ BitVec 32)) Unit!23535)

(declare-fun $colon$colon!251 (List!12803 (_ BitVec 64)) List!12803)

(assert (=> b!670050 (= lt!311866 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!251 acc!681 (select (arr!18762 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!670050 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!670051 () Bool)

(declare-fun res!436845 () Bool)

(assert (=> b!670051 (=> (not res!436845) (not e!383161))))

(declare-fun noDuplicate!627 (List!12803) Bool)

(assert (=> b!670051 (= res!436845 (noDuplicate!627 acc!681))))

(declare-fun b!670043 () Bool)

(declare-fun e!383165 () Bool)

(assert (=> b!670043 (= e!383165 (contains!3380 acc!681 k!2843))))

(declare-fun res!436855 () Bool)

(assert (=> start!60092 (=> (not res!436855) (not e!383161))))

(assert (=> start!60092 (= res!436855 (and (bvslt (size!19126 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19126 a!3626))))))

(assert (=> start!60092 e!383161))

(assert (=> start!60092 true))

(declare-fun array_inv!14558 (array!39139) Bool)

(assert (=> start!60092 (array_inv!14558 a!3626)))

(declare-fun b!670052 () Bool)

(declare-fun res!436835 () Bool)

(assert (=> b!670052 (=> (not res!436835) (not e!383161))))

(declare-fun e!383160 () Bool)

(assert (=> b!670052 (= res!436835 e!383160)))

(declare-fun res!436854 () Bool)

(assert (=> b!670052 (=> res!436854 e!383160)))

(assert (=> b!670052 (= res!436854 e!383165)))

(declare-fun res!436841 () Bool)

(assert (=> b!670052 (=> (not res!436841) (not e!383165))))

(assert (=> b!670052 (= res!436841 (bvsgt from!3004 i!1382))))

(declare-fun b!670053 () Bool)

(declare-fun Unit!23538 () Unit!23535)

(assert (=> b!670053 (= e!383164 Unit!23538)))

(declare-fun b!670054 () Bool)

(declare-fun res!436840 () Bool)

(assert (=> b!670054 (=> (not res!436840) (not e!383161))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!670054 (= res!436840 (validKeyInArray!0 k!2843))))

(declare-fun b!670055 () Bool)

(declare-fun res!436849 () Bool)

(assert (=> b!670055 (=> (not res!436849) (not e!383161))))

(assert (=> b!670055 (= res!436849 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!670056 () Bool)

(declare-fun e!383158 () Bool)

(assert (=> b!670056 (= e!383160 e!383158)))

(declare-fun res!436839 () Bool)

(assert (=> b!670056 (=> (not res!436839) (not e!383158))))

(assert (=> b!670056 (= res!436839 (bvsle from!3004 i!1382))))

(declare-fun b!670057 () Bool)

(declare-fun Unit!23539 () Unit!23535)

(assert (=> b!670057 (= e!383163 Unit!23539)))

(declare-fun b!670058 () Bool)

(assert (=> b!670058 (= e!383161 (not e!383157))))

(declare-fun res!436843 () Bool)

(assert (=> b!670058 (=> res!436843 e!383157)))

(assert (=> b!670058 (= res!436843 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!670058 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311870)))

(declare-fun lt!311875 () Unit!23535)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39139 (_ BitVec 64) (_ BitVec 32) List!12803 List!12803) Unit!23535)

(assert (=> b!670058 (= lt!311875 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311870))))

(declare-fun -!117 (List!12803 (_ BitVec 64)) List!12803)

(assert (=> b!670058 (= (-!117 lt!311870 k!2843) acc!681)))

(assert (=> b!670058 (= lt!311870 ($colon$colon!251 acc!681 k!2843))))

(declare-fun lt!311873 () Unit!23535)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12803) Unit!23535)

(assert (=> b!670058 (= lt!311873 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!670058 (subseq!119 acc!681 acc!681)))

(declare-fun lt!311872 () Unit!23535)

(assert (=> b!670058 (= lt!311872 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!670058 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311869 () Unit!23535)

(assert (=> b!670058 (= lt!311869 e!383164)))

(declare-fun c!76970 () Bool)

(assert (=> b!670058 (= c!76970 (validKeyInArray!0 (select (arr!18762 a!3626) from!3004)))))

(declare-fun lt!311871 () Unit!23535)

(assert (=> b!670058 (= lt!311871 e!383163)))

(declare-fun c!76969 () Bool)

(assert (=> b!670058 (= c!76969 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!670058 (arrayContainsKey!0 lt!311874 k!2843 from!3004)))

(assert (=> b!670058 (= lt!311874 (array!39140 (store (arr!18762 a!3626) i!1382 k!2843) (size!19126 a!3626)))))

(declare-fun b!670059 () Bool)

(declare-fun res!436844 () Bool)

(assert (=> b!670059 (=> res!436844 e!383157)))

(assert (=> b!670059 (= res!436844 (contains!3380 lt!311870 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670060 () Bool)

(declare-fun res!436842 () Bool)

(assert (=> b!670060 (=> res!436842 e!383157)))

(assert (=> b!670060 (= res!436842 (contains!3380 lt!311870 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670061 () Bool)

(assert (=> b!670061 (= e!383158 (not (contains!3380 acc!681 k!2843)))))

(declare-fun b!670062 () Bool)

(assert (=> b!670062 (= e!383156 (contains!3380 lt!311870 k!2843))))

(declare-fun b!670063 () Bool)

(declare-fun res!436847 () Bool)

(assert (=> b!670063 (=> (not res!436847) (not e!383161))))

(assert (=> b!670063 (= res!436847 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12800))))

(declare-fun b!670064 () Bool)

(declare-fun res!436853 () Bool)

(assert (=> b!670064 (=> res!436853 e!383157)))

(assert (=> b!670064 (= res!436853 (not (noDuplicate!627 lt!311870)))))

(assert (= (and start!60092 res!436855) b!670051))

(assert (= (and b!670051 res!436845) b!670041))

(assert (= (and b!670041 res!436852) b!670045))

(assert (= (and b!670045 res!436850) b!670052))

(assert (= (and b!670052 res!436841) b!670043))

(assert (= (and b!670052 (not res!436854)) b!670056))

(assert (= (and b!670056 res!436839) b!670061))

(assert (= (and b!670052 res!436835) b!670063))

(assert (= (and b!670063 res!436847) b!670055))

(assert (= (and b!670055 res!436849) b!670039))

(assert (= (and b!670039 res!436838) b!670054))

(assert (= (and b!670054 res!436840) b!670042))

(assert (= (and b!670042 res!436856) b!670040))

(assert (= (and b!670040 res!436846) b!670058))

(assert (= (and b!670058 c!76969) b!670047))

(assert (= (and b!670058 (not c!76969)) b!670057))

(assert (= (and b!670058 c!76970) b!670050))

(assert (= (and b!670058 (not c!76970)) b!670053))

(assert (= (and b!670058 (not res!436843)) b!670064))

(assert (= (and b!670064 (not res!436853)) b!670059))

(assert (= (and b!670059 (not res!436844)) b!670060))

(assert (= (and b!670060 (not res!436842)) b!670046))

(assert (= (and b!670046 (not res!436848)) b!670044))

(assert (= (and b!670046 res!436836) b!670048))

(assert (= (and b!670048 (not res!436851)) b!670062))

(assert (= (and b!670046 (not res!436837)) b!670049))

(declare-fun m!640001 () Bool)

(assert (=> b!670055 m!640001))

(declare-fun m!640003 () Bool)

(assert (=> start!60092 m!640003))

(declare-fun m!640005 () Bool)

(assert (=> b!670043 m!640005))

(declare-fun m!640007 () Bool)

(assert (=> b!670041 m!640007))

(declare-fun m!640009 () Bool)

(assert (=> b!670050 m!640009))

(declare-fun m!640011 () Bool)

(assert (=> b!670050 m!640011))

(declare-fun m!640013 () Bool)

(assert (=> b!670050 m!640013))

(declare-fun m!640015 () Bool)

(assert (=> b!670050 m!640015))

(assert (=> b!670050 m!640011))

(assert (=> b!670050 m!640013))

(declare-fun m!640017 () Bool)

(assert (=> b!670050 m!640017))

(declare-fun m!640019 () Bool)

(assert (=> b!670050 m!640019))

(declare-fun m!640021 () Bool)

(assert (=> b!670059 m!640021))

(declare-fun m!640023 () Bool)

(assert (=> b!670062 m!640023))

(declare-fun m!640025 () Bool)

(assert (=> b!670042 m!640025))

(declare-fun m!640027 () Bool)

(assert (=> b!670047 m!640027))

(declare-fun m!640029 () Bool)

(assert (=> b!670049 m!640029))

(declare-fun m!640031 () Bool)

(assert (=> b!670049 m!640031))

(declare-fun m!640033 () Bool)

(assert (=> b!670058 m!640033))

(assert (=> b!670058 m!640009))

(assert (=> b!670058 m!640011))

(declare-fun m!640035 () Bool)

(assert (=> b!670058 m!640035))

(declare-fun m!640037 () Bool)

(assert (=> b!670058 m!640037))

(declare-fun m!640039 () Bool)

(assert (=> b!670058 m!640039))

(declare-fun m!640041 () Bool)

(assert (=> b!670058 m!640041))

(assert (=> b!670058 m!640017))

(declare-fun m!640043 () Bool)

(assert (=> b!670058 m!640043))

(declare-fun m!640045 () Bool)

(assert (=> b!670058 m!640045))

(assert (=> b!670058 m!640011))

(declare-fun m!640047 () Bool)

(assert (=> b!670058 m!640047))

(declare-fun m!640049 () Bool)

(assert (=> b!670058 m!640049))

(assert (=> b!670058 m!640019))

(declare-fun m!640051 () Bool)

(assert (=> b!670063 m!640051))

(assert (=> b!670061 m!640005))

(declare-fun m!640053 () Bool)

(assert (=> b!670045 m!640053))

(declare-fun m!640055 () Bool)

(assert (=> b!670060 m!640055))

(assert (=> b!670044 m!640023))

(declare-fun m!640057 () Bool)

(assert (=> b!670051 m!640057))

(declare-fun m!640059 () Bool)

(assert (=> b!670064 m!640059))

(declare-fun m!640061 () Bool)

(assert (=> b!670054 m!640061))

(push 1)

(assert (not b!670059))

(assert (not start!60092))

(assert (not b!670051))

(assert (not b!670049))

(assert (not b!670043))

(assert (not b!670041))

(assert (not b!670062))

(assert (not b!670045))

(assert (not b!670058))

(assert (not b!670061))

(assert (not b!670050))

(assert (not b!670060))

(assert (not b!670054))

(assert (not b!670047))

(assert (not b!670055))

(assert (not b!670044))

(assert (not b!670042))

(assert (not b!670064))

(assert (not b!670063))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

