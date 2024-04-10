; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48020 () Bool)

(assert start!48020)

(declare-fun b!528874 () Bool)

(declare-fun e!308202 () Bool)

(declare-fun e!308201 () Bool)

(assert (=> b!528874 (= e!308202 e!308201)))

(declare-fun res!324814 () Bool)

(assert (=> b!528874 (=> (not res!324814) (not e!308201))))

(declare-datatypes ((SeekEntryResult!4572 0))(
  ( (MissingZero!4572 (index!20512 (_ BitVec 32))) (Found!4572 (index!20513 (_ BitVec 32))) (Intermediate!4572 (undefined!5384 Bool) (index!20514 (_ BitVec 32)) (x!49484 (_ BitVec 32))) (Undefined!4572) (MissingVacant!4572 (index!20515 (_ BitVec 32))) )
))
(declare-fun lt!243676 () SeekEntryResult!4572)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!528874 (= res!324814 (or (= lt!243676 (MissingZero!4572 i!1204)) (= lt!243676 (MissingVacant!4572 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33513 0))(
  ( (array!33514 (arr!16105 (Array (_ BitVec 32) (_ BitVec 64))) (size!16469 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33513)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33513 (_ BitVec 32)) SeekEntryResult!4572)

(assert (=> b!528874 (= lt!243676 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!528875 () Bool)

(declare-fun res!324808 () Bool)

(assert (=> b!528875 (=> (not res!324808) (not e!308202))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!528875 (= res!324808 (validKeyInArray!0 (select (arr!16105 a!3235) j!176)))))

(declare-fun b!528876 () Bool)

(declare-datatypes ((Unit!16740 0))(
  ( (Unit!16741) )
))
(declare-fun e!308195 () Unit!16740)

(declare-fun Unit!16742 () Unit!16740)

(assert (=> b!528876 (= e!308195 Unit!16742)))

(declare-fun b!528877 () Bool)

(declare-fun e!308199 () Bool)

(assert (=> b!528877 (= e!308199 true)))

(declare-fun lt!243677 () array!33513)

(declare-fun lt!243685 () (_ BitVec 64))

(declare-fun lt!243682 () SeekEntryResult!4572)

(assert (=> b!528877 (= (seekEntryOrOpen!0 lt!243685 lt!243677 mask!3524) lt!243682)))

(declare-fun lt!243687 () (_ BitVec 32))

(declare-fun lt!243678 () Unit!16740)

(declare-fun lt!243688 () SeekEntryResult!4572)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!33513 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16740)

(assert (=> b!528877 (= lt!243678 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!243687 #b00000000000000000000000000000000 (index!20514 lt!243688) (x!49484 lt!243688) mask!3524))))

(declare-fun b!528878 () Bool)

(declare-fun e!308194 () Bool)

(assert (=> b!528878 (= e!308194 e!308199)))

(declare-fun res!324821 () Bool)

(assert (=> b!528878 (=> res!324821 e!308199)))

(assert (=> b!528878 (= res!324821 (or (bvsgt (x!49484 lt!243688) #b01111111111111111111111111111110) (bvslt lt!243687 #b00000000000000000000000000000000) (bvsge lt!243687 (size!16469 a!3235)) (bvslt (index!20514 lt!243688) #b00000000000000000000000000000000) (bvsge (index!20514 lt!243688) (size!16469 a!3235)) (not (= lt!243688 (Intermediate!4572 false (index!20514 lt!243688) (x!49484 lt!243688))))))))

(assert (=> b!528878 (= (index!20514 lt!243688) i!1204)))

(declare-fun lt!243686 () Unit!16740)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33513 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16740)

(assert (=> b!528878 (= lt!243686 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!243687 #b00000000000000000000000000000000 (index!20514 lt!243688) (x!49484 lt!243688) mask!3524))))

(assert (=> b!528878 (and (or (= (select (arr!16105 a!3235) (index!20514 lt!243688)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16105 a!3235) (index!20514 lt!243688)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16105 a!3235) (index!20514 lt!243688)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16105 a!3235) (index!20514 lt!243688)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243681 () Unit!16740)

(assert (=> b!528878 (= lt!243681 e!308195)))

(declare-fun c!62342 () Bool)

(assert (=> b!528878 (= c!62342 (= (select (arr!16105 a!3235) (index!20514 lt!243688)) (select (arr!16105 a!3235) j!176)))))

(assert (=> b!528878 (and (bvslt (x!49484 lt!243688) #b01111111111111111111111111111110) (or (= (select (arr!16105 a!3235) (index!20514 lt!243688)) (select (arr!16105 a!3235) j!176)) (= (select (arr!16105 a!3235) (index!20514 lt!243688)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16105 a!3235) (index!20514 lt!243688)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!528879 () Bool)

(declare-fun res!324818 () Bool)

(assert (=> b!528879 (=> (not res!324818) (not e!308202))))

(assert (=> b!528879 (= res!324818 (and (= (size!16469 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16469 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16469 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!528880 () Bool)

(declare-fun res!324820 () Bool)

(assert (=> b!528880 (=> res!324820 e!308199)))

(declare-fun lt!243683 () SeekEntryResult!4572)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33513 (_ BitVec 32)) SeekEntryResult!4572)

(assert (=> b!528880 (= res!324820 (not (= lt!243683 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243687 lt!243685 lt!243677 mask!3524))))))

(declare-fun b!528881 () Bool)

(declare-fun Unit!16743 () Unit!16740)

(assert (=> b!528881 (= e!308195 Unit!16743)))

(declare-fun lt!243680 () Unit!16740)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33513 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16740)

(assert (=> b!528881 (= lt!243680 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!243687 #b00000000000000000000000000000000 (index!20514 lt!243688) (x!49484 lt!243688) mask!3524))))

(declare-fun res!324811 () Bool)

(assert (=> b!528881 (= res!324811 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243687 lt!243685 lt!243677 mask!3524) (Intermediate!4572 false (index!20514 lt!243688) (x!49484 lt!243688))))))

(declare-fun e!308198 () Bool)

(assert (=> b!528881 (=> (not res!324811) (not e!308198))))

(assert (=> b!528881 e!308198))

(declare-fun b!528882 () Bool)

(declare-fun res!324819 () Bool)

(assert (=> b!528882 (=> (not res!324819) (not e!308201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33513 (_ BitVec 32)) Bool)

(assert (=> b!528882 (= res!324819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!308196 () Bool)

(declare-fun b!528883 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33513 (_ BitVec 32)) SeekEntryResult!4572)

(assert (=> b!528883 (= e!308196 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243687 (index!20514 lt!243688) (select (arr!16105 a!3235) j!176) a!3235 mask!3524) lt!243682)))))

(declare-fun b!528884 () Bool)

(declare-fun res!324815 () Bool)

(assert (=> b!528884 (=> res!324815 e!308199)))

(assert (=> b!528884 (= res!324815 e!308196)))

(declare-fun res!324810 () Bool)

(assert (=> b!528884 (=> (not res!324810) (not e!308196))))

(assert (=> b!528884 (= res!324810 (bvsgt #b00000000000000000000000000000000 (x!49484 lt!243688)))))

(declare-fun res!324812 () Bool)

(assert (=> start!48020 (=> (not res!324812) (not e!308202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48020 (= res!324812 (validMask!0 mask!3524))))

(assert (=> start!48020 e!308202))

(assert (=> start!48020 true))

(declare-fun array_inv!11901 (array!33513) Bool)

(assert (=> start!48020 (array_inv!11901 a!3235)))

(declare-fun b!528885 () Bool)

(declare-fun res!324816 () Bool)

(assert (=> b!528885 (=> (not res!324816) (not e!308202))))

(declare-fun arrayContainsKey!0 (array!33513 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!528885 (= res!324816 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!528886 () Bool)

(declare-fun res!324807 () Bool)

(assert (=> b!528886 (=> (not res!324807) (not e!308201))))

(declare-datatypes ((List!10263 0))(
  ( (Nil!10260) (Cons!10259 (h!11196 (_ BitVec 64)) (t!16491 List!10263)) )
))
(declare-fun arrayNoDuplicates!0 (array!33513 (_ BitVec 32) List!10263) Bool)

(assert (=> b!528886 (= res!324807 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10260))))

(declare-fun b!528887 () Bool)

(assert (=> b!528887 (= e!308198 false)))

(declare-fun b!528888 () Bool)

(declare-fun res!324813 () Bool)

(assert (=> b!528888 (=> (not res!324813) (not e!308202))))

(assert (=> b!528888 (= res!324813 (validKeyInArray!0 k0!2280))))

(declare-fun e!308197 () Bool)

(declare-fun b!528889 () Bool)

(assert (=> b!528889 (= e!308197 (= (seekEntryOrOpen!0 (select (arr!16105 a!3235) j!176) a!3235 mask!3524) (Found!4572 j!176)))))

(declare-fun b!528890 () Bool)

(assert (=> b!528890 (= e!308201 (not e!308194))))

(declare-fun res!324817 () Bool)

(assert (=> b!528890 (=> res!324817 e!308194)))

(get-info :version)

(assert (=> b!528890 (= res!324817 (or (= lt!243688 lt!243683) (undefined!5384 lt!243688) (not ((_ is Intermediate!4572) lt!243688))))))

(declare-fun lt!243679 () (_ BitVec 32))

(assert (=> b!528890 (= lt!243683 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243679 lt!243685 lt!243677 mask!3524))))

(assert (=> b!528890 (= lt!243688 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243687 (select (arr!16105 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!528890 (= lt!243679 (toIndex!0 lt!243685 mask!3524))))

(assert (=> b!528890 (= lt!243685 (select (store (arr!16105 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!528890 (= lt!243687 (toIndex!0 (select (arr!16105 a!3235) j!176) mask!3524))))

(assert (=> b!528890 (= lt!243677 (array!33514 (store (arr!16105 a!3235) i!1204 k0!2280) (size!16469 a!3235)))))

(assert (=> b!528890 (= lt!243682 (Found!4572 j!176))))

(assert (=> b!528890 e!308197))

(declare-fun res!324809 () Bool)

(assert (=> b!528890 (=> (not res!324809) (not e!308197))))

(assert (=> b!528890 (= res!324809 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!243684 () Unit!16740)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33513 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16740)

(assert (=> b!528890 (= lt!243684 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!48020 res!324812) b!528879))

(assert (= (and b!528879 res!324818) b!528875))

(assert (= (and b!528875 res!324808) b!528888))

(assert (= (and b!528888 res!324813) b!528885))

(assert (= (and b!528885 res!324816) b!528874))

(assert (= (and b!528874 res!324814) b!528882))

(assert (= (and b!528882 res!324819) b!528886))

(assert (= (and b!528886 res!324807) b!528890))

(assert (= (and b!528890 res!324809) b!528889))

(assert (= (and b!528890 (not res!324817)) b!528878))

(assert (= (and b!528878 c!62342) b!528881))

(assert (= (and b!528878 (not c!62342)) b!528876))

(assert (= (and b!528881 res!324811) b!528887))

(assert (= (and b!528878 (not res!324821)) b!528884))

(assert (= (and b!528884 res!324810) b!528883))

(assert (= (and b!528884 (not res!324815)) b!528880))

(assert (= (and b!528880 (not res!324820)) b!528877))

(declare-fun m!509405 () Bool)

(assert (=> b!528877 m!509405))

(declare-fun m!509407 () Bool)

(assert (=> b!528877 m!509407))

(declare-fun m!509409 () Bool)

(assert (=> b!528885 m!509409))

(declare-fun m!509411 () Bool)

(assert (=> b!528881 m!509411))

(declare-fun m!509413 () Bool)

(assert (=> b!528881 m!509413))

(declare-fun m!509415 () Bool)

(assert (=> b!528886 m!509415))

(declare-fun m!509417 () Bool)

(assert (=> b!528888 m!509417))

(assert (=> b!528880 m!509413))

(declare-fun m!509419 () Bool)

(assert (=> b!528883 m!509419))

(assert (=> b!528883 m!509419))

(declare-fun m!509421 () Bool)

(assert (=> b!528883 m!509421))

(declare-fun m!509423 () Bool)

(assert (=> start!48020 m!509423))

(declare-fun m!509425 () Bool)

(assert (=> start!48020 m!509425))

(assert (=> b!528889 m!509419))

(assert (=> b!528889 m!509419))

(declare-fun m!509427 () Bool)

(assert (=> b!528889 m!509427))

(declare-fun m!509429 () Bool)

(assert (=> b!528882 m!509429))

(declare-fun m!509431 () Bool)

(assert (=> b!528890 m!509431))

(declare-fun m!509433 () Bool)

(assert (=> b!528890 m!509433))

(declare-fun m!509435 () Bool)

(assert (=> b!528890 m!509435))

(assert (=> b!528890 m!509419))

(declare-fun m!509437 () Bool)

(assert (=> b!528890 m!509437))

(declare-fun m!509439 () Bool)

(assert (=> b!528890 m!509439))

(assert (=> b!528890 m!509419))

(declare-fun m!509441 () Bool)

(assert (=> b!528890 m!509441))

(assert (=> b!528890 m!509419))

(declare-fun m!509443 () Bool)

(assert (=> b!528890 m!509443))

(declare-fun m!509445 () Bool)

(assert (=> b!528890 m!509445))

(declare-fun m!509447 () Bool)

(assert (=> b!528874 m!509447))

(assert (=> b!528875 m!509419))

(assert (=> b!528875 m!509419))

(declare-fun m!509449 () Bool)

(assert (=> b!528875 m!509449))

(declare-fun m!509451 () Bool)

(assert (=> b!528878 m!509451))

(declare-fun m!509453 () Bool)

(assert (=> b!528878 m!509453))

(assert (=> b!528878 m!509419))

(check-sat (not b!528878) (not b!528881) (not b!528890) (not b!528889) (not b!528883) (not b!528875) (not b!528877) (not start!48020) (not b!528874) (not b!528886) (not b!528882) (not b!528888) (not b!528880) (not b!528885))
(check-sat)
