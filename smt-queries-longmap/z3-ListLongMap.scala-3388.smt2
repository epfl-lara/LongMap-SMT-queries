; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46728 () Bool)

(assert start!46728)

(declare-fun b!515802 () Bool)

(declare-fun e!301064 () Bool)

(declare-fun e!301061 () Bool)

(assert (=> b!515802 (= e!301064 (not e!301061))))

(declare-fun res!315513 () Bool)

(assert (=> b!515802 (=> res!315513 e!301061)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33050 0))(
  ( (array!33051 (arr!15893 (Array (_ BitVec 32) (_ BitVec 64))) (size!16258 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33050)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!236019 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4357 0))(
  ( (MissingZero!4357 (index!19616 (_ BitVec 32))) (Found!4357 (index!19617 (_ BitVec 32))) (Intermediate!4357 (undefined!5169 Bool) (index!19618 (_ BitVec 32)) (x!48587 (_ BitVec 32))) (Undefined!4357) (MissingVacant!4357 (index!19619 (_ BitVec 32))) )
))
(declare-fun lt!236018 () SeekEntryResult!4357)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33050 (_ BitVec 32)) SeekEntryResult!4357)

(assert (=> b!515802 (= res!315513 (= lt!236018 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236019 (select (store (arr!15893 a!3235) i!1204 k0!2280) j!176) (array!33051 (store (arr!15893 a!3235) i!1204 k0!2280) (size!16258 a!3235)) mask!3524)))))

(declare-fun lt!236020 () (_ BitVec 32))

(assert (=> b!515802 (= lt!236018 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236020 (select (arr!15893 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515802 (= lt!236019 (toIndex!0 (select (store (arr!15893 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515802 (= lt!236020 (toIndex!0 (select (arr!15893 a!3235) j!176) mask!3524))))

(declare-fun e!301065 () Bool)

(assert (=> b!515802 e!301065))

(declare-fun res!315509 () Bool)

(assert (=> b!515802 (=> (not res!315509) (not e!301065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33050 (_ BitVec 32)) Bool)

(assert (=> b!515802 (= res!315509 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15958 0))(
  ( (Unit!15959) )
))
(declare-fun lt!236016 () Unit!15958)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33050 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15958)

(assert (=> b!515802 (= lt!236016 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515803 () Bool)

(declare-fun e!301063 () Bool)

(assert (=> b!515803 (= e!301063 e!301064)))

(declare-fun res!315516 () Bool)

(assert (=> b!515803 (=> (not res!315516) (not e!301064))))

(declare-fun lt!236017 () SeekEntryResult!4357)

(assert (=> b!515803 (= res!315516 (or (= lt!236017 (MissingZero!4357 i!1204)) (= lt!236017 (MissingVacant!4357 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33050 (_ BitVec 32)) SeekEntryResult!4357)

(assert (=> b!515803 (= lt!236017 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!515804 () Bool)

(assert (=> b!515804 (= e!301065 (= (seekEntryOrOpen!0 (select (arr!15893 a!3235) j!176) a!3235 mask!3524) (Found!4357 j!176)))))

(declare-fun b!515805 () Bool)

(declare-fun res!315514 () Bool)

(assert (=> b!515805 (=> (not res!315514) (not e!301063))))

(assert (=> b!515805 (= res!315514 (and (= (size!16258 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16258 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16258 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!315515 () Bool)

(assert (=> start!46728 (=> (not res!315515) (not e!301063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46728 (= res!315515 (validMask!0 mask!3524))))

(assert (=> start!46728 e!301063))

(assert (=> start!46728 true))

(declare-fun array_inv!11776 (array!33050) Bool)

(assert (=> start!46728 (array_inv!11776 a!3235)))

(declare-fun b!515806 () Bool)

(declare-fun res!315511 () Bool)

(assert (=> b!515806 (=> res!315511 e!301061)))

(get-info :version)

(assert (=> b!515806 (= res!315511 (or (undefined!5169 lt!236018) (not ((_ is Intermediate!4357) lt!236018))))))

(declare-fun b!515807 () Bool)

(declare-fun res!315510 () Bool)

(assert (=> b!515807 (=> (not res!315510) (not e!301064))))

(assert (=> b!515807 (= res!315510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515808 () Bool)

(declare-fun res!315512 () Bool)

(assert (=> b!515808 (=> (not res!315512) (not e!301064))))

(declare-datatypes ((List!10090 0))(
  ( (Nil!10087) (Cons!10086 (h!10984 (_ BitVec 64)) (t!16309 List!10090)) )
))
(declare-fun arrayNoDuplicates!0 (array!33050 (_ BitVec 32) List!10090) Bool)

(assert (=> b!515808 (= res!315512 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10087))))

(declare-fun b!515809 () Bool)

(declare-fun res!315517 () Bool)

(assert (=> b!515809 (=> (not res!315517) (not e!301063))))

(declare-fun arrayContainsKey!0 (array!33050 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515809 (= res!315517 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515810 () Bool)

(declare-fun res!315518 () Bool)

(assert (=> b!515810 (=> (not res!315518) (not e!301063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515810 (= res!315518 (validKeyInArray!0 (select (arr!15893 a!3235) j!176)))))

(declare-fun b!515811 () Bool)

(declare-fun res!315508 () Bool)

(assert (=> b!515811 (=> (not res!315508) (not e!301063))))

(assert (=> b!515811 (= res!315508 (validKeyInArray!0 k0!2280))))

(declare-fun b!515812 () Bool)

(assert (=> b!515812 (= e!301061 true)))

(assert (=> b!515812 (and (bvslt (x!48587 lt!236018) #b01111111111111111111111111111110) (or (= (select (arr!15893 a!3235) (index!19618 lt!236018)) (select (arr!15893 a!3235) j!176)) (= (select (arr!15893 a!3235) (index!19618 lt!236018)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15893 a!3235) (index!19618 lt!236018)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!46728 res!315515) b!515805))

(assert (= (and b!515805 res!315514) b!515810))

(assert (= (and b!515810 res!315518) b!515811))

(assert (= (and b!515811 res!315508) b!515809))

(assert (= (and b!515809 res!315517) b!515803))

(assert (= (and b!515803 res!315516) b!515807))

(assert (= (and b!515807 res!315510) b!515808))

(assert (= (and b!515808 res!315512) b!515802))

(assert (= (and b!515802 res!315509) b!515804))

(assert (= (and b!515802 (not res!315513)) b!515806))

(assert (= (and b!515806 (not res!315511)) b!515812))

(declare-fun m!496753 () Bool)

(assert (=> start!46728 m!496753))

(declare-fun m!496755 () Bool)

(assert (=> start!46728 m!496755))

(declare-fun m!496757 () Bool)

(assert (=> b!515811 m!496757))

(declare-fun m!496759 () Bool)

(assert (=> b!515807 m!496759))

(declare-fun m!496761 () Bool)

(assert (=> b!515803 m!496761))

(declare-fun m!496763 () Bool)

(assert (=> b!515810 m!496763))

(assert (=> b!515810 m!496763))

(declare-fun m!496765 () Bool)

(assert (=> b!515810 m!496765))

(declare-fun m!496767 () Bool)

(assert (=> b!515812 m!496767))

(assert (=> b!515812 m!496763))

(declare-fun m!496769 () Bool)

(assert (=> b!515808 m!496769))

(declare-fun m!496771 () Bool)

(assert (=> b!515809 m!496771))

(assert (=> b!515804 m!496763))

(assert (=> b!515804 m!496763))

(declare-fun m!496773 () Bool)

(assert (=> b!515804 m!496773))

(declare-fun m!496775 () Bool)

(assert (=> b!515802 m!496775))

(declare-fun m!496777 () Bool)

(assert (=> b!515802 m!496777))

(declare-fun m!496779 () Bool)

(assert (=> b!515802 m!496779))

(assert (=> b!515802 m!496763))

(declare-fun m!496781 () Bool)

(assert (=> b!515802 m!496781))

(assert (=> b!515802 m!496763))

(declare-fun m!496783 () Bool)

(assert (=> b!515802 m!496783))

(assert (=> b!515802 m!496779))

(declare-fun m!496785 () Bool)

(assert (=> b!515802 m!496785))

(assert (=> b!515802 m!496763))

(declare-fun m!496787 () Bool)

(assert (=> b!515802 m!496787))

(assert (=> b!515802 m!496779))

(declare-fun m!496789 () Bool)

(assert (=> b!515802 m!496789))

(check-sat (not b!515809) (not b!515810) (not b!515802) (not b!515811) (not start!46728) (not b!515803) (not b!515804) (not b!515807) (not b!515808))
(check-sat)
