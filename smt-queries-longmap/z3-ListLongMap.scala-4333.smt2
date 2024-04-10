; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60028 () Bool)

(assert start!60028)

(declare-fun b!667628 () Bool)

(declare-fun e!382106 () Bool)

(declare-fun e!382100 () Bool)

(assert (=> b!667628 (= e!382106 e!382100)))

(declare-fun res!434819 () Bool)

(assert (=> b!667628 (=> (not res!434819) (not e!382100))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!667628 (= res!434819 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667629 () Bool)

(declare-fun e!382101 () Bool)

(assert (=> b!667629 (= e!382101 true)))

(declare-fun lt!310898 () Bool)

(assert (=> b!667629 (= lt!310898 e!382106)))

(declare-fun res!434820 () Bool)

(assert (=> b!667629 (=> res!434820 e!382106)))

(declare-fun e!382108 () Bool)

(assert (=> b!667629 (= res!434820 e!382108)))

(declare-fun res!434824 () Bool)

(assert (=> b!667629 (=> (not res!434824) (not e!382108))))

(assert (=> b!667629 (= res!434824 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667630 () Bool)

(declare-datatypes ((List!12771 0))(
  ( (Nil!12768) (Cons!12767 (h!13812 (_ BitVec 64)) (t!18999 List!12771)) )
))
(declare-fun lt!310900 () List!12771)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3348 (List!12771 (_ BitVec 64)) Bool)

(assert (=> b!667630 (= e!382108 (contains!3348 lt!310900 k0!2843))))

(declare-fun b!667631 () Bool)

(declare-fun res!434809 () Bool)

(declare-fun e!382107 () Bool)

(assert (=> b!667631 (=> (not res!434809) (not e!382107))))

(declare-fun acc!681 () List!12771)

(declare-fun noDuplicate!595 (List!12771) Bool)

(assert (=> b!667631 (= res!434809 (noDuplicate!595 acc!681))))

(declare-fun b!667633 () Bool)

(declare-fun res!434811 () Bool)

(assert (=> b!667633 (=> (not res!434811) (not e!382107))))

(declare-datatypes ((array!39075 0))(
  ( (array!39076 (arr!18730 (Array (_ BitVec 32) (_ BitVec 64))) (size!19094 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39075)

(assert (=> b!667633 (= res!434811 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19094 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!667634 () Bool)

(declare-fun res!434823 () Bool)

(assert (=> b!667634 (=> (not res!434823) (not e!382107))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!667634 (= res!434823 (validKeyInArray!0 k0!2843))))

(declare-fun b!667635 () Bool)

(declare-datatypes ((Unit!23375 0))(
  ( (Unit!23376) )
))
(declare-fun e!382109 () Unit!23375)

(declare-fun Unit!23377 () Unit!23375)

(assert (=> b!667635 (= e!382109 Unit!23377)))

(declare-fun b!667636 () Bool)

(declare-fun e!382110 () Unit!23375)

(declare-fun Unit!23378 () Unit!23375)

(assert (=> b!667636 (= e!382110 Unit!23378)))

(declare-fun b!667637 () Bool)

(declare-fun e!382103 () Bool)

(declare-fun e!382102 () Bool)

(assert (=> b!667637 (= e!382103 e!382102)))

(declare-fun res!434810 () Bool)

(assert (=> b!667637 (=> (not res!434810) (not e!382102))))

(assert (=> b!667637 (= res!434810 (bvsle from!3004 i!1382))))

(declare-fun b!667638 () Bool)

(declare-fun res!434812 () Bool)

(assert (=> b!667638 (=> (not res!434812) (not e!382107))))

(assert (=> b!667638 (= res!434812 (not (contains!3348 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667632 () Bool)

(declare-fun res!434828 () Bool)

(assert (=> b!667632 (=> res!434828 e!382101)))

(assert (=> b!667632 (= res!434828 (contains!3348 lt!310900 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!434827 () Bool)

(assert (=> start!60028 (=> (not res!434827) (not e!382107))))

(assert (=> start!60028 (= res!434827 (and (bvslt (size!19094 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19094 a!3626))))))

(assert (=> start!60028 e!382107))

(assert (=> start!60028 true))

(declare-fun array_inv!14526 (array!39075) Bool)

(assert (=> start!60028 (array_inv!14526 a!3626)))

(declare-fun b!667639 () Bool)

(declare-fun e!382105 () Bool)

(assert (=> b!667639 (= e!382105 (contains!3348 acc!681 k0!2843))))

(declare-fun b!667640 () Bool)

(declare-fun res!434826 () Bool)

(assert (=> b!667640 (=> (not res!434826) (not e!382107))))

(assert (=> b!667640 (= res!434826 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19094 a!3626))))))

(declare-fun b!667641 () Bool)

(declare-fun res!434818 () Bool)

(assert (=> b!667641 (=> res!434818 e!382101)))

(assert (=> b!667641 (= res!434818 (not (noDuplicate!595 lt!310900)))))

(declare-fun b!667642 () Bool)

(declare-fun res!434814 () Bool)

(assert (=> b!667642 (=> (not res!434814) (not e!382107))))

(assert (=> b!667642 (= res!434814 e!382103)))

(declare-fun res!434815 () Bool)

(assert (=> b!667642 (=> res!434815 e!382103)))

(assert (=> b!667642 (= res!434815 e!382105)))

(declare-fun res!434813 () Bool)

(assert (=> b!667642 (=> (not res!434813) (not e!382105))))

(assert (=> b!667642 (= res!434813 (bvsgt from!3004 i!1382))))

(declare-fun b!667643 () Bool)

(assert (=> b!667643 (= e!382107 (not e!382101))))

(declare-fun res!434822 () Bool)

(assert (=> b!667643 (=> res!434822 e!382101)))

(assert (=> b!667643 (= res!434822 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun arrayNoDuplicates!0 (array!39075 (_ BitVec 32) List!12771) Bool)

(assert (=> b!667643 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!310900)))

(declare-fun lt!310894 () Unit!23375)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39075 (_ BitVec 64) (_ BitVec 32) List!12771 List!12771) Unit!23375)

(assert (=> b!667643 (= lt!310894 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!310900))))

(declare-fun -!85 (List!12771 (_ BitVec 64)) List!12771)

(assert (=> b!667643 (= (-!85 lt!310900 k0!2843) acc!681)))

(declare-fun $colon$colon!219 (List!12771 (_ BitVec 64)) List!12771)

(assert (=> b!667643 (= lt!310900 ($colon$colon!219 acc!681 k0!2843))))

(declare-fun lt!310896 () Unit!23375)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12771) Unit!23375)

(assert (=> b!667643 (= lt!310896 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!87 (List!12771 List!12771) Bool)

(assert (=> b!667643 (subseq!87 acc!681 acc!681)))

(declare-fun lt!310903 () Unit!23375)

(declare-fun lemmaListSubSeqRefl!0 (List!12771) Unit!23375)

(assert (=> b!667643 (= lt!310903 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667643 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310902 () Unit!23375)

(assert (=> b!667643 (= lt!310902 e!382110)))

(declare-fun c!76777 () Bool)

(assert (=> b!667643 (= c!76777 (validKeyInArray!0 (select (arr!18730 a!3626) from!3004)))))

(declare-fun lt!310899 () Unit!23375)

(assert (=> b!667643 (= lt!310899 e!382109)))

(declare-fun c!76778 () Bool)

(declare-fun arrayContainsKey!0 (array!39075 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!667643 (= c!76778 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667643 (arrayContainsKey!0 (array!39076 (store (arr!18730 a!3626) i!1382 k0!2843) (size!19094 a!3626)) k0!2843 from!3004)))

(declare-fun b!667644 () Bool)

(declare-fun res!434821 () Bool)

(assert (=> b!667644 (=> (not res!434821) (not e!382107))))

(assert (=> b!667644 (= res!434821 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!667645 () Bool)

(declare-fun lt!310897 () Unit!23375)

(assert (=> b!667645 (= e!382110 lt!310897)))

(declare-fun lt!310895 () Unit!23375)

(assert (=> b!667645 (= lt!310895 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667645 (subseq!87 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39075 List!12771 List!12771 (_ BitVec 32)) Unit!23375)

(assert (=> b!667645 (= lt!310897 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!219 acc!681 (select (arr!18730 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667645 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!667646 () Bool)

(assert (=> b!667646 (= e!382100 (not (contains!3348 lt!310900 k0!2843)))))

(declare-fun b!667647 () Bool)

(declare-fun res!434816 () Bool)

(assert (=> b!667647 (=> (not res!434816) (not e!382107))))

(assert (=> b!667647 (= res!434816 (not (contains!3348 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667648 () Bool)

(assert (=> b!667648 (= e!382102 (not (contains!3348 acc!681 k0!2843)))))

(declare-fun b!667649 () Bool)

(declare-fun Unit!23379 () Unit!23375)

(assert (=> b!667649 (= e!382109 Unit!23379)))

(declare-fun lt!310901 () Unit!23375)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39075 (_ BitVec 64) (_ BitVec 32)) Unit!23375)

(assert (=> b!667649 (= lt!310901 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!667649 false))

(declare-fun b!667650 () Bool)

(declare-fun res!434808 () Bool)

(assert (=> b!667650 (=> (not res!434808) (not e!382107))))

(assert (=> b!667650 (= res!434808 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12768))))

(declare-fun b!667651 () Bool)

(declare-fun res!434817 () Bool)

(assert (=> b!667651 (=> (not res!434817) (not e!382107))))

(assert (=> b!667651 (= res!434817 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!667652 () Bool)

(declare-fun res!434825 () Bool)

(assert (=> b!667652 (=> res!434825 e!382101)))

(assert (=> b!667652 (= res!434825 (contains!3348 lt!310900 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!60028 res!434827) b!667631))

(assert (= (and b!667631 res!434809) b!667638))

(assert (= (and b!667638 res!434812) b!667647))

(assert (= (and b!667647 res!434816) b!667642))

(assert (= (and b!667642 res!434813) b!667639))

(assert (= (and b!667642 (not res!434815)) b!667637))

(assert (= (and b!667637 res!434810) b!667648))

(assert (= (and b!667642 res!434814) b!667650))

(assert (= (and b!667650 res!434808) b!667644))

(assert (= (and b!667644 res!434821) b!667640))

(assert (= (and b!667640 res!434826) b!667634))

(assert (= (and b!667634 res!434823) b!667651))

(assert (= (and b!667651 res!434817) b!667633))

(assert (= (and b!667633 res!434811) b!667643))

(assert (= (and b!667643 c!76778) b!667649))

(assert (= (and b!667643 (not c!76778)) b!667635))

(assert (= (and b!667643 c!76777) b!667645))

(assert (= (and b!667643 (not c!76777)) b!667636))

(assert (= (and b!667643 (not res!434822)) b!667641))

(assert (= (and b!667641 (not res!434818)) b!667652))

(assert (= (and b!667652 (not res!434825)) b!667632))

(assert (= (and b!667632 (not res!434828)) b!667629))

(assert (= (and b!667629 res!434824) b!667630))

(assert (= (and b!667629 (not res!434820)) b!667628))

(assert (= (and b!667628 res!434819) b!667646))

(declare-fun m!638133 () Bool)

(assert (=> b!667631 m!638133))

(declare-fun m!638135 () Bool)

(assert (=> start!60028 m!638135))

(declare-fun m!638137 () Bool)

(assert (=> b!667634 m!638137))

(declare-fun m!638139 () Bool)

(assert (=> b!667643 m!638139))

(declare-fun m!638141 () Bool)

(assert (=> b!667643 m!638141))

(declare-fun m!638143 () Bool)

(assert (=> b!667643 m!638143))

(declare-fun m!638145 () Bool)

(assert (=> b!667643 m!638145))

(declare-fun m!638147 () Bool)

(assert (=> b!667643 m!638147))

(declare-fun m!638149 () Bool)

(assert (=> b!667643 m!638149))

(declare-fun m!638151 () Bool)

(assert (=> b!667643 m!638151))

(declare-fun m!638153 () Bool)

(assert (=> b!667643 m!638153))

(declare-fun m!638155 () Bool)

(assert (=> b!667643 m!638155))

(declare-fun m!638157 () Bool)

(assert (=> b!667643 m!638157))

(assert (=> b!667643 m!638153))

(declare-fun m!638159 () Bool)

(assert (=> b!667643 m!638159))

(declare-fun m!638161 () Bool)

(assert (=> b!667643 m!638161))

(declare-fun m!638163 () Bool)

(assert (=> b!667643 m!638163))

(declare-fun m!638165 () Bool)

(assert (=> b!667647 m!638165))

(declare-fun m!638167 () Bool)

(assert (=> b!667650 m!638167))

(declare-fun m!638169 () Bool)

(assert (=> b!667649 m!638169))

(assert (=> b!667645 m!638139))

(assert (=> b!667645 m!638153))

(declare-fun m!638171 () Bool)

(assert (=> b!667645 m!638171))

(declare-fun m!638173 () Bool)

(assert (=> b!667645 m!638173))

(assert (=> b!667645 m!638153))

(assert (=> b!667645 m!638171))

(assert (=> b!667645 m!638147))

(assert (=> b!667645 m!638163))

(declare-fun m!638175 () Bool)

(assert (=> b!667638 m!638175))

(declare-fun m!638177 () Bool)

(assert (=> b!667652 m!638177))

(declare-fun m!638179 () Bool)

(assert (=> b!667651 m!638179))

(declare-fun m!638181 () Bool)

(assert (=> b!667630 m!638181))

(assert (=> b!667646 m!638181))

(declare-fun m!638183 () Bool)

(assert (=> b!667644 m!638183))

(declare-fun m!638185 () Bool)

(assert (=> b!667639 m!638185))

(declare-fun m!638187 () Bool)

(assert (=> b!667632 m!638187))

(assert (=> b!667648 m!638185))

(declare-fun m!638189 () Bool)

(assert (=> b!667641 m!638189))

(check-sat (not b!667632) (not b!667643) (not b!667647) (not b!667638) (not b!667645) (not b!667644) (not b!667649) (not b!667634) (not b!667631) (not b!667639) (not b!667652) (not b!667641) (not b!667648) (not b!667650) (not start!60028) (not b!667630) (not b!667651) (not b!667646))
(check-sat)
