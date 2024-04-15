; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114486 () Bool)

(assert start!114486)

(declare-fun b!1358648 () Bool)

(declare-fun res!903291 () Bool)

(declare-fun e!771062 () Bool)

(assert (=> b!1358648 (=> (not res!903291) (not e!771062))))

(declare-datatypes ((List!31777 0))(
  ( (Nil!31774) (Cons!31773 (h!32982 (_ BitVec 64)) (t!46439 List!31777)) )
))
(declare-fun acc!759 () List!31777)

(declare-datatypes ((array!92431 0))(
  ( (array!92432 (arr!44658 (Array (_ BitVec 32) (_ BitVec 64))) (size!45210 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92431)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92431 (_ BitVec 32) List!31777) Bool)

(assert (=> b!1358648 (= res!903291 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358649 () Bool)

(declare-fun res!903294 () Bool)

(assert (=> b!1358649 (=> (not res!903294) (not e!771062))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358649 (= res!903294 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358650 () Bool)

(declare-fun res!903296 () Bool)

(assert (=> b!1358650 (=> (not res!903296) (not e!771062))))

(declare-fun noDuplicate!2312 (List!31777) Bool)

(assert (=> b!1358650 (= res!903296 (noDuplicate!2312 acc!759))))

(declare-fun res!903297 () Bool)

(assert (=> start!114486 (=> (not res!903297) (not e!771062))))

(assert (=> start!114486 (= res!903297 (and (bvslt (size!45210 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45210 a!3742))))))

(assert (=> start!114486 e!771062))

(assert (=> start!114486 true))

(declare-fun array_inv!33891 (array!92431) Bool)

(assert (=> start!114486 (array_inv!33891 a!3742)))

(declare-fun b!1358651 () Bool)

(assert (=> b!1358651 (= e!771062 false)))

(declare-datatypes ((Unit!44550 0))(
  ( (Unit!44551) )
))
(declare-fun lt!599228 () Unit!44550)

(declare-fun e!771063 () Unit!44550)

(assert (=> b!1358651 (= lt!599228 e!771063)))

(declare-fun c!127121 () Bool)

(assert (=> b!1358651 (= c!127121 (validKeyInArray!0 (select (arr!44658 a!3742) from!3120)))))

(declare-fun b!1358652 () Bool)

(declare-fun res!903299 () Bool)

(assert (=> b!1358652 (=> (not res!903299) (not e!771062))))

(declare-fun contains!9397 (List!31777 (_ BitVec 64)) Bool)

(assert (=> b!1358652 (= res!903299 (not (contains!9397 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358653 () Bool)

(declare-fun res!903295 () Bool)

(assert (=> b!1358653 (=> (not res!903295) (not e!771062))))

(assert (=> b!1358653 (= res!903295 (not (contains!9397 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358654 () Bool)

(declare-fun res!903298 () Bool)

(assert (=> b!1358654 (=> (not res!903298) (not e!771062))))

(assert (=> b!1358654 (= res!903298 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31774))))

(declare-fun b!1358655 () Bool)

(declare-fun lt!599229 () Unit!44550)

(assert (=> b!1358655 (= e!771063 lt!599229)))

(declare-fun lt!599230 () Unit!44550)

(declare-fun lemmaListSubSeqRefl!0 (List!31777) Unit!44550)

(assert (=> b!1358655 (= lt!599230 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!835 (List!31777 List!31777) Bool)

(assert (=> b!1358655 (subseq!835 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92431 List!31777 List!31777 (_ BitVec 32)) Unit!44550)

(declare-fun $colon$colon!840 (List!31777 (_ BitVec 64)) List!31777)

(assert (=> b!1358655 (= lt!599229 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!840 acc!759 (select (arr!44658 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1358655 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1358656 () Bool)

(declare-fun res!903292 () Bool)

(assert (=> b!1358656 (=> (not res!903292) (not e!771062))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358656 (= res!903292 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45210 a!3742))))))

(declare-fun b!1358657 () Bool)

(declare-fun Unit!44552 () Unit!44550)

(assert (=> b!1358657 (= e!771063 Unit!44552)))

(declare-fun b!1358658 () Bool)

(declare-fun res!903293 () Bool)

(assert (=> b!1358658 (=> (not res!903293) (not e!771062))))

(assert (=> b!1358658 (= res!903293 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45210 a!3742)))))

(assert (= (and start!114486 res!903297) b!1358650))

(assert (= (and b!1358650 res!903296) b!1358653))

(assert (= (and b!1358653 res!903295) b!1358652))

(assert (= (and b!1358652 res!903299) b!1358654))

(assert (= (and b!1358654 res!903298) b!1358648))

(assert (= (and b!1358648 res!903291) b!1358656))

(assert (= (and b!1358656 res!903292) b!1358649))

(assert (= (and b!1358649 res!903294) b!1358658))

(assert (= (and b!1358658 res!903293) b!1358651))

(assert (= (and b!1358651 c!127121) b!1358655))

(assert (= (and b!1358651 (not c!127121)) b!1358657))

(declare-fun m!1243743 () Bool)

(assert (=> b!1358652 m!1243743))

(declare-fun m!1243745 () Bool)

(assert (=> b!1358654 m!1243745))

(declare-fun m!1243747 () Bool)

(assert (=> b!1358648 m!1243747))

(declare-fun m!1243749 () Bool)

(assert (=> b!1358651 m!1243749))

(assert (=> b!1358651 m!1243749))

(declare-fun m!1243751 () Bool)

(assert (=> b!1358651 m!1243751))

(declare-fun m!1243753 () Bool)

(assert (=> b!1358650 m!1243753))

(declare-fun m!1243755 () Bool)

(assert (=> b!1358653 m!1243755))

(declare-fun m!1243757 () Bool)

(assert (=> start!114486 m!1243757))

(declare-fun m!1243759 () Bool)

(assert (=> b!1358655 m!1243759))

(assert (=> b!1358655 m!1243749))

(declare-fun m!1243761 () Bool)

(assert (=> b!1358655 m!1243761))

(declare-fun m!1243763 () Bool)

(assert (=> b!1358655 m!1243763))

(declare-fun m!1243765 () Bool)

(assert (=> b!1358655 m!1243765))

(assert (=> b!1358655 m!1243749))

(assert (=> b!1358655 m!1243761))

(declare-fun m!1243767 () Bool)

(assert (=> b!1358655 m!1243767))

(declare-fun m!1243769 () Bool)

(assert (=> b!1358649 m!1243769))

(push 1)

(assert (not b!1358651))

(assert (not b!1358648))

(assert (not b!1358655))

(assert (not b!1358650))

(assert (not b!1358652))

(assert (not b!1358653))

(assert (not start!114486))

(assert (not b!1358654))

(assert (not b!1358649))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

