; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116684 () Bool)

(assert start!116684)

(declare-fun b!1375249 () Bool)

(declare-fun res!918348 () Bool)

(declare-fun e!779082 () Bool)

(assert (=> b!1375249 (=> (not res!918348) (not e!779082))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375249 (= res!918348 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1375250 () Bool)

(declare-fun res!918349 () Bool)

(assert (=> b!1375250 (=> (not res!918349) (not e!779082))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93307 0))(
  ( (array!93308 (arr!45057 (Array (_ BitVec 32) (_ BitVec 64))) (size!45609 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93307)

(assert (=> b!1375250 (= res!918349 (and (bvslt (size!45609 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45609 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375251 () Bool)

(assert (=> b!1375251 (= e!779082 false)))

(declare-fun lt!604130 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93307 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375251 (= lt!604130 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!604129 () (_ BitVec 32))

(assert (=> b!1375251 (= lt!604129 (arrayCountValidKeys!0 (array!93308 (store (arr!45057 a!4032) i!1445 k!2947) (size!45609 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1375248 () Bool)

(declare-fun res!918350 () Bool)

(assert (=> b!1375248 (=> (not res!918350) (not e!779082))))

(assert (=> b!1375248 (= res!918350 (validKeyInArray!0 (select (arr!45057 a!4032) i!1445)))))

(declare-fun res!918347 () Bool)

(assert (=> start!116684 (=> (not res!918347) (not e!779082))))

(assert (=> start!116684 (= res!918347 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45609 a!4032))))))

(assert (=> start!116684 e!779082))

(assert (=> start!116684 true))

(declare-fun array_inv!34290 (array!93307) Bool)

(assert (=> start!116684 (array_inv!34290 a!4032)))

(assert (= (and start!116684 res!918347) b!1375248))

(assert (= (and b!1375248 res!918350) b!1375249))

(assert (= (and b!1375249 res!918348) b!1375250))

(assert (= (and b!1375250 res!918349) b!1375251))

(declare-fun m!1258621 () Bool)

(assert (=> b!1375249 m!1258621))

(declare-fun m!1258623 () Bool)

(assert (=> b!1375251 m!1258623))

(declare-fun m!1258625 () Bool)

(assert (=> b!1375251 m!1258625))

(declare-fun m!1258627 () Bool)

(assert (=> b!1375251 m!1258627))

(declare-fun m!1258629 () Bool)

(assert (=> b!1375248 m!1258629))

(assert (=> b!1375248 m!1258629))

(declare-fun m!1258631 () Bool)

(assert (=> b!1375248 m!1258631))

(declare-fun m!1258633 () Bool)

(assert (=> start!116684 m!1258633))

(push 1)

(assert (not b!1375251))

(assert (not b!1375248))

(assert (not start!116684))

(assert (not b!1375249))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

