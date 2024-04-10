; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114236 () Bool)

(assert start!114236)

(declare-fun b!1357108 () Bool)

(declare-fun res!901865 () Bool)

(declare-fun e!770250 () Bool)

(assert (=> b!1357108 (=> (not res!901865) (not e!770250))))

(declare-datatypes ((List!31698 0))(
  ( (Nil!31695) (Cons!31694 (h!32903 (_ BitVec 64)) (t!46356 List!31698)) )
))
(declare-fun acc!759 () List!31698)

(declare-fun contains!9407 (List!31698 (_ BitVec 64)) Bool)

(assert (=> b!1357108 (= res!901865 (not (contains!9407 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357109 () Bool)

(assert (=> b!1357109 (= e!770250 (not true))))

(declare-fun subseq!809 (List!31698 List!31698) Bool)

(assert (=> b!1357109 (subseq!809 acc!759 acc!759)))

(declare-datatypes ((Unit!44649 0))(
  ( (Unit!44650) )
))
(declare-fun lt!599119 () Unit!44649)

(declare-fun lemmaListSubSeqRefl!0 (List!31698) Unit!44649)

(assert (=> b!1357109 (= lt!599119 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun res!901869 () Bool)

(assert (=> start!114236 (=> (not res!901869) (not e!770250))))

(declare-datatypes ((array!92418 0))(
  ( (array!92419 (arr!44657 (Array (_ BitVec 32) (_ BitVec 64))) (size!45207 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92418)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114236 (= res!901869 (and (bvslt (size!45207 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45207 a!3742))))))

(assert (=> start!114236 e!770250))

(assert (=> start!114236 true))

(declare-fun array_inv!33685 (array!92418) Bool)

(assert (=> start!114236 (array_inv!33685 a!3742)))

(declare-fun b!1357110 () Bool)

(declare-fun res!901871 () Bool)

(assert (=> b!1357110 (=> (not res!901871) (not e!770250))))

(assert (=> b!1357110 (= res!901871 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45207 a!3742)))))

(declare-fun b!1357111 () Bool)

(declare-fun res!901870 () Bool)

(assert (=> b!1357111 (=> (not res!901870) (not e!770250))))

(declare-fun arrayNoDuplicates!0 (array!92418 (_ BitVec 32) List!31698) Bool)

(assert (=> b!1357111 (= res!901870 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31695))))

(declare-fun b!1357112 () Bool)

(declare-fun res!901868 () Bool)

(assert (=> b!1357112 (=> (not res!901868) (not e!770250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357112 (= res!901868 (validKeyInArray!0 (select (arr!44657 a!3742) from!3120)))))

(declare-fun b!1357113 () Bool)

(declare-fun res!901866 () Bool)

(assert (=> b!1357113 (=> (not res!901866) (not e!770250))))

(declare-fun noDuplicate!2264 (List!31698) Bool)

(assert (=> b!1357113 (= res!901866 (noDuplicate!2264 acc!759))))

(declare-fun b!1357114 () Bool)

(declare-fun res!901873 () Bool)

(assert (=> b!1357114 (=> (not res!901873) (not e!770250))))

(assert (=> b!1357114 (= res!901873 (not (contains!9407 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357115 () Bool)

(declare-fun res!901864 () Bool)

(assert (=> b!1357115 (=> (not res!901864) (not e!770250))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1357115 (= res!901864 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45207 a!3742))))))

(declare-fun b!1357116 () Bool)

(declare-fun res!901867 () Bool)

(assert (=> b!1357116 (=> (not res!901867) (not e!770250))))

(assert (=> b!1357116 (= res!901867 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1357117 () Bool)

(declare-fun res!901872 () Bool)

(assert (=> b!1357117 (=> (not res!901872) (not e!770250))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1357117 (= res!901872 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!114236 res!901869) b!1357113))

(assert (= (and b!1357113 res!901866) b!1357108))

(assert (= (and b!1357108 res!901865) b!1357114))

(assert (= (and b!1357114 res!901873) b!1357111))

(assert (= (and b!1357111 res!901870) b!1357116))

(assert (= (and b!1357116 res!901867) b!1357115))

(assert (= (and b!1357115 res!901864) b!1357117))

(assert (= (and b!1357117 res!901872) b!1357110))

(assert (= (and b!1357110 res!901871) b!1357112))

(assert (= (and b!1357112 res!901868) b!1357109))

(declare-fun m!1242931 () Bool)

(assert (=> b!1357108 m!1242931))

(declare-fun m!1242933 () Bool)

(assert (=> b!1357111 m!1242933))

(declare-fun m!1242935 () Bool)

(assert (=> start!114236 m!1242935))

(declare-fun m!1242937 () Bool)

(assert (=> b!1357117 m!1242937))

(declare-fun m!1242939 () Bool)

(assert (=> b!1357113 m!1242939))

(declare-fun m!1242941 () Bool)

(assert (=> b!1357116 m!1242941))

(declare-fun m!1242943 () Bool)

(assert (=> b!1357112 m!1242943))

(assert (=> b!1357112 m!1242943))

(declare-fun m!1242945 () Bool)

(assert (=> b!1357112 m!1242945))

(declare-fun m!1242947 () Bool)

(assert (=> b!1357109 m!1242947))

(declare-fun m!1242949 () Bool)

(assert (=> b!1357109 m!1242949))

(declare-fun m!1242951 () Bool)

(assert (=> b!1357114 m!1242951))

(push 1)

(assert (not b!1357111))

(assert (not b!1357112))

(assert (not b!1357116))

(assert (not start!114236))

(assert (not b!1357113))

(assert (not b!1357117))

(assert (not b!1357109))

(assert (not b!1357114))

(assert (not b!1357108))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

