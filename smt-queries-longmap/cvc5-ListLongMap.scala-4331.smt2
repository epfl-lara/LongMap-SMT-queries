; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60014 () Bool)

(assert start!60014)

(declare-fun b!667103 () Bool)

(declare-fun res!434371 () Bool)

(declare-fun e!381897 () Bool)

(assert (=> b!667103 (=> (not res!434371) (not e!381897))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((array!39061 0))(
  ( (array!39062 (arr!18723 (Array (_ BitVec 32) (_ BitVec 64))) (size!19087 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39061)

(assert (=> b!667103 (= res!434371 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19087 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!667104 () Bool)

(declare-fun e!381896 () Bool)

(assert (=> b!667104 (= e!381896 true)))

(declare-fun lt!310691 () Bool)

(declare-datatypes ((List!12764 0))(
  ( (Nil!12761) (Cons!12760 (h!13805 (_ BitVec 64)) (t!18992 List!12764)) )
))
(declare-fun lt!310693 () List!12764)

(declare-fun contains!3341 (List!12764 (_ BitVec 64)) Bool)

(assert (=> b!667104 (= lt!310691 (contains!3341 lt!310693 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667105 () Bool)

(declare-fun res!434378 () Bool)

(assert (=> b!667105 (=> res!434378 e!381896)))

(declare-fun acc!681 () List!12764)

(declare-fun subseq!80 (List!12764 List!12764) Bool)

(assert (=> b!667105 (= res!434378 (not (subseq!80 acc!681 lt!310693)))))

(declare-fun b!667106 () Bool)

(declare-fun res!434368 () Bool)

(assert (=> b!667106 (=> res!434368 e!381896)))

(assert (=> b!667106 (= res!434368 (contains!3341 lt!310693 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667107 () Bool)

(declare-fun res!434379 () Bool)

(assert (=> b!667107 (=> (not res!434379) (not e!381897))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!667107 (= res!434379 (validKeyInArray!0 k!2843))))

(declare-fun b!667108 () Bool)

(declare-datatypes ((Unit!23340 0))(
  ( (Unit!23341) )
))
(declare-fun e!381890 () Unit!23340)

(declare-fun Unit!23342 () Unit!23340)

(assert (=> b!667108 (= e!381890 Unit!23342)))

(declare-fun b!667109 () Bool)

(assert (=> b!667109 (= e!381897 (not e!381896))))

(declare-fun res!434384 () Bool)

(assert (=> b!667109 (=> res!434384 e!381896)))

(assert (=> b!667109 (= res!434384 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!78 (List!12764 (_ BitVec 64)) List!12764)

(assert (=> b!667109 (= (-!78 lt!310693 k!2843) acc!681)))

(declare-fun $colon$colon!212 (List!12764 (_ BitVec 64)) List!12764)

(assert (=> b!667109 (= lt!310693 ($colon$colon!212 acc!681 k!2843))))

(declare-fun lt!310688 () Unit!23340)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12764) Unit!23340)

(assert (=> b!667109 (= lt!310688 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!667109 (subseq!80 acc!681 acc!681)))

(declare-fun lt!310690 () Unit!23340)

(declare-fun lemmaListSubSeqRefl!0 (List!12764) Unit!23340)

(assert (=> b!667109 (= lt!310690 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun arrayNoDuplicates!0 (array!39061 (_ BitVec 32) List!12764) Bool)

(assert (=> b!667109 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310685 () Unit!23340)

(declare-fun e!381892 () Unit!23340)

(assert (=> b!667109 (= lt!310685 e!381892)))

(declare-fun c!76736 () Bool)

(assert (=> b!667109 (= c!76736 (validKeyInArray!0 (select (arr!18723 a!3626) from!3004)))))

(declare-fun lt!310686 () Unit!23340)

(assert (=> b!667109 (= lt!310686 e!381890)))

(declare-fun c!76735 () Bool)

(declare-fun lt!310687 () Bool)

(assert (=> b!667109 (= c!76735 lt!310687)))

(declare-fun arrayContainsKey!0 (array!39061 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!667109 (= lt!310687 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667109 (arrayContainsKey!0 (array!39062 (store (arr!18723 a!3626) i!1382 k!2843) (size!19087 a!3626)) k!2843 from!3004)))

(declare-fun b!667110 () Bool)

(declare-fun res!434387 () Bool)

(assert (=> b!667110 (=> res!434387 e!381896)))

(assert (=> b!667110 (= res!434387 (contains!3341 acc!681 k!2843))))

(declare-fun b!667112 () Bool)

(declare-fun res!434386 () Bool)

(assert (=> b!667112 (=> res!434386 e!381896)))

(declare-fun noDuplicate!588 (List!12764) Bool)

(assert (=> b!667112 (= res!434386 (not (noDuplicate!588 lt!310693)))))

(declare-fun b!667113 () Bool)

(declare-fun Unit!23343 () Unit!23340)

(assert (=> b!667113 (= e!381892 Unit!23343)))

(declare-fun b!667114 () Bool)

(declare-fun e!381894 () Bool)

(assert (=> b!667114 (= e!381894 (not (contains!3341 acc!681 k!2843)))))

(declare-fun b!667115 () Bool)

(declare-fun res!434381 () Bool)

(assert (=> b!667115 (=> res!434381 e!381896)))

(assert (=> b!667115 (= res!434381 lt!310687)))

(declare-fun b!667116 () Bool)

(declare-fun res!434372 () Bool)

(assert (=> b!667116 (=> (not res!434372) (not e!381897))))

(assert (=> b!667116 (= res!434372 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12761))))

(declare-fun b!667117 () Bool)

(declare-fun res!434373 () Bool)

(assert (=> b!667117 (=> (not res!434373) (not e!381897))))

(assert (=> b!667117 (= res!434373 (not (contains!3341 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667118 () Bool)

(declare-fun e!381893 () Bool)

(assert (=> b!667118 (= e!381893 (contains!3341 acc!681 k!2843))))

(declare-fun b!667119 () Bool)

(declare-fun e!381891 () Bool)

(assert (=> b!667119 (= e!381891 e!381894)))

(declare-fun res!434383 () Bool)

(assert (=> b!667119 (=> (not res!434383) (not e!381894))))

(assert (=> b!667119 (= res!434383 (bvsle from!3004 i!1382))))

(declare-fun b!667120 () Bool)

(declare-fun res!434382 () Bool)

(assert (=> b!667120 (=> (not res!434382) (not e!381897))))

(assert (=> b!667120 (= res!434382 (not (contains!3341 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667121 () Bool)

(declare-fun res!434374 () Bool)

(assert (=> b!667121 (=> (not res!434374) (not e!381897))))

(assert (=> b!667121 (= res!434374 (noDuplicate!588 acc!681))))

(declare-fun b!667122 () Bool)

(declare-fun res!434370 () Bool)

(assert (=> b!667122 (=> (not res!434370) (not e!381897))))

(assert (=> b!667122 (= res!434370 e!381891)))

(declare-fun res!434367 () Bool)

(assert (=> b!667122 (=> res!434367 e!381891)))

(assert (=> b!667122 (= res!434367 e!381893)))

(declare-fun res!434385 () Bool)

(assert (=> b!667122 (=> (not res!434385) (not e!381893))))

(assert (=> b!667122 (= res!434385 (bvsgt from!3004 i!1382))))

(declare-fun b!667123 () Bool)

(declare-fun res!434375 () Bool)

(assert (=> b!667123 (=> (not res!434375) (not e!381897))))

(assert (=> b!667123 (= res!434375 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!667124 () Bool)

(declare-fun res!434369 () Bool)

(assert (=> b!667124 (=> (not res!434369) (not e!381897))))

(assert (=> b!667124 (= res!434369 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19087 a!3626))))))

(declare-fun b!667125 () Bool)

(declare-fun Unit!23344 () Unit!23340)

(assert (=> b!667125 (= e!381890 Unit!23344)))

(declare-fun lt!310692 () Unit!23340)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39061 (_ BitVec 64) (_ BitVec 32)) Unit!23340)

(assert (=> b!667125 (= lt!310692 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!667125 false))

(declare-fun b!667111 () Bool)

(declare-fun res!434376 () Bool)

(assert (=> b!667111 (=> (not res!434376) (not e!381897))))

(assert (=> b!667111 (= res!434376 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!434377 () Bool)

(assert (=> start!60014 (=> (not res!434377) (not e!381897))))

(assert (=> start!60014 (= res!434377 (and (bvslt (size!19087 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19087 a!3626))))))

(assert (=> start!60014 e!381897))

(assert (=> start!60014 true))

(declare-fun array_inv!14519 (array!39061) Bool)

(assert (=> start!60014 (array_inv!14519 a!3626)))

(declare-fun b!667126 () Bool)

(declare-fun res!434380 () Bool)

(assert (=> b!667126 (=> res!434380 e!381896)))

(assert (=> b!667126 (= res!434380 (not (contains!3341 lt!310693 k!2843)))))

(declare-fun b!667127 () Bool)

(declare-fun lt!310684 () Unit!23340)

(assert (=> b!667127 (= e!381892 lt!310684)))

(declare-fun lt!310689 () Unit!23340)

(assert (=> b!667127 (= lt!310689 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667127 (subseq!80 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39061 List!12764 List!12764 (_ BitVec 32)) Unit!23340)

(assert (=> b!667127 (= lt!310684 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!212 acc!681 (select (arr!18723 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667127 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(assert (= (and start!60014 res!434377) b!667121))

(assert (= (and b!667121 res!434374) b!667117))

(assert (= (and b!667117 res!434373) b!667120))

(assert (= (and b!667120 res!434382) b!667122))

(assert (= (and b!667122 res!434385) b!667118))

(assert (= (and b!667122 (not res!434367)) b!667119))

(assert (= (and b!667119 res!434383) b!667114))

(assert (= (and b!667122 res!434370) b!667116))

(assert (= (and b!667116 res!434372) b!667123))

(assert (= (and b!667123 res!434375) b!667124))

(assert (= (and b!667124 res!434369) b!667107))

(assert (= (and b!667107 res!434379) b!667111))

(assert (= (and b!667111 res!434376) b!667103))

(assert (= (and b!667103 res!434371) b!667109))

(assert (= (and b!667109 c!76735) b!667125))

(assert (= (and b!667109 (not c!76735)) b!667108))

(assert (= (and b!667109 c!76736) b!667127))

(assert (= (and b!667109 (not c!76736)) b!667113))

(assert (= (and b!667109 (not res!434384)) b!667112))

(assert (= (and b!667112 (not res!434386)) b!667115))

(assert (= (and b!667115 (not res!434381)) b!667110))

(assert (= (and b!667110 (not res!434387)) b!667105))

(assert (= (and b!667105 (not res!434378)) b!667126))

(assert (= (and b!667126 (not res!434380)) b!667106))

(assert (= (and b!667106 (not res!434368)) b!667104))

(declare-fun m!637733 () Bool)

(assert (=> b!667121 m!637733))

(declare-fun m!637735 () Bool)

(assert (=> b!667120 m!637735))

(declare-fun m!637737 () Bool)

(assert (=> b!667125 m!637737))

(declare-fun m!637739 () Bool)

(assert (=> b!667109 m!637739))

(declare-fun m!637741 () Bool)

(assert (=> b!667109 m!637741))

(declare-fun m!637743 () Bool)

(assert (=> b!667109 m!637743))

(declare-fun m!637745 () Bool)

(assert (=> b!667109 m!637745))

(declare-fun m!637747 () Bool)

(assert (=> b!667109 m!637747))

(declare-fun m!637749 () Bool)

(assert (=> b!667109 m!637749))

(declare-fun m!637751 () Bool)

(assert (=> b!667109 m!637751))

(declare-fun m!637753 () Bool)

(assert (=> b!667109 m!637753))

(assert (=> b!667109 m!637743))

(declare-fun m!637755 () Bool)

(assert (=> b!667109 m!637755))

(declare-fun m!637757 () Bool)

(assert (=> b!667109 m!637757))

(declare-fun m!637759 () Bool)

(assert (=> b!667109 m!637759))

(declare-fun m!637761 () Bool)

(assert (=> b!667111 m!637761))

(declare-fun m!637763 () Bool)

(assert (=> b!667116 m!637763))

(declare-fun m!637765 () Bool)

(assert (=> b!667112 m!637765))

(declare-fun m!637767 () Bool)

(assert (=> b!667106 m!637767))

(declare-fun m!637769 () Bool)

(assert (=> b!667126 m!637769))

(declare-fun m!637771 () Bool)

(assert (=> b!667104 m!637771))

(assert (=> b!667127 m!637741))

(assert (=> b!667127 m!637743))

(declare-fun m!637773 () Bool)

(assert (=> b!667127 m!637773))

(declare-fun m!637775 () Bool)

(assert (=> b!667127 m!637775))

(assert (=> b!667127 m!637743))

(assert (=> b!667127 m!637773))

(assert (=> b!667127 m!637749))

(assert (=> b!667127 m!637759))

(declare-fun m!637777 () Bool)

(assert (=> b!667117 m!637777))

(declare-fun m!637779 () Bool)

(assert (=> b!667107 m!637779))

(declare-fun m!637781 () Bool)

(assert (=> start!60014 m!637781))

(declare-fun m!637783 () Bool)

(assert (=> b!667114 m!637783))

(assert (=> b!667118 m!637783))

(declare-fun m!637785 () Bool)

(assert (=> b!667105 m!637785))

(declare-fun m!637787 () Bool)

(assert (=> b!667123 m!637787))

(assert (=> b!667110 m!637783))

(push 1)

(assert (not b!667118))

(assert (not b!667127))

(assert (not b!667110))

(assert (not b!667111))

(assert (not b!667109))

(assert (not b!667104))

(assert (not b!667105))

(assert (not start!60014))

(assert (not b!667116))

(assert (not b!667125))

(assert (not b!667123))

(assert (not b!667106))

(assert (not b!667117))

(assert (not b!667107))

(assert (not b!667114))

(assert (not b!667121))

(assert (not b!667126))

(assert (not b!667120))

(assert (not b!667112))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

