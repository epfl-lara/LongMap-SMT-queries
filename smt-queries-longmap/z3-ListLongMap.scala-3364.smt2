; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46238 () Bool)

(assert start!46238)

(declare-fun b!512060 () Bool)

(declare-fun res!312725 () Bool)

(declare-fun e!299112 () Bool)

(assert (=> b!512060 (=> (not res!312725) (not e!299112))))

(declare-datatypes ((array!32892 0))(
  ( (array!32893 (arr!15823 (Array (_ BitVec 32) (_ BitVec 64))) (size!16187 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32892)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512060 (= res!312725 (validKeyInArray!0 (select (arr!15823 a!3235) j!176)))))

(declare-fun b!512061 () Bool)

(declare-fun res!312722 () Bool)

(declare-fun e!299115 () Bool)

(assert (=> b!512061 (=> res!312722 e!299115)))

(declare-datatypes ((SeekEntryResult!4290 0))(
  ( (MissingZero!4290 (index!19348 (_ BitVec 32))) (Found!4290 (index!19349 (_ BitVec 32))) (Intermediate!4290 (undefined!5102 Bool) (index!19350 (_ BitVec 32)) (x!48297 (_ BitVec 32))) (Undefined!4290) (MissingVacant!4290 (index!19351 (_ BitVec 32))) )
))
(declare-fun lt!234355 () SeekEntryResult!4290)

(get-info :version)

(assert (=> b!512061 (= res!312722 (or (not ((_ is Intermediate!4290) lt!234355)) (not (undefined!5102 lt!234355))))))

(declare-fun b!512062 () Bool)

(declare-fun res!312726 () Bool)

(assert (=> b!512062 (=> (not res!312726) (not e!299112))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!512062 (= res!312726 (validKeyInArray!0 k0!2280))))

(declare-fun b!512063 () Bool)

(declare-fun res!312728 () Bool)

(assert (=> b!512063 (=> (not res!312728) (not e!299112))))

(declare-fun arrayContainsKey!0 (array!32892 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512063 (= res!312728 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512064 () Bool)

(declare-fun res!312723 () Bool)

(declare-fun e!299114 () Bool)

(assert (=> b!512064 (=> (not res!312723) (not e!299114))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32892 (_ BitVec 32)) Bool)

(assert (=> b!512064 (= res!312723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512065 () Bool)

(assert (=> b!512065 (= e!299112 e!299114)))

(declare-fun res!312724 () Bool)

(assert (=> b!512065 (=> (not res!312724) (not e!299114))))

(declare-fun lt!234357 () SeekEntryResult!4290)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!512065 (= res!312724 (or (= lt!234357 (MissingZero!4290 i!1204)) (= lt!234357 (MissingVacant!4290 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32892 (_ BitVec 32)) SeekEntryResult!4290)

(assert (=> b!512065 (= lt!234357 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!512067 () Bool)

(assert (=> b!512067 (= e!299115 false)))

(declare-fun lt!234356 () SeekEntryResult!4290)

(assert (=> b!512067 (= lt!234356 Undefined!4290)))

(declare-fun b!512068 () Bool)

(declare-fun res!312730 () Bool)

(assert (=> b!512068 (=> (not res!312730) (not e!299112))))

(assert (=> b!512068 (= res!312730 (and (= (size!16187 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16187 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16187 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512069 () Bool)

(assert (=> b!512069 (= e!299114 (not e!299115))))

(declare-fun res!312727 () Bool)

(assert (=> b!512069 (=> res!312727 e!299115)))

(declare-fun lt!234354 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32892 (_ BitVec 32)) SeekEntryResult!4290)

(assert (=> b!512069 (= res!312727 (= lt!234355 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234354 (select (store (arr!15823 a!3235) i!1204 k0!2280) j!176) (array!32893 (store (arr!15823 a!3235) i!1204 k0!2280) (size!16187 a!3235)) mask!3524)))))

(declare-fun lt!234358 () (_ BitVec 32))

(assert (=> b!512069 (= lt!234355 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234358 (select (arr!15823 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512069 (= lt!234354 (toIndex!0 (select (store (arr!15823 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!512069 (= lt!234358 (toIndex!0 (select (arr!15823 a!3235) j!176) mask!3524))))

(assert (=> b!512069 (= lt!234356 (Found!4290 j!176))))

(assert (=> b!512069 (= lt!234356 (seekEntryOrOpen!0 (select (arr!15823 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!512069 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15838 0))(
  ( (Unit!15839) )
))
(declare-fun lt!234353 () Unit!15838)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32892 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15838)

(assert (=> b!512069 (= lt!234353 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512066 () Bool)

(declare-fun res!312729 () Bool)

(assert (=> b!512066 (=> (not res!312729) (not e!299114))))

(declare-datatypes ((List!9981 0))(
  ( (Nil!9978) (Cons!9977 (h!10857 (_ BitVec 64)) (t!16209 List!9981)) )
))
(declare-fun arrayNoDuplicates!0 (array!32892 (_ BitVec 32) List!9981) Bool)

(assert (=> b!512066 (= res!312729 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9978))))

(declare-fun res!312731 () Bool)

(assert (=> start!46238 (=> (not res!312731) (not e!299112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46238 (= res!312731 (validMask!0 mask!3524))))

(assert (=> start!46238 e!299112))

(assert (=> start!46238 true))

(declare-fun array_inv!11619 (array!32892) Bool)

(assert (=> start!46238 (array_inv!11619 a!3235)))

(assert (= (and start!46238 res!312731) b!512068))

(assert (= (and b!512068 res!312730) b!512060))

(assert (= (and b!512060 res!312725) b!512062))

(assert (= (and b!512062 res!312726) b!512063))

(assert (= (and b!512063 res!312728) b!512065))

(assert (= (and b!512065 res!312724) b!512064))

(assert (= (and b!512064 res!312723) b!512066))

(assert (= (and b!512066 res!312729) b!512069))

(assert (= (and b!512069 (not res!312727)) b!512061))

(assert (= (and b!512061 (not res!312722)) b!512067))

(declare-fun m!493641 () Bool)

(assert (=> b!512062 m!493641))

(declare-fun m!493643 () Bool)

(assert (=> start!46238 m!493643))

(declare-fun m!493645 () Bool)

(assert (=> start!46238 m!493645))

(declare-fun m!493647 () Bool)

(assert (=> b!512064 m!493647))

(declare-fun m!493649 () Bool)

(assert (=> b!512063 m!493649))

(declare-fun m!493651 () Bool)

(assert (=> b!512066 m!493651))

(declare-fun m!493653 () Bool)

(assert (=> b!512065 m!493653))

(declare-fun m!493655 () Bool)

(assert (=> b!512069 m!493655))

(declare-fun m!493657 () Bool)

(assert (=> b!512069 m!493657))

(declare-fun m!493659 () Bool)

(assert (=> b!512069 m!493659))

(declare-fun m!493661 () Bool)

(assert (=> b!512069 m!493661))

(declare-fun m!493663 () Bool)

(assert (=> b!512069 m!493663))

(assert (=> b!512069 m!493661))

(declare-fun m!493665 () Bool)

(assert (=> b!512069 m!493665))

(assert (=> b!512069 m!493659))

(declare-fun m!493667 () Bool)

(assert (=> b!512069 m!493667))

(assert (=> b!512069 m!493661))

(declare-fun m!493669 () Bool)

(assert (=> b!512069 m!493669))

(assert (=> b!512069 m!493661))

(declare-fun m!493671 () Bool)

(assert (=> b!512069 m!493671))

(assert (=> b!512069 m!493659))

(declare-fun m!493673 () Bool)

(assert (=> b!512069 m!493673))

(assert (=> b!512060 m!493661))

(assert (=> b!512060 m!493661))

(declare-fun m!493675 () Bool)

(assert (=> b!512060 m!493675))

(check-sat (not b!512065) (not b!512066) (not b!512069) (not b!512062) (not b!512064) (not b!512060) (not start!46238) (not b!512063))
(check-sat)
