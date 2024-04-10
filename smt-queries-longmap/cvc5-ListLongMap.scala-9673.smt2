; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114176 () Bool)

(assert start!114176)

(declare-fun b!1356403 () Bool)

(declare-fun res!901177 () Bool)

(declare-fun e!770056 () Bool)

(assert (=> b!1356403 (=> (not res!901177) (not e!770056))))

(declare-datatypes ((array!92358 0))(
  ( (array!92359 (arr!44627 (Array (_ BitVec 32) (_ BitVec 64))) (size!45177 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92358)

(declare-datatypes ((List!31668 0))(
  ( (Nil!31665) (Cons!31664 (h!32873 (_ BitVec 64)) (t!46326 List!31668)) )
))
(declare-fun arrayNoDuplicates!0 (array!92358 (_ BitVec 32) List!31668) Bool)

(assert (=> b!1356403 (= res!901177 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31665))))

(declare-fun b!1356404 () Bool)

(declare-fun res!901173 () Bool)

(assert (=> b!1356404 (=> (not res!901173) (not e!770056))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1356404 (= res!901173 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45177 a!3742))))))

(declare-fun b!1356405 () Bool)

(declare-fun res!901180 () Bool)

(declare-fun e!770058 () Bool)

(assert (=> b!1356405 (=> (not res!901180) (not e!770058))))

(declare-fun acc!759 () List!31668)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1356405 (= res!901180 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356406 () Bool)

(assert (=> b!1356406 (= e!770058 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1356406 (arrayNoDuplicates!0 (array!92359 (store (arr!44627 a!3742) i!1404 l!3587) (size!45177 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-datatypes ((Unit!44622 0))(
  ( (Unit!44623) )
))
(declare-fun lt!599023 () Unit!44622)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92358 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31668) Unit!44622)

(assert (=> b!1356406 (= lt!599023 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun res!901178 () Bool)

(assert (=> start!114176 (=> (not res!901178) (not e!770056))))

(assert (=> start!114176 (= res!901178 (and (bvslt (size!45177 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45177 a!3742))))))

(assert (=> start!114176 e!770056))

(assert (=> start!114176 true))

(declare-fun array_inv!33655 (array!92358) Bool)

(assert (=> start!114176 (array_inv!33655 a!3742)))

(declare-fun b!1356407 () Bool)

(declare-fun res!901174 () Bool)

(assert (=> b!1356407 (=> (not res!901174) (not e!770056))))

(declare-fun contains!9377 (List!31668 (_ BitVec 64)) Bool)

(assert (=> b!1356407 (= res!901174 (not (contains!9377 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356408 () Bool)

(declare-fun res!901183 () Bool)

(assert (=> b!1356408 (=> (not res!901183) (not e!770056))))

(assert (=> b!1356408 (= res!901183 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356409 () Bool)

(declare-fun res!901179 () Bool)

(assert (=> b!1356409 (=> (not res!901179) (not e!770056))))

(assert (=> b!1356409 (= res!901179 (not (contains!9377 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356410 () Bool)

(declare-fun res!901175 () Bool)

(assert (=> b!1356410 (=> (not res!901175) (not e!770056))))

(assert (=> b!1356410 (= res!901175 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45177 a!3742)))))

(declare-fun b!1356411 () Bool)

(assert (=> b!1356411 (= e!770056 e!770058)))

(declare-fun res!901181 () Bool)

(assert (=> b!1356411 (=> (not res!901181) (not e!770058))))

(declare-fun lt!599022 () Bool)

(assert (=> b!1356411 (= res!901181 (and (not (= from!3120 i!1404)) (not lt!599022) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599021 () Unit!44622)

(declare-fun e!770057 () Unit!44622)

(assert (=> b!1356411 (= lt!599021 e!770057)))

(declare-fun c!127055 () Bool)

(assert (=> b!1356411 (= c!127055 lt!599022)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356411 (= lt!599022 (validKeyInArray!0 (select (arr!44627 a!3742) from!3120)))))

(declare-fun b!1356412 () Bool)

(declare-fun res!901182 () Bool)

(assert (=> b!1356412 (=> (not res!901182) (not e!770056))))

(declare-fun noDuplicate!2234 (List!31668) Bool)

(assert (=> b!1356412 (= res!901182 (noDuplicate!2234 acc!759))))

(declare-fun b!1356413 () Bool)

(declare-fun lt!599019 () Unit!44622)

(assert (=> b!1356413 (= e!770057 lt!599019)))

(declare-fun lt!599020 () Unit!44622)

(declare-fun lemmaListSubSeqRefl!0 (List!31668) Unit!44622)

(assert (=> b!1356413 (= lt!599020 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!797 (List!31668 List!31668) Bool)

(assert (=> b!1356413 (subseq!797 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92358 List!31668 List!31668 (_ BitVec 32)) Unit!44622)

(declare-fun $colon$colon!812 (List!31668 (_ BitVec 64)) List!31668)

(assert (=> b!1356413 (= lt!599019 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!812 acc!759 (select (arr!44627 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1356413 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1356414 () Bool)

(declare-fun Unit!44624 () Unit!44622)

(assert (=> b!1356414 (= e!770057 Unit!44624)))

(declare-fun b!1356415 () Bool)

(declare-fun res!901176 () Bool)

(assert (=> b!1356415 (=> (not res!901176) (not e!770056))))

(assert (=> b!1356415 (= res!901176 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!114176 res!901178) b!1356412))

(assert (= (and b!1356412 res!901182) b!1356407))

(assert (= (and b!1356407 res!901174) b!1356409))

(assert (= (and b!1356409 res!901179) b!1356403))

(assert (= (and b!1356403 res!901177) b!1356408))

(assert (= (and b!1356408 res!901183) b!1356404))

(assert (= (and b!1356404 res!901173) b!1356415))

(assert (= (and b!1356415 res!901176) b!1356410))

(assert (= (and b!1356410 res!901175) b!1356411))

(assert (= (and b!1356411 c!127055) b!1356413))

(assert (= (and b!1356411 (not c!127055)) b!1356414))

(assert (= (and b!1356411 res!901181) b!1356405))

(assert (= (and b!1356405 res!901180) b!1356406))

(declare-fun m!1242403 () Bool)

(assert (=> b!1356408 m!1242403))

(declare-fun m!1242405 () Bool)

(assert (=> b!1356409 m!1242405))

(declare-fun m!1242407 () Bool)

(assert (=> b!1356403 m!1242407))

(declare-fun m!1242409 () Bool)

(assert (=> b!1356412 m!1242409))

(declare-fun m!1242411 () Bool)

(assert (=> b!1356406 m!1242411))

(declare-fun m!1242413 () Bool)

(assert (=> b!1356406 m!1242413))

(declare-fun m!1242415 () Bool)

(assert (=> b!1356406 m!1242415))

(declare-fun m!1242417 () Bool)

(assert (=> b!1356413 m!1242417))

(declare-fun m!1242419 () Bool)

(assert (=> b!1356413 m!1242419))

(declare-fun m!1242421 () Bool)

(assert (=> b!1356413 m!1242421))

(declare-fun m!1242423 () Bool)

(assert (=> b!1356413 m!1242423))

(declare-fun m!1242425 () Bool)

(assert (=> b!1356413 m!1242425))

(assert (=> b!1356413 m!1242419))

(assert (=> b!1356413 m!1242421))

(declare-fun m!1242427 () Bool)

(assert (=> b!1356413 m!1242427))

(declare-fun m!1242429 () Bool)

(assert (=> b!1356407 m!1242429))

(declare-fun m!1242431 () Bool)

(assert (=> start!114176 m!1242431))

(declare-fun m!1242433 () Bool)

(assert (=> b!1356415 m!1242433))

(assert (=> b!1356411 m!1242419))

(assert (=> b!1356411 m!1242419))

(declare-fun m!1242435 () Bool)

(assert (=> b!1356411 m!1242435))

(assert (=> b!1356405 m!1242425))

(push 1)

