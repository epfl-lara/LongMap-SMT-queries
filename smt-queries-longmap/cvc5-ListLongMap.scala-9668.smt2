; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114146 () Bool)

(assert start!114146)

(declare-fun b!1355834 () Bool)

(declare-fun res!900701 () Bool)

(declare-fun e!769877 () Bool)

(assert (=> b!1355834 (=> (not res!900701) (not e!769877))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92328 0))(
  ( (array!92329 (arr!44612 (Array (_ BitVec 32) (_ BitVec 64))) (size!45162 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92328)

(assert (=> b!1355834 (= res!900701 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45162 a!3742)))))

(declare-fun b!1355835 () Bool)

(declare-fun res!900697 () Bool)

(assert (=> b!1355835 (=> (not res!900697) (not e!769877))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355835 (= res!900697 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45162 a!3742))))))

(declare-fun b!1355836 () Bool)

(declare-fun res!900696 () Bool)

(assert (=> b!1355836 (=> (not res!900696) (not e!769877))))

(declare-datatypes ((List!31653 0))(
  ( (Nil!31650) (Cons!31649 (h!32858 (_ BitVec 64)) (t!46311 List!31653)) )
))
(declare-fun acc!759 () List!31653)

(declare-fun contains!9362 (List!31653 (_ BitVec 64)) Bool)

(assert (=> b!1355836 (= res!900696 (not (contains!9362 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355837 () Bool)

(declare-fun res!900699 () Bool)

(assert (=> b!1355837 (=> (not res!900699) (not e!769877))))

(declare-fun arrayNoDuplicates!0 (array!92328 (_ BitVec 32) List!31653) Bool)

(assert (=> b!1355837 (= res!900699 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31650))))

(declare-fun b!1355838 () Bool)

(declare-fun res!900694 () Bool)

(assert (=> b!1355838 (=> (not res!900694) (not e!769877))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355838 (= res!900694 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355839 () Bool)

(declare-fun e!769878 () Bool)

(assert (=> b!1355839 (= e!769878 false)))

(declare-fun lt!598797 () Bool)

(assert (=> b!1355839 (= lt!598797 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355840 () Bool)

(declare-fun res!900702 () Bool)

(assert (=> b!1355840 (=> (not res!900702) (not e!769877))))

(assert (=> b!1355840 (= res!900702 (not (contains!9362 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!900698 () Bool)

(assert (=> start!114146 (=> (not res!900698) (not e!769877))))

(assert (=> start!114146 (= res!900698 (and (bvslt (size!45162 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45162 a!3742))))))

(assert (=> start!114146 e!769877))

(assert (=> start!114146 true))

(declare-fun array_inv!33640 (array!92328) Bool)

(assert (=> start!114146 (array_inv!33640 a!3742)))

(declare-fun b!1355841 () Bool)

(declare-fun res!900695 () Bool)

(assert (=> b!1355841 (=> (not res!900695) (not e!769877))))

(assert (=> b!1355841 (= res!900695 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355842 () Bool)

(declare-fun res!900703 () Bool)

(assert (=> b!1355842 (=> (not res!900703) (not e!769877))))

(declare-fun noDuplicate!2219 (List!31653) Bool)

(assert (=> b!1355842 (= res!900703 (noDuplicate!2219 acc!759))))

(declare-fun b!1355843 () Bool)

(assert (=> b!1355843 (= e!769877 e!769878)))

(declare-fun res!900700 () Bool)

(assert (=> b!1355843 (=> (not res!900700) (not e!769878))))

(declare-fun lt!598796 () Bool)

(assert (=> b!1355843 (= res!900700 (and (not (= from!3120 i!1404)) (not lt!598796) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44577 0))(
  ( (Unit!44578) )
))
(declare-fun lt!598795 () Unit!44577)

(declare-fun e!769879 () Unit!44577)

(assert (=> b!1355843 (= lt!598795 e!769879)))

(declare-fun c!127010 () Bool)

(assert (=> b!1355843 (= c!127010 lt!598796)))

(assert (=> b!1355843 (= lt!598796 (validKeyInArray!0 (select (arr!44612 a!3742) from!3120)))))

(declare-fun b!1355844 () Bool)

(declare-fun lt!598794 () Unit!44577)

(assert (=> b!1355844 (= e!769879 lt!598794)))

(declare-fun lt!598798 () Unit!44577)

(declare-fun lemmaListSubSeqRefl!0 (List!31653) Unit!44577)

(assert (=> b!1355844 (= lt!598798 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!782 (List!31653 List!31653) Bool)

(assert (=> b!1355844 (subseq!782 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92328 List!31653 List!31653 (_ BitVec 32)) Unit!44577)

(declare-fun $colon$colon!797 (List!31653 (_ BitVec 64)) List!31653)

(assert (=> b!1355844 (= lt!598794 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!797 acc!759 (select (arr!44612 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355844 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355845 () Bool)

(declare-fun Unit!44579 () Unit!44577)

(assert (=> b!1355845 (= e!769879 Unit!44579)))

(assert (= (and start!114146 res!900698) b!1355842))

(assert (= (and b!1355842 res!900703) b!1355836))

(assert (= (and b!1355836 res!900696) b!1355840))

(assert (= (and b!1355840 res!900702) b!1355837))

(assert (= (and b!1355837 res!900699) b!1355841))

(assert (= (and b!1355841 res!900695) b!1355835))

(assert (= (and b!1355835 res!900697) b!1355838))

(assert (= (and b!1355838 res!900694) b!1355834))

(assert (= (and b!1355834 res!900701) b!1355843))

(assert (= (and b!1355843 c!127010) b!1355844))

(assert (= (and b!1355843 (not c!127010)) b!1355845))

(assert (= (and b!1355843 res!900700) b!1355839))

(declare-fun m!1241929 () Bool)

(assert (=> b!1355843 m!1241929))

(assert (=> b!1355843 m!1241929))

(declare-fun m!1241931 () Bool)

(assert (=> b!1355843 m!1241931))

(declare-fun m!1241933 () Bool)

(assert (=> b!1355839 m!1241933))

(declare-fun m!1241935 () Bool)

(assert (=> b!1355844 m!1241935))

(assert (=> b!1355844 m!1241929))

(declare-fun m!1241937 () Bool)

(assert (=> b!1355844 m!1241937))

(declare-fun m!1241939 () Bool)

(assert (=> b!1355844 m!1241939))

(assert (=> b!1355844 m!1241933))

(assert (=> b!1355844 m!1241929))

(assert (=> b!1355844 m!1241937))

(declare-fun m!1241941 () Bool)

(assert (=> b!1355844 m!1241941))

(declare-fun m!1241943 () Bool)

(assert (=> b!1355836 m!1241943))

(declare-fun m!1241945 () Bool)

(assert (=> b!1355842 m!1241945))

(declare-fun m!1241947 () Bool)

(assert (=> b!1355837 m!1241947))

(declare-fun m!1241949 () Bool)

(assert (=> start!114146 m!1241949))

(declare-fun m!1241951 () Bool)

(assert (=> b!1355840 m!1241951))

(declare-fun m!1241953 () Bool)

(assert (=> b!1355838 m!1241953))

(declare-fun m!1241955 () Bool)

(assert (=> b!1355841 m!1241955))

(push 1)

