; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31842 () Bool)

(assert start!31842)

(declare-fun b!318429 () Bool)

(declare-fun res!173067 () Bool)

(declare-fun e!197853 () Bool)

(assert (=> b!318429 (=> (not res!173067) (not e!197853))))

(declare-datatypes ((array!16226 0))(
  ( (array!16227 (arr!7678 (Array (_ BitVec 32) (_ BitVec 64))) (size!8030 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16226)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!318429 (= res!173067 (and (= (size!8030 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8030 a!3293))))))

(declare-fun b!318430 () Bool)

(declare-fun res!173059 () Bool)

(assert (=> b!318430 (=> (not res!173059) (not e!197853))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318430 (= res!173059 (validKeyInArray!0 k0!2441))))

(declare-fun b!318431 () Bool)

(declare-fun e!197854 () Bool)

(declare-fun e!197852 () Bool)

(assert (=> b!318431 (= e!197854 e!197852)))

(declare-fun res!173058 () Bool)

(assert (=> b!318431 (=> (not res!173058) (not e!197852))))

(declare-datatypes ((SeekEntryResult!2783 0))(
  ( (MissingZero!2783 (index!13308 (_ BitVec 32))) (Found!2783 (index!13309 (_ BitVec 32))) (Intermediate!2783 (undefined!3595 Bool) (index!13310 (_ BitVec 32)) (x!31669 (_ BitVec 32))) (Undefined!2783) (MissingVacant!2783 (index!13311 (_ BitVec 32))) )
))
(declare-fun lt!155388 () SeekEntryResult!2783)

(declare-fun lt!155387 () SeekEntryResult!2783)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!318431 (= res!173058 (and (= lt!155387 lt!155388) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7678 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16226 (_ BitVec 32)) SeekEntryResult!2783)

(assert (=> b!318431 (= lt!155387 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!318432 () Bool)

(assert (=> b!318432 (= e!197852 (not (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000))))))

(declare-fun e!197855 () Bool)

(assert (=> b!318432 e!197855))

(declare-fun res!173064 () Bool)

(assert (=> b!318432 (=> (not res!173064) (not e!197855))))

(declare-fun lt!155385 () (_ BitVec 32))

(assert (=> b!318432 (= res!173064 (= lt!155387 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155385 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318432 (= lt!155385 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun res!173063 () Bool)

(assert (=> start!31842 (=> (not res!173063) (not e!197853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31842 (= res!173063 (validMask!0 mask!3709))))

(assert (=> start!31842 e!197853))

(declare-fun array_inv!5628 (array!16226) Bool)

(assert (=> start!31842 (array_inv!5628 a!3293)))

(assert (=> start!31842 true))

(declare-fun b!318433 () Bool)

(declare-fun res!173061 () Bool)

(assert (=> b!318433 (=> (not res!173061) (not e!197853))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16226 (_ BitVec 32)) Bool)

(assert (=> b!318433 (= res!173061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!318434 () Bool)

(declare-fun res!173065 () Bool)

(assert (=> b!318434 (=> (not res!173065) (not e!197853))))

(declare-fun arrayContainsKey!0 (array!16226 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318434 (= res!173065 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318435 () Bool)

(assert (=> b!318435 (= e!197853 e!197854)))

(declare-fun res!173066 () Bool)

(assert (=> b!318435 (=> (not res!173066) (not e!197854))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318435 (= res!173066 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155388))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!318435 (= lt!155388 (Intermediate!2783 false resIndex!52 resX!52))))

(declare-fun b!318436 () Bool)

(declare-fun res!173062 () Bool)

(assert (=> b!318436 (=> (not res!173062) (not e!197854))))

(assert (=> b!318436 (= res!173062 (and (= (select (arr!7678 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8030 a!3293))))))

(declare-fun lt!155386 () array!16226)

(declare-fun b!318437 () Bool)

(assert (=> b!318437 (= e!197855 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155386 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155385 k0!2441 lt!155386 mask!3709)))))

(assert (=> b!318437 (= lt!155386 (array!16227 (store (arr!7678 a!3293) i!1240 k0!2441) (size!8030 a!3293)))))

(declare-fun b!318438 () Bool)

(declare-fun res!173060 () Bool)

(assert (=> b!318438 (=> (not res!173060) (not e!197853))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16226 (_ BitVec 32)) SeekEntryResult!2783)

(assert (=> b!318438 (= res!173060 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2783 i!1240)))))

(assert (= (and start!31842 res!173063) b!318429))

(assert (= (and b!318429 res!173067) b!318430))

(assert (= (and b!318430 res!173059) b!318434))

(assert (= (and b!318434 res!173065) b!318438))

(assert (= (and b!318438 res!173060) b!318433))

(assert (= (and b!318433 res!173061) b!318435))

(assert (= (and b!318435 res!173066) b!318436))

(assert (= (and b!318436 res!173062) b!318431))

(assert (= (and b!318431 res!173058) b!318432))

(assert (= (and b!318432 res!173064) b!318437))

(declare-fun m!327355 () Bool)

(assert (=> b!318434 m!327355))

(declare-fun m!327357 () Bool)

(assert (=> b!318437 m!327357))

(declare-fun m!327359 () Bool)

(assert (=> b!318437 m!327359))

(declare-fun m!327361 () Bool)

(assert (=> b!318437 m!327361))

(declare-fun m!327363 () Bool)

(assert (=> b!318438 m!327363))

(declare-fun m!327365 () Bool)

(assert (=> start!31842 m!327365))

(declare-fun m!327367 () Bool)

(assert (=> start!31842 m!327367))

(declare-fun m!327369 () Bool)

(assert (=> b!318432 m!327369))

(declare-fun m!327371 () Bool)

(assert (=> b!318432 m!327371))

(declare-fun m!327373 () Bool)

(assert (=> b!318430 m!327373))

(declare-fun m!327375 () Bool)

(assert (=> b!318431 m!327375))

(declare-fun m!327377 () Bool)

(assert (=> b!318431 m!327377))

(declare-fun m!327379 () Bool)

(assert (=> b!318436 m!327379))

(declare-fun m!327381 () Bool)

(assert (=> b!318435 m!327381))

(assert (=> b!318435 m!327381))

(declare-fun m!327383 () Bool)

(assert (=> b!318435 m!327383))

(declare-fun m!327385 () Bool)

(assert (=> b!318433 m!327385))

(check-sat (not b!318437) (not b!318435) (not b!318432) (not b!318433) (not b!318430) (not b!318431) (not b!318434) (not b!318438) (not start!31842))
(check-sat)
