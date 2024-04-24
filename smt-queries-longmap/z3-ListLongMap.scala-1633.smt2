; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30564 () Bool)

(assert start!30564)

(declare-fun b!306449 () Bool)

(declare-fun res!163393 () Bool)

(declare-fun e!192167 () Bool)

(assert (=> b!306449 (=> (not res!163393) (not e!192167))))

(declare-datatypes ((array!15581 0))(
  ( (array!15582 (arr!7375 (Array (_ BitVec 32) (_ BitVec 64))) (size!7727 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15581)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2480 0))(
  ( (MissingZero!2480 (index!12096 (_ BitVec 32))) (Found!2480 (index!12097 (_ BitVec 32))) (Intermediate!2480 (undefined!3292 Bool) (index!12098 (_ BitVec 32)) (x!30456 (_ BitVec 32))) (Undefined!2480) (MissingVacant!2480 (index!12099 (_ BitVec 32))) )
))
(declare-fun lt!150994 () SeekEntryResult!2480)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15581 (_ BitVec 32)) SeekEntryResult!2480)

(assert (=> b!306449 (= res!163393 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150994))))

(declare-fun b!306450 () Bool)

(declare-fun res!163390 () Bool)

(declare-fun e!192170 () Bool)

(assert (=> b!306450 (=> (not res!163390) (not e!192170))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15581 (_ BitVec 32)) SeekEntryResult!2480)

(assert (=> b!306450 (= res!163390 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2480 i!1240)))))

(declare-fun b!306451 () Bool)

(assert (=> b!306451 (= e!192170 e!192167)))

(declare-fun res!163389 () Bool)

(assert (=> b!306451 (=> (not res!163389) (not e!192167))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306451 (= res!163389 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150994))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!306451 (= lt!150994 (Intermediate!2480 false resIndex!52 resX!52))))

(declare-fun b!306452 () Bool)

(declare-datatypes ((Unit!9483 0))(
  ( (Unit!9484) )
))
(declare-fun e!192168 () Unit!9483)

(declare-fun Unit!9485 () Unit!9483)

(assert (=> b!306452 (= e!192168 Unit!9485)))

(declare-fun b!306453 () Bool)

(declare-fun res!163398 () Bool)

(assert (=> b!306453 (=> (not res!163398) (not e!192170))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306453 (= res!163398 (validKeyInArray!0 k0!2441))))

(declare-fun b!306454 () Bool)

(declare-fun e!192171 () Unit!9483)

(assert (=> b!306454 (= e!192168 e!192171)))

(declare-fun c!49132 () Bool)

(assert (=> b!306454 (= c!49132 (or (= (select (arr!7375 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7375 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306455 () Bool)

(assert (=> b!306455 false))

(declare-fun Unit!9486 () Unit!9483)

(assert (=> b!306455 (= e!192171 Unit!9486)))

(declare-fun b!306456 () Bool)

(assert (=> b!306456 (= e!192167 (not true))))

(assert (=> b!306456 (= index!1781 resIndex!52)))

(declare-fun lt!150996 () Unit!9483)

(assert (=> b!306456 (= lt!150996 e!192168)))

(declare-fun c!49133 () Bool)

(assert (=> b!306456 (= c!49133 (not (= resIndex!52 index!1781)))))

(declare-fun b!306457 () Bool)

(declare-fun res!163397 () Bool)

(assert (=> b!306457 (=> (not res!163397) (not e!192170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15581 (_ BitVec 32)) Bool)

(assert (=> b!306457 (= res!163397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306458 () Bool)

(declare-fun res!163392 () Bool)

(assert (=> b!306458 (=> (not res!163392) (not e!192170))))

(declare-fun arrayContainsKey!0 (array!15581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306458 (= res!163392 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!163396 () Bool)

(assert (=> start!30564 (=> (not res!163396) (not e!192170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30564 (= res!163396 (validMask!0 mask!3709))))

(assert (=> start!30564 e!192170))

(declare-fun array_inv!5325 (array!15581) Bool)

(assert (=> start!30564 (array_inv!5325 a!3293)))

(assert (=> start!30564 true))

(declare-fun b!306459 () Bool)

(assert (=> b!306459 false))

(declare-fun lt!150995 () SeekEntryResult!2480)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306459 (= lt!150995 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9487 () Unit!9483)

(assert (=> b!306459 (= e!192171 Unit!9487)))

(declare-fun b!306460 () Bool)

(declare-fun res!163395 () Bool)

(assert (=> b!306460 (=> (not res!163395) (not e!192167))))

(assert (=> b!306460 (= res!163395 (and (= (select (arr!7375 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7727 a!3293))))))

(declare-fun b!306461 () Bool)

(declare-fun res!163391 () Bool)

(assert (=> b!306461 (=> (not res!163391) (not e!192170))))

(assert (=> b!306461 (= res!163391 (and (= (size!7727 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7727 a!3293))))))

(declare-fun b!306462 () Bool)

(declare-fun res!163394 () Bool)

(assert (=> b!306462 (=> (not res!163394) (not e!192167))))

(assert (=> b!306462 (= res!163394 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7375 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(assert (= (and start!30564 res!163396) b!306461))

(assert (= (and b!306461 res!163391) b!306453))

(assert (= (and b!306453 res!163398) b!306458))

(assert (= (and b!306458 res!163392) b!306450))

(assert (= (and b!306450 res!163390) b!306457))

(assert (= (and b!306457 res!163397) b!306451))

(assert (= (and b!306451 res!163389) b!306460))

(assert (= (and b!306460 res!163395) b!306449))

(assert (= (and b!306449 res!163393) b!306462))

(assert (= (and b!306462 res!163394) b!306456))

(assert (= (and b!306456 c!49133) b!306454))

(assert (= (and b!306456 (not c!49133)) b!306452))

(assert (= (and b!306454 c!49132) b!306455))

(assert (= (and b!306454 (not c!49132)) b!306459))

(declare-fun m!317191 () Bool)

(assert (=> b!306457 m!317191))

(declare-fun m!317193 () Bool)

(assert (=> start!30564 m!317193))

(declare-fun m!317195 () Bool)

(assert (=> start!30564 m!317195))

(declare-fun m!317197 () Bool)

(assert (=> b!306460 m!317197))

(declare-fun m!317199 () Bool)

(assert (=> b!306454 m!317199))

(declare-fun m!317201 () Bool)

(assert (=> b!306453 m!317201))

(declare-fun m!317203 () Bool)

(assert (=> b!306449 m!317203))

(declare-fun m!317205 () Bool)

(assert (=> b!306458 m!317205))

(declare-fun m!317207 () Bool)

(assert (=> b!306451 m!317207))

(assert (=> b!306451 m!317207))

(declare-fun m!317209 () Bool)

(assert (=> b!306451 m!317209))

(declare-fun m!317211 () Bool)

(assert (=> b!306450 m!317211))

(declare-fun m!317213 () Bool)

(assert (=> b!306459 m!317213))

(assert (=> b!306459 m!317213))

(declare-fun m!317215 () Bool)

(assert (=> b!306459 m!317215))

(assert (=> b!306462 m!317199))

(check-sat (not b!306458) (not b!306453) (not b!306451) (not b!306449) (not b!306450) (not b!306457) (not b!306459) (not start!30564))
(check-sat)
