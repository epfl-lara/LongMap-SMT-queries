; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116674 () Bool)

(assert start!116674)

(declare-fun res!918296 () Bool)

(declare-fun e!779052 () Bool)

(assert (=> start!116674 (=> (not res!918296) (not e!779052))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93297 0))(
  ( (array!93298 (arr!45052 (Array (_ BitVec 32) (_ BitVec 64))) (size!45604 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93297)

(assert (=> start!116674 (= res!918296 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45604 a!4032))))))

(assert (=> start!116674 e!779052))

(assert (=> start!116674 true))

(declare-fun array_inv!34285 (array!93297) Bool)

(assert (=> start!116674 (array_inv!34285 a!4032)))

(declare-fun b!1375195 () Bool)

(declare-fun res!918294 () Bool)

(assert (=> b!1375195 (=> (not res!918294) (not e!779052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375195 (= res!918294 (validKeyInArray!0 (select (arr!45052 a!4032) i!1445)))))

(declare-fun b!1375196 () Bool)

(declare-fun res!918295 () Bool)

(assert (=> b!1375196 (=> (not res!918295) (not e!779052))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1375196 (= res!918295 (not (validKeyInArray!0 k0!2947)))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun b!1375197 () Bool)

(assert (=> b!1375197 (= e!779052 (and (bvslt (size!45604 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45604 a!4032)) (bvsgt to!206 i!1445) (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(assert (= (and start!116674 res!918296) b!1375195))

(assert (= (and b!1375195 res!918294) b!1375196))

(assert (= (and b!1375196 res!918295) b!1375197))

(declare-fun m!1258569 () Bool)

(assert (=> start!116674 m!1258569))

(declare-fun m!1258571 () Bool)

(assert (=> b!1375195 m!1258571))

(assert (=> b!1375195 m!1258571))

(declare-fun m!1258573 () Bool)

(assert (=> b!1375195 m!1258573))

(declare-fun m!1258575 () Bool)

(assert (=> b!1375196 m!1258575))

(check-sat (not b!1375195) (not b!1375196) (not start!116674))
(check-sat)
