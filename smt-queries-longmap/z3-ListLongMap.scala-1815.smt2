; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32700 () Bool)

(assert start!32700)

(declare-fun b!326801 () Bool)

(declare-fun res!179835 () Bool)

(declare-fun e!201134 () Bool)

(assert (=> b!326801 (=> (not res!179835) (not e!201134))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3054 0))(
  ( (MissingZero!3054 (index!14392 (_ BitVec 32))) (Found!3054 (index!14393 (_ BitVec 32))) (Intermediate!3054 (undefined!3866 Bool) (index!14394 (_ BitVec 32)) (x!32636 (_ BitVec 32))) (Undefined!3054) (MissingVacant!3054 (index!14395 (_ BitVec 32))) )
))
(declare-fun lt!157397 () SeekEntryResult!3054)

(declare-datatypes ((array!16737 0))(
  ( (array!16738 (arr!7923 (Array (_ BitVec 32) (_ BitVec 64))) (size!8275 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16737)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16737 (_ BitVec 32)) SeekEntryResult!3054)

(assert (=> b!326801 (= res!179835 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157397))))

(declare-fun b!326802 () Bool)

(declare-fun res!179838 () Bool)

(declare-fun e!201136 () Bool)

(assert (=> b!326802 (=> (not res!179838) (not e!201136))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326802 (= res!179838 (and (= (size!8275 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8275 a!3305))))))

(declare-fun b!326803 () Bool)

(declare-fun res!179840 () Bool)

(assert (=> b!326803 (=> (not res!179840) (not e!201134))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!326803 (= res!179840 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7923 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326804 () Bool)

(assert (=> b!326804 (= e!201134 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10142 0))(
  ( (Unit!10143) )
))
(declare-fun lt!157398 () Unit!10142)

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16737 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10142)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326804 (= lt!157398 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326805 () Bool)

(assert (=> b!326805 (= e!201136 e!201134)))

(declare-fun res!179832 () Bool)

(assert (=> b!326805 (=> (not res!179832) (not e!201134))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326805 (= res!179832 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157397))))

(assert (=> b!326805 (= lt!157397 (Intermediate!3054 false resIndex!58 resX!58))))

(declare-fun res!179833 () Bool)

(assert (=> start!32700 (=> (not res!179833) (not e!201136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32700 (= res!179833 (validMask!0 mask!3777))))

(assert (=> start!32700 e!201136))

(declare-fun array_inv!5886 (array!16737) Bool)

(assert (=> start!32700 (array_inv!5886 a!3305)))

(assert (=> start!32700 true))

(declare-fun b!326806 () Bool)

(declare-fun res!179839 () Bool)

(assert (=> b!326806 (=> (not res!179839) (not e!201136))))

(declare-fun arrayContainsKey!0 (array!16737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326806 (= res!179839 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326807 () Bool)

(declare-fun res!179841 () Bool)

(assert (=> b!326807 (=> (not res!179841) (not e!201136))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16737 (_ BitVec 32)) Bool)

(assert (=> b!326807 (= res!179841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326808 () Bool)

(declare-fun res!179837 () Bool)

(assert (=> b!326808 (=> (not res!179837) (not e!201136))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326808 (= res!179837 (validKeyInArray!0 k0!2497))))

(declare-fun b!326809 () Bool)

(declare-fun res!179836 () Bool)

(assert (=> b!326809 (=> (not res!179836) (not e!201136))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16737 (_ BitVec 32)) SeekEntryResult!3054)

(assert (=> b!326809 (= res!179836 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3054 i!1250)))))

(declare-fun b!326810 () Bool)

(declare-fun res!179834 () Bool)

(assert (=> b!326810 (=> (not res!179834) (not e!201134))))

(assert (=> b!326810 (= res!179834 (and (= (select (arr!7923 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8275 a!3305))))))

(assert (= (and start!32700 res!179833) b!326802))

(assert (= (and b!326802 res!179838) b!326808))

(assert (= (and b!326808 res!179837) b!326806))

(assert (= (and b!326806 res!179839) b!326809))

(assert (= (and b!326809 res!179836) b!326807))

(assert (= (and b!326807 res!179841) b!326805))

(assert (= (and b!326805 res!179832) b!326810))

(assert (= (and b!326810 res!179834) b!326801))

(assert (= (and b!326801 res!179835) b!326803))

(assert (= (and b!326803 res!179840) b!326804))

(declare-fun m!333301 () Bool)

(assert (=> b!326806 m!333301))

(declare-fun m!333303 () Bool)

(assert (=> b!326804 m!333303))

(assert (=> b!326804 m!333303))

(declare-fun m!333305 () Bool)

(assert (=> b!326804 m!333305))

(declare-fun m!333307 () Bool)

(assert (=> b!326807 m!333307))

(declare-fun m!333309 () Bool)

(assert (=> b!326801 m!333309))

(declare-fun m!333311 () Bool)

(assert (=> b!326810 m!333311))

(declare-fun m!333313 () Bool)

(assert (=> start!32700 m!333313))

(declare-fun m!333315 () Bool)

(assert (=> start!32700 m!333315))

(declare-fun m!333317 () Bool)

(assert (=> b!326803 m!333317))

(declare-fun m!333319 () Bool)

(assert (=> b!326805 m!333319))

(assert (=> b!326805 m!333319))

(declare-fun m!333321 () Bool)

(assert (=> b!326805 m!333321))

(declare-fun m!333323 () Bool)

(assert (=> b!326808 m!333323))

(declare-fun m!333325 () Bool)

(assert (=> b!326809 m!333325))

(check-sat (not start!32700) (not b!326804) (not b!326801) (not b!326806) (not b!326809) (not b!326807) (not b!326805) (not b!326808))
(check-sat)
