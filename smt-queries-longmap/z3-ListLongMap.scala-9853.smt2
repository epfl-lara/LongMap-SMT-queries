; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116806 () Bool)

(assert start!116806)

(declare-fun b!1376500 () Bool)

(declare-fun res!919386 () Bool)

(declare-fun e!779752 () Bool)

(assert (=> b!1376500 (=> (not res!919386) (not e!779752))))

(declare-datatypes ((array!93475 0))(
  ( (array!93476 (arr!45141 (Array (_ BitVec 32) (_ BitVec 64))) (size!45691 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93475)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376500 (= res!919386 (validKeyInArray!0 (select (arr!45141 a!4032) to!206)))))

(declare-fun b!1376501 () Bool)

(declare-fun res!919388 () Bool)

(assert (=> b!1376501 (=> (not res!919388) (not e!779752))))

(declare-fun i!1445 () (_ BitVec 32))

(assert (=> b!1376501 (= res!919388 (and (bvslt (size!45691 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45691 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376502 () Bool)

(declare-fun res!919390 () Bool)

(assert (=> b!1376502 (=> (not res!919390) (not e!779752))))

(assert (=> b!1376502 (= res!919390 (validKeyInArray!0 (select (arr!45141 a!4032) i!1445)))))

(declare-fun res!919387 () Bool)

(assert (=> start!116806 (=> (not res!919387) (not e!779752))))

(assert (=> start!116806 (= res!919387 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45691 a!4032))))))

(assert (=> start!116806 e!779752))

(assert (=> start!116806 true))

(declare-fun array_inv!34169 (array!93475) Bool)

(assert (=> start!116806 (array_inv!34169 a!4032)))

(declare-fun b!1376503 () Bool)

(assert (=> b!1376503 (= e!779752 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000) (bvsge to!206 (size!45691 a!4032))))))

(declare-fun b!1376504 () Bool)

(declare-fun res!919385 () Bool)

(assert (=> b!1376504 (=> (not res!919385) (not e!779752))))

(declare-fun k0!2947 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93475 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376504 (= res!919385 (= (arrayCountValidKeys!0 (array!93476 (store (arr!45141 a!4032) i!1445 k0!2947) (size!45691 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(declare-fun b!1376505 () Bool)

(declare-fun res!919389 () Bool)

(assert (=> b!1376505 (=> (not res!919389) (not e!779752))))

(assert (=> b!1376505 (= res!919389 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1376506 () Bool)

(declare-fun res!919384 () Bool)

(assert (=> b!1376506 (=> (not res!919384) (not e!779752))))

(assert (=> b!1376506 (= res!919384 (not (= to!206 (size!45691 a!4032))))))

(assert (= (and start!116806 res!919387) b!1376502))

(assert (= (and b!1376502 res!919390) b!1376505))

(assert (= (and b!1376505 res!919389) b!1376501))

(assert (= (and b!1376501 res!919388) b!1376504))

(assert (= (and b!1376504 res!919385) b!1376506))

(assert (= (and b!1376506 res!919384) b!1376500))

(assert (= (and b!1376500 res!919386) b!1376503))

(declare-fun m!1260553 () Bool)

(assert (=> b!1376502 m!1260553))

(assert (=> b!1376502 m!1260553))

(declare-fun m!1260555 () Bool)

(assert (=> b!1376502 m!1260555))

(declare-fun m!1260557 () Bool)

(assert (=> b!1376504 m!1260557))

(declare-fun m!1260559 () Bool)

(assert (=> b!1376504 m!1260559))

(declare-fun m!1260561 () Bool)

(assert (=> b!1376504 m!1260561))

(declare-fun m!1260563 () Bool)

(assert (=> b!1376500 m!1260563))

(assert (=> b!1376500 m!1260563))

(declare-fun m!1260565 () Bool)

(assert (=> b!1376500 m!1260565))

(declare-fun m!1260567 () Bool)

(assert (=> b!1376505 m!1260567))

(declare-fun m!1260569 () Bool)

(assert (=> start!116806 m!1260569))

(check-sat (not b!1376504) (not start!116806) (not b!1376505) (not b!1376500) (not b!1376502))
(check-sat)
