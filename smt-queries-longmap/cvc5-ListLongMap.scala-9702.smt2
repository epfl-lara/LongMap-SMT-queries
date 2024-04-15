; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114666 () Bool)

(assert start!114666)

(declare-fun b!1360163 () Bool)

(declare-fun res!904536 () Bool)

(declare-fun e!771724 () Bool)

(assert (=> b!1360163 (=> (not res!904536) (not e!771724))))

(declare-datatypes ((List!31810 0))(
  ( (Nil!31807) (Cons!31806 (h!33015 (_ BitVec 64)) (t!46478 List!31810)) )
))
(declare-fun acc!759 () List!31810)

(declare-fun contains!9430 (List!31810 (_ BitVec 64)) Bool)

(assert (=> b!1360163 (= res!904536 (not (contains!9430 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360164 () Bool)

(declare-fun res!904538 () Bool)

(assert (=> b!1360164 (=> (not res!904538) (not e!771724))))

(declare-fun noDuplicate!2345 (List!31810) Bool)

(assert (=> b!1360164 (= res!904538 (noDuplicate!2345 acc!759))))

(declare-fun res!904540 () Bool)

(assert (=> start!114666 (=> (not res!904540) (not e!771724))))

(declare-datatypes ((array!92503 0))(
  ( (array!92504 (arr!44691 (Array (_ BitVec 32) (_ BitVec 64))) (size!45243 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92503)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114666 (= res!904540 (and (bvslt (size!45243 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45243 a!3742))))))

(assert (=> start!114666 e!771724))

(assert (=> start!114666 true))

(declare-fun array_inv!33924 (array!92503) Bool)

(assert (=> start!114666 (array_inv!33924 a!3742)))

(declare-fun b!1360165 () Bool)

(declare-fun res!904542 () Bool)

(assert (=> b!1360165 (=> (not res!904542) (not e!771724))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360165 (= res!904542 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45243 a!3742))))))

(declare-fun b!1360166 () Bool)

(declare-fun res!904543 () Bool)

(assert (=> b!1360166 (=> (not res!904543) (not e!771724))))

(assert (=> b!1360166 (= res!904543 (not (contains!9430 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360167 () Bool)

(assert (=> b!1360167 (= e!771724 false)))

(declare-datatypes ((Unit!44649 0))(
  ( (Unit!44650) )
))
(declare-fun lt!599641 () Unit!44649)

(declare-fun e!771723 () Unit!44649)

(assert (=> b!1360167 (= lt!599641 e!771723)))

(declare-fun c!127256 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360167 (= c!127256 (validKeyInArray!0 (select (arr!44691 a!3742) from!3120)))))

(declare-fun b!1360168 () Bool)

(declare-fun res!904537 () Bool)

(assert (=> b!1360168 (=> (not res!904537) (not e!771724))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1360168 (= res!904537 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360169 () Bool)

(declare-fun res!904541 () Bool)

(assert (=> b!1360169 (=> (not res!904541) (not e!771724))))

(declare-fun arrayNoDuplicates!0 (array!92503 (_ BitVec 32) List!31810) Bool)

(assert (=> b!1360169 (= res!904541 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31807))))

(declare-fun b!1360170 () Bool)

(declare-fun res!904544 () Bool)

(assert (=> b!1360170 (=> (not res!904544) (not e!771724))))

(assert (=> b!1360170 (= res!904544 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360171 () Bool)

(declare-fun lt!599639 () Unit!44649)

(assert (=> b!1360171 (= e!771723 lt!599639)))

(declare-fun lt!599640 () Unit!44649)

(declare-fun lemmaListSubSeqRefl!0 (List!31810) Unit!44649)

(assert (=> b!1360171 (= lt!599640 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!868 (List!31810 List!31810) Bool)

(assert (=> b!1360171 (subseq!868 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92503 List!31810 List!31810 (_ BitVec 32)) Unit!44649)

(declare-fun $colon$colon!873 (List!31810 (_ BitVec 64)) List!31810)

(assert (=> b!1360171 (= lt!599639 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!873 acc!759 (select (arr!44691 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1360171 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360172 () Bool)

(declare-fun res!904539 () Bool)

(assert (=> b!1360172 (=> (not res!904539) (not e!771724))))

(assert (=> b!1360172 (= res!904539 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45243 a!3742)))))

(declare-fun b!1360173 () Bool)

(declare-fun Unit!44651 () Unit!44649)

(assert (=> b!1360173 (= e!771723 Unit!44651)))

(assert (= (and start!114666 res!904540) b!1360164))

(assert (= (and b!1360164 res!904538) b!1360163))

(assert (= (and b!1360163 res!904536) b!1360166))

(assert (= (and b!1360166 res!904543) b!1360169))

(assert (= (and b!1360169 res!904541) b!1360170))

(assert (= (and b!1360170 res!904544) b!1360165))

(assert (= (and b!1360165 res!904542) b!1360168))

(assert (= (and b!1360168 res!904537) b!1360172))

(assert (= (and b!1360172 res!904539) b!1360167))

(assert (= (and b!1360167 c!127256) b!1360171))

(assert (= (and b!1360167 (not c!127256)) b!1360173))

(declare-fun m!1245021 () Bool)

(assert (=> start!114666 m!1245021))

(declare-fun m!1245023 () Bool)

(assert (=> b!1360164 m!1245023))

(declare-fun m!1245025 () Bool)

(assert (=> b!1360170 m!1245025))

(declare-fun m!1245027 () Bool)

(assert (=> b!1360166 m!1245027))

(declare-fun m!1245029 () Bool)

(assert (=> b!1360171 m!1245029))

(declare-fun m!1245031 () Bool)

(assert (=> b!1360171 m!1245031))

(declare-fun m!1245033 () Bool)

(assert (=> b!1360171 m!1245033))

(declare-fun m!1245035 () Bool)

(assert (=> b!1360171 m!1245035))

(declare-fun m!1245037 () Bool)

(assert (=> b!1360171 m!1245037))

(assert (=> b!1360171 m!1245031))

(assert (=> b!1360171 m!1245033))

(declare-fun m!1245039 () Bool)

(assert (=> b!1360171 m!1245039))

(assert (=> b!1360167 m!1245031))

(assert (=> b!1360167 m!1245031))

(declare-fun m!1245041 () Bool)

(assert (=> b!1360167 m!1245041))

(declare-fun m!1245043 () Bool)

(assert (=> b!1360169 m!1245043))

(declare-fun m!1245045 () Bool)

(assert (=> b!1360163 m!1245045))

(declare-fun m!1245047 () Bool)

(assert (=> b!1360168 m!1245047))

(push 1)

(assert (not b!1360169))

(assert (not b!1360164))

(assert (not b!1360171))

(assert (not b!1360168))

(assert (not b!1360163))

(assert (not start!114666))

(assert (not b!1360170))

(assert (not b!1360167))

(assert (not b!1360166))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

