; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71774 () Bool)

(assert start!71774)

(declare-fun b!834203 () Bool)

(declare-fun res!567238 () Bool)

(declare-fun e!465414 () Bool)

(assert (=> b!834203 (=> (not res!567238) (not e!465414))))

(declare-datatypes ((array!46684 0))(
  ( (array!46685 (arr!22376 (Array (_ BitVec 32) (_ BitVec 64))) (size!22797 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46684)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834203 (= res!567238 (not (validKeyInArray!0 (select (arr!22376 a!4227) i!1466))))))

(declare-fun b!834205 () Bool)

(declare-fun res!567237 () Bool)

(assert (=> b!834205 (=> (not res!567237) (not e!465414))))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834205 (= res!567237 (and (bvslt (size!22797 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22797 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun res!567239 () Bool)

(assert (=> start!71774 (=> (not res!567239) (not e!465414))))

(assert (=> start!71774 (= res!567239 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22797 a!4227))))))

(assert (=> start!71774 e!465414))

(assert (=> start!71774 true))

(declare-fun array_inv!17823 (array!46684) Bool)

(assert (=> start!71774 (array_inv!17823 a!4227)))

(declare-fun b!834204 () Bool)

(declare-fun res!567236 () Bool)

(assert (=> b!834204 (=> (not res!567236) (not e!465414))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!834204 (= res!567236 (validKeyInArray!0 k!2968))))

(declare-fun b!834206 () Bool)

(assert (=> b!834206 (= e!465414 false)))

(declare-fun lt!378823 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46684 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834206 (= lt!378823 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!378822 () (_ BitVec 32))

(assert (=> b!834206 (= lt!378822 (arrayCountValidKeys!0 (array!46685 (store (arr!22376 a!4227) i!1466 k!2968) (size!22797 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (= (and start!71774 res!567239) b!834203))

(assert (= (and b!834203 res!567238) b!834204))

(assert (= (and b!834204 res!567236) b!834205))

(assert (= (and b!834205 res!567237) b!834206))

(declare-fun m!779147 () Bool)

(assert (=> b!834203 m!779147))

(assert (=> b!834203 m!779147))

(declare-fun m!779149 () Bool)

(assert (=> b!834203 m!779149))

(declare-fun m!779151 () Bool)

(assert (=> start!71774 m!779151))

(declare-fun m!779153 () Bool)

(assert (=> b!834204 m!779153))

(declare-fun m!779155 () Bool)

(assert (=> b!834206 m!779155))

(declare-fun m!779157 () Bool)

(assert (=> b!834206 m!779157))

(declare-fun m!779159 () Bool)

(assert (=> b!834206 m!779159))

(push 1)

(assert (not b!834204))

(assert (not b!834203))

(assert (not start!71774))

(assert (not b!834206))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

