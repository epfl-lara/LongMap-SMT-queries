; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60090 () Bool)

(assert start!60090)

(declare-fun b!669961 () Bool)

(declare-fun res!436771 () Bool)

(declare-fun e!383130 () Bool)

(assert (=> b!669961 (=> (not res!436771) (not e!383130))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39137 0))(
  ( (array!39138 (arr!18761 (Array (_ BitVec 32) (_ BitVec 64))) (size!19125 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39137)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!669961 (= res!436771 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19125 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!669962 () Bool)

(declare-datatypes ((Unit!23530 0))(
  ( (Unit!23531) )
))
(declare-fun e!383127 () Unit!23530)

(declare-fun lt!311835 () Unit!23530)

(assert (=> b!669962 (= e!383127 lt!311835)))

(declare-fun lt!311838 () Unit!23530)

(declare-datatypes ((List!12802 0))(
  ( (Nil!12799) (Cons!12798 (h!13843 (_ BitVec 64)) (t!19030 List!12802)) )
))
(declare-fun acc!681 () List!12802)

(declare-fun lemmaListSubSeqRefl!0 (List!12802) Unit!23530)

(assert (=> b!669962 (= lt!311838 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!118 (List!12802 List!12802) Bool)

(assert (=> b!669962 (subseq!118 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39137 List!12802 List!12802 (_ BitVec 32)) Unit!23530)

(declare-fun $colon$colon!250 (List!12802 (_ BitVec 64)) List!12802)

(assert (=> b!669962 (= lt!311835 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!250 acc!681 (select (arr!18761 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39137 (_ BitVec 32) List!12802) Bool)

(assert (=> b!669962 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!669963 () Bool)

(declare-fun res!436781 () Bool)

(declare-fun e!383125 () Bool)

(assert (=> b!669963 (=> res!436781 e!383125)))

(declare-fun lt!311841 () List!12802)

(declare-fun contains!3379 (List!12802 (_ BitVec 64)) Bool)

(assert (=> b!669963 (= res!436781 (contains!3379 lt!311841 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669964 () Bool)

(assert (=> b!669964 (= e!383125 (bvsle from!3004 (size!19125 a!3626)))))

(declare-fun lt!311833 () array!39137)

(assert (=> b!669964 (arrayNoDuplicates!0 lt!311833 (bvadd #b00000000000000000000000000000001 from!3004) lt!311841)))

(declare-fun lt!311837 () Unit!23530)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39137 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12802) Unit!23530)

(assert (=> b!669964 (= lt!311837 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!311841))))

(declare-fun b!669965 () Bool)

(declare-fun res!436770 () Bool)

(assert (=> b!669965 (=> (not res!436770) (not e!383130))))

(declare-fun noDuplicate!626 (List!12802) Bool)

(assert (=> b!669965 (= res!436770 (noDuplicate!626 acc!681))))

(declare-fun b!669966 () Bool)

(declare-fun e!383128 () Bool)

(assert (=> b!669966 (= e!383128 (not (contains!3379 lt!311841 k!2843)))))

(declare-fun b!669967 () Bool)

(declare-fun res!436787 () Bool)

(assert (=> b!669967 (=> (not res!436787) (not e!383130))))

(assert (=> b!669967 (= res!436787 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!669968 () Bool)

(declare-fun res!436790 () Bool)

(assert (=> b!669968 (=> (not res!436790) (not e!383130))))

(assert (=> b!669968 (= res!436790 (not (contains!3379 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669969 () Bool)

(declare-fun e!383132 () Bool)

(assert (=> b!669969 (= e!383132 (contains!3379 lt!311841 k!2843))))

(declare-fun b!669970 () Bool)

(declare-fun e!383129 () Bool)

(assert (=> b!669970 (= e!383129 (contains!3379 acc!681 k!2843))))

(declare-fun b!669971 () Bool)

(declare-fun Unit!23532 () Unit!23530)

(assert (=> b!669971 (= e!383127 Unit!23532)))

(declare-fun b!669972 () Bool)

(declare-fun res!436780 () Bool)

(assert (=> b!669972 (=> (not res!436780) (not e!383130))))

(declare-fun arrayContainsKey!0 (array!39137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!669972 (= res!436780 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!669973 () Bool)

(declare-fun res!436772 () Bool)

(assert (=> b!669973 (=> res!436772 e!383125)))

(declare-fun e!383124 () Bool)

(assert (=> b!669973 (= res!436772 e!383124)))

(declare-fun res!436774 () Bool)

(assert (=> b!669973 (=> (not res!436774) (not e!383124))))

(assert (=> b!669973 (= res!436774 e!383128)))

(declare-fun res!436783 () Bool)

(assert (=> b!669973 (=> res!436783 e!383128)))

(assert (=> b!669973 (= res!436783 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669974 () Bool)

(declare-fun res!436786 () Bool)

(assert (=> b!669974 (=> (not res!436786) (not e!383130))))

(declare-fun e!383123 () Bool)

(assert (=> b!669974 (= res!436786 e!383123)))

(declare-fun res!436773 () Bool)

(assert (=> b!669974 (=> res!436773 e!383123)))

(assert (=> b!669974 (= res!436773 e!383129)))

(declare-fun res!436779 () Bool)

(assert (=> b!669974 (=> (not res!436779) (not e!383129))))

(assert (=> b!669974 (= res!436779 (bvsgt from!3004 i!1382))))

(declare-fun b!669975 () Bool)

(declare-fun res!436777 () Bool)

(assert (=> b!669975 (=> (not res!436777) (not e!383130))))

(assert (=> b!669975 (= res!436777 (not (contains!3379 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669976 () Bool)

(declare-fun res!436778 () Bool)

(assert (=> b!669976 (=> (not res!436778) (not e!383130))))

(assert (=> b!669976 (= res!436778 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12799))))

(declare-fun b!669977 () Bool)

(declare-fun e!383126 () Bool)

(assert (=> b!669977 (= e!383126 (not (contains!3379 acc!681 k!2843)))))

(declare-fun b!669978 () Bool)

(declare-fun res!436769 () Bool)

(assert (=> b!669978 (=> (not res!436769) (not e!383130))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!669978 (= res!436769 (validKeyInArray!0 k!2843))))

(declare-fun b!669979 () Bool)

(declare-fun res!436775 () Bool)

(assert (=> b!669979 (=> res!436775 e!383125)))

(assert (=> b!669979 (= res!436775 (not (noDuplicate!626 lt!311841)))))

(declare-fun b!669981 () Bool)

(declare-fun res!436776 () Bool)

(assert (=> b!669981 (=> (not res!436776) (not e!383130))))

(assert (=> b!669981 (= res!436776 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19125 a!3626))))))

(declare-fun b!669982 () Bool)

(assert (=> b!669982 (= e!383123 e!383126)))

(declare-fun res!436784 () Bool)

(assert (=> b!669982 (=> (not res!436784) (not e!383126))))

(assert (=> b!669982 (= res!436784 (bvsle from!3004 i!1382))))

(declare-fun b!669980 () Bool)

(assert (=> b!669980 (= e!383130 (not e!383125))))

(declare-fun res!436785 () Bool)

(assert (=> b!669980 (=> res!436785 e!383125)))

(assert (=> b!669980 (= res!436785 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!669980 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311841)))

(declare-fun lt!311834 () Unit!23530)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39137 (_ BitVec 64) (_ BitVec 32) List!12802 List!12802) Unit!23530)

(assert (=> b!669980 (= lt!311834 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311841))))

(declare-fun -!116 (List!12802 (_ BitVec 64)) List!12802)

(assert (=> b!669980 (= (-!116 lt!311841 k!2843) acc!681)))

(assert (=> b!669980 (= lt!311841 ($colon$colon!250 acc!681 k!2843))))

(declare-fun lt!311836 () Unit!23530)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12802) Unit!23530)

(assert (=> b!669980 (= lt!311836 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!669980 (subseq!118 acc!681 acc!681)))

(declare-fun lt!311842 () Unit!23530)

(assert (=> b!669980 (= lt!311842 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669980 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311840 () Unit!23530)

(assert (=> b!669980 (= lt!311840 e!383127)))

(declare-fun c!76963 () Bool)

(assert (=> b!669980 (= c!76963 (validKeyInArray!0 (select (arr!18761 a!3626) from!3004)))))

(declare-fun lt!311839 () Unit!23530)

(declare-fun e!383133 () Unit!23530)

(assert (=> b!669980 (= lt!311839 e!383133)))

(declare-fun c!76964 () Bool)

(assert (=> b!669980 (= c!76964 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669980 (arrayContainsKey!0 lt!311833 k!2843 from!3004)))

(assert (=> b!669980 (= lt!311833 (array!39138 (store (arr!18761 a!3626) i!1382 k!2843) (size!19125 a!3626)))))

(declare-fun res!436789 () Bool)

(assert (=> start!60090 (=> (not res!436789) (not e!383130))))

(assert (=> start!60090 (= res!436789 (and (bvslt (size!19125 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19125 a!3626))))))

(assert (=> start!60090 e!383130))

(assert (=> start!60090 true))

(declare-fun array_inv!14557 (array!39137) Bool)

(assert (=> start!60090 (array_inv!14557 a!3626)))

(declare-fun b!669983 () Bool)

(declare-fun res!436782 () Bool)

(assert (=> b!669983 (=> res!436782 e!383125)))

(assert (=> b!669983 (= res!436782 (contains!3379 lt!311841 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669984 () Bool)

(declare-fun Unit!23533 () Unit!23530)

(assert (=> b!669984 (= e!383133 Unit!23533)))

(declare-fun b!669985 () Bool)

(assert (=> b!669985 (= e!383124 e!383132)))

(declare-fun res!436788 () Bool)

(assert (=> b!669985 (=> res!436788 e!383132)))

(assert (=> b!669985 (= res!436788 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669986 () Bool)

(declare-fun Unit!23534 () Unit!23530)

(assert (=> b!669986 (= e!383133 Unit!23534)))

(declare-fun lt!311832 () Unit!23530)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39137 (_ BitVec 64) (_ BitVec 32)) Unit!23530)

(assert (=> b!669986 (= lt!311832 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!669986 false))

(assert (= (and start!60090 res!436789) b!669965))

(assert (= (and b!669965 res!436770) b!669975))

(assert (= (and b!669975 res!436777) b!669968))

(assert (= (and b!669968 res!436790) b!669974))

(assert (= (and b!669974 res!436779) b!669970))

(assert (= (and b!669974 (not res!436773)) b!669982))

(assert (= (and b!669982 res!436784) b!669977))

(assert (= (and b!669974 res!436786) b!669976))

(assert (= (and b!669976 res!436778) b!669967))

(assert (= (and b!669967 res!436787) b!669981))

(assert (= (and b!669981 res!436776) b!669978))

(assert (= (and b!669978 res!436769) b!669972))

(assert (= (and b!669972 res!436780) b!669961))

(assert (= (and b!669961 res!436771) b!669980))

(assert (= (and b!669980 c!76964) b!669986))

(assert (= (and b!669980 (not c!76964)) b!669984))

(assert (= (and b!669980 c!76963) b!669962))

(assert (= (and b!669980 (not c!76963)) b!669971))

(assert (= (and b!669980 (not res!436785)) b!669979))

(assert (= (and b!669979 (not res!436775)) b!669983))

(assert (= (and b!669983 (not res!436782)) b!669963))

(assert (= (and b!669963 (not res!436781)) b!669973))

(assert (= (and b!669973 (not res!436783)) b!669966))

(assert (= (and b!669973 res!436774) b!669985))

(assert (= (and b!669985 (not res!436788)) b!669969))

(assert (= (and b!669973 (not res!436772)) b!669964))

(declare-fun m!639939 () Bool)

(assert (=> b!669976 m!639939))

(declare-fun m!639941 () Bool)

(assert (=> b!669964 m!639941))

(declare-fun m!639943 () Bool)

(assert (=> b!669964 m!639943))

(declare-fun m!639945 () Bool)

(assert (=> b!669970 m!639945))

(declare-fun m!639947 () Bool)

(assert (=> b!669978 m!639947))

(assert (=> b!669977 m!639945))

(declare-fun m!639949 () Bool)

(assert (=> b!669969 m!639949))

(declare-fun m!639951 () Bool)

(assert (=> b!669980 m!639951))

(declare-fun m!639953 () Bool)

(assert (=> b!669980 m!639953))

(declare-fun m!639955 () Bool)

(assert (=> b!669980 m!639955))

(declare-fun m!639957 () Bool)

(assert (=> b!669980 m!639957))

(declare-fun m!639959 () Bool)

(assert (=> b!669980 m!639959))

(declare-fun m!639961 () Bool)

(assert (=> b!669980 m!639961))

(declare-fun m!639963 () Bool)

(assert (=> b!669980 m!639963))

(declare-fun m!639965 () Bool)

(assert (=> b!669980 m!639965))

(declare-fun m!639967 () Bool)

(assert (=> b!669980 m!639967))

(declare-fun m!639969 () Bool)

(assert (=> b!669980 m!639969))

(declare-fun m!639971 () Bool)

(assert (=> b!669980 m!639971))

(assert (=> b!669980 m!639955))

(declare-fun m!639973 () Bool)

(assert (=> b!669980 m!639973))

(declare-fun m!639975 () Bool)

(assert (=> b!669980 m!639975))

(declare-fun m!639977 () Bool)

(assert (=> b!669986 m!639977))

(declare-fun m!639979 () Bool)

(assert (=> b!669979 m!639979))

(declare-fun m!639981 () Bool)

(assert (=> b!669968 m!639981))

(declare-fun m!639983 () Bool)

(assert (=> b!669967 m!639983))

(assert (=> b!669966 m!639949))

(declare-fun m!639985 () Bool)

(assert (=> start!60090 m!639985))

(declare-fun m!639987 () Bool)

(assert (=> b!669975 m!639987))

(declare-fun m!639989 () Bool)

(assert (=> b!669972 m!639989))

(declare-fun m!639991 () Bool)

(assert (=> b!669965 m!639991))

(assert (=> b!669962 m!639953))

(assert (=> b!669962 m!639955))

(declare-fun m!639993 () Bool)

(assert (=> b!669962 m!639993))

(declare-fun m!639995 () Bool)

(assert (=> b!669962 m!639995))

(assert (=> b!669962 m!639955))

(assert (=> b!669962 m!639993))

(assert (=> b!669962 m!639967))

(assert (=> b!669962 m!639975))

(declare-fun m!639997 () Bool)

(assert (=> b!669963 m!639997))

(declare-fun m!639999 () Bool)

(assert (=> b!669983 m!639999))

(push 1)

(assert (not b!669975))

(assert (not b!669986))

(assert (not b!669967))

(assert (not b!669964))

(assert (not b!669979))

(assert (not b!669969))

(assert (not b!669966))

(assert (not b!669977))

(assert (not b!669963))

(assert (not b!669970))

(assert (not start!60090))

(assert (not b!669962))

(assert (not b!669976))

(assert (not b!669983))

(assert (not b!669980))

(assert (not b!669972))

(assert (not b!669965))

(assert (not b!669968))

(assert (not b!669978))

(check-sat)

(pop 1)

(push 1)

(check-sat)

