; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32690 () Bool)

(assert start!32690)

(declare-fun b!326808 () Bool)

(declare-fun e!201120 () Bool)

(declare-fun e!201119 () Bool)

(assert (=> b!326808 (= e!201120 e!201119)))

(declare-fun res!179896 () Bool)

(assert (=> b!326808 (=> (not res!179896) (not e!201119))))

(declare-datatypes ((array!16740 0))(
  ( (array!16741 (arr!7924 (Array (_ BitVec 32) (_ BitVec 64))) (size!8276 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16740)

(declare-datatypes ((SeekEntryResult!3020 0))(
  ( (MissingZero!3020 (index!14256 (_ BitVec 32))) (Found!3020 (index!14257 (_ BitVec 32))) (Intermediate!3020 (undefined!3832 Bool) (index!14258 (_ BitVec 32)) (x!32607 (_ BitVec 32))) (Undefined!3020) (MissingVacant!3020 (index!14259 (_ BitVec 32))) )
))
(declare-fun lt!157428 () SeekEntryResult!3020)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16740 (_ BitVec 32)) SeekEntryResult!3020)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326808 (= res!179896 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157428))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!326808 (= lt!157428 (Intermediate!3020 false resIndex!58 resX!58))))

(declare-fun b!326809 () Bool)

(declare-fun res!179894 () Bool)

(assert (=> b!326809 (=> (not res!179894) (not e!201120))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16740 (_ BitVec 32)) Bool)

(assert (=> b!326809 (= res!179894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326810 () Bool)

(declare-fun res!179897 () Bool)

(assert (=> b!326810 (=> (not res!179897) (not e!201120))))

(declare-fun arrayContainsKey!0 (array!16740 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326810 (= res!179897 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326811 () Bool)

(declare-fun res!179893 () Bool)

(assert (=> b!326811 (=> (not res!179893) (not e!201120))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326811 (= res!179893 (validKeyInArray!0 k0!2497))))

(declare-fun b!326812 () Bool)

(declare-fun res!179898 () Bool)

(assert (=> b!326812 (=> (not res!179898) (not e!201119))))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!326812 (= res!179898 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157428))))

(declare-fun b!326813 () Bool)

(declare-fun res!179889 () Bool)

(assert (=> b!326813 (=> (not res!179889) (not e!201119))))

(assert (=> b!326813 (= res!179889 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7924 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326814 () Bool)

(declare-fun res!179892 () Bool)

(assert (=> b!326814 (=> (not res!179892) (not e!201120))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326814 (= res!179892 (and (= (size!8276 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8276 a!3305))))))

(declare-fun b!326815 () Bool)

(assert (=> b!326815 (= e!201119 false)))

(declare-datatypes ((Unit!10108 0))(
  ( (Unit!10109) )
))
(declare-fun lt!157427 () Unit!10108)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16740 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10108)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326815 (= lt!157427 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun res!179895 () Bool)

(assert (=> start!32690 (=> (not res!179895) (not e!201120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32690 (= res!179895 (validMask!0 mask!3777))))

(assert (=> start!32690 e!201120))

(declare-fun array_inv!5874 (array!16740) Bool)

(assert (=> start!32690 (array_inv!5874 a!3305)))

(assert (=> start!32690 true))

(declare-fun b!326816 () Bool)

(declare-fun res!179891 () Bool)

(assert (=> b!326816 (=> (not res!179891) (not e!201119))))

(assert (=> b!326816 (= res!179891 (and (= (select (arr!7924 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8276 a!3305))))))

(declare-fun b!326817 () Bool)

(declare-fun res!179890 () Bool)

(assert (=> b!326817 (=> (not res!179890) (not e!201120))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16740 (_ BitVec 32)) SeekEntryResult!3020)

(assert (=> b!326817 (= res!179890 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3020 i!1250)))))

(assert (= (and start!32690 res!179895) b!326814))

(assert (= (and b!326814 res!179892) b!326811))

(assert (= (and b!326811 res!179893) b!326810))

(assert (= (and b!326810 res!179897) b!326817))

(assert (= (and b!326817 res!179890) b!326809))

(assert (= (and b!326809 res!179894) b!326808))

(assert (= (and b!326808 res!179896) b!326816))

(assert (= (and b!326816 res!179891) b!326812))

(assert (= (and b!326812 res!179898) b!326813))

(assert (= (and b!326813 res!179889) b!326815))

(declare-fun m!333547 () Bool)

(assert (=> b!326816 m!333547))

(declare-fun m!333549 () Bool)

(assert (=> start!32690 m!333549))

(declare-fun m!333551 () Bool)

(assert (=> start!32690 m!333551))

(declare-fun m!333553 () Bool)

(assert (=> b!326808 m!333553))

(assert (=> b!326808 m!333553))

(declare-fun m!333555 () Bool)

(assert (=> b!326808 m!333555))

(declare-fun m!333557 () Bool)

(assert (=> b!326815 m!333557))

(assert (=> b!326815 m!333557))

(declare-fun m!333559 () Bool)

(assert (=> b!326815 m!333559))

(declare-fun m!333561 () Bool)

(assert (=> b!326809 m!333561))

(declare-fun m!333563 () Bool)

(assert (=> b!326813 m!333563))

(declare-fun m!333565 () Bool)

(assert (=> b!326817 m!333565))

(declare-fun m!333567 () Bool)

(assert (=> b!326811 m!333567))

(declare-fun m!333569 () Bool)

(assert (=> b!326812 m!333569))

(declare-fun m!333571 () Bool)

(assert (=> b!326810 m!333571))

(check-sat (not start!32690) (not b!326811) (not b!326815) (not b!326810) (not b!326817) (not b!326809) (not b!326808) (not b!326812))
(check-sat)
