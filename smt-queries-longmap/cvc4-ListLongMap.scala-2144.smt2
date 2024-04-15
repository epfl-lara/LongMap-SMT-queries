; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36144 () Bool)

(assert start!36144)

(declare-fun b!362304 () Bool)

(declare-fun res!201736 () Bool)

(declare-fun e!221881 () Bool)

(assert (=> b!362304 (=> (not res!201736) (not e!221881))))

(declare-datatypes ((array!20456 0))(
  ( (array!20457 (arr!9710 (Array (_ BitVec 32) (_ BitVec 64))) (size!10063 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20456)

(assert (=> b!362304 (= res!201736 (bvslt (size!10063 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362305 () Bool)

(declare-fun res!201738 () Bool)

(assert (=> b!362305 (=> (not res!201738) (not e!221881))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362305 (= res!201738 (validKeyInArray!0 k!2980))))

(declare-fun b!362306 () Bool)

(declare-fun e!221882 () Bool)

(assert (=> b!362306 (= e!221882 true)))

(declare-fun lt!166598 () (_ BitVec 32))

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20456 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362306 (= lt!166598 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166600 () (_ BitVec 32))

(declare-fun lt!166601 () array!20456)

(assert (=> b!362306 (= lt!166600 (arrayCountValidKeys!0 lt!166601 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362307 () Bool)

(declare-fun res!201735 () Bool)

(assert (=> b!362307 (=> (not res!201735) (not e!221881))))

(assert (=> b!362307 (= res!201735 (not (validKeyInArray!0 (select (arr!9710 a!4337) i!1478))))))

(declare-fun b!362308 () Bool)

(assert (=> b!362308 (= e!221881 (not e!221882))))

(declare-fun res!201739 () Bool)

(assert (=> b!362308 (=> res!201739 e!221882)))

(assert (=> b!362308 (= res!201739 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(assert (=> b!362308 (= (arrayCountValidKeys!0 lt!166601 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (=> b!362308 (= lt!166601 (array!20457 (store (arr!9710 a!4337) i!1478 k!2980) (size!10063 a!4337)))))

(declare-datatypes ((Unit!11116 0))(
  ( (Unit!11117) )
))
(declare-fun lt!166599 () Unit!11116)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20456 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11116)

(assert (=> b!362308 (= lt!166599 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun res!201737 () Bool)

(assert (=> start!36144 (=> (not res!201737) (not e!221881))))

(assert (=> start!36144 (= res!201737 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10063 a!4337))))))

(assert (=> start!36144 e!221881))

(assert (=> start!36144 true))

(declare-fun array_inv!7159 (array!20456) Bool)

(assert (=> start!36144 (array_inv!7159 a!4337)))

(assert (= (and start!36144 res!201737) b!362307))

(assert (= (and b!362307 res!201735) b!362305))

(assert (= (and b!362305 res!201738) b!362304))

(assert (= (and b!362304 res!201736) b!362308))

(assert (= (and b!362308 (not res!201739)) b!362306))

(declare-fun m!358425 () Bool)

(assert (=> b!362308 m!358425))

(declare-fun m!358427 () Bool)

(assert (=> b!362308 m!358427))

(declare-fun m!358429 () Bool)

(assert (=> b!362308 m!358429))

(declare-fun m!358431 () Bool)

(assert (=> b!362308 m!358431))

(declare-fun m!358433 () Bool)

(assert (=> b!362306 m!358433))

(declare-fun m!358435 () Bool)

(assert (=> b!362306 m!358435))

(declare-fun m!358437 () Bool)

(assert (=> b!362307 m!358437))

(assert (=> b!362307 m!358437))

(declare-fun m!358439 () Bool)

(assert (=> b!362307 m!358439))

(declare-fun m!358441 () Bool)

(assert (=> start!36144 m!358441))

(declare-fun m!358443 () Bool)

(assert (=> b!362305 m!358443))

(push 1)

(assert (not b!362306))

(assert (not b!362305))

(assert (not start!36144))

(assert (not b!362308))

(assert (not b!362307))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

