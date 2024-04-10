; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30604 () Bool)

(assert start!30604)

(declare-fun b!307018 () Bool)

(declare-fun res!163776 () Bool)

(declare-fun e!192382 () Bool)

(assert (=> b!307018 (=> (not res!163776) (not e!192382))))

(declare-datatypes ((array!15608 0))(
  ( (array!15609 (arr!7389 (Array (_ BitVec 32) (_ BitVec 64))) (size!7741 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15608)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2529 0))(
  ( (MissingZero!2529 (index!12292 (_ BitVec 32))) (Found!2529 (index!12293 (_ BitVec 32))) (Intermediate!2529 (undefined!3341 Bool) (index!12294 (_ BitVec 32)) (x!30540 (_ BitVec 32))) (Undefined!2529) (MissingVacant!2529 (index!12295 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15608 (_ BitVec 32)) SeekEntryResult!2529)

(assert (=> b!307018 (= res!163776 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2529 i!1240)))))

(declare-fun b!307019 () Bool)

(declare-fun res!163773 () Bool)

(assert (=> b!307019 (=> (not res!163773) (not e!192382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15608 (_ BitVec 32)) Bool)

(assert (=> b!307019 (= res!163773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307020 () Bool)

(declare-fun res!163778 () Bool)

(assert (=> b!307020 (=> (not res!163778) (not e!192382))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307020 (= res!163778 (and (= (select (arr!7389 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7741 a!3293))))))

(declare-fun b!307021 () Bool)

(declare-fun res!163779 () Bool)

(assert (=> b!307021 (=> (not res!163779) (not e!192382))))

(assert (=> b!307021 (= res!163779 (and (= (size!7741 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7741 a!3293))))))

(declare-fun b!307022 () Bool)

(declare-fun res!163772 () Bool)

(assert (=> b!307022 (=> (not res!163772) (not e!192382))))

(declare-fun arrayContainsKey!0 (array!15608 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307022 (= res!163772 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!163775 () Bool)

(assert (=> start!30604 (=> (not res!163775) (not e!192382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30604 (= res!163775 (validMask!0 mask!3709))))

(assert (=> start!30604 e!192382))

(declare-fun array_inv!5352 (array!15608) Bool)

(assert (=> start!30604 (array_inv!5352 a!3293)))

(assert (=> start!30604 true))

(declare-fun b!307023 () Bool)

(declare-fun res!163774 () Bool)

(assert (=> b!307023 (=> (not res!163774) (not e!192382))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15608 (_ BitVec 32)) SeekEntryResult!2529)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307023 (= res!163774 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) (Intermediate!2529 false resIndex!52 resX!52)))))

(declare-fun b!307024 () Bool)

(assert (=> b!307024 (= e!192382 false)))

(declare-fun lt!151083 () SeekEntryResult!2529)

(assert (=> b!307024 (= lt!151083 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!307025 () Bool)

(declare-fun res!163777 () Bool)

(assert (=> b!307025 (=> (not res!163777) (not e!192382))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307025 (= res!163777 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30604 res!163775) b!307021))

(assert (= (and b!307021 res!163779) b!307025))

(assert (= (and b!307025 res!163777) b!307022))

(assert (= (and b!307022 res!163772) b!307018))

(assert (= (and b!307018 res!163776) b!307019))

(assert (= (and b!307019 res!163773) b!307023))

(assert (= (and b!307023 res!163774) b!307020))

(assert (= (and b!307020 res!163778) b!307024))

(declare-fun m!317401 () Bool)

(assert (=> b!307018 m!317401))

(declare-fun m!317403 () Bool)

(assert (=> b!307023 m!317403))

(assert (=> b!307023 m!317403))

(declare-fun m!317405 () Bool)

(assert (=> b!307023 m!317405))

(declare-fun m!317407 () Bool)

(assert (=> b!307025 m!317407))

(declare-fun m!317409 () Bool)

(assert (=> b!307020 m!317409))

(declare-fun m!317411 () Bool)

(assert (=> b!307024 m!317411))

(declare-fun m!317413 () Bool)

(assert (=> b!307019 m!317413))

(declare-fun m!317415 () Bool)

(assert (=> b!307022 m!317415))

(declare-fun m!317417 () Bool)

(assert (=> start!30604 m!317417))

(declare-fun m!317419 () Bool)

(assert (=> start!30604 m!317419))

(check-sat (not b!307018) (not b!307019) (not b!307024) (not b!307022) (not start!30604) (not b!307025) (not b!307023))
