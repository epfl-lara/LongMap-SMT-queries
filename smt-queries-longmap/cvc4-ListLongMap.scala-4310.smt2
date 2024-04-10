; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59892 () Bool)

(assert start!59892)

(declare-fun b!662900 () Bool)

(declare-fun res!430874 () Bool)

(declare-fun e!380473 () Bool)

(assert (=> b!662900 (=> res!430874 e!380473)))

(declare-datatypes ((List!12703 0))(
  ( (Nil!12700) (Cons!12699 (h!13744 (_ BitVec 64)) (t!18931 List!12703)) )
))
(declare-fun lt!309139 () List!12703)

(declare-fun contains!3280 (List!12703 (_ BitVec 64)) Bool)

(assert (=> b!662900 (= res!430874 (contains!3280 lt!309139 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662901 () Bool)

(declare-datatypes ((Unit!23042 0))(
  ( (Unit!23043) )
))
(declare-fun e!380474 () Unit!23042)

(declare-fun Unit!23044 () Unit!23042)

(assert (=> b!662901 (= e!380474 Unit!23044)))

(declare-fun lt!309140 () Unit!23042)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!38939 0))(
  ( (array!38940 (arr!18662 (Array (_ BitVec 32) (_ BitVec 64))) (size!19026 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38939)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38939 (_ BitVec 64) (_ BitVec 32)) Unit!23042)

(assert (=> b!662901 (= lt!309140 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!662901 false))

(declare-fun b!662902 () Bool)

(declare-fun res!430875 () Bool)

(assert (=> b!662902 (=> res!430875 e!380473)))

(assert (=> b!662902 (= res!430875 (contains!3280 lt!309139 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662903 () Bool)

(declare-fun res!430863 () Bool)

(declare-fun e!380476 () Bool)

(assert (=> b!662903 (=> (not res!430863) (not e!380476))))

(declare-fun arrayContainsKey!0 (array!38939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!662903 (= res!430863 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!662904 () Bool)

(declare-fun res!430873 () Bool)

(assert (=> b!662904 (=> (not res!430873) (not e!380476))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!662904 (= res!430873 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19026 a!3626))))))

(declare-fun b!662905 () Bool)

(assert (=> b!662905 (= e!380473 true)))

(declare-fun lt!309141 () Bool)

(declare-fun arrayNoDuplicates!0 (array!38939 (_ BitVec 32) List!12703) Bool)

(assert (=> b!662905 (= lt!309141 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!309139))))

(declare-fun lt!309142 () Unit!23042)

(declare-fun acc!681 () List!12703)

(declare-fun noDuplicateSubseq!19 (List!12703 List!12703) Unit!23042)

(assert (=> b!662905 (= lt!309142 (noDuplicateSubseq!19 acc!681 lt!309139))))

(declare-fun b!662906 () Bool)

(declare-fun res!430865 () Bool)

(assert (=> b!662906 (=> (not res!430865) (not e!380476))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!662906 (= res!430865 (validKeyInArray!0 k!2843))))

(declare-fun b!662907 () Bool)

(declare-fun res!430859 () Bool)

(assert (=> b!662907 (=> (not res!430859) (not e!380476))))

(assert (=> b!662907 (= res!430859 (not (contains!3280 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662908 () Bool)

(declare-fun res!430860 () Bool)

(assert (=> b!662908 (=> res!430860 e!380473)))

(declare-fun subseq!19 (List!12703 List!12703) Bool)

(assert (=> b!662908 (= res!430860 (not (subseq!19 acc!681 lt!309139)))))

(declare-fun b!662909 () Bool)

(declare-fun e!380477 () Bool)

(assert (=> b!662909 (= e!380477 (contains!3280 acc!681 k!2843))))

(declare-fun b!662910 () Bool)

(declare-fun res!430862 () Bool)

(assert (=> b!662910 (=> (not res!430862) (not e!380476))))

(assert (=> b!662910 (= res!430862 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19026 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!662911 () Bool)

(declare-fun res!430870 () Bool)

(assert (=> b!662911 (=> (not res!430870) (not e!380476))))

(assert (=> b!662911 (= res!430870 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!662912 () Bool)

(declare-fun res!430869 () Bool)

(assert (=> b!662912 (=> (not res!430869) (not e!380476))))

(assert (=> b!662912 (= res!430869 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12700))))

(declare-fun b!662913 () Bool)

(declare-fun e!380472 () Bool)

(assert (=> b!662913 (= e!380472 e!380473)))

(declare-fun res!430868 () Bool)

(assert (=> b!662913 (=> res!430868 e!380473)))

(assert (=> b!662913 (= res!430868 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!151 (List!12703 (_ BitVec 64)) List!12703)

(assert (=> b!662913 (= lt!309139 ($colon$colon!151 acc!681 (select (arr!18662 a!3626) from!3004)))))

(assert (=> b!662913 (subseq!19 acc!681 acc!681)))

(declare-fun lt!309137 () Unit!23042)

(declare-fun lemmaListSubSeqRefl!0 (List!12703) Unit!23042)

(assert (=> b!662913 (= lt!309137 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!662914 () Bool)

(declare-fun Unit!23045 () Unit!23042)

(assert (=> b!662914 (= e!380474 Unit!23045)))

(declare-fun b!662915 () Bool)

(declare-fun res!430876 () Bool)

(assert (=> b!662915 (=> (not res!430876) (not e!380476))))

(declare-fun e!380475 () Bool)

(assert (=> b!662915 (= res!430876 e!380475)))

(declare-fun res!430872 () Bool)

(assert (=> b!662915 (=> res!430872 e!380475)))

(assert (=> b!662915 (= res!430872 e!380477)))

(declare-fun res!430866 () Bool)

(assert (=> b!662915 (=> (not res!430866) (not e!380477))))

(assert (=> b!662915 (= res!430866 (bvsgt from!3004 i!1382))))

(declare-fun b!662916 () Bool)

(declare-fun res!430871 () Bool)

(assert (=> b!662916 (=> (not res!430871) (not e!380476))))

(assert (=> b!662916 (= res!430871 (not (contains!3280 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662917 () Bool)

(declare-fun res!430861 () Bool)

(assert (=> b!662917 (=> res!430861 e!380473)))

(declare-fun noDuplicate!527 (List!12703) Bool)

(assert (=> b!662917 (= res!430861 (not (noDuplicate!527 lt!309139)))))

(declare-fun res!430858 () Bool)

(assert (=> start!59892 (=> (not res!430858) (not e!380476))))

(assert (=> start!59892 (= res!430858 (and (bvslt (size!19026 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19026 a!3626))))))

(assert (=> start!59892 e!380476))

(assert (=> start!59892 true))

(declare-fun array_inv!14458 (array!38939) Bool)

(assert (=> start!59892 (array_inv!14458 a!3626)))

(declare-fun b!662918 () Bool)

(assert (=> b!662918 (= e!380476 (not e!380472))))

(declare-fun res!430877 () Bool)

(assert (=> b!662918 (=> res!430877 e!380472)))

(assert (=> b!662918 (= res!430877 (not (validKeyInArray!0 (select (arr!18662 a!3626) from!3004))))))

(declare-fun lt!309138 () Unit!23042)

(assert (=> b!662918 (= lt!309138 e!380474)))

(declare-fun c!76388 () Bool)

(assert (=> b!662918 (= c!76388 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!662918 (arrayContainsKey!0 (array!38940 (store (arr!18662 a!3626) i!1382 k!2843) (size!19026 a!3626)) k!2843 from!3004)))

(declare-fun b!662919 () Bool)

(declare-fun res!430867 () Bool)

(assert (=> b!662919 (=> (not res!430867) (not e!380476))))

(assert (=> b!662919 (= res!430867 (noDuplicate!527 acc!681))))

(declare-fun b!662920 () Bool)

(declare-fun e!380471 () Bool)

(assert (=> b!662920 (= e!380471 (not (contains!3280 acc!681 k!2843)))))

(declare-fun b!662921 () Bool)

(assert (=> b!662921 (= e!380475 e!380471)))

(declare-fun res!430864 () Bool)

(assert (=> b!662921 (=> (not res!430864) (not e!380471))))

(assert (=> b!662921 (= res!430864 (bvsle from!3004 i!1382))))

(assert (= (and start!59892 res!430858) b!662919))

(assert (= (and b!662919 res!430867) b!662916))

(assert (= (and b!662916 res!430871) b!662907))

(assert (= (and b!662907 res!430859) b!662915))

(assert (= (and b!662915 res!430866) b!662909))

(assert (= (and b!662915 (not res!430872)) b!662921))

(assert (= (and b!662921 res!430864) b!662920))

(assert (= (and b!662915 res!430876) b!662912))

(assert (= (and b!662912 res!430869) b!662911))

(assert (= (and b!662911 res!430870) b!662904))

(assert (= (and b!662904 res!430873) b!662906))

(assert (= (and b!662906 res!430865) b!662903))

(assert (= (and b!662903 res!430863) b!662910))

(assert (= (and b!662910 res!430862) b!662918))

(assert (= (and b!662918 c!76388) b!662901))

(assert (= (and b!662918 (not c!76388)) b!662914))

(assert (= (and b!662918 (not res!430877)) b!662913))

(assert (= (and b!662913 (not res!430868)) b!662917))

(assert (= (and b!662917 (not res!430861)) b!662902))

(assert (= (and b!662902 (not res!430875)) b!662900))

(assert (= (and b!662900 (not res!430874)) b!662908))

(assert (= (and b!662908 (not res!430860)) b!662905))

(declare-fun m!634613 () Bool)

(assert (=> b!662912 m!634613))

(declare-fun m!634615 () Bool)

(assert (=> b!662918 m!634615))

(declare-fun m!634617 () Bool)

(assert (=> b!662918 m!634617))

(declare-fun m!634619 () Bool)

(assert (=> b!662918 m!634619))

(assert (=> b!662918 m!634615))

(declare-fun m!634621 () Bool)

(assert (=> b!662918 m!634621))

(declare-fun m!634623 () Bool)

(assert (=> b!662918 m!634623))

(declare-fun m!634625 () Bool)

(assert (=> b!662900 m!634625))

(assert (=> b!662913 m!634615))

(assert (=> b!662913 m!634615))

(declare-fun m!634627 () Bool)

(assert (=> b!662913 m!634627))

(declare-fun m!634629 () Bool)

(assert (=> b!662913 m!634629))

(declare-fun m!634631 () Bool)

(assert (=> b!662913 m!634631))

(declare-fun m!634633 () Bool)

(assert (=> b!662905 m!634633))

(declare-fun m!634635 () Bool)

(assert (=> b!662905 m!634635))

(declare-fun m!634637 () Bool)

(assert (=> b!662902 m!634637))

(declare-fun m!634639 () Bool)

(assert (=> b!662919 m!634639))

(declare-fun m!634641 () Bool)

(assert (=> b!662901 m!634641))

(declare-fun m!634643 () Bool)

(assert (=> b!662917 m!634643))

(declare-fun m!634645 () Bool)

(assert (=> b!662920 m!634645))

(declare-fun m!634647 () Bool)

(assert (=> b!662907 m!634647))

(assert (=> b!662909 m!634645))

(declare-fun m!634649 () Bool)

(assert (=> b!662906 m!634649))

(declare-fun m!634651 () Bool)

(assert (=> b!662916 m!634651))

(declare-fun m!634653 () Bool)

(assert (=> start!59892 m!634653))

(declare-fun m!634655 () Bool)

(assert (=> b!662911 m!634655))

(declare-fun m!634657 () Bool)

(assert (=> b!662908 m!634657))

(declare-fun m!634659 () Bool)

(assert (=> b!662903 m!634659))

(push 1)

(assert (not b!662911))

(assert (not b!662919))

(assert (not b!662920))

(assert (not b!662907))

(assert (not b!662912))

(assert (not b!662913))

(assert (not start!59892))

(assert (not b!662917))

(assert (not b!662901))

(assert (not b!662916))

(assert (not b!662909))

(assert (not b!662918))

