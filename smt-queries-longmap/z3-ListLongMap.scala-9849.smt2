; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117010 () Bool)

(assert start!117010)

(declare-fun b!1377618 () Bool)

(declare-fun res!919713 () Bool)

(declare-fun e!780526 () Bool)

(assert (=> b!1377618 (=> (not res!919713) (not e!780526))))

(declare-datatypes ((array!93565 0))(
  ( (array!93566 (arr!45181 (Array (_ BitVec 32) (_ BitVec 64))) (size!45732 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93565)

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377618 (= res!919713 (validKeyInArray!0 (select (arr!45181 a!4032) i!1445)))))

(declare-fun b!1377619 () Bool)

(declare-fun res!919710 () Bool)

(assert (=> b!1377619 (=> (not res!919710) (not e!780526))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun k0!2947 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93565 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377619 (= res!919710 (= (arrayCountValidKeys!0 (array!93566 (store (arr!45181 a!4032) i!1445 k0!2947) (size!45732 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(declare-fun b!1377620 () Bool)

(declare-fun res!919712 () Bool)

(assert (=> b!1377620 (=> (not res!919712) (not e!780526))))

(assert (=> b!1377620 (= res!919712 (and (bvslt (size!45732 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45732 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377622 () Bool)

(assert (=> b!1377622 (= e!780526 (and (= to!206 (size!45732 a!4032)) (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(declare-fun b!1377621 () Bool)

(declare-fun res!919709 () Bool)

(assert (=> b!1377621 (=> (not res!919709) (not e!780526))))

(assert (=> b!1377621 (= res!919709 (not (validKeyInArray!0 k0!2947)))))

(declare-fun res!919711 () Bool)

(assert (=> start!117010 (=> (not res!919711) (not e!780526))))

(assert (=> start!117010 (= res!919711 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45732 a!4032))))))

(assert (=> start!117010 e!780526))

(assert (=> start!117010 true))

(declare-fun array_inv!34462 (array!93565) Bool)

(assert (=> start!117010 (array_inv!34462 a!4032)))

(assert (= (and start!117010 res!919711) b!1377618))

(assert (= (and b!1377618 res!919713) b!1377621))

(assert (= (and b!1377621 res!919709) b!1377620))

(assert (= (and b!1377620 res!919712) b!1377619))

(assert (= (and b!1377619 res!919710) b!1377622))

(declare-fun m!1262007 () Bool)

(assert (=> b!1377618 m!1262007))

(assert (=> b!1377618 m!1262007))

(declare-fun m!1262009 () Bool)

(assert (=> b!1377618 m!1262009))

(declare-fun m!1262011 () Bool)

(assert (=> b!1377619 m!1262011))

(declare-fun m!1262013 () Bool)

(assert (=> b!1377619 m!1262013))

(declare-fun m!1262015 () Bool)

(assert (=> b!1377619 m!1262015))

(declare-fun m!1262017 () Bool)

(assert (=> b!1377621 m!1262017))

(declare-fun m!1262019 () Bool)

(assert (=> start!117010 m!1262019))

(check-sat (not start!117010) (not b!1377618) (not b!1377619) (not b!1377621))
(check-sat)
