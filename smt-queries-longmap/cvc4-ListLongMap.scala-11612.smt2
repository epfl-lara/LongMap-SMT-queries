; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135494 () Bool)

(assert start!135494)

(declare-fun b!1574238 () Bool)

(declare-fun e!877918 () Bool)

(declare-datatypes ((array!105215 0))(
  ( (array!105216 (arr!50757 (Array (_ BitVec 32) (_ BitVec 64))) (size!51307 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105215)

(declare-fun i!537 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!105215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1574238 (= e!877918 (not (arrayContainsKey!0 _keys!591 (select (arr!50757 _keys!591) i!537) i!537)))))

(declare-fun res!1075529 () Bool)

(assert (=> start!135494 (=> (not res!1075529) (not e!877918))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135494 (= res!1075529 (validMask!0 mask!877))))

(assert (=> start!135494 e!877918))

(assert (=> start!135494 true))

(declare-fun array_inv!39484 (array!105215) Bool)

(assert (=> start!135494 (array_inv!39484 _keys!591)))

(declare-fun b!1574235 () Bool)

(declare-fun res!1075528 () Bool)

(assert (=> b!1574235 (=> (not res!1075528) (not e!877918))))

(assert (=> b!1574235 (= res!1075528 (and (= (size!51307 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51307 _keys!591)) (bvslt i!537 (size!51307 _keys!591))))))

(declare-fun b!1574237 () Bool)

(declare-fun res!1075530 () Bool)

(assert (=> b!1574237 (=> (not res!1075530) (not e!877918))))

(assert (=> b!1574237 (= res!1075530 (bvslt (size!51307 _keys!591) #b01111111111111111111111111111111))))

(declare-fun b!1574236 () Bool)

(declare-fun res!1075527 () Bool)

(assert (=> b!1574236 (=> (not res!1075527) (not e!877918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574236 (= res!1075527 (validKeyInArray!0 (select (arr!50757 _keys!591) i!537)))))

(assert (= (and start!135494 res!1075529) b!1574235))

(assert (= (and b!1574235 res!1075528) b!1574236))

(assert (= (and b!1574236 res!1075527) b!1574237))

(assert (= (and b!1574237 res!1075530) b!1574238))

(declare-fun m!1447485 () Bool)

(assert (=> b!1574238 m!1447485))

(assert (=> b!1574238 m!1447485))

(declare-fun m!1447487 () Bool)

(assert (=> b!1574238 m!1447487))

(declare-fun m!1447489 () Bool)

(assert (=> start!135494 m!1447489))

(declare-fun m!1447491 () Bool)

(assert (=> start!135494 m!1447491))

(assert (=> b!1574236 m!1447485))

(assert (=> b!1574236 m!1447485))

(declare-fun m!1447493 () Bool)

(assert (=> b!1574236 m!1447493))

(push 1)

(assert (not b!1574238))

(assert (not start!135494))

(assert (not b!1574236))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

