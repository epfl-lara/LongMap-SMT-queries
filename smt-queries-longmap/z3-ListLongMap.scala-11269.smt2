; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131458 () Bool)

(assert start!131458)

(declare-fun b!1540902 () Bool)

(declare-fun res!1057449 () Bool)

(declare-fun e!856993 () Bool)

(assert (=> b!1540902 (=> (not res!1057449) (not e!856993))))

(declare-datatypes ((array!102361 0))(
  ( (array!102362 (arr!49389 (Array (_ BitVec 32) (_ BitVec 64))) (size!49939 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102361)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102361 (_ BitVec 32)) Bool)

(assert (=> b!1540902 (= res!1057449 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1540901 () Bool)

(declare-fun res!1057450 () Bool)

(assert (=> b!1540901 (=> (not res!1057450) (not e!856993))))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1540901 (= res!1057450 (and (= (size!49939 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49939 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49939 a!3920))))))

(declare-fun res!1057448 () Bool)

(assert (=> start!131458 (=> (not res!1057448) (not e!856993))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131458 (= res!1057448 (validMask!0 mask!4052))))

(assert (=> start!131458 e!856993))

(assert (=> start!131458 true))

(declare-fun array_inv!38417 (array!102361) Bool)

(assert (=> start!131458 (array_inv!38417 a!3920)))

(declare-fun b!1540903 () Bool)

(declare-fun res!1057447 () Bool)

(assert (=> b!1540903 (=> (not res!1057447) (not e!856993))))

(assert (=> b!1540903 (= res!1057447 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49939 a!3920))))))

(declare-fun b!1540904 () Bool)

(assert (=> b!1540904 (= e!856993 false)))

(declare-fun lt!665539 () Bool)

(assert (=> b!1540904 (= lt!665539 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(assert (= (and start!131458 res!1057448) b!1540901))

(assert (= (and b!1540901 res!1057450) b!1540902))

(assert (= (and b!1540902 res!1057449) b!1540903))

(assert (= (and b!1540903 res!1057447) b!1540904))

(declare-fun m!1422971 () Bool)

(assert (=> b!1540902 m!1422971))

(declare-fun m!1422973 () Bool)

(assert (=> start!131458 m!1422973))

(declare-fun m!1422975 () Bool)

(assert (=> start!131458 m!1422975))

(declare-fun m!1422977 () Bool)

(assert (=> b!1540904 m!1422977))

(check-sat (not b!1540902) (not start!131458) (not b!1540904))
