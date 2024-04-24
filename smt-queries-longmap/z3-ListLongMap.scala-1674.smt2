; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30918 () Bool)

(assert start!30918)

(declare-fun res!166971 () Bool)

(declare-fun e!193825 () Bool)

(assert (=> start!30918 (=> (not res!166971) (not e!193825))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30918 (= res!166971 (validMask!0 mask!3709))))

(assert (=> start!30918 e!193825))

(declare-datatypes ((array!15833 0))(
  ( (array!15834 (arr!7498 (Array (_ BitVec 32) (_ BitVec 64))) (size!7850 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15833)

(declare-fun array_inv!5448 (array!15833) Bool)

(assert (=> start!30918 (array_inv!5448 a!3293)))

(assert (=> start!30918 true))

(declare-fun b!310464 () Bool)

(declare-fun res!166972 () Bool)

(assert (=> b!310464 (=> (not res!166972) (not e!193825))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2603 0))(
  ( (MissingZero!2603 (index!12588 (_ BitVec 32))) (Found!2603 (index!12589 (_ BitVec 32))) (Intermediate!2603 (undefined!3415 Bool) (index!12590 (_ BitVec 32)) (x!30925 (_ BitVec 32))) (Undefined!2603) (MissingVacant!2603 (index!12591 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15833 (_ BitVec 32)) SeekEntryResult!2603)

(assert (=> b!310464 (= res!166972 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2603 i!1240)))))

(declare-fun b!310465 () Bool)

(declare-fun res!166975 () Bool)

(assert (=> b!310465 (=> (not res!166975) (not e!193825))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15833 (_ BitVec 32)) Bool)

(assert (=> b!310465 (= res!166975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310466 () Bool)

(declare-fun res!166968 () Bool)

(assert (=> b!310466 (=> (not res!166968) (not e!193825))))

(declare-fun arrayContainsKey!0 (array!15833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310466 (= res!166968 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310467 () Bool)

(declare-fun e!193823 () Bool)

(declare-fun e!193824 () Bool)

(assert (=> b!310467 (= e!193823 e!193824)))

(declare-fun res!166976 () Bool)

(assert (=> b!310467 (=> (not res!166976) (not e!193824))))

(declare-fun lt!152006 () SeekEntryResult!2603)

(declare-fun lt!152004 () SeekEntryResult!2603)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310467 (= res!166976 (and (= lt!152004 lt!152006) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7498 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15833 (_ BitVec 32)) SeekEntryResult!2603)

(assert (=> b!310467 (= lt!152004 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!310468 () Bool)

(declare-fun res!166969 () Bool)

(assert (=> b!310468 (=> (not res!166969) (not e!193825))))

(assert (=> b!310468 (= res!166969 (and (= (size!7850 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7850 a!3293))))))

(declare-fun b!310469 () Bool)

(assert (=> b!310469 (= e!193824 (not true))))

(declare-fun e!193826 () Bool)

(assert (=> b!310469 e!193826))

(declare-fun res!166970 () Bool)

(assert (=> b!310469 (=> (not res!166970) (not e!193826))))

(declare-fun lt!152005 () (_ BitVec 32))

(assert (=> b!310469 (= res!166970 (= lt!152004 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152005 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310469 (= lt!152005 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun lt!152007 () array!15833)

(declare-fun b!310470 () Bool)

(assert (=> b!310470 (= e!193826 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152007 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152005 k0!2441 lt!152007 mask!3709)))))

(assert (=> b!310470 (= lt!152007 (array!15834 (store (arr!7498 a!3293) i!1240 k0!2441) (size!7850 a!3293)))))

(declare-fun b!310471 () Bool)

(assert (=> b!310471 (= e!193825 e!193823)))

(declare-fun res!166977 () Bool)

(assert (=> b!310471 (=> (not res!166977) (not e!193823))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310471 (= res!166977 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152006))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!310471 (= lt!152006 (Intermediate!2603 false resIndex!52 resX!52))))

(declare-fun b!310472 () Bool)

(declare-fun res!166973 () Bool)

(assert (=> b!310472 (=> (not res!166973) (not e!193823))))

(assert (=> b!310472 (= res!166973 (and (= (select (arr!7498 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7850 a!3293))))))

(declare-fun b!310473 () Bool)

(declare-fun res!166974 () Bool)

(assert (=> b!310473 (=> (not res!166974) (not e!193825))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310473 (= res!166974 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30918 res!166971) b!310468))

(assert (= (and b!310468 res!166969) b!310473))

(assert (= (and b!310473 res!166974) b!310466))

(assert (= (and b!310466 res!166968) b!310464))

(assert (= (and b!310464 res!166972) b!310465))

(assert (= (and b!310465 res!166975) b!310471))

(assert (= (and b!310471 res!166977) b!310472))

(assert (= (and b!310472 res!166973) b!310467))

(assert (= (and b!310467 res!166976) b!310469))

(assert (= (and b!310469 res!166970) b!310470))

(declare-fun m!320563 () Bool)

(assert (=> b!310464 m!320563))

(declare-fun m!320565 () Bool)

(assert (=> b!310467 m!320565))

(declare-fun m!320567 () Bool)

(assert (=> b!310467 m!320567))

(declare-fun m!320569 () Bool)

(assert (=> start!30918 m!320569))

(declare-fun m!320571 () Bool)

(assert (=> start!30918 m!320571))

(declare-fun m!320573 () Bool)

(assert (=> b!310466 m!320573))

(declare-fun m!320575 () Bool)

(assert (=> b!310469 m!320575))

(declare-fun m!320577 () Bool)

(assert (=> b!310469 m!320577))

(declare-fun m!320579 () Bool)

(assert (=> b!310470 m!320579))

(declare-fun m!320581 () Bool)

(assert (=> b!310470 m!320581))

(declare-fun m!320583 () Bool)

(assert (=> b!310470 m!320583))

(declare-fun m!320585 () Bool)

(assert (=> b!310472 m!320585))

(declare-fun m!320587 () Bool)

(assert (=> b!310465 m!320587))

(declare-fun m!320589 () Bool)

(assert (=> b!310473 m!320589))

(declare-fun m!320591 () Bool)

(assert (=> b!310471 m!320591))

(assert (=> b!310471 m!320591))

(declare-fun m!320593 () Bool)

(assert (=> b!310471 m!320593))

(check-sat (not b!310464) (not start!30918) (not b!310467) (not b!310470) (not b!310473) (not b!310465) (not b!310466) (not b!310471) (not b!310469))
(check-sat)
