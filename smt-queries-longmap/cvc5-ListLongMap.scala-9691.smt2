; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114482 () Bool)

(assert start!114482)

(declare-fun b!1358653 () Bool)

(declare-fun res!903266 () Bool)

(declare-fun e!771077 () Bool)

(assert (=> b!1358653 (=> (not res!903266) (not e!771077))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92478 0))(
  ( (array!92479 (arr!44681 (Array (_ BitVec 32) (_ BitVec 64))) (size!45231 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92478)

(assert (=> b!1358653 (= res!903266 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45231 a!3742))))))

(declare-fun b!1358654 () Bool)

(declare-fun res!903268 () Bool)

(assert (=> b!1358654 (=> (not res!903268) (not e!771077))))

(declare-datatypes ((List!31722 0))(
  ( (Nil!31719) (Cons!31718 (h!32927 (_ BitVec 64)) (t!46392 List!31722)) )
))
(declare-fun acc!759 () List!31722)

(declare-fun contains!9431 (List!31722 (_ BitVec 64)) Bool)

(assert (=> b!1358654 (= res!903268 (not (contains!9431 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358655 () Bool)

(declare-fun res!903271 () Bool)

(assert (=> b!1358655 (=> (not res!903271) (not e!771077))))

(declare-fun arrayNoDuplicates!0 (array!92478 (_ BitVec 32) List!31722) Bool)

(assert (=> b!1358655 (= res!903271 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31719))))

(declare-fun b!1358656 () Bool)

(declare-datatypes ((Unit!44703 0))(
  ( (Unit!44704) )
))
(declare-fun e!771078 () Unit!44703)

(declare-fun lt!599398 () Unit!44703)

(assert (=> b!1358656 (= e!771078 lt!599398)))

(declare-fun lt!599397 () Unit!44703)

(declare-fun lemmaListSubSeqRefl!0 (List!31722) Unit!44703)

(assert (=> b!1358656 (= lt!599397 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!833 (List!31722 List!31722) Bool)

(assert (=> b!1358656 (subseq!833 acc!759 acc!759)))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92478 List!31722 List!31722 (_ BitVec 32)) Unit!44703)

(declare-fun $colon$colon!836 (List!31722 (_ BitVec 64)) List!31722)

(assert (=> b!1358656 (= lt!599398 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!836 acc!759 (select (arr!44681 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1358656 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1358657 () Bool)

(declare-fun res!903270 () Bool)

(assert (=> b!1358657 (=> (not res!903270) (not e!771077))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358657 (= res!903270 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358658 () Bool)

(declare-fun res!903273 () Bool)

(assert (=> b!1358658 (=> (not res!903273) (not e!771077))))

(assert (=> b!1358658 (= res!903273 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358659 () Bool)

(declare-fun res!903272 () Bool)

(assert (=> b!1358659 (=> (not res!903272) (not e!771077))))

(declare-fun noDuplicate!2288 (List!31722) Bool)

(assert (=> b!1358659 (= res!903272 (noDuplicate!2288 acc!759))))

(declare-fun b!1358660 () Bool)

(declare-fun res!903269 () Bool)

(assert (=> b!1358660 (=> (not res!903269) (not e!771077))))

(assert (=> b!1358660 (= res!903269 (not (contains!9431 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358661 () Bool)

(declare-fun Unit!44705 () Unit!44703)

(assert (=> b!1358661 (= e!771078 Unit!44705)))

(declare-fun b!1358662 () Bool)

(assert (=> b!1358662 (= e!771077 false)))

(declare-fun lt!599396 () Unit!44703)

(assert (=> b!1358662 (= lt!599396 e!771078)))

(declare-fun c!127133 () Bool)

(assert (=> b!1358662 (= c!127133 (validKeyInArray!0 (select (arr!44681 a!3742) from!3120)))))

(declare-fun b!1358652 () Bool)

(declare-fun res!903267 () Bool)

(assert (=> b!1358652 (=> (not res!903267) (not e!771077))))

(assert (=> b!1358652 (= res!903267 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45231 a!3742)))))

(declare-fun res!903274 () Bool)

(assert (=> start!114482 (=> (not res!903274) (not e!771077))))

(assert (=> start!114482 (= res!903274 (and (bvslt (size!45231 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45231 a!3742))))))

(assert (=> start!114482 e!771077))

(assert (=> start!114482 true))

(declare-fun array_inv!33709 (array!92478) Bool)

(assert (=> start!114482 (array_inv!33709 a!3742)))

(assert (= (and start!114482 res!903274) b!1358659))

(assert (= (and b!1358659 res!903272) b!1358654))

(assert (= (and b!1358654 res!903268) b!1358660))

(assert (= (and b!1358660 res!903269) b!1358655))

(assert (= (and b!1358655 res!903271) b!1358658))

(assert (= (and b!1358658 res!903273) b!1358653))

(assert (= (and b!1358653 res!903266) b!1358657))

(assert (= (and b!1358657 res!903270) b!1358652))

(assert (= (and b!1358652 res!903267) b!1358662))

(assert (= (and b!1358662 c!127133) b!1358656))

(assert (= (and b!1358662 (not c!127133)) b!1358661))

(declare-fun m!1244203 () Bool)

(assert (=> b!1358659 m!1244203))

(declare-fun m!1244205 () Bool)

(assert (=> b!1358655 m!1244205))

(declare-fun m!1244207 () Bool)

(assert (=> b!1358660 m!1244207))

(declare-fun m!1244209 () Bool)

(assert (=> b!1358656 m!1244209))

(declare-fun m!1244211 () Bool)

(assert (=> b!1358656 m!1244211))

(declare-fun m!1244213 () Bool)

(assert (=> b!1358656 m!1244213))

(declare-fun m!1244215 () Bool)

(assert (=> b!1358656 m!1244215))

(declare-fun m!1244217 () Bool)

(assert (=> b!1358656 m!1244217))

(assert (=> b!1358656 m!1244211))

(assert (=> b!1358656 m!1244213))

(declare-fun m!1244219 () Bool)

(assert (=> b!1358656 m!1244219))

(assert (=> b!1358662 m!1244211))

(assert (=> b!1358662 m!1244211))

(declare-fun m!1244221 () Bool)

(assert (=> b!1358662 m!1244221))

(declare-fun m!1244223 () Bool)

(assert (=> b!1358657 m!1244223))

(declare-fun m!1244225 () Bool)

(assert (=> start!114482 m!1244225))

(declare-fun m!1244227 () Bool)

(assert (=> b!1358658 m!1244227))

(declare-fun m!1244229 () Bool)

(assert (=> b!1358654 m!1244229))

(push 1)

(assert (not b!1358658))

(assert (not b!1358662))

(assert (not b!1358655))

(assert (not b!1358654))

(assert (not start!114482))

(assert (not b!1358656))

(assert (not b!1358657))

(assert (not b!1358659))

(assert (not b!1358660))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

