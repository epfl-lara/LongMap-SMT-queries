; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114224 () Bool)

(assert start!114224)

(declare-fun b!1356928 () Bool)

(declare-fun res!901687 () Bool)

(declare-fun e!770215 () Bool)

(assert (=> b!1356928 (=> (not res!901687) (not e!770215))))

(declare-datatypes ((List!31692 0))(
  ( (Nil!31689) (Cons!31688 (h!32897 (_ BitVec 64)) (t!46350 List!31692)) )
))
(declare-fun acc!759 () List!31692)

(declare-fun contains!9401 (List!31692 (_ BitVec 64)) Bool)

(assert (=> b!1356928 (= res!901687 (not (contains!9401 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356929 () Bool)

(declare-fun res!901689 () Bool)

(assert (=> b!1356929 (=> (not res!901689) (not e!770215))))

(declare-fun noDuplicate!2258 (List!31692) Bool)

(assert (=> b!1356929 (= res!901689 (noDuplicate!2258 acc!759))))

(declare-fun b!1356930 () Bool)

(assert (=> b!1356930 (= e!770215 (not true))))

(declare-fun subseq!803 (List!31692 List!31692) Bool)

(assert (=> b!1356930 (subseq!803 acc!759 acc!759)))

(declare-datatypes ((Unit!44637 0))(
  ( (Unit!44638) )
))
(declare-fun lt!599101 () Unit!44637)

(declare-fun lemmaListSubSeqRefl!0 (List!31692) Unit!44637)

(assert (=> b!1356930 (= lt!599101 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1356931 () Bool)

(declare-fun res!901685 () Bool)

(assert (=> b!1356931 (=> (not res!901685) (not e!770215))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356931 (= res!901685 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356932 () Bool)

(declare-fun res!901690 () Bool)

(assert (=> b!1356932 (=> (not res!901690) (not e!770215))))

(assert (=> b!1356932 (= res!901690 (not (contains!9401 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356933 () Bool)

(declare-fun res!901692 () Bool)

(assert (=> b!1356933 (=> (not res!901692) (not e!770215))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92406 0))(
  ( (array!92407 (arr!44651 (Array (_ BitVec 32) (_ BitVec 64))) (size!45201 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92406)

(assert (=> b!1356933 (= res!901692 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45201 a!3742)))))

(declare-fun res!901686 () Bool)

(assert (=> start!114224 (=> (not res!901686) (not e!770215))))

(assert (=> start!114224 (= res!901686 (and (bvslt (size!45201 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45201 a!3742))))))

(assert (=> start!114224 e!770215))

(assert (=> start!114224 true))

(declare-fun array_inv!33679 (array!92406) Bool)

(assert (=> start!114224 (array_inv!33679 a!3742)))

(declare-fun b!1356934 () Bool)

(declare-fun res!901688 () Bool)

(assert (=> b!1356934 (=> (not res!901688) (not e!770215))))

(assert (=> b!1356934 (= res!901688 (validKeyInArray!0 (select (arr!44651 a!3742) from!3120)))))

(declare-fun b!1356935 () Bool)

(declare-fun res!901693 () Bool)

(assert (=> b!1356935 (=> (not res!901693) (not e!770215))))

(declare-fun arrayNoDuplicates!0 (array!92406 (_ BitVec 32) List!31692) Bool)

(assert (=> b!1356935 (= res!901693 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356936 () Bool)

(declare-fun res!901691 () Bool)

(assert (=> b!1356936 (=> (not res!901691) (not e!770215))))

(assert (=> b!1356936 (= res!901691 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31689))))

(declare-fun b!1356937 () Bool)

(declare-fun res!901684 () Bool)

(assert (=> b!1356937 (=> (not res!901684) (not e!770215))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1356937 (= res!901684 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45201 a!3742))))))

(assert (= (and start!114224 res!901686) b!1356929))

(assert (= (and b!1356929 res!901689) b!1356932))

(assert (= (and b!1356932 res!901690) b!1356928))

(assert (= (and b!1356928 res!901687) b!1356936))

(assert (= (and b!1356936 res!901691) b!1356935))

(assert (= (and b!1356935 res!901693) b!1356937))

(assert (= (and b!1356937 res!901684) b!1356931))

(assert (= (and b!1356931 res!901685) b!1356933))

(assert (= (and b!1356933 res!901692) b!1356934))

(assert (= (and b!1356934 res!901688) b!1356930))

(declare-fun m!1242799 () Bool)

(assert (=> b!1356928 m!1242799))

(declare-fun m!1242801 () Bool)

(assert (=> b!1356930 m!1242801))

(declare-fun m!1242803 () Bool)

(assert (=> b!1356930 m!1242803))

(declare-fun m!1242805 () Bool)

(assert (=> start!114224 m!1242805))

(declare-fun m!1242807 () Bool)

(assert (=> b!1356931 m!1242807))

(declare-fun m!1242809 () Bool)

(assert (=> b!1356932 m!1242809))

(declare-fun m!1242811 () Bool)

(assert (=> b!1356929 m!1242811))

(declare-fun m!1242813 () Bool)

(assert (=> b!1356936 m!1242813))

(declare-fun m!1242815 () Bool)

(assert (=> b!1356934 m!1242815))

(assert (=> b!1356934 m!1242815))

(declare-fun m!1242817 () Bool)

(assert (=> b!1356934 m!1242817))

(declare-fun m!1242819 () Bool)

(assert (=> b!1356935 m!1242819))

(push 1)

(assert (not b!1356929))

(assert (not b!1356934))

(assert (not b!1356928))

(assert (not start!114224))

(assert (not b!1356935))

(assert (not b!1356936))

(assert (not b!1356931))

(assert (not b!1356932))

(assert (not b!1356930))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

