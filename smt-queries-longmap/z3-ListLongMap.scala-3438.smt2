; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47738 () Bool)

(assert start!47738)

(declare-fun b!525447 () Bool)

(declare-fun res!322260 () Bool)

(declare-fun e!306356 () Bool)

(assert (=> b!525447 (=> (not res!322260) (not e!306356))))

(declare-datatypes ((array!33376 0))(
  ( (array!33377 (arr!16039 (Array (_ BitVec 32) (_ BitVec 64))) (size!16403 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33376)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33376 (_ BitVec 32)) Bool)

(assert (=> b!525447 (= res!322260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525448 () Bool)

(declare-datatypes ((Unit!16459 0))(
  ( (Unit!16460) )
))
(declare-fun e!306359 () Unit!16459)

(declare-fun Unit!16461 () Unit!16459)

(assert (=> b!525448 (= e!306359 Unit!16461)))

(declare-fun b!525449 () Bool)

(declare-fun res!322264 () Bool)

(declare-fun e!306360 () Bool)

(assert (=> b!525449 (=> (not res!322264) (not e!306360))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525449 (= res!322264 (validKeyInArray!0 (select (arr!16039 a!3235) j!176)))))

(declare-fun b!525450 () Bool)

(declare-fun e!306357 () Bool)

(assert (=> b!525450 (= e!306356 (not e!306357))))

(declare-fun res!322256 () Bool)

(assert (=> b!525450 (=> res!322256 e!306357)))

(declare-fun lt!241463 () array!33376)

(declare-fun lt!241461 () (_ BitVec 32))

(declare-fun lt!241465 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4462 0))(
  ( (MissingZero!4462 (index!20060 (_ BitVec 32))) (Found!4462 (index!20061 (_ BitVec 32))) (Intermediate!4462 (undefined!5274 Bool) (index!20062 (_ BitVec 32)) (x!49184 (_ BitVec 32))) (Undefined!4462) (MissingVacant!4462 (index!20063 (_ BitVec 32))) )
))
(declare-fun lt!241464 () SeekEntryResult!4462)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33376 (_ BitVec 32)) SeekEntryResult!4462)

(assert (=> b!525450 (= res!322256 (= lt!241464 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241461 lt!241465 lt!241463 mask!3524)))))

(declare-fun lt!241457 () (_ BitVec 32))

(assert (=> b!525450 (= lt!241464 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241457 (select (arr!16039 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525450 (= lt!241461 (toIndex!0 lt!241465 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!525450 (= lt!241465 (select (store (arr!16039 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!525450 (= lt!241457 (toIndex!0 (select (arr!16039 a!3235) j!176) mask!3524))))

(assert (=> b!525450 (= lt!241463 (array!33377 (store (arr!16039 a!3235) i!1204 k0!2280) (size!16403 a!3235)))))

(declare-fun e!306355 () Bool)

(assert (=> b!525450 e!306355))

(declare-fun res!322259 () Bool)

(assert (=> b!525450 (=> (not res!322259) (not e!306355))))

(assert (=> b!525450 (= res!322259 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241456 () Unit!16459)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16459)

(assert (=> b!525450 (= lt!241456 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525451 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33376 (_ BitVec 32)) SeekEntryResult!4462)

(assert (=> b!525451 (= e!306355 (= (seekEntryOrOpen!0 (select (arr!16039 a!3235) j!176) a!3235 mask!3524) (Found!4462 j!176)))))

(declare-fun b!525452 () Bool)

(declare-fun Unit!16462 () Unit!16459)

(assert (=> b!525452 (= e!306359 Unit!16462)))

(declare-fun lt!241460 () Unit!16459)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33376 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16459)

(assert (=> b!525452 (= lt!241460 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241457 #b00000000000000000000000000000000 (index!20062 lt!241464) (x!49184 lt!241464) mask!3524))))

(declare-fun res!322265 () Bool)

(assert (=> b!525452 (= res!322265 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241457 lt!241465 lt!241463 mask!3524) (Intermediate!4462 false (index!20062 lt!241464) (x!49184 lt!241464))))))

(declare-fun e!306358 () Bool)

(assert (=> b!525452 (=> (not res!322265) (not e!306358))))

(assert (=> b!525452 e!306358))

(declare-fun b!525453 () Bool)

(declare-fun res!322261 () Bool)

(assert (=> b!525453 (=> (not res!322261) (not e!306360))))

(assert (=> b!525453 (= res!322261 (validKeyInArray!0 k0!2280))))

(declare-fun b!525454 () Bool)

(declare-fun res!322266 () Bool)

(assert (=> b!525454 (=> (not res!322266) (not e!306360))))

(declare-fun arrayContainsKey!0 (array!33376 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525454 (= res!322266 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!322258 () Bool)

(assert (=> start!47738 (=> (not res!322258) (not e!306360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47738 (= res!322258 (validMask!0 mask!3524))))

(assert (=> start!47738 e!306360))

(assert (=> start!47738 true))

(declare-fun array_inv!11898 (array!33376) Bool)

(assert (=> start!47738 (array_inv!11898 a!3235)))

(declare-fun b!525455 () Bool)

(assert (=> b!525455 (= e!306357 true)))

(assert (=> b!525455 (= (index!20062 lt!241464) i!1204)))

(declare-fun lt!241459 () Unit!16459)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33376 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16459)

(assert (=> b!525455 (= lt!241459 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241457 #b00000000000000000000000000000000 (index!20062 lt!241464) (x!49184 lt!241464) mask!3524))))

(assert (=> b!525455 (and (or (= (select (arr!16039 a!3235) (index!20062 lt!241464)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16039 a!3235) (index!20062 lt!241464)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16039 a!3235) (index!20062 lt!241464)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16039 a!3235) (index!20062 lt!241464)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241458 () Unit!16459)

(assert (=> b!525455 (= lt!241458 e!306359)))

(declare-fun c!61901 () Bool)

(assert (=> b!525455 (= c!61901 (= (select (arr!16039 a!3235) (index!20062 lt!241464)) (select (arr!16039 a!3235) j!176)))))

(assert (=> b!525455 (and (bvslt (x!49184 lt!241464) #b01111111111111111111111111111110) (or (= (select (arr!16039 a!3235) (index!20062 lt!241464)) (select (arr!16039 a!3235) j!176)) (= (select (arr!16039 a!3235) (index!20062 lt!241464)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16039 a!3235) (index!20062 lt!241464)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525456 () Bool)

(declare-fun res!322262 () Bool)

(assert (=> b!525456 (=> (not res!322262) (not e!306360))))

(assert (=> b!525456 (= res!322262 (and (= (size!16403 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16403 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16403 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525457 () Bool)

(assert (=> b!525457 (= e!306360 e!306356)))

(declare-fun res!322263 () Bool)

(assert (=> b!525457 (=> (not res!322263) (not e!306356))))

(declare-fun lt!241462 () SeekEntryResult!4462)

(assert (=> b!525457 (= res!322263 (or (= lt!241462 (MissingZero!4462 i!1204)) (= lt!241462 (MissingVacant!4462 i!1204))))))

(assert (=> b!525457 (= lt!241462 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!525458 () Bool)

(declare-fun res!322267 () Bool)

(assert (=> b!525458 (=> (not res!322267) (not e!306356))))

(declare-datatypes ((List!10104 0))(
  ( (Nil!10101) (Cons!10100 (h!11031 (_ BitVec 64)) (t!16324 List!10104)) )
))
(declare-fun arrayNoDuplicates!0 (array!33376 (_ BitVec 32) List!10104) Bool)

(assert (=> b!525458 (= res!322267 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10101))))

(declare-fun b!525459 () Bool)

(declare-fun res!322257 () Bool)

(assert (=> b!525459 (=> res!322257 e!306357)))

(get-info :version)

(assert (=> b!525459 (= res!322257 (or (undefined!5274 lt!241464) (not ((_ is Intermediate!4462) lt!241464))))))

(declare-fun b!525460 () Bool)

(assert (=> b!525460 (= e!306358 false)))

(assert (= (and start!47738 res!322258) b!525456))

(assert (= (and b!525456 res!322262) b!525449))

(assert (= (and b!525449 res!322264) b!525453))

(assert (= (and b!525453 res!322261) b!525454))

(assert (= (and b!525454 res!322266) b!525457))

(assert (= (and b!525457 res!322263) b!525447))

(assert (= (and b!525447 res!322260) b!525458))

(assert (= (and b!525458 res!322267) b!525450))

(assert (= (and b!525450 res!322259) b!525451))

(assert (= (and b!525450 (not res!322256)) b!525459))

(assert (= (and b!525459 (not res!322257)) b!525455))

(assert (= (and b!525455 c!61901) b!525452))

(assert (= (and b!525455 (not c!61901)) b!525448))

(assert (= (and b!525452 res!322265) b!525460))

(declare-fun m!506353 () Bool)

(assert (=> b!525455 m!506353))

(declare-fun m!506355 () Bool)

(assert (=> b!525455 m!506355))

(declare-fun m!506357 () Bool)

(assert (=> b!525455 m!506357))

(declare-fun m!506359 () Bool)

(assert (=> b!525457 m!506359))

(declare-fun m!506361 () Bool)

(assert (=> b!525447 m!506361))

(declare-fun m!506363 () Bool)

(assert (=> b!525450 m!506363))

(declare-fun m!506365 () Bool)

(assert (=> b!525450 m!506365))

(assert (=> b!525450 m!506357))

(declare-fun m!506367 () Bool)

(assert (=> b!525450 m!506367))

(declare-fun m!506369 () Bool)

(assert (=> b!525450 m!506369))

(declare-fun m!506371 () Bool)

(assert (=> b!525450 m!506371))

(assert (=> b!525450 m!506357))

(declare-fun m!506373 () Bool)

(assert (=> b!525450 m!506373))

(assert (=> b!525450 m!506357))

(declare-fun m!506375 () Bool)

(assert (=> b!525450 m!506375))

(declare-fun m!506377 () Bool)

(assert (=> b!525450 m!506377))

(declare-fun m!506379 () Bool)

(assert (=> b!525454 m!506379))

(declare-fun m!506381 () Bool)

(assert (=> start!47738 m!506381))

(declare-fun m!506383 () Bool)

(assert (=> start!47738 m!506383))

(assert (=> b!525451 m!506357))

(assert (=> b!525451 m!506357))

(declare-fun m!506385 () Bool)

(assert (=> b!525451 m!506385))

(declare-fun m!506387 () Bool)

(assert (=> b!525453 m!506387))

(declare-fun m!506389 () Bool)

(assert (=> b!525458 m!506389))

(declare-fun m!506391 () Bool)

(assert (=> b!525452 m!506391))

(declare-fun m!506393 () Bool)

(assert (=> b!525452 m!506393))

(assert (=> b!525449 m!506357))

(assert (=> b!525449 m!506357))

(declare-fun m!506395 () Bool)

(assert (=> b!525449 m!506395))

(check-sat (not b!525453) (not b!525454) (not b!525451) (not b!525450) (not b!525447) (not b!525458) (not b!525452) (not b!525449) (not start!47738) (not b!525457) (not b!525455))
(check-sat)
