; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59976 () Bool)

(assert start!59976)

(declare-fun b!665678 () Bool)

(declare-fun res!433182 () Bool)

(declare-fun e!381441 () Bool)

(assert (=> b!665678 (=> (not res!433182) (not e!381441))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39023 0))(
  ( (array!39024 (arr!18704 (Array (_ BitVec 32) (_ BitVec 64))) (size!19068 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39023)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!665678 (= res!433182 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19068 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!665679 () Bool)

(declare-fun res!433170 () Bool)

(declare-fun e!381435 () Bool)

(assert (=> b!665679 (=> res!433170 e!381435)))

(declare-datatypes ((List!12745 0))(
  ( (Nil!12742) (Cons!12741 (h!13786 (_ BitVec 64)) (t!18973 List!12745)) )
))
(declare-fun lt!310119 () List!12745)

(declare-fun contains!3322 (List!12745 (_ BitVec 64)) Bool)

(assert (=> b!665679 (= res!433170 (contains!3322 lt!310119 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665680 () Bool)

(assert (=> b!665680 (= e!381435 true)))

(declare-fun lt!310120 () Bool)

(assert (=> b!665680 (= lt!310120 (contains!3322 lt!310119 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665681 () Bool)

(declare-fun res!433171 () Bool)

(assert (=> b!665681 (=> (not res!433171) (not e!381441))))

(declare-fun acc!681 () List!12745)

(declare-fun arrayNoDuplicates!0 (array!39023 (_ BitVec 32) List!12745) Bool)

(assert (=> b!665681 (= res!433171 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!665682 () Bool)

(declare-fun e!381434 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!665682 (= e!381434 (not (contains!3322 acc!681 k!2843)))))

(declare-fun b!665683 () Bool)

(declare-fun res!433183 () Bool)

(assert (=> b!665683 (=> res!433183 e!381435)))

(declare-fun noDuplicate!569 (List!12745) Bool)

(assert (=> b!665683 (= res!433183 (not (noDuplicate!569 lt!310119)))))

(declare-fun b!665684 () Bool)

(declare-datatypes ((Unit!23245 0))(
  ( (Unit!23246) )
))
(declare-fun e!381438 () Unit!23245)

(declare-fun Unit!23247 () Unit!23245)

(assert (=> b!665684 (= e!381438 Unit!23247)))

(declare-fun b!665685 () Bool)

(declare-fun res!433189 () Bool)

(assert (=> b!665685 (=> res!433189 e!381435)))

(assert (=> b!665685 (= res!433189 (not (contains!3322 lt!310119 k!2843)))))

(declare-fun b!665686 () Bool)

(declare-fun e!381440 () Unit!23245)

(declare-fun Unit!23248 () Unit!23245)

(assert (=> b!665686 (= e!381440 Unit!23248)))

(declare-fun b!665687 () Bool)

(declare-fun res!433172 () Bool)

(assert (=> b!665687 (=> res!433172 e!381435)))

(assert (=> b!665687 (= res!433172 (contains!3322 acc!681 k!2843))))

(declare-fun b!665689 () Bool)

(declare-fun e!381436 () Bool)

(assert (=> b!665689 (= e!381436 e!381434)))

(declare-fun res!433177 () Bool)

(assert (=> b!665689 (=> (not res!433177) (not e!381434))))

(assert (=> b!665689 (= res!433177 (bvsle from!3004 i!1382))))

(declare-fun b!665690 () Bool)

(declare-fun res!433178 () Bool)

(assert (=> b!665690 (=> (not res!433178) (not e!381441))))

(assert (=> b!665690 (= res!433178 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19068 a!3626))))))

(declare-fun b!665691 () Bool)

(declare-fun res!433188 () Bool)

(assert (=> b!665691 (=> (not res!433188) (not e!381441))))

(assert (=> b!665691 (= res!433188 (noDuplicate!569 acc!681))))

(declare-fun b!665692 () Bool)

(declare-fun res!433187 () Bool)

(assert (=> b!665692 (=> (not res!433187) (not e!381441))))

(assert (=> b!665692 (= res!433187 e!381436)))

(declare-fun res!433181 () Bool)

(assert (=> b!665692 (=> res!433181 e!381436)))

(declare-fun e!381439 () Bool)

(assert (=> b!665692 (= res!433181 e!381439)))

(declare-fun res!433174 () Bool)

(assert (=> b!665692 (=> (not res!433174) (not e!381439))))

(assert (=> b!665692 (= res!433174 (bvsgt from!3004 i!1382))))

(declare-fun b!665693 () Bool)

(declare-fun res!433184 () Bool)

(assert (=> b!665693 (=> res!433184 e!381435)))

(declare-fun lt!310122 () Bool)

(assert (=> b!665693 (= res!433184 lt!310122)))

(declare-fun b!665694 () Bool)

(declare-fun Unit!23249 () Unit!23245)

(assert (=> b!665694 (= e!381440 Unit!23249)))

(declare-fun lt!310114 () Unit!23245)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39023 (_ BitVec 64) (_ BitVec 32)) Unit!23245)

(assert (=> b!665694 (= lt!310114 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!665694 false))

(declare-fun b!665695 () Bool)

(declare-fun res!433175 () Bool)

(assert (=> b!665695 (=> (not res!433175) (not e!381441))))

(assert (=> b!665695 (= res!433175 (not (contains!3322 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665696 () Bool)

(declare-fun res!433180 () Bool)

(assert (=> b!665696 (=> (not res!433180) (not e!381441))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!665696 (= res!433180 (validKeyInArray!0 k!2843))))

(declare-fun b!665697 () Bool)

(declare-fun res!433173 () Bool)

(assert (=> b!665697 (=> (not res!433173) (not e!381441))))

(assert (=> b!665697 (= res!433173 (not (contains!3322 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665698 () Bool)

(declare-fun lt!310117 () Unit!23245)

(assert (=> b!665698 (= e!381438 lt!310117)))

(declare-fun lt!310118 () Unit!23245)

(declare-fun lemmaListSubSeqRefl!0 (List!12745) Unit!23245)

(assert (=> b!665698 (= lt!310118 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!61 (List!12745 List!12745) Bool)

(assert (=> b!665698 (subseq!61 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39023 List!12745 List!12745 (_ BitVec 32)) Unit!23245)

(declare-fun $colon$colon!193 (List!12745 (_ BitVec 64)) List!12745)

(assert (=> b!665698 (= lt!310117 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!193 acc!681 (select (arr!18704 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665698 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!665688 () Bool)

(declare-fun res!433186 () Bool)

(assert (=> b!665688 (=> (not res!433186) (not e!381441))))

(declare-fun arrayContainsKey!0 (array!39023 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!665688 (= res!433186 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!433176 () Bool)

(assert (=> start!59976 (=> (not res!433176) (not e!381441))))

(assert (=> start!59976 (= res!433176 (and (bvslt (size!19068 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19068 a!3626))))))

(assert (=> start!59976 e!381441))

(assert (=> start!59976 true))

(declare-fun array_inv!14500 (array!39023) Bool)

(assert (=> start!59976 (array_inv!14500 a!3626)))

(declare-fun b!665699 () Bool)

(declare-fun res!433185 () Bool)

(assert (=> b!665699 (=> res!433185 e!381435)))

(assert (=> b!665699 (= res!433185 (not (subseq!61 acc!681 lt!310119)))))

(declare-fun b!665700 () Bool)

(assert (=> b!665700 (= e!381441 (not e!381435))))

(declare-fun res!433190 () Bool)

(assert (=> b!665700 (=> res!433190 e!381435)))

(assert (=> b!665700 (= res!433190 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!59 (List!12745 (_ BitVec 64)) List!12745)

(assert (=> b!665700 (= (-!59 lt!310119 k!2843) acc!681)))

(assert (=> b!665700 (= lt!310119 ($colon$colon!193 acc!681 k!2843))))

(declare-fun lt!310121 () Unit!23245)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12745) Unit!23245)

(assert (=> b!665700 (= lt!310121 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!665700 (subseq!61 acc!681 acc!681)))

(declare-fun lt!310115 () Unit!23245)

(assert (=> b!665700 (= lt!310115 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665700 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310116 () Unit!23245)

(assert (=> b!665700 (= lt!310116 e!381438)))

(declare-fun c!76622 () Bool)

(assert (=> b!665700 (= c!76622 (validKeyInArray!0 (select (arr!18704 a!3626) from!3004)))))

(declare-fun lt!310123 () Unit!23245)

(assert (=> b!665700 (= lt!310123 e!381440)))

(declare-fun c!76621 () Bool)

(assert (=> b!665700 (= c!76621 lt!310122)))

(assert (=> b!665700 (= lt!310122 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665700 (arrayContainsKey!0 (array!39024 (store (arr!18704 a!3626) i!1382 k!2843) (size!19068 a!3626)) k!2843 from!3004)))

(declare-fun b!665701 () Bool)

(declare-fun res!433179 () Bool)

(assert (=> b!665701 (=> (not res!433179) (not e!381441))))

(assert (=> b!665701 (= res!433179 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12742))))

(declare-fun b!665702 () Bool)

(assert (=> b!665702 (= e!381439 (contains!3322 acc!681 k!2843))))

(assert (= (and start!59976 res!433176) b!665691))

(assert (= (and b!665691 res!433188) b!665697))

(assert (= (and b!665697 res!433173) b!665695))

(assert (= (and b!665695 res!433175) b!665692))

(assert (= (and b!665692 res!433174) b!665702))

(assert (= (and b!665692 (not res!433181)) b!665689))

(assert (= (and b!665689 res!433177) b!665682))

(assert (= (and b!665692 res!433187) b!665701))

(assert (= (and b!665701 res!433179) b!665681))

(assert (= (and b!665681 res!433171) b!665690))

(assert (= (and b!665690 res!433178) b!665696))

(assert (= (and b!665696 res!433180) b!665688))

(assert (= (and b!665688 res!433186) b!665678))

(assert (= (and b!665678 res!433182) b!665700))

(assert (= (and b!665700 c!76621) b!665694))

(assert (= (and b!665700 (not c!76621)) b!665686))

(assert (= (and b!665700 c!76622) b!665698))

(assert (= (and b!665700 (not c!76622)) b!665684))

(assert (= (and b!665700 (not res!433190)) b!665683))

(assert (= (and b!665683 (not res!433183)) b!665693))

(assert (= (and b!665693 (not res!433184)) b!665687))

(assert (= (and b!665687 (not res!433172)) b!665699))

(assert (= (and b!665699 (not res!433185)) b!665685))

(assert (= (and b!665685 (not res!433189)) b!665679))

(assert (= (and b!665679 (not res!433170)) b!665680))

(declare-fun m!636669 () Bool)

(assert (=> b!665680 m!636669))

(declare-fun m!636671 () Bool)

(assert (=> b!665699 m!636671))

(declare-fun m!636673 () Bool)

(assert (=> b!665696 m!636673))

(declare-fun m!636675 () Bool)

(assert (=> b!665679 m!636675))

(declare-fun m!636677 () Bool)

(assert (=> b!665681 m!636677))

(declare-fun m!636679 () Bool)

(assert (=> b!665683 m!636679))

(declare-fun m!636681 () Bool)

(assert (=> b!665701 m!636681))

(declare-fun m!636683 () Bool)

(assert (=> b!665697 m!636683))

(declare-fun m!636685 () Bool)

(assert (=> b!665698 m!636685))

(declare-fun m!636687 () Bool)

(assert (=> b!665698 m!636687))

(declare-fun m!636689 () Bool)

(assert (=> b!665698 m!636689))

(declare-fun m!636691 () Bool)

(assert (=> b!665698 m!636691))

(assert (=> b!665698 m!636687))

(assert (=> b!665698 m!636689))

(declare-fun m!636693 () Bool)

(assert (=> b!665698 m!636693))

(declare-fun m!636695 () Bool)

(assert (=> b!665698 m!636695))

(declare-fun m!636697 () Bool)

(assert (=> b!665702 m!636697))

(declare-fun m!636699 () Bool)

(assert (=> b!665685 m!636699))

(declare-fun m!636701 () Bool)

(assert (=> b!665688 m!636701))

(assert (=> b!665700 m!636685))

(assert (=> b!665700 m!636687))

(declare-fun m!636703 () Bool)

(assert (=> b!665700 m!636703))

(declare-fun m!636705 () Bool)

(assert (=> b!665700 m!636705))

(declare-fun m!636707 () Bool)

(assert (=> b!665700 m!636707))

(assert (=> b!665700 m!636693))

(declare-fun m!636709 () Bool)

(assert (=> b!665700 m!636709))

(declare-fun m!636711 () Bool)

(assert (=> b!665700 m!636711))

(assert (=> b!665700 m!636687))

(declare-fun m!636713 () Bool)

(assert (=> b!665700 m!636713))

(declare-fun m!636715 () Bool)

(assert (=> b!665700 m!636715))

(assert (=> b!665700 m!636695))

(declare-fun m!636717 () Bool)

(assert (=> b!665691 m!636717))

(declare-fun m!636719 () Bool)

(assert (=> b!665694 m!636719))

(assert (=> b!665687 m!636697))

(declare-fun m!636721 () Bool)

(assert (=> b!665695 m!636721))

(declare-fun m!636723 () Bool)

(assert (=> start!59976 m!636723))

(assert (=> b!665682 m!636697))

(push 1)

(assert (not b!665679))

(assert (not b!665685))

(assert (not b!665702))

(assert (not b!665699))

(assert (not b!665688))

(assert (not b!665698))

(assert (not b!665683))

(assert (not b!665694))

(assert (not b!665691))

(assert (not b!665682))

(assert (not b!665681))

(assert (not b!665700))

(assert (not b!665695))

(assert (not b!665687))

(assert (not b!665697))

(assert (not b!665680))

(assert (not start!59976))

(assert (not b!665696))

(assert (not b!665701))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

