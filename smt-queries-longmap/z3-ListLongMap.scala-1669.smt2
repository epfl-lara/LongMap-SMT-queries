; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30888 () Bool)

(assert start!30888)

(declare-fun b!310015 () Bool)

(declare-fun res!166526 () Bool)

(declare-fun e!193601 () Bool)

(assert (=> b!310015 (=> (not res!166526) (not e!193601))))

(declare-datatypes ((array!15803 0))(
  ( (array!15804 (arr!7483 (Array (_ BitVec 32) (_ BitVec 64))) (size!7835 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15803)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15803 (_ BitVec 32)) Bool)

(assert (=> b!310015 (= res!166526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310016 () Bool)

(declare-fun res!166522 () Bool)

(declare-fun e!193602 () Bool)

(assert (=> b!310016 (=> (not res!166522) (not e!193602))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310016 (= res!166522 (and (= (select (arr!7483 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7835 a!3293))))))

(declare-fun b!310017 () Bool)

(assert (=> b!310017 (= e!193601 e!193602)))

(declare-fun res!166519 () Bool)

(assert (=> b!310017 (=> (not res!166519) (not e!193602))))

(declare-datatypes ((SeekEntryResult!2588 0))(
  ( (MissingZero!2588 (index!12528 (_ BitVec 32))) (Found!2588 (index!12529 (_ BitVec 32))) (Intermediate!2588 (undefined!3400 Bool) (index!12530 (_ BitVec 32)) (x!30870 (_ BitVec 32))) (Undefined!2588) (MissingVacant!2588 (index!12531 (_ BitVec 32))) )
))
(declare-fun lt!151826 () SeekEntryResult!2588)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15803 (_ BitVec 32)) SeekEntryResult!2588)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310017 (= res!166519 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151826))))

(assert (=> b!310017 (= lt!151826 (Intermediate!2588 false resIndex!52 resX!52))))

(declare-fun b!310018 () Bool)

(declare-fun e!193599 () Bool)

(assert (=> b!310018 (= e!193602 e!193599)))

(declare-fun res!166525 () Bool)

(assert (=> b!310018 (=> (not res!166525) (not e!193599))))

(declare-fun lt!151825 () SeekEntryResult!2588)

(assert (=> b!310018 (= res!166525 (and (= lt!151825 lt!151826) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7483 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310018 (= lt!151825 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!310019 () Bool)

(declare-fun res!166527 () Bool)

(assert (=> b!310019 (=> (not res!166527) (not e!193601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310019 (= res!166527 (validKeyInArray!0 k0!2441))))

(declare-fun b!310020 () Bool)

(declare-fun res!166521 () Bool)

(assert (=> b!310020 (=> (not res!166521) (not e!193601))))

(declare-fun arrayContainsKey!0 (array!15803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310020 (= res!166521 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310021 () Bool)

(declare-fun res!166524 () Bool)

(assert (=> b!310021 (=> (not res!166524) (not e!193601))))

(assert (=> b!310021 (= res!166524 (and (= (size!7835 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7835 a!3293))))))

(declare-fun b!310022 () Bool)

(declare-fun res!166518 () Bool)

(assert (=> b!310022 (=> (not res!166518) (not e!193601))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15803 (_ BitVec 32)) SeekEntryResult!2588)

(assert (=> b!310022 (= res!166518 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2588 i!1240)))))

(declare-fun b!310023 () Bool)

(assert (=> b!310023 (= e!193599 (not true))))

(declare-fun e!193598 () Bool)

(assert (=> b!310023 e!193598))

(declare-fun res!166523 () Bool)

(assert (=> b!310023 (=> (not res!166523) (not e!193598))))

(declare-fun lt!151827 () (_ BitVec 32))

(assert (=> b!310023 (= res!166523 (= lt!151825 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151827 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310023 (= lt!151827 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun res!166520 () Bool)

(assert (=> start!30888 (=> (not res!166520) (not e!193601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30888 (= res!166520 (validMask!0 mask!3709))))

(assert (=> start!30888 e!193601))

(declare-fun array_inv!5433 (array!15803) Bool)

(assert (=> start!30888 (array_inv!5433 a!3293)))

(assert (=> start!30888 true))

(declare-fun b!310014 () Bool)

(declare-fun lt!151824 () array!15803)

(assert (=> b!310014 (= e!193598 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!151824 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151827 k0!2441 lt!151824 mask!3709)))))

(assert (=> b!310014 (= lt!151824 (array!15804 (store (arr!7483 a!3293) i!1240 k0!2441) (size!7835 a!3293)))))

(assert (= (and start!30888 res!166520) b!310021))

(assert (= (and b!310021 res!166524) b!310019))

(assert (= (and b!310019 res!166527) b!310020))

(assert (= (and b!310020 res!166521) b!310022))

(assert (= (and b!310022 res!166518) b!310015))

(assert (= (and b!310015 res!166526) b!310017))

(assert (= (and b!310017 res!166519) b!310016))

(assert (= (and b!310016 res!166522) b!310018))

(assert (= (and b!310018 res!166525) b!310023))

(assert (= (and b!310023 res!166523) b!310014))

(declare-fun m!320083 () Bool)

(assert (=> b!310020 m!320083))

(declare-fun m!320085 () Bool)

(assert (=> b!310014 m!320085))

(declare-fun m!320087 () Bool)

(assert (=> b!310014 m!320087))

(declare-fun m!320089 () Bool)

(assert (=> b!310014 m!320089))

(declare-fun m!320091 () Bool)

(assert (=> start!30888 m!320091))

(declare-fun m!320093 () Bool)

(assert (=> start!30888 m!320093))

(declare-fun m!320095 () Bool)

(assert (=> b!310017 m!320095))

(assert (=> b!310017 m!320095))

(declare-fun m!320097 () Bool)

(assert (=> b!310017 m!320097))

(declare-fun m!320099 () Bool)

(assert (=> b!310015 m!320099))

(declare-fun m!320101 () Bool)

(assert (=> b!310022 m!320101))

(declare-fun m!320103 () Bool)

(assert (=> b!310019 m!320103))

(declare-fun m!320105 () Bool)

(assert (=> b!310018 m!320105))

(declare-fun m!320107 () Bool)

(assert (=> b!310018 m!320107))

(declare-fun m!320109 () Bool)

(assert (=> b!310016 m!320109))

(declare-fun m!320111 () Bool)

(assert (=> b!310023 m!320111))

(declare-fun m!320113 () Bool)

(assert (=> b!310023 m!320113))

(check-sat (not b!310020) (not b!310015) (not b!310022) (not b!310014) (not b!310023) (not b!310019) (not start!30888) (not b!310018) (not b!310017))
(check-sat)
