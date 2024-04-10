; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71762 () Bool)

(assert start!71762)

(declare-fun b!834115 () Bool)

(declare-fun res!567147 () Bool)

(declare-fun e!465368 () Bool)

(assert (=> b!834115 (=> (not res!567147) (not e!465368))))

(declare-datatypes ((array!46672 0))(
  ( (array!46673 (arr!22370 (Array (_ BitVec 32) (_ BitVec 64))) (size!22791 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46672)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834115 (= res!567147 (and (bvslt (size!22791 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22791 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834113 () Bool)

(declare-fun res!567146 () Bool)

(assert (=> b!834113 (=> (not res!567146) (not e!465368))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834113 (= res!567146 (not (validKeyInArray!0 (select (arr!22370 a!4227) i!1466))))))

(declare-fun b!834114 () Bool)

(declare-fun res!567148 () Bool)

(assert (=> b!834114 (=> (not res!567148) (not e!465368))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!834114 (= res!567148 (validKeyInArray!0 k!2968))))

(declare-fun res!567149 () Bool)

(assert (=> start!71762 (=> (not res!567149) (not e!465368))))

(assert (=> start!71762 (= res!567149 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22791 a!4227))))))

(assert (=> start!71762 e!465368))

(assert (=> start!71762 true))

(declare-fun array_inv!17817 (array!46672) Bool)

(assert (=> start!71762 (array_inv!17817 a!4227)))

(declare-fun b!834116 () Bool)

(assert (=> b!834116 (= e!465368 false)))

(declare-fun lt!378777 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46672 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834116 (= lt!378777 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!378778 () (_ BitVec 32))

(assert (=> b!834116 (= lt!378778 (arrayCountValidKeys!0 (array!46673 (store (arr!22370 a!4227) i!1466 k!2968) (size!22791 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (= (and start!71762 res!567149) b!834113))

(assert (= (and b!834113 res!567146) b!834114))

(assert (= (and b!834114 res!567148) b!834115))

(assert (= (and b!834115 res!567147) b!834116))

(declare-fun m!779039 () Bool)

(assert (=> b!834113 m!779039))

(assert (=> b!834113 m!779039))

(declare-fun m!779041 () Bool)

(assert (=> b!834113 m!779041))

(declare-fun m!779043 () Bool)

(assert (=> b!834114 m!779043))

(declare-fun m!779045 () Bool)

(assert (=> start!71762 m!779045))

(declare-fun m!779047 () Bool)

(assert (=> b!834116 m!779047))

(declare-fun m!779049 () Bool)

(assert (=> b!834116 m!779049))

(declare-fun m!779051 () Bool)

(assert (=> b!834116 m!779051))

(push 1)

(assert (not start!71762))

(assert (not b!834116))

(assert (not b!834113))

(assert (not b!834114))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

