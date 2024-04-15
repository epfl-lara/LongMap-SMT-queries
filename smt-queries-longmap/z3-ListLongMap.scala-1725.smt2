; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31788 () Bool)

(assert start!31788)

(declare-fun b!317397 () Bool)

(declare-fun res!172127 () Bool)

(declare-fun e!197308 () Bool)

(assert (=> b!317397 (=> (not res!172127) (not e!197308))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317397 (= res!172127 (validKeyInArray!0 k0!2441))))

(declare-fun b!317398 () Bool)

(declare-fun res!172128 () Bool)

(assert (=> b!317398 (=> (not res!172128) (not e!197308))))

(declare-datatypes ((array!16163 0))(
  ( (array!16164 (arr!7647 (Array (_ BitVec 32) (_ BitVec 64))) (size!8000 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16163)

(declare-fun arrayContainsKey!0 (array!16163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317398 (= res!172128 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317400 () Bool)

(declare-fun e!197305 () Bool)

(declare-fun e!197309 () Bool)

(assert (=> b!317400 (= e!197305 e!197309)))

(declare-fun res!172125 () Bool)

(assert (=> b!317400 (=> (not res!172125) (not e!197309))))

(declare-datatypes ((SeekEntryResult!2786 0))(
  ( (MissingZero!2786 (index!13320 (_ BitVec 32))) (Found!2786 (index!13321 (_ BitVec 32))) (Intermediate!2786 (undefined!3598 Bool) (index!13322 (_ BitVec 32)) (x!31598 (_ BitVec 32))) (Undefined!2786) (MissingVacant!2786 (index!13323 (_ BitVec 32))) )
))
(declare-fun lt!154810 () SeekEntryResult!2786)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!154811 () SeekEntryResult!2786)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!317400 (= res!172125 (and (= lt!154811 lt!154810) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7647 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16163 (_ BitVec 32)) SeekEntryResult!2786)

(assert (=> b!317400 (= lt!154811 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun lt!154808 () array!16163)

(declare-fun b!317401 () Bool)

(declare-fun e!197307 () Bool)

(declare-fun lt!154809 () (_ BitVec 32))

(assert (=> b!317401 (= e!197307 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!154808 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154809 k0!2441 lt!154808 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317401 (= lt!154808 (array!16164 (store (arr!7647 a!3293) i!1240 k0!2441) (size!8000 a!3293)))))

(declare-fun b!317402 () Bool)

(declare-fun res!172130 () Bool)

(assert (=> b!317402 (=> (not res!172130) (not e!197308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16163 (_ BitVec 32)) Bool)

(assert (=> b!317402 (= res!172130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317403 () Bool)

(declare-fun res!172129 () Bool)

(assert (=> b!317403 (=> (not res!172129) (not e!197308))))

(assert (=> b!317403 (= res!172129 (and (= (size!8000 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8000 a!3293))))))

(declare-fun b!317404 () Bool)

(assert (=> b!317404 (= e!197309 (not true))))

(assert (=> b!317404 e!197307))

(declare-fun res!172122 () Bool)

(assert (=> b!317404 (=> (not res!172122) (not e!197307))))

(assert (=> b!317404 (= res!172122 (= lt!154811 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154809 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317404 (= lt!154809 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun res!172126 () Bool)

(assert (=> start!31788 (=> (not res!172126) (not e!197308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31788 (= res!172126 (validMask!0 mask!3709))))

(assert (=> start!31788 e!197308))

(declare-fun array_inv!5619 (array!16163) Bool)

(assert (=> start!31788 (array_inv!5619 a!3293)))

(assert (=> start!31788 true))

(declare-fun b!317399 () Bool)

(declare-fun res!172124 () Bool)

(assert (=> b!317399 (=> (not res!172124) (not e!197308))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16163 (_ BitVec 32)) SeekEntryResult!2786)

(assert (=> b!317399 (= res!172124 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2786 i!1240)))))

(declare-fun b!317405 () Bool)

(assert (=> b!317405 (= e!197308 e!197305)))

(declare-fun res!172123 () Bool)

(assert (=> b!317405 (=> (not res!172123) (not e!197305))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317405 (= res!172123 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154810))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!317405 (= lt!154810 (Intermediate!2786 false resIndex!52 resX!52))))

(declare-fun b!317406 () Bool)

(declare-fun res!172131 () Bool)

(assert (=> b!317406 (=> (not res!172131) (not e!197305))))

(assert (=> b!317406 (= res!172131 (and (= (select (arr!7647 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8000 a!3293))))))

(assert (= (and start!31788 res!172126) b!317403))

(assert (= (and b!317403 res!172129) b!317397))

(assert (= (and b!317397 res!172127) b!317398))

(assert (= (and b!317398 res!172128) b!317399))

(assert (= (and b!317399 res!172124) b!317402))

(assert (= (and b!317402 res!172130) b!317405))

(assert (= (and b!317405 res!172123) b!317406))

(assert (= (and b!317406 res!172131) b!317400))

(assert (= (and b!317400 res!172125) b!317404))

(assert (= (and b!317404 res!172122) b!317401))

(declare-fun m!325591 () Bool)

(assert (=> start!31788 m!325591))

(declare-fun m!325593 () Bool)

(assert (=> start!31788 m!325593))

(declare-fun m!325595 () Bool)

(assert (=> b!317399 m!325595))

(declare-fun m!325597 () Bool)

(assert (=> b!317397 m!325597))

(declare-fun m!325599 () Bool)

(assert (=> b!317398 m!325599))

(declare-fun m!325601 () Bool)

(assert (=> b!317402 m!325601))

(declare-fun m!325603 () Bool)

(assert (=> b!317404 m!325603))

(declare-fun m!325605 () Bool)

(assert (=> b!317404 m!325605))

(declare-fun m!325607 () Bool)

(assert (=> b!317400 m!325607))

(declare-fun m!325609 () Bool)

(assert (=> b!317400 m!325609))

(declare-fun m!325611 () Bool)

(assert (=> b!317405 m!325611))

(assert (=> b!317405 m!325611))

(declare-fun m!325613 () Bool)

(assert (=> b!317405 m!325613))

(declare-fun m!325615 () Bool)

(assert (=> b!317401 m!325615))

(declare-fun m!325617 () Bool)

(assert (=> b!317401 m!325617))

(declare-fun m!325619 () Bool)

(assert (=> b!317401 m!325619))

(declare-fun m!325621 () Bool)

(assert (=> b!317406 m!325621))

(check-sat (not start!31788) (not b!317400) (not b!317399) (not b!317402) (not b!317397) (not b!317404) (not b!317401) (not b!317398) (not b!317405))
(check-sat)
