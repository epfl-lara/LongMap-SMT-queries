; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59858 () Bool)

(assert start!59858)

(declare-fun b!661778 () Bool)

(declare-fun res!429843 () Bool)

(declare-fun e!380066 () Bool)

(assert (=> b!661778 (=> (not res!429843) (not e!380066))))

(declare-fun e!380063 () Bool)

(assert (=> b!661778 (= res!429843 e!380063)))

(declare-fun res!429846 () Bool)

(assert (=> b!661778 (=> res!429846 e!380063)))

(declare-fun e!380069 () Bool)

(assert (=> b!661778 (= res!429846 e!380069)))

(declare-fun res!429841 () Bool)

(assert (=> b!661778 (=> (not res!429841) (not e!380069))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!661778 (= res!429841 (bvsgt from!3004 i!1382))))

(declare-fun b!661779 () Bool)

(declare-fun res!429856 () Bool)

(declare-fun e!380070 () Bool)

(assert (=> b!661779 (=> res!429856 e!380070)))

(declare-datatypes ((List!12686 0))(
  ( (Nil!12683) (Cons!12682 (h!13727 (_ BitVec 64)) (t!18914 List!12686)) )
))
(declare-fun lt!308835 () List!12686)

(declare-fun contains!3263 (List!12686 (_ BitVec 64)) Bool)

(assert (=> b!661779 (= res!429856 (contains!3263 lt!308835 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!661780 () Bool)

(declare-fun res!429851 () Bool)

(assert (=> b!661780 (=> (not res!429851) (not e!380066))))

(declare-fun acc!681 () List!12686)

(declare-fun noDuplicate!510 (List!12686) Bool)

(assert (=> b!661780 (= res!429851 (noDuplicate!510 acc!681))))

(declare-fun b!661781 () Bool)

(declare-fun res!429842 () Bool)

(assert (=> b!661781 (=> (not res!429842) (not e!380066))))

(assert (=> b!661781 (= res!429842 (not (contains!3263 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661782 () Bool)

(declare-fun e!380064 () Bool)

(assert (=> b!661782 (= e!380066 (not e!380064))))

(declare-fun res!429844 () Bool)

(assert (=> b!661782 (=> res!429844 e!380064)))

(declare-datatypes ((array!38905 0))(
  ( (array!38906 (arr!18645 (Array (_ BitVec 32) (_ BitVec 64))) (size!19009 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38905)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661782 (= res!429844 (not (validKeyInArray!0 (select (arr!18645 a!3626) from!3004))))))

(declare-datatypes ((Unit!22974 0))(
  ( (Unit!22975) )
))
(declare-fun lt!308836 () Unit!22974)

(declare-fun e!380068 () Unit!22974)

(assert (=> b!661782 (= lt!308836 e!380068)))

(declare-fun c!76337 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661782 (= c!76337 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!661782 (arrayContainsKey!0 (array!38906 (store (arr!18645 a!3626) i!1382 k!2843) (size!19009 a!3626)) k!2843 from!3004)))

(declare-fun b!661783 () Bool)

(declare-fun res!429848 () Bool)

(assert (=> b!661783 (=> (not res!429848) (not e!380066))))

(assert (=> b!661783 (= res!429848 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19009 a!3626))))))

(declare-fun b!661784 () Bool)

(declare-fun res!429850 () Bool)

(assert (=> b!661784 (=> res!429850 e!380070)))

(assert (=> b!661784 (= res!429850 (contains!3263 lt!308835 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!661785 () Bool)

(declare-fun res!429839 () Bool)

(assert (=> b!661785 (=> (not res!429839) (not e!380066))))

(assert (=> b!661785 (= res!429839 (not (contains!3263 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661786 () Bool)

(declare-fun res!429838 () Bool)

(assert (=> b!661786 (=> (not res!429838) (not e!380066))))

(declare-fun arrayNoDuplicates!0 (array!38905 (_ BitVec 32) List!12686) Bool)

(assert (=> b!661786 (= res!429838 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12683))))

(declare-fun b!661787 () Bool)

(assert (=> b!661787 (= e!380069 (contains!3263 acc!681 k!2843))))

(declare-fun b!661788 () Bool)

(assert (=> b!661788 (= e!380064 e!380070)))

(declare-fun res!429840 () Bool)

(assert (=> b!661788 (=> res!429840 e!380070)))

(assert (=> b!661788 (= res!429840 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!134 (List!12686 (_ BitVec 64)) List!12686)

(assert (=> b!661788 (= lt!308835 ($colon$colon!134 acc!681 (select (arr!18645 a!3626) from!3004)))))

(declare-fun subseq!2 (List!12686 List!12686) Bool)

(assert (=> b!661788 (subseq!2 acc!681 acc!681)))

(declare-fun lt!308834 () Unit!22974)

(declare-fun lemmaListSubSeqRefl!0 (List!12686) Unit!22974)

(assert (=> b!661788 (= lt!308834 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!661789 () Bool)

(declare-fun res!429852 () Bool)

(assert (=> b!661789 (=> res!429852 e!380070)))

(assert (=> b!661789 (= res!429852 (not (subseq!2 acc!681 lt!308835)))))

(declare-fun res!429854 () Bool)

(assert (=> start!59858 (=> (not res!429854) (not e!380066))))

(assert (=> start!59858 (= res!429854 (and (bvslt (size!19009 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19009 a!3626))))))

(assert (=> start!59858 e!380066))

(assert (=> start!59858 true))

(declare-fun array_inv!14441 (array!38905) Bool)

(assert (=> start!59858 (array_inv!14441 a!3626)))

(declare-fun b!661790 () Bool)

(declare-fun Unit!22976 () Unit!22974)

(assert (=> b!661790 (= e!380068 Unit!22976)))

(declare-fun b!661791 () Bool)

(declare-fun Unit!22977 () Unit!22974)

(assert (=> b!661791 (= e!380068 Unit!22977)))

(declare-fun lt!308833 () Unit!22974)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38905 (_ BitVec 64) (_ BitVec 32)) Unit!22974)

(assert (=> b!661791 (= lt!308833 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!661791 false))

(declare-fun b!661792 () Bool)

(declare-fun res!429849 () Bool)

(assert (=> b!661792 (=> (not res!429849) (not e!380066))))

(assert (=> b!661792 (= res!429849 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661793 () Bool)

(declare-fun res!429853 () Bool)

(assert (=> b!661793 (=> res!429853 e!380070)))

(assert (=> b!661793 (= res!429853 (not (noDuplicate!510 lt!308835)))))

(declare-fun b!661794 () Bool)

(declare-fun res!429845 () Bool)

(assert (=> b!661794 (=> (not res!429845) (not e!380066))))

(assert (=> b!661794 (= res!429845 (validKeyInArray!0 k!2843))))

(declare-fun b!661795 () Bool)

(declare-fun res!429857 () Bool)

(assert (=> b!661795 (=> (not res!429857) (not e!380066))))

(assert (=> b!661795 (= res!429857 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19009 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661796 () Bool)

(declare-fun e!380067 () Bool)

(assert (=> b!661796 (= e!380063 e!380067)))

(declare-fun res!429855 () Bool)

(assert (=> b!661796 (=> (not res!429855) (not e!380067))))

(assert (=> b!661796 (= res!429855 (bvsle from!3004 i!1382))))

(declare-fun b!661797 () Bool)

(declare-fun res!429847 () Bool)

(assert (=> b!661797 (=> (not res!429847) (not e!380066))))

(assert (=> b!661797 (= res!429847 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!661798 () Bool)

(assert (=> b!661798 (= e!380070 true)))

(declare-fun lt!308831 () Bool)

(assert (=> b!661798 (= lt!308831 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!308835))))

(declare-fun lt!308832 () Unit!22974)

(declare-fun noDuplicateSubseq!2 (List!12686 List!12686) Unit!22974)

(assert (=> b!661798 (= lt!308832 (noDuplicateSubseq!2 acc!681 lt!308835))))

(declare-fun b!661799 () Bool)

(assert (=> b!661799 (= e!380067 (not (contains!3263 acc!681 k!2843)))))

(assert (= (and start!59858 res!429854) b!661780))

(assert (= (and b!661780 res!429851) b!661781))

(assert (= (and b!661781 res!429842) b!661785))

(assert (= (and b!661785 res!429839) b!661778))

(assert (= (and b!661778 res!429841) b!661787))

(assert (= (and b!661778 (not res!429846)) b!661796))

(assert (= (and b!661796 res!429855) b!661799))

(assert (= (and b!661778 res!429843) b!661786))

(assert (= (and b!661786 res!429838) b!661792))

(assert (= (and b!661792 res!429849) b!661783))

(assert (= (and b!661783 res!429848) b!661794))

(assert (= (and b!661794 res!429845) b!661797))

(assert (= (and b!661797 res!429847) b!661795))

(assert (= (and b!661795 res!429857) b!661782))

(assert (= (and b!661782 c!76337) b!661791))

(assert (= (and b!661782 (not c!76337)) b!661790))

(assert (= (and b!661782 (not res!429844)) b!661788))

(assert (= (and b!661788 (not res!429840)) b!661793))

(assert (= (and b!661793 (not res!429853)) b!661784))

(assert (= (and b!661784 (not res!429850)) b!661779))

(assert (= (and b!661779 (not res!429856)) b!661789))

(assert (= (and b!661789 (not res!429852)) b!661798))

(declare-fun m!633797 () Bool)

(assert (=> b!661789 m!633797))

(declare-fun m!633799 () Bool)

(assert (=> b!661798 m!633799))

(declare-fun m!633801 () Bool)

(assert (=> b!661798 m!633801))

(declare-fun m!633803 () Bool)

(assert (=> b!661797 m!633803))

(declare-fun m!633805 () Bool)

(assert (=> b!661786 m!633805))

(declare-fun m!633807 () Bool)

(assert (=> b!661785 m!633807))

(declare-fun m!633809 () Bool)

(assert (=> b!661799 m!633809))

(declare-fun m!633811 () Bool)

(assert (=> b!661792 m!633811))

(assert (=> b!661787 m!633809))

(declare-fun m!633813 () Bool)

(assert (=> b!661779 m!633813))

(declare-fun m!633815 () Bool)

(assert (=> b!661788 m!633815))

(assert (=> b!661788 m!633815))

(declare-fun m!633817 () Bool)

(assert (=> b!661788 m!633817))

(declare-fun m!633819 () Bool)

(assert (=> b!661788 m!633819))

(declare-fun m!633821 () Bool)

(assert (=> b!661788 m!633821))

(declare-fun m!633823 () Bool)

(assert (=> b!661791 m!633823))

(assert (=> b!661782 m!633815))

(declare-fun m!633825 () Bool)

(assert (=> b!661782 m!633825))

(declare-fun m!633827 () Bool)

(assert (=> b!661782 m!633827))

(assert (=> b!661782 m!633815))

(declare-fun m!633829 () Bool)

(assert (=> b!661782 m!633829))

(declare-fun m!633831 () Bool)

(assert (=> b!661782 m!633831))

(declare-fun m!633833 () Bool)

(assert (=> b!661781 m!633833))

(declare-fun m!633835 () Bool)

(assert (=> b!661793 m!633835))

(declare-fun m!633837 () Bool)

(assert (=> start!59858 m!633837))

(declare-fun m!633839 () Bool)

(assert (=> b!661780 m!633839))

(declare-fun m!633841 () Bool)

(assert (=> b!661794 m!633841))

(declare-fun m!633843 () Bool)

(assert (=> b!661784 m!633843))

(push 1)

