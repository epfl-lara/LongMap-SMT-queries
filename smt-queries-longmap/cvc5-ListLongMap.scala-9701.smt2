; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114660 () Bool)

(assert start!114660)

(declare-fun b!1360064 () Bool)

(declare-fun res!904458 () Bool)

(declare-fun e!771697 () Bool)

(assert (=> b!1360064 (=> (not res!904458) (not e!771697))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360064 (= res!904458 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360065 () Bool)

(declare-fun res!904462 () Bool)

(assert (=> b!1360065 (=> (not res!904462) (not e!771697))))

(declare-datatypes ((List!31807 0))(
  ( (Nil!31804) (Cons!31803 (h!33012 (_ BitVec 64)) (t!46475 List!31807)) )
))
(declare-fun acc!759 () List!31807)

(declare-fun contains!9427 (List!31807 (_ BitVec 64)) Bool)

(assert (=> b!1360065 (= res!904462 (not (contains!9427 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360066 () Bool)

(declare-datatypes ((Unit!44640 0))(
  ( (Unit!44641) )
))
(declare-fun e!771696 () Unit!44640)

(declare-fun lt!599613 () Unit!44640)

(assert (=> b!1360066 (= e!771696 lt!599613)))

(declare-fun lt!599614 () Unit!44640)

(declare-fun lemmaListSubSeqRefl!0 (List!31807) Unit!44640)

(assert (=> b!1360066 (= lt!599614 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!865 (List!31807 List!31807) Bool)

(assert (=> b!1360066 (subseq!865 acc!759 acc!759)))

(declare-datatypes ((array!92497 0))(
  ( (array!92498 (arr!44688 (Array (_ BitVec 32) (_ BitVec 64))) (size!45240 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92497)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92497 List!31807 List!31807 (_ BitVec 32)) Unit!44640)

(declare-fun $colon$colon!870 (List!31807 (_ BitVec 64)) List!31807)

(assert (=> b!1360066 (= lt!599613 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!870 acc!759 (select (arr!44688 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92497 (_ BitVec 32) List!31807) Bool)

(assert (=> b!1360066 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360068 () Bool)

(declare-fun res!904461 () Bool)

(assert (=> b!1360068 (=> (not res!904461) (not e!771697))))

(assert (=> b!1360068 (= res!904461 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45240 a!3742)))))

(declare-fun b!1360069 () Bool)

(assert (=> b!1360069 (= e!771697 false)))

(declare-fun lt!599612 () Unit!44640)

(assert (=> b!1360069 (= lt!599612 e!771696)))

(declare-fun c!127247 () Bool)

(assert (=> b!1360069 (= c!127247 (validKeyInArray!0 (select (arr!44688 a!3742) from!3120)))))

(declare-fun b!1360070 () Bool)

(declare-fun Unit!44642 () Unit!44640)

(assert (=> b!1360070 (= e!771696 Unit!44642)))

(declare-fun b!1360071 () Bool)

(declare-fun res!904456 () Bool)

(assert (=> b!1360071 (=> (not res!904456) (not e!771697))))

(assert (=> b!1360071 (= res!904456 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360072 () Bool)

(declare-fun res!904457 () Bool)

(assert (=> b!1360072 (=> (not res!904457) (not e!771697))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360072 (= res!904457 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45240 a!3742))))))

(declare-fun res!904460 () Bool)

(assert (=> start!114660 (=> (not res!904460) (not e!771697))))

(assert (=> start!114660 (= res!904460 (and (bvslt (size!45240 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45240 a!3742))))))

(assert (=> start!114660 e!771697))

(assert (=> start!114660 true))

(declare-fun array_inv!33921 (array!92497) Bool)

(assert (=> start!114660 (array_inv!33921 a!3742)))

(declare-fun b!1360067 () Bool)

(declare-fun res!904459 () Bool)

(assert (=> b!1360067 (=> (not res!904459) (not e!771697))))

(assert (=> b!1360067 (= res!904459 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31804))))

(declare-fun b!1360073 () Bool)

(declare-fun res!904455 () Bool)

(assert (=> b!1360073 (=> (not res!904455) (not e!771697))))

(declare-fun noDuplicate!2342 (List!31807) Bool)

(assert (=> b!1360073 (= res!904455 (noDuplicate!2342 acc!759))))

(declare-fun b!1360074 () Bool)

(declare-fun res!904463 () Bool)

(assert (=> b!1360074 (=> (not res!904463) (not e!771697))))

(assert (=> b!1360074 (= res!904463 (not (contains!9427 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114660 res!904460) b!1360073))

(assert (= (and b!1360073 res!904455) b!1360074))

(assert (= (and b!1360074 res!904463) b!1360065))

(assert (= (and b!1360065 res!904462) b!1360067))

(assert (= (and b!1360067 res!904459) b!1360071))

(assert (= (and b!1360071 res!904456) b!1360072))

(assert (= (and b!1360072 res!904457) b!1360064))

(assert (= (and b!1360064 res!904458) b!1360068))

(assert (= (and b!1360068 res!904461) b!1360069))

(assert (= (and b!1360069 c!127247) b!1360066))

(assert (= (and b!1360069 (not c!127247)) b!1360070))

(declare-fun m!1244937 () Bool)

(assert (=> b!1360073 m!1244937))

(declare-fun m!1244939 () Bool)

(assert (=> b!1360064 m!1244939))

(declare-fun m!1244941 () Bool)

(assert (=> b!1360069 m!1244941))

(assert (=> b!1360069 m!1244941))

(declare-fun m!1244943 () Bool)

(assert (=> b!1360069 m!1244943))

(declare-fun m!1244945 () Bool)

(assert (=> b!1360074 m!1244945))

(declare-fun m!1244947 () Bool)

(assert (=> b!1360066 m!1244947))

(assert (=> b!1360066 m!1244941))

(declare-fun m!1244949 () Bool)

(assert (=> b!1360066 m!1244949))

(declare-fun m!1244951 () Bool)

(assert (=> b!1360066 m!1244951))

(declare-fun m!1244953 () Bool)

(assert (=> b!1360066 m!1244953))

(assert (=> b!1360066 m!1244941))

(assert (=> b!1360066 m!1244949))

(declare-fun m!1244955 () Bool)

(assert (=> b!1360066 m!1244955))

(declare-fun m!1244957 () Bool)

(assert (=> start!114660 m!1244957))

(declare-fun m!1244959 () Bool)

(assert (=> b!1360065 m!1244959))

(declare-fun m!1244961 () Bool)

(assert (=> b!1360067 m!1244961))

(declare-fun m!1244963 () Bool)

(assert (=> b!1360071 m!1244963))

(push 1)

(assert (not b!1360066))

(assert (not b!1360065))

(assert (not start!114660))

(assert (not b!1360064))

(assert (not b!1360073))

(assert (not b!1360069))

(assert (not b!1360067))

(assert (not b!1360074))

(assert (not b!1360071))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

