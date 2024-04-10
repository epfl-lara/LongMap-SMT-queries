; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71846 () Bool)

(assert start!71846)

(declare-fun b!835022 () Bool)

(declare-fun res!567894 () Bool)

(declare-fun e!465881 () Bool)

(assert (=> b!835022 (=> (not res!567894) (not e!465881))))

(declare-datatypes ((array!46756 0))(
  ( (array!46757 (arr!22412 (Array (_ BitVec 32) (_ BitVec 64))) (size!22833 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46756)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835022 (= res!567894 (not (validKeyInArray!0 (select (arr!22412 a!4227) i!1466))))))

(declare-fun res!567893 () Bool)

(assert (=> start!71846 (=> (not res!567893) (not e!465881))))

(assert (=> start!71846 (= res!567893 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22833 a!4227))))))

(assert (=> start!71846 e!465881))

(assert (=> start!71846 true))

(declare-fun array_inv!17859 (array!46756) Bool)

(assert (=> start!71846 (array_inv!17859 a!4227)))

(declare-fun b!835023 () Bool)

(declare-fun res!567895 () Bool)

(assert (=> b!835023 (=> (not res!567895) (not e!465881))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!835023 (= res!567895 (validKeyInArray!0 k!2968))))

(declare-fun b!835025 () Bool)

(assert (=> b!835025 (= e!465881 false)))

(declare-fun lt!379642 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46756 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835025 (= lt!379642 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379641 () (_ BitVec 32))

(assert (=> b!835025 (= lt!379641 (arrayCountValidKeys!0 (array!46757 (store (arr!22412 a!4227) i!1466 k!2968) (size!22833 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835024 () Bool)

(declare-fun res!567896 () Bool)

(assert (=> b!835024 (=> (not res!567896) (not e!465881))))

(assert (=> b!835024 (= res!567896 (and (bvslt (size!22833 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22833 a!4227)) (bvsgt to!390 i!1466)))))

(assert (= (and start!71846 res!567893) b!835022))

(assert (= (and b!835022 res!567894) b!835023))

(assert (= (and b!835023 res!567895) b!835024))

(assert (= (and b!835024 res!567896) b!835025))

(declare-fun m!780187 () Bool)

(assert (=> b!835022 m!780187))

(assert (=> b!835022 m!780187))

(declare-fun m!780189 () Bool)

(assert (=> b!835022 m!780189))

(declare-fun m!780191 () Bool)

(assert (=> start!71846 m!780191))

(declare-fun m!780193 () Bool)

(assert (=> b!835023 m!780193))

(declare-fun m!780195 () Bool)

(assert (=> b!835025 m!780195))

(declare-fun m!780197 () Bool)

(assert (=> b!835025 m!780197))

(declare-fun m!780199 () Bool)

(assert (=> b!835025 m!780199))

(push 1)

(assert (not start!71846))

(assert (not b!835025))

(assert (not b!835023))

(assert (not b!835022))

(check-sat)

