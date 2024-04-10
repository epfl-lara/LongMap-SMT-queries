; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116686 () Bool)

(assert start!116686)

(declare-fun b!1375299 () Bool)

(declare-fun res!918363 () Bool)

(declare-fun e!779103 () Bool)

(assert (=> b!1375299 (=> (not res!918363) (not e!779103))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93355 0))(
  ( (array!93356 (arr!45081 (Array (_ BitVec 32) (_ BitVec 64))) (size!45631 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93355)

(assert (=> b!1375299 (= res!918363 (and (bvslt (size!45631 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45631 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun res!918362 () Bool)

(assert (=> start!116686 (=> (not res!918362) (not e!779103))))

(assert (=> start!116686 (= res!918362 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45631 a!4032))))))

(assert (=> start!116686 e!779103))

(assert (=> start!116686 true))

(declare-fun array_inv!34109 (array!93355) Bool)

(assert (=> start!116686 (array_inv!34109 a!4032)))

(declare-fun b!1375298 () Bool)

(declare-fun res!918361 () Bool)

(assert (=> b!1375298 (=> (not res!918361) (not e!779103))))

(declare-fun k0!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375298 (= res!918361 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1375297 () Bool)

(declare-fun res!918364 () Bool)

(assert (=> b!1375297 (=> (not res!918364) (not e!779103))))

(assert (=> b!1375297 (= res!918364 (validKeyInArray!0 (select (arr!45081 a!4032) i!1445)))))

(declare-fun b!1375300 () Bool)

(assert (=> b!1375300 (= e!779103 false)))

(declare-fun lt!604306 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93355 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375300 (= lt!604306 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!604305 () (_ BitVec 32))

(assert (=> b!1375300 (= lt!604305 (arrayCountValidKeys!0 (array!93356 (store (arr!45081 a!4032) i!1445 k0!2947) (size!45631 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (= (and start!116686 res!918362) b!1375297))

(assert (= (and b!1375297 res!918364) b!1375298))

(assert (= (and b!1375298 res!918361) b!1375299))

(assert (= (and b!1375299 res!918363) b!1375300))

(declare-fun m!1259109 () Bool)

(assert (=> start!116686 m!1259109))

(declare-fun m!1259111 () Bool)

(assert (=> b!1375298 m!1259111))

(declare-fun m!1259113 () Bool)

(assert (=> b!1375297 m!1259113))

(assert (=> b!1375297 m!1259113))

(declare-fun m!1259115 () Bool)

(assert (=> b!1375297 m!1259115))

(declare-fun m!1259117 () Bool)

(assert (=> b!1375300 m!1259117))

(declare-fun m!1259119 () Bool)

(assert (=> b!1375300 m!1259119))

(declare-fun m!1259121 () Bool)

(assert (=> b!1375300 m!1259121))

(check-sat (not start!116686) (not b!1375297) (not b!1375298) (not b!1375300))
