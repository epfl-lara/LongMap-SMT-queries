; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71754 () Bool)

(assert start!71754)

(declare-fun res!567133 () Bool)

(declare-fun e!465266 () Bool)

(assert (=> start!71754 (=> (not res!567133) (not e!465266))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46653 0))(
  ( (array!46654 (arr!22361 (Array (_ BitVec 32) (_ BitVec 64))) (size!22782 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46653)

(assert (=> start!71754 (= res!567133 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22782 a!4227))))))

(assert (=> start!71754 e!465266))

(assert (=> start!71754 true))

(declare-fun array_inv!17873 (array!46653) Bool)

(assert (=> start!71754 (array_inv!17873 a!4227)))

(declare-fun b!833961 () Bool)

(declare-fun res!567130 () Bool)

(assert (=> b!833961 (=> (not res!567130) (not e!465266))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!833961 (= res!567130 (not (validKeyInArray!0 (select (arr!22361 a!4227) i!1466))))))

(declare-fun b!833962 () Bool)

(declare-fun res!567132 () Bool)

(assert (=> b!833962 (=> (not res!567132) (not e!465266))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!833962 (= res!567132 (validKeyInArray!0 k!2968))))

(declare-fun b!833963 () Bool)

(declare-fun res!567131 () Bool)

(assert (=> b!833963 (=> (not res!567131) (not e!465266))))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!833963 (= res!567131 (and (bvslt (size!22782 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22782 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!833964 () Bool)

(assert (=> b!833964 (= e!465266 false)))

(declare-fun lt!378584 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46653 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!833964 (= lt!378584 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!378583 () (_ BitVec 32))

(assert (=> b!833964 (= lt!378583 (arrayCountValidKeys!0 (array!46654 (store (arr!22361 a!4227) i!1466 k!2968) (size!22782 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (= (and start!71754 res!567133) b!833961))

(assert (= (and b!833961 res!567130) b!833962))

(assert (= (and b!833962 res!567132) b!833963))

(assert (= (and b!833963 res!567131) b!833964))

(declare-fun m!778399 () Bool)

(assert (=> start!71754 m!778399))

(declare-fun m!778401 () Bool)

(assert (=> b!833961 m!778401))

(assert (=> b!833961 m!778401))

(declare-fun m!778403 () Bool)

(assert (=> b!833961 m!778403))

(declare-fun m!778405 () Bool)

(assert (=> b!833962 m!778405))

(declare-fun m!778407 () Bool)

(assert (=> b!833964 m!778407))

(declare-fun m!778409 () Bool)

(assert (=> b!833964 m!778409))

(declare-fun m!778411 () Bool)

(assert (=> b!833964 m!778411))

(push 1)

(assert (not b!833962))

(assert (not b!833961))

(assert (not start!71754))

(assert (not b!833964))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

