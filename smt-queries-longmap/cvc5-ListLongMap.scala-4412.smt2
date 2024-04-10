; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60884 () Bool)

(assert start!60884)

(declare-fun b!683055 () Bool)

(declare-fun res!448921 () Bool)

(declare-fun e!389106 () Bool)

(assert (=> b!683055 (=> (not res!448921) (not e!389106))))

(declare-datatypes ((array!39568 0))(
  ( (array!39569 (arr!18966 (Array (_ BitVec 32) (_ BitVec 64))) (size!19330 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39568)

(declare-datatypes ((List!13007 0))(
  ( (Nil!13004) (Cons!13003 (h!14048 (_ BitVec 64)) (t!19250 List!13007)) )
))
(declare-fun arrayNoDuplicates!0 (array!39568 (_ BitVec 32) List!13007) Bool)

(assert (=> b!683055 (= res!448921 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13004))))

(declare-fun b!683056 () Bool)

(declare-fun res!448925 () Bool)

(assert (=> b!683056 (=> (not res!448925) (not e!389106))))

(declare-fun acc!681 () List!13007)

(declare-fun contains!3584 (List!13007 (_ BitVec 64)) Bool)

(assert (=> b!683056 (= res!448925 (not (contains!3584 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683057 () Bool)

(declare-datatypes ((Unit!23997 0))(
  ( (Unit!23998) )
))
(declare-fun e!389111 () Unit!23997)

(declare-fun Unit!23999 () Unit!23997)

(assert (=> b!683057 (= e!389111 Unit!23999)))

(declare-fun b!683058 () Bool)

(declare-fun res!448924 () Bool)

(assert (=> b!683058 (=> (not res!448924) (not e!389106))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!683058 (= res!448924 (validKeyInArray!0 k!2843))))

(declare-fun b!683059 () Bool)

(declare-fun res!448926 () Bool)

(assert (=> b!683059 (=> (not res!448926) (not e!389106))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!683059 (= res!448926 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19330 a!3626))))))

(declare-fun b!683060 () Bool)

(declare-fun res!448916 () Bool)

(assert (=> b!683060 (=> (not res!448916) (not e!389106))))

(declare-fun e!389110 () Bool)

(assert (=> b!683060 (= res!448916 e!389110)))

(declare-fun res!448923 () Bool)

(assert (=> b!683060 (=> res!448923 e!389110)))

(declare-fun e!389107 () Bool)

(assert (=> b!683060 (= res!448923 e!389107)))

(declare-fun res!448919 () Bool)

(assert (=> b!683060 (=> (not res!448919) (not e!389107))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!683060 (= res!448919 (bvsgt from!3004 i!1382))))

(declare-fun b!683061 () Bool)

(declare-fun res!448920 () Bool)

(assert (=> b!683061 (=> (not res!448920) (not e!389106))))

(assert (=> b!683061 (= res!448920 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19330 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!683062 () Bool)

(assert (=> b!683062 (= e!389107 (contains!3584 acc!681 k!2843))))

(declare-fun b!683063 () Bool)

(declare-fun e!389112 () Unit!23997)

(declare-fun Unit!24000 () Unit!23997)

(assert (=> b!683063 (= e!389112 Unit!24000)))

(declare-fun lt!313756 () Unit!23997)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39568 (_ BitVec 64) (_ BitVec 32)) Unit!23997)

(assert (=> b!683063 (= lt!313756 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!683063 false))

(declare-fun b!683064 () Bool)

(declare-fun e!389108 () Bool)

(assert (=> b!683064 (= e!389110 e!389108)))

(declare-fun res!448928 () Bool)

(assert (=> b!683064 (=> (not res!448928) (not e!389108))))

(assert (=> b!683064 (= res!448928 (bvsle from!3004 i!1382))))

(declare-fun b!683065 () Bool)

(declare-fun res!448927 () Bool)

(assert (=> b!683065 (=> (not res!448927) (not e!389106))))

(declare-fun noDuplicate!831 (List!13007) Bool)

(assert (=> b!683065 (= res!448927 (noDuplicate!831 acc!681))))

(declare-fun res!448918 () Bool)

(assert (=> start!60884 (=> (not res!448918) (not e!389106))))

(assert (=> start!60884 (= res!448918 (and (bvslt (size!19330 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19330 a!3626))))))

(assert (=> start!60884 e!389106))

(assert (=> start!60884 true))

(declare-fun array_inv!14762 (array!39568) Bool)

(assert (=> start!60884 (array_inv!14762 a!3626)))

(declare-fun b!683066 () Bool)

(assert (=> b!683066 (= e!389106 (not true))))

(declare-fun -!135 (List!13007 (_ BitVec 64)) List!13007)

(declare-fun $colon$colon!335 (List!13007 (_ BitVec 64)) List!13007)

(assert (=> b!683066 (= (-!135 ($colon$colon!335 acc!681 k!2843) k!2843) acc!681)))

(declare-fun lt!313759 () Unit!23997)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13007) Unit!23997)

(assert (=> b!683066 (= lt!313759 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!170 (List!13007 List!13007) Bool)

(assert (=> b!683066 (subseq!170 acc!681 acc!681)))

(declare-fun lt!313755 () Unit!23997)

(declare-fun lemmaListSubSeqRefl!0 (List!13007) Unit!23997)

(assert (=> b!683066 (= lt!313755 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683066 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313757 () Unit!23997)

(assert (=> b!683066 (= lt!313757 e!389111)))

(declare-fun c!77438 () Bool)

(assert (=> b!683066 (= c!77438 (validKeyInArray!0 (select (arr!18966 a!3626) from!3004)))))

(declare-fun lt!313754 () Unit!23997)

(assert (=> b!683066 (= lt!313754 e!389112)))

(declare-fun c!77437 () Bool)

(declare-fun arrayContainsKey!0 (array!39568 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!683066 (= c!77437 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683066 (arrayContainsKey!0 (array!39569 (store (arr!18966 a!3626) i!1382 k!2843) (size!19330 a!3626)) k!2843 from!3004)))

(declare-fun b!683067 () Bool)

(declare-fun res!448915 () Bool)

(assert (=> b!683067 (=> (not res!448915) (not e!389106))))

(assert (=> b!683067 (= res!448915 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!683068 () Bool)

(declare-fun lt!313758 () Unit!23997)

(assert (=> b!683068 (= e!389111 lt!313758)))

(declare-fun lt!313753 () Unit!23997)

(assert (=> b!683068 (= lt!313753 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683068 (subseq!170 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39568 List!13007 List!13007 (_ BitVec 32)) Unit!23997)

(assert (=> b!683068 (= lt!313758 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!335 acc!681 (select (arr!18966 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683068 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!683069 () Bool)

(declare-fun Unit!24001 () Unit!23997)

(assert (=> b!683069 (= e!389112 Unit!24001)))

(declare-fun b!683070 () Bool)

(declare-fun res!448922 () Bool)

(assert (=> b!683070 (=> (not res!448922) (not e!389106))))

(assert (=> b!683070 (= res!448922 (not (contains!3584 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683071 () Bool)

(declare-fun res!448917 () Bool)

(assert (=> b!683071 (=> (not res!448917) (not e!389106))))

(assert (=> b!683071 (= res!448917 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!683072 () Bool)

(assert (=> b!683072 (= e!389108 (not (contains!3584 acc!681 k!2843)))))

(assert (= (and start!60884 res!448918) b!683065))

(assert (= (and b!683065 res!448927) b!683070))

(assert (= (and b!683070 res!448922) b!683056))

(assert (= (and b!683056 res!448925) b!683060))

(assert (= (and b!683060 res!448919) b!683062))

(assert (= (and b!683060 (not res!448923)) b!683064))

(assert (= (and b!683064 res!448928) b!683072))

(assert (= (and b!683060 res!448916) b!683055))

(assert (= (and b!683055 res!448921) b!683067))

(assert (= (and b!683067 res!448915) b!683059))

(assert (= (and b!683059 res!448926) b!683058))

(assert (= (and b!683058 res!448924) b!683071))

(assert (= (and b!683071 res!448917) b!683061))

(assert (= (and b!683061 res!448920) b!683066))

(assert (= (and b!683066 c!77437) b!683063))

(assert (= (and b!683066 (not c!77437)) b!683069))

(assert (= (and b!683066 c!77438) b!683068))

(assert (= (and b!683066 (not c!77438)) b!683057))

(declare-fun m!647651 () Bool)

(assert (=> b!683055 m!647651))

(declare-fun m!647653 () Bool)

(assert (=> b!683062 m!647653))

(declare-fun m!647655 () Bool)

(assert (=> b!683070 m!647655))

(declare-fun m!647657 () Bool)

(assert (=> b!683065 m!647657))

(declare-fun m!647659 () Bool)

(assert (=> b!683058 m!647659))

(declare-fun m!647661 () Bool)

(assert (=> b!683067 m!647661))

(assert (=> b!683072 m!647653))

(declare-fun m!647663 () Bool)

(assert (=> b!683071 m!647663))

(declare-fun m!647665 () Bool)

(assert (=> start!60884 m!647665))

(declare-fun m!647667 () Bool)

(assert (=> b!683056 m!647667))

(declare-fun m!647669 () Bool)

(assert (=> b!683063 m!647669))

(declare-fun m!647671 () Bool)

(assert (=> b!683068 m!647671))

(declare-fun m!647673 () Bool)

(assert (=> b!683068 m!647673))

(declare-fun m!647675 () Bool)

(assert (=> b!683068 m!647675))

(declare-fun m!647677 () Bool)

(assert (=> b!683068 m!647677))

(assert (=> b!683068 m!647673))

(assert (=> b!683068 m!647675))

(declare-fun m!647679 () Bool)

(assert (=> b!683068 m!647679))

(declare-fun m!647681 () Bool)

(assert (=> b!683068 m!647681))

(declare-fun m!647683 () Bool)

(assert (=> b!683066 m!647683))

(declare-fun m!647685 () Bool)

(assert (=> b!683066 m!647685))

(assert (=> b!683066 m!647671))

(assert (=> b!683066 m!647673))

(declare-fun m!647687 () Bool)

(assert (=> b!683066 m!647687))

(declare-fun m!647689 () Bool)

(assert (=> b!683066 m!647689))

(assert (=> b!683066 m!647679))

(declare-fun m!647691 () Bool)

(assert (=> b!683066 m!647691))

(assert (=> b!683066 m!647683))

(assert (=> b!683066 m!647673))

(declare-fun m!647693 () Bool)

(assert (=> b!683066 m!647693))

(declare-fun m!647695 () Bool)

(assert (=> b!683066 m!647695))

(assert (=> b!683066 m!647681))

(push 1)

(assert (not b!683071))

(assert (not start!60884))

(assert (not b!683062))

(assert (not b!683058))

(assert (not b!683072))

(assert (not b!683055))

(assert (not b!683068))

(assert (not b!683070))

(assert (not b!683065))

(assert (not b!683056))

(assert (not b!683066))

(assert (not b!683063))

(assert (not b!683067))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

