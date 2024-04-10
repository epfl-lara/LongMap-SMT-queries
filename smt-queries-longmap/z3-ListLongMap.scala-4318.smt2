; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59938 () Bool)

(assert start!59938)

(declare-fun b!664253 () Bool)

(declare-fun res!431978 () Bool)

(declare-fun e!380980 () Bool)

(assert (=> b!664253 (=> (not res!431978) (not e!380980))))

(declare-datatypes ((array!38985 0))(
  ( (array!38986 (arr!18685 (Array (_ BitVec 32) (_ BitVec 64))) (size!19049 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38985)

(declare-datatypes ((List!12726 0))(
  ( (Nil!12723) (Cons!12722 (h!13767 (_ BitVec 64)) (t!18954 List!12726)) )
))
(declare-fun arrayNoDuplicates!0 (array!38985 (_ BitVec 32) List!12726) Bool)

(assert (=> b!664253 (= res!431978 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12723))))

(declare-fun b!664254 () Bool)

(declare-fun res!431980 () Bool)

(declare-fun e!380979 () Bool)

(assert (=> b!664254 (=> res!431980 e!380979)))

(declare-fun acc!681 () List!12726)

(declare-fun lt!309548 () List!12726)

(declare-fun subseq!42 (List!12726 List!12726) Bool)

(assert (=> b!664254 (= res!431980 (not (subseq!42 acc!681 lt!309548)))))

(declare-fun res!431988 () Bool)

(assert (=> start!59938 (=> (not res!431988) (not e!380980))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59938 (= res!431988 (and (bvslt (size!19049 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19049 a!3626))))))

(assert (=> start!59938 e!380980))

(assert (=> start!59938 true))

(declare-fun array_inv!14481 (array!38985) Bool)

(assert (=> start!59938 (array_inv!14481 a!3626)))

(declare-fun b!664255 () Bool)

(declare-fun res!431992 () Bool)

(assert (=> b!664255 (=> (not res!431992) (not e!380980))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!664255 (= res!431992 (validKeyInArray!0 k0!2843))))

(declare-fun b!664256 () Bool)

(declare-fun res!431986 () Bool)

(assert (=> b!664256 (=> res!431986 e!380979)))

(declare-fun contains!3303 (List!12726 (_ BitVec 64)) Bool)

(assert (=> b!664256 (= res!431986 (not (contains!3303 lt!309548 k0!2843)))))

(declare-fun b!664257 () Bool)

(declare-datatypes ((Unit!23150 0))(
  ( (Unit!23151) )
))
(declare-fun e!380981 () Unit!23150)

(declare-fun Unit!23152 () Unit!23150)

(assert (=> b!664257 (= e!380981 Unit!23152)))

(declare-fun b!664258 () Bool)

(assert (=> b!664258 (= e!380980 (not e!380979))))

(declare-fun res!431977 () Bool)

(assert (=> b!664258 (=> res!431977 e!380979)))

(assert (=> b!664258 (= res!431977 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!40 (List!12726 (_ BitVec 64)) List!12726)

(assert (=> b!664258 (= (-!40 lt!309548 k0!2843) acc!681)))

(declare-fun $colon$colon!174 (List!12726 (_ BitVec 64)) List!12726)

(assert (=> b!664258 (= lt!309548 ($colon$colon!174 acc!681 k0!2843))))

(declare-fun lt!309551 () Unit!23150)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12726) Unit!23150)

(assert (=> b!664258 (= lt!309551 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!664258 (subseq!42 acc!681 acc!681)))

(declare-fun lt!309544 () Unit!23150)

(declare-fun lemmaListSubSeqRefl!0 (List!12726) Unit!23150)

(assert (=> b!664258 (= lt!309544 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!664258 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309545 () Unit!23150)

(assert (=> b!664258 (= lt!309545 e!380981)))

(declare-fun c!76507 () Bool)

(assert (=> b!664258 (= c!76507 (validKeyInArray!0 (select (arr!18685 a!3626) from!3004)))))

(declare-fun lt!309552 () Unit!23150)

(declare-fun e!380985 () Unit!23150)

(assert (=> b!664258 (= lt!309552 e!380985)))

(declare-fun c!76508 () Bool)

(declare-fun lt!309546 () Bool)

(assert (=> b!664258 (= c!76508 lt!309546)))

(declare-fun arrayContainsKey!0 (array!38985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!664258 (= lt!309546 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!664258 (arrayContainsKey!0 (array!38986 (store (arr!18685 a!3626) i!1382 k0!2843) (size!19049 a!3626)) k0!2843 from!3004)))

(declare-fun b!664259 () Bool)

(declare-fun e!380984 () Bool)

(declare-fun e!380982 () Bool)

(assert (=> b!664259 (= e!380984 e!380982)))

(declare-fun res!431990 () Bool)

(assert (=> b!664259 (=> (not res!431990) (not e!380982))))

(assert (=> b!664259 (= res!431990 (bvsle from!3004 i!1382))))

(declare-fun b!664260 () Bool)

(declare-fun e!380983 () Bool)

(assert (=> b!664260 (= e!380983 (contains!3303 acc!681 k0!2843))))

(declare-fun b!664261 () Bool)

(declare-fun Unit!23153 () Unit!23150)

(assert (=> b!664261 (= e!380985 Unit!23153)))

(declare-fun b!664262 () Bool)

(declare-fun res!431987 () Bool)

(assert (=> b!664262 (=> res!431987 e!380979)))

(assert (=> b!664262 (= res!431987 (contains!3303 acc!681 k0!2843))))

(declare-fun b!664263 () Bool)

(declare-fun lt!309549 () Unit!23150)

(assert (=> b!664263 (= e!380981 lt!309549)))

(declare-fun lt!309553 () Unit!23150)

(assert (=> b!664263 (= lt!309553 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!664263 (subseq!42 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38985 List!12726 List!12726 (_ BitVec 32)) Unit!23150)

(assert (=> b!664263 (= lt!309549 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!174 acc!681 (select (arr!18685 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664263 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!664264 () Bool)

(assert (=> b!664264 (= e!380979 true)))

(declare-fun lt!309550 () Bool)

(assert (=> b!664264 (= lt!309550 (contains!3303 lt!309548 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664265 () Bool)

(declare-fun res!431982 () Bool)

(assert (=> b!664265 (=> (not res!431982) (not e!380980))))

(assert (=> b!664265 (= res!431982 (not (contains!3303 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664266 () Bool)

(declare-fun res!431993 () Bool)

(assert (=> b!664266 (=> (not res!431993) (not e!380980))))

(assert (=> b!664266 (= res!431993 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19049 a!3626))))))

(declare-fun b!664267 () Bool)

(declare-fun res!431979 () Bool)

(assert (=> b!664267 (=> (not res!431979) (not e!380980))))

(assert (=> b!664267 (= res!431979 (not (contains!3303 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664268 () Bool)

(declare-fun res!431976 () Bool)

(assert (=> b!664268 (=> res!431976 e!380979)))

(assert (=> b!664268 (= res!431976 lt!309546)))

(declare-fun b!664269 () Bool)

(declare-fun res!431975 () Bool)

(assert (=> b!664269 (=> res!431975 e!380979)))

(assert (=> b!664269 (= res!431975 (contains!3303 lt!309548 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664270 () Bool)

(declare-fun res!431983 () Bool)

(assert (=> b!664270 (=> (not res!431983) (not e!380980))))

(assert (=> b!664270 (= res!431983 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19049 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!664271 () Bool)

(declare-fun res!431974 () Bool)

(assert (=> b!664271 (=> (not res!431974) (not e!380980))))

(assert (=> b!664271 (= res!431974 e!380984)))

(declare-fun res!431985 () Bool)

(assert (=> b!664271 (=> res!431985 e!380984)))

(assert (=> b!664271 (= res!431985 e!380983)))

(declare-fun res!431984 () Bool)

(assert (=> b!664271 (=> (not res!431984) (not e!380983))))

(assert (=> b!664271 (= res!431984 (bvsgt from!3004 i!1382))))

(declare-fun b!664272 () Bool)

(declare-fun res!431973 () Bool)

(assert (=> b!664272 (=> (not res!431973) (not e!380980))))

(declare-fun noDuplicate!550 (List!12726) Bool)

(assert (=> b!664272 (= res!431973 (noDuplicate!550 acc!681))))

(declare-fun b!664273 () Bool)

(assert (=> b!664273 (= e!380982 (not (contains!3303 acc!681 k0!2843)))))

(declare-fun b!664274 () Bool)

(declare-fun res!431981 () Bool)

(assert (=> b!664274 (=> (not res!431981) (not e!380980))))

(assert (=> b!664274 (= res!431981 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!664275 () Bool)

(declare-fun res!431989 () Bool)

(assert (=> b!664275 (=> (not res!431989) (not e!380980))))

(assert (=> b!664275 (= res!431989 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!664276 () Bool)

(declare-fun Unit!23154 () Unit!23150)

(assert (=> b!664276 (= e!380985 Unit!23154)))

(declare-fun lt!309547 () Unit!23150)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38985 (_ BitVec 64) (_ BitVec 32)) Unit!23150)

(assert (=> b!664276 (= lt!309547 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!664276 false))

(declare-fun b!664277 () Bool)

(declare-fun res!431991 () Bool)

(assert (=> b!664277 (=> res!431991 e!380979)))

(assert (=> b!664277 (= res!431991 (not (noDuplicate!550 lt!309548)))))

(assert (= (and start!59938 res!431988) b!664272))

(assert (= (and b!664272 res!431973) b!664265))

(assert (= (and b!664265 res!431982) b!664267))

(assert (= (and b!664267 res!431979) b!664271))

(assert (= (and b!664271 res!431984) b!664260))

(assert (= (and b!664271 (not res!431985)) b!664259))

(assert (= (and b!664259 res!431990) b!664273))

(assert (= (and b!664271 res!431974) b!664253))

(assert (= (and b!664253 res!431978) b!664274))

(assert (= (and b!664274 res!431981) b!664266))

(assert (= (and b!664266 res!431993) b!664255))

(assert (= (and b!664255 res!431992) b!664275))

(assert (= (and b!664275 res!431989) b!664270))

(assert (= (and b!664270 res!431983) b!664258))

(assert (= (and b!664258 c!76508) b!664276))

(assert (= (and b!664258 (not c!76508)) b!664261))

(assert (= (and b!664258 c!76507) b!664263))

(assert (= (and b!664258 (not c!76507)) b!664257))

(assert (= (and b!664258 (not res!431977)) b!664277))

(assert (= (and b!664277 (not res!431991)) b!664268))

(assert (= (and b!664268 (not res!431976)) b!664262))

(assert (= (and b!664262 (not res!431987)) b!664254))

(assert (= (and b!664254 (not res!431980)) b!664256))

(assert (= (and b!664256 (not res!431986)) b!664269))

(assert (= (and b!664269 (not res!431975)) b!664264))

(declare-fun m!635605 () Bool)

(assert (=> b!664258 m!635605))

(declare-fun m!635607 () Bool)

(assert (=> b!664258 m!635607))

(declare-fun m!635609 () Bool)

(assert (=> b!664258 m!635609))

(declare-fun m!635611 () Bool)

(assert (=> b!664258 m!635611))

(declare-fun m!635613 () Bool)

(assert (=> b!664258 m!635613))

(declare-fun m!635615 () Bool)

(assert (=> b!664258 m!635615))

(declare-fun m!635617 () Bool)

(assert (=> b!664258 m!635617))

(declare-fun m!635619 () Bool)

(assert (=> b!664258 m!635619))

(assert (=> b!664258 m!635609))

(declare-fun m!635621 () Bool)

(assert (=> b!664258 m!635621))

(declare-fun m!635623 () Bool)

(assert (=> b!664258 m!635623))

(declare-fun m!635625 () Bool)

(assert (=> b!664258 m!635625))

(declare-fun m!635627 () Bool)

(assert (=> b!664253 m!635627))

(declare-fun m!635629 () Bool)

(assert (=> start!59938 m!635629))

(assert (=> b!664263 m!635607))

(assert (=> b!664263 m!635609))

(declare-fun m!635631 () Bool)

(assert (=> b!664263 m!635631))

(declare-fun m!635633 () Bool)

(assert (=> b!664263 m!635633))

(assert (=> b!664263 m!635609))

(assert (=> b!664263 m!635631))

(assert (=> b!664263 m!635615))

(assert (=> b!664263 m!635625))

(declare-fun m!635635 () Bool)

(assert (=> b!664262 m!635635))

(declare-fun m!635637 () Bool)

(assert (=> b!664254 m!635637))

(declare-fun m!635639 () Bool)

(assert (=> b!664269 m!635639))

(assert (=> b!664273 m!635635))

(declare-fun m!635641 () Bool)

(assert (=> b!664272 m!635641))

(declare-fun m!635643 () Bool)

(assert (=> b!664264 m!635643))

(declare-fun m!635645 () Bool)

(assert (=> b!664277 m!635645))

(declare-fun m!635647 () Bool)

(assert (=> b!664274 m!635647))

(declare-fun m!635649 () Bool)

(assert (=> b!664256 m!635649))

(declare-fun m!635651 () Bool)

(assert (=> b!664275 m!635651))

(declare-fun m!635653 () Bool)

(assert (=> b!664255 m!635653))

(declare-fun m!635655 () Bool)

(assert (=> b!664276 m!635655))

(declare-fun m!635657 () Bool)

(assert (=> b!664267 m!635657))

(declare-fun m!635659 () Bool)

(assert (=> b!664265 m!635659))

(assert (=> b!664260 m!635635))

(check-sat (not start!59938) (not b!664260) (not b!664256) (not b!664255) (not b!664262) (not b!664272) (not b!664263) (not b!664258) (not b!664265) (not b!664274) (not b!664264) (not b!664253) (not b!664275) (not b!664269) (not b!664254) (not b!664273) (not b!664267) (not b!664277) (not b!664276))
(check-sat)
