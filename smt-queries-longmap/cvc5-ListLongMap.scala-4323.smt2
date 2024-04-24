; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60028 () Bool)

(assert start!60028)

(declare-fun b!665677 () Bool)

(declare-fun res!433103 () Bool)

(declare-fun e!381510 () Bool)

(assert (=> b!665677 (=> (not res!433103) (not e!381510))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39013 0))(
  ( (array!39014 (arr!18696 (Array (_ BitVec 32) (_ BitVec 64))) (size!19060 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39013)

(assert (=> b!665677 (= res!433103 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19060 a!3626))))))

(declare-fun b!665678 () Bool)

(declare-fun e!381507 () Bool)

(declare-datatypes ((List!12644 0))(
  ( (Nil!12641) (Cons!12640 (h!13688 (_ BitVec 64)) (t!18864 List!12644)) )
))
(declare-fun acc!681 () List!12644)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3296 (List!12644 (_ BitVec 64)) Bool)

(assert (=> b!665678 (= e!381507 (contains!3296 acc!681 k!2843))))

(declare-fun b!665679 () Bool)

(declare-fun e!381506 () Bool)

(declare-fun e!381504 () Bool)

(assert (=> b!665679 (= e!381506 e!381504)))

(declare-fun res!433095 () Bool)

(assert (=> b!665679 (=> (not res!433095) (not e!381504))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!665679 (= res!433095 (bvsle from!3004 i!1382))))

(declare-fun b!665680 () Bool)

(declare-fun res!433113 () Bool)

(assert (=> b!665680 (=> (not res!433113) (not e!381510))))

(declare-fun noDuplicate!570 (List!12644) Bool)

(assert (=> b!665680 (= res!433113 (noDuplicate!570 acc!681))))

(declare-fun b!665681 () Bool)

(declare-fun res!433102 () Bool)

(declare-fun e!381509 () Bool)

(assert (=> b!665681 (=> res!433102 e!381509)))

(declare-fun lt!310127 () List!12644)

(assert (=> b!665681 (= res!433102 (contains!3296 lt!310127 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665682 () Bool)

(declare-datatypes ((Unit!23209 0))(
  ( (Unit!23210) )
))
(declare-fun e!381505 () Unit!23209)

(declare-fun Unit!23211 () Unit!23209)

(assert (=> b!665682 (= e!381505 Unit!23211)))

(declare-fun b!665683 () Bool)

(declare-fun res!433099 () Bool)

(assert (=> b!665683 (=> (not res!433099) (not e!381510))))

(declare-fun arrayNoDuplicates!0 (array!39013 (_ BitVec 32) List!12644) Bool)

(assert (=> b!665683 (= res!433099 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12641))))

(declare-fun b!665684 () Bool)

(declare-fun e!381508 () Unit!23209)

(declare-fun Unit!23212 () Unit!23209)

(assert (=> b!665684 (= e!381508 Unit!23212)))

(declare-fun b!665685 () Bool)

(assert (=> b!665685 (= e!381504 (not (contains!3296 acc!681 k!2843)))))

(declare-fun b!665686 () Bool)

(declare-fun res!433101 () Bool)

(assert (=> b!665686 (=> (not res!433101) (not e!381510))))

(assert (=> b!665686 (= res!433101 (not (contains!3296 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665687 () Bool)

(assert (=> b!665687 (= e!381509 true)))

(declare-fun lt!310131 () Bool)

(assert (=> b!665687 (= lt!310131 (contains!3296 lt!310127 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665688 () Bool)

(declare-fun lt!310133 () Unit!23209)

(assert (=> b!665688 (= e!381508 lt!310133)))

(declare-fun lt!310132 () Unit!23209)

(declare-fun lemmaListSubSeqRefl!0 (List!12644) Unit!23209)

(assert (=> b!665688 (= lt!310132 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!58 (List!12644 List!12644) Bool)

(assert (=> b!665688 (subseq!58 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39013 List!12644 List!12644 (_ BitVec 32)) Unit!23209)

(declare-fun $colon$colon!187 (List!12644 (_ BitVec 64)) List!12644)

(assert (=> b!665688 (= lt!310133 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!187 acc!681 (select (arr!18696 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665688 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!665689 () Bool)

(declare-fun res!433110 () Bool)

(assert (=> b!665689 (=> res!433110 e!381509)))

(assert (=> b!665689 (= res!433110 (not (subseq!58 acc!681 lt!310127)))))

(declare-fun res!433106 () Bool)

(assert (=> start!60028 (=> (not res!433106) (not e!381510))))

(assert (=> start!60028 (= res!433106 (and (bvslt (size!19060 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19060 a!3626))))))

(assert (=> start!60028 e!381510))

(assert (=> start!60028 true))

(declare-fun array_inv!14555 (array!39013) Bool)

(assert (=> start!60028 (array_inv!14555 a!3626)))

(declare-fun b!665690 () Bool)

(declare-fun res!433108 () Bool)

(assert (=> b!665690 (=> res!433108 e!381509)))

(assert (=> b!665690 (= res!433108 (not (noDuplicate!570 lt!310127)))))

(declare-fun b!665691 () Bool)

(declare-fun res!433094 () Bool)

(assert (=> b!665691 (=> (not res!433094) (not e!381510))))

(assert (=> b!665691 (= res!433094 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19060 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!665692 () Bool)

(declare-fun res!433114 () Bool)

(assert (=> b!665692 (=> (not res!433114) (not e!381510))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!665692 (= res!433114 (validKeyInArray!0 k!2843))))

(declare-fun b!665693 () Bool)

(declare-fun res!433097 () Bool)

(assert (=> b!665693 (=> (not res!433097) (not e!381510))))

(assert (=> b!665693 (= res!433097 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!665694 () Bool)

(declare-fun res!433104 () Bool)

(assert (=> b!665694 (=> res!433104 e!381509)))

(declare-fun lt!310134 () Bool)

(assert (=> b!665694 (= res!433104 lt!310134)))

(declare-fun b!665695 () Bool)

(declare-fun res!433098 () Bool)

(assert (=> b!665695 (=> res!433098 e!381509)))

(assert (=> b!665695 (= res!433098 (contains!3296 acc!681 k!2843))))

(declare-fun b!665696 () Bool)

(declare-fun res!433096 () Bool)

(assert (=> b!665696 (=> res!433096 e!381509)))

(assert (=> b!665696 (= res!433096 (not (contains!3296 lt!310127 k!2843)))))

(declare-fun b!665697 () Bool)

(assert (=> b!665697 (= e!381510 (not e!381509))))

(declare-fun res!433105 () Bool)

(assert (=> b!665697 (=> res!433105 e!381509)))

(assert (=> b!665697 (= res!433105 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!55 (List!12644 (_ BitVec 64)) List!12644)

(assert (=> b!665697 (= (-!55 lt!310127 k!2843) acc!681)))

(assert (=> b!665697 (= lt!310127 ($colon$colon!187 acc!681 k!2843))))

(declare-fun lt!310130 () Unit!23209)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12644) Unit!23209)

(assert (=> b!665697 (= lt!310130 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!665697 (subseq!58 acc!681 acc!681)))

(declare-fun lt!310128 () Unit!23209)

(assert (=> b!665697 (= lt!310128 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665697 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310135 () Unit!23209)

(assert (=> b!665697 (= lt!310135 e!381508)))

(declare-fun c!76661 () Bool)

(assert (=> b!665697 (= c!76661 (validKeyInArray!0 (select (arr!18696 a!3626) from!3004)))))

(declare-fun lt!310129 () Unit!23209)

(assert (=> b!665697 (= lt!310129 e!381505)))

(declare-fun c!76660 () Bool)

(assert (=> b!665697 (= c!76660 lt!310134)))

(declare-fun arrayContainsKey!0 (array!39013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!665697 (= lt!310134 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665697 (arrayContainsKey!0 (array!39014 (store (arr!18696 a!3626) i!1382 k!2843) (size!19060 a!3626)) k!2843 from!3004)))

(declare-fun b!665698 () Bool)

(declare-fun res!433107 () Bool)

(assert (=> b!665698 (=> (not res!433107) (not e!381510))))

(assert (=> b!665698 (= res!433107 (not (contains!3296 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665699 () Bool)

(declare-fun res!433109 () Bool)

(assert (=> b!665699 (=> (not res!433109) (not e!381510))))

(assert (=> b!665699 (= res!433109 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!665700 () Bool)

(declare-fun Unit!23213 () Unit!23209)

(assert (=> b!665700 (= e!381505 Unit!23213)))

(declare-fun lt!310126 () Unit!23209)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39013 (_ BitVec 64) (_ BitVec 32)) Unit!23209)

(assert (=> b!665700 (= lt!310126 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!665700 false))

(declare-fun b!665701 () Bool)

(declare-fun res!433112 () Bool)

(assert (=> b!665701 (=> (not res!433112) (not e!381510))))

(assert (=> b!665701 (= res!433112 e!381506)))

(declare-fun res!433111 () Bool)

(assert (=> b!665701 (=> res!433111 e!381506)))

(assert (=> b!665701 (= res!433111 e!381507)))

(declare-fun res!433100 () Bool)

(assert (=> b!665701 (=> (not res!433100) (not e!381507))))

(assert (=> b!665701 (= res!433100 (bvsgt from!3004 i!1382))))

(assert (= (and start!60028 res!433106) b!665680))

(assert (= (and b!665680 res!433113) b!665686))

(assert (= (and b!665686 res!433101) b!665698))

(assert (= (and b!665698 res!433107) b!665701))

(assert (= (and b!665701 res!433100) b!665678))

(assert (= (and b!665701 (not res!433111)) b!665679))

(assert (= (and b!665679 res!433095) b!665685))

(assert (= (and b!665701 res!433112) b!665683))

(assert (= (and b!665683 res!433099) b!665693))

(assert (= (and b!665693 res!433097) b!665677))

(assert (= (and b!665677 res!433103) b!665692))

(assert (= (and b!665692 res!433114) b!665699))

(assert (= (and b!665699 res!433109) b!665691))

(assert (= (and b!665691 res!433094) b!665697))

(assert (= (and b!665697 c!76660) b!665700))

(assert (= (and b!665697 (not c!76660)) b!665682))

(assert (= (and b!665697 c!76661) b!665688))

(assert (= (and b!665697 (not c!76661)) b!665684))

(assert (= (and b!665697 (not res!433105)) b!665690))

(assert (= (and b!665690 (not res!433108)) b!665694))

(assert (= (and b!665694 (not res!433104)) b!665695))

(assert (= (and b!665695 (not res!433098)) b!665689))

(assert (= (and b!665689 (not res!433110)) b!665696))

(assert (= (and b!665696 (not res!433096)) b!665681))

(assert (= (and b!665681 (not res!433102)) b!665687))

(declare-fun m!637199 () Bool)

(assert (=> b!665698 m!637199))

(declare-fun m!637201 () Bool)

(assert (=> b!665696 m!637201))

(declare-fun m!637203 () Bool)

(assert (=> b!665700 m!637203))

(declare-fun m!637205 () Bool)

(assert (=> b!665687 m!637205))

(declare-fun m!637207 () Bool)

(assert (=> b!665685 m!637207))

(declare-fun m!637209 () Bool)

(assert (=> b!665693 m!637209))

(declare-fun m!637211 () Bool)

(assert (=> b!665680 m!637211))

(declare-fun m!637213 () Bool)

(assert (=> b!665681 m!637213))

(declare-fun m!637215 () Bool)

(assert (=> b!665686 m!637215))

(declare-fun m!637217 () Bool)

(assert (=> start!60028 m!637217))

(declare-fun m!637219 () Bool)

(assert (=> b!665699 m!637219))

(declare-fun m!637221 () Bool)

(assert (=> b!665697 m!637221))

(declare-fun m!637223 () Bool)

(assert (=> b!665697 m!637223))

(declare-fun m!637225 () Bool)

(assert (=> b!665697 m!637225))

(declare-fun m!637227 () Bool)

(assert (=> b!665697 m!637227))

(declare-fun m!637229 () Bool)

(assert (=> b!665697 m!637229))

(declare-fun m!637231 () Bool)

(assert (=> b!665697 m!637231))

(declare-fun m!637233 () Bool)

(assert (=> b!665697 m!637233))

(declare-fun m!637235 () Bool)

(assert (=> b!665697 m!637235))

(assert (=> b!665697 m!637225))

(declare-fun m!637237 () Bool)

(assert (=> b!665697 m!637237))

(declare-fun m!637239 () Bool)

(assert (=> b!665697 m!637239))

(declare-fun m!637241 () Bool)

(assert (=> b!665697 m!637241))

(assert (=> b!665678 m!637207))

(declare-fun m!637243 () Bool)

(assert (=> b!665689 m!637243))

(assert (=> b!665695 m!637207))

(declare-fun m!637245 () Bool)

(assert (=> b!665683 m!637245))

(assert (=> b!665688 m!637223))

(assert (=> b!665688 m!637225))

(declare-fun m!637247 () Bool)

(assert (=> b!665688 m!637247))

(declare-fun m!637249 () Bool)

(assert (=> b!665688 m!637249))

(assert (=> b!665688 m!637225))

(assert (=> b!665688 m!637247))

(assert (=> b!665688 m!637231))

(assert (=> b!665688 m!637241))

(declare-fun m!637251 () Bool)

(assert (=> b!665690 m!637251))

(declare-fun m!637253 () Bool)

(assert (=> b!665692 m!637253))

(push 1)

(assert (not b!665690))

(assert (not b!665699))

(assert (not b!665698))

(assert (not b!665686))

(assert (not b!665697))

(assert (not b!665695))

(assert (not b!665683))

(assert (not b!665680))

(assert (not b!665700))

(assert (not b!665696))

(assert (not b!665685))

(assert (not b!665678))

(assert (not b!665693))

(assert (not b!665692))

(assert (not b!665681))

(assert (not b!665689))

(assert (not start!60028))

(assert (not b!665687))

(assert (not b!665688))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

