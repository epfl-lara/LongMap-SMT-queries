; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85664 () Bool)

(assert start!85664)

(declare-fun b!994389 () Bool)

(declare-fun e!561195 () Bool)

(declare-datatypes ((array!62883 0))(
  ( (array!62884 (arr!30281 (Array (_ BitVec 32) (_ BitVec 64))) (size!30783 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62883)

(assert (=> b!994389 (= e!561195 (bvsge #b00000000000000000000000000000000 (size!30783 a!3219)))))

(declare-fun b!994386 () Bool)

(declare-fun res!664894 () Bool)

(assert (=> b!994386 (=> (not res!664894) (not e!561195))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994386 (= res!664894 (and (= (size!30783 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30783 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30783 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994387 () Bool)

(declare-fun res!664896 () Bool)

(assert (=> b!994387 (=> (not res!664896) (not e!561195))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994387 (= res!664896 (validKeyInArray!0 (select (arr!30281 a!3219) j!170)))))

(declare-fun res!664895 () Bool)

(assert (=> start!85664 (=> (not res!664895) (not e!561195))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85664 (= res!664895 (validMask!0 mask!3464))))

(assert (=> start!85664 e!561195))

(declare-fun array_inv!23405 (array!62883) Bool)

(assert (=> start!85664 (array_inv!23405 a!3219)))

(assert (=> start!85664 true))

(declare-fun b!994388 () Bool)

(declare-fun res!664893 () Bool)

(assert (=> b!994388 (=> (not res!664893) (not e!561195))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!994388 (= res!664893 (validKeyInArray!0 k0!2224))))

(assert (= (and start!85664 res!664895) b!994386))

(assert (= (and b!994386 res!664894) b!994387))

(assert (= (and b!994387 res!664896) b!994388))

(assert (= (and b!994388 res!664893) b!994389))

(declare-fun m!921981 () Bool)

(assert (=> b!994387 m!921981))

(assert (=> b!994387 m!921981))

(declare-fun m!921983 () Bool)

(assert (=> b!994387 m!921983))

(declare-fun m!921985 () Bool)

(assert (=> start!85664 m!921985))

(declare-fun m!921987 () Bool)

(assert (=> start!85664 m!921987))

(declare-fun m!921989 () Bool)

(assert (=> b!994388 m!921989))

(check-sat (not b!994388) (not b!994387) (not start!85664))
(check-sat)
