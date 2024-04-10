; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47450 () Bool)

(assert start!47450)

(declare-fun b!522418 () Bool)

(declare-fun e!304704 () Bool)

(declare-fun e!304708 () Bool)

(assert (=> b!522418 (= e!304704 e!304708)))

(declare-fun res!320080 () Bool)

(assert (=> b!522418 (=> (not res!320080) (not e!304708))))

(declare-datatypes ((SeekEntryResult!4461 0))(
  ( (MissingZero!4461 (index!20047 (_ BitVec 32))) (Found!4461 (index!20048 (_ BitVec 32))) (Intermediate!4461 (undefined!5273 Bool) (index!20049 (_ BitVec 32)) (x!49023 (_ BitVec 32))) (Undefined!4461) (MissingVacant!4461 (index!20050 (_ BitVec 32))) )
))
(declare-fun lt!239592 () SeekEntryResult!4461)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!522418 (= res!320080 (or (= lt!239592 (MissingZero!4461 i!1204)) (= lt!239592 (MissingVacant!4461 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33276 0))(
  ( (array!33277 (arr!15994 (Array (_ BitVec 32) (_ BitVec 64))) (size!16358 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33276)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33276 (_ BitVec 32)) SeekEntryResult!4461)

(assert (=> b!522418 (= lt!239592 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!522419 () Bool)

(declare-fun e!304706 () Bool)

(assert (=> b!522419 (= e!304706 true)))

(declare-fun lt!239596 () SeekEntryResult!4461)

(assert (=> b!522419 (and (or (= (select (arr!15994 a!3235) (index!20049 lt!239596)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15994 a!3235) (index!20049 lt!239596)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15994 a!3235) (index!20049 lt!239596)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15994 a!3235) (index!20049 lt!239596)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16296 0))(
  ( (Unit!16297) )
))
(declare-fun lt!239593 () Unit!16296)

(declare-fun e!304710 () Unit!16296)

(assert (=> b!522419 (= lt!239593 e!304710)))

(declare-fun c!61472 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!522419 (= c!61472 (= (select (arr!15994 a!3235) (index!20049 lt!239596)) (select (arr!15994 a!3235) j!176)))))

(assert (=> b!522419 (and (bvslt (x!49023 lt!239596) #b01111111111111111111111111111110) (or (= (select (arr!15994 a!3235) (index!20049 lt!239596)) (select (arr!15994 a!3235) j!176)) (= (select (arr!15994 a!3235) (index!20049 lt!239596)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15994 a!3235) (index!20049 lt!239596)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522420 () Bool)

(declare-fun e!304709 () Bool)

(assert (=> b!522420 (= e!304709 false)))

(declare-fun b!522421 () Bool)

(declare-fun res!320087 () Bool)

(assert (=> b!522421 (=> (not res!320087) (not e!304704))))

(declare-fun arrayContainsKey!0 (array!33276 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522421 (= res!320087 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!522422 () Bool)

(declare-fun Unit!16298 () Unit!16296)

(assert (=> b!522422 (= e!304710 Unit!16298)))

(declare-fun lt!239594 () (_ BitVec 32))

(declare-fun lt!239588 () Unit!16296)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33276 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16296)

(assert (=> b!522422 (= lt!239588 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239594 #b00000000000000000000000000000000 (index!20049 lt!239596) (x!49023 lt!239596) mask!3524))))

(declare-fun lt!239591 () array!33276)

(declare-fun lt!239590 () (_ BitVec 64))

(declare-fun res!320083 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33276 (_ BitVec 32)) SeekEntryResult!4461)

(assert (=> b!522422 (= res!320083 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239594 lt!239590 lt!239591 mask!3524) (Intermediate!4461 false (index!20049 lt!239596) (x!49023 lt!239596))))))

(assert (=> b!522422 (=> (not res!320083) (not e!304709))))

(assert (=> b!522422 e!304709))

(declare-fun b!522423 () Bool)

(declare-fun res!320077 () Bool)

(assert (=> b!522423 (=> (not res!320077) (not e!304704))))

(assert (=> b!522423 (= res!320077 (and (= (size!16358 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16358 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16358 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!522424 () Bool)

(declare-fun res!320082 () Bool)

(assert (=> b!522424 (=> (not res!320082) (not e!304708))))

(declare-datatypes ((List!10152 0))(
  ( (Nil!10149) (Cons!10148 (h!11070 (_ BitVec 64)) (t!16380 List!10152)) )
))
(declare-fun arrayNoDuplicates!0 (array!33276 (_ BitVec 32) List!10152) Bool)

(assert (=> b!522424 (= res!320082 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10149))))

(declare-fun b!522425 () Bool)

(declare-fun Unit!16299 () Unit!16296)

(assert (=> b!522425 (= e!304710 Unit!16299)))

(declare-fun b!522426 () Bool)

(declare-fun res!320079 () Bool)

(assert (=> b!522426 (=> (not res!320079) (not e!304704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!522426 (= res!320079 (validKeyInArray!0 k0!2280))))

(declare-fun b!522427 () Bool)

(declare-fun res!320078 () Bool)

(assert (=> b!522427 (=> (not res!320078) (not e!304704))))

(assert (=> b!522427 (= res!320078 (validKeyInArray!0 (select (arr!15994 a!3235) j!176)))))

(declare-fun b!522428 () Bool)

(declare-fun e!304705 () Bool)

(assert (=> b!522428 (= e!304705 (= (seekEntryOrOpen!0 (select (arr!15994 a!3235) j!176) a!3235 mask!3524) (Found!4461 j!176)))))

(declare-fun b!522429 () Bool)

(declare-fun res!320081 () Bool)

(assert (=> b!522429 (=> (not res!320081) (not e!304708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33276 (_ BitVec 32)) Bool)

(assert (=> b!522429 (= res!320081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!522430 () Bool)

(declare-fun res!320085 () Bool)

(assert (=> b!522430 (=> res!320085 e!304706)))

(get-info :version)

(assert (=> b!522430 (= res!320085 (or (undefined!5273 lt!239596) (not ((_ is Intermediate!4461) lt!239596))))))

(declare-fun b!522431 () Bool)

(assert (=> b!522431 (= e!304708 (not e!304706))))

(declare-fun res!320076 () Bool)

(assert (=> b!522431 (=> res!320076 e!304706)))

(declare-fun lt!239589 () (_ BitVec 32))

(assert (=> b!522431 (= res!320076 (= lt!239596 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239589 lt!239590 lt!239591 mask!3524)))))

(assert (=> b!522431 (= lt!239596 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239594 (select (arr!15994 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522431 (= lt!239589 (toIndex!0 lt!239590 mask!3524))))

(assert (=> b!522431 (= lt!239590 (select (store (arr!15994 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!522431 (= lt!239594 (toIndex!0 (select (arr!15994 a!3235) j!176) mask!3524))))

(assert (=> b!522431 (= lt!239591 (array!33277 (store (arr!15994 a!3235) i!1204 k0!2280) (size!16358 a!3235)))))

(assert (=> b!522431 e!304705))

(declare-fun res!320084 () Bool)

(assert (=> b!522431 (=> (not res!320084) (not e!304705))))

(assert (=> b!522431 (= res!320084 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239595 () Unit!16296)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33276 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16296)

(assert (=> b!522431 (= lt!239595 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!320086 () Bool)

(assert (=> start!47450 (=> (not res!320086) (not e!304704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47450 (= res!320086 (validMask!0 mask!3524))))

(assert (=> start!47450 e!304704))

(assert (=> start!47450 true))

(declare-fun array_inv!11790 (array!33276) Bool)

(assert (=> start!47450 (array_inv!11790 a!3235)))

(assert (= (and start!47450 res!320086) b!522423))

(assert (= (and b!522423 res!320077) b!522427))

(assert (= (and b!522427 res!320078) b!522426))

(assert (= (and b!522426 res!320079) b!522421))

(assert (= (and b!522421 res!320087) b!522418))

(assert (= (and b!522418 res!320080) b!522429))

(assert (= (and b!522429 res!320081) b!522424))

(assert (= (and b!522424 res!320082) b!522431))

(assert (= (and b!522431 res!320084) b!522428))

(assert (= (and b!522431 (not res!320076)) b!522430))

(assert (= (and b!522430 (not res!320085)) b!522419))

(assert (= (and b!522419 c!61472) b!522422))

(assert (= (and b!522419 (not c!61472)) b!522425))

(assert (= (and b!522422 res!320083) b!522420))

(declare-fun m!503331 () Bool)

(assert (=> b!522428 m!503331))

(assert (=> b!522428 m!503331))

(declare-fun m!503333 () Bool)

(assert (=> b!522428 m!503333))

(declare-fun m!503335 () Bool)

(assert (=> b!522421 m!503335))

(declare-fun m!503337 () Bool)

(assert (=> b!522431 m!503337))

(declare-fun m!503339 () Bool)

(assert (=> b!522431 m!503339))

(assert (=> b!522431 m!503331))

(declare-fun m!503341 () Bool)

(assert (=> b!522431 m!503341))

(assert (=> b!522431 m!503331))

(declare-fun m!503343 () Bool)

(assert (=> b!522431 m!503343))

(declare-fun m!503345 () Bool)

(assert (=> b!522431 m!503345))

(assert (=> b!522431 m!503331))

(declare-fun m!503347 () Bool)

(assert (=> b!522431 m!503347))

(declare-fun m!503349 () Bool)

(assert (=> b!522431 m!503349))

(declare-fun m!503351 () Bool)

(assert (=> b!522431 m!503351))

(declare-fun m!503353 () Bool)

(assert (=> b!522429 m!503353))

(assert (=> b!522427 m!503331))

(assert (=> b!522427 m!503331))

(declare-fun m!503355 () Bool)

(assert (=> b!522427 m!503355))

(declare-fun m!503357 () Bool)

(assert (=> b!522422 m!503357))

(declare-fun m!503359 () Bool)

(assert (=> b!522422 m!503359))

(declare-fun m!503361 () Bool)

(assert (=> start!47450 m!503361))

(declare-fun m!503363 () Bool)

(assert (=> start!47450 m!503363))

(declare-fun m!503365 () Bool)

(assert (=> b!522426 m!503365))

(declare-fun m!503367 () Bool)

(assert (=> b!522424 m!503367))

(declare-fun m!503369 () Bool)

(assert (=> b!522419 m!503369))

(assert (=> b!522419 m!503331))

(declare-fun m!503371 () Bool)

(assert (=> b!522418 m!503371))

(check-sat (not b!522429) (not b!522428) (not b!522422) (not start!47450) (not b!522427) (not b!522424) (not b!522418) (not b!522431) (not b!522421) (not b!522426))
(check-sat)
