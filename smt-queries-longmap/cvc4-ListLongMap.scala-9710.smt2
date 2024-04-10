; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114876 () Bool)

(assert start!114876)

(declare-fun b!1361707 () Bool)

(declare-fun res!905806 () Bool)

(declare-fun e!772528 () Bool)

(assert (=> b!1361707 (=> (not res!905806) (not e!772528))))

(declare-datatypes ((List!31781 0))(
  ( (Nil!31778) (Cons!31777 (h!32986 (_ BitVec 64)) (t!46466 List!31781)) )
))
(declare-fun lt!600252 () List!31781)

(declare-fun noDuplicate!2347 (List!31781) Bool)

(assert (=> b!1361707 (= res!905806 (noDuplicate!2347 lt!600252))))

(declare-fun b!1361708 () Bool)

(declare-fun res!905802 () Bool)

(declare-fun e!772527 () Bool)

(assert (=> b!1361708 (=> (not res!905802) (not e!772527))))

(declare-fun acc!759 () List!31781)

(declare-fun contains!9490 (List!31781 (_ BitVec 64)) Bool)

(assert (=> b!1361708 (= res!905802 (not (contains!9490 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!905804 () Bool)

(assert (=> start!114876 (=> (not res!905804) (not e!772527))))

(declare-datatypes ((array!92611 0))(
  ( (array!92612 (arr!44740 (Array (_ BitVec 32) (_ BitVec 64))) (size!45290 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92611)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114876 (= res!905804 (and (bvslt (size!45290 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45290 a!3742))))))

(assert (=> start!114876 e!772527))

(assert (=> start!114876 true))

(declare-fun array_inv!33768 (array!92611) Bool)

(assert (=> start!114876 (array_inv!33768 a!3742)))

(declare-fun b!1361709 () Bool)

(declare-datatypes ((Unit!44880 0))(
  ( (Unit!44881) )
))
(declare-fun e!772531 () Unit!44880)

(declare-fun lt!600250 () Unit!44880)

(assert (=> b!1361709 (= e!772531 lt!600250)))

(declare-fun lt!600251 () Unit!44880)

(declare-fun lemmaListSubSeqRefl!0 (List!31781) Unit!44880)

(assert (=> b!1361709 (= lt!600251 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!892 (List!31781 List!31781) Bool)

(assert (=> b!1361709 (subseq!892 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92611 List!31781 List!31781 (_ BitVec 32)) Unit!44880)

(declare-fun $colon$colon!895 (List!31781 (_ BitVec 64)) List!31781)

(assert (=> b!1361709 (= lt!600250 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!895 acc!759 (select (arr!44740 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92611 (_ BitVec 32) List!31781) Bool)

(assert (=> b!1361709 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1361710 () Bool)

(declare-fun e!772530 () Bool)

(assert (=> b!1361710 (= e!772530 e!772528)))

(declare-fun res!905809 () Bool)

(assert (=> b!1361710 (=> (not res!905809) (not e!772528))))

(assert (=> b!1361710 (= res!905809 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1361710 (= lt!600252 ($colon$colon!895 acc!759 (select (arr!44740 a!3742) from!3120)))))

(declare-fun b!1361711 () Bool)

(declare-fun res!905808 () Bool)

(assert (=> b!1361711 (=> (not res!905808) (not e!772528))))

(assert (=> b!1361711 (= res!905808 (not (contains!9490 lt!600252 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361712 () Bool)

(declare-fun res!905801 () Bool)

(assert (=> b!1361712 (=> (not res!905801) (not e!772527))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1361712 (= res!905801 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1361713 () Bool)

(declare-fun res!905805 () Bool)

(assert (=> b!1361713 (=> (not res!905805) (not e!772528))))

(assert (=> b!1361713 (= res!905805 (not (contains!9490 lt!600252 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361714 () Bool)

(declare-fun res!905812 () Bool)

(assert (=> b!1361714 (=> (not res!905812) (not e!772527))))

(assert (=> b!1361714 (= res!905812 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31778))))

(declare-fun b!1361715 () Bool)

(declare-fun res!905803 () Bool)

(assert (=> b!1361715 (=> (not res!905803) (not e!772527))))

(assert (=> b!1361715 (= res!905803 (noDuplicate!2347 acc!759))))

(declare-fun b!1361716 () Bool)

(declare-fun res!905807 () Bool)

(assert (=> b!1361716 (=> (not res!905807) (not e!772527))))

(assert (=> b!1361716 (= res!905807 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45290 a!3742)))))

(declare-fun b!1361717 () Bool)

(declare-fun res!905810 () Bool)

(assert (=> b!1361717 (=> (not res!905810) (not e!772527))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1361717 (= res!905810 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45290 a!3742))))))

(declare-fun b!1361718 () Bool)

(declare-fun res!905799 () Bool)

(assert (=> b!1361718 (=> (not res!905799) (not e!772527))))

(assert (=> b!1361718 (= res!905799 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1361719 () Bool)

(assert (=> b!1361719 (= e!772528 false)))

(declare-fun lt!600253 () Bool)

(assert (=> b!1361719 (= lt!600253 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600252))))

(declare-fun b!1361720 () Bool)

(assert (=> b!1361720 (= e!772527 e!772530)))

(declare-fun res!905811 () Bool)

(assert (=> b!1361720 (=> (not res!905811) (not e!772530))))

(declare-fun lt!600248 () Bool)

(assert (=> b!1361720 (= res!905811 (and (not (= from!3120 i!1404)) lt!600248))))

(declare-fun lt!600249 () Unit!44880)

(assert (=> b!1361720 (= lt!600249 e!772531)))

(declare-fun c!127394 () Bool)

(assert (=> b!1361720 (= c!127394 lt!600248)))

(assert (=> b!1361720 (= lt!600248 (validKeyInArray!0 (select (arr!44740 a!3742) from!3120)))))

(declare-fun b!1361721 () Bool)

(declare-fun Unit!44882 () Unit!44880)

(assert (=> b!1361721 (= e!772531 Unit!44882)))

(declare-fun b!1361722 () Bool)

(declare-fun res!905800 () Bool)

(assert (=> b!1361722 (=> (not res!905800) (not e!772527))))

(assert (=> b!1361722 (= res!905800 (not (contains!9490 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114876 res!905804) b!1361715))

(assert (= (and b!1361715 res!905803) b!1361708))

(assert (= (and b!1361708 res!905802) b!1361722))

(assert (= (and b!1361722 res!905800) b!1361714))

(assert (= (and b!1361714 res!905812) b!1361718))

(assert (= (and b!1361718 res!905799) b!1361717))

(assert (= (and b!1361717 res!905810) b!1361712))

(assert (= (and b!1361712 res!905801) b!1361716))

(assert (= (and b!1361716 res!905807) b!1361720))

(assert (= (and b!1361720 c!127394) b!1361709))

(assert (= (and b!1361720 (not c!127394)) b!1361721))

(assert (= (and b!1361720 res!905811) b!1361710))

(assert (= (and b!1361710 res!905809) b!1361707))

(assert (= (and b!1361707 res!905806) b!1361711))

(assert (= (and b!1361711 res!905808) b!1361713))

(assert (= (and b!1361713 res!905805) b!1361719))

(declare-fun m!1246777 () Bool)

(assert (=> b!1361709 m!1246777))

(declare-fun m!1246779 () Bool)

(assert (=> b!1361709 m!1246779))

(declare-fun m!1246781 () Bool)

(assert (=> b!1361709 m!1246781))

(declare-fun m!1246783 () Bool)

(assert (=> b!1361709 m!1246783))

(declare-fun m!1246785 () Bool)

(assert (=> b!1361709 m!1246785))

(assert (=> b!1361709 m!1246779))

(assert (=> b!1361709 m!1246781))

(declare-fun m!1246787 () Bool)

(assert (=> b!1361709 m!1246787))

(declare-fun m!1246789 () Bool)

(assert (=> b!1361713 m!1246789))

(declare-fun m!1246791 () Bool)

(assert (=> b!1361712 m!1246791))

(declare-fun m!1246793 () Bool)

(assert (=> start!114876 m!1246793))

(declare-fun m!1246795 () Bool)

(assert (=> b!1361715 m!1246795))

(declare-fun m!1246797 () Bool)

(assert (=> b!1361707 m!1246797))

(declare-fun m!1246799 () Bool)

(assert (=> b!1361711 m!1246799))

(assert (=> b!1361720 m!1246779))

(assert (=> b!1361720 m!1246779))

(declare-fun m!1246801 () Bool)

(assert (=> b!1361720 m!1246801))

(declare-fun m!1246803 () Bool)

(assert (=> b!1361714 m!1246803))

(assert (=> b!1361710 m!1246779))

(assert (=> b!1361710 m!1246779))

(assert (=> b!1361710 m!1246781))

(declare-fun m!1246805 () Bool)

(assert (=> b!1361718 m!1246805))

(declare-fun m!1246807 () Bool)

(assert (=> b!1361722 m!1246807))

(declare-fun m!1246809 () Bool)

(assert (=> b!1361719 m!1246809))

(declare-fun m!1246811 () Bool)

(assert (=> b!1361708 m!1246811))

(push 1)

(assert (not b!1361720))

(assert (not b!1361715))

(assert (not b!1361707))

