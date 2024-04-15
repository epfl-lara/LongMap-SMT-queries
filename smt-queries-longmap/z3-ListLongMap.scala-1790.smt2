; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32426 () Bool)

(assert start!32426)

(declare-fun b!323803 () Bool)

(declare-fun res!177286 () Bool)

(declare-fun e!199986 () Bool)

(assert (=> b!323803 (=> (not res!177286) (not e!199986))))

(declare-datatypes ((array!16569 0))(
  ( (array!16570 (arr!7842 (Array (_ BitVec 32) (_ BitVec 64))) (size!8195 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16569)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2972 0))(
  ( (MissingZero!2972 (index!14064 (_ BitVec 32))) (Found!2972 (index!14065 (_ BitVec 32))) (Intermediate!2972 (undefined!3784 Bool) (index!14066 (_ BitVec 32)) (x!32331 (_ BitVec 32))) (Undefined!2972) (MissingVacant!2972 (index!14067 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16569 (_ BitVec 32)) SeekEntryResult!2972)

(assert (=> b!323803 (= res!177286 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2972 i!1250)))))

(declare-fun b!323804 () Bool)

(declare-fun res!177280 () Bool)

(assert (=> b!323804 (=> (not res!177280) (not e!199986))))

(declare-fun arrayContainsKey!0 (array!16569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323804 (= res!177280 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323806 () Bool)

(declare-fun e!199987 () Bool)

(assert (=> b!323806 (= e!199986 e!199987)))

(declare-fun res!177288 () Bool)

(assert (=> b!323806 (=> (not res!177288) (not e!199987))))

(declare-fun lt!156515 () SeekEntryResult!2972)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16569 (_ BitVec 32)) SeekEntryResult!2972)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323806 (= res!177288 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156515))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!323806 (= lt!156515 (Intermediate!2972 false resIndex!58 resX!58))))

(declare-fun b!323807 () Bool)

(declare-fun res!177287 () Bool)

(assert (=> b!323807 (=> (not res!177287) (not e!199986))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323807 (= res!177287 (validKeyInArray!0 k0!2497))))

(declare-fun b!323808 () Bool)

(declare-fun res!177282 () Bool)

(assert (=> b!323808 (=> (not res!177282) (not e!199986))))

(assert (=> b!323808 (= res!177282 (and (= (size!8195 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8195 a!3305))))))

(declare-fun b!323809 () Bool)

(declare-fun res!177281 () Bool)

(assert (=> b!323809 (=> (not res!177281) (not e!199987))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!323809 (= res!177281 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156515))))

(declare-fun b!323805 () Bool)

(declare-fun res!177284 () Bool)

(assert (=> b!323805 (=> (not res!177284) (not e!199987))))

(assert (=> b!323805 (= res!177284 (and (= (select (arr!7842 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8195 a!3305))))))

(declare-fun res!177285 () Bool)

(assert (=> start!32426 (=> (not res!177285) (not e!199986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32426 (= res!177285 (validMask!0 mask!3777))))

(assert (=> start!32426 e!199986))

(declare-fun array_inv!5814 (array!16569) Bool)

(assert (=> start!32426 (array_inv!5814 a!3305)))

(assert (=> start!32426 true))

(declare-fun b!323810 () Bool)

(declare-fun res!177283 () Bool)

(assert (=> b!323810 (=> (not res!177283) (not e!199986))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16569 (_ BitVec 32)) Bool)

(assert (=> b!323810 (= res!177283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323811 () Bool)

(assert (=> b!323811 (= e!199987 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7842 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58)) (bvslt mask!3777 #b00000000000000000000000000000000)))))

(assert (= (and start!32426 res!177285) b!323808))

(assert (= (and b!323808 res!177282) b!323807))

(assert (= (and b!323807 res!177287) b!323804))

(assert (= (and b!323804 res!177280) b!323803))

(assert (= (and b!323803 res!177286) b!323810))

(assert (= (and b!323810 res!177283) b!323806))

(assert (= (and b!323806 res!177288) b!323805))

(assert (= (and b!323805 res!177284) b!323809))

(assert (= (and b!323809 res!177281) b!323811))

(declare-fun m!330463 () Bool)

(assert (=> b!323807 m!330463))

(declare-fun m!330465 () Bool)

(assert (=> b!323804 m!330465))

(declare-fun m!330467 () Bool)

(assert (=> b!323803 m!330467))

(declare-fun m!330469 () Bool)

(assert (=> b!323810 m!330469))

(declare-fun m!330471 () Bool)

(assert (=> b!323805 m!330471))

(declare-fun m!330473 () Bool)

(assert (=> b!323809 m!330473))

(declare-fun m!330475 () Bool)

(assert (=> b!323806 m!330475))

(assert (=> b!323806 m!330475))

(declare-fun m!330477 () Bool)

(assert (=> b!323806 m!330477))

(declare-fun m!330479 () Bool)

(assert (=> start!32426 m!330479))

(declare-fun m!330481 () Bool)

(assert (=> start!32426 m!330481))

(declare-fun m!330483 () Bool)

(assert (=> b!323811 m!330483))

(check-sat (not b!323803) (not b!323809) (not b!323806) (not b!323804) (not b!323807) (not start!32426) (not b!323810))
(check-sat)
