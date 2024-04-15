; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30504 () Bool)

(assert start!30504)

(declare-fun res!162383 () Bool)

(declare-fun e!191592 () Bool)

(assert (=> start!30504 (=> (not res!162383) (not e!191592))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30504 (= res!162383 (validMask!0 mask!3709))))

(assert (=> start!30504 e!191592))

(declare-datatypes ((array!15512 0))(
  ( (array!15513 (arr!7341 (Array (_ BitVec 32) (_ BitVec 64))) (size!7694 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15512)

(declare-fun array_inv!5313 (array!15512) Bool)

(assert (=> start!30504 (array_inv!5313 a!3293)))

(assert (=> start!30504 true))

(declare-fun b!305047 () Bool)

(declare-fun e!191593 () Bool)

(declare-fun e!191594 () Bool)

(assert (=> b!305047 (= e!191593 e!191594)))

(declare-fun res!162381 () Bool)

(assert (=> b!305047 (=> (not res!162381) (not e!191594))))

(declare-datatypes ((SeekEntryResult!2480 0))(
  ( (MissingZero!2480 (index!12096 (_ BitVec 32))) (Found!2480 (index!12097 (_ BitVec 32))) (Intermediate!2480 (undefined!3292 Bool) (index!12098 (_ BitVec 32)) (x!30374 (_ BitVec 32))) (Undefined!2480) (MissingVacant!2480 (index!12099 (_ BitVec 32))) )
))
(declare-fun lt!150480 () SeekEntryResult!2480)

(declare-fun lt!150481 () SeekEntryResult!2480)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!305047 (= res!162381 (and (= lt!150480 lt!150481) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7341 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7341 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7341 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15512 (_ BitVec 32)) SeekEntryResult!2480)

(assert (=> b!305047 (= lt!150480 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!305048 () Bool)

(declare-fun res!162387 () Bool)

(assert (=> b!305048 (=> (not res!162387) (not e!191593))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!305048 (= res!162387 (and (= (select (arr!7341 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7694 a!3293))))))

(declare-fun b!305049 () Bool)

(assert (=> b!305049 (= e!191592 e!191593)))

(declare-fun res!162384 () Bool)

(assert (=> b!305049 (=> (not res!162384) (not e!191593))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305049 (= res!162384 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150481))))

(assert (=> b!305049 (= lt!150481 (Intermediate!2480 false resIndex!52 resX!52))))

(declare-fun b!305050 () Bool)

(declare-fun res!162386 () Bool)

(assert (=> b!305050 (=> (not res!162386) (not e!191592))))

(assert (=> b!305050 (= res!162386 (and (= (size!7694 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7694 a!3293))))))

(declare-fun b!305051 () Bool)

(declare-fun res!162379 () Bool)

(assert (=> b!305051 (=> (not res!162379) (not e!191592))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305051 (= res!162379 (validKeyInArray!0 k0!2441))))

(declare-fun b!305052 () Bool)

(declare-fun res!162380 () Bool)

(assert (=> b!305052 (=> (not res!162380) (not e!191592))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15512 (_ BitVec 32)) SeekEntryResult!2480)

(assert (=> b!305052 (= res!162380 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2480 i!1240)))))

(declare-fun lt!150482 () (_ BitVec 32))

(declare-fun b!305053 () Bool)

(assert (=> b!305053 (= e!191594 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt lt!150482 #b00000000000000000000000000000000) (bvsge lt!150482 (bvadd #b00000000000000000000000000000001 mask!3709)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000)))))))

(assert (=> b!305053 (= lt!150480 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!150482 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305053 (= lt!150482 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!305054 () Bool)

(declare-fun res!162382 () Bool)

(assert (=> b!305054 (=> (not res!162382) (not e!191592))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15512 (_ BitVec 32)) Bool)

(assert (=> b!305054 (= res!162382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305055 () Bool)

(declare-fun res!162385 () Bool)

(assert (=> b!305055 (=> (not res!162385) (not e!191592))))

(declare-fun arrayContainsKey!0 (array!15512 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305055 (= res!162385 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30504 res!162383) b!305050))

(assert (= (and b!305050 res!162386) b!305051))

(assert (= (and b!305051 res!162379) b!305055))

(assert (= (and b!305055 res!162385) b!305052))

(assert (= (and b!305052 res!162380) b!305054))

(assert (= (and b!305054 res!162382) b!305049))

(assert (= (and b!305049 res!162384) b!305048))

(assert (= (and b!305048 res!162387) b!305047))

(assert (= (and b!305047 res!162381) b!305053))

(declare-fun m!315559 () Bool)

(assert (=> b!305049 m!315559))

(assert (=> b!305049 m!315559))

(declare-fun m!315561 () Bool)

(assert (=> b!305049 m!315561))

(declare-fun m!315563 () Bool)

(assert (=> b!305054 m!315563))

(declare-fun m!315565 () Bool)

(assert (=> b!305052 m!315565))

(declare-fun m!315567 () Bool)

(assert (=> start!30504 m!315567))

(declare-fun m!315569 () Bool)

(assert (=> start!30504 m!315569))

(declare-fun m!315571 () Bool)

(assert (=> b!305055 m!315571))

(declare-fun m!315573 () Bool)

(assert (=> b!305048 m!315573))

(declare-fun m!315575 () Bool)

(assert (=> b!305051 m!315575))

(declare-fun m!315577 () Bool)

(assert (=> b!305053 m!315577))

(declare-fun m!315579 () Bool)

(assert (=> b!305053 m!315579))

(declare-fun m!315581 () Bool)

(assert (=> b!305047 m!315581))

(declare-fun m!315583 () Bool)

(assert (=> b!305047 m!315583))

(check-sat (not b!305055) (not start!30504) (not b!305047) (not b!305049) (not b!305051) (not b!305052) (not b!305053) (not b!305054))
(check-sat)
