; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71836 () Bool)

(assert start!71836)

(declare-fun b!834955 () Bool)

(declare-fun res!567828 () Bool)

(declare-fun e!465851 () Bool)

(assert (=> b!834955 (=> (not res!567828) (not e!465851))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834955 (= res!567828 (validKeyInArray!0 k!2968))))

(declare-fun b!834956 () Bool)

(declare-fun res!567827 () Bool)

(assert (=> b!834956 (=> (not res!567827) (not e!465851))))

(declare-datatypes ((array!46746 0))(
  ( (array!46747 (arr!22407 (Array (_ BitVec 32) (_ BitVec 64))) (size!22828 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46746)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834956 (= res!567827 (and (bvslt (size!22828 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22828 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun res!567826 () Bool)

(assert (=> start!71836 (=> (not res!567826) (not e!465851))))

(assert (=> start!71836 (= res!567826 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22828 a!4227))))))

(assert (=> start!71836 e!465851))

(assert (=> start!71836 true))

(declare-fun array_inv!17854 (array!46746) Bool)

(assert (=> start!71836 (array_inv!17854 a!4227)))

(declare-fun b!834957 () Bool)

(declare-fun res!567829 () Bool)

(assert (=> b!834957 (=> (not res!567829) (not e!465851))))

(assert (=> b!834957 (= res!567829 (not (validKeyInArray!0 (select (arr!22407 a!4227) i!1466))))))

(declare-fun b!834958 () Bool)

(assert (=> b!834958 (= e!465851 (and (= to!390 (size!22828 a!4227)) (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(declare-fun b!834959 () Bool)

(declare-fun res!567830 () Bool)

(assert (=> b!834959 (=> (not res!567830) (not e!465851))))

(declare-fun arrayCountValidKeys!0 (array!46746 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834959 (= res!567830 (= (arrayCountValidKeys!0 (array!46747 (store (arr!22407 a!4227) i!1466 k!2968) (size!22828 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(assert (= (and start!71836 res!567826) b!834957))

(assert (= (and b!834957 res!567829) b!834955))

(assert (= (and b!834955 res!567828) b!834956))

(assert (= (and b!834956 res!567827) b!834959))

(assert (= (and b!834959 res!567830) b!834958))

(declare-fun m!780117 () Bool)

(assert (=> b!834955 m!780117))

(declare-fun m!780119 () Bool)

(assert (=> start!71836 m!780119))

(declare-fun m!780121 () Bool)

(assert (=> b!834957 m!780121))

(assert (=> b!834957 m!780121))

(declare-fun m!780123 () Bool)

(assert (=> b!834957 m!780123))

(declare-fun m!780125 () Bool)

(assert (=> b!834959 m!780125))

(declare-fun m!780127 () Bool)

(assert (=> b!834959 m!780127))

(declare-fun m!780129 () Bool)

(assert (=> b!834959 m!780129))

(push 1)

(assert (not b!834957))

(assert (not b!834955))

(assert (not start!71836))

(assert (not b!834959))

(check-sat)

(pop 1)

