; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60086 () Bool)

(assert start!60086)

(declare-fun b!669805 () Bool)

(declare-fun res!436650 () Bool)

(declare-fun e!383065 () Bool)

(assert (=> b!669805 (=> (not res!436650) (not e!383065))))

(declare-datatypes ((array!39133 0))(
  ( (array!39134 (arr!18759 (Array (_ BitVec 32) (_ BitVec 64))) (size!19123 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39133)

(declare-datatypes ((List!12800 0))(
  ( (Nil!12797) (Cons!12796 (h!13841 (_ BitVec 64)) (t!19028 List!12800)) )
))
(declare-fun arrayNoDuplicates!0 (array!39133 (_ BitVec 32) List!12800) Bool)

(assert (=> b!669805 (= res!436650 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12797))))

(declare-fun b!669806 () Bool)

(declare-fun res!436653 () Bool)

(declare-fun e!383066 () Bool)

(assert (=> b!669806 (=> res!436653 e!383066)))

(declare-fun lt!311767 () List!12800)

(declare-fun contains!3377 (List!12800 (_ BitVec 64)) Bool)

(assert (=> b!669806 (= res!436653 (contains!3377 lt!311767 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669807 () Bool)

(declare-fun res!436648 () Bool)

(assert (=> b!669807 (=> (not res!436648) (not e!383065))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!669807 (= res!436648 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19123 a!3626))))))

(declare-fun b!669809 () Bool)

(declare-datatypes ((Unit!23520 0))(
  ( (Unit!23521) )
))
(declare-fun e!383062 () Unit!23520)

(declare-fun Unit!23522 () Unit!23520)

(assert (=> b!669809 (= e!383062 Unit!23522)))

(declare-fun b!669810 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!669810 (= e!383066 (bvsle from!3004 (size!19123 a!3626)))))

(declare-fun lt!311773 () array!39133)

(assert (=> b!669810 (arrayNoDuplicates!0 lt!311773 (bvadd #b00000000000000000000000000000001 from!3004) lt!311767)))

(declare-fun lt!311770 () Unit!23520)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39133 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12800) Unit!23520)

(assert (=> b!669810 (= lt!311770 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!311767))))

(declare-fun b!669811 () Bool)

(declare-fun Unit!23523 () Unit!23520)

(assert (=> b!669811 (= e!383062 Unit!23523)))

(declare-fun lt!311769 () Unit!23520)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39133 (_ BitVec 64) (_ BitVec 32)) Unit!23520)

(assert (=> b!669811 (= lt!311769 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!669811 false))

(declare-fun b!669812 () Bool)

(declare-fun res!436645 () Bool)

(assert (=> b!669812 (=> (not res!436645) (not e!383065))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!669812 (= res!436645 (validKeyInArray!0 k!2843))))

(declare-fun b!669813 () Bool)

(declare-fun res!436641 () Bool)

(assert (=> b!669813 (=> (not res!436641) (not e!383065))))

(declare-fun acc!681 () List!12800)

(assert (=> b!669813 (= res!436641 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!669814 () Bool)

(declare-fun e!383060 () Bool)

(assert (=> b!669814 (= e!383060 (not (contains!3377 lt!311767 k!2843)))))

(declare-fun b!669815 () Bool)

(declare-fun res!436657 () Bool)

(assert (=> b!669815 (=> (not res!436657) (not e!383065))))

(declare-fun arrayContainsKey!0 (array!39133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!669815 (= res!436657 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!669816 () Bool)

(assert (=> b!669816 (= e!383065 (not e!383066))))

(declare-fun res!436651 () Bool)

(assert (=> b!669816 (=> res!436651 e!383066)))

(assert (=> b!669816 (= res!436651 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!669816 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311767)))

(declare-fun lt!311771 () Unit!23520)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39133 (_ BitVec 64) (_ BitVec 32) List!12800 List!12800) Unit!23520)

(assert (=> b!669816 (= lt!311771 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311767))))

(declare-fun -!114 (List!12800 (_ BitVec 64)) List!12800)

(assert (=> b!669816 (= (-!114 lt!311767 k!2843) acc!681)))

(declare-fun $colon$colon!248 (List!12800 (_ BitVec 64)) List!12800)

(assert (=> b!669816 (= lt!311767 ($colon$colon!248 acc!681 k!2843))))

(declare-fun lt!311774 () Unit!23520)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12800) Unit!23520)

(assert (=> b!669816 (= lt!311774 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!116 (List!12800 List!12800) Bool)

(assert (=> b!669816 (subseq!116 acc!681 acc!681)))

(declare-fun lt!311768 () Unit!23520)

(declare-fun lemmaListSubSeqRefl!0 (List!12800) Unit!23520)

(assert (=> b!669816 (= lt!311768 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669816 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311776 () Unit!23520)

(declare-fun e!383064 () Unit!23520)

(assert (=> b!669816 (= lt!311776 e!383064)))

(declare-fun c!76951 () Bool)

(assert (=> b!669816 (= c!76951 (validKeyInArray!0 (select (arr!18759 a!3626) from!3004)))))

(declare-fun lt!311775 () Unit!23520)

(assert (=> b!669816 (= lt!311775 e!383062)))

(declare-fun c!76952 () Bool)

(assert (=> b!669816 (= c!76952 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669816 (arrayContainsKey!0 lt!311773 k!2843 from!3004)))

(assert (=> b!669816 (= lt!311773 (array!39134 (store (arr!18759 a!3626) i!1382 k!2843) (size!19123 a!3626)))))

(declare-fun b!669817 () Bool)

(declare-fun lt!311766 () Unit!23520)

(assert (=> b!669817 (= e!383064 lt!311766)))

(declare-fun lt!311772 () Unit!23520)

(assert (=> b!669817 (= lt!311772 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669817 (subseq!116 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39133 List!12800 List!12800 (_ BitVec 32)) Unit!23520)

(assert (=> b!669817 (= lt!311766 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!248 acc!681 (select (arr!18759 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669817 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun res!436655 () Bool)

(assert (=> start!60086 (=> (not res!436655) (not e!383065))))

(assert (=> start!60086 (= res!436655 (and (bvslt (size!19123 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19123 a!3626))))))

(assert (=> start!60086 e!383065))

(assert (=> start!60086 true))

(declare-fun array_inv!14555 (array!39133) Bool)

(assert (=> start!60086 (array_inv!14555 a!3626)))

(declare-fun b!669808 () Bool)

(declare-fun e!383061 () Bool)

(assert (=> b!669808 (= e!383061 (contains!3377 lt!311767 k!2843))))

(declare-fun b!669818 () Bool)

(declare-fun res!436639 () Bool)

(assert (=> b!669818 (=> (not res!436639) (not e!383065))))

(declare-fun e!383067 () Bool)

(assert (=> b!669818 (= res!436639 e!383067)))

(declare-fun res!436644 () Bool)

(assert (=> b!669818 (=> res!436644 e!383067)))

(declare-fun e!383063 () Bool)

(assert (=> b!669818 (= res!436644 e!383063)))

(declare-fun res!436656 () Bool)

(assert (=> b!669818 (=> (not res!436656) (not e!383063))))

(assert (=> b!669818 (= res!436656 (bvsgt from!3004 i!1382))))

(declare-fun b!669819 () Bool)

(declare-fun res!436647 () Bool)

(assert (=> b!669819 (=> (not res!436647) (not e!383065))))

(assert (=> b!669819 (= res!436647 (not (contains!3377 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669820 () Bool)

(declare-fun res!436637 () Bool)

(assert (=> b!669820 (=> (not res!436637) (not e!383065))))

(assert (=> b!669820 (= res!436637 (not (contains!3377 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669821 () Bool)

(declare-fun res!436652 () Bool)

(assert (=> b!669821 (=> res!436652 e!383066)))

(assert (=> b!669821 (= res!436652 (contains!3377 lt!311767 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669822 () Bool)

(declare-fun Unit!23524 () Unit!23520)

(assert (=> b!669822 (= e!383064 Unit!23524)))

(declare-fun b!669823 () Bool)

(assert (=> b!669823 (= e!383063 (contains!3377 acc!681 k!2843))))

(declare-fun b!669824 () Bool)

(declare-fun res!436646 () Bool)

(assert (=> b!669824 (=> res!436646 e!383066)))

(declare-fun e!383059 () Bool)

(assert (=> b!669824 (= res!436646 e!383059)))

(declare-fun res!436649 () Bool)

(assert (=> b!669824 (=> (not res!436649) (not e!383059))))

(assert (=> b!669824 (= res!436649 e!383060)))

(declare-fun res!436642 () Bool)

(assert (=> b!669824 (=> res!436642 e!383060)))

(assert (=> b!669824 (= res!436642 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669825 () Bool)

(declare-fun e!383057 () Bool)

(assert (=> b!669825 (= e!383057 (not (contains!3377 acc!681 k!2843)))))

(declare-fun b!669826 () Bool)

(declare-fun res!436638 () Bool)

(assert (=> b!669826 (=> (not res!436638) (not e!383065))))

(assert (=> b!669826 (= res!436638 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19123 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!669827 () Bool)

(declare-fun res!436640 () Bool)

(assert (=> b!669827 (=> res!436640 e!383066)))

(declare-fun noDuplicate!624 (List!12800) Bool)

(assert (=> b!669827 (= res!436640 (not (noDuplicate!624 lt!311767)))))

(declare-fun b!669828 () Bool)

(assert (=> b!669828 (= e!383059 e!383061)))

(declare-fun res!436654 () Bool)

(assert (=> b!669828 (=> res!436654 e!383061)))

(assert (=> b!669828 (= res!436654 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669829 () Bool)

(declare-fun res!436658 () Bool)

(assert (=> b!669829 (=> (not res!436658) (not e!383065))))

(assert (=> b!669829 (= res!436658 (noDuplicate!624 acc!681))))

(declare-fun b!669830 () Bool)

(assert (=> b!669830 (= e!383067 e!383057)))

(declare-fun res!436643 () Bool)

(assert (=> b!669830 (=> (not res!436643) (not e!383057))))

(assert (=> b!669830 (= res!436643 (bvsle from!3004 i!1382))))

(assert (= (and start!60086 res!436655) b!669829))

(assert (= (and b!669829 res!436658) b!669819))

(assert (= (and b!669819 res!436647) b!669820))

(assert (= (and b!669820 res!436637) b!669818))

(assert (= (and b!669818 res!436656) b!669823))

(assert (= (and b!669818 (not res!436644)) b!669830))

(assert (= (and b!669830 res!436643) b!669825))

(assert (= (and b!669818 res!436639) b!669805))

(assert (= (and b!669805 res!436650) b!669813))

(assert (= (and b!669813 res!436641) b!669807))

(assert (= (and b!669807 res!436648) b!669812))

(assert (= (and b!669812 res!436645) b!669815))

(assert (= (and b!669815 res!436657) b!669826))

(assert (= (and b!669826 res!436638) b!669816))

(assert (= (and b!669816 c!76952) b!669811))

(assert (= (and b!669816 (not c!76952)) b!669809))

(assert (= (and b!669816 c!76951) b!669817))

(assert (= (and b!669816 (not c!76951)) b!669822))

(assert (= (and b!669816 (not res!436651)) b!669827))

(assert (= (and b!669827 (not res!436640)) b!669806))

(assert (= (and b!669806 (not res!436653)) b!669821))

(assert (= (and b!669821 (not res!436652)) b!669824))

(assert (= (and b!669824 (not res!436642)) b!669814))

(assert (= (and b!669824 res!436649) b!669828))

(assert (= (and b!669828 (not res!436654)) b!669808))

(assert (= (and b!669824 (not res!436646)) b!669810))

(declare-fun m!639815 () Bool)

(assert (=> b!669813 m!639815))

(declare-fun m!639817 () Bool)

(assert (=> b!669811 m!639817))

(declare-fun m!639819 () Bool)

(assert (=> b!669821 m!639819))

(declare-fun m!639821 () Bool)

(assert (=> b!669812 m!639821))

(declare-fun m!639823 () Bool)

(assert (=> b!669829 m!639823))

(declare-fun m!639825 () Bool)

(assert (=> b!669815 m!639825))

(declare-fun m!639827 () Bool)

(assert (=> b!669825 m!639827))

(declare-fun m!639829 () Bool)

(assert (=> b!669817 m!639829))

(declare-fun m!639831 () Bool)

(assert (=> b!669817 m!639831))

(declare-fun m!639833 () Bool)

(assert (=> b!669817 m!639833))

(declare-fun m!639835 () Bool)

(assert (=> b!669817 m!639835))

(assert (=> b!669817 m!639831))

(assert (=> b!669817 m!639833))

(declare-fun m!639837 () Bool)

(assert (=> b!669817 m!639837))

(declare-fun m!639839 () Bool)

(assert (=> b!669817 m!639839))

(assert (=> b!669816 m!639829))

(assert (=> b!669816 m!639831))

(declare-fun m!639841 () Bool)

(assert (=> b!669816 m!639841))

(declare-fun m!639843 () Bool)

(assert (=> b!669816 m!639843))

(declare-fun m!639845 () Bool)

(assert (=> b!669816 m!639845))

(declare-fun m!639847 () Bool)

(assert (=> b!669816 m!639847))

(declare-fun m!639849 () Bool)

(assert (=> b!669816 m!639849))

(declare-fun m!639851 () Bool)

(assert (=> b!669816 m!639851))

(declare-fun m!639853 () Bool)

(assert (=> b!669816 m!639853))

(assert (=> b!669816 m!639831))

(declare-fun m!639855 () Bool)

(assert (=> b!669816 m!639855))

(assert (=> b!669816 m!639839))

(assert (=> b!669816 m!639837))

(declare-fun m!639857 () Bool)

(assert (=> b!669816 m!639857))

(declare-fun m!639859 () Bool)

(assert (=> b!669819 m!639859))

(declare-fun m!639861 () Bool)

(assert (=> b!669806 m!639861))

(declare-fun m!639863 () Bool)

(assert (=> b!669827 m!639863))

(declare-fun m!639865 () Bool)

(assert (=> b!669805 m!639865))

(declare-fun m!639867 () Bool)

(assert (=> b!669808 m!639867))

(declare-fun m!639869 () Bool)

(assert (=> b!669810 m!639869))

(declare-fun m!639871 () Bool)

(assert (=> b!669810 m!639871))

(assert (=> b!669823 m!639827))

(declare-fun m!639873 () Bool)

(assert (=> start!60086 m!639873))

(assert (=> b!669814 m!639867))

(declare-fun m!639875 () Bool)

(assert (=> b!669820 m!639875))

(push 1)

(assert (not b!669820))

(assert (not b!669827))

(assert (not b!669817))

(assert (not b!669811))

(assert (not b!669814))

(assert (not b!669812))

(assert (not b!669815))

(assert (not b!669816))

(assert (not b!669813))

(assert (not b!669821))

(assert (not b!669823))

(assert (not b!669805))

(assert (not b!669819))

(assert (not b!669810))

(assert (not b!669808))

(assert (not start!60086))

(assert (not b!669806))

(assert (not b!669829))

(assert (not b!669825))

(check-sat)

(pop 1)

(push 1)

(check-sat)

