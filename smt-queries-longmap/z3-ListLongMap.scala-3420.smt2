; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47430 () Bool)

(assert start!47430)

(declare-fun b!521979 () Bool)

(declare-fun e!304447 () Bool)

(declare-fun e!304452 () Bool)

(assert (=> b!521979 (= e!304447 e!304452)))

(declare-fun res!319806 () Bool)

(assert (=> b!521979 (=> (not res!319806) (not e!304452))))

(declare-datatypes ((SeekEntryResult!4453 0))(
  ( (MissingZero!4453 (index!20015 (_ BitVec 32))) (Found!4453 (index!20016 (_ BitVec 32))) (Intermediate!4453 (undefined!5265 Bool) (index!20017 (_ BitVec 32)) (x!49002 (_ BitVec 32))) (Undefined!4453) (MissingVacant!4453 (index!20018 (_ BitVec 32))) )
))
(declare-fun lt!239252 () SeekEntryResult!4453)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521979 (= res!319806 (or (= lt!239252 (MissingZero!4453 i!1204)) (= lt!239252 (MissingVacant!4453 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33266 0))(
  ( (array!33267 (arr!15989 (Array (_ BitVec 32) (_ BitVec 64))) (size!16354 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33266)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33266 (_ BitVec 32)) SeekEntryResult!4453)

(assert (=> b!521979 (= lt!239252 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!521980 () Bool)

(declare-fun res!319804 () Bool)

(assert (=> b!521980 (=> (not res!319804) (not e!304447))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!521980 (= res!319804 (and (= (size!16354 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16354 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16354 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521981 () Bool)

(declare-fun res!319812 () Bool)

(assert (=> b!521981 (=> (not res!319812) (not e!304452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33266 (_ BitVec 32)) Bool)

(assert (=> b!521981 (= res!319812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521982 () Bool)

(declare-datatypes ((Unit!16258 0))(
  ( (Unit!16259) )
))
(declare-fun e!304448 () Unit!16258)

(declare-fun Unit!16260 () Unit!16258)

(assert (=> b!521982 (= e!304448 Unit!16260)))

(declare-fun b!521983 () Bool)

(declare-fun res!319807 () Bool)

(declare-fun e!304450 () Bool)

(assert (=> b!521983 (=> res!319807 e!304450)))

(declare-fun lt!239253 () SeekEntryResult!4453)

(get-info :version)

(assert (=> b!521983 (= res!319807 (or (undefined!5265 lt!239253) (not ((_ is Intermediate!4453) lt!239253))))))

(declare-fun b!521984 () Bool)

(assert (=> b!521984 (= e!304450 true)))

(assert (=> b!521984 (and (or (= (select (arr!15989 a!3235) (index!20017 lt!239253)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15989 a!3235) (index!20017 lt!239253)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15989 a!3235) (index!20017 lt!239253)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15989 a!3235) (index!20017 lt!239253)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239250 () Unit!16258)

(assert (=> b!521984 (= lt!239250 e!304448)))

(declare-fun c!61389 () Bool)

(assert (=> b!521984 (= c!61389 (= (select (arr!15989 a!3235) (index!20017 lt!239253)) (select (arr!15989 a!3235) j!176)))))

(assert (=> b!521984 (and (bvslt (x!49002 lt!239253) #b01111111111111111111111111111110) (or (= (select (arr!15989 a!3235) (index!20017 lt!239253)) (select (arr!15989 a!3235) j!176)) (= (select (arr!15989 a!3235) (index!20017 lt!239253)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15989 a!3235) (index!20017 lt!239253)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521986 () Bool)

(declare-fun e!304449 () Bool)

(assert (=> b!521986 (= e!304449 false)))

(declare-fun b!521987 () Bool)

(assert (=> b!521987 (= e!304452 (not e!304450))))

(declare-fun res!319808 () Bool)

(assert (=> b!521987 (=> res!319808 e!304450)))

(declare-fun lt!239254 () array!33266)

(declare-fun lt!239247 () (_ BitVec 32))

(declare-fun lt!239248 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33266 (_ BitVec 32)) SeekEntryResult!4453)

(assert (=> b!521987 (= res!319808 (= lt!239253 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239247 lt!239248 lt!239254 mask!3524)))))

(declare-fun lt!239246 () (_ BitVec 32))

(assert (=> b!521987 (= lt!239253 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239246 (select (arr!15989 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521987 (= lt!239247 (toIndex!0 lt!239248 mask!3524))))

(assert (=> b!521987 (= lt!239248 (select (store (arr!15989 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!521987 (= lt!239246 (toIndex!0 (select (arr!15989 a!3235) j!176) mask!3524))))

(assert (=> b!521987 (= lt!239254 (array!33267 (store (arr!15989 a!3235) i!1204 k0!2280) (size!16354 a!3235)))))

(declare-fun e!304451 () Bool)

(assert (=> b!521987 e!304451))

(declare-fun res!319811 () Bool)

(assert (=> b!521987 (=> (not res!319811) (not e!304451))))

(assert (=> b!521987 (= res!319811 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239249 () Unit!16258)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33266 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16258)

(assert (=> b!521987 (= lt!239249 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521988 () Bool)

(declare-fun res!319813 () Bool)

(assert (=> b!521988 (=> (not res!319813) (not e!304447))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521988 (= res!319813 (validKeyInArray!0 (select (arr!15989 a!3235) j!176)))))

(declare-fun b!521989 () Bool)

(declare-fun res!319805 () Bool)

(assert (=> b!521989 (=> (not res!319805) (not e!304452))))

(declare-datatypes ((List!10186 0))(
  ( (Nil!10183) (Cons!10182 (h!11104 (_ BitVec 64)) (t!16405 List!10186)) )
))
(declare-fun arrayNoDuplicates!0 (array!33266 (_ BitVec 32) List!10186) Bool)

(assert (=> b!521989 (= res!319805 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10183))))

(declare-fun b!521990 () Bool)

(declare-fun res!319803 () Bool)

(assert (=> b!521990 (=> (not res!319803) (not e!304447))))

(assert (=> b!521990 (= res!319803 (validKeyInArray!0 k0!2280))))

(declare-fun b!521991 () Bool)

(assert (=> b!521991 (= e!304451 (= (seekEntryOrOpen!0 (select (arr!15989 a!3235) j!176) a!3235 mask!3524) (Found!4453 j!176)))))

(declare-fun b!521992 () Bool)

(declare-fun Unit!16261 () Unit!16258)

(assert (=> b!521992 (= e!304448 Unit!16261)))

(declare-fun lt!239251 () Unit!16258)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33266 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16258)

(assert (=> b!521992 (= lt!239251 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239246 #b00000000000000000000000000000000 (index!20017 lt!239253) (x!49002 lt!239253) mask!3524))))

(declare-fun res!319810 () Bool)

(assert (=> b!521992 (= res!319810 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239246 lt!239248 lt!239254 mask!3524) (Intermediate!4453 false (index!20017 lt!239253) (x!49002 lt!239253))))))

(assert (=> b!521992 (=> (not res!319810) (not e!304449))))

(assert (=> b!521992 e!304449))

(declare-fun b!521985 () Bool)

(declare-fun res!319814 () Bool)

(assert (=> b!521985 (=> (not res!319814) (not e!304447))))

(declare-fun arrayContainsKey!0 (array!33266 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521985 (= res!319814 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!319809 () Bool)

(assert (=> start!47430 (=> (not res!319809) (not e!304447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47430 (= res!319809 (validMask!0 mask!3524))))

(assert (=> start!47430 e!304447))

(assert (=> start!47430 true))

(declare-fun array_inv!11872 (array!33266) Bool)

(assert (=> start!47430 (array_inv!11872 a!3235)))

(assert (= (and start!47430 res!319809) b!521980))

(assert (= (and b!521980 res!319804) b!521988))

(assert (= (and b!521988 res!319813) b!521990))

(assert (= (and b!521990 res!319803) b!521985))

(assert (= (and b!521985 res!319814) b!521979))

(assert (= (and b!521979 res!319806) b!521981))

(assert (= (and b!521981 res!319812) b!521989))

(assert (= (and b!521989 res!319805) b!521987))

(assert (= (and b!521987 res!319811) b!521991))

(assert (= (and b!521987 (not res!319808)) b!521983))

(assert (= (and b!521983 (not res!319807)) b!521984))

(assert (= (and b!521984 c!61389) b!521992))

(assert (= (and b!521984 (not c!61389)) b!521982))

(assert (= (and b!521992 res!319810) b!521986))

(declare-fun m!502411 () Bool)

(assert (=> b!521990 m!502411))

(declare-fun m!502413 () Bool)

(assert (=> b!521992 m!502413))

(declare-fun m!502415 () Bool)

(assert (=> b!521992 m!502415))

(declare-fun m!502417 () Bool)

(assert (=> b!521981 m!502417))

(declare-fun m!502419 () Bool)

(assert (=> b!521987 m!502419))

(declare-fun m!502421 () Bool)

(assert (=> b!521987 m!502421))

(declare-fun m!502423 () Bool)

(assert (=> b!521987 m!502423))

(declare-fun m!502425 () Bool)

(assert (=> b!521987 m!502425))

(declare-fun m!502427 () Bool)

(assert (=> b!521987 m!502427))

(assert (=> b!521987 m!502421))

(declare-fun m!502429 () Bool)

(assert (=> b!521987 m!502429))

(assert (=> b!521987 m!502421))

(declare-fun m!502431 () Bool)

(assert (=> b!521987 m!502431))

(declare-fun m!502433 () Bool)

(assert (=> b!521987 m!502433))

(declare-fun m!502435 () Bool)

(assert (=> b!521987 m!502435))

(declare-fun m!502437 () Bool)

(assert (=> b!521989 m!502437))

(declare-fun m!502439 () Bool)

(assert (=> b!521985 m!502439))

(declare-fun m!502441 () Bool)

(assert (=> b!521979 m!502441))

(assert (=> b!521988 m!502421))

(assert (=> b!521988 m!502421))

(declare-fun m!502443 () Bool)

(assert (=> b!521988 m!502443))

(assert (=> b!521991 m!502421))

(assert (=> b!521991 m!502421))

(declare-fun m!502445 () Bool)

(assert (=> b!521991 m!502445))

(declare-fun m!502447 () Bool)

(assert (=> b!521984 m!502447))

(assert (=> b!521984 m!502421))

(declare-fun m!502449 () Bool)

(assert (=> start!47430 m!502449))

(declare-fun m!502451 () Bool)

(assert (=> start!47430 m!502451))

(check-sat (not b!521989) (not b!521991) (not b!521981) (not b!521988) (not b!521987) (not b!521990) (not b!521979) (not b!521985) (not start!47430) (not b!521992))
(check-sat)
