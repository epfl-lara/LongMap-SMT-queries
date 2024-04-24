; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45482 () Bool)

(assert start!45482)

(declare-fun b!500970 () Bool)

(declare-fun res!302778 () Bool)

(declare-fun e!293481 () Bool)

(assert (=> b!500970 (=> (not res!302778) (not e!293481))))

(declare-datatypes ((array!32308 0))(
  ( (array!32309 (arr!15535 (Array (_ BitVec 32) (_ BitVec 64))) (size!15899 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32308)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32308 (_ BitVec 32)) Bool)

(assert (=> b!500970 (= res!302778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500972 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!293483 () Bool)

(declare-datatypes ((SeekEntryResult!3958 0))(
  ( (MissingZero!3958 (index!18014 (_ BitVec 32))) (Found!3958 (index!18015 (_ BitVec 32))) (Intermediate!3958 (undefined!4770 Bool) (index!18016 (_ BitVec 32)) (x!47192 (_ BitVec 32))) (Undefined!3958) (MissingVacant!3958 (index!18017 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32308 (_ BitVec 32)) SeekEntryResult!3958)

(assert (=> b!500972 (= e!293483 (= (seekEntryOrOpen!0 (select (arr!15535 a!3235) j!176) a!3235 mask!3524) (Found!3958 j!176)))))

(declare-fun b!500973 () Bool)

(declare-fun res!302781 () Bool)

(declare-fun e!293479 () Bool)

(assert (=> b!500973 (=> (not res!302781) (not e!293479))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500973 (= res!302781 (validKeyInArray!0 k0!2280))))

(declare-fun b!500974 () Bool)

(declare-fun e!293480 () Bool)

(assert (=> b!500974 (= e!293480 (bvsge mask!3524 #b00000000000000000000000000000000))))

(declare-fun lt!227530 () SeekEntryResult!3958)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500974 (= (index!18016 lt!227530) i!1204)))

(declare-datatypes ((Unit!15067 0))(
  ( (Unit!15068) )
))
(declare-fun lt!227525 () Unit!15067)

(declare-fun lt!227529 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32308 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15067)

(assert (=> b!500974 (= lt!227525 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!227529 #b00000000000000000000000000000000 (index!18016 lt!227530) (x!47192 lt!227530) mask!3524))))

(assert (=> b!500974 (and (or (= (select (arr!15535 a!3235) (index!18016 lt!227530)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15535 a!3235) (index!18016 lt!227530)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15535 a!3235) (index!18016 lt!227530)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15535 a!3235) (index!18016 lt!227530)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227524 () Unit!15067)

(declare-fun e!293482 () Unit!15067)

(assert (=> b!500974 (= lt!227524 e!293482)))

(declare-fun c!59375 () Bool)

(assert (=> b!500974 (= c!59375 (= (select (arr!15535 a!3235) (index!18016 lt!227530)) (select (arr!15535 a!3235) j!176)))))

(assert (=> b!500974 (and (bvslt (x!47192 lt!227530) #b01111111111111111111111111111110) (or (= (select (arr!15535 a!3235) (index!18016 lt!227530)) (select (arr!15535 a!3235) j!176)) (= (select (arr!15535 a!3235) (index!18016 lt!227530)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15535 a!3235) (index!18016 lt!227530)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500975 () Bool)

(assert (=> b!500975 (= e!293479 e!293481)))

(declare-fun res!302776 () Bool)

(assert (=> b!500975 (=> (not res!302776) (not e!293481))))

(declare-fun lt!227527 () SeekEntryResult!3958)

(assert (=> b!500975 (= res!302776 (or (= lt!227527 (MissingZero!3958 i!1204)) (= lt!227527 (MissingVacant!3958 i!1204))))))

(assert (=> b!500975 (= lt!227527 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!500976 () Bool)

(declare-fun res!302777 () Bool)

(assert (=> b!500976 (=> (not res!302777) (not e!293479))))

(declare-fun arrayContainsKey!0 (array!32308 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500976 (= res!302777 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500977 () Bool)

(declare-fun res!302784 () Bool)

(assert (=> b!500977 (=> (not res!302784) (not e!293481))))

(declare-datatypes ((List!9600 0))(
  ( (Nil!9597) (Cons!9596 (h!10470 (_ BitVec 64)) (t!15820 List!9600)) )
))
(declare-fun arrayNoDuplicates!0 (array!32308 (_ BitVec 32) List!9600) Bool)

(assert (=> b!500977 (= res!302784 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9597))))

(declare-fun b!500978 () Bool)

(declare-fun res!302780 () Bool)

(assert (=> b!500978 (=> res!302780 e!293480)))

(get-info :version)

(assert (=> b!500978 (= res!302780 (or (undefined!4770 lt!227530) (not ((_ is Intermediate!3958) lt!227530))))))

(declare-fun b!500979 () Bool)

(declare-fun Unit!15069 () Unit!15067)

(assert (=> b!500979 (= e!293482 Unit!15069)))

(declare-fun lt!227523 () Unit!15067)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32308 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15067)

(assert (=> b!500979 (= lt!227523 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227529 #b00000000000000000000000000000000 (index!18016 lt!227530) (x!47192 lt!227530) mask!3524))))

(declare-fun res!302783 () Bool)

(declare-fun lt!227522 () (_ BitVec 64))

(declare-fun lt!227528 () array!32308)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32308 (_ BitVec 32)) SeekEntryResult!3958)

(assert (=> b!500979 (= res!302783 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227529 lt!227522 lt!227528 mask!3524) (Intermediate!3958 false (index!18016 lt!227530) (x!47192 lt!227530))))))

(declare-fun e!293478 () Bool)

(assert (=> b!500979 (=> (not res!302783) (not e!293478))))

(assert (=> b!500979 e!293478))

(declare-fun b!500980 () Bool)

(assert (=> b!500980 (= e!293478 false)))

(declare-fun b!500971 () Bool)

(declare-fun res!302779 () Bool)

(assert (=> b!500971 (=> (not res!302779) (not e!293479))))

(assert (=> b!500971 (= res!302779 (validKeyInArray!0 (select (arr!15535 a!3235) j!176)))))

(declare-fun res!302774 () Bool)

(assert (=> start!45482 (=> (not res!302774) (not e!293479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45482 (= res!302774 (validMask!0 mask!3524))))

(assert (=> start!45482 e!293479))

(assert (=> start!45482 true))

(declare-fun array_inv!11394 (array!32308) Bool)

(assert (=> start!45482 (array_inv!11394 a!3235)))

(declare-fun b!500981 () Bool)

(declare-fun Unit!15070 () Unit!15067)

(assert (=> b!500981 (= e!293482 Unit!15070)))

(declare-fun b!500982 () Bool)

(assert (=> b!500982 (= e!293481 (not e!293480))))

(declare-fun res!302785 () Bool)

(assert (=> b!500982 (=> res!302785 e!293480)))

(declare-fun lt!227526 () (_ BitVec 32))

(assert (=> b!500982 (= res!302785 (= lt!227530 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227526 lt!227522 lt!227528 mask!3524)))))

(assert (=> b!500982 (= lt!227530 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227529 (select (arr!15535 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500982 (= lt!227526 (toIndex!0 lt!227522 mask!3524))))

(assert (=> b!500982 (= lt!227522 (select (store (arr!15535 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!500982 (= lt!227529 (toIndex!0 (select (arr!15535 a!3235) j!176) mask!3524))))

(assert (=> b!500982 (= lt!227528 (array!32309 (store (arr!15535 a!3235) i!1204 k0!2280) (size!15899 a!3235)))))

(assert (=> b!500982 e!293483))

(declare-fun res!302775 () Bool)

(assert (=> b!500982 (=> (not res!302775) (not e!293483))))

(assert (=> b!500982 (= res!302775 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227521 () Unit!15067)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32308 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15067)

(assert (=> b!500982 (= lt!227521 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500983 () Bool)

(declare-fun res!302782 () Bool)

(assert (=> b!500983 (=> (not res!302782) (not e!293479))))

(assert (=> b!500983 (= res!302782 (and (= (size!15899 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15899 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15899 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45482 res!302774) b!500983))

(assert (= (and b!500983 res!302782) b!500971))

(assert (= (and b!500971 res!302779) b!500973))

(assert (= (and b!500973 res!302781) b!500976))

(assert (= (and b!500976 res!302777) b!500975))

(assert (= (and b!500975 res!302776) b!500970))

(assert (= (and b!500970 res!302778) b!500977))

(assert (= (and b!500977 res!302784) b!500982))

(assert (= (and b!500982 res!302775) b!500972))

(assert (= (and b!500982 (not res!302785)) b!500978))

(assert (= (and b!500978 (not res!302780)) b!500974))

(assert (= (and b!500974 c!59375) b!500979))

(assert (= (and b!500974 (not c!59375)) b!500981))

(assert (= (and b!500979 res!302783) b!500980))

(declare-fun m!482311 () Bool)

(assert (=> b!500975 m!482311))

(declare-fun m!482313 () Bool)

(assert (=> b!500972 m!482313))

(assert (=> b!500972 m!482313))

(declare-fun m!482315 () Bool)

(assert (=> b!500972 m!482315))

(declare-fun m!482317 () Bool)

(assert (=> b!500970 m!482317))

(declare-fun m!482319 () Bool)

(assert (=> b!500974 m!482319))

(declare-fun m!482321 () Bool)

(assert (=> b!500974 m!482321))

(assert (=> b!500974 m!482313))

(declare-fun m!482323 () Bool)

(assert (=> b!500973 m!482323))

(assert (=> b!500971 m!482313))

(assert (=> b!500971 m!482313))

(declare-fun m!482325 () Bool)

(assert (=> b!500971 m!482325))

(declare-fun m!482327 () Bool)

(assert (=> b!500977 m!482327))

(declare-fun m!482329 () Bool)

(assert (=> b!500979 m!482329))

(declare-fun m!482331 () Bool)

(assert (=> b!500979 m!482331))

(declare-fun m!482333 () Bool)

(assert (=> b!500982 m!482333))

(declare-fun m!482335 () Bool)

(assert (=> b!500982 m!482335))

(assert (=> b!500982 m!482313))

(declare-fun m!482337 () Bool)

(assert (=> b!500982 m!482337))

(declare-fun m!482339 () Bool)

(assert (=> b!500982 m!482339))

(assert (=> b!500982 m!482313))

(declare-fun m!482341 () Bool)

(assert (=> b!500982 m!482341))

(declare-fun m!482343 () Bool)

(assert (=> b!500982 m!482343))

(assert (=> b!500982 m!482313))

(declare-fun m!482345 () Bool)

(assert (=> b!500982 m!482345))

(declare-fun m!482347 () Bool)

(assert (=> b!500982 m!482347))

(declare-fun m!482349 () Bool)

(assert (=> b!500976 m!482349))

(declare-fun m!482351 () Bool)

(assert (=> start!45482 m!482351))

(declare-fun m!482353 () Bool)

(assert (=> start!45482 m!482353))

(check-sat (not b!500970) (not b!500977) (not b!500979) (not b!500975) (not b!500971) (not b!500973) (not b!500972) (not b!500976) (not b!500974) (not b!500982) (not start!45482))
(check-sat)
