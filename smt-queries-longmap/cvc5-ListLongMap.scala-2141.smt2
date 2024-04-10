; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36138 () Bool)

(assert start!36138)

(declare-fun b!362433 () Bool)

(declare-fun res!201723 () Bool)

(declare-fun e!221972 () Bool)

(assert (=> b!362433 (=> (not res!201723) (not e!221972))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362433 (= res!201723 (validKeyInArray!0 k!2980))))

(declare-fun b!362435 () Bool)

(assert (=> b!362435 (= e!221972 false)))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20454 0))(
  ( (array!20455 (arr!9709 (Array (_ BitVec 32) (_ BitVec 64))) (size!10061 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20454)

(declare-fun lt!166726 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20454 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362435 (= lt!166726 (arrayCountValidKeys!0 (array!20455 (store (arr!9709 a!4337) i!1478 k!2980) (size!10061 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166727 () (_ BitVec 32))

(assert (=> b!362435 (= lt!166727 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362432 () Bool)

(declare-fun res!201721 () Bool)

(assert (=> b!362432 (=> (not res!201721) (not e!221972))))

(assert (=> b!362432 (= res!201721 (not (validKeyInArray!0 (select (arr!9709 a!4337) i!1478))))))

(declare-fun b!362434 () Bool)

(declare-fun res!201722 () Bool)

(assert (=> b!362434 (=> (not res!201722) (not e!221972))))

(assert (=> b!362434 (= res!201722 (and (bvslt (size!10061 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10061 a!4337))))))

(declare-fun res!201724 () Bool)

(assert (=> start!36138 (=> (not res!201724) (not e!221972))))

(assert (=> start!36138 (= res!201724 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10061 a!4337))))))

(assert (=> start!36138 e!221972))

(assert (=> start!36138 true))

(declare-fun array_inv!7151 (array!20454) Bool)

(assert (=> start!36138 (array_inv!7151 a!4337)))

(assert (= (and start!36138 res!201724) b!362432))

(assert (= (and b!362432 res!201721) b!362433))

(assert (= (and b!362433 res!201723) b!362434))

(assert (= (and b!362434 res!201722) b!362435))

(declare-fun m!358967 () Bool)

(assert (=> b!362433 m!358967))

(declare-fun m!358969 () Bool)

(assert (=> b!362435 m!358969))

(declare-fun m!358971 () Bool)

(assert (=> b!362435 m!358971))

(declare-fun m!358973 () Bool)

(assert (=> b!362435 m!358973))

(declare-fun m!358975 () Bool)

(assert (=> b!362432 m!358975))

(assert (=> b!362432 m!358975))

(declare-fun m!358977 () Bool)

(assert (=> b!362432 m!358977))

(declare-fun m!358979 () Bool)

(assert (=> start!36138 m!358979))

(push 1)

(assert (not b!362435))

(assert (not b!362433))

(assert (not b!362432))

(assert (not start!36138))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

