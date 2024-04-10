; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116496 () Bool)

(assert start!116496)

(declare-fun b!1374174 () Bool)

(declare-fun e!778477 () Bool)

(declare-fun e!778475 () Bool)

(assert (=> b!1374174 (= e!778477 (not e!778475))))

(declare-fun res!917359 () Bool)

(assert (=> b!1374174 (=> res!917359 e!778475)))

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1374174 (= res!917359 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(declare-datatypes ((array!93196 0))(
  ( (array!93197 (arr!45004 (Array (_ BitVec 32) (_ BitVec 64))) (size!45554 (_ BitVec 32))) )
))
(declare-fun lt!603302 () array!93196)

(declare-fun a!4142 () array!93196)

(declare-fun arrayCountValidKeys!0 (array!93196 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374174 (= (arrayCountValidKeys!0 lt!603302 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1374174 (= lt!603302 (array!93197 (store (arr!45004 a!4142) i!1457 k!2959) (size!45554 a!4142)))))

(declare-datatypes ((Unit!45409 0))(
  ( (Unit!45410) )
))
(declare-fun lt!603301 () Unit!45409)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93196 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45409)

(assert (=> b!1374174 (= lt!603301 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374175 () Bool)

(declare-fun res!917360 () Bool)

(assert (=> b!1374175 (=> (not res!917360) (not e!778477))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374175 (= res!917360 (validKeyInArray!0 (select (arr!45004 a!4142) i!1457)))))

(declare-fun b!1374176 () Bool)

(assert (=> b!1374176 (= e!778475 true)))

(declare-fun lt!603303 () (_ BitVec 32))

(assert (=> b!1374176 (= lt!603303 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603304 () (_ BitVec 32))

(assert (=> b!1374176 (= lt!603304 (arrayCountValidKeys!0 lt!603302 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun res!917361 () Bool)

(assert (=> start!116496 (=> (not res!917361) (not e!778477))))

(assert (=> start!116496 (= res!917361 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45554 a!4142))))))

(assert (=> start!116496 e!778477))

(assert (=> start!116496 true))

(declare-fun array_inv!34032 (array!93196) Bool)

(assert (=> start!116496 (array_inv!34032 a!4142)))

(declare-fun b!1374177 () Bool)

(declare-fun res!917362 () Bool)

(assert (=> b!1374177 (=> (not res!917362) (not e!778477))))

(assert (=> b!1374177 (= res!917362 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374178 () Bool)

(declare-fun res!917358 () Bool)

(assert (=> b!1374178 (=> (not res!917358) (not e!778477))))

(assert (=> b!1374178 (= res!917358 (bvslt (size!45554 a!4142) #b01111111111111111111111111111111))))

(assert (= (and start!116496 res!917361) b!1374175))

(assert (= (and b!1374175 res!917360) b!1374177))

(assert (= (and b!1374177 res!917362) b!1374178))

(assert (= (and b!1374178 res!917358) b!1374174))

(assert (= (and b!1374174 (not res!917359)) b!1374176))

(declare-fun m!1257413 () Bool)

(assert (=> b!1374177 m!1257413))

(declare-fun m!1257415 () Bool)

(assert (=> b!1374174 m!1257415))

(declare-fun m!1257417 () Bool)

(assert (=> b!1374174 m!1257417))

(declare-fun m!1257419 () Bool)

(assert (=> b!1374174 m!1257419))

(declare-fun m!1257421 () Bool)

(assert (=> b!1374174 m!1257421))

(declare-fun m!1257423 () Bool)

(assert (=> start!116496 m!1257423))

(declare-fun m!1257425 () Bool)

(assert (=> b!1374175 m!1257425))

(assert (=> b!1374175 m!1257425))

(declare-fun m!1257427 () Bool)

(assert (=> b!1374175 m!1257427))

(declare-fun m!1257429 () Bool)

(assert (=> b!1374176 m!1257429))

(declare-fun m!1257431 () Bool)

(assert (=> b!1374176 m!1257431))

(push 1)

(assert (not b!1374175))

(assert (not b!1374174))

(assert (not start!116496))

(assert (not b!1374177))

(assert (not b!1374176))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

