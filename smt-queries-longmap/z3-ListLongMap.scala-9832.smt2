; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116680 () Bool)

(assert start!116680)

(declare-fun res!918331 () Bool)

(declare-fun e!779085 () Bool)

(assert (=> start!116680 (=> (not res!918331) (not e!779085))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93349 0))(
  ( (array!93350 (arr!45078 (Array (_ BitVec 32) (_ BitVec 64))) (size!45628 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93349)

(assert (=> start!116680 (= res!918331 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45628 a!4032))))))

(assert (=> start!116680 e!779085))

(assert (=> start!116680 true))

(declare-fun array_inv!34106 (array!93349) Bool)

(assert (=> start!116680 (array_inv!34106 a!4032)))

(declare-fun b!1375265 () Bool)

(declare-fun res!918330 () Bool)

(assert (=> b!1375265 (=> (not res!918330) (not e!779085))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375265 (= res!918330 (validKeyInArray!0 (select (arr!45078 a!4032) i!1445)))))

(declare-fun b!1375266 () Bool)

(declare-fun res!918329 () Bool)

(assert (=> b!1375266 (=> (not res!918329) (not e!779085))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1375266 (= res!918329 (not (validKeyInArray!0 k0!2947)))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun b!1375267 () Bool)

(assert (=> b!1375267 (= e!779085 (and (bvslt (size!45628 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45628 a!4032)) (bvsgt to!206 i!1445) (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(assert (= (and start!116680 res!918331) b!1375265))

(assert (= (and b!1375265 res!918330) b!1375266))

(assert (= (and b!1375266 res!918329) b!1375267))

(declare-fun m!1259079 () Bool)

(assert (=> start!116680 m!1259079))

(declare-fun m!1259081 () Bool)

(assert (=> b!1375265 m!1259081))

(assert (=> b!1375265 m!1259081))

(declare-fun m!1259083 () Bool)

(assert (=> b!1375265 m!1259083))

(declare-fun m!1259085 () Bool)

(assert (=> b!1375266 m!1259085))

(check-sat (not start!116680) (not b!1375265) (not b!1375266))
(check-sat)
