; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71758 () Bool)

(assert start!71758)

(declare-fun b!834092 () Bool)

(declare-fun e!465356 () Bool)

(assert (=> b!834092 (= e!465356 false)))

(declare-datatypes ((array!46668 0))(
  ( (array!46669 (arr!22368 (Array (_ BitVec 32) (_ BitVec 64))) (size!22789 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46668)

(declare-fun lt!378766 () (_ BitVec 32))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46668 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834092 (= lt!378766 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun lt!378765 () (_ BitVec 32))

(assert (=> b!834092 (= lt!378765 (arrayCountValidKeys!0 (array!46669 (store (arr!22368 a!4227) i!1466 k!2968) (size!22789 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun res!567124 () Bool)

(assert (=> start!71758 (=> (not res!567124) (not e!465356))))

(assert (=> start!71758 (= res!567124 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22789 a!4227))))))

(assert (=> start!71758 e!465356))

(assert (=> start!71758 true))

(declare-fun array_inv!17815 (array!46668) Bool)

(assert (=> start!71758 (array_inv!17815 a!4227)))

(declare-fun b!834090 () Bool)

(declare-fun res!567122 () Bool)

(assert (=> b!834090 (=> (not res!567122) (not e!465356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834090 (= res!567122 (validKeyInArray!0 k!2968))))

(declare-fun b!834091 () Bool)

(declare-fun res!567125 () Bool)

(assert (=> b!834091 (=> (not res!567125) (not e!465356))))

(assert (=> b!834091 (= res!567125 (and (bvslt (size!22789 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22789 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834089 () Bool)

(declare-fun res!567123 () Bool)

(assert (=> b!834089 (=> (not res!567123) (not e!465356))))

(assert (=> b!834089 (= res!567123 (not (validKeyInArray!0 (select (arr!22368 a!4227) i!1466))))))

(assert (= (and start!71758 res!567124) b!834089))

(assert (= (and b!834089 res!567123) b!834090))

(assert (= (and b!834090 res!567122) b!834091))

(assert (= (and b!834091 res!567125) b!834092))

(declare-fun m!779011 () Bool)

(assert (=> b!834092 m!779011))

(declare-fun m!779013 () Bool)

(assert (=> b!834092 m!779013))

(declare-fun m!779015 () Bool)

(assert (=> b!834092 m!779015))

(declare-fun m!779017 () Bool)

(assert (=> start!71758 m!779017))

(declare-fun m!779019 () Bool)

(assert (=> b!834090 m!779019))

(declare-fun m!779021 () Bool)

(assert (=> b!834089 m!779021))

(assert (=> b!834089 m!779021))

(declare-fun m!779023 () Bool)

(assert (=> b!834089 m!779023))

(push 1)

(assert (not b!834090))

(assert (not b!834089))

(assert (not start!71758))

(assert (not b!834092))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

