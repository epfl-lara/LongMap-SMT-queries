; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113936 () Bool)

(assert start!113936)

(declare-fun b!1351466 () Bool)

(declare-fun res!896924 () Bool)

(declare-fun e!768516 () Bool)

(assert (=> b!1351466 (=> (not res!896924) (not e!768516))))

(declare-datatypes ((List!31548 0))(
  ( (Nil!31545) (Cons!31544 (h!32753 (_ BitVec 64)) (t!46206 List!31548)) )
))
(declare-fun acc!759 () List!31548)

(declare-fun contains!9257 (List!31548 (_ BitVec 64)) Bool)

(assert (=> b!1351466 (= res!896924 (not (contains!9257 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351467 () Bool)

(declare-fun e!768515 () Bool)

(assert (=> b!1351467 (= e!768516 (not e!768515))))

(declare-fun res!896927 () Bool)

(assert (=> b!1351467 (=> res!896927 e!768515)))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1351467 (= res!896927 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun lt!597235 () List!31548)

(declare-datatypes ((array!92118 0))(
  ( (array!92119 (arr!44507 (Array (_ BitVec 32) (_ BitVec 64))) (size!45057 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92118)

(declare-fun $colon$colon!692 (List!31548 (_ BitVec 64)) List!31548)

(assert (=> b!1351467 (= lt!597235 ($colon$colon!692 acc!759 (select (arr!44507 a!3742) from!3120)))))

(declare-fun subseq!677 (List!31548 List!31548) Bool)

(assert (=> b!1351467 (subseq!677 acc!759 acc!759)))

(declare-datatypes ((Unit!44268 0))(
  ( (Unit!44269) )
))
(declare-fun lt!597237 () Unit!44268)

(declare-fun lemmaListSubSeqRefl!0 (List!31548) Unit!44268)

(assert (=> b!1351467 (= lt!597237 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1351468 () Bool)

(declare-fun res!896928 () Bool)

(assert (=> b!1351468 (=> (not res!896928) (not e!768516))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351468 (= res!896928 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!896934 () Bool)

(assert (=> start!113936 (=> (not res!896934) (not e!768516))))

(assert (=> start!113936 (= res!896934 (and (bvslt (size!45057 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45057 a!3742))))))

(assert (=> start!113936 e!768516))

(assert (=> start!113936 true))

(declare-fun array_inv!33535 (array!92118) Bool)

(assert (=> start!113936 (array_inv!33535 a!3742)))

(declare-fun b!1351469 () Bool)

(declare-fun res!896925 () Bool)

(assert (=> b!1351469 (=> (not res!896925) (not e!768516))))

(assert (=> b!1351469 (= res!896925 (not (contains!9257 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351470 () Bool)

(declare-fun res!896935 () Bool)

(assert (=> b!1351470 (=> (not res!896935) (not e!768516))))

(declare-fun arrayNoDuplicates!0 (array!92118 (_ BitVec 32) List!31548) Bool)

(assert (=> b!1351470 (= res!896935 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351471 () Bool)

(declare-fun res!896936 () Bool)

(assert (=> b!1351471 (=> res!896936 e!768515)))

(assert (=> b!1351471 (= res!896936 (not (subseq!677 acc!759 lt!597235)))))

(declare-fun b!1351472 () Bool)

(declare-fun res!896931 () Bool)

(assert (=> b!1351472 (=> res!896931 e!768515)))

(declare-fun noDuplicate!2114 (List!31548) Bool)

(assert (=> b!1351472 (= res!896931 (not (noDuplicate!2114 lt!597235)))))

(declare-fun b!1351473 () Bool)

(declare-fun res!896933 () Bool)

(assert (=> b!1351473 (=> res!896933 e!768515)))

(assert (=> b!1351473 (= res!896933 (contains!9257 lt!597235 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351474 () Bool)

(declare-fun res!896929 () Bool)

(assert (=> b!1351474 (=> (not res!896929) (not e!768516))))

(assert (=> b!1351474 (= res!896929 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31545))))

(declare-fun b!1351475 () Bool)

(assert (=> b!1351475 (= e!768515 true)))

(declare-fun lt!597236 () Bool)

(assert (=> b!1351475 (= lt!597236 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597235))))

(declare-fun lt!597238 () Unit!44268)

(declare-fun noDuplicateSubseq!128 (List!31548 List!31548) Unit!44268)

(assert (=> b!1351475 (= lt!597238 (noDuplicateSubseq!128 acc!759 lt!597235))))

(declare-fun b!1351476 () Bool)

(declare-fun res!896938 () Bool)

(assert (=> b!1351476 (=> (not res!896938) (not e!768516))))

(assert (=> b!1351476 (= res!896938 (validKeyInArray!0 (select (arr!44507 a!3742) from!3120)))))

(declare-fun b!1351477 () Bool)

(declare-fun res!896932 () Bool)

(assert (=> b!1351477 (=> res!896932 e!768515)))

(assert (=> b!1351477 (= res!896932 (contains!9257 lt!597235 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351478 () Bool)

(declare-fun res!896930 () Bool)

(assert (=> b!1351478 (=> (not res!896930) (not e!768516))))

(assert (=> b!1351478 (= res!896930 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45057 a!3742)))))

(declare-fun b!1351479 () Bool)

(declare-fun res!896937 () Bool)

(assert (=> b!1351479 (=> (not res!896937) (not e!768516))))

(assert (=> b!1351479 (= res!896937 (noDuplicate!2114 acc!759))))

(declare-fun b!1351480 () Bool)

(declare-fun res!896926 () Bool)

(assert (=> b!1351480 (=> (not res!896926) (not e!768516))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351480 (= res!896926 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45057 a!3742))))))

(assert (= (and start!113936 res!896934) b!1351479))

(assert (= (and b!1351479 res!896937) b!1351466))

(assert (= (and b!1351466 res!896924) b!1351469))

(assert (= (and b!1351469 res!896925) b!1351474))

(assert (= (and b!1351474 res!896929) b!1351470))

(assert (= (and b!1351470 res!896935) b!1351480))

(assert (= (and b!1351480 res!896926) b!1351468))

(assert (= (and b!1351468 res!896928) b!1351478))

(assert (= (and b!1351478 res!896930) b!1351476))

(assert (= (and b!1351476 res!896938) b!1351467))

(assert (= (and b!1351467 (not res!896927)) b!1351472))

(assert (= (and b!1351472 (not res!896931)) b!1351477))

(assert (= (and b!1351477 (not res!896932)) b!1351473))

(assert (= (and b!1351473 (not res!896933)) b!1351471))

(assert (= (and b!1351471 (not res!896936)) b!1351475))

(declare-fun m!1238485 () Bool)

(assert (=> b!1351475 m!1238485))

(declare-fun m!1238487 () Bool)

(assert (=> b!1351475 m!1238487))

(declare-fun m!1238489 () Bool)

(assert (=> b!1351473 m!1238489))

(declare-fun m!1238491 () Bool)

(assert (=> b!1351472 m!1238491))

(declare-fun m!1238493 () Bool)

(assert (=> b!1351476 m!1238493))

(assert (=> b!1351476 m!1238493))

(declare-fun m!1238495 () Bool)

(assert (=> b!1351476 m!1238495))

(declare-fun m!1238497 () Bool)

(assert (=> b!1351477 m!1238497))

(declare-fun m!1238499 () Bool)

(assert (=> b!1351471 m!1238499))

(declare-fun m!1238501 () Bool)

(assert (=> b!1351474 m!1238501))

(declare-fun m!1238503 () Bool)

(assert (=> start!113936 m!1238503))

(declare-fun m!1238505 () Bool)

(assert (=> b!1351470 m!1238505))

(declare-fun m!1238507 () Bool)

(assert (=> b!1351468 m!1238507))

(declare-fun m!1238509 () Bool)

(assert (=> b!1351469 m!1238509))

(assert (=> b!1351467 m!1238493))

(assert (=> b!1351467 m!1238493))

(declare-fun m!1238511 () Bool)

(assert (=> b!1351467 m!1238511))

(declare-fun m!1238513 () Bool)

(assert (=> b!1351467 m!1238513))

(declare-fun m!1238515 () Bool)

(assert (=> b!1351467 m!1238515))

(declare-fun m!1238517 () Bool)

(assert (=> b!1351466 m!1238517))

(declare-fun m!1238519 () Bool)

(assert (=> b!1351479 m!1238519))

(push 1)

(assert (not b!1351470))

(assert (not b!1351477))

(assert (not b!1351475))

(assert (not b!1351476))

(assert (not b!1351473))

(assert (not b!1351466))

(assert (not b!1351472))

(assert (not b!1351467))

(assert (not b!1351479))

(assert (not b!1351471))

(assert (not b!1351469))

(assert (not b!1351474))

(assert (not b!1351468))

(assert (not start!113936))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

