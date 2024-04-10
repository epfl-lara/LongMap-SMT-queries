; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60054 () Bool)

(assert start!60054)

(declare-fun b!668603 () Bool)

(declare-datatypes ((Unit!23440 0))(
  ( (Unit!23441) )
))
(declare-fun e!382531 () Unit!23440)

(declare-fun Unit!23442 () Unit!23440)

(assert (=> b!668603 (= e!382531 Unit!23442)))

(declare-fun b!668604 () Bool)

(declare-fun res!435636 () Bool)

(declare-fun e!382535 () Bool)

(assert (=> b!668604 (=> (not res!435636) (not e!382535))))

(declare-datatypes ((List!12784 0))(
  ( (Nil!12781) (Cons!12780 (h!13825 (_ BitVec 64)) (t!19012 List!12784)) )
))
(declare-fun acc!681 () List!12784)

(declare-fun noDuplicate!608 (List!12784) Bool)

(assert (=> b!668604 (= res!435636 (noDuplicate!608 acc!681))))

(declare-fun b!668605 () Bool)

(declare-fun e!382530 () Unit!23440)

(declare-fun Unit!23443 () Unit!23440)

(assert (=> b!668605 (= e!382530 Unit!23443)))

(declare-fun b!668606 () Bool)

(declare-fun lt!311284 () Unit!23440)

(assert (=> b!668606 (= e!382531 lt!311284)))

(declare-fun lt!311293 () Unit!23440)

(declare-fun lemmaListSubSeqRefl!0 (List!12784) Unit!23440)

(assert (=> b!668606 (= lt!311293 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!100 (List!12784 List!12784) Bool)

(assert (=> b!668606 (subseq!100 acc!681 acc!681)))

(declare-datatypes ((array!39101 0))(
  ( (array!39102 (arr!18743 (Array (_ BitVec 32) (_ BitVec 64))) (size!19107 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39101)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39101 List!12784 List!12784 (_ BitVec 32)) Unit!23440)

(declare-fun $colon$colon!232 (List!12784 (_ BitVec 64)) List!12784)

(assert (=> b!668606 (= lt!311284 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!232 acc!681 (select (arr!18743 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39101 (_ BitVec 32) List!12784) Bool)

(assert (=> b!668606 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!668607 () Bool)

(declare-fun res!435638 () Bool)

(assert (=> b!668607 (=> (not res!435638) (not e!382535))))

(assert (=> b!668607 (= res!435638 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!668608 () Bool)

(declare-fun res!435631 () Bool)

(assert (=> b!668608 (=> (not res!435631) (not e!382535))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!668608 (= res!435631 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19107 a!3626))))))

(declare-fun b!668609 () Bool)

(declare-fun res!435632 () Bool)

(declare-fun e!382537 () Bool)

(assert (=> b!668609 (=> res!435632 e!382537)))

(declare-fun lt!311285 () List!12784)

(assert (=> b!668609 (= res!435632 (not (noDuplicate!608 lt!311285)))))

(declare-fun b!668610 () Bool)

(declare-fun e!382539 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3361 (List!12784 (_ BitVec 64)) Bool)

(assert (=> b!668610 (= e!382539 (not (contains!3361 lt!311285 k!2843)))))

(declare-fun res!435634 () Bool)

(assert (=> start!60054 (=> (not res!435634) (not e!382535))))

(assert (=> start!60054 (= res!435634 (and (bvslt (size!19107 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19107 a!3626))))))

(assert (=> start!60054 e!382535))

(assert (=> start!60054 true))

(declare-fun array_inv!14539 (array!39101) Bool)

(assert (=> start!60054 (array_inv!14539 a!3626)))

(declare-fun b!668611 () Bool)

(declare-fun res!435643 () Bool)

(assert (=> b!668611 (=> (not res!435643) (not e!382535))))

(assert (=> b!668611 (= res!435643 (not (contains!3361 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668612 () Bool)

(assert (=> b!668612 (= e!382537 true)))

(declare-fun lt!311292 () Bool)

(declare-fun e!382533 () Bool)

(assert (=> b!668612 (= lt!311292 e!382533)))

(declare-fun res!435644 () Bool)

(assert (=> b!668612 (=> res!435644 e!382533)))

(declare-fun e!382538 () Bool)

(assert (=> b!668612 (= res!435644 e!382538)))

(declare-fun res!435627 () Bool)

(assert (=> b!668612 (=> (not res!435627) (not e!382538))))

(assert (=> b!668612 (= res!435627 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668613 () Bool)

(declare-fun e!382536 () Bool)

(assert (=> b!668613 (= e!382536 (not (contains!3361 acc!681 k!2843)))))

(declare-fun b!668614 () Bool)

(declare-fun Unit!23444 () Unit!23440)

(assert (=> b!668614 (= e!382530 Unit!23444)))

(declare-fun lt!311291 () Unit!23440)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39101 (_ BitVec 64) (_ BitVec 32)) Unit!23440)

(assert (=> b!668614 (= lt!311291 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!668614 false))

(declare-fun b!668615 () Bool)

(declare-fun res!435645 () Bool)

(assert (=> b!668615 (=> (not res!435645) (not e!382535))))

(declare-fun e!382529 () Bool)

(assert (=> b!668615 (= res!435645 e!382529)))

(declare-fun res!435633 () Bool)

(assert (=> b!668615 (=> res!435633 e!382529)))

(declare-fun e!382534 () Bool)

(assert (=> b!668615 (= res!435633 e!382534)))

(declare-fun res!435628 () Bool)

(assert (=> b!668615 (=> (not res!435628) (not e!382534))))

(assert (=> b!668615 (= res!435628 (bvsgt from!3004 i!1382))))

(declare-fun b!668616 () Bool)

(declare-fun res!435629 () Bool)

(assert (=> b!668616 (=> res!435629 e!382537)))

(assert (=> b!668616 (= res!435629 (contains!3361 lt!311285 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668617 () Bool)

(declare-fun res!435640 () Bool)

(assert (=> b!668617 (=> (not res!435640) (not e!382535))))

(declare-fun arrayContainsKey!0 (array!39101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!668617 (= res!435640 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!668618 () Bool)

(declare-fun res!435642 () Bool)

(assert (=> b!668618 (=> (not res!435642) (not e!382535))))

(assert (=> b!668618 (= res!435642 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19107 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!668619 () Bool)

(assert (=> b!668619 (= e!382534 (contains!3361 acc!681 k!2843))))

(declare-fun b!668620 () Bool)

(declare-fun res!435641 () Bool)

(assert (=> b!668620 (=> (not res!435641) (not e!382535))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!668620 (= res!435641 (validKeyInArray!0 k!2843))))

(declare-fun b!668621 () Bool)

(assert (=> b!668621 (= e!382529 e!382536)))

(declare-fun res!435635 () Bool)

(assert (=> b!668621 (=> (not res!435635) (not e!382536))))

(assert (=> b!668621 (= res!435635 (bvsle from!3004 i!1382))))

(declare-fun b!668622 () Bool)

(declare-fun res!435637 () Bool)

(assert (=> b!668622 (=> (not res!435637) (not e!382535))))

(assert (=> b!668622 (= res!435637 (not (contains!3361 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668623 () Bool)

(assert (=> b!668623 (= e!382538 (contains!3361 lt!311285 k!2843))))

(declare-fun b!668624 () Bool)

(declare-fun res!435639 () Bool)

(assert (=> b!668624 (=> res!435639 e!382537)))

(assert (=> b!668624 (= res!435639 (contains!3361 lt!311285 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668625 () Bool)

(declare-fun res!435630 () Bool)

(assert (=> b!668625 (=> (not res!435630) (not e!382535))))

(assert (=> b!668625 (= res!435630 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12781))))

(declare-fun b!668626 () Bool)

(assert (=> b!668626 (= e!382533 e!382539)))

(declare-fun res!435646 () Bool)

(assert (=> b!668626 (=> (not res!435646) (not e!382539))))

(assert (=> b!668626 (= res!435646 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668627 () Bool)

(assert (=> b!668627 (= e!382535 (not e!382537))))

(declare-fun res!435647 () Bool)

(assert (=> b!668627 (=> res!435647 e!382537)))

(assert (=> b!668627 (= res!435647 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!668627 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311285)))

(declare-fun lt!311286 () Unit!23440)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39101 (_ BitVec 64) (_ BitVec 32) List!12784 List!12784) Unit!23440)

(assert (=> b!668627 (= lt!311286 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311285))))

(declare-fun -!98 (List!12784 (_ BitVec 64)) List!12784)

(assert (=> b!668627 (= (-!98 lt!311285 k!2843) acc!681)))

(assert (=> b!668627 (= lt!311285 ($colon$colon!232 acc!681 k!2843))))

(declare-fun lt!311290 () Unit!23440)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12784) Unit!23440)

(assert (=> b!668627 (= lt!311290 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!668627 (subseq!100 acc!681 acc!681)))

(declare-fun lt!311289 () Unit!23440)

(assert (=> b!668627 (= lt!311289 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668627 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311288 () Unit!23440)

(assert (=> b!668627 (= lt!311288 e!382531)))

(declare-fun c!76855 () Bool)

(assert (=> b!668627 (= c!76855 (validKeyInArray!0 (select (arr!18743 a!3626) from!3004)))))

(declare-fun lt!311287 () Unit!23440)

(assert (=> b!668627 (= lt!311287 e!382530)))

(declare-fun c!76856 () Bool)

(assert (=> b!668627 (= c!76856 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668627 (arrayContainsKey!0 (array!39102 (store (arr!18743 a!3626) i!1382 k!2843) (size!19107 a!3626)) k!2843 from!3004)))

(assert (= (and start!60054 res!435634) b!668604))

(assert (= (and b!668604 res!435636) b!668622))

(assert (= (and b!668622 res!435637) b!668611))

(assert (= (and b!668611 res!435643) b!668615))

(assert (= (and b!668615 res!435628) b!668619))

(assert (= (and b!668615 (not res!435633)) b!668621))

(assert (= (and b!668621 res!435635) b!668613))

(assert (= (and b!668615 res!435645) b!668625))

(assert (= (and b!668625 res!435630) b!668607))

(assert (= (and b!668607 res!435638) b!668608))

(assert (= (and b!668608 res!435631) b!668620))

(assert (= (and b!668620 res!435641) b!668617))

(assert (= (and b!668617 res!435640) b!668618))

(assert (= (and b!668618 res!435642) b!668627))

(assert (= (and b!668627 c!76856) b!668614))

(assert (= (and b!668627 (not c!76856)) b!668605))

(assert (= (and b!668627 c!76855) b!668606))

(assert (= (and b!668627 (not c!76855)) b!668603))

(assert (= (and b!668627 (not res!435647)) b!668609))

(assert (= (and b!668609 (not res!435632)) b!668624))

(assert (= (and b!668624 (not res!435639)) b!668616))

(assert (= (and b!668616 (not res!435629)) b!668612))

(assert (= (and b!668612 res!435627) b!668623))

(assert (= (and b!668612 (not res!435644)) b!668626))

(assert (= (and b!668626 res!435646) b!668610))

(declare-fun m!638887 () Bool)

(assert (=> b!668625 m!638887))

(declare-fun m!638889 () Bool)

(assert (=> b!668610 m!638889))

(declare-fun m!638891 () Bool)

(assert (=> b!668620 m!638891))

(declare-fun m!638893 () Bool)

(assert (=> b!668609 m!638893))

(declare-fun m!638895 () Bool)

(assert (=> b!668616 m!638895))

(declare-fun m!638897 () Bool)

(assert (=> b!668622 m!638897))

(assert (=> b!668623 m!638889))

(declare-fun m!638899 () Bool)

(assert (=> b!668606 m!638899))

(declare-fun m!638901 () Bool)

(assert (=> b!668606 m!638901))

(declare-fun m!638903 () Bool)

(assert (=> b!668606 m!638903))

(declare-fun m!638905 () Bool)

(assert (=> b!668606 m!638905))

(assert (=> b!668606 m!638901))

(assert (=> b!668606 m!638903))

(declare-fun m!638907 () Bool)

(assert (=> b!668606 m!638907))

(declare-fun m!638909 () Bool)

(assert (=> b!668606 m!638909))

(declare-fun m!638911 () Bool)

(assert (=> b!668604 m!638911))

(declare-fun m!638913 () Bool)

(assert (=> b!668613 m!638913))

(assert (=> b!668627 m!638899))

(assert (=> b!668627 m!638901))

(declare-fun m!638915 () Bool)

(assert (=> b!668627 m!638915))

(declare-fun m!638917 () Bool)

(assert (=> b!668627 m!638917))

(declare-fun m!638919 () Bool)

(assert (=> b!668627 m!638919))

(declare-fun m!638921 () Bool)

(assert (=> b!668627 m!638921))

(assert (=> b!668627 m!638907))

(declare-fun m!638923 () Bool)

(assert (=> b!668627 m!638923))

(declare-fun m!638925 () Bool)

(assert (=> b!668627 m!638925))

(declare-fun m!638927 () Bool)

(assert (=> b!668627 m!638927))

(assert (=> b!668627 m!638901))

(declare-fun m!638929 () Bool)

(assert (=> b!668627 m!638929))

(declare-fun m!638931 () Bool)

(assert (=> b!668627 m!638931))

(assert (=> b!668627 m!638909))

(assert (=> b!668619 m!638913))

(declare-fun m!638933 () Bool)

(assert (=> b!668617 m!638933))

(declare-fun m!638935 () Bool)

(assert (=> b!668624 m!638935))

(declare-fun m!638937 () Bool)

(assert (=> b!668611 m!638937))

(declare-fun m!638939 () Bool)

(assert (=> b!668607 m!638939))

(declare-fun m!638941 () Bool)

(assert (=> start!60054 m!638941))

(declare-fun m!638943 () Bool)

(assert (=> b!668614 m!638943))

(push 1)

(assert (not b!668627))

(assert (not b!668607))

(assert (not b!668604))

(assert (not b!668617))

(assert (not b!668611))

(assert (not b!668613))

(assert (not b!668622))

(assert (not b!668610))

(assert (not b!668614))

(assert (not start!60054))

(assert (not b!668609))

(assert (not b!668616))

(assert (not b!668624))

(assert (not b!668619))

(assert (not b!668620))

(assert (not b!668623))

(assert (not b!668606))

(assert (not b!668625))

(check-sat)

