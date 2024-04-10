; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114174 () Bool)

(assert start!114174)

(declare-fun b!1356364 () Bool)

(declare-fun e!770044 () Bool)

(assert (=> b!1356364 (= e!770044 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-datatypes ((List!31667 0))(
  ( (Nil!31664) (Cons!31663 (h!32872 (_ BitVec 64)) (t!46325 List!31667)) )
))
(declare-fun acc!759 () List!31667)

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92356 0))(
  ( (array!92357 (arr!44626 (Array (_ BitVec 32) (_ BitVec 64))) (size!45176 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92356)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92356 (_ BitVec 32) List!31667) Bool)

(assert (=> b!1356364 (arrayNoDuplicates!0 (array!92357 (store (arr!44626 a!3742) i!1404 l!3587) (size!45176 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-datatypes ((Unit!44619 0))(
  ( (Unit!44620) )
))
(declare-fun lt!599005 () Unit!44619)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92356 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31667) Unit!44619)

(assert (=> b!1356364 (= lt!599005 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356365 () Bool)

(declare-fun e!770045 () Unit!44619)

(declare-fun Unit!44621 () Unit!44619)

(assert (=> b!1356365 (= e!770045 Unit!44621)))

(declare-fun b!1356366 () Bool)

(declare-fun lt!599004 () Unit!44619)

(assert (=> b!1356366 (= e!770045 lt!599004)))

(declare-fun lt!599008 () Unit!44619)

(declare-fun lemmaListSubSeqRefl!0 (List!31667) Unit!44619)

(assert (=> b!1356366 (= lt!599008 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!796 (List!31667 List!31667) Bool)

(assert (=> b!1356366 (subseq!796 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92356 List!31667 List!31667 (_ BitVec 32)) Unit!44619)

(declare-fun $colon$colon!811 (List!31667 (_ BitVec 64)) List!31667)

(assert (=> b!1356366 (= lt!599004 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!811 acc!759 (select (arr!44626 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1356366 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1356367 () Bool)

(declare-fun res!901145 () Bool)

(declare-fun e!770046 () Bool)

(assert (=> b!1356367 (=> (not res!901145) (not e!770046))))

(assert (=> b!1356367 (= res!901145 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45176 a!3742))))))

(declare-fun b!1356368 () Bool)

(declare-fun res!901149 () Bool)

(assert (=> b!1356368 (=> (not res!901149) (not e!770046))))

(declare-fun noDuplicate!2233 (List!31667) Bool)

(assert (=> b!1356368 (= res!901149 (noDuplicate!2233 acc!759))))

(declare-fun b!1356369 () Bool)

(declare-fun res!901144 () Bool)

(assert (=> b!1356369 (=> (not res!901144) (not e!770046))))

(assert (=> b!1356369 (= res!901144 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45176 a!3742)))))

(declare-fun b!1356370 () Bool)

(declare-fun res!901140 () Bool)

(assert (=> b!1356370 (=> (not res!901140) (not e!770044))))

(assert (=> b!1356370 (= res!901140 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356371 () Bool)

(declare-fun res!901142 () Bool)

(assert (=> b!1356371 (=> (not res!901142) (not e!770046))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356371 (= res!901142 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!901150 () Bool)

(assert (=> start!114174 (=> (not res!901150) (not e!770046))))

(assert (=> start!114174 (= res!901150 (and (bvslt (size!45176 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45176 a!3742))))))

(assert (=> start!114174 e!770046))

(assert (=> start!114174 true))

(declare-fun array_inv!33654 (array!92356) Bool)

(assert (=> start!114174 (array_inv!33654 a!3742)))

(declare-fun b!1356372 () Bool)

(declare-fun res!901147 () Bool)

(assert (=> b!1356372 (=> (not res!901147) (not e!770046))))

(assert (=> b!1356372 (= res!901147 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356373 () Bool)

(declare-fun res!901143 () Bool)

(assert (=> b!1356373 (=> (not res!901143) (not e!770046))))

(declare-fun contains!9376 (List!31667 (_ BitVec 64)) Bool)

(assert (=> b!1356373 (= res!901143 (not (contains!9376 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356374 () Bool)

(declare-fun res!901146 () Bool)

(assert (=> b!1356374 (=> (not res!901146) (not e!770046))))

(assert (=> b!1356374 (= res!901146 (not (contains!9376 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356375 () Bool)

(declare-fun res!901141 () Bool)

(assert (=> b!1356375 (=> (not res!901141) (not e!770046))))

(assert (=> b!1356375 (= res!901141 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31664))))

(declare-fun b!1356376 () Bool)

(assert (=> b!1356376 (= e!770046 e!770044)))

(declare-fun res!901148 () Bool)

(assert (=> b!1356376 (=> (not res!901148) (not e!770044))))

(declare-fun lt!599006 () Bool)

(assert (=> b!1356376 (= res!901148 (and (not (= from!3120 i!1404)) (not lt!599006) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599007 () Unit!44619)

(assert (=> b!1356376 (= lt!599007 e!770045)))

(declare-fun c!127052 () Bool)

(assert (=> b!1356376 (= c!127052 lt!599006)))

(assert (=> b!1356376 (= lt!599006 (validKeyInArray!0 (select (arr!44626 a!3742) from!3120)))))

(assert (= (and start!114174 res!901150) b!1356368))

(assert (= (and b!1356368 res!901149) b!1356373))

(assert (= (and b!1356373 res!901143) b!1356374))

(assert (= (and b!1356374 res!901146) b!1356375))

(assert (= (and b!1356375 res!901141) b!1356372))

(assert (= (and b!1356372 res!901147) b!1356367))

(assert (= (and b!1356367 res!901145) b!1356371))

(assert (= (and b!1356371 res!901142) b!1356369))

(assert (= (and b!1356369 res!901144) b!1356376))

(assert (= (and b!1356376 c!127052) b!1356366))

(assert (= (and b!1356376 (not c!127052)) b!1356365))

(assert (= (and b!1356376 res!901148) b!1356370))

(assert (= (and b!1356370 res!901140) b!1356364))

(declare-fun m!1242369 () Bool)

(assert (=> b!1356372 m!1242369))

(declare-fun m!1242371 () Bool)

(assert (=> b!1356376 m!1242371))

(assert (=> b!1356376 m!1242371))

(declare-fun m!1242373 () Bool)

(assert (=> b!1356376 m!1242373))

(declare-fun m!1242375 () Bool)

(assert (=> b!1356374 m!1242375))

(declare-fun m!1242377 () Bool)

(assert (=> b!1356371 m!1242377))

(declare-fun m!1242379 () Bool)

(assert (=> b!1356370 m!1242379))

(declare-fun m!1242381 () Bool)

(assert (=> b!1356368 m!1242381))

(declare-fun m!1242383 () Bool)

(assert (=> start!114174 m!1242383))

(declare-fun m!1242385 () Bool)

(assert (=> b!1356375 m!1242385))

(declare-fun m!1242387 () Bool)

(assert (=> b!1356364 m!1242387))

(declare-fun m!1242389 () Bool)

(assert (=> b!1356364 m!1242389))

(declare-fun m!1242391 () Bool)

(assert (=> b!1356364 m!1242391))

(declare-fun m!1242393 () Bool)

(assert (=> b!1356366 m!1242393))

(assert (=> b!1356366 m!1242371))

(declare-fun m!1242395 () Bool)

(assert (=> b!1356366 m!1242395))

(declare-fun m!1242397 () Bool)

(assert (=> b!1356366 m!1242397))

(assert (=> b!1356366 m!1242379))

(assert (=> b!1356366 m!1242371))

(assert (=> b!1356366 m!1242395))

(declare-fun m!1242399 () Bool)

(assert (=> b!1356366 m!1242399))

(declare-fun m!1242401 () Bool)

(assert (=> b!1356373 m!1242401))

(push 1)

