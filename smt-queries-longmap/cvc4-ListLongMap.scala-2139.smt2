; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36114 () Bool)

(assert start!36114)

(declare-fun res!201534 () Bool)

(declare-fun e!221768 () Bool)

(assert (=> start!36114 (=> (not res!201534) (not e!221768))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20426 0))(
  ( (array!20427 (arr!9695 (Array (_ BitVec 32) (_ BitVec 64))) (size!10048 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20426)

(assert (=> start!36114 (= res!201534 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10048 a!4337))))))

(assert (=> start!36114 e!221768))

(assert (=> start!36114 true))

(declare-fun array_inv!7144 (array!20426) Bool)

(assert (=> start!36114 (array_inv!7144 a!4337)))

(declare-fun b!362102 () Bool)

(declare-fun res!201532 () Bool)

(assert (=> b!362102 (=> (not res!201532) (not e!221768))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362102 (= res!201532 (validKeyInArray!0 k!2980))))

(declare-fun b!362104 () Bool)

(assert (=> b!362104 (= e!221768 false)))

(declare-fun lt!166462 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20426 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362104 (= lt!166462 (arrayCountValidKeys!0 (array!20427 (store (arr!9695 a!4337) i!1478 k!2980) (size!10048 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166463 () (_ BitVec 32))

(assert (=> b!362104 (= lt!166463 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362103 () Bool)

(declare-fun res!201535 () Bool)

(assert (=> b!362103 (=> (not res!201535) (not e!221768))))

(assert (=> b!362103 (= res!201535 (and (bvslt (size!10048 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10048 a!4337))))))

(declare-fun b!362101 () Bool)

(declare-fun res!201533 () Bool)

(assert (=> b!362101 (=> (not res!201533) (not e!221768))))

(assert (=> b!362101 (= res!201533 (not (validKeyInArray!0 (select (arr!9695 a!4337) i!1478))))))

(assert (= (and start!36114 res!201534) b!362101))

(assert (= (and b!362101 res!201533) b!362102))

(assert (= (and b!362102 res!201532) b!362103))

(assert (= (and b!362103 res!201535) b!362104))

(declare-fun m!358173 () Bool)

(assert (=> start!36114 m!358173))

(declare-fun m!358175 () Bool)

(assert (=> b!362102 m!358175))

(declare-fun m!358177 () Bool)

(assert (=> b!362104 m!358177))

(declare-fun m!358179 () Bool)

(assert (=> b!362104 m!358179))

(declare-fun m!358181 () Bool)

(assert (=> b!362104 m!358181))

(declare-fun m!358183 () Bool)

(assert (=> b!362101 m!358183))

(assert (=> b!362101 m!358183))

(declare-fun m!358185 () Bool)

(assert (=> b!362101 m!358185))

(push 1)

(assert (not b!362102))

(assert (not b!362104))

(assert (not start!36114))

(assert (not b!362101))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

