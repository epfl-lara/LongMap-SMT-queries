; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61576 () Bool)

(assert start!61576)

(declare-fun res!453649 () Bool)

(declare-fun e!392372 () Bool)

(assert (=> start!61576 (=> (not res!453649) (not e!392372))))

(declare-datatypes ((array!39717 0))(
  ( (array!39718 (arr!19030 (Array (_ BitVec 32) (_ BitVec 64))) (size!19412 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39717)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!61576 (= res!453649 (and (bvslt (size!19412 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19412 a!3626))))))

(assert (=> start!61576 e!392372))

(assert (=> start!61576 true))

(declare-fun array_inv!14826 (array!39717) Bool)

(assert (=> start!61576 (array_inv!14826 a!3626)))

(declare-fun b!689018 () Bool)

(declare-fun res!453646 () Bool)

(declare-fun e!392371 () Bool)

(assert (=> b!689018 (=> res!453646 e!392371)))

(declare-datatypes ((List!13071 0))(
  ( (Nil!13068) (Cons!13067 (h!14112 (_ BitVec 64)) (t!19335 List!13071)) )
))
(declare-fun lt!316007 () List!13071)

(declare-fun contains!3648 (List!13071 (_ BitVec 64)) Bool)

(assert (=> b!689018 (= res!453646 (contains!3648 lt!316007 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689019 () Bool)

(declare-fun res!453650 () Bool)

(assert (=> b!689019 (=> (not res!453650) (not e!392372))))

(declare-fun acc!681 () List!13071)

(assert (=> b!689019 (= res!453650 (not (contains!3648 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689020 () Bool)

(declare-fun res!453648 () Bool)

(assert (=> b!689020 (=> (not res!453648) (not e!392372))))

(assert (=> b!689020 (= res!453648 (not (contains!3648 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689021 () Bool)

(declare-fun e!392364 () Bool)

(declare-fun e!392370 () Bool)

(assert (=> b!689021 (= e!392364 e!392370)))

(declare-fun res!453632 () Bool)

(assert (=> b!689021 (=> (not res!453632) (not e!392370))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!689021 (= res!453632 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689022 () Bool)

(declare-fun e!392363 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!689022 (= e!392363 (not (contains!3648 acc!681 k0!2843)))))

(declare-fun b!689023 () Bool)

(assert (=> b!689023 (= e!392370 (not (contains!3648 lt!316007 k0!2843)))))

(declare-fun b!689024 () Bool)

(declare-fun e!392373 () Bool)

(assert (=> b!689024 (= e!392373 (contains!3648 acc!681 k0!2843))))

(declare-fun b!689025 () Bool)

(declare-fun res!453639 () Bool)

(assert (=> b!689025 (=> (not res!453639) (not e!392372))))

(declare-fun arrayContainsKey!0 (array!39717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!689025 (= res!453639 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!689026 () Bool)

(declare-fun res!453635 () Bool)

(assert (=> b!689026 (=> (not res!453635) (not e!392372))))

(declare-fun e!392367 () Bool)

(assert (=> b!689026 (= res!453635 e!392367)))

(declare-fun res!453631 () Bool)

(assert (=> b!689026 (=> res!453631 e!392367)))

(assert (=> b!689026 (= res!453631 e!392373)))

(declare-fun res!453641 () Bool)

(assert (=> b!689026 (=> (not res!453641) (not e!392373))))

(assert (=> b!689026 (= res!453641 (bvsgt from!3004 i!1382))))

(declare-fun b!689027 () Bool)

(declare-fun res!453647 () Bool)

(assert (=> b!689027 (=> (not res!453647) (not e!392372))))

(assert (=> b!689027 (= res!453647 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19412 a!3626))))))

(declare-fun b!689028 () Bool)

(declare-datatypes ((Unit!24317 0))(
  ( (Unit!24318) )
))
(declare-fun e!392365 () Unit!24317)

(declare-fun Unit!24319 () Unit!24317)

(assert (=> b!689028 (= e!392365 Unit!24319)))

(declare-fun b!689029 () Bool)

(declare-fun res!453630 () Bool)

(assert (=> b!689029 (=> (not res!453630) (not e!392372))))

(declare-fun arrayNoDuplicates!0 (array!39717 (_ BitVec 32) List!13071) Bool)

(assert (=> b!689029 (= res!453630 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13068))))

(declare-fun b!689030 () Bool)

(declare-fun res!453637 () Bool)

(assert (=> b!689030 (=> (not res!453637) (not e!392372))))

(assert (=> b!689030 (= res!453637 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!689031 () Bool)

(assert (=> b!689031 (= e!392371 true)))

(declare-fun lt!316004 () Bool)

(assert (=> b!689031 (= lt!316004 e!392364)))

(declare-fun res!453634 () Bool)

(assert (=> b!689031 (=> res!453634 e!392364)))

(declare-fun e!392368 () Bool)

(assert (=> b!689031 (= res!453634 e!392368)))

(declare-fun res!453644 () Bool)

(assert (=> b!689031 (=> (not res!453644) (not e!392368))))

(assert (=> b!689031 (= res!453644 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689032 () Bool)

(declare-fun res!453638 () Bool)

(assert (=> b!689032 (=> res!453638 e!392371)))

(assert (=> b!689032 (= res!453638 (contains!3648 lt!316007 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689033 () Bool)

(assert (=> b!689033 (= e!392372 (not e!392371))))

(declare-fun res!453643 () Bool)

(assert (=> b!689033 (=> res!453643 e!392371)))

(assert (=> b!689033 (= res!453643 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!689033 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316007)))

(declare-fun lt!316008 () Unit!24317)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39717 (_ BitVec 64) (_ BitVec 32) List!13071 List!13071) Unit!24317)

(assert (=> b!689033 (= lt!316008 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!316007))))

(declare-fun -!199 (List!13071 (_ BitVec 64)) List!13071)

(assert (=> b!689033 (= (-!199 lt!316007 k0!2843) acc!681)))

(declare-fun $colon$colon!399 (List!13071 (_ BitVec 64)) List!13071)

(assert (=> b!689033 (= lt!316007 ($colon$colon!399 acc!681 k0!2843))))

(declare-fun lt!316003 () Unit!24317)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13071) Unit!24317)

(assert (=> b!689033 (= lt!316003 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!234 (List!13071 List!13071) Bool)

(assert (=> b!689033 (subseq!234 acc!681 acc!681)))

(declare-fun lt!316000 () Unit!24317)

(declare-fun lemmaListSubSeqRefl!0 (List!13071) Unit!24317)

(assert (=> b!689033 (= lt!316000 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689033 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!316002 () Unit!24317)

(assert (=> b!689033 (= lt!316002 e!392365)))

(declare-fun c!78061 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!689033 (= c!78061 (validKeyInArray!0 (select (arr!19030 a!3626) from!3004)))))

(declare-fun lt!316005 () Unit!24317)

(declare-fun e!392366 () Unit!24317)

(assert (=> b!689033 (= lt!316005 e!392366)))

(declare-fun c!78062 () Bool)

(assert (=> b!689033 (= c!78062 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!689033 (arrayContainsKey!0 (array!39718 (store (arr!19030 a!3626) i!1382 k0!2843) (size!19412 a!3626)) k0!2843 from!3004)))

(declare-fun b!689034 () Bool)

(assert (=> b!689034 (= e!392368 (contains!3648 lt!316007 k0!2843))))

(declare-fun b!689035 () Bool)

(declare-fun lt!316001 () Unit!24317)

(assert (=> b!689035 (= e!392365 lt!316001)))

(declare-fun lt!316009 () Unit!24317)

(assert (=> b!689035 (= lt!316009 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689035 (subseq!234 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39717 List!13071 List!13071 (_ BitVec 32)) Unit!24317)

(assert (=> b!689035 (= lt!316001 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!399 acc!681 (select (arr!19030 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!689035 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!689036 () Bool)

(declare-fun res!453645 () Bool)

(assert (=> b!689036 (=> res!453645 e!392371)))

(declare-fun noDuplicate!895 (List!13071) Bool)

(assert (=> b!689036 (= res!453645 (not (noDuplicate!895 lt!316007)))))

(declare-fun b!689037 () Bool)

(declare-fun res!453636 () Bool)

(assert (=> b!689037 (=> (not res!453636) (not e!392372))))

(assert (=> b!689037 (= res!453636 (validKeyInArray!0 k0!2843))))

(declare-fun b!689038 () Bool)

(declare-fun res!453640 () Bool)

(assert (=> b!689038 (=> (not res!453640) (not e!392372))))

(assert (=> b!689038 (= res!453640 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19412 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!689039 () Bool)

(declare-fun Unit!24320 () Unit!24317)

(assert (=> b!689039 (= e!392366 Unit!24320)))

(declare-fun lt!316006 () Unit!24317)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39717 (_ BitVec 64) (_ BitVec 32)) Unit!24317)

(assert (=> b!689039 (= lt!316006 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!689039 false))

(declare-fun b!689040 () Bool)

(declare-fun Unit!24321 () Unit!24317)

(assert (=> b!689040 (= e!392366 Unit!24321)))

(declare-fun b!689041 () Bool)

(declare-fun res!453642 () Bool)

(assert (=> b!689041 (=> (not res!453642) (not e!392372))))

(assert (=> b!689041 (= res!453642 (noDuplicate!895 acc!681))))

(declare-fun b!689042 () Bool)

(assert (=> b!689042 (= e!392367 e!392363)))

(declare-fun res!453633 () Bool)

(assert (=> b!689042 (=> (not res!453633) (not e!392363))))

(assert (=> b!689042 (= res!453633 (bvsle from!3004 i!1382))))

(assert (= (and start!61576 res!453649) b!689041))

(assert (= (and b!689041 res!453642) b!689019))

(assert (= (and b!689019 res!453650) b!689020))

(assert (= (and b!689020 res!453648) b!689026))

(assert (= (and b!689026 res!453641) b!689024))

(assert (= (and b!689026 (not res!453631)) b!689042))

(assert (= (and b!689042 res!453633) b!689022))

(assert (= (and b!689026 res!453635) b!689029))

(assert (= (and b!689029 res!453630) b!689030))

(assert (= (and b!689030 res!453637) b!689027))

(assert (= (and b!689027 res!453647) b!689037))

(assert (= (and b!689037 res!453636) b!689025))

(assert (= (and b!689025 res!453639) b!689038))

(assert (= (and b!689038 res!453640) b!689033))

(assert (= (and b!689033 c!78062) b!689039))

(assert (= (and b!689033 (not c!78062)) b!689040))

(assert (= (and b!689033 c!78061) b!689035))

(assert (= (and b!689033 (not c!78061)) b!689028))

(assert (= (and b!689033 (not res!453643)) b!689036))

(assert (= (and b!689036 (not res!453645)) b!689032))

(assert (= (and b!689032 (not res!453638)) b!689018))

(assert (= (and b!689018 (not res!453646)) b!689031))

(assert (= (and b!689031 res!453644) b!689034))

(assert (= (and b!689031 (not res!453634)) b!689021))

(assert (= (and b!689021 res!453632) b!689023))

(declare-fun m!652779 () Bool)

(assert (=> b!689018 m!652779))

(declare-fun m!652781 () Bool)

(assert (=> b!689025 m!652781))

(declare-fun m!652783 () Bool)

(assert (=> b!689020 m!652783))

(declare-fun m!652785 () Bool)

(assert (=> b!689023 m!652785))

(declare-fun m!652787 () Bool)

(assert (=> b!689035 m!652787))

(declare-fun m!652789 () Bool)

(assert (=> b!689035 m!652789))

(declare-fun m!652791 () Bool)

(assert (=> b!689035 m!652791))

(declare-fun m!652793 () Bool)

(assert (=> b!689035 m!652793))

(assert (=> b!689035 m!652789))

(assert (=> b!689035 m!652791))

(declare-fun m!652795 () Bool)

(assert (=> b!689035 m!652795))

(declare-fun m!652797 () Bool)

(assert (=> b!689035 m!652797))

(declare-fun m!652799 () Bool)

(assert (=> b!689036 m!652799))

(declare-fun m!652801 () Bool)

(assert (=> b!689022 m!652801))

(declare-fun m!652803 () Bool)

(assert (=> b!689030 m!652803))

(declare-fun m!652805 () Bool)

(assert (=> start!61576 m!652805))

(declare-fun m!652807 () Bool)

(assert (=> b!689039 m!652807))

(declare-fun m!652809 () Bool)

(assert (=> b!689037 m!652809))

(declare-fun m!652811 () Bool)

(assert (=> b!689032 m!652811))

(declare-fun m!652813 () Bool)

(assert (=> b!689041 m!652813))

(assert (=> b!689024 m!652801))

(assert (=> b!689034 m!652785))

(declare-fun m!652815 () Bool)

(assert (=> b!689019 m!652815))

(assert (=> b!689033 m!652789))

(declare-fun m!652817 () Bool)

(assert (=> b!689033 m!652817))

(declare-fun m!652819 () Bool)

(assert (=> b!689033 m!652819))

(declare-fun m!652821 () Bool)

(assert (=> b!689033 m!652821))

(declare-fun m!652823 () Bool)

(assert (=> b!689033 m!652823))

(assert (=> b!689033 m!652795))

(declare-fun m!652825 () Bool)

(assert (=> b!689033 m!652825))

(declare-fun m!652827 () Bool)

(assert (=> b!689033 m!652827))

(assert (=> b!689033 m!652789))

(declare-fun m!652829 () Bool)

(assert (=> b!689033 m!652829))

(declare-fun m!652831 () Bool)

(assert (=> b!689033 m!652831))

(assert (=> b!689033 m!652787))

(declare-fun m!652833 () Bool)

(assert (=> b!689033 m!652833))

(assert (=> b!689033 m!652797))

(declare-fun m!652835 () Bool)

(assert (=> b!689029 m!652835))

(check-sat (not b!689022) (not b!689033) (not b!689024) (not b!689037) (not b!689034) (not b!689018) (not b!689036) (not b!689030) (not b!689020) (not b!689032) (not b!689023) (not b!689035) (not b!689039) (not b!689025) (not b!689029) (not b!689041) (not b!689019) (not start!61576))
(check-sat)
