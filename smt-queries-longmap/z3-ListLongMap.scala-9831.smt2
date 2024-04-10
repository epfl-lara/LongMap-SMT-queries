; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116674 () Bool)

(assert start!116674)

(declare-fun res!918303 () Bool)

(declare-fun e!779068 () Bool)

(assert (=> start!116674 (=> (not res!918303) (not e!779068))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93343 0))(
  ( (array!93344 (arr!45075 (Array (_ BitVec 32) (_ BitVec 64))) (size!45625 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93343)

(assert (=> start!116674 (= res!918303 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45625 a!4032))))))

(assert (=> start!116674 e!779068))

(assert (=> start!116674 true))

(declare-fun array_inv!34103 (array!93343) Bool)

(assert (=> start!116674 (array_inv!34103 a!4032)))

(declare-fun b!1375238 () Bool)

(declare-fun res!918304 () Bool)

(assert (=> b!1375238 (=> (not res!918304) (not e!779068))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375238 (= res!918304 (validKeyInArray!0 (select (arr!45075 a!4032) i!1445)))))

(declare-fun b!1375239 () Bool)

(declare-fun res!918302 () Bool)

(assert (=> b!1375239 (=> (not res!918302) (not e!779068))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1375239 (= res!918302 (not (validKeyInArray!0 k0!2947)))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun b!1375240 () Bool)

(assert (=> b!1375240 (= e!779068 (and (bvslt (size!45625 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45625 a!4032)) (bvsgt to!206 i!1445) (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(assert (= (and start!116674 res!918303) b!1375238))

(assert (= (and b!1375238 res!918304) b!1375239))

(assert (= (and b!1375239 res!918302) b!1375240))

(declare-fun m!1259055 () Bool)

(assert (=> start!116674 m!1259055))

(declare-fun m!1259057 () Bool)

(assert (=> b!1375238 m!1259057))

(assert (=> b!1375238 m!1259057))

(declare-fun m!1259059 () Bool)

(assert (=> b!1375238 m!1259059))

(declare-fun m!1259061 () Bool)

(assert (=> b!1375239 m!1259061))

(check-sat (not b!1375239) (not b!1375238) (not start!116674))
(check-sat)
