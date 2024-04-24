; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71940 () Bool)

(assert start!71940)

(declare-fun b!835104 () Bool)

(declare-fun e!465994 () Bool)

(assert (=> b!835104 (= e!465994 false)))

(declare-datatypes ((array!46687 0))(
  ( (array!46688 (arr!22373 (Array (_ BitVec 32) (_ BitVec 64))) (size!22793 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46687)

(declare-fun lt!379181 () (_ BitVec 32))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46687 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835104 (= lt!379181 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379180 () (_ BitVec 32))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!835104 (= lt!379180 (arrayCountValidKeys!0 (array!46688 (store (arr!22373 a!4227) i!1466 k!2968) (size!22793 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835102 () Bool)

(declare-fun res!567582 () Bool)

(assert (=> b!835102 (=> (not res!567582) (not e!465994))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835102 (= res!567582 (validKeyInArray!0 k!2968))))

(declare-fun b!835101 () Bool)

(declare-fun res!567585 () Bool)

(assert (=> b!835101 (=> (not res!567585) (not e!465994))))

(assert (=> b!835101 (= res!567585 (not (validKeyInArray!0 (select (arr!22373 a!4227) i!1466))))))

(declare-fun res!567584 () Bool)

(assert (=> start!71940 (=> (not res!567584) (not e!465994))))

(assert (=> start!71940 (= res!567584 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22793 a!4227))))))

(assert (=> start!71940 e!465994))

(assert (=> start!71940 true))

(declare-fun array_inv!17859 (array!46687) Bool)

(assert (=> start!71940 (array_inv!17859 a!4227)))

(declare-fun b!835103 () Bool)

(declare-fun res!567583 () Bool)

(assert (=> b!835103 (=> (not res!567583) (not e!465994))))

(assert (=> b!835103 (= res!567583 (and (bvslt (size!22793 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22793 a!4227)) (bvsgt to!390 i!1466)))))

(assert (= (and start!71940 res!567584) b!835101))

(assert (= (and b!835101 res!567585) b!835102))

(assert (= (and b!835102 res!567582) b!835103))

(assert (= (and b!835103 res!567583) b!835104))

(declare-fun m!780433 () Bool)

(assert (=> b!835104 m!780433))

(declare-fun m!780435 () Bool)

(assert (=> b!835104 m!780435))

(declare-fun m!780437 () Bool)

(assert (=> b!835104 m!780437))

(declare-fun m!780439 () Bool)

(assert (=> b!835102 m!780439))

(declare-fun m!780441 () Bool)

(assert (=> b!835101 m!780441))

(assert (=> b!835101 m!780441))

(declare-fun m!780443 () Bool)

(assert (=> b!835101 m!780443))

(declare-fun m!780445 () Bool)

(assert (=> start!71940 m!780445))

(push 1)

(assert (not b!835104))

(assert (not start!71940))

(assert (not b!835101))

(assert (not b!835102))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

