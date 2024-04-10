; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114008 () Bool)

(assert start!114008)

(declare-fun b!1352821 () Bool)

(declare-fun e!768932 () Bool)

(assert (=> b!1352821 (= e!768932 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-datatypes ((List!31584 0))(
  ( (Nil!31581) (Cons!31580 (h!32789 (_ BitVec 64)) (t!46242 List!31584)) )
))
(declare-fun acc!759 () List!31584)

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92190 0))(
  ( (array!92191 (arr!44543 (Array (_ BitVec 32) (_ BitVec 64))) (size!45093 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92190)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92190 (_ BitVec 32) List!31584) Bool)

(assert (=> b!1352821 (arrayNoDuplicates!0 (array!92191 (store (arr!44543 a!3742) i!1404 l!3587) (size!45093 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-datatypes ((Unit!44370 0))(
  ( (Unit!44371) )
))
(declare-fun lt!597670 () Unit!44370)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92190 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31584) Unit!44370)

(assert (=> b!1352821 (= lt!597670 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352822 () Bool)

(declare-fun res!898097 () Bool)

(declare-fun e!768933 () Bool)

(assert (=> b!1352822 (=> (not res!898097) (not e!768933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352822 (= res!898097 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352823 () Bool)

(declare-fun res!898105 () Bool)

(assert (=> b!1352823 (=> (not res!898105) (not e!768933))))

(declare-fun contains!9293 (List!31584 (_ BitVec 64)) Bool)

(assert (=> b!1352823 (= res!898105 (not (contains!9293 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352824 () Bool)

(declare-fun e!768934 () Unit!44370)

(declare-fun lt!597669 () Unit!44370)

(assert (=> b!1352824 (= e!768934 lt!597669)))

(declare-fun lt!597667 () Unit!44370)

(declare-fun lemmaListSubSeqRefl!0 (List!31584) Unit!44370)

(assert (=> b!1352824 (= lt!597667 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!713 (List!31584 List!31584) Bool)

(assert (=> b!1352824 (subseq!713 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92190 List!31584 List!31584 (_ BitVec 32)) Unit!44370)

(declare-fun $colon$colon!728 (List!31584 (_ BitVec 64)) List!31584)

(assert (=> b!1352824 (= lt!597669 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!728 acc!759 (select (arr!44543 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352824 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352825 () Bool)

(declare-fun Unit!44372 () Unit!44370)

(assert (=> b!1352825 (= e!768934 Unit!44372)))

(declare-fun b!1352826 () Bool)

(declare-fun res!898100 () Bool)

(assert (=> b!1352826 (=> (not res!898100) (not e!768932))))

(assert (=> b!1352826 (= res!898100 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352828 () Bool)

(declare-fun res!898103 () Bool)

(assert (=> b!1352828 (=> (not res!898103) (not e!768933))))

(assert (=> b!1352828 (= res!898103 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352829 () Bool)

(declare-fun res!898096 () Bool)

(assert (=> b!1352829 (=> (not res!898096) (not e!768933))))

(assert (=> b!1352829 (= res!898096 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45093 a!3742)))))

(declare-fun b!1352830 () Bool)

(assert (=> b!1352830 (= e!768933 e!768932)))

(declare-fun res!898095 () Bool)

(assert (=> b!1352830 (=> (not res!898095) (not e!768932))))

(assert (=> b!1352830 (= res!898095 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597668 () Unit!44370)

(assert (=> b!1352830 (= lt!597668 e!768934)))

(declare-fun c!126803 () Bool)

(assert (=> b!1352830 (= c!126803 (validKeyInArray!0 (select (arr!44543 a!3742) from!3120)))))

(declare-fun b!1352831 () Bool)

(declare-fun res!898102 () Bool)

(assert (=> b!1352831 (=> (not res!898102) (not e!768933))))

(assert (=> b!1352831 (= res!898102 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45093 a!3742))))))

(declare-fun b!1352832 () Bool)

(declare-fun res!898099 () Bool)

(assert (=> b!1352832 (=> (not res!898099) (not e!768933))))

(declare-fun noDuplicate!2150 (List!31584) Bool)

(assert (=> b!1352832 (= res!898099 (noDuplicate!2150 acc!759))))

(declare-fun b!1352833 () Bool)

(declare-fun res!898104 () Bool)

(assert (=> b!1352833 (=> (not res!898104) (not e!768933))))

(assert (=> b!1352833 (= res!898104 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31581))))

(declare-fun b!1352827 () Bool)

(declare-fun res!898101 () Bool)

(assert (=> b!1352827 (=> (not res!898101) (not e!768933))))

(assert (=> b!1352827 (= res!898101 (not (contains!9293 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!898098 () Bool)

(assert (=> start!114008 (=> (not res!898098) (not e!768933))))

(assert (=> start!114008 (= res!898098 (and (bvslt (size!45093 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45093 a!3742))))))

(assert (=> start!114008 e!768933))

(assert (=> start!114008 true))

(declare-fun array_inv!33571 (array!92190) Bool)

(assert (=> start!114008 (array_inv!33571 a!3742)))

(assert (= (and start!114008 res!898098) b!1352832))

(assert (= (and b!1352832 res!898099) b!1352827))

(assert (= (and b!1352827 res!898101) b!1352823))

(assert (= (and b!1352823 res!898105) b!1352833))

(assert (= (and b!1352833 res!898104) b!1352828))

(assert (= (and b!1352828 res!898103) b!1352831))

(assert (= (and b!1352831 res!898102) b!1352822))

(assert (= (and b!1352822 res!898097) b!1352829))

(assert (= (and b!1352829 res!898096) b!1352830))

(assert (= (and b!1352830 c!126803) b!1352824))

(assert (= (and b!1352830 (not c!126803)) b!1352825))

(assert (= (and b!1352830 res!898095) b!1352826))

(assert (= (and b!1352826 res!898100) b!1352821))

(declare-fun m!1239559 () Bool)

(assert (=> b!1352823 m!1239559))

(declare-fun m!1239561 () Bool)

(assert (=> b!1352826 m!1239561))

(declare-fun m!1239563 () Bool)

(assert (=> b!1352833 m!1239563))

(declare-fun m!1239565 () Bool)

(assert (=> b!1352824 m!1239565))

(declare-fun m!1239567 () Bool)

(assert (=> b!1352824 m!1239567))

(declare-fun m!1239569 () Bool)

(assert (=> b!1352824 m!1239569))

(declare-fun m!1239571 () Bool)

(assert (=> b!1352824 m!1239571))

(assert (=> b!1352824 m!1239561))

(assert (=> b!1352824 m!1239567))

(assert (=> b!1352824 m!1239569))

(declare-fun m!1239573 () Bool)

(assert (=> b!1352824 m!1239573))

(declare-fun m!1239575 () Bool)

(assert (=> b!1352822 m!1239575))

(declare-fun m!1239577 () Bool)

(assert (=> b!1352821 m!1239577))

(declare-fun m!1239579 () Bool)

(assert (=> b!1352821 m!1239579))

(declare-fun m!1239581 () Bool)

(assert (=> b!1352821 m!1239581))

(declare-fun m!1239583 () Bool)

(assert (=> b!1352827 m!1239583))

(assert (=> b!1352830 m!1239567))

(assert (=> b!1352830 m!1239567))

(declare-fun m!1239585 () Bool)

(assert (=> b!1352830 m!1239585))

(declare-fun m!1239587 () Bool)

(assert (=> start!114008 m!1239587))

(declare-fun m!1239589 () Bool)

(assert (=> b!1352832 m!1239589))

(declare-fun m!1239591 () Bool)

(assert (=> b!1352828 m!1239591))

(push 1)

