; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116696 () Bool)

(assert start!116696)

(declare-fun b!1375338 () Bool)

(declare-fun res!918439 () Bool)

(declare-fun e!779127 () Bool)

(assert (=> b!1375338 (=> (not res!918439) (not e!779127))))

(declare-datatypes ((array!93319 0))(
  ( (array!93320 (arr!45063 (Array (_ BitVec 32) (_ BitVec 64))) (size!45615 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93319)

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375338 (= res!918439 (validKeyInArray!0 (select (arr!45063 a!4032) i!1445)))))

(declare-fun res!918438 () Bool)

(assert (=> start!116696 (=> (not res!918438) (not e!779127))))

(assert (=> start!116696 (= res!918438 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45615 a!4032))))))

(assert (=> start!116696 e!779127))

(assert (=> start!116696 true))

(declare-fun array_inv!34296 (array!93319) Bool)

(assert (=> start!116696 (array_inv!34296 a!4032)))

(declare-fun b!1375339 () Bool)

(declare-fun res!918440 () Bool)

(assert (=> b!1375339 (=> (not res!918440) (not e!779127))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1375339 (= res!918440 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1375340 () Bool)

(declare-fun res!918437 () Bool)

(assert (=> b!1375340 (=> (not res!918437) (not e!779127))))

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1375340 (= res!918437 (and (bvslt (size!45615 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45615 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375341 () Bool)

(assert (=> b!1375341 (= e!779127 false)))

(declare-fun lt!604175 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93319 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375341 (= lt!604175 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!604174 () (_ BitVec 32))

(assert (=> b!1375341 (= lt!604174 (arrayCountValidKeys!0 (array!93320 (store (arr!45063 a!4032) i!1445 k!2947) (size!45615 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (= (and start!116696 res!918438) b!1375338))

(assert (= (and b!1375338 res!918439) b!1375339))

(assert (= (and b!1375339 res!918440) b!1375340))

(assert (= (and b!1375340 res!918437) b!1375341))

(declare-fun m!1258729 () Bool)

(assert (=> b!1375338 m!1258729))

(assert (=> b!1375338 m!1258729))

(declare-fun m!1258731 () Bool)

(assert (=> b!1375338 m!1258731))

(declare-fun m!1258733 () Bool)

(assert (=> start!116696 m!1258733))

(declare-fun m!1258735 () Bool)

(assert (=> b!1375339 m!1258735))

(declare-fun m!1258737 () Bool)

(assert (=> b!1375341 m!1258737))

(declare-fun m!1258739 () Bool)

(assert (=> b!1375341 m!1258739))

(declare-fun m!1258741 () Bool)

(assert (=> b!1375341 m!1258741))

(push 1)

(assert (not start!116696))

(assert (not b!1375338))

(assert (not b!1375339))

(assert (not b!1375341))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

