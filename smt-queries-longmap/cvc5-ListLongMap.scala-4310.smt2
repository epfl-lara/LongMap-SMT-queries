; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59888 () Bool)

(assert start!59888)

(declare-fun b!662768 () Bool)

(declare-fun e!380430 () Bool)

(assert (=> b!662768 (= e!380430 true)))

(declare-datatypes ((List!12701 0))(
  ( (Nil!12698) (Cons!12697 (h!13742 (_ BitVec 64)) (t!18929 List!12701)) )
))
(declare-fun lt!309104 () List!12701)

(declare-fun lt!309102 () Bool)

(declare-datatypes ((array!38935 0))(
  ( (array!38936 (arr!18660 (Array (_ BitVec 32) (_ BitVec 64))) (size!19024 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38935)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!38935 (_ BitVec 32) List!12701) Bool)

(assert (=> b!662768 (= lt!309102 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!309104))))

(declare-datatypes ((Unit!23034 0))(
  ( (Unit!23035) )
))
(declare-fun lt!309106 () Unit!23034)

(declare-fun acc!681 () List!12701)

(declare-fun noDuplicateSubseq!17 (List!12701 List!12701) Unit!23034)

(assert (=> b!662768 (= lt!309106 (noDuplicateSubseq!17 acc!681 lt!309104))))

(declare-fun b!662769 () Bool)

(declare-fun e!380428 () Unit!23034)

(declare-fun Unit!23036 () Unit!23034)

(assert (=> b!662769 (= e!380428 Unit!23036)))

(declare-fun b!662770 () Bool)

(declare-fun e!380429 () Bool)

(declare-fun e!380424 () Bool)

(assert (=> b!662770 (= e!380429 e!380424)))

(declare-fun res!430748 () Bool)

(assert (=> b!662770 (=> (not res!430748) (not e!380424))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!662770 (= res!430748 (bvsle from!3004 i!1382))))

(declare-fun b!662771 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3278 (List!12701 (_ BitVec 64)) Bool)

(assert (=> b!662771 (= e!380424 (not (contains!3278 acc!681 k!2843)))))

(declare-fun b!662772 () Bool)

(declare-fun res!430752 () Bool)

(declare-fun e!380426 () Bool)

(assert (=> b!662772 (=> (not res!430752) (not e!380426))))

(assert (=> b!662772 (= res!430752 (not (contains!3278 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662773 () Bool)

(declare-fun res!430754 () Bool)

(assert (=> b!662773 (=> res!430754 e!380430)))

(declare-fun noDuplicate!525 (List!12701) Bool)

(assert (=> b!662773 (= res!430754 (not (noDuplicate!525 lt!309104)))))

(declare-fun b!662774 () Bool)

(declare-fun res!430742 () Bool)

(assert (=> b!662774 (=> (not res!430742) (not e!380426))))

(assert (=> b!662774 (= res!430742 (noDuplicate!525 acc!681))))

(declare-fun b!662775 () Bool)

(declare-fun res!430738 () Bool)

(assert (=> b!662775 (=> (not res!430738) (not e!380426))))

(assert (=> b!662775 (= res!430738 (not (contains!3278 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662776 () Bool)

(declare-fun e!380427 () Bool)

(assert (=> b!662776 (= e!380426 (not e!380427))))

(declare-fun res!430755 () Bool)

(assert (=> b!662776 (=> res!430755 e!380427)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!662776 (= res!430755 (not (validKeyInArray!0 (select (arr!18660 a!3626) from!3004))))))

(declare-fun lt!309105 () Unit!23034)

(assert (=> b!662776 (= lt!309105 e!380428)))

(declare-fun c!76382 () Bool)

(declare-fun arrayContainsKey!0 (array!38935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!662776 (= c!76382 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!662776 (arrayContainsKey!0 (array!38936 (store (arr!18660 a!3626) i!1382 k!2843) (size!19024 a!3626)) k!2843 from!3004)))

(declare-fun b!662777 () Bool)

(declare-fun res!430751 () Bool)

(assert (=> b!662777 (=> res!430751 e!380430)))

(assert (=> b!662777 (= res!430751 (contains!3278 lt!309104 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662778 () Bool)

(declare-fun res!430746 () Bool)

(assert (=> b!662778 (=> (not res!430746) (not e!380426))))

(assert (=> b!662778 (= res!430746 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19024 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!662779 () Bool)

(declare-fun Unit!23037 () Unit!23034)

(assert (=> b!662779 (= e!380428 Unit!23037)))

(declare-fun lt!309103 () Unit!23034)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38935 (_ BitVec 64) (_ BitVec 32)) Unit!23034)

(assert (=> b!662779 (= lt!309103 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!662779 false))

(declare-fun b!662780 () Bool)

(assert (=> b!662780 (= e!380427 e!380430)))

(declare-fun res!430757 () Bool)

(assert (=> b!662780 (=> res!430757 e!380430)))

(assert (=> b!662780 (= res!430757 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!149 (List!12701 (_ BitVec 64)) List!12701)

(assert (=> b!662780 (= lt!309104 ($colon$colon!149 acc!681 (select (arr!18660 a!3626) from!3004)))))

(declare-fun subseq!17 (List!12701 List!12701) Bool)

(assert (=> b!662780 (subseq!17 acc!681 acc!681)))

(declare-fun lt!309101 () Unit!23034)

(declare-fun lemmaListSubSeqRefl!0 (List!12701) Unit!23034)

(assert (=> b!662780 (= lt!309101 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!662781 () Bool)

(declare-fun res!430740 () Bool)

(assert (=> b!662781 (=> res!430740 e!380430)))

(assert (=> b!662781 (= res!430740 (contains!3278 lt!309104 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662782 () Bool)

(declare-fun res!430739 () Bool)

(assert (=> b!662782 (=> (not res!430739) (not e!380426))))

(assert (=> b!662782 (= res!430739 e!380429)))

(declare-fun res!430741 () Bool)

(assert (=> b!662782 (=> res!430741 e!380429)))

(declare-fun e!380423 () Bool)

(assert (=> b!662782 (= res!430741 e!380423)))

(declare-fun res!430744 () Bool)

(assert (=> b!662782 (=> (not res!430744) (not e!380423))))

(assert (=> b!662782 (= res!430744 (bvsgt from!3004 i!1382))))

(declare-fun res!430745 () Bool)

(assert (=> start!59888 (=> (not res!430745) (not e!380426))))

(assert (=> start!59888 (= res!430745 (and (bvslt (size!19024 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19024 a!3626))))))

(assert (=> start!59888 e!380426))

(assert (=> start!59888 true))

(declare-fun array_inv!14456 (array!38935) Bool)

(assert (=> start!59888 (array_inv!14456 a!3626)))

(declare-fun b!662783 () Bool)

(declare-fun res!430749 () Bool)

(assert (=> b!662783 (=> (not res!430749) (not e!380426))))

(assert (=> b!662783 (= res!430749 (validKeyInArray!0 k!2843))))

(declare-fun b!662784 () Bool)

(declare-fun res!430756 () Bool)

(assert (=> b!662784 (=> res!430756 e!380430)))

(assert (=> b!662784 (= res!430756 (not (subseq!17 acc!681 lt!309104)))))

(declare-fun b!662785 () Bool)

(declare-fun res!430743 () Bool)

(assert (=> b!662785 (=> (not res!430743) (not e!380426))))

(assert (=> b!662785 (= res!430743 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!662786 () Bool)

(declare-fun res!430747 () Bool)

(assert (=> b!662786 (=> (not res!430747) (not e!380426))))

(assert (=> b!662786 (= res!430747 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19024 a!3626))))))

(declare-fun b!662787 () Bool)

(declare-fun res!430753 () Bool)

(assert (=> b!662787 (=> (not res!430753) (not e!380426))))

(assert (=> b!662787 (= res!430753 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12698))))

(declare-fun b!662788 () Bool)

(assert (=> b!662788 (= e!380423 (contains!3278 acc!681 k!2843))))

(declare-fun b!662789 () Bool)

(declare-fun res!430750 () Bool)

(assert (=> b!662789 (=> (not res!430750) (not e!380426))))

(assert (=> b!662789 (= res!430750 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!59888 res!430745) b!662774))

(assert (= (and b!662774 res!430742) b!662775))

(assert (= (and b!662775 res!430738) b!662772))

(assert (= (and b!662772 res!430752) b!662782))

(assert (= (and b!662782 res!430744) b!662788))

(assert (= (and b!662782 (not res!430741)) b!662770))

(assert (= (and b!662770 res!430748) b!662771))

(assert (= (and b!662782 res!430739) b!662787))

(assert (= (and b!662787 res!430753) b!662789))

(assert (= (and b!662789 res!430750) b!662786))

(assert (= (and b!662786 res!430747) b!662783))

(assert (= (and b!662783 res!430749) b!662785))

(assert (= (and b!662785 res!430743) b!662778))

(assert (= (and b!662778 res!430746) b!662776))

(assert (= (and b!662776 c!76382) b!662779))

(assert (= (and b!662776 (not c!76382)) b!662769))

(assert (= (and b!662776 (not res!430755)) b!662780))

(assert (= (and b!662780 (not res!430757)) b!662773))

(assert (= (and b!662773 (not res!430754)) b!662777))

(assert (= (and b!662777 (not res!430751)) b!662781))

(assert (= (and b!662781 (not res!430740)) b!662784))

(assert (= (and b!662784 (not res!430756)) b!662768))

(declare-fun m!634517 () Bool)

(assert (=> b!662783 m!634517))

(declare-fun m!634519 () Bool)

(assert (=> b!662788 m!634519))

(declare-fun m!634521 () Bool)

(assert (=> b!662773 m!634521))

(assert (=> b!662771 m!634519))

(declare-fun m!634523 () Bool)

(assert (=> b!662775 m!634523))

(declare-fun m!634525 () Bool)

(assert (=> b!662780 m!634525))

(assert (=> b!662780 m!634525))

(declare-fun m!634527 () Bool)

(assert (=> b!662780 m!634527))

(declare-fun m!634529 () Bool)

(assert (=> b!662780 m!634529))

(declare-fun m!634531 () Bool)

(assert (=> b!662780 m!634531))

(declare-fun m!634533 () Bool)

(assert (=> b!662789 m!634533))

(declare-fun m!634535 () Bool)

(assert (=> b!662774 m!634535))

(assert (=> b!662776 m!634525))

(declare-fun m!634537 () Bool)

(assert (=> b!662776 m!634537))

(declare-fun m!634539 () Bool)

(assert (=> b!662776 m!634539))

(assert (=> b!662776 m!634525))

(declare-fun m!634541 () Bool)

(assert (=> b!662776 m!634541))

(declare-fun m!634543 () Bool)

(assert (=> b!662776 m!634543))

(declare-fun m!634545 () Bool)

(assert (=> b!662787 m!634545))

(declare-fun m!634547 () Bool)

(assert (=> b!662777 m!634547))

(declare-fun m!634549 () Bool)

(assert (=> b!662781 m!634549))

(declare-fun m!634551 () Bool)

(assert (=> b!662779 m!634551))

(declare-fun m!634553 () Bool)

(assert (=> b!662784 m!634553))

(declare-fun m!634555 () Bool)

(assert (=> start!59888 m!634555))

(declare-fun m!634557 () Bool)

(assert (=> b!662772 m!634557))

(declare-fun m!634559 () Bool)

(assert (=> b!662785 m!634559))

(declare-fun m!634561 () Bool)

(assert (=> b!662768 m!634561))

(declare-fun m!634563 () Bool)

(assert (=> b!662768 m!634563))

(push 1)

