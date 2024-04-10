; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30418 () Bool)

(assert start!30418)

(declare-fun b!304458 () Bool)

(declare-fun res!161805 () Bool)

(declare-fun e!191347 () Bool)

(assert (=> b!304458 (=> (not res!161805) (not e!191347))))

(declare-datatypes ((array!15473 0))(
  ( (array!15474 (arr!7323 (Array (_ BitVec 32) (_ BitVec 64))) (size!7675 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15473)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!304458 (= res!161805 (and (= (select (arr!7323 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7675 a!3293))))))

(declare-fun b!304459 () Bool)

(declare-fun res!161808 () Bool)

(declare-fun e!191346 () Bool)

(assert (=> b!304459 (=> (not res!161808) (not e!191346))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304459 (= res!161808 (validKeyInArray!0 k0!2441))))

(declare-fun b!304460 () Bool)

(assert (=> b!304460 (= e!191346 e!191347)))

(declare-fun res!161806 () Bool)

(assert (=> b!304460 (=> (not res!161806) (not e!191347))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2463 0))(
  ( (MissingZero!2463 (index!12028 (_ BitVec 32))) (Found!2463 (index!12029 (_ BitVec 32))) (Intermediate!2463 (undefined!3275 Bool) (index!12030 (_ BitVec 32)) (x!30289 (_ BitVec 32))) (Undefined!2463) (MissingVacant!2463 (index!12031 (_ BitVec 32))) )
))
(declare-fun lt!150456 () SeekEntryResult!2463)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15473 (_ BitVec 32)) SeekEntryResult!2463)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304460 (= res!161806 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150456))))

(assert (=> b!304460 (= lt!150456 (Intermediate!2463 false resIndex!52 resX!52))))

(declare-fun b!304461 () Bool)

(declare-fun res!161804 () Bool)

(assert (=> b!304461 (=> (not res!161804) (not e!191346))))

(declare-fun arrayContainsKey!0 (array!15473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304461 (= res!161804 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304463 () Bool)

(declare-fun res!161810 () Bool)

(assert (=> b!304463 (=> (not res!161810) (not e!191346))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15473 (_ BitVec 32)) Bool)

(assert (=> b!304463 (= res!161810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304464 () Bool)

(declare-fun e!191344 () Bool)

(assert (=> b!304464 (= e!191344 (not true))))

(declare-fun lt!150455 () SeekEntryResult!2463)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304464 (= lt!150455 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!304465 () Bool)

(assert (=> b!304465 (= e!191347 e!191344)))

(declare-fun res!161807 () Bool)

(assert (=> b!304465 (=> (not res!161807) (not e!191344))))

(assert (=> b!304465 (= res!161807 (and (= lt!150455 lt!150456) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7323 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7323 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7323 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304465 (= lt!150455 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!304466 () Bool)

(declare-fun res!161803 () Bool)

(assert (=> b!304466 (=> (not res!161803) (not e!191346))))

(assert (=> b!304466 (= res!161803 (and (= (size!7675 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7675 a!3293))))))

(declare-fun b!304462 () Bool)

(declare-fun res!161809 () Bool)

(assert (=> b!304462 (=> (not res!161809) (not e!191346))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15473 (_ BitVec 32)) SeekEntryResult!2463)

(assert (=> b!304462 (= res!161809 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2463 i!1240)))))

(declare-fun res!161811 () Bool)

(assert (=> start!30418 (=> (not res!161811) (not e!191346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30418 (= res!161811 (validMask!0 mask!3709))))

(assert (=> start!30418 e!191346))

(declare-fun array_inv!5286 (array!15473) Bool)

(assert (=> start!30418 (array_inv!5286 a!3293)))

(assert (=> start!30418 true))

(assert (= (and start!30418 res!161811) b!304466))

(assert (= (and b!304466 res!161803) b!304459))

(assert (= (and b!304459 res!161808) b!304461))

(assert (= (and b!304461 res!161804) b!304462))

(assert (= (and b!304462 res!161809) b!304463))

(assert (= (and b!304463 res!161810) b!304460))

(assert (= (and b!304460 res!161806) b!304458))

(assert (= (and b!304458 res!161805) b!304465))

(assert (= (and b!304465 res!161807) b!304464))

(declare-fun m!315553 () Bool)

(assert (=> b!304464 m!315553))

(assert (=> b!304464 m!315553))

(declare-fun m!315555 () Bool)

(assert (=> b!304464 m!315555))

(declare-fun m!315557 () Bool)

(assert (=> b!304460 m!315557))

(assert (=> b!304460 m!315557))

(declare-fun m!315559 () Bool)

(assert (=> b!304460 m!315559))

(declare-fun m!315561 () Bool)

(assert (=> b!304461 m!315561))

(declare-fun m!315563 () Bool)

(assert (=> b!304465 m!315563))

(declare-fun m!315565 () Bool)

(assert (=> b!304465 m!315565))

(declare-fun m!315567 () Bool)

(assert (=> b!304459 m!315567))

(declare-fun m!315569 () Bool)

(assert (=> b!304463 m!315569))

(declare-fun m!315571 () Bool)

(assert (=> b!304462 m!315571))

(declare-fun m!315573 () Bool)

(assert (=> b!304458 m!315573))

(declare-fun m!315575 () Bool)

(assert (=> start!30418 m!315575))

(declare-fun m!315577 () Bool)

(assert (=> start!30418 m!315577))

(check-sat (not b!304463) (not b!304460) (not b!304459) (not b!304464) (not start!30418) (not b!304465) (not b!304462) (not b!304461))
(check-sat)
