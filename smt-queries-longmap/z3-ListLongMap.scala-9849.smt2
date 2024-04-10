; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116782 () Bool)

(assert start!116782)

(declare-fun res!919204 () Bool)

(declare-fun e!779680 () Bool)

(assert (=> start!116782 (=> (not res!919204) (not e!779680))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93451 0))(
  ( (array!93452 (arr!45129 (Array (_ BitVec 32) (_ BitVec 64))) (size!45679 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93451)

(assert (=> start!116782 (= res!919204 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45679 a!4032))))))

(assert (=> start!116782 e!779680))

(assert (=> start!116782 true))

(declare-fun array_inv!34157 (array!93451) Bool)

(assert (=> start!116782 (array_inv!34157 a!4032)))

(declare-fun b!1376319 () Bool)

(declare-fun res!919203 () Bool)

(assert (=> b!1376319 (=> (not res!919203) (not e!779680))))

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1376319 (= res!919203 (and (bvslt (size!45679 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45679 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376320 () Bool)

(declare-fun res!919205 () Bool)

(assert (=> b!1376320 (=> (not res!919205) (not e!779680))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376320 (= res!919205 (validKeyInArray!0 (select (arr!45129 a!4032) i!1445)))))

(declare-fun b!1376321 () Bool)

(declare-fun res!919206 () Bool)

(assert (=> b!1376321 (=> (not res!919206) (not e!779680))))

(declare-fun k0!2947 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93451 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376321 (= res!919206 (= (arrayCountValidKeys!0 (array!93452 (store (arr!45129 a!4032) i!1445 k0!2947) (size!45679 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(declare-fun b!1376322 () Bool)

(declare-fun res!919207 () Bool)

(assert (=> b!1376322 (=> (not res!919207) (not e!779680))))

(assert (=> b!1376322 (= res!919207 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1376323 () Bool)

(assert (=> b!1376323 (= e!779680 (and (= to!206 (size!45679 a!4032)) (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(assert (= (and start!116782 res!919204) b!1376320))

(assert (= (and b!1376320 res!919205) b!1376322))

(assert (= (and b!1376322 res!919207) b!1376319))

(assert (= (and b!1376319 res!919203) b!1376321))

(assert (= (and b!1376321 res!919206) b!1376323))

(declare-fun m!1260381 () Bool)

(assert (=> start!116782 m!1260381))

(declare-fun m!1260383 () Bool)

(assert (=> b!1376320 m!1260383))

(assert (=> b!1376320 m!1260383))

(declare-fun m!1260385 () Bool)

(assert (=> b!1376320 m!1260385))

(declare-fun m!1260387 () Bool)

(assert (=> b!1376321 m!1260387))

(declare-fun m!1260389 () Bool)

(assert (=> b!1376321 m!1260389))

(declare-fun m!1260391 () Bool)

(assert (=> b!1376321 m!1260391))

(declare-fun m!1260393 () Bool)

(assert (=> b!1376322 m!1260393))

(check-sat (not b!1376321) (not b!1376322) (not b!1376320) (not start!116782))
(check-sat)
