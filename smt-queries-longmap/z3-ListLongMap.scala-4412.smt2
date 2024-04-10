; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60886 () Bool)

(assert start!60886)

(declare-fun res!448967 () Bool)

(declare-fun e!389127 () Bool)

(assert (=> start!60886 (=> (not res!448967) (not e!389127))))

(declare-datatypes ((array!39570 0))(
  ( (array!39571 (arr!18967 (Array (_ BitVec 32) (_ BitVec 64))) (size!19331 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39570)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60886 (= res!448967 (and (bvslt (size!19331 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19331 a!3626))))))

(assert (=> start!60886 e!389127))

(assert (=> start!60886 true))

(declare-fun array_inv!14763 (array!39570) Bool)

(assert (=> start!60886 (array_inv!14763 a!3626)))

(declare-fun b!683109 () Bool)

(declare-datatypes ((Unit!24002 0))(
  ( (Unit!24003) )
))
(declare-fun e!389129 () Unit!24002)

(declare-fun Unit!24004 () Unit!24002)

(assert (=> b!683109 (= e!389129 Unit!24004)))

(declare-fun b!683110 () Bool)

(declare-fun res!448962 () Bool)

(assert (=> b!683110 (=> (not res!448962) (not e!389127))))

(declare-datatypes ((List!13008 0))(
  ( (Nil!13005) (Cons!13004 (h!14049 (_ BitVec 64)) (t!19251 List!13008)) )
))
(declare-fun arrayNoDuplicates!0 (array!39570 (_ BitVec 32) List!13008) Bool)

(assert (=> b!683110 (= res!448962 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13005))))

(declare-fun b!683111 () Bool)

(declare-fun res!448964 () Bool)

(assert (=> b!683111 (=> (not res!448964) (not e!389127))))

(declare-fun e!389132 () Bool)

(assert (=> b!683111 (= res!448964 e!389132)))

(declare-fun res!448961 () Bool)

(assert (=> b!683111 (=> res!448961 e!389132)))

(declare-fun e!389133 () Bool)

(assert (=> b!683111 (= res!448961 e!389133)))

(declare-fun res!448970 () Bool)

(assert (=> b!683111 (=> (not res!448970) (not e!389133))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!683111 (= res!448970 (bvsgt from!3004 i!1382))))

(declare-fun b!683112 () Bool)

(declare-fun e!389130 () Bool)

(declare-fun acc!681 () List!13008)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3585 (List!13008 (_ BitVec 64)) Bool)

(assert (=> b!683112 (= e!389130 (not (contains!3585 acc!681 k0!2843)))))

(declare-fun b!683113 () Bool)

(declare-fun res!448960 () Bool)

(assert (=> b!683113 (=> (not res!448960) (not e!389127))))

(assert (=> b!683113 (= res!448960 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!683114 () Bool)

(declare-fun res!448969 () Bool)

(assert (=> b!683114 (=> (not res!448969) (not e!389127))))

(declare-fun arrayContainsKey!0 (array!39570 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!683114 (= res!448969 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!683115 () Bool)

(declare-fun res!448968 () Bool)

(assert (=> b!683115 (=> (not res!448968) (not e!389127))))

(assert (=> b!683115 (= res!448968 (not (contains!3585 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683116 () Bool)

(declare-fun res!448965 () Bool)

(assert (=> b!683116 (=> (not res!448965) (not e!389127))))

(assert (=> b!683116 (= res!448965 (not (contains!3585 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683117 () Bool)

(declare-fun e!389128 () Unit!24002)

(declare-fun Unit!24005 () Unit!24002)

(assert (=> b!683117 (= e!389128 Unit!24005)))

(declare-fun b!683118 () Bool)

(assert (=> b!683118 (= e!389132 e!389130)))

(declare-fun res!448966 () Bool)

(assert (=> b!683118 (=> (not res!448966) (not e!389130))))

(assert (=> b!683118 (= res!448966 (bvsle from!3004 i!1382))))

(declare-fun b!683119 () Bool)

(declare-fun res!448957 () Bool)

(assert (=> b!683119 (=> (not res!448957) (not e!389127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!683119 (= res!448957 (validKeyInArray!0 k0!2843))))

(declare-fun b!683120 () Bool)

(assert (=> b!683120 (= e!389127 (not true))))

(declare-fun -!136 (List!13008 (_ BitVec 64)) List!13008)

(declare-fun $colon$colon!336 (List!13008 (_ BitVec 64)) List!13008)

(assert (=> b!683120 (= (-!136 ($colon$colon!336 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!313778 () Unit!24002)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13008) Unit!24002)

(assert (=> b!683120 (= lt!313778 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!171 (List!13008 List!13008) Bool)

(assert (=> b!683120 (subseq!171 acc!681 acc!681)))

(declare-fun lt!313780 () Unit!24002)

(declare-fun lemmaListSubSeqRefl!0 (List!13008) Unit!24002)

(assert (=> b!683120 (= lt!313780 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683120 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313779 () Unit!24002)

(assert (=> b!683120 (= lt!313779 e!389128)))

(declare-fun c!77443 () Bool)

(assert (=> b!683120 (= c!77443 (validKeyInArray!0 (select (arr!18967 a!3626) from!3004)))))

(declare-fun lt!313774 () Unit!24002)

(assert (=> b!683120 (= lt!313774 e!389129)))

(declare-fun c!77444 () Bool)

(assert (=> b!683120 (= c!77444 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683120 (arrayContainsKey!0 (array!39571 (store (arr!18967 a!3626) i!1382 k0!2843) (size!19331 a!3626)) k0!2843 from!3004)))

(declare-fun b!683121 () Bool)

(declare-fun lt!313776 () Unit!24002)

(assert (=> b!683121 (= e!389128 lt!313776)))

(declare-fun lt!313777 () Unit!24002)

(assert (=> b!683121 (= lt!313777 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683121 (subseq!171 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39570 List!13008 List!13008 (_ BitVec 32)) Unit!24002)

(assert (=> b!683121 (= lt!313776 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!336 acc!681 (select (arr!18967 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683121 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!683122 () Bool)

(declare-fun res!448959 () Bool)

(assert (=> b!683122 (=> (not res!448959) (not e!389127))))

(assert (=> b!683122 (= res!448959 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19331 a!3626))))))

(declare-fun b!683123 () Bool)

(declare-fun Unit!24006 () Unit!24002)

(assert (=> b!683123 (= e!389129 Unit!24006)))

(declare-fun lt!313775 () Unit!24002)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39570 (_ BitVec 64) (_ BitVec 32)) Unit!24002)

(assert (=> b!683123 (= lt!313775 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!683123 false))

(declare-fun b!683124 () Bool)

(assert (=> b!683124 (= e!389133 (contains!3585 acc!681 k0!2843))))

(declare-fun b!683125 () Bool)

(declare-fun res!448958 () Bool)

(assert (=> b!683125 (=> (not res!448958) (not e!389127))))

(assert (=> b!683125 (= res!448958 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19331 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!683126 () Bool)

(declare-fun res!448963 () Bool)

(assert (=> b!683126 (=> (not res!448963) (not e!389127))))

(declare-fun noDuplicate!832 (List!13008) Bool)

(assert (=> b!683126 (= res!448963 (noDuplicate!832 acc!681))))

(assert (= (and start!60886 res!448967) b!683126))

(assert (= (and b!683126 res!448963) b!683115))

(assert (= (and b!683115 res!448968) b!683116))

(assert (= (and b!683116 res!448965) b!683111))

(assert (= (and b!683111 res!448970) b!683124))

(assert (= (and b!683111 (not res!448961)) b!683118))

(assert (= (and b!683118 res!448966) b!683112))

(assert (= (and b!683111 res!448964) b!683110))

(assert (= (and b!683110 res!448962) b!683113))

(assert (= (and b!683113 res!448960) b!683122))

(assert (= (and b!683122 res!448959) b!683119))

(assert (= (and b!683119 res!448957) b!683114))

(assert (= (and b!683114 res!448969) b!683125))

(assert (= (and b!683125 res!448958) b!683120))

(assert (= (and b!683120 c!77444) b!683123))

(assert (= (and b!683120 (not c!77444)) b!683109))

(assert (= (and b!683120 c!77443) b!683121))

(assert (= (and b!683120 (not c!77443)) b!683117))

(declare-fun m!647697 () Bool)

(assert (=> b!683116 m!647697))

(declare-fun m!647699 () Bool)

(assert (=> b!683112 m!647699))

(declare-fun m!647701 () Bool)

(assert (=> b!683110 m!647701))

(declare-fun m!647703 () Bool)

(assert (=> b!683119 m!647703))

(declare-fun m!647705 () Bool)

(assert (=> b!683113 m!647705))

(declare-fun m!647707 () Bool)

(assert (=> b!683126 m!647707))

(declare-fun m!647709 () Bool)

(assert (=> b!683114 m!647709))

(declare-fun m!647711 () Bool)

(assert (=> b!683123 m!647711))

(declare-fun m!647713 () Bool)

(assert (=> b!683115 m!647713))

(declare-fun m!647715 () Bool)

(assert (=> b!683120 m!647715))

(declare-fun m!647717 () Bool)

(assert (=> b!683120 m!647717))

(declare-fun m!647719 () Bool)

(assert (=> b!683120 m!647719))

(declare-fun m!647721 () Bool)

(assert (=> b!683120 m!647721))

(declare-fun m!647723 () Bool)

(assert (=> b!683120 m!647723))

(declare-fun m!647725 () Bool)

(assert (=> b!683120 m!647725))

(declare-fun m!647727 () Bool)

(assert (=> b!683120 m!647727))

(declare-fun m!647729 () Bool)

(assert (=> b!683120 m!647729))

(assert (=> b!683120 m!647715))

(assert (=> b!683120 m!647721))

(declare-fun m!647731 () Bool)

(assert (=> b!683120 m!647731))

(declare-fun m!647733 () Bool)

(assert (=> b!683120 m!647733))

(declare-fun m!647735 () Bool)

(assert (=> b!683120 m!647735))

(declare-fun m!647737 () Bool)

(assert (=> start!60886 m!647737))

(assert (=> b!683124 m!647699))

(assert (=> b!683121 m!647719))

(assert (=> b!683121 m!647721))

(declare-fun m!647739 () Bool)

(assert (=> b!683121 m!647739))

(declare-fun m!647741 () Bool)

(assert (=> b!683121 m!647741))

(assert (=> b!683121 m!647721))

(assert (=> b!683121 m!647739))

(assert (=> b!683121 m!647727))

(assert (=> b!683121 m!647735))

(check-sat (not b!683119) (not b!683124) (not b!683121) (not b!683120) (not b!683110) (not b!683126) (not b!683116) (not b!683115) (not b!683123) (not b!683112) (not start!60886) (not b!683114) (not b!683113))
