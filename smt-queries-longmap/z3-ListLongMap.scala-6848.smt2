; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86280 () Bool)

(assert start!86280)

(declare-fun b!998514 () Bool)

(declare-fun res!668280 () Bool)

(declare-fun e!563077 () Bool)

(assert (=> b!998514 (=> (not res!668280) (not e!563077))))

(declare-datatypes ((array!63079 0))(
  ( (array!63080 (arr!30366 (Array (_ BitVec 32) (_ BitVec 64))) (size!30870 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63079)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998514 (= res!668280 (validKeyInArray!0 (select (arr!30366 a!3219) j!170)))))

(declare-fun b!998515 () Bool)

(declare-fun res!668283 () Bool)

(declare-fun e!563075 () Bool)

(assert (=> b!998515 (=> (not res!668283) (not e!563075))))

(declare-datatypes ((List!21108 0))(
  ( (Nil!21105) (Cons!21104 (h!22278 (_ BitVec 64)) (t!30100 List!21108)) )
))
(declare-fun arrayNoDuplicates!0 (array!63079 (_ BitVec 32) List!21108) Bool)

(assert (=> b!998515 (= res!668283 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21105))))

(declare-fun b!998516 () Bool)

(declare-fun e!563076 () Bool)

(assert (=> b!998516 (= e!563076 false)))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun lt!441572 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998516 (= lt!441572 (toIndex!0 (select (store (arr!30366 a!3219) i!1194 k0!2224) j!170) mask!3464))))

(declare-fun b!998517 () Bool)

(assert (=> b!998517 (= e!563077 e!563075)))

(declare-fun res!668282 () Bool)

(assert (=> b!998517 (=> (not res!668282) (not e!563075))))

(declare-datatypes ((SeekEntryResult!9323 0))(
  ( (MissingZero!9323 (index!39663 (_ BitVec 32))) (Found!9323 (index!39664 (_ BitVec 32))) (Intermediate!9323 (undefined!10135 Bool) (index!39665 (_ BitVec 32)) (x!87116 (_ BitVec 32))) (Undefined!9323) (MissingVacant!9323 (index!39666 (_ BitVec 32))) )
))
(declare-fun lt!441573 () SeekEntryResult!9323)

(assert (=> b!998517 (= res!668282 (or (= lt!441573 (MissingVacant!9323 i!1194)) (= lt!441573 (MissingZero!9323 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63079 (_ BitVec 32)) SeekEntryResult!9323)

(assert (=> b!998517 (= lt!441573 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!998518 () Bool)

(assert (=> b!998518 (= e!563075 e!563076)))

(declare-fun res!668279 () Bool)

(assert (=> b!998518 (=> (not res!668279) (not e!563076))))

(declare-fun lt!441574 () SeekEntryResult!9323)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63079 (_ BitVec 32)) SeekEntryResult!9323)

(assert (=> b!998518 (= res!668279 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30366 a!3219) j!170) mask!3464) (select (arr!30366 a!3219) j!170) a!3219 mask!3464) lt!441574))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998518 (= lt!441574 (Intermediate!9323 false resIndex!38 resX!38))))

(declare-fun b!998519 () Bool)

(declare-fun res!668278 () Bool)

(assert (=> b!998519 (=> (not res!668278) (not e!563077))))

(declare-fun arrayContainsKey!0 (array!63079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998519 (= res!668278 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun res!668281 () Bool)

(assert (=> start!86280 (=> (not res!668281) (not e!563077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86280 (= res!668281 (validMask!0 mask!3464))))

(assert (=> start!86280 e!563077))

(declare-fun array_inv!23509 (array!63079) Bool)

(assert (=> start!86280 (array_inv!23509 a!3219)))

(assert (=> start!86280 true))

(declare-fun b!998520 () Bool)

(declare-fun res!668276 () Bool)

(assert (=> b!998520 (=> (not res!668276) (not e!563075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63079 (_ BitVec 32)) Bool)

(assert (=> b!998520 (= res!668276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!998521 () Bool)

(declare-fun res!668284 () Bool)

(assert (=> b!998521 (=> (not res!668284) (not e!563077))))

(assert (=> b!998521 (= res!668284 (and (= (size!30870 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30870 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30870 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998522 () Bool)

(declare-fun res!668275 () Bool)

(assert (=> b!998522 (=> (not res!668275) (not e!563077))))

(assert (=> b!998522 (= res!668275 (validKeyInArray!0 k0!2224))))

(declare-fun b!998523 () Bool)

(declare-fun res!668277 () Bool)

(assert (=> b!998523 (=> (not res!668277) (not e!563075))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!998523 (= res!668277 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30870 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30870 a!3219))))))

(declare-fun b!998524 () Bool)

(declare-fun res!668285 () Bool)

(assert (=> b!998524 (=> (not res!668285) (not e!563076))))

(assert (=> b!998524 (= res!668285 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30366 a!3219) j!170) a!3219 mask!3464) lt!441574))))

(assert (= (and start!86280 res!668281) b!998521))

(assert (= (and b!998521 res!668284) b!998514))

(assert (= (and b!998514 res!668280) b!998522))

(assert (= (and b!998522 res!668275) b!998519))

(assert (= (and b!998519 res!668278) b!998517))

(assert (= (and b!998517 res!668282) b!998520))

(assert (= (and b!998520 res!668276) b!998515))

(assert (= (and b!998515 res!668283) b!998523))

(assert (= (and b!998523 res!668277) b!998518))

(assert (= (and b!998518 res!668279) b!998524))

(assert (= (and b!998524 res!668285) b!998516))

(declare-fun m!924403 () Bool)

(assert (=> b!998519 m!924403))

(declare-fun m!924405 () Bool)

(assert (=> b!998516 m!924405))

(declare-fun m!924407 () Bool)

(assert (=> b!998516 m!924407))

(assert (=> b!998516 m!924407))

(declare-fun m!924409 () Bool)

(assert (=> b!998516 m!924409))

(declare-fun m!924411 () Bool)

(assert (=> b!998517 m!924411))

(declare-fun m!924413 () Bool)

(assert (=> b!998515 m!924413))

(declare-fun m!924415 () Bool)

(assert (=> start!86280 m!924415))

(declare-fun m!924417 () Bool)

(assert (=> start!86280 m!924417))

(declare-fun m!924419 () Bool)

(assert (=> b!998520 m!924419))

(declare-fun m!924421 () Bool)

(assert (=> b!998524 m!924421))

(assert (=> b!998524 m!924421))

(declare-fun m!924423 () Bool)

(assert (=> b!998524 m!924423))

(assert (=> b!998514 m!924421))

(assert (=> b!998514 m!924421))

(declare-fun m!924425 () Bool)

(assert (=> b!998514 m!924425))

(declare-fun m!924427 () Bool)

(assert (=> b!998522 m!924427))

(assert (=> b!998518 m!924421))

(assert (=> b!998518 m!924421))

(declare-fun m!924429 () Bool)

(assert (=> b!998518 m!924429))

(assert (=> b!998518 m!924429))

(assert (=> b!998518 m!924421))

(declare-fun m!924431 () Bool)

(assert (=> b!998518 m!924431))

(check-sat (not b!998517) (not b!998519) (not b!998515) (not b!998518) (not b!998522) (not b!998516) (not b!998520) (not b!998524) (not start!86280) (not b!998514))
(check-sat)
