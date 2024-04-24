; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114908 () Bool)

(assert start!114908)

(declare-fun b!1361829 () Bool)

(declare-fun res!905329 () Bool)

(declare-fun e!772681 () Bool)

(assert (=> b!1361829 (=> (not res!905329) (not e!772681))))

(declare-datatypes ((array!92687 0))(
  ( (array!92688 (arr!44778 (Array (_ BitVec 32) (_ BitVec 64))) (size!45329 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92687)

(declare-datatypes ((List!31806 0))(
  ( (Nil!31803) (Cons!31802 (h!33020 (_ BitVec 64)) (t!46474 List!31806)) )
))
(declare-fun arrayNoDuplicates!0 (array!92687 (_ BitVec 32) List!31806) Bool)

(assert (=> b!1361829 (= res!905329 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31803))))

(declare-fun b!1361830 () Bool)

(declare-fun res!905333 () Bool)

(assert (=> b!1361830 (=> (not res!905333) (not e!772681))))

(declare-fun acc!759 () List!31806)

(declare-fun noDuplicate!2349 (List!31806) Bool)

(assert (=> b!1361830 (= res!905333 (noDuplicate!2349 acc!759))))

(declare-fun b!1361831 () Bool)

(declare-fun res!905330 () Bool)

(assert (=> b!1361831 (=> (not res!905330) (not e!772681))))

(declare-fun contains!9518 (List!31806 (_ BitVec 64)) Bool)

(assert (=> b!1361831 (= res!905330 (not (contains!9518 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361832 () Bool)

(declare-datatypes ((Unit!44774 0))(
  ( (Unit!44775) )
))
(declare-fun e!772680 () Unit!44774)

(declare-fun Unit!44776 () Unit!44774)

(assert (=> b!1361832 (= e!772680 Unit!44776)))

(declare-fun b!1361833 () Bool)

(declare-fun res!905334 () Bool)

(assert (=> b!1361833 (=> (not res!905334) (not e!772681))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1361833 (= res!905334 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!905328 () Bool)

(assert (=> start!114908 (=> (not res!905328) (not e!772681))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114908 (= res!905328 (and (bvslt (size!45329 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45329 a!3742))))))

(assert (=> start!114908 e!772681))

(assert (=> start!114908 true))

(declare-fun array_inv!34059 (array!92687) Bool)

(assert (=> start!114908 (array_inv!34059 a!3742)))

(declare-fun b!1361834 () Bool)

(declare-fun res!905327 () Bool)

(assert (=> b!1361834 (=> (not res!905327) (not e!772681))))

(assert (=> b!1361834 (= res!905327 (not (contains!9518 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361835 () Bool)

(declare-fun res!905331 () Bool)

(assert (=> b!1361835 (=> (not res!905331) (not e!772681))))

(assert (=> b!1361835 (= res!905331 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1361836 () Bool)

(declare-fun res!905332 () Bool)

(assert (=> b!1361836 (=> (not res!905332) (not e!772681))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1361836 (= res!905332 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45329 a!3742))))))

(declare-fun b!1361837 () Bool)

(declare-fun res!905326 () Bool)

(assert (=> b!1361837 (=> (not res!905326) (not e!772681))))

(assert (=> b!1361837 (= res!905326 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45329 a!3742)))))

(declare-fun b!1361838 () Bool)

(declare-fun lt!600391 () Unit!44774)

(assert (=> b!1361838 (= e!772680 lt!600391)))

(declare-fun lt!600393 () Unit!44774)

(declare-fun lemmaListSubSeqRefl!0 (List!31806) Unit!44774)

(assert (=> b!1361838 (= lt!600393 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!877 (List!31806 List!31806) Bool)

(assert (=> b!1361838 (subseq!877 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92687 List!31806 List!31806 (_ BitVec 32)) Unit!44774)

(declare-fun $colon$colon!879 (List!31806 (_ BitVec 64)) List!31806)

(assert (=> b!1361838 (= lt!600391 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!879 acc!759 (select (arr!44778 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1361838 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1361839 () Bool)

(assert (=> b!1361839 (= e!772681 false)))

(declare-fun lt!600392 () Unit!44774)

(assert (=> b!1361839 (= lt!600392 e!772680)))

(declare-fun c!127699 () Bool)

(assert (=> b!1361839 (= c!127699 (validKeyInArray!0 (select (arr!44778 a!3742) from!3120)))))

(assert (= (and start!114908 res!905328) b!1361830))

(assert (= (and b!1361830 res!905333) b!1361834))

(assert (= (and b!1361834 res!905327) b!1361831))

(assert (= (and b!1361831 res!905330) b!1361829))

(assert (= (and b!1361829 res!905329) b!1361835))

(assert (= (and b!1361835 res!905331) b!1361836))

(assert (= (and b!1361836 res!905332) b!1361833))

(assert (= (and b!1361833 res!905334) b!1361837))

(assert (= (and b!1361837 res!905326) b!1361839))

(assert (= (and b!1361839 c!127699) b!1361838))

(assert (= (and b!1361839 (not c!127699)) b!1361832))

(declare-fun m!1247385 () Bool)

(assert (=> b!1361833 m!1247385))

(declare-fun m!1247387 () Bool)

(assert (=> b!1361834 m!1247387))

(declare-fun m!1247389 () Bool)

(assert (=> start!114908 m!1247389))

(declare-fun m!1247391 () Bool)

(assert (=> b!1361831 m!1247391))

(declare-fun m!1247393 () Bool)

(assert (=> b!1361838 m!1247393))

(declare-fun m!1247395 () Bool)

(assert (=> b!1361838 m!1247395))

(declare-fun m!1247397 () Bool)

(assert (=> b!1361838 m!1247397))

(declare-fun m!1247399 () Bool)

(assert (=> b!1361838 m!1247399))

(declare-fun m!1247401 () Bool)

(assert (=> b!1361838 m!1247401))

(assert (=> b!1361838 m!1247395))

(assert (=> b!1361838 m!1247397))

(declare-fun m!1247403 () Bool)

(assert (=> b!1361838 m!1247403))

(declare-fun m!1247405 () Bool)

(assert (=> b!1361829 m!1247405))

(assert (=> b!1361839 m!1247395))

(assert (=> b!1361839 m!1247395))

(declare-fun m!1247407 () Bool)

(assert (=> b!1361839 m!1247407))

(declare-fun m!1247409 () Bool)

(assert (=> b!1361835 m!1247409))

(declare-fun m!1247411 () Bool)

(assert (=> b!1361830 m!1247411))

(push 1)

(assert (not b!1361839))

(assert (not b!1361835))

(assert (not b!1361833))

(assert (not start!114908))

(assert (not b!1361830))

(assert (not b!1361838))

(assert (not b!1361831))

(assert (not b!1361829))

(assert (not b!1361834))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

