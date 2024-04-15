; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59972 () Bool)

(assert start!59972)

(declare-fun res!433286 () Bool)

(declare-fun e!381340 () Bool)

(assert (=> start!59972 (=> (not res!433286) (not e!381340))))

(declare-datatypes ((array!39030 0))(
  ( (array!39031 (arr!18707 (Array (_ BitVec 32) (_ BitVec 64))) (size!19072 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39030)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59972 (= res!433286 (and (bvslt (size!19072 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19072 a!3626))))))

(assert (=> start!59972 e!381340))

(assert (=> start!59972 true))

(declare-fun array_inv!14590 (array!39030) Bool)

(assert (=> start!59972 (array_inv!14590 a!3626)))

(declare-fun b!665682 () Bool)

(declare-fun res!433303 () Bool)

(assert (=> b!665682 (=> (not res!433303) (not e!381340))))

(declare-datatypes ((List!12787 0))(
  ( (Nil!12784) (Cons!12783 (h!13828 (_ BitVec 64)) (t!19006 List!12787)) )
))
(declare-fun acc!681 () List!12787)

(declare-fun arrayNoDuplicates!0 (array!39030 (_ BitVec 32) List!12787) Bool)

(assert (=> b!665682 (= res!433303 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!665683 () Bool)

(declare-datatypes ((Unit!23243 0))(
  ( (Unit!23244) )
))
(declare-fun e!381341 () Unit!23243)

(declare-fun Unit!23245 () Unit!23243)

(assert (=> b!665683 (= e!381341 Unit!23245)))

(declare-fun b!665684 () Bool)

(declare-fun e!381344 () Unit!23243)

(declare-fun Unit!23246 () Unit!23243)

(assert (=> b!665684 (= e!381344 Unit!23246)))

(declare-fun b!665685 () Bool)

(declare-fun res!433297 () Bool)

(declare-fun e!381342 () Bool)

(assert (=> b!665685 (=> res!433297 e!381342)))

(declare-fun lt!309981 () List!12787)

(declare-fun contains!3309 (List!12787 (_ BitVec 64)) Bool)

(assert (=> b!665685 (= res!433297 (contains!3309 lt!309981 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665686 () Bool)

(declare-fun res!433298 () Bool)

(assert (=> b!665686 (=> (not res!433298) (not e!381340))))

(assert (=> b!665686 (= res!433298 (not (contains!3309 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665687 () Bool)

(declare-fun res!433289 () Bool)

(assert (=> b!665687 (=> (not res!433289) (not e!381340))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!665687 (= res!433289 (validKeyInArray!0 k0!2843))))

(declare-fun b!665688 () Bool)

(declare-fun Unit!23247 () Unit!23243)

(assert (=> b!665688 (= e!381341 Unit!23247)))

(declare-fun lt!309982 () Unit!23243)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39030 (_ BitVec 64) (_ BitVec 32)) Unit!23243)

(assert (=> b!665688 (= lt!309982 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!665688 false))

(declare-fun b!665689 () Bool)

(declare-fun res!433287 () Bool)

(assert (=> b!665689 (=> (not res!433287) (not e!381340))))

(assert (=> b!665689 (= res!433287 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12784))))

(declare-fun b!665690 () Bool)

(declare-fun res!433302 () Bool)

(assert (=> b!665690 (=> (not res!433302) (not e!381340))))

(assert (=> b!665690 (= res!433302 (not (contains!3309 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665691 () Bool)

(declare-fun res!433305 () Bool)

(assert (=> b!665691 (=> res!433305 e!381342)))

(declare-fun noDuplicate!578 (List!12787) Bool)

(assert (=> b!665691 (= res!433305 (not (noDuplicate!578 lt!309981)))))

(declare-fun b!665692 () Bool)

(declare-fun res!433296 () Bool)

(assert (=> b!665692 (=> res!433296 e!381342)))

(declare-fun subseq!65 (List!12787 List!12787) Bool)

(assert (=> b!665692 (= res!433296 (not (subseq!65 acc!681 lt!309981)))))

(declare-fun b!665693 () Bool)

(declare-fun res!433300 () Bool)

(assert (=> b!665693 (=> (not res!433300) (not e!381340))))

(assert (=> b!665693 (= res!433300 (noDuplicate!578 acc!681))))

(declare-fun b!665694 () Bool)

(declare-fun res!433295 () Bool)

(assert (=> b!665694 (=> (not res!433295) (not e!381340))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!665694 (= res!433295 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19072 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!665695 () Bool)

(declare-fun e!381343 () Bool)

(declare-fun e!381345 () Bool)

(assert (=> b!665695 (= e!381343 e!381345)))

(declare-fun res!433306 () Bool)

(assert (=> b!665695 (=> (not res!433306) (not e!381345))))

(assert (=> b!665695 (= res!433306 (bvsle from!3004 i!1382))))

(declare-fun b!665696 () Bool)

(assert (=> b!665696 (= e!381342 true)))

(declare-fun lt!309978 () Bool)

(assert (=> b!665696 (= lt!309978 (contains!3309 lt!309981 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665697 () Bool)

(declare-fun lt!309985 () Unit!23243)

(assert (=> b!665697 (= e!381344 lt!309985)))

(declare-fun lt!309980 () Unit!23243)

(declare-fun lemmaListSubSeqRefl!0 (List!12787) Unit!23243)

(assert (=> b!665697 (= lt!309980 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665697 (subseq!65 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39030 List!12787 List!12787 (_ BitVec 32)) Unit!23243)

(declare-fun $colon$colon!196 (List!12787 (_ BitVec 64)) List!12787)

(assert (=> b!665697 (= lt!309985 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!196 acc!681 (select (arr!18707 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665697 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!665698 () Bool)

(declare-fun res!433304 () Bool)

(assert (=> b!665698 (=> (not res!433304) (not e!381340))))

(declare-fun arrayContainsKey!0 (array!39030 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!665698 (= res!433304 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!665699 () Bool)

(declare-fun res!433301 () Bool)

(assert (=> b!665699 (=> res!433301 e!381342)))

(declare-fun lt!309986 () Bool)

(assert (=> b!665699 (= res!433301 lt!309986)))

(declare-fun b!665700 () Bool)

(declare-fun res!433288 () Bool)

(assert (=> b!665700 (=> (not res!433288) (not e!381340))))

(assert (=> b!665700 (= res!433288 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19072 a!3626))))))

(declare-fun b!665701 () Bool)

(declare-fun res!433293 () Bool)

(assert (=> b!665701 (=> res!433293 e!381342)))

(assert (=> b!665701 (= res!433293 (not (contains!3309 lt!309981 k0!2843)))))

(declare-fun b!665702 () Bool)

(declare-fun e!381346 () Bool)

(assert (=> b!665702 (= e!381346 (contains!3309 acc!681 k0!2843))))

(declare-fun b!665703 () Bool)

(assert (=> b!665703 (= e!381340 (not e!381342))))

(declare-fun res!433291 () Bool)

(assert (=> b!665703 (=> res!433291 e!381342)))

(assert (=> b!665703 (= res!433291 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!63 (List!12787 (_ BitVec 64)) List!12787)

(assert (=> b!665703 (= (-!63 lt!309981 k0!2843) acc!681)))

(assert (=> b!665703 (= lt!309981 ($colon$colon!196 acc!681 k0!2843))))

(declare-fun lt!309983 () Unit!23243)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12787) Unit!23243)

(assert (=> b!665703 (= lt!309983 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!665703 (subseq!65 acc!681 acc!681)))

(declare-fun lt!309987 () Unit!23243)

(assert (=> b!665703 (= lt!309987 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665703 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309984 () Unit!23243)

(assert (=> b!665703 (= lt!309984 e!381344)))

(declare-fun c!76566 () Bool)

(assert (=> b!665703 (= c!76566 (validKeyInArray!0 (select (arr!18707 a!3626) from!3004)))))

(declare-fun lt!309979 () Unit!23243)

(assert (=> b!665703 (= lt!309979 e!381341)))

(declare-fun c!76565 () Bool)

(assert (=> b!665703 (= c!76565 lt!309986)))

(assert (=> b!665703 (= lt!309986 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665703 (arrayContainsKey!0 (array!39031 (store (arr!18707 a!3626) i!1382 k0!2843) (size!19072 a!3626)) k0!2843 from!3004)))

(declare-fun b!665704 () Bool)

(declare-fun res!433299 () Bool)

(assert (=> b!665704 (=> res!433299 e!381342)))

(assert (=> b!665704 (= res!433299 (contains!3309 acc!681 k0!2843))))

(declare-fun b!665705 () Bool)

(declare-fun res!433290 () Bool)

(assert (=> b!665705 (=> (not res!433290) (not e!381340))))

(assert (=> b!665705 (= res!433290 e!381343)))

(declare-fun res!433294 () Bool)

(assert (=> b!665705 (=> res!433294 e!381343)))

(assert (=> b!665705 (= res!433294 e!381346)))

(declare-fun res!433292 () Bool)

(assert (=> b!665705 (=> (not res!433292) (not e!381346))))

(assert (=> b!665705 (= res!433292 (bvsgt from!3004 i!1382))))

(declare-fun b!665706 () Bool)

(assert (=> b!665706 (= e!381345 (not (contains!3309 acc!681 k0!2843)))))

(assert (= (and start!59972 res!433286) b!665693))

(assert (= (and b!665693 res!433300) b!665686))

(assert (= (and b!665686 res!433298) b!665690))

(assert (= (and b!665690 res!433302) b!665705))

(assert (= (and b!665705 res!433292) b!665702))

(assert (= (and b!665705 (not res!433294)) b!665695))

(assert (= (and b!665695 res!433306) b!665706))

(assert (= (and b!665705 res!433290) b!665689))

(assert (= (and b!665689 res!433287) b!665682))

(assert (= (and b!665682 res!433303) b!665700))

(assert (= (and b!665700 res!433288) b!665687))

(assert (= (and b!665687 res!433289) b!665698))

(assert (= (and b!665698 res!433304) b!665694))

(assert (= (and b!665694 res!433295) b!665703))

(assert (= (and b!665703 c!76565) b!665688))

(assert (= (and b!665703 (not c!76565)) b!665683))

(assert (= (and b!665703 c!76566) b!665697))

(assert (= (and b!665703 (not c!76566)) b!665684))

(assert (= (and b!665703 (not res!433291)) b!665691))

(assert (= (and b!665691 (not res!433305)) b!665699))

(assert (= (and b!665699 (not res!433301)) b!665704))

(assert (= (and b!665704 (not res!433299)) b!665692))

(assert (= (and b!665692 (not res!433296)) b!665701))

(assert (= (and b!665701 (not res!433293)) b!665685))

(assert (= (and b!665685 (not res!433297)) b!665696))

(declare-fun m!636111 () Bool)

(assert (=> b!665696 m!636111))

(declare-fun m!636113 () Bool)

(assert (=> b!665702 m!636113))

(declare-fun m!636115 () Bool)

(assert (=> b!665693 m!636115))

(assert (=> b!665704 m!636113))

(declare-fun m!636117 () Bool)

(assert (=> b!665698 m!636117))

(declare-fun m!636119 () Bool)

(assert (=> b!665685 m!636119))

(declare-fun m!636121 () Bool)

(assert (=> b!665690 m!636121))

(declare-fun m!636123 () Bool)

(assert (=> b!665682 m!636123))

(declare-fun m!636125 () Bool)

(assert (=> b!665686 m!636125))

(assert (=> b!665706 m!636113))

(declare-fun m!636127 () Bool)

(assert (=> b!665687 m!636127))

(declare-fun m!636129 () Bool)

(assert (=> b!665701 m!636129))

(declare-fun m!636131 () Bool)

(assert (=> b!665688 m!636131))

(declare-fun m!636133 () Bool)

(assert (=> b!665703 m!636133))

(declare-fun m!636135 () Bool)

(assert (=> b!665703 m!636135))

(declare-fun m!636137 () Bool)

(assert (=> b!665703 m!636137))

(declare-fun m!636139 () Bool)

(assert (=> b!665703 m!636139))

(declare-fun m!636141 () Bool)

(assert (=> b!665703 m!636141))

(declare-fun m!636143 () Bool)

(assert (=> b!665703 m!636143))

(declare-fun m!636145 () Bool)

(assert (=> b!665703 m!636145))

(declare-fun m!636147 () Bool)

(assert (=> b!665703 m!636147))

(assert (=> b!665703 m!636135))

(declare-fun m!636149 () Bool)

(assert (=> b!665703 m!636149))

(declare-fun m!636151 () Bool)

(assert (=> b!665703 m!636151))

(declare-fun m!636153 () Bool)

(assert (=> b!665703 m!636153))

(assert (=> b!665697 m!636133))

(assert (=> b!665697 m!636135))

(declare-fun m!636155 () Bool)

(assert (=> b!665697 m!636155))

(declare-fun m!636157 () Bool)

(assert (=> b!665697 m!636157))

(assert (=> b!665697 m!636135))

(assert (=> b!665697 m!636155))

(assert (=> b!665697 m!636143))

(assert (=> b!665697 m!636153))

(declare-fun m!636159 () Bool)

(assert (=> b!665689 m!636159))

(declare-fun m!636161 () Bool)

(assert (=> start!59972 m!636161))

(declare-fun m!636163 () Bool)

(assert (=> b!665692 m!636163))

(declare-fun m!636165 () Bool)

(assert (=> b!665691 m!636165))

(check-sat (not b!665701) (not b!665691) (not b!665687) (not b!665692) (not b!665689) (not b!665704) (not b!665693) (not start!59972) (not b!665686) (not b!665682) (not b!665703) (not b!665697) (not b!665706) (not b!665690) (not b!665698) (not b!665696) (not b!665702) (not b!665688) (not b!665685))
(check-sat)
