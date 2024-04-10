; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116770 () Bool)

(assert start!116770)

(declare-fun res!919122 () Bool)

(declare-fun e!779643 () Bool)

(assert (=> start!116770 (=> (not res!919122) (not e!779643))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93439 0))(
  ( (array!93440 (arr!45123 (Array (_ BitVec 32) (_ BitVec 64))) (size!45673 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93439)

(assert (=> start!116770 (= res!919122 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45673 a!4032))))))

(assert (=> start!116770 e!779643))

(assert (=> start!116770 true))

(declare-fun array_inv!34151 (array!93439) Bool)

(assert (=> start!116770 (array_inv!34151 a!4032)))

(declare-fun b!1376238 () Bool)

(declare-fun res!919126 () Bool)

(assert (=> b!1376238 (=> (not res!919126) (not e!779643))))

(declare-fun k0!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376238 (= res!919126 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1376239 () Bool)

(declare-fun res!919124 () Bool)

(assert (=> b!1376239 (=> (not res!919124) (not e!779643))))

(assert (=> b!1376239 (= res!919124 (validKeyInArray!0 (select (arr!45123 a!4032) i!1445)))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun b!1376240 () Bool)

(assert (=> b!1376240 (= e!779643 (and (= to!206 (size!45673 a!4032)) (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(declare-fun b!1376241 () Bool)

(declare-fun res!919125 () Bool)

(assert (=> b!1376241 (=> (not res!919125) (not e!779643))))

(assert (=> b!1376241 (= res!919125 (and (bvslt (size!45673 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45673 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376242 () Bool)

(declare-fun res!919123 () Bool)

(assert (=> b!1376242 (=> (not res!919123) (not e!779643))))

(declare-fun arrayCountValidKeys!0 (array!93439 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376242 (= res!919123 (= (arrayCountValidKeys!0 (array!93440 (store (arr!45123 a!4032) i!1445 k0!2947) (size!45673 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(assert (= (and start!116770 res!919122) b!1376239))

(assert (= (and b!1376239 res!919124) b!1376238))

(assert (= (and b!1376238 res!919126) b!1376241))

(assert (= (and b!1376241 res!919125) b!1376242))

(assert (= (and b!1376242 res!919123) b!1376240))

(declare-fun m!1260297 () Bool)

(assert (=> start!116770 m!1260297))

(declare-fun m!1260299 () Bool)

(assert (=> b!1376238 m!1260299))

(declare-fun m!1260301 () Bool)

(assert (=> b!1376239 m!1260301))

(assert (=> b!1376239 m!1260301))

(declare-fun m!1260303 () Bool)

(assert (=> b!1376239 m!1260303))

(declare-fun m!1260305 () Bool)

(assert (=> b!1376242 m!1260305))

(declare-fun m!1260307 () Bool)

(assert (=> b!1376242 m!1260307))

(declare-fun m!1260309 () Bool)

(assert (=> b!1376242 m!1260309))

(check-sat (not b!1376242) (not b!1376239) (not start!116770) (not b!1376238))
(check-sat)
