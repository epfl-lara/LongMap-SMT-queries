; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59924 () Bool)

(assert start!59924)

(declare-fun b!663882 () Bool)

(declare-datatypes ((Unit!23123 0))(
  ( (Unit!23124) )
))
(declare-fun e!380769 () Unit!23123)

(declare-fun lt!309258 () Unit!23123)

(assert (=> b!663882 (= e!380769 lt!309258)))

(declare-fun lt!309263 () Unit!23123)

(declare-datatypes ((List!12763 0))(
  ( (Nil!12760) (Cons!12759 (h!13804 (_ BitVec 64)) (t!18982 List!12763)) )
))
(declare-fun acc!681 () List!12763)

(declare-fun lemmaListSubSeqRefl!0 (List!12763) Unit!23123)

(assert (=> b!663882 (= lt!309263 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!41 (List!12763 List!12763) Bool)

(assert (=> b!663882 (subseq!41 acc!681 acc!681)))

(declare-datatypes ((array!38982 0))(
  ( (array!38983 (arr!18683 (Array (_ BitVec 32) (_ BitVec 64))) (size!19048 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38982)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38982 List!12763 List!12763 (_ BitVec 32)) Unit!23123)

(declare-fun $colon$colon!172 (List!12763 (_ BitVec 64)) List!12763)

(assert (=> b!663882 (= lt!309258 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!172 acc!681 (select (arr!18683 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!38982 (_ BitVec 32) List!12763) Bool)

(assert (=> b!663882 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!663883 () Bool)

(declare-fun res!431780 () Bool)

(declare-fun e!380771 () Bool)

(assert (=> b!663883 (=> (not res!431780) (not e!380771))))

(declare-fun contains!3285 (List!12763 (_ BitVec 64)) Bool)

(assert (=> b!663883 (= res!431780 (not (contains!3285 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663884 () Bool)

(declare-fun res!431790 () Bool)

(assert (=> b!663884 (=> (not res!431790) (not e!380771))))

(assert (=> b!663884 (= res!431790 (not (contains!3285 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663885 () Bool)

(declare-fun res!431786 () Bool)

(declare-fun e!380765 () Bool)

(assert (=> b!663885 (=> res!431786 e!380765)))

(declare-fun lt!309265 () Bool)

(assert (=> b!663885 (= res!431786 lt!309265)))

(declare-fun b!663886 () Bool)

(declare-fun res!431787 () Bool)

(assert (=> b!663886 (=> (not res!431787) (not e!380771))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38982 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!663886 (= res!431787 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!663887 () Bool)

(declare-fun res!431792 () Bool)

(assert (=> b!663887 (=> (not res!431792) (not e!380771))))

(declare-fun e!380767 () Bool)

(assert (=> b!663887 (= res!431792 e!380767)))

(declare-fun res!431784 () Bool)

(assert (=> b!663887 (=> res!431784 e!380767)))

(declare-fun e!380768 () Bool)

(assert (=> b!663887 (= res!431784 e!380768)))

(declare-fun res!431789 () Bool)

(assert (=> b!663887 (=> (not res!431789) (not e!380768))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!663887 (= res!431789 (bvsgt from!3004 i!1382))))

(declare-fun b!663888 () Bool)

(declare-fun res!431775 () Bool)

(assert (=> b!663888 (=> (not res!431775) (not e!380771))))

(assert (=> b!663888 (= res!431775 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19048 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!663889 () Bool)

(declare-fun Unit!23125 () Unit!23123)

(assert (=> b!663889 (= e!380769 Unit!23125)))

(declare-fun b!663891 () Bool)

(declare-fun res!431782 () Bool)

(assert (=> b!663891 (=> res!431782 e!380765)))

(assert (=> b!663891 (= res!431782 (contains!3285 acc!681 k0!2843))))

(declare-fun b!663892 () Bool)

(declare-fun res!431793 () Bool)

(assert (=> b!663892 (=> res!431793 e!380765)))

(declare-fun lt!309266 () List!12763)

(assert (=> b!663892 (= res!431793 (contains!3285 lt!309266 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!663893 () Bool)

(declare-fun res!431779 () Bool)

(assert (=> b!663893 (=> (not res!431779) (not e!380771))))

(assert (=> b!663893 (= res!431779 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19048 a!3626))))))

(declare-fun b!663894 () Bool)

(declare-fun res!431785 () Bool)

(assert (=> b!663894 (=> (not res!431785) (not e!380771))))

(assert (=> b!663894 (= res!431785 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!663895 () Bool)

(declare-fun e!380764 () Bool)

(assert (=> b!663895 (= e!380764 (not (contains!3285 acc!681 k0!2843)))))

(declare-fun b!663896 () Bool)

(declare-fun res!431791 () Bool)

(assert (=> b!663896 (=> res!431791 e!380765)))

(declare-fun noDuplicate!554 (List!12763) Bool)

(assert (=> b!663896 (= res!431791 (not (noDuplicate!554 lt!309266)))))

(declare-fun b!663897 () Bool)

(declare-fun res!431781 () Bool)

(assert (=> b!663897 (=> (not res!431781) (not e!380771))))

(assert (=> b!663897 (= res!431781 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12760))))

(declare-fun b!663898 () Bool)

(declare-fun e!380766 () Unit!23123)

(declare-fun Unit!23126 () Unit!23123)

(assert (=> b!663898 (= e!380766 Unit!23126)))

(declare-fun b!663899 () Bool)

(declare-fun res!431777 () Bool)

(assert (=> b!663899 (=> (not res!431777) (not e!380771))))

(assert (=> b!663899 (= res!431777 (noDuplicate!554 acc!681))))

(declare-fun b!663900 () Bool)

(assert (=> b!663900 (= e!380771 (not e!380765))))

(declare-fun res!431776 () Bool)

(assert (=> b!663900 (=> res!431776 e!380765)))

(assert (=> b!663900 (= res!431776 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!39 (List!12763 (_ BitVec 64)) List!12763)

(assert (=> b!663900 (= (-!39 lt!309266 k0!2843) acc!681)))

(assert (=> b!663900 (= lt!309266 ($colon$colon!172 acc!681 k0!2843))))

(declare-fun lt!309260 () Unit!23123)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12763) Unit!23123)

(assert (=> b!663900 (= lt!309260 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!663900 (subseq!41 acc!681 acc!681)))

(declare-fun lt!309261 () Unit!23123)

(assert (=> b!663900 (= lt!309261 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!663900 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309259 () Unit!23123)

(assert (=> b!663900 (= lt!309259 e!380769)))

(declare-fun c!76422 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663900 (= c!76422 (validKeyInArray!0 (select (arr!18683 a!3626) from!3004)))))

(declare-fun lt!309267 () Unit!23123)

(assert (=> b!663900 (= lt!309267 e!380766)))

(declare-fun c!76421 () Bool)

(assert (=> b!663900 (= c!76421 lt!309265)))

(assert (=> b!663900 (= lt!309265 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663900 (arrayContainsKey!0 (array!38983 (store (arr!18683 a!3626) i!1382 k0!2843) (size!19048 a!3626)) k0!2843 from!3004)))

(declare-fun b!663901 () Bool)

(declare-fun Unit!23127 () Unit!23123)

(assert (=> b!663901 (= e!380766 Unit!23127)))

(declare-fun lt!309264 () Unit!23123)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38982 (_ BitVec 64) (_ BitVec 32)) Unit!23123)

(assert (=> b!663901 (= lt!309264 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!663901 false))

(declare-fun b!663902 () Bool)

(declare-fun res!431774 () Bool)

(assert (=> b!663902 (=> res!431774 e!380765)))

(assert (=> b!663902 (= res!431774 (not (contains!3285 lt!309266 k0!2843)))))

(declare-fun b!663903 () Bool)

(declare-fun res!431783 () Bool)

(assert (=> b!663903 (=> res!431783 e!380765)))

(assert (=> b!663903 (= res!431783 (not (subseq!41 acc!681 lt!309266)))))

(declare-fun b!663904 () Bool)

(declare-fun res!431788 () Bool)

(assert (=> b!663904 (=> (not res!431788) (not e!380771))))

(assert (=> b!663904 (= res!431788 (validKeyInArray!0 k0!2843))))

(declare-fun res!431794 () Bool)

(assert (=> start!59924 (=> (not res!431794) (not e!380771))))

(assert (=> start!59924 (= res!431794 (and (bvslt (size!19048 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19048 a!3626))))))

(assert (=> start!59924 e!380771))

(assert (=> start!59924 true))

(declare-fun array_inv!14566 (array!38982) Bool)

(assert (=> start!59924 (array_inv!14566 a!3626)))

(declare-fun b!663890 () Bool)

(assert (=> b!663890 (= e!380767 e!380764)))

(declare-fun res!431778 () Bool)

(assert (=> b!663890 (=> (not res!431778) (not e!380764))))

(assert (=> b!663890 (= res!431778 (bvsle from!3004 i!1382))))

(declare-fun b!663905 () Bool)

(assert (=> b!663905 (= e!380768 (contains!3285 acc!681 k0!2843))))

(declare-fun b!663906 () Bool)

(assert (=> b!663906 (= e!380765 true)))

(declare-fun lt!309262 () Bool)

(assert (=> b!663906 (= lt!309262 (contains!3285 lt!309266 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!59924 res!431794) b!663899))

(assert (= (and b!663899 res!431777) b!663884))

(assert (= (and b!663884 res!431790) b!663883))

(assert (= (and b!663883 res!431780) b!663887))

(assert (= (and b!663887 res!431789) b!663905))

(assert (= (and b!663887 (not res!431784)) b!663890))

(assert (= (and b!663890 res!431778) b!663895))

(assert (= (and b!663887 res!431792) b!663897))

(assert (= (and b!663897 res!431781) b!663894))

(assert (= (and b!663894 res!431785) b!663893))

(assert (= (and b!663893 res!431779) b!663904))

(assert (= (and b!663904 res!431788) b!663886))

(assert (= (and b!663886 res!431787) b!663888))

(assert (= (and b!663888 res!431775) b!663900))

(assert (= (and b!663900 c!76421) b!663901))

(assert (= (and b!663900 (not c!76421)) b!663898))

(assert (= (and b!663900 c!76422) b!663882))

(assert (= (and b!663900 (not c!76422)) b!663889))

(assert (= (and b!663900 (not res!431776)) b!663896))

(assert (= (and b!663896 (not res!431791)) b!663885))

(assert (= (and b!663885 (not res!431786)) b!663891))

(assert (= (and b!663891 (not res!431782)) b!663903))

(assert (= (and b!663903 (not res!431783)) b!663902))

(assert (= (and b!663902 (not res!431774)) b!663892))

(assert (= (and b!663892 (not res!431793)) b!663906))

(declare-fun m!634767 () Bool)

(assert (=> b!663903 m!634767))

(declare-fun m!634769 () Bool)

(assert (=> b!663901 m!634769))

(declare-fun m!634771 () Bool)

(assert (=> b!663899 m!634771))

(declare-fun m!634773 () Bool)

(assert (=> b!663906 m!634773))

(declare-fun m!634775 () Bool)

(assert (=> b!663894 m!634775))

(declare-fun m!634777 () Bool)

(assert (=> b!663883 m!634777))

(declare-fun m!634779 () Bool)

(assert (=> b!663896 m!634779))

(declare-fun m!634781 () Bool)

(assert (=> b!663904 m!634781))

(declare-fun m!634783 () Bool)

(assert (=> b!663891 m!634783))

(declare-fun m!634785 () Bool)

(assert (=> b!663900 m!634785))

(declare-fun m!634787 () Bool)

(assert (=> b!663900 m!634787))

(declare-fun m!634789 () Bool)

(assert (=> b!663900 m!634789))

(declare-fun m!634791 () Bool)

(assert (=> b!663900 m!634791))

(declare-fun m!634793 () Bool)

(assert (=> b!663900 m!634793))

(declare-fun m!634795 () Bool)

(assert (=> b!663900 m!634795))

(declare-fun m!634797 () Bool)

(assert (=> b!663900 m!634797))

(declare-fun m!634799 () Bool)

(assert (=> b!663900 m!634799))

(assert (=> b!663900 m!634789))

(declare-fun m!634801 () Bool)

(assert (=> b!663900 m!634801))

(declare-fun m!634803 () Bool)

(assert (=> b!663900 m!634803))

(declare-fun m!634805 () Bool)

(assert (=> b!663900 m!634805))

(assert (=> b!663882 m!634787))

(assert (=> b!663882 m!634789))

(declare-fun m!634807 () Bool)

(assert (=> b!663882 m!634807))

(declare-fun m!634809 () Bool)

(assert (=> b!663882 m!634809))

(assert (=> b!663882 m!634789))

(assert (=> b!663882 m!634807))

(assert (=> b!663882 m!634795))

(assert (=> b!663882 m!634805))

(assert (=> b!663895 m!634783))

(declare-fun m!634811 () Bool)

(assert (=> b!663884 m!634811))

(declare-fun m!634813 () Bool)

(assert (=> b!663897 m!634813))

(declare-fun m!634815 () Bool)

(assert (=> b!663902 m!634815))

(declare-fun m!634817 () Bool)

(assert (=> start!59924 m!634817))

(assert (=> b!663905 m!634783))

(declare-fun m!634819 () Bool)

(assert (=> b!663892 m!634819))

(declare-fun m!634821 () Bool)

(assert (=> b!663886 m!634821))

(check-sat (not b!663895) (not b!663896) (not b!663886) (not b!663903) (not b!663892) (not b!663905) (not b!663904) (not start!59924) (not b!663899) (not b!663883) (not b!663906) (not b!663901) (not b!663884) (not b!663891) (not b!663882) (not b!663900) (not b!663894) (not b!663902) (not b!663897))
(check-sat)
