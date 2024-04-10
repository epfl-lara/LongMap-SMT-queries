; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114150 () Bool)

(assert start!114150)

(declare-fun b!1355906 () Bool)

(declare-fun e!769900 () Bool)

(assert (=> b!1355906 (= e!769900 false)))

(declare-fun lt!598825 () Bool)

(declare-datatypes ((List!31655 0))(
  ( (Nil!31652) (Cons!31651 (h!32860 (_ BitVec 64)) (t!46313 List!31655)) )
))
(declare-fun acc!759 () List!31655)

(declare-datatypes ((array!92332 0))(
  ( (array!92333 (arr!44614 (Array (_ BitVec 32) (_ BitVec 64))) (size!45164 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92332)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92332 (_ BitVec 32) List!31655) Bool)

(assert (=> b!1355906 (= lt!598825 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355907 () Bool)

(declare-fun res!900755 () Bool)

(declare-fun e!769902 () Bool)

(assert (=> b!1355907 (=> (not res!900755) (not e!769902))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355907 (= res!900755 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45164 a!3742))))))

(declare-fun res!900759 () Bool)

(assert (=> start!114150 (=> (not res!900759) (not e!769902))))

(assert (=> start!114150 (= res!900759 (and (bvslt (size!45164 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45164 a!3742))))))

(assert (=> start!114150 e!769902))

(assert (=> start!114150 true))

(declare-fun array_inv!33642 (array!92332) Bool)

(assert (=> start!114150 (array_inv!33642 a!3742)))

(declare-fun b!1355908 () Bool)

(declare-fun res!900763 () Bool)

(assert (=> b!1355908 (=> (not res!900763) (not e!769902))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355908 (= res!900763 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355909 () Bool)

(declare-fun res!900757 () Bool)

(assert (=> b!1355909 (=> (not res!900757) (not e!769902))))

(declare-fun contains!9364 (List!31655 (_ BitVec 64)) Bool)

(assert (=> b!1355909 (= res!900757 (not (contains!9364 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355910 () Bool)

(declare-datatypes ((Unit!44583 0))(
  ( (Unit!44584) )
))
(declare-fun e!769901 () Unit!44583)

(declare-fun Unit!44585 () Unit!44583)

(assert (=> b!1355910 (= e!769901 Unit!44585)))

(declare-fun b!1355911 () Bool)

(declare-fun res!900756 () Bool)

(assert (=> b!1355911 (=> (not res!900756) (not e!769902))))

(assert (=> b!1355911 (= res!900756 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355912 () Bool)

(declare-fun res!900754 () Bool)

(assert (=> b!1355912 (=> (not res!900754) (not e!769902))))

(assert (=> b!1355912 (= res!900754 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45164 a!3742)))))

(declare-fun b!1355913 () Bool)

(declare-fun res!900760 () Bool)

(assert (=> b!1355913 (=> (not res!900760) (not e!769902))))

(assert (=> b!1355913 (= res!900760 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31652))))

(declare-fun b!1355914 () Bool)

(declare-fun lt!598826 () Unit!44583)

(assert (=> b!1355914 (= e!769901 lt!598826)))

(declare-fun lt!598824 () Unit!44583)

(declare-fun lemmaListSubSeqRefl!0 (List!31655) Unit!44583)

(assert (=> b!1355914 (= lt!598824 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!784 (List!31655 List!31655) Bool)

(assert (=> b!1355914 (subseq!784 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92332 List!31655 List!31655 (_ BitVec 32)) Unit!44583)

(declare-fun $colon$colon!799 (List!31655 (_ BitVec 64)) List!31655)

(assert (=> b!1355914 (= lt!598826 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!799 acc!759 (select (arr!44614 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355914 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355915 () Bool)

(assert (=> b!1355915 (= e!769902 e!769900)))

(declare-fun res!900761 () Bool)

(assert (=> b!1355915 (=> (not res!900761) (not e!769900))))

(declare-fun lt!598828 () Bool)

(assert (=> b!1355915 (= res!900761 (and (not (= from!3120 i!1404)) (not lt!598828) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598827 () Unit!44583)

(assert (=> b!1355915 (= lt!598827 e!769901)))

(declare-fun c!127016 () Bool)

(assert (=> b!1355915 (= c!127016 lt!598828)))

(assert (=> b!1355915 (= lt!598828 (validKeyInArray!0 (select (arr!44614 a!3742) from!3120)))))

(declare-fun b!1355916 () Bool)

(declare-fun res!900758 () Bool)

(assert (=> b!1355916 (=> (not res!900758) (not e!769902))))

(assert (=> b!1355916 (= res!900758 (not (contains!9364 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355917 () Bool)

(declare-fun res!900762 () Bool)

(assert (=> b!1355917 (=> (not res!900762) (not e!769902))))

(declare-fun noDuplicate!2221 (List!31655) Bool)

(assert (=> b!1355917 (= res!900762 (noDuplicate!2221 acc!759))))

(assert (= (and start!114150 res!900759) b!1355917))

(assert (= (and b!1355917 res!900762) b!1355909))

(assert (= (and b!1355909 res!900757) b!1355916))

(assert (= (and b!1355916 res!900758) b!1355913))

(assert (= (and b!1355913 res!900760) b!1355911))

(assert (= (and b!1355911 res!900756) b!1355907))

(assert (= (and b!1355907 res!900755) b!1355908))

(assert (= (and b!1355908 res!900763) b!1355912))

(assert (= (and b!1355912 res!900754) b!1355915))

(assert (= (and b!1355915 c!127016) b!1355914))

(assert (= (and b!1355915 (not c!127016)) b!1355910))

(assert (= (and b!1355915 res!900761) b!1355906))

(declare-fun m!1241985 () Bool)

(assert (=> b!1355917 m!1241985))

(declare-fun m!1241987 () Bool)

(assert (=> start!114150 m!1241987))

(declare-fun m!1241989 () Bool)

(assert (=> b!1355906 m!1241989))

(declare-fun m!1241991 () Bool)

(assert (=> b!1355909 m!1241991))

(declare-fun m!1241993 () Bool)

(assert (=> b!1355915 m!1241993))

(assert (=> b!1355915 m!1241993))

(declare-fun m!1241995 () Bool)

(assert (=> b!1355915 m!1241995))

(declare-fun m!1241997 () Bool)

(assert (=> b!1355911 m!1241997))

(declare-fun m!1241999 () Bool)

(assert (=> b!1355914 m!1241999))

(assert (=> b!1355914 m!1241993))

(declare-fun m!1242001 () Bool)

(assert (=> b!1355914 m!1242001))

(declare-fun m!1242003 () Bool)

(assert (=> b!1355914 m!1242003))

(assert (=> b!1355914 m!1241989))

(assert (=> b!1355914 m!1241993))

(assert (=> b!1355914 m!1242001))

(declare-fun m!1242005 () Bool)

(assert (=> b!1355914 m!1242005))

(declare-fun m!1242007 () Bool)

(assert (=> b!1355908 m!1242007))

(declare-fun m!1242009 () Bool)

(assert (=> b!1355913 m!1242009))

(declare-fun m!1242011 () Bool)

(assert (=> b!1355916 m!1242011))

(push 1)

(assert (not b!1355914))

(assert (not b!1355916))

(assert (not b!1355909))

