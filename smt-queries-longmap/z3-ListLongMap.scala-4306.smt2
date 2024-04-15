; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59852 () Bool)

(assert start!59852)

(declare-fun b!661680 () Bool)

(declare-fun res!429893 () Bool)

(declare-fun e!379952 () Bool)

(assert (=> b!661680 (=> (not res!429893) (not e!379952))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661680 (= res!429893 (validKeyInArray!0 k0!2843))))

(declare-fun b!661681 () Bool)

(declare-fun res!429887 () Bool)

(assert (=> b!661681 (=> (not res!429887) (not e!379952))))

(declare-datatypes ((array!38910 0))(
  ( (array!38911 (arr!18647 (Array (_ BitVec 32) (_ BitVec 64))) (size!19012 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38910)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!661681 (= res!429887 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19012 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661682 () Bool)

(declare-fun res!429897 () Bool)

(assert (=> b!661682 (=> (not res!429897) (not e!379952))))

(declare-datatypes ((List!12727 0))(
  ( (Nil!12724) (Cons!12723 (h!13768 (_ BitVec 64)) (t!18946 List!12727)) )
))
(declare-fun acc!681 () List!12727)

(declare-fun contains!3249 (List!12727 (_ BitVec 64)) Bool)

(assert (=> b!661682 (= res!429897 (not (contains!3249 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661683 () Bool)

(declare-datatypes ((Unit!22964 0))(
  ( (Unit!22965) )
))
(declare-fun e!379947 () Unit!22964)

(declare-fun Unit!22966 () Unit!22964)

(assert (=> b!661683 (= e!379947 Unit!22966)))

(declare-fun b!661684 () Bool)

(declare-fun res!429900 () Bool)

(assert (=> b!661684 (=> (not res!429900) (not e!379952))))

(declare-fun noDuplicate!518 (List!12727) Bool)

(assert (=> b!661684 (= res!429900 (noDuplicate!518 acc!681))))

(declare-fun res!429883 () Bool)

(assert (=> start!59852 (=> (not res!429883) (not e!379952))))

(assert (=> start!59852 (= res!429883 (and (bvslt (size!19012 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19012 a!3626))))))

(assert (=> start!59852 e!379952))

(assert (=> start!59852 true))

(declare-fun array_inv!14530 (array!38910) Bool)

(assert (=> start!59852 (array_inv!14530 a!3626)))

(declare-fun b!661685 () Bool)

(declare-fun e!379951 () Bool)

(assert (=> b!661685 (= e!379951 (contains!3249 acc!681 k0!2843))))

(declare-fun b!661686 () Bool)

(declare-fun e!379950 () Bool)

(declare-fun e!379945 () Bool)

(assert (=> b!661686 (= e!379950 e!379945)))

(declare-fun res!429886 () Bool)

(assert (=> b!661686 (=> (not res!429886) (not e!379945))))

(assert (=> b!661686 (= res!429886 (bvsle from!3004 i!1382))))

(declare-fun b!661687 () Bool)

(declare-fun e!379948 () Bool)

(assert (=> b!661687 (= e!379948 true)))

(declare-fun lt!308632 () Bool)

(declare-fun lt!308633 () List!12727)

(declare-fun arrayNoDuplicates!0 (array!38910 (_ BitVec 32) List!12727) Bool)

(assert (=> b!661687 (= lt!308632 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!308633))))

(declare-fun lt!308630 () Unit!22964)

(declare-fun noDuplicateSubseq!5 (List!12727 List!12727) Unit!22964)

(assert (=> b!661687 (= lt!308630 (noDuplicateSubseq!5 acc!681 lt!308633))))

(declare-fun b!661688 () Bool)

(declare-fun res!429892 () Bool)

(assert (=> b!661688 (=> (not res!429892) (not e!379952))))

(assert (=> b!661688 (= res!429892 (not (contains!3249 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661689 () Bool)

(declare-fun e!379946 () Bool)

(assert (=> b!661689 (= e!379952 (not e!379946))))

(declare-fun res!429882 () Bool)

(assert (=> b!661689 (=> res!429882 e!379946)))

(assert (=> b!661689 (= res!429882 (not (validKeyInArray!0 (select (arr!18647 a!3626) from!3004))))))

(declare-fun lt!308631 () Unit!22964)

(assert (=> b!661689 (= lt!308631 e!379947)))

(declare-fun c!76266 () Bool)

(declare-fun arrayContainsKey!0 (array!38910 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661689 (= c!76266 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!661689 (arrayContainsKey!0 (array!38911 (store (arr!18647 a!3626) i!1382 k0!2843) (size!19012 a!3626)) k0!2843 from!3004)))

(declare-fun b!661690 () Bool)

(declare-fun res!429889 () Bool)

(assert (=> b!661690 (=> (not res!429889) (not e!379952))))

(assert (=> b!661690 (= res!429889 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12724))))

(declare-fun b!661691 () Bool)

(declare-fun res!429884 () Bool)

(assert (=> b!661691 (=> (not res!429884) (not e!379952))))

(assert (=> b!661691 (= res!429884 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661692 () Bool)

(declare-fun res!429888 () Bool)

(assert (=> b!661692 (=> (not res!429888) (not e!379952))))

(assert (=> b!661692 (= res!429888 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19012 a!3626))))))

(declare-fun b!661693 () Bool)

(declare-fun res!429894 () Bool)

(assert (=> b!661693 (=> res!429894 e!379948)))

(declare-fun subseq!5 (List!12727 List!12727) Bool)

(assert (=> b!661693 (= res!429894 (not (subseq!5 acc!681 lt!308633)))))

(declare-fun b!661694 () Bool)

(declare-fun res!429890 () Bool)

(assert (=> b!661694 (=> res!429890 e!379948)))

(assert (=> b!661694 (= res!429890 (contains!3249 lt!308633 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!661695 () Bool)

(assert (=> b!661695 (= e!379946 e!379948)))

(declare-fun res!429891 () Bool)

(assert (=> b!661695 (=> res!429891 e!379948)))

(assert (=> b!661695 (= res!429891 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!136 (List!12727 (_ BitVec 64)) List!12727)

(assert (=> b!661695 (= lt!308633 ($colon$colon!136 acc!681 (select (arr!18647 a!3626) from!3004)))))

(assert (=> b!661695 (subseq!5 acc!681 acc!681)))

(declare-fun lt!308634 () Unit!22964)

(declare-fun lemmaListSubSeqRefl!0 (List!12727) Unit!22964)

(assert (=> b!661695 (= lt!308634 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!661696 () Bool)

(declare-fun res!429885 () Bool)

(assert (=> b!661696 (=> (not res!429885) (not e!379952))))

(assert (=> b!661696 (= res!429885 e!379950)))

(declare-fun res!429901 () Bool)

(assert (=> b!661696 (=> res!429901 e!379950)))

(assert (=> b!661696 (= res!429901 e!379951)))

(declare-fun res!429896 () Bool)

(assert (=> b!661696 (=> (not res!429896) (not e!379951))))

(assert (=> b!661696 (= res!429896 (bvsgt from!3004 i!1382))))

(declare-fun b!661697 () Bool)

(declare-fun res!429898 () Bool)

(assert (=> b!661697 (=> (not res!429898) (not e!379952))))

(assert (=> b!661697 (= res!429898 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!661698 () Bool)

(declare-fun res!429899 () Bool)

(assert (=> b!661698 (=> res!429899 e!379948)))

(assert (=> b!661698 (= res!429899 (not (noDuplicate!518 lt!308633)))))

(declare-fun b!661699 () Bool)

(assert (=> b!661699 (= e!379945 (not (contains!3249 acc!681 k0!2843)))))

(declare-fun b!661700 () Bool)

(declare-fun Unit!22967 () Unit!22964)

(assert (=> b!661700 (= e!379947 Unit!22967)))

(declare-fun lt!308629 () Unit!22964)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38910 (_ BitVec 64) (_ BitVec 32)) Unit!22964)

(assert (=> b!661700 (= lt!308629 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!661700 false))

(declare-fun b!661701 () Bool)

(declare-fun res!429895 () Bool)

(assert (=> b!661701 (=> res!429895 e!379948)))

(assert (=> b!661701 (= res!429895 (contains!3249 lt!308633 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!59852 res!429883) b!661684))

(assert (= (and b!661684 res!429900) b!661682))

(assert (= (and b!661682 res!429897) b!661688))

(assert (= (and b!661688 res!429892) b!661696))

(assert (= (and b!661696 res!429896) b!661685))

(assert (= (and b!661696 (not res!429901)) b!661686))

(assert (= (and b!661686 res!429886) b!661699))

(assert (= (and b!661696 res!429885) b!661690))

(assert (= (and b!661690 res!429889) b!661691))

(assert (= (and b!661691 res!429884) b!661692))

(assert (= (and b!661692 res!429888) b!661680))

(assert (= (and b!661680 res!429893) b!661697))

(assert (= (and b!661697 res!429898) b!661681))

(assert (= (and b!661681 res!429887) b!661689))

(assert (= (and b!661689 c!76266) b!661700))

(assert (= (and b!661689 (not c!76266)) b!661683))

(assert (= (and b!661689 (not res!429882)) b!661695))

(assert (= (and b!661695 (not res!429891)) b!661698))

(assert (= (and b!661698 (not res!429899)) b!661694))

(assert (= (and b!661694 (not res!429890)) b!661701))

(assert (= (and b!661701 (not res!429895)) b!661693))

(assert (= (and b!661693 (not res!429894)) b!661687))

(declare-fun m!633159 () Bool)

(assert (=> b!661687 m!633159))

(declare-fun m!633161 () Bool)

(assert (=> b!661687 m!633161))

(declare-fun m!633163 () Bool)

(assert (=> b!661698 m!633163))

(declare-fun m!633165 () Bool)

(assert (=> b!661699 m!633165))

(declare-fun m!633167 () Bool)

(assert (=> b!661680 m!633167))

(declare-fun m!633169 () Bool)

(assert (=> b!661691 m!633169))

(declare-fun m!633171 () Bool)

(assert (=> b!661695 m!633171))

(assert (=> b!661695 m!633171))

(declare-fun m!633173 () Bool)

(assert (=> b!661695 m!633173))

(declare-fun m!633175 () Bool)

(assert (=> b!661695 m!633175))

(declare-fun m!633177 () Bool)

(assert (=> b!661695 m!633177))

(declare-fun m!633179 () Bool)

(assert (=> start!59852 m!633179))

(declare-fun m!633181 () Bool)

(assert (=> b!661700 m!633181))

(declare-fun m!633183 () Bool)

(assert (=> b!661684 m!633183))

(declare-fun m!633185 () Bool)

(assert (=> b!661690 m!633185))

(declare-fun m!633187 () Bool)

(assert (=> b!661688 m!633187))

(assert (=> b!661685 m!633165))

(declare-fun m!633189 () Bool)

(assert (=> b!661682 m!633189))

(declare-fun m!633191 () Bool)

(assert (=> b!661694 m!633191))

(declare-fun m!633193 () Bool)

(assert (=> b!661693 m!633193))

(declare-fun m!633195 () Bool)

(assert (=> b!661697 m!633195))

(declare-fun m!633197 () Bool)

(assert (=> b!661701 m!633197))

(assert (=> b!661689 m!633171))

(declare-fun m!633199 () Bool)

(assert (=> b!661689 m!633199))

(declare-fun m!633201 () Bool)

(assert (=> b!661689 m!633201))

(assert (=> b!661689 m!633171))

(declare-fun m!633203 () Bool)

(assert (=> b!661689 m!633203))

(declare-fun m!633205 () Bool)

(assert (=> b!661689 m!633205))

(check-sat (not b!661685) (not b!661701) (not b!661698) (not b!661680) (not b!661695) (not b!661699) (not b!661700) (not b!661697) (not start!59852) (not b!661690) (not b!661687) (not b!661684) (not b!661682) (not b!661693) (not b!661691) (not b!661688) (not b!661689) (not b!661694))
(check-sat)
