; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60872 () Bool)

(assert start!60872)

(declare-fun b!682759 () Bool)

(declare-fun res!448781 () Bool)

(declare-fun e!388922 () Bool)

(assert (=> b!682759 (=> (not res!448781) (not e!388922))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39567 0))(
  ( (array!39568 (arr!18965 (Array (_ BitVec 32) (_ BitVec 64))) (size!19330 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39567)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!682759 (= res!448781 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19330 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!682760 () Bool)

(declare-fun e!388916 () Bool)

(declare-datatypes ((List!13045 0))(
  ( (Nil!13042) (Cons!13041 (h!14086 (_ BitVec 64)) (t!19279 List!13045)) )
))
(declare-fun acc!681 () List!13045)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3567 (List!13045 (_ BitVec 64)) Bool)

(assert (=> b!682760 (= e!388916 (not (contains!3567 acc!681 k0!2843)))))

(declare-fun b!682761 () Bool)

(declare-datatypes ((Unit!23975 0))(
  ( (Unit!23976) )
))
(declare-fun e!388921 () Unit!23975)

(declare-fun lt!313500 () Unit!23975)

(assert (=> b!682761 (= e!388921 lt!313500)))

(declare-fun lt!313499 () Unit!23975)

(declare-fun lemmaListSubSeqRefl!0 (List!13045) Unit!23975)

(assert (=> b!682761 (= lt!313499 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!170 (List!13045 List!13045) Bool)

(assert (=> b!682761 (subseq!170 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39567 List!13045 List!13045 (_ BitVec 32)) Unit!23975)

(declare-fun $colon$colon!334 (List!13045 (_ BitVec 64)) List!13045)

(assert (=> b!682761 (= lt!313500 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!334 acc!681 (select (arr!18965 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39567 (_ BitVec 32) List!13045) Bool)

(assert (=> b!682761 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!682762 () Bool)

(declare-fun res!448786 () Bool)

(assert (=> b!682762 (=> (not res!448786) (not e!388922))))

(assert (=> b!682762 (= res!448786 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19330 a!3626))))))

(declare-fun b!682763 () Bool)

(declare-fun e!388917 () Unit!23975)

(declare-fun Unit!23977 () Unit!23975)

(assert (=> b!682763 (= e!388917 Unit!23977)))

(declare-fun lt!313502 () Unit!23975)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39567 (_ BitVec 64) (_ BitVec 32)) Unit!23975)

(assert (=> b!682763 (= lt!313502 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!682763 false))

(declare-fun b!682764 () Bool)

(declare-fun e!388918 () Bool)

(assert (=> b!682764 (= e!388918 e!388916)))

(declare-fun res!448784 () Bool)

(assert (=> b!682764 (=> (not res!448784) (not e!388916))))

(assert (=> b!682764 (= res!448784 (bvsle from!3004 i!1382))))

(declare-fun b!682765 () Bool)

(declare-fun res!448780 () Bool)

(assert (=> b!682765 (=> (not res!448780) (not e!388922))))

(assert (=> b!682765 (= res!448780 e!388918)))

(declare-fun res!448779 () Bool)

(assert (=> b!682765 (=> res!448779 e!388918)))

(declare-fun e!388919 () Bool)

(assert (=> b!682765 (= res!448779 e!388919)))

(declare-fun res!448785 () Bool)

(assert (=> b!682765 (=> (not res!448785) (not e!388919))))

(assert (=> b!682765 (= res!448785 (bvsgt from!3004 i!1382))))

(declare-fun b!682766 () Bool)

(declare-fun res!448791 () Bool)

(assert (=> b!682766 (=> (not res!448791) (not e!388922))))

(declare-fun arrayContainsKey!0 (array!39567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!682766 (= res!448791 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!682768 () Bool)

(declare-fun res!448792 () Bool)

(assert (=> b!682768 (=> (not res!448792) (not e!388922))))

(assert (=> b!682768 (= res!448792 (not (contains!3567 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682769 () Bool)

(declare-fun res!448783 () Bool)

(assert (=> b!682769 (=> (not res!448783) (not e!388922))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!682769 (= res!448783 (validKeyInArray!0 k0!2843))))

(declare-fun b!682770 () Bool)

(declare-fun Unit!23978 () Unit!23975)

(assert (=> b!682770 (= e!388917 Unit!23978)))

(declare-fun b!682771 () Bool)

(declare-fun res!448790 () Bool)

(assert (=> b!682771 (=> (not res!448790) (not e!388922))))

(assert (=> b!682771 (= res!448790 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13042))))

(declare-fun b!682772 () Bool)

(declare-fun res!448789 () Bool)

(assert (=> b!682772 (=> (not res!448789) (not e!388922))))

(assert (=> b!682772 (= res!448789 (not (contains!3567 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682773 () Bool)

(declare-fun res!448782 () Bool)

(assert (=> b!682773 (=> (not res!448782) (not e!388922))))

(declare-fun noDuplicate!836 (List!13045) Bool)

(assert (=> b!682773 (= res!448782 (noDuplicate!836 acc!681))))

(declare-fun b!682774 () Bool)

(declare-fun Unit!23979 () Unit!23975)

(assert (=> b!682774 (= e!388921 Unit!23979)))

(declare-fun b!682775 () Bool)

(assert (=> b!682775 (= e!388922 (not true))))

(declare-fun -!135 (List!13045 (_ BitVec 64)) List!13045)

(assert (=> b!682775 (= (-!135 ($colon$colon!334 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!313498 () Unit!23975)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13045) Unit!23975)

(assert (=> b!682775 (= lt!313498 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!682775 (subseq!170 acc!681 acc!681)))

(declare-fun lt!313501 () Unit!23975)

(assert (=> b!682775 (= lt!313501 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!682775 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313497 () Unit!23975)

(assert (=> b!682775 (= lt!313497 e!388921)))

(declare-fun c!77358 () Bool)

(assert (=> b!682775 (= c!77358 (validKeyInArray!0 (select (arr!18965 a!3626) from!3004)))))

(declare-fun lt!313503 () Unit!23975)

(assert (=> b!682775 (= lt!313503 e!388917)))

(declare-fun c!77357 () Bool)

(assert (=> b!682775 (= c!77357 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682775 (arrayContainsKey!0 (array!39568 (store (arr!18965 a!3626) i!1382 k0!2843) (size!19330 a!3626)) k0!2843 from!3004)))

(declare-fun b!682776 () Bool)

(assert (=> b!682776 (= e!388919 (contains!3567 acc!681 k0!2843))))

(declare-fun b!682767 () Bool)

(declare-fun res!448787 () Bool)

(assert (=> b!682767 (=> (not res!448787) (not e!388922))))

(assert (=> b!682767 (= res!448787 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!448788 () Bool)

(assert (=> start!60872 (=> (not res!448788) (not e!388922))))

(assert (=> start!60872 (= res!448788 (and (bvslt (size!19330 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19330 a!3626))))))

(assert (=> start!60872 e!388922))

(assert (=> start!60872 true))

(declare-fun array_inv!14848 (array!39567) Bool)

(assert (=> start!60872 (array_inv!14848 a!3626)))

(assert (= (and start!60872 res!448788) b!682773))

(assert (= (and b!682773 res!448782) b!682768))

(assert (= (and b!682768 res!448792) b!682772))

(assert (= (and b!682772 res!448789) b!682765))

(assert (= (and b!682765 res!448785) b!682776))

(assert (= (and b!682765 (not res!448779)) b!682764))

(assert (= (and b!682764 res!448784) b!682760))

(assert (= (and b!682765 res!448780) b!682771))

(assert (= (and b!682771 res!448790) b!682767))

(assert (= (and b!682767 res!448787) b!682762))

(assert (= (and b!682762 res!448786) b!682769))

(assert (= (and b!682769 res!448783) b!682766))

(assert (= (and b!682766 res!448791) b!682759))

(assert (= (and b!682759 res!448781) b!682775))

(assert (= (and b!682775 c!77357) b!682763))

(assert (= (and b!682775 (not c!77357)) b!682770))

(assert (= (and b!682775 c!77358) b!682761))

(assert (= (and b!682775 (not c!77358)) b!682774))

(declare-fun m!646869 () Bool)

(assert (=> b!682776 m!646869))

(declare-fun m!646871 () Bool)

(assert (=> b!682763 m!646871))

(declare-fun m!646873 () Bool)

(assert (=> b!682773 m!646873))

(declare-fun m!646875 () Bool)

(assert (=> b!682771 m!646875))

(declare-fun m!646877 () Bool)

(assert (=> b!682761 m!646877))

(declare-fun m!646879 () Bool)

(assert (=> b!682761 m!646879))

(declare-fun m!646881 () Bool)

(assert (=> b!682761 m!646881))

(declare-fun m!646883 () Bool)

(assert (=> b!682761 m!646883))

(assert (=> b!682761 m!646879))

(assert (=> b!682761 m!646881))

(declare-fun m!646885 () Bool)

(assert (=> b!682761 m!646885))

(declare-fun m!646887 () Bool)

(assert (=> b!682761 m!646887))

(declare-fun m!646889 () Bool)

(assert (=> b!682767 m!646889))

(assert (=> b!682760 m!646869))

(declare-fun m!646891 () Bool)

(assert (=> b!682775 m!646891))

(declare-fun m!646893 () Bool)

(assert (=> b!682775 m!646893))

(assert (=> b!682775 m!646877))

(assert (=> b!682775 m!646879))

(declare-fun m!646895 () Bool)

(assert (=> b!682775 m!646895))

(declare-fun m!646897 () Bool)

(assert (=> b!682775 m!646897))

(assert (=> b!682775 m!646885))

(declare-fun m!646899 () Bool)

(assert (=> b!682775 m!646899))

(assert (=> b!682775 m!646891))

(assert (=> b!682775 m!646879))

(declare-fun m!646901 () Bool)

(assert (=> b!682775 m!646901))

(declare-fun m!646903 () Bool)

(assert (=> b!682775 m!646903))

(assert (=> b!682775 m!646887))

(declare-fun m!646905 () Bool)

(assert (=> start!60872 m!646905))

(declare-fun m!646907 () Bool)

(assert (=> b!682772 m!646907))

(declare-fun m!646909 () Bool)

(assert (=> b!682766 m!646909))

(declare-fun m!646911 () Bool)

(assert (=> b!682768 m!646911))

(declare-fun m!646913 () Bool)

(assert (=> b!682769 m!646913))

(check-sat (not b!682769) (not b!682763) (not b!682768) (not b!682760) (not b!682775) (not b!682767) (not start!60872) (not b!682766) (not b!682761) (not b!682773) (not b!682771) (not b!682776) (not b!682772))
(check-sat)
