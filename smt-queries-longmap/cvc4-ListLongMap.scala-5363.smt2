; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71780 () Bool)

(assert start!71780)

(declare-fun b!834255 () Bool)

(declare-fun res!567292 () Bool)

(declare-fun e!465440 () Bool)

(assert (=> b!834255 (=> (not res!567292) (not e!465440))))

(declare-datatypes ((array!46690 0))(
  ( (array!46691 (arr!22379 (Array (_ BitVec 32) (_ BitVec 64))) (size!22800 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46690)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834255 (= res!567292 (not (validKeyInArray!0 (select (arr!22379 a!4227) i!1466))))))

(declare-fun b!834256 () Bool)

(declare-fun res!567293 () Bool)

(declare-fun e!465439 () Bool)

(assert (=> b!834256 (=> (not res!567293) (not e!465439))))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834256 (= res!567293 (not (validKeyInArray!0 (select (arr!22379 a!4227) to!390))))))

(declare-fun b!834257 () Bool)

(declare-fun res!567288 () Bool)

(assert (=> b!834257 (=> (not res!567288) (not e!465440))))

(assert (=> b!834257 (= res!567288 (and (bvslt (size!22800 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22800 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834258 () Bool)

(assert (=> b!834258 (= e!465440 e!465439)))

(declare-fun res!567290 () Bool)

(assert (=> b!834258 (=> (not res!567290) (not e!465439))))

(declare-fun lt!378850 () (_ BitVec 32))

(declare-fun lt!378848 () (_ BitVec 32))

(assert (=> b!834258 (= res!567290 (and (= lt!378850 lt!378848) (not (= to!390 (size!22800 a!4227)))))))

(declare-fun arrayCountValidKeys!0 (array!46690 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834258 (= lt!378848 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!834258 (= lt!378850 (arrayCountValidKeys!0 (array!46691 (store (arr!22379 a!4227) i!1466 k!2968) (size!22800 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun res!567291 () Bool)

(assert (=> start!71780 (=> (not res!567291) (not e!465440))))

(assert (=> start!71780 (= res!567291 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22800 a!4227))))))

(assert (=> start!71780 e!465440))

(assert (=> start!71780 true))

(declare-fun array_inv!17826 (array!46690) Bool)

(assert (=> start!71780 (array_inv!17826 a!4227)))

(declare-fun b!834259 () Bool)

(assert (=> b!834259 (= e!465439 (not true))))

(assert (=> b!834259 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) lt!378848)))

(declare-datatypes ((Unit!28651 0))(
  ( (Unit!28652) )
))
(declare-fun lt!378849 () Unit!28651)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46690 (_ BitVec 32) (_ BitVec 32)) Unit!28651)

(assert (=> b!834259 (= lt!378849 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!834260 () Bool)

(declare-fun res!567289 () Bool)

(assert (=> b!834260 (=> (not res!567289) (not e!465440))))

(assert (=> b!834260 (= res!567289 (validKeyInArray!0 k!2968))))

(assert (= (and start!71780 res!567291) b!834255))

(assert (= (and b!834255 res!567292) b!834260))

(assert (= (and b!834260 res!567289) b!834257))

(assert (= (and b!834257 res!567288) b!834258))

(assert (= (and b!834258 res!567290) b!834256))

(assert (= (and b!834256 res!567293) b!834259))

(declare-fun m!779205 () Bool)

(assert (=> b!834260 m!779205))

(declare-fun m!779207 () Bool)

(assert (=> start!71780 m!779207))

(declare-fun m!779209 () Bool)

(assert (=> b!834259 m!779209))

(declare-fun m!779211 () Bool)

(assert (=> b!834259 m!779211))

(declare-fun m!779213 () Bool)

(assert (=> b!834255 m!779213))

(assert (=> b!834255 m!779213))

(declare-fun m!779215 () Bool)

(assert (=> b!834255 m!779215))

(declare-fun m!779217 () Bool)

(assert (=> b!834256 m!779217))

(assert (=> b!834256 m!779217))

(declare-fun m!779219 () Bool)

(assert (=> b!834256 m!779219))

(declare-fun m!779221 () Bool)

(assert (=> b!834258 m!779221))

(declare-fun m!779223 () Bool)

(assert (=> b!834258 m!779223))

(declare-fun m!779225 () Bool)

(assert (=> b!834258 m!779225))

(push 1)

(assert (not b!834255))

(assert (not b!834256))

(assert (not b!834260))

(assert (not b!834259))

(assert (not b!834258))

(assert (not start!71780))

(check-sat)

(pop 1)

