; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59888 () Bool)

(assert start!59888)

(declare-fun b!662868 () Bool)

(declare-fun res!430979 () Bool)

(declare-fun e!380377 () Bool)

(assert (=> b!662868 (=> (not res!430979) (not e!380377))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38946 0))(
  ( (array!38947 (arr!18665 (Array (_ BitVec 32) (_ BitVec 64))) (size!19030 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38946)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!662868 (= res!430979 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19030 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!662869 () Bool)

(declare-fun res!430971 () Bool)

(assert (=> b!662869 (=> (not res!430971) (not e!380377))))

(declare-datatypes ((List!12745 0))(
  ( (Nil!12742) (Cons!12741 (h!13786 (_ BitVec 64)) (t!18964 List!12745)) )
))
(declare-fun acc!681 () List!12745)

(declare-fun noDuplicate!536 (List!12745) Bool)

(assert (=> b!662869 (= res!430971 (noDuplicate!536 acc!681))))

(declare-fun b!662870 () Bool)

(declare-fun e!380379 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3267 (List!12745 (_ BitVec 64)) Bool)

(assert (=> b!662870 (= e!380379 (not (contains!3267 acc!681 k0!2843)))))

(declare-fun b!662871 () Bool)

(declare-datatypes ((Unit!23036 0))(
  ( (Unit!23037) )
))
(declare-fun e!380384 () Unit!23036)

(declare-fun Unit!23038 () Unit!23036)

(assert (=> b!662871 (= e!380384 Unit!23038)))

(declare-fun lt!308953 () Unit!23036)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38946 (_ BitVec 64) (_ BitVec 32)) Unit!23036)

(assert (=> b!662871 (= lt!308953 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!662871 false))

(declare-fun b!662872 () Bool)

(declare-fun res!430976 () Bool)

(assert (=> b!662872 (=> (not res!430976) (not e!380377))))

(assert (=> b!662872 (= res!430976 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19030 a!3626))))))

(declare-fun b!662873 () Bool)

(declare-fun res!430963 () Bool)

(assert (=> b!662873 (=> (not res!430963) (not e!380377))))

(declare-fun arrayNoDuplicates!0 (array!38946 (_ BitVec 32) List!12745) Bool)

(assert (=> b!662873 (= res!430963 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!662875 () Bool)

(declare-fun res!430978 () Bool)

(assert (=> b!662875 (=> (not res!430978) (not e!380377))))

(assert (=> b!662875 (= res!430978 (not (contains!3267 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662876 () Bool)

(declare-fun e!380381 () Bool)

(assert (=> b!662876 (= e!380381 e!380379)))

(declare-fun res!430977 () Bool)

(assert (=> b!662876 (=> (not res!430977) (not e!380379))))

(assert (=> b!662876 (= res!430977 (bvsle from!3004 i!1382))))

(declare-fun b!662877 () Bool)

(declare-fun e!380380 () Bool)

(assert (=> b!662877 (= e!380380 (contains!3267 acc!681 k0!2843))))

(declare-fun b!662878 () Bool)

(declare-fun res!430969 () Bool)

(assert (=> b!662878 (=> (not res!430969) (not e!380377))))

(declare-fun arrayContainsKey!0 (array!38946 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!662878 (= res!430969 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!662879 () Bool)

(declare-fun e!380383 () Bool)

(declare-fun e!380378 () Bool)

(assert (=> b!662879 (= e!380383 e!380378)))

(declare-fun res!430967 () Bool)

(assert (=> b!662879 (=> res!430967 e!380378)))

(assert (=> b!662879 (= res!430967 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!308957 () List!12745)

(declare-fun $colon$colon!154 (List!12745 (_ BitVec 64)) List!12745)

(assert (=> b!662879 (= lt!308957 ($colon$colon!154 acc!681 (select (arr!18665 a!3626) from!3004)))))

(declare-fun subseq!23 (List!12745 List!12745) Bool)

(assert (=> b!662879 (subseq!23 acc!681 acc!681)))

(declare-fun lt!308954 () Unit!23036)

(declare-fun lemmaListSubSeqRefl!0 (List!12745) Unit!23036)

(assert (=> b!662879 (= lt!308954 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!662880 () Bool)

(declare-fun res!430975 () Bool)

(assert (=> b!662880 (=> (not res!430975) (not e!380377))))

(assert (=> b!662880 (= res!430975 (not (contains!3267 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662881 () Bool)

(declare-fun res!430972 () Bool)

(assert (=> b!662881 (=> res!430972 e!380378)))

(assert (=> b!662881 (= res!430972 (not (noDuplicate!536 lt!308957)))))

(declare-fun b!662874 () Bool)

(declare-fun res!430968 () Bool)

(assert (=> b!662874 (=> (not res!430968) (not e!380377))))

(assert (=> b!662874 (= res!430968 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12742))))

(declare-fun res!430980 () Bool)

(assert (=> start!59888 (=> (not res!430980) (not e!380377))))

(assert (=> start!59888 (= res!430980 (and (bvslt (size!19030 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19030 a!3626))))))

(assert (=> start!59888 e!380377))

(assert (=> start!59888 true))

(declare-fun array_inv!14548 (array!38946) Bool)

(assert (=> start!59888 (array_inv!14548 a!3626)))

(declare-fun b!662882 () Bool)

(assert (=> b!662882 (= e!380377 (not e!380383))))

(declare-fun res!430965 () Bool)

(assert (=> b!662882 (=> res!430965 e!380383)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!662882 (= res!430965 (not (validKeyInArray!0 (select (arr!18665 a!3626) from!3004))))))

(declare-fun lt!308955 () Unit!23036)

(assert (=> b!662882 (= lt!308955 e!380384)))

(declare-fun c!76320 () Bool)

(assert (=> b!662882 (= c!76320 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!662882 (arrayContainsKey!0 (array!38947 (store (arr!18665 a!3626) i!1382 k0!2843) (size!19030 a!3626)) k0!2843 from!3004)))

(declare-fun b!662883 () Bool)

(assert (=> b!662883 (= e!380378 true)))

(declare-fun lt!308958 () Bool)

(assert (=> b!662883 (= lt!308958 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!308957))))

(declare-fun lt!308956 () Unit!23036)

(declare-fun noDuplicateSubseq!23 (List!12745 List!12745) Unit!23036)

(assert (=> b!662883 (= lt!308956 (noDuplicateSubseq!23 acc!681 lt!308957))))

(declare-fun b!662884 () Bool)

(declare-fun res!430962 () Bool)

(assert (=> b!662884 (=> res!430962 e!380378)))

(assert (=> b!662884 (= res!430962 (not (subseq!23 acc!681 lt!308957)))))

(declare-fun b!662885 () Bool)

(declare-fun res!430966 () Bool)

(assert (=> b!662885 (=> res!430966 e!380378)))

(assert (=> b!662885 (= res!430966 (contains!3267 lt!308957 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662886 () Bool)

(declare-fun res!430974 () Bool)

(assert (=> b!662886 (=> (not res!430974) (not e!380377))))

(assert (=> b!662886 (= res!430974 e!380381)))

(declare-fun res!430981 () Bool)

(assert (=> b!662886 (=> res!430981 e!380381)))

(assert (=> b!662886 (= res!430981 e!380380)))

(declare-fun res!430970 () Bool)

(assert (=> b!662886 (=> (not res!430970) (not e!380380))))

(assert (=> b!662886 (= res!430970 (bvsgt from!3004 i!1382))))

(declare-fun b!662887 () Bool)

(declare-fun Unit!23039 () Unit!23036)

(assert (=> b!662887 (= e!380384 Unit!23039)))

(declare-fun b!662888 () Bool)

(declare-fun res!430973 () Bool)

(assert (=> b!662888 (=> (not res!430973) (not e!380377))))

(assert (=> b!662888 (= res!430973 (validKeyInArray!0 k0!2843))))

(declare-fun b!662889 () Bool)

(declare-fun res!430964 () Bool)

(assert (=> b!662889 (=> res!430964 e!380378)))

(assert (=> b!662889 (= res!430964 (contains!3267 lt!308957 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!59888 res!430980) b!662869))

(assert (= (and b!662869 res!430971) b!662875))

(assert (= (and b!662875 res!430978) b!662880))

(assert (= (and b!662880 res!430975) b!662886))

(assert (= (and b!662886 res!430970) b!662877))

(assert (= (and b!662886 (not res!430981)) b!662876))

(assert (= (and b!662876 res!430977) b!662870))

(assert (= (and b!662886 res!430974) b!662874))

(assert (= (and b!662874 res!430968) b!662873))

(assert (= (and b!662873 res!430963) b!662872))

(assert (= (and b!662872 res!430976) b!662888))

(assert (= (and b!662888 res!430973) b!662878))

(assert (= (and b!662878 res!430969) b!662868))

(assert (= (and b!662868 res!430979) b!662882))

(assert (= (and b!662882 c!76320) b!662871))

(assert (= (and b!662882 (not c!76320)) b!662887))

(assert (= (and b!662882 (not res!430965)) b!662879))

(assert (= (and b!662879 (not res!430967)) b!662881))

(assert (= (and b!662881 (not res!430972)) b!662885))

(assert (= (and b!662885 (not res!430966)) b!662889))

(assert (= (and b!662889 (not res!430964)) b!662884))

(assert (= (and b!662884 (not res!430962)) b!662883))

(declare-fun m!634023 () Bool)

(assert (=> b!662888 m!634023))

(declare-fun m!634025 () Bool)

(assert (=> b!662881 m!634025))

(declare-fun m!634027 () Bool)

(assert (=> b!662878 m!634027))

(declare-fun m!634029 () Bool)

(assert (=> b!662869 m!634029))

(declare-fun m!634031 () Bool)

(assert (=> b!662875 m!634031))

(declare-fun m!634033 () Bool)

(assert (=> b!662889 m!634033))

(declare-fun m!634035 () Bool)

(assert (=> b!662883 m!634035))

(declare-fun m!634037 () Bool)

(assert (=> b!662883 m!634037))

(declare-fun m!634039 () Bool)

(assert (=> b!662884 m!634039))

(declare-fun m!634041 () Bool)

(assert (=> b!662882 m!634041))

(declare-fun m!634043 () Bool)

(assert (=> b!662882 m!634043))

(declare-fun m!634045 () Bool)

(assert (=> b!662882 m!634045))

(assert (=> b!662882 m!634041))

(declare-fun m!634047 () Bool)

(assert (=> b!662882 m!634047))

(declare-fun m!634049 () Bool)

(assert (=> b!662882 m!634049))

(declare-fun m!634051 () Bool)

(assert (=> b!662873 m!634051))

(declare-fun m!634053 () Bool)

(assert (=> b!662880 m!634053))

(declare-fun m!634055 () Bool)

(assert (=> b!662874 m!634055))

(declare-fun m!634057 () Bool)

(assert (=> b!662871 m!634057))

(assert (=> b!662879 m!634041))

(assert (=> b!662879 m!634041))

(declare-fun m!634059 () Bool)

(assert (=> b!662879 m!634059))

(declare-fun m!634061 () Bool)

(assert (=> b!662879 m!634061))

(declare-fun m!634063 () Bool)

(assert (=> b!662879 m!634063))

(declare-fun m!634065 () Bool)

(assert (=> b!662877 m!634065))

(assert (=> b!662870 m!634065))

(declare-fun m!634067 () Bool)

(assert (=> start!59888 m!634067))

(declare-fun m!634069 () Bool)

(assert (=> b!662885 m!634069))

(check-sat (not b!662882) (not b!662879) (not b!662881) (not b!662870) (not b!662880) (not b!662871) (not b!662885) (not b!662874) (not start!59888) (not b!662875) (not b!662884) (not b!662888) (not b!662869) (not b!662878) (not b!662873) (not b!662889) (not b!662877) (not b!662883))
(check-sat)
