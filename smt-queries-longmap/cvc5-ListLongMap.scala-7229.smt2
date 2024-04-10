; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92436 () Bool)

(assert start!92436)

(declare-fun b!1050979 () Bool)

(declare-fun res!700111 () Bool)

(declare-fun e!596493 () Bool)

(assert (=> b!1050979 (=> (not res!700111) (not e!596493))))

(declare-datatypes ((array!66237 0))(
  ( (array!66238 (arr!31858 (Array (_ BitVec 32) (_ BitVec 64))) (size!32394 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66237)

(declare-datatypes ((List!22170 0))(
  ( (Nil!22167) (Cons!22166 (h!23375 (_ BitVec 64)) (t!31477 List!22170)) )
))
(declare-fun arrayNoDuplicates!0 (array!66237 (_ BitVec 32) List!22170) Bool)

(assert (=> b!1050979 (= res!700111 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22167))))

(declare-fun b!1050980 () Bool)

(declare-fun e!596495 () Bool)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050980 (= e!596495 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1050981 () Bool)

(declare-fun res!700112 () Bool)

(assert (=> b!1050981 (=> (not res!700112) (not e!596493))))

(assert (=> b!1050981 (= res!700112 (= (select (arr!31858 a!3488) i!1381) k!2747))))

(declare-fun b!1050982 () Bool)

(declare-fun e!596497 () Bool)

(assert (=> b!1050982 (= e!596497 e!596495)))

(declare-fun res!700105 () Bool)

(assert (=> b!1050982 (=> res!700105 e!596495)))

(declare-fun lt!464124 () (_ BitVec 32))

(assert (=> b!1050982 (= res!700105 (or (bvsgt lt!464124 i!1381) (bvsle i!1381 lt!464124)))))

(declare-fun b!1050983 () Bool)

(declare-fun e!596492 () Bool)

(assert (=> b!1050983 (= e!596493 e!596492)))

(declare-fun res!700107 () Bool)

(assert (=> b!1050983 (=> (not res!700107) (not e!596492))))

(declare-fun lt!464123 () array!66237)

(assert (=> b!1050983 (= res!700107 (arrayContainsKey!0 lt!464123 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050983 (= lt!464123 (array!66238 (store (arr!31858 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32394 a!3488)))))

(declare-fun b!1050984 () Bool)

(declare-fun e!596496 () Bool)

(assert (=> b!1050984 (= e!596496 (not true))))

(assert (=> b!1050984 e!596497))

(declare-fun res!700109 () Bool)

(assert (=> b!1050984 (=> (not res!700109) (not e!596497))))

(assert (=> b!1050984 (= res!700109 (= (select (store (arr!31858 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464124) k!2747))))

(declare-fun b!1050985 () Bool)

(assert (=> b!1050985 (= e!596492 e!596496)))

(declare-fun res!700108 () Bool)

(assert (=> b!1050985 (=> (not res!700108) (not e!596496))))

(assert (=> b!1050985 (= res!700108 (not (= lt!464124 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66237 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050985 (= lt!464124 (arrayScanForKey!0 lt!464123 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050986 () Bool)

(declare-fun res!700106 () Bool)

(assert (=> b!1050986 (=> (not res!700106) (not e!596493))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050986 (= res!700106 (validKeyInArray!0 k!2747))))

(declare-fun res!700110 () Bool)

(assert (=> start!92436 (=> (not res!700110) (not e!596493))))

(assert (=> start!92436 (= res!700110 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32394 a!3488)) (bvslt (size!32394 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92436 e!596493))

(assert (=> start!92436 true))

(declare-fun array_inv!24638 (array!66237) Bool)

(assert (=> start!92436 (array_inv!24638 a!3488)))

(assert (= (and start!92436 res!700110) b!1050979))

(assert (= (and b!1050979 res!700111) b!1050986))

(assert (= (and b!1050986 res!700106) b!1050981))

(assert (= (and b!1050981 res!700112) b!1050983))

(assert (= (and b!1050983 res!700107) b!1050985))

(assert (= (and b!1050985 res!700108) b!1050984))

(assert (= (and b!1050984 res!700109) b!1050982))

(assert (= (and b!1050982 (not res!700105)) b!1050980))

(declare-fun m!971573 () Bool)

(assert (=> b!1050983 m!971573))

(declare-fun m!971575 () Bool)

(assert (=> b!1050983 m!971575))

(assert (=> b!1050984 m!971575))

(declare-fun m!971577 () Bool)

(assert (=> b!1050984 m!971577))

(declare-fun m!971579 () Bool)

(assert (=> b!1050981 m!971579))

(declare-fun m!971581 () Bool)

(assert (=> start!92436 m!971581))

(declare-fun m!971583 () Bool)

(assert (=> b!1050980 m!971583))

(declare-fun m!971585 () Bool)

(assert (=> b!1050986 m!971585))

(declare-fun m!971587 () Bool)

(assert (=> b!1050979 m!971587))

(declare-fun m!971589 () Bool)

(assert (=> b!1050985 m!971589))

(push 1)

(assert (not b!1050979))

(assert (not b!1050986))

(assert (not start!92436))

(assert (not b!1050985))

(assert (not b!1050980))

(assert (not b!1050983))

(check-sat)

(pop 1)

