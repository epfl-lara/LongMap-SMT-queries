; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47756 () Bool)

(assert start!47756)

(declare-fun b!525676 () Bool)

(declare-fun e!306481 () Bool)

(assert (=> b!525676 (= e!306481 false)))

(declare-fun b!525677 () Bool)

(declare-fun res!322414 () Bool)

(declare-fun e!306477 () Bool)

(assert (=> b!525677 (=> (not res!322414) (not e!306477))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33393 0))(
  ( (array!33394 (arr!16048 (Array (_ BitVec 32) (_ BitVec 64))) (size!16412 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33393)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!525677 (= res!322414 (and (= (size!16412 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16412 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16412 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525678 () Bool)

(declare-fun e!306482 () Bool)

(declare-datatypes ((SeekEntryResult!4515 0))(
  ( (MissingZero!4515 (index!20272 (_ BitVec 32))) (Found!4515 (index!20273 (_ BitVec 32))) (Intermediate!4515 (undefined!5327 Bool) (index!20274 (_ BitVec 32)) (x!49248 (_ BitVec 32))) (Undefined!4515) (MissingVacant!4515 (index!20275 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33393 (_ BitVec 32)) SeekEntryResult!4515)

(assert (=> b!525678 (= e!306482 (= (seekEntryOrOpen!0 (select (arr!16048 a!3235) j!176) a!3235 mask!3524) (Found!4515 j!176)))))

(declare-fun b!525679 () Bool)

(declare-fun res!322411 () Bool)

(assert (=> b!525679 (=> (not res!322411) (not e!306477))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33393 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525679 (= res!322411 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525680 () Bool)

(declare-fun e!306478 () Bool)

(assert (=> b!525680 (= e!306477 e!306478)))

(declare-fun res!322413 () Bool)

(assert (=> b!525680 (=> (not res!322413) (not e!306478))))

(declare-fun lt!241570 () SeekEntryResult!4515)

(assert (=> b!525680 (= res!322413 (or (= lt!241570 (MissingZero!4515 i!1204)) (= lt!241570 (MissingVacant!4515 i!1204))))))

(assert (=> b!525680 (= lt!241570 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!525681 () Bool)

(declare-datatypes ((Unit!16512 0))(
  ( (Unit!16513) )
))
(declare-fun e!306480 () Unit!16512)

(declare-fun Unit!16514 () Unit!16512)

(assert (=> b!525681 (= e!306480 Unit!16514)))

(declare-fun lt!241571 () SeekEntryResult!4515)

(declare-fun lt!241568 () (_ BitVec 32))

(declare-fun lt!241567 () Unit!16512)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33393 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16512)

(assert (=> b!525681 (= lt!241567 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241568 #b00000000000000000000000000000000 (index!20274 lt!241571) (x!49248 lt!241571) mask!3524))))

(declare-fun lt!241573 () array!33393)

(declare-fun res!322408 () Bool)

(declare-fun lt!241566 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33393 (_ BitVec 32)) SeekEntryResult!4515)

(assert (=> b!525681 (= res!322408 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241568 lt!241566 lt!241573 mask!3524) (Intermediate!4515 false (index!20274 lt!241571) (x!49248 lt!241571))))))

(assert (=> b!525681 (=> (not res!322408) (not e!306481))))

(assert (=> b!525681 e!306481))

(declare-fun b!525683 () Bool)

(declare-fun res!322416 () Bool)

(assert (=> b!525683 (=> (not res!322416) (not e!306478))))

(declare-datatypes ((List!10206 0))(
  ( (Nil!10203) (Cons!10202 (h!11133 (_ BitVec 64)) (t!16434 List!10206)) )
))
(declare-fun arrayNoDuplicates!0 (array!33393 (_ BitVec 32) List!10206) Bool)

(assert (=> b!525683 (= res!322416 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10203))))

(declare-fun b!525684 () Bool)

(declare-fun Unit!16515 () Unit!16512)

(assert (=> b!525684 (= e!306480 Unit!16515)))

(declare-fun b!525685 () Bool)

(declare-fun res!322417 () Bool)

(declare-fun e!306483 () Bool)

(assert (=> b!525685 (=> res!322417 e!306483)))

(get-info :version)

(assert (=> b!525685 (= res!322417 (or (undefined!5327 lt!241571) (not ((_ is Intermediate!4515) lt!241571))))))

(declare-fun b!525686 () Bool)

(declare-fun res!322418 () Bool)

(assert (=> b!525686 (=> (not res!322418) (not e!306477))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525686 (= res!322418 (validKeyInArray!0 k0!2280))))

(declare-fun b!525687 () Bool)

(declare-fun res!322415 () Bool)

(assert (=> b!525687 (=> (not res!322415) (not e!306478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33393 (_ BitVec 32)) Bool)

(assert (=> b!525687 (= res!322415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525688 () Bool)

(declare-fun res!322410 () Bool)

(assert (=> b!525688 (=> (not res!322410) (not e!306477))))

(assert (=> b!525688 (= res!322410 (validKeyInArray!0 (select (arr!16048 a!3235) j!176)))))

(declare-fun b!525689 () Bool)

(assert (=> b!525689 (= e!306483 true)))

(assert (=> b!525689 (= (index!20274 lt!241571) i!1204)))

(declare-fun lt!241569 () Unit!16512)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33393 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16512)

(assert (=> b!525689 (= lt!241569 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241568 #b00000000000000000000000000000000 (index!20274 lt!241571) (x!49248 lt!241571) mask!3524))))

(assert (=> b!525689 (and (or (= (select (arr!16048 a!3235) (index!20274 lt!241571)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16048 a!3235) (index!20274 lt!241571)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16048 a!3235) (index!20274 lt!241571)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16048 a!3235) (index!20274 lt!241571)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241564 () Unit!16512)

(assert (=> b!525689 (= lt!241564 e!306480)))

(declare-fun c!61940 () Bool)

(assert (=> b!525689 (= c!61940 (= (select (arr!16048 a!3235) (index!20274 lt!241571)) (select (arr!16048 a!3235) j!176)))))

(assert (=> b!525689 (and (bvslt (x!49248 lt!241571) #b01111111111111111111111111111110) (or (= (select (arr!16048 a!3235) (index!20274 lt!241571)) (select (arr!16048 a!3235) j!176)) (= (select (arr!16048 a!3235) (index!20274 lt!241571)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16048 a!3235) (index!20274 lt!241571)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525682 () Bool)

(assert (=> b!525682 (= e!306478 (not e!306483))))

(declare-fun res!322407 () Bool)

(assert (=> b!525682 (=> res!322407 e!306483)))

(declare-fun lt!241565 () (_ BitVec 32))

(assert (=> b!525682 (= res!322407 (= lt!241571 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241565 lt!241566 lt!241573 mask!3524)))))

(assert (=> b!525682 (= lt!241571 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241568 (select (arr!16048 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525682 (= lt!241565 (toIndex!0 lt!241566 mask!3524))))

(assert (=> b!525682 (= lt!241566 (select (store (arr!16048 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!525682 (= lt!241568 (toIndex!0 (select (arr!16048 a!3235) j!176) mask!3524))))

(assert (=> b!525682 (= lt!241573 (array!33394 (store (arr!16048 a!3235) i!1204 k0!2280) (size!16412 a!3235)))))

(assert (=> b!525682 e!306482))

(declare-fun res!322412 () Bool)

(assert (=> b!525682 (=> (not res!322412) (not e!306482))))

(assert (=> b!525682 (= res!322412 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241572 () Unit!16512)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33393 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16512)

(assert (=> b!525682 (= lt!241572 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!322409 () Bool)

(assert (=> start!47756 (=> (not res!322409) (not e!306477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47756 (= res!322409 (validMask!0 mask!3524))))

(assert (=> start!47756 e!306477))

(assert (=> start!47756 true))

(declare-fun array_inv!11844 (array!33393) Bool)

(assert (=> start!47756 (array_inv!11844 a!3235)))

(assert (= (and start!47756 res!322409) b!525677))

(assert (= (and b!525677 res!322414) b!525688))

(assert (= (and b!525688 res!322410) b!525686))

(assert (= (and b!525686 res!322418) b!525679))

(assert (= (and b!525679 res!322411) b!525680))

(assert (= (and b!525680 res!322413) b!525687))

(assert (= (and b!525687 res!322415) b!525683))

(assert (= (and b!525683 res!322416) b!525682))

(assert (= (and b!525682 res!322412) b!525678))

(assert (= (and b!525682 (not res!322407)) b!525685))

(assert (= (and b!525685 (not res!322417)) b!525689))

(assert (= (and b!525689 c!61940) b!525681))

(assert (= (and b!525689 (not c!61940)) b!525684))

(assert (= (and b!525681 res!322408) b!525676))

(declare-fun m!506345 () Bool)

(assert (=> b!525688 m!506345))

(assert (=> b!525688 m!506345))

(declare-fun m!506347 () Bool)

(assert (=> b!525688 m!506347))

(declare-fun m!506349 () Bool)

(assert (=> b!525681 m!506349))

(declare-fun m!506351 () Bool)

(assert (=> b!525681 m!506351))

(declare-fun m!506353 () Bool)

(assert (=> b!525679 m!506353))

(declare-fun m!506355 () Bool)

(assert (=> start!47756 m!506355))

(declare-fun m!506357 () Bool)

(assert (=> start!47756 m!506357))

(declare-fun m!506359 () Bool)

(assert (=> b!525689 m!506359))

(declare-fun m!506361 () Bool)

(assert (=> b!525689 m!506361))

(assert (=> b!525689 m!506345))

(declare-fun m!506363 () Bool)

(assert (=> b!525682 m!506363))

(declare-fun m!506365 () Bool)

(assert (=> b!525682 m!506365))

(declare-fun m!506367 () Bool)

(assert (=> b!525682 m!506367))

(assert (=> b!525682 m!506345))

(declare-fun m!506369 () Bool)

(assert (=> b!525682 m!506369))

(assert (=> b!525682 m!506345))

(declare-fun m!506371 () Bool)

(assert (=> b!525682 m!506371))

(assert (=> b!525682 m!506345))

(declare-fun m!506373 () Bool)

(assert (=> b!525682 m!506373))

(declare-fun m!506375 () Bool)

(assert (=> b!525682 m!506375))

(declare-fun m!506377 () Bool)

(assert (=> b!525682 m!506377))

(assert (=> b!525678 m!506345))

(assert (=> b!525678 m!506345))

(declare-fun m!506379 () Bool)

(assert (=> b!525678 m!506379))

(declare-fun m!506381 () Bool)

(assert (=> b!525687 m!506381))

(declare-fun m!506383 () Bool)

(assert (=> b!525680 m!506383))

(declare-fun m!506385 () Bool)

(assert (=> b!525683 m!506385))

(declare-fun m!506387 () Bool)

(assert (=> b!525686 m!506387))

(check-sat (not b!525681) (not start!47756) (not b!525679) (not b!525680) (not b!525686) (not b!525689) (not b!525688) (not b!525687) (not b!525682) (not b!525683) (not b!525678))
(check-sat)
