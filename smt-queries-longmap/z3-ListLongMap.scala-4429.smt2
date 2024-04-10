; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61552 () Bool)

(assert start!61552)

(declare-fun b!688118 () Bool)

(declare-fun e!391977 () Bool)

(declare-fun e!391972 () Bool)

(assert (=> b!688118 (= e!391977 e!391972)))

(declare-fun res!452887 () Bool)

(assert (=> b!688118 (=> (not res!452887) (not e!391972))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!688118 (= res!452887 (bvsle from!3004 i!1382))))

(declare-fun b!688119 () Bool)

(declare-fun res!452885 () Bool)

(declare-fun e!391967 () Bool)

(assert (=> b!688119 (=> res!452885 e!391967)))

(declare-datatypes ((List!13059 0))(
  ( (Nil!13056) (Cons!13055 (h!14100 (_ BitVec 64)) (t!19323 List!13059)) )
))
(declare-fun lt!315640 () List!13059)

(declare-fun noDuplicate!883 (List!13059) Bool)

(assert (=> b!688119 (= res!452885 (not (noDuplicate!883 lt!315640)))))

(declare-fun b!688120 () Bool)

(declare-datatypes ((Unit!24257 0))(
  ( (Unit!24258) )
))
(declare-fun e!391974 () Unit!24257)

(declare-fun lt!315648 () Unit!24257)

(assert (=> b!688120 (= e!391974 lt!315648)))

(declare-fun lt!315643 () Unit!24257)

(declare-fun acc!681 () List!13059)

(declare-fun lemmaListSubSeqRefl!0 (List!13059) Unit!24257)

(assert (=> b!688120 (= lt!315643 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!222 (List!13059 List!13059) Bool)

(assert (=> b!688120 (subseq!222 acc!681 acc!681)))

(declare-datatypes ((array!39693 0))(
  ( (array!39694 (arr!19018 (Array (_ BitVec 32) (_ BitVec 64))) (size!19400 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39693)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39693 List!13059 List!13059 (_ BitVec 32)) Unit!24257)

(declare-fun $colon$colon!387 (List!13059 (_ BitVec 64)) List!13059)

(assert (=> b!688120 (= lt!315648 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!387 acc!681 (select (arr!19018 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39693 (_ BitVec 32) List!13059) Bool)

(assert (=> b!688120 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!688121 () Bool)

(declare-fun res!452880 () Bool)

(declare-fun e!391976 () Bool)

(assert (=> b!688121 (=> (not res!452880) (not e!391976))))

(assert (=> b!688121 (= res!452880 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19400 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!688122 () Bool)

(declare-fun e!391975 () Unit!24257)

(declare-fun Unit!24259 () Unit!24257)

(assert (=> b!688122 (= e!391975 Unit!24259)))

(declare-fun lt!315646 () Unit!24257)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39693 (_ BitVec 64) (_ BitVec 32)) Unit!24257)

(assert (=> b!688122 (= lt!315646 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!688122 false))

(declare-fun res!452888 () Bool)

(assert (=> start!61552 (=> (not res!452888) (not e!391976))))

(assert (=> start!61552 (= res!452888 (and (bvslt (size!19400 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19400 a!3626))))))

(assert (=> start!61552 e!391976))

(assert (=> start!61552 true))

(declare-fun array_inv!14814 (array!39693) Bool)

(assert (=> start!61552 (array_inv!14814 a!3626)))

(declare-fun b!688123 () Bool)

(declare-fun res!452892 () Bool)

(assert (=> b!688123 (=> (not res!452892) (not e!391976))))

(declare-fun contains!3636 (List!13059 (_ BitVec 64)) Bool)

(assert (=> b!688123 (= res!452892 (not (contains!3636 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688124 () Bool)

(declare-fun res!452894 () Bool)

(assert (=> b!688124 (=> res!452894 e!391967)))

(assert (=> b!688124 (= res!452894 (contains!3636 lt!315640 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688125 () Bool)

(declare-fun res!452878 () Bool)

(assert (=> b!688125 (=> (not res!452878) (not e!391976))))

(assert (=> b!688125 (= res!452878 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13056))))

(declare-fun b!688126 () Bool)

(assert (=> b!688126 (= e!391967 true)))

(declare-fun lt!315642 () Bool)

(declare-fun e!391968 () Bool)

(assert (=> b!688126 (= lt!315642 e!391968)))

(declare-fun res!452890 () Bool)

(assert (=> b!688126 (=> res!452890 e!391968)))

(declare-fun e!391969 () Bool)

(assert (=> b!688126 (= res!452890 e!391969)))

(declare-fun res!452882 () Bool)

(assert (=> b!688126 (=> (not res!452882) (not e!391969))))

(assert (=> b!688126 (= res!452882 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688127 () Bool)

(declare-fun e!391970 () Bool)

(assert (=> b!688127 (= e!391970 (contains!3636 acc!681 k0!2843))))

(declare-fun b!688128 () Bool)

(declare-fun res!452875 () Bool)

(assert (=> b!688128 (=> res!452875 e!391967)))

(assert (=> b!688128 (= res!452875 (contains!3636 lt!315640 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688129 () Bool)

(assert (=> b!688129 (= e!391976 (not e!391967))))

(declare-fun res!452891 () Bool)

(assert (=> b!688129 (=> res!452891 e!391967)))

(assert (=> b!688129 (= res!452891 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!688129 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315640)))

(declare-fun lt!315647 () Unit!24257)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39693 (_ BitVec 64) (_ BitVec 32) List!13059 List!13059) Unit!24257)

(assert (=> b!688129 (= lt!315647 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315640))))

(declare-fun -!187 (List!13059 (_ BitVec 64)) List!13059)

(assert (=> b!688129 (= (-!187 lt!315640 k0!2843) acc!681)))

(assert (=> b!688129 (= lt!315640 ($colon$colon!387 acc!681 k0!2843))))

(declare-fun lt!315644 () Unit!24257)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13059) Unit!24257)

(assert (=> b!688129 (= lt!315644 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!688129 (subseq!222 acc!681 acc!681)))

(declare-fun lt!315649 () Unit!24257)

(assert (=> b!688129 (= lt!315649 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688129 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315645 () Unit!24257)

(assert (=> b!688129 (= lt!315645 e!391974)))

(declare-fun c!77989 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!688129 (= c!77989 (validKeyInArray!0 (select (arr!19018 a!3626) from!3004)))))

(declare-fun lt!315641 () Unit!24257)

(assert (=> b!688129 (= lt!315641 e!391975)))

(declare-fun c!77990 () Bool)

(declare-fun arrayContainsKey!0 (array!39693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!688129 (= c!77990 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688129 (arrayContainsKey!0 (array!39694 (store (arr!19018 a!3626) i!1382 k0!2843) (size!19400 a!3626)) k0!2843 from!3004)))

(declare-fun b!688130 () Bool)

(declare-fun res!452889 () Bool)

(assert (=> b!688130 (=> (not res!452889) (not e!391976))))

(assert (=> b!688130 (= res!452889 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19400 a!3626))))))

(declare-fun b!688131 () Bool)

(declare-fun res!452883 () Bool)

(assert (=> b!688131 (=> (not res!452883) (not e!391976))))

(assert (=> b!688131 (= res!452883 (not (contains!3636 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688132 () Bool)

(assert (=> b!688132 (= e!391969 (contains!3636 lt!315640 k0!2843))))

(declare-fun b!688133 () Bool)

(declare-fun e!391973 () Bool)

(assert (=> b!688133 (= e!391973 (not (contains!3636 lt!315640 k0!2843)))))

(declare-fun b!688134 () Bool)

(declare-fun res!452893 () Bool)

(assert (=> b!688134 (=> (not res!452893) (not e!391976))))

(assert (=> b!688134 (= res!452893 (validKeyInArray!0 k0!2843))))

(declare-fun b!688135 () Bool)

(declare-fun res!452879 () Bool)

(assert (=> b!688135 (=> (not res!452879) (not e!391976))))

(assert (=> b!688135 (= res!452879 e!391977)))

(declare-fun res!452886 () Bool)

(assert (=> b!688135 (=> res!452886 e!391977)))

(assert (=> b!688135 (= res!452886 e!391970)))

(declare-fun res!452877 () Bool)

(assert (=> b!688135 (=> (not res!452877) (not e!391970))))

(assert (=> b!688135 (= res!452877 (bvsgt from!3004 i!1382))))

(declare-fun b!688136 () Bool)

(declare-fun res!452881 () Bool)

(assert (=> b!688136 (=> (not res!452881) (not e!391976))))

(assert (=> b!688136 (= res!452881 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!688137 () Bool)

(declare-fun Unit!24260 () Unit!24257)

(assert (=> b!688137 (= e!391975 Unit!24260)))

(declare-fun b!688138 () Bool)

(declare-fun Unit!24261 () Unit!24257)

(assert (=> b!688138 (= e!391974 Unit!24261)))

(declare-fun b!688139 () Bool)

(declare-fun res!452876 () Bool)

(assert (=> b!688139 (=> (not res!452876) (not e!391976))))

(assert (=> b!688139 (= res!452876 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!688140 () Bool)

(declare-fun res!452884 () Bool)

(assert (=> b!688140 (=> (not res!452884) (not e!391976))))

(assert (=> b!688140 (= res!452884 (noDuplicate!883 acc!681))))

(declare-fun b!688141 () Bool)

(assert (=> b!688141 (= e!391968 e!391973)))

(declare-fun res!452874 () Bool)

(assert (=> b!688141 (=> (not res!452874) (not e!391973))))

(assert (=> b!688141 (= res!452874 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688142 () Bool)

(assert (=> b!688142 (= e!391972 (not (contains!3636 acc!681 k0!2843)))))

(assert (= (and start!61552 res!452888) b!688140))

(assert (= (and b!688140 res!452884) b!688123))

(assert (= (and b!688123 res!452892) b!688131))

(assert (= (and b!688131 res!452883) b!688135))

(assert (= (and b!688135 res!452877) b!688127))

(assert (= (and b!688135 (not res!452886)) b!688118))

(assert (= (and b!688118 res!452887) b!688142))

(assert (= (and b!688135 res!452879) b!688125))

(assert (= (and b!688125 res!452878) b!688139))

(assert (= (and b!688139 res!452876) b!688130))

(assert (= (and b!688130 res!452889) b!688134))

(assert (= (and b!688134 res!452893) b!688136))

(assert (= (and b!688136 res!452881) b!688121))

(assert (= (and b!688121 res!452880) b!688129))

(assert (= (and b!688129 c!77990) b!688122))

(assert (= (and b!688129 (not c!77990)) b!688137))

(assert (= (and b!688129 c!77989) b!688120))

(assert (= (and b!688129 (not c!77989)) b!688138))

(assert (= (and b!688129 (not res!452891)) b!688119))

(assert (= (and b!688119 (not res!452885)) b!688128))

(assert (= (and b!688128 (not res!452875)) b!688124))

(assert (= (and b!688124 (not res!452894)) b!688126))

(assert (= (and b!688126 res!452882) b!688132))

(assert (= (and b!688126 (not res!452890)) b!688141))

(assert (= (and b!688141 res!452874) b!688133))

(declare-fun m!652083 () Bool)

(assert (=> b!688132 m!652083))

(declare-fun m!652085 () Bool)

(assert (=> b!688123 m!652085))

(declare-fun m!652087 () Bool)

(assert (=> start!61552 m!652087))

(declare-fun m!652089 () Bool)

(assert (=> b!688140 m!652089))

(declare-fun m!652091 () Bool)

(assert (=> b!688119 m!652091))

(declare-fun m!652093 () Bool)

(assert (=> b!688139 m!652093))

(declare-fun m!652095 () Bool)

(assert (=> b!688142 m!652095))

(assert (=> b!688133 m!652083))

(declare-fun m!652097 () Bool)

(assert (=> b!688129 m!652097))

(declare-fun m!652099 () Bool)

(assert (=> b!688129 m!652099))

(declare-fun m!652101 () Bool)

(assert (=> b!688129 m!652101))

(declare-fun m!652103 () Bool)

(assert (=> b!688129 m!652103))

(declare-fun m!652105 () Bool)

(assert (=> b!688129 m!652105))

(declare-fun m!652107 () Bool)

(assert (=> b!688129 m!652107))

(declare-fun m!652109 () Bool)

(assert (=> b!688129 m!652109))

(declare-fun m!652111 () Bool)

(assert (=> b!688129 m!652111))

(declare-fun m!652113 () Bool)

(assert (=> b!688129 m!652113))

(declare-fun m!652115 () Bool)

(assert (=> b!688129 m!652115))

(assert (=> b!688129 m!652103))

(declare-fun m!652117 () Bool)

(assert (=> b!688129 m!652117))

(declare-fun m!652119 () Bool)

(assert (=> b!688129 m!652119))

(declare-fun m!652121 () Bool)

(assert (=> b!688129 m!652121))

(declare-fun m!652123 () Bool)

(assert (=> b!688128 m!652123))

(declare-fun m!652125 () Bool)

(assert (=> b!688124 m!652125))

(declare-fun m!652127 () Bool)

(assert (=> b!688136 m!652127))

(declare-fun m!652129 () Bool)

(assert (=> b!688134 m!652129))

(assert (=> b!688120 m!652101))

(assert (=> b!688120 m!652103))

(declare-fun m!652131 () Bool)

(assert (=> b!688120 m!652131))

(declare-fun m!652133 () Bool)

(assert (=> b!688120 m!652133))

(assert (=> b!688120 m!652103))

(assert (=> b!688120 m!652131))

(assert (=> b!688120 m!652109))

(assert (=> b!688120 m!652121))

(declare-fun m!652135 () Bool)

(assert (=> b!688122 m!652135))

(declare-fun m!652137 () Bool)

(assert (=> b!688125 m!652137))

(declare-fun m!652139 () Bool)

(assert (=> b!688131 m!652139))

(assert (=> b!688127 m!652095))

(check-sat (not b!688139) (not b!688134) (not b!688142) (not b!688136) (not b!688131) (not b!688127) (not b!688129) (not b!688120) (not b!688123) (not b!688133) (not b!688119) (not b!688122) (not start!61552) (not b!688140) (not b!688128) (not b!688125) (not b!688124) (not b!688132))
