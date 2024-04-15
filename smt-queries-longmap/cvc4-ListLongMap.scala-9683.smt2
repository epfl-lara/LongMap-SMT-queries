; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114238 () Bool)

(assert start!114238)

(declare-fun b!1357068 () Bool)

(declare-fun res!901869 () Bool)

(declare-fun e!770223 () Bool)

(assert (=> b!1357068 (=> (not res!901869) (not e!770223))))

(declare-datatypes ((array!92369 0))(
  ( (array!92370 (arr!44633 (Array (_ BitVec 32) (_ BitVec 64))) (size!45185 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92369)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357068 (= res!901869 (validKeyInArray!0 (select (arr!44633 a!3742) from!3120)))))

(declare-fun b!1357069 () Bool)

(declare-fun res!901867 () Bool)

(assert (=> b!1357069 (=> (not res!901867) (not e!770223))))

(declare-datatypes ((List!31752 0))(
  ( (Nil!31749) (Cons!31748 (h!32957 (_ BitVec 64)) (t!46402 List!31752)) )
))
(declare-fun acc!759 () List!31752)

(declare-fun arrayNoDuplicates!0 (array!92369 (_ BitVec 32) List!31752) Bool)

(assert (=> b!1357069 (= res!901867 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1357070 () Bool)

(declare-fun res!901870 () Bool)

(assert (=> b!1357070 (=> (not res!901870) (not e!770223))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1357070 (= res!901870 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45185 a!3742))))))

(declare-fun b!1357071 () Bool)

(declare-fun res!901874 () Bool)

(assert (=> b!1357071 (=> (not res!901874) (not e!770223))))

(assert (=> b!1357071 (= res!901874 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31749))))

(declare-fun b!1357072 () Bool)

(declare-fun res!901873 () Bool)

(assert (=> b!1357072 (=> (not res!901873) (not e!770223))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1357072 (= res!901873 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!901866 () Bool)

(assert (=> start!114238 (=> (not res!901866) (not e!770223))))

(assert (=> start!114238 (= res!901866 (and (bvslt (size!45185 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45185 a!3742))))))

(assert (=> start!114238 e!770223))

(assert (=> start!114238 true))

(declare-fun array_inv!33866 (array!92369) Bool)

(assert (=> start!114238 (array_inv!33866 a!3742)))

(declare-fun b!1357073 () Bool)

(assert (=> b!1357073 (= e!770223 (not true))))

(declare-fun subseq!810 (List!31752 List!31752) Bool)

(assert (=> b!1357073 (subseq!810 acc!759 acc!759)))

(declare-datatypes ((Unit!44492 0))(
  ( (Unit!44493) )
))
(declare-fun lt!598936 () Unit!44492)

(declare-fun lemmaListSubSeqRefl!0 (List!31752) Unit!44492)

(assert (=> b!1357073 (= lt!598936 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1357074 () Bool)

(declare-fun res!901872 () Bool)

(assert (=> b!1357074 (=> (not res!901872) (not e!770223))))

(declare-fun contains!9372 (List!31752 (_ BitVec 64)) Bool)

(assert (=> b!1357074 (= res!901872 (not (contains!9372 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357075 () Bool)

(declare-fun res!901868 () Bool)

(assert (=> b!1357075 (=> (not res!901868) (not e!770223))))

(declare-fun noDuplicate!2287 (List!31752) Bool)

(assert (=> b!1357075 (= res!901868 (noDuplicate!2287 acc!759))))

(declare-fun b!1357076 () Bool)

(declare-fun res!901865 () Bool)

(assert (=> b!1357076 (=> (not res!901865) (not e!770223))))

(assert (=> b!1357076 (= res!901865 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45185 a!3742)))))

(declare-fun b!1357077 () Bool)

(declare-fun res!901871 () Bool)

(assert (=> b!1357077 (=> (not res!901871) (not e!770223))))

(assert (=> b!1357077 (= res!901871 (not (contains!9372 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114238 res!901866) b!1357075))

(assert (= (and b!1357075 res!901868) b!1357074))

(assert (= (and b!1357074 res!901872) b!1357077))

(assert (= (and b!1357077 res!901871) b!1357071))

(assert (= (and b!1357071 res!901874) b!1357069))

(assert (= (and b!1357069 res!901867) b!1357070))

(assert (= (and b!1357070 res!901870) b!1357072))

(assert (= (and b!1357072 res!901873) b!1357076))

(assert (= (and b!1357076 res!901865) b!1357068))

(assert (= (and b!1357068 res!901869) b!1357073))

(declare-fun m!1242437 () Bool)

(assert (=> b!1357074 m!1242437))

(declare-fun m!1242439 () Bool)

(assert (=> b!1357071 m!1242439))

(declare-fun m!1242441 () Bool)

(assert (=> b!1357075 m!1242441))

(declare-fun m!1242443 () Bool)

(assert (=> b!1357069 m!1242443))

(declare-fun m!1242445 () Bool)

(assert (=> b!1357077 m!1242445))

(declare-fun m!1242447 () Bool)

(assert (=> start!114238 m!1242447))

(declare-fun m!1242449 () Bool)

(assert (=> b!1357068 m!1242449))

(assert (=> b!1357068 m!1242449))

(declare-fun m!1242451 () Bool)

(assert (=> b!1357068 m!1242451))

(declare-fun m!1242453 () Bool)

(assert (=> b!1357073 m!1242453))

(declare-fun m!1242455 () Bool)

(assert (=> b!1357073 m!1242455))

(declare-fun m!1242457 () Bool)

(assert (=> b!1357072 m!1242457))

(push 1)

(assert (not b!1357068))

(assert (not b!1357073))

(assert (not b!1357075))

(assert (not b!1357069))

(assert (not b!1357072))

(assert (not start!114238))

(assert (not b!1357077))

(assert (not b!1357074))

(assert (not b!1357071))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

