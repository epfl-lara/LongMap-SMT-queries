; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30928 () Bool)

(assert start!30928)

(declare-fun b!310457 () Bool)

(declare-fun res!166912 () Bool)

(declare-fun e!193828 () Bool)

(assert (=> b!310457 (=> (not res!166912) (not e!193828))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((array!15830 0))(
  ( (array!15831 (arr!7497 (Array (_ BitVec 32) (_ BitVec 64))) (size!7849 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15830)

(declare-datatypes ((SeekEntryResult!2637 0))(
  ( (MissingZero!2637 (index!12724 (_ BitVec 32))) (Found!2637 (index!12725 (_ BitVec 32))) (Intermediate!2637 (undefined!3449 Bool) (index!12726 (_ BitVec 32)) (x!30954 (_ BitVec 32))) (Undefined!2637) (MissingVacant!2637 (index!12727 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15830 (_ BitVec 32)) SeekEntryResult!2637)

(assert (=> b!310457 (= res!166912 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2637 i!1240)))))

(declare-fun b!310458 () Bool)

(declare-fun res!166915 () Bool)

(declare-fun e!193831 () Bool)

(assert (=> b!310458 (=> (not res!166915) (not e!193831))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310458 (= res!166915 (and (= (select (arr!7497 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7849 a!3293))))))

(declare-fun res!166918 () Bool)

(assert (=> start!30928 (=> (not res!166918) (not e!193828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30928 (= res!166918 (validMask!0 mask!3709))))

(assert (=> start!30928 e!193828))

(declare-fun array_inv!5460 (array!15830) Bool)

(assert (=> start!30928 (array_inv!5460 a!3293)))

(assert (=> start!30928 true))

(declare-fun b!310459 () Bool)

(declare-fun res!166913 () Bool)

(assert (=> b!310459 (=> (not res!166913) (not e!193828))))

(declare-fun arrayContainsKey!0 (array!15830 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310459 (= res!166913 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310460 () Bool)

(declare-fun e!193829 () Bool)

(assert (=> b!310460 (= e!193831 e!193829)))

(declare-fun res!166917 () Bool)

(assert (=> b!310460 (=> (not res!166917) (not e!193829))))

(declare-fun lt!151964 () SeekEntryResult!2637)

(declare-fun lt!151962 () SeekEntryResult!2637)

(assert (=> b!310460 (= res!166917 (and (= lt!151964 lt!151962) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7497 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15830 (_ BitVec 32)) SeekEntryResult!2637)

(assert (=> b!310460 (= lt!151964 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun e!193827 () Bool)

(declare-fun lt!151963 () (_ BitVec 32))

(declare-fun b!310461 () Bool)

(declare-fun lt!151965 () array!15830)

(assert (=> b!310461 (= e!193827 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!151965 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151963 k0!2441 lt!151965 mask!3709)))))

(assert (=> b!310461 (= lt!151965 (array!15831 (store (arr!7497 a!3293) i!1240 k0!2441) (size!7849 a!3293)))))

(declare-fun b!310462 () Bool)

(assert (=> b!310462 (= e!193829 (not true))))

(assert (=> b!310462 e!193827))

(declare-fun res!166916 () Bool)

(assert (=> b!310462 (=> (not res!166916) (not e!193827))))

(assert (=> b!310462 (= res!166916 (= lt!151964 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151963 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310462 (= lt!151963 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310463 () Bool)

(declare-fun res!166919 () Bool)

(assert (=> b!310463 (=> (not res!166919) (not e!193828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15830 (_ BitVec 32)) Bool)

(assert (=> b!310463 (= res!166919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310464 () Bool)

(declare-fun res!166914 () Bool)

(assert (=> b!310464 (=> (not res!166914) (not e!193828))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310464 (= res!166914 (validKeyInArray!0 k0!2441))))

(declare-fun b!310465 () Bool)

(assert (=> b!310465 (= e!193828 e!193831)))

(declare-fun res!166911 () Bool)

(assert (=> b!310465 (=> (not res!166911) (not e!193831))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310465 (= res!166911 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151962))))

(assert (=> b!310465 (= lt!151962 (Intermediate!2637 false resIndex!52 resX!52))))

(declare-fun b!310466 () Bool)

(declare-fun res!166920 () Bool)

(assert (=> b!310466 (=> (not res!166920) (not e!193828))))

(assert (=> b!310466 (= res!166920 (and (= (size!7849 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7849 a!3293))))))

(assert (= (and start!30928 res!166918) b!310466))

(assert (= (and b!310466 res!166920) b!310464))

(assert (= (and b!310464 res!166914) b!310459))

(assert (= (and b!310459 res!166913) b!310457))

(assert (= (and b!310457 res!166912) b!310463))

(assert (= (and b!310463 res!166919) b!310465))

(assert (= (and b!310465 res!166911) b!310458))

(assert (= (and b!310458 res!166915) b!310460))

(assert (= (and b!310460 res!166917) b!310462))

(assert (= (and b!310462 res!166916) b!310461))

(declare-fun m!320365 () Bool)

(assert (=> b!310464 m!320365))

(declare-fun m!320367 () Bool)

(assert (=> b!310461 m!320367))

(declare-fun m!320369 () Bool)

(assert (=> b!310461 m!320369))

(declare-fun m!320371 () Bool)

(assert (=> b!310461 m!320371))

(declare-fun m!320373 () Bool)

(assert (=> b!310457 m!320373))

(declare-fun m!320375 () Bool)

(assert (=> b!310465 m!320375))

(assert (=> b!310465 m!320375))

(declare-fun m!320377 () Bool)

(assert (=> b!310465 m!320377))

(declare-fun m!320379 () Bool)

(assert (=> b!310462 m!320379))

(declare-fun m!320381 () Bool)

(assert (=> b!310462 m!320381))

(declare-fun m!320383 () Bool)

(assert (=> b!310459 m!320383))

(declare-fun m!320385 () Bool)

(assert (=> start!30928 m!320385))

(declare-fun m!320387 () Bool)

(assert (=> start!30928 m!320387))

(declare-fun m!320389 () Bool)

(assert (=> b!310463 m!320389))

(declare-fun m!320391 () Bool)

(assert (=> b!310460 m!320391))

(declare-fun m!320393 () Bool)

(assert (=> b!310460 m!320393))

(declare-fun m!320395 () Bool)

(assert (=> b!310458 m!320395))

(check-sat (not start!30928) (not b!310460) (not b!310463) (not b!310464) (not b!310462) (not b!310461) (not b!310457) (not b!310465) (not b!310459))
(check-sat)
