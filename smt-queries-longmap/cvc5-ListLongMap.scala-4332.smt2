; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60082 () Bool)

(assert start!60082)

(declare-fun b!667702 () Bool)

(declare-fun res!434814 () Bool)

(declare-fun e!382181 () Bool)

(assert (=> b!667702 (=> (not res!434814) (not e!382181))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39067 0))(
  ( (array!39068 (arr!18723 (Array (_ BitVec 32) (_ BitVec 64))) (size!19087 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39067)

(assert (=> b!667702 (= res!434814 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19087 a!3626))))))

(declare-fun b!667703 () Bool)

(declare-fun res!434813 () Bool)

(assert (=> b!667703 (=> (not res!434813) (not e!382181))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!667703 (= res!434813 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19087 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!667704 () Bool)

(declare-fun res!434800 () Bool)

(declare-fun e!382176 () Bool)

(assert (=> b!667704 (=> res!434800 e!382176)))

(declare-datatypes ((List!12671 0))(
  ( (Nil!12668) (Cons!12667 (h!13715 (_ BitVec 64)) (t!18891 List!12671)) )
))
(declare-fun lt!310943 () List!12671)

(declare-fun contains!3323 (List!12671 (_ BitVec 64)) Bool)

(assert (=> b!667704 (= res!434800 (contains!3323 lt!310943 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667705 () Bool)

(declare-fun res!434799 () Bool)

(assert (=> b!667705 (=> (not res!434799) (not e!382181))))

(declare-fun acc!681 () List!12671)

(declare-fun noDuplicate!597 (List!12671) Bool)

(assert (=> b!667705 (= res!434799 (noDuplicate!597 acc!681))))

(declare-fun b!667706 () Bool)

(declare-datatypes ((Unit!23344 0))(
  ( (Unit!23345) )
))
(declare-fun e!382178 () Unit!23344)

(declare-fun lt!310939 () Unit!23344)

(assert (=> b!667706 (= e!382178 lt!310939)))

(declare-fun lt!310940 () Unit!23344)

(declare-fun lemmaListSubSeqRefl!0 (List!12671) Unit!23344)

(assert (=> b!667706 (= lt!310940 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!85 (List!12671 List!12671) Bool)

(assert (=> b!667706 (subseq!85 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39067 List!12671 List!12671 (_ BitVec 32)) Unit!23344)

(declare-fun $colon$colon!214 (List!12671 (_ BitVec 64)) List!12671)

(assert (=> b!667706 (= lt!310939 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!214 acc!681 (select (arr!18723 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39067 (_ BitVec 32) List!12671) Bool)

(assert (=> b!667706 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!667707 () Bool)

(declare-fun e!382182 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!667707 (= e!382182 (not (contains!3323 lt!310943 k!2843)))))

(declare-fun b!667708 () Bool)

(declare-fun e!382177 () Unit!23344)

(declare-fun Unit!23346 () Unit!23344)

(assert (=> b!667708 (= e!382177 Unit!23346)))

(declare-fun b!667709 () Bool)

(declare-fun res!434803 () Bool)

(assert (=> b!667709 (=> (not res!434803) (not e!382181))))

(assert (=> b!667709 (= res!434803 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!667710 () Bool)

(declare-fun res!434797 () Bool)

(assert (=> b!667710 (=> res!434797 e!382176)))

(assert (=> b!667710 (= res!434797 (not (noDuplicate!597 lt!310943)))))

(declare-fun b!667711 () Bool)

(declare-fun Unit!23347 () Unit!23344)

(assert (=> b!667711 (= e!382178 Unit!23347)))

(declare-fun b!667712 () Bool)

(declare-fun res!434808 () Bool)

(assert (=> b!667712 (=> res!434808 e!382176)))

(assert (=> b!667712 (= res!434808 (contains!3323 lt!310943 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667713 () Bool)

(declare-fun res!434815 () Bool)

(assert (=> b!667713 (=> (not res!434815) (not e!382181))))

(assert (=> b!667713 (= res!434815 (not (contains!3323 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!434807 () Bool)

(assert (=> start!60082 (=> (not res!434807) (not e!382181))))

(assert (=> start!60082 (= res!434807 (and (bvslt (size!19087 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19087 a!3626))))))

(assert (=> start!60082 e!382181))

(assert (=> start!60082 true))

(declare-fun array_inv!14582 (array!39067) Bool)

(assert (=> start!60082 (array_inv!14582 a!3626)))

(declare-fun b!667714 () Bool)

(assert (=> b!667714 (= e!382181 (not e!382176))))

(declare-fun res!434801 () Bool)

(assert (=> b!667714 (=> res!434801 e!382176)))

(assert (=> b!667714 (= res!434801 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!667714 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!310943)))

(declare-fun lt!310944 () Unit!23344)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39067 (_ BitVec 64) (_ BitVec 32) List!12671 List!12671) Unit!23344)

(assert (=> b!667714 (= lt!310944 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!310943))))

(declare-fun -!82 (List!12671 (_ BitVec 64)) List!12671)

(assert (=> b!667714 (= (-!82 lt!310943 k!2843) acc!681)))

(assert (=> b!667714 (= lt!310943 ($colon$colon!214 acc!681 k!2843))))

(declare-fun lt!310936 () Unit!23344)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12671) Unit!23344)

(assert (=> b!667714 (= lt!310936 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!667714 (subseq!85 acc!681 acc!681)))

(declare-fun lt!310938 () Unit!23344)

(assert (=> b!667714 (= lt!310938 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667714 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310942 () Unit!23344)

(assert (=> b!667714 (= lt!310942 e!382178)))

(declare-fun c!76823 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!667714 (= c!76823 (validKeyInArray!0 (select (arr!18723 a!3626) from!3004)))))

(declare-fun lt!310945 () Unit!23344)

(assert (=> b!667714 (= lt!310945 e!382177)))

(declare-fun c!76822 () Bool)

(declare-fun arrayContainsKey!0 (array!39067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!667714 (= c!76822 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667714 (arrayContainsKey!0 (array!39068 (store (arr!18723 a!3626) i!1382 k!2843) (size!19087 a!3626)) k!2843 from!3004)))

(declare-fun b!667715 () Bool)

(declare-fun e!382180 () Bool)

(assert (=> b!667715 (= e!382180 (not (contains!3323 acc!681 k!2843)))))

(declare-fun b!667716 () Bool)

(declare-fun res!434795 () Bool)

(assert (=> b!667716 (=> (not res!434795) (not e!382181))))

(assert (=> b!667716 (= res!434795 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12668))))

(declare-fun b!667717 () Bool)

(declare-fun e!382179 () Bool)

(assert (=> b!667717 (= e!382179 e!382182)))

(declare-fun res!434810 () Bool)

(assert (=> b!667717 (=> (not res!434810) (not e!382182))))

(assert (=> b!667717 (= res!434810 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667718 () Bool)

(declare-fun e!382183 () Bool)

(assert (=> b!667718 (= e!382183 (contains!3323 acc!681 k!2843))))

(declare-fun b!667719 () Bool)

(declare-fun res!434804 () Bool)

(assert (=> b!667719 (=> (not res!434804) (not e!382181))))

(declare-fun e!382185 () Bool)

(assert (=> b!667719 (= res!434804 e!382185)))

(declare-fun res!434798 () Bool)

(assert (=> b!667719 (=> res!434798 e!382185)))

(assert (=> b!667719 (= res!434798 e!382183)))

(declare-fun res!434812 () Bool)

(assert (=> b!667719 (=> (not res!434812) (not e!382183))))

(assert (=> b!667719 (= res!434812 (bvsgt from!3004 i!1382))))

(declare-fun b!667720 () Bool)

(declare-fun e!382184 () Bool)

(assert (=> b!667720 (= e!382184 (contains!3323 lt!310943 k!2843))))

(declare-fun b!667721 () Bool)

(assert (=> b!667721 (= e!382185 e!382180)))

(declare-fun res!434802 () Bool)

(assert (=> b!667721 (=> (not res!434802) (not e!382180))))

(assert (=> b!667721 (= res!434802 (bvsle from!3004 i!1382))))

(declare-fun b!667722 () Bool)

(declare-fun res!434806 () Bool)

(assert (=> b!667722 (=> (not res!434806) (not e!382181))))

(assert (=> b!667722 (= res!434806 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!667723 () Bool)

(declare-fun res!434796 () Bool)

(assert (=> b!667723 (=> (not res!434796) (not e!382181))))

(assert (=> b!667723 (= res!434796 (validKeyInArray!0 k!2843))))

(declare-fun b!667724 () Bool)

(declare-fun Unit!23348 () Unit!23344)

(assert (=> b!667724 (= e!382177 Unit!23348)))

(declare-fun lt!310941 () Unit!23344)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39067 (_ BitVec 64) (_ BitVec 32)) Unit!23344)

(assert (=> b!667724 (= lt!310941 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!667724 false))

(declare-fun b!667725 () Bool)

(assert (=> b!667725 (= e!382176 true)))

(declare-fun lt!310937 () Bool)

(assert (=> b!667725 (= lt!310937 e!382179)))

(declare-fun res!434809 () Bool)

(assert (=> b!667725 (=> res!434809 e!382179)))

(assert (=> b!667725 (= res!434809 e!382184)))

(declare-fun res!434805 () Bool)

(assert (=> b!667725 (=> (not res!434805) (not e!382184))))

(assert (=> b!667725 (= res!434805 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667726 () Bool)

(declare-fun res!434811 () Bool)

(assert (=> b!667726 (=> (not res!434811) (not e!382181))))

(assert (=> b!667726 (= res!434811 (not (contains!3323 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60082 res!434807) b!667705))

(assert (= (and b!667705 res!434799) b!667713))

(assert (= (and b!667713 res!434815) b!667726))

(assert (= (and b!667726 res!434811) b!667719))

(assert (= (and b!667719 res!434812) b!667718))

(assert (= (and b!667719 (not res!434798)) b!667721))

(assert (= (and b!667721 res!434802) b!667715))

(assert (= (and b!667719 res!434804) b!667716))

(assert (= (and b!667716 res!434795) b!667709))

(assert (= (and b!667709 res!434803) b!667702))

(assert (= (and b!667702 res!434814) b!667723))

(assert (= (and b!667723 res!434796) b!667722))

(assert (= (and b!667722 res!434806) b!667703))

(assert (= (and b!667703 res!434813) b!667714))

(assert (= (and b!667714 c!76822) b!667724))

(assert (= (and b!667714 (not c!76822)) b!667708))

(assert (= (and b!667714 c!76823) b!667706))

(assert (= (and b!667714 (not c!76823)) b!667711))

(assert (= (and b!667714 (not res!434801)) b!667710))

(assert (= (and b!667710 (not res!434797)) b!667712))

(assert (= (and b!667712 (not res!434808)) b!667704))

(assert (= (and b!667704 (not res!434800)) b!667725))

(assert (= (and b!667725 res!434805) b!667720))

(assert (= (and b!667725 (not res!434809)) b!667717))

(assert (= (and b!667717 res!434810) b!667707))

(declare-fun m!638715 () Bool)

(assert (=> b!667720 m!638715))

(declare-fun m!638717 () Bool)

(assert (=> b!667716 m!638717))

(declare-fun m!638719 () Bool)

(assert (=> b!667723 m!638719))

(declare-fun m!638721 () Bool)

(assert (=> b!667715 m!638721))

(declare-fun m!638723 () Bool)

(assert (=> b!667726 m!638723))

(assert (=> b!667707 m!638715))

(assert (=> b!667718 m!638721))

(declare-fun m!638725 () Bool)

(assert (=> b!667706 m!638725))

(declare-fun m!638727 () Bool)

(assert (=> b!667706 m!638727))

(declare-fun m!638729 () Bool)

(assert (=> b!667706 m!638729))

(declare-fun m!638731 () Bool)

(assert (=> b!667706 m!638731))

(assert (=> b!667706 m!638727))

(assert (=> b!667706 m!638729))

(declare-fun m!638733 () Bool)

(assert (=> b!667706 m!638733))

(declare-fun m!638735 () Bool)

(assert (=> b!667706 m!638735))

(declare-fun m!638737 () Bool)

(assert (=> start!60082 m!638737))

(declare-fun m!638739 () Bool)

(assert (=> b!667722 m!638739))

(declare-fun m!638741 () Bool)

(assert (=> b!667704 m!638741))

(assert (=> b!667714 m!638725))

(assert (=> b!667714 m!638727))

(declare-fun m!638743 () Bool)

(assert (=> b!667714 m!638743))

(declare-fun m!638745 () Bool)

(assert (=> b!667714 m!638745))

(declare-fun m!638747 () Bool)

(assert (=> b!667714 m!638747))

(declare-fun m!638749 () Bool)

(assert (=> b!667714 m!638749))

(assert (=> b!667714 m!638733))

(declare-fun m!638751 () Bool)

(assert (=> b!667714 m!638751))

(declare-fun m!638753 () Bool)

(assert (=> b!667714 m!638753))

(assert (=> b!667714 m!638727))

(declare-fun m!638755 () Bool)

(assert (=> b!667714 m!638755))

(declare-fun m!638757 () Bool)

(assert (=> b!667714 m!638757))

(declare-fun m!638759 () Bool)

(assert (=> b!667714 m!638759))

(assert (=> b!667714 m!638735))

(declare-fun m!638761 () Bool)

(assert (=> b!667713 m!638761))

(declare-fun m!638763 () Bool)

(assert (=> b!667705 m!638763))

(declare-fun m!638765 () Bool)

(assert (=> b!667724 m!638765))

(declare-fun m!638767 () Bool)

(assert (=> b!667709 m!638767))

(declare-fun m!638769 () Bool)

(assert (=> b!667710 m!638769))

(declare-fun m!638771 () Bool)

(assert (=> b!667712 m!638771))

(push 1)

(assert (not b!667716))

(assert (not b!667718))

(assert (not b!667722))

(assert (not b!667714))

(assert (not b!667705))

(assert (not b!667726))

(assert (not b!667706))

(assert (not start!60082))

(assert (not b!667707))

(assert (not b!667709))

(assert (not b!667723))

(assert (not b!667712))

(assert (not b!667715))

(assert (not b!667710))

(assert (not b!667713))

(assert (not b!667724))

(assert (not b!667704))

(assert (not b!667720))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

