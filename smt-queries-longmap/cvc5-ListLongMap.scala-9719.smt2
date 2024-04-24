; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115214 () Bool)

(assert start!115214)

(declare-fun res!907442 () Bool)

(declare-fun e!773890 () Bool)

(assert (=> start!115214 (=> (not res!907442) (not e!773890))))

(declare-datatypes ((array!92783 0))(
  ( (array!92784 (arr!44820 (Array (_ BitVec 32) (_ BitVec 64))) (size!45371 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92783)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!115214 (= res!907442 (and (bvslt (size!45371 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45371 a!3742))))))

(assert (=> start!115214 e!773890))

(assert (=> start!115214 true))

(declare-fun array_inv!34101 (array!92783) Bool)

(assert (=> start!115214 (array_inv!34101 a!3742)))

(declare-fun b!1364334 () Bool)

(declare-fun res!907439 () Bool)

(assert (=> b!1364334 (=> (not res!907439) (not e!773890))))

(declare-datatypes ((List!31848 0))(
  ( (Nil!31845) (Cons!31844 (h!33062 (_ BitVec 64)) (t!46528 List!31848)) )
))
(declare-fun acc!759 () List!31848)

(declare-fun contains!9560 (List!31848 (_ BitVec 64)) Bool)

(assert (=> b!1364334 (= res!907439 (not (contains!9560 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364335 () Bool)

(declare-fun res!907437 () Bool)

(assert (=> b!1364335 (=> (not res!907437) (not e!773890))))

(declare-fun noDuplicate!2391 (List!31848) Bool)

(assert (=> b!1364335 (= res!907437 (noDuplicate!2391 acc!759))))

(declare-fun b!1364336 () Bool)

(declare-fun res!907435 () Bool)

(assert (=> b!1364336 (=> (not res!907435) (not e!773890))))

(assert (=> b!1364336 (= res!907435 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45371 a!3742)))))

(declare-fun b!1364337 () Bool)

(declare-fun res!907436 () Bool)

(assert (=> b!1364337 (=> (not res!907436) (not e!773890))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1364337 (= res!907436 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1364338 () Bool)

(declare-fun res!907443 () Bool)

(assert (=> b!1364338 (=> (not res!907443) (not e!773890))))

(assert (=> b!1364338 (= res!907443 (not (contains!9560 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364339 () Bool)

(declare-datatypes ((Unit!44900 0))(
  ( (Unit!44901) )
))
(declare-fun e!773889 () Unit!44900)

(declare-fun lt!601134 () Unit!44900)

(assert (=> b!1364339 (= e!773889 lt!601134)))

(declare-fun lt!601132 () Unit!44900)

(declare-fun lemmaListSubSeqRefl!0 (List!31848) Unit!44900)

(assert (=> b!1364339 (= lt!601132 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!919 (List!31848 List!31848) Bool)

(assert (=> b!1364339 (subseq!919 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92783 List!31848 List!31848 (_ BitVec 32)) Unit!44900)

(declare-fun $colon$colon!921 (List!31848 (_ BitVec 64)) List!31848)

(assert (=> b!1364339 (= lt!601134 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!921 acc!759 (select (arr!44820 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92783 (_ BitVec 32) List!31848) Bool)

(assert (=> b!1364339 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1364340 () Bool)

(declare-fun res!907438 () Bool)

(assert (=> b!1364340 (=> (not res!907438) (not e!773890))))

(assert (=> b!1364340 (= res!907438 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1364341 () Bool)

(declare-fun res!907441 () Bool)

(assert (=> b!1364341 (=> (not res!907441) (not e!773890))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1364341 (= res!907441 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45371 a!3742))))))

(declare-fun b!1364342 () Bool)

(assert (=> b!1364342 (= e!773890 false)))

(declare-fun lt!601133 () Unit!44900)

(assert (=> b!1364342 (= lt!601133 e!773889)))

(declare-fun c!127897 () Bool)

(assert (=> b!1364342 (= c!127897 (validKeyInArray!0 (select (arr!44820 a!3742) from!3120)))))

(declare-fun b!1364343 () Bool)

(declare-fun res!907440 () Bool)

(assert (=> b!1364343 (=> (not res!907440) (not e!773890))))

(assert (=> b!1364343 (= res!907440 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31845))))

(declare-fun b!1364344 () Bool)

(declare-fun Unit!44902 () Unit!44900)

(assert (=> b!1364344 (= e!773889 Unit!44902)))

(assert (= (and start!115214 res!907442) b!1364335))

(assert (= (and b!1364335 res!907437) b!1364338))

(assert (= (and b!1364338 res!907443) b!1364334))

(assert (= (and b!1364334 res!907439) b!1364343))

(assert (= (and b!1364343 res!907440) b!1364340))

(assert (= (and b!1364340 res!907438) b!1364341))

(assert (= (and b!1364341 res!907441) b!1364337))

(assert (= (and b!1364337 res!907436) b!1364336))

(assert (= (and b!1364336 res!907435) b!1364342))

(assert (= (and b!1364342 c!127897) b!1364339))

(assert (= (and b!1364342 (not c!127897)) b!1364344))

(declare-fun m!1249515 () Bool)

(assert (=> b!1364340 m!1249515))

(declare-fun m!1249517 () Bool)

(assert (=> b!1364338 m!1249517))

(declare-fun m!1249519 () Bool)

(assert (=> b!1364342 m!1249519))

(assert (=> b!1364342 m!1249519))

(declare-fun m!1249521 () Bool)

(assert (=> b!1364342 m!1249521))

(declare-fun m!1249523 () Bool)

(assert (=> b!1364337 m!1249523))

(declare-fun m!1249525 () Bool)

(assert (=> b!1364334 m!1249525))

(declare-fun m!1249527 () Bool)

(assert (=> b!1364343 m!1249527))

(declare-fun m!1249529 () Bool)

(assert (=> b!1364335 m!1249529))

(declare-fun m!1249531 () Bool)

(assert (=> start!115214 m!1249531))

(declare-fun m!1249533 () Bool)

(assert (=> b!1364339 m!1249533))

(assert (=> b!1364339 m!1249519))

(declare-fun m!1249535 () Bool)

(assert (=> b!1364339 m!1249535))

(declare-fun m!1249537 () Bool)

(assert (=> b!1364339 m!1249537))

(declare-fun m!1249539 () Bool)

(assert (=> b!1364339 m!1249539))

(assert (=> b!1364339 m!1249519))

(assert (=> b!1364339 m!1249535))

(declare-fun m!1249541 () Bool)

(assert (=> b!1364339 m!1249541))

(push 1)

(assert (not b!1364338))

(assert (not b!1364339))

(assert (not b!1364334))

(assert (not b!1364343))

(assert (not b!1364335))

(assert (not b!1364342))

(assert (not start!115214))

(assert (not b!1364340))

(assert (not b!1364337))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

