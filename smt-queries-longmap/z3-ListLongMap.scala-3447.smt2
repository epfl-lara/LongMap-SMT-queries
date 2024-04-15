; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47790 () Bool)

(assert start!47790)

(declare-fun res!323117 () Bool)

(declare-fun e!306790 () Bool)

(assert (=> start!47790 (=> (not res!323117) (not e!306790))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47790 (= res!323117 (validMask!0 mask!3524))))

(assert (=> start!47790 e!306790))

(assert (=> start!47790 true))

(declare-datatypes ((array!33437 0))(
  ( (array!33438 (arr!16070 (Array (_ BitVec 32) (_ BitVec 64))) (size!16435 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33437)

(declare-fun array_inv!11953 (array!33437) Bool)

(assert (=> start!47790 (array_inv!11953 a!3235)))

(declare-fun b!526371 () Bool)

(declare-fun res!323113 () Bool)

(assert (=> b!526371 (=> (not res!323113) (not e!306790))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526371 (= res!323113 (validKeyInArray!0 k0!2280))))

(declare-fun b!526372 () Bool)

(declare-fun e!306786 () Bool)

(assert (=> b!526372 (= e!306786 false)))

(declare-fun b!526373 () Bool)

(declare-fun res!323115 () Bool)

(declare-fun e!306787 () Bool)

(assert (=> b!526373 (=> (not res!323115) (not e!306787))))

(declare-datatypes ((List!10267 0))(
  ( (Nil!10264) (Cons!10263 (h!11194 (_ BitVec 64)) (t!16486 List!10267)) )
))
(declare-fun arrayNoDuplicates!0 (array!33437 (_ BitVec 32) List!10267) Bool)

(assert (=> b!526373 (= res!323115 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10264))))

(declare-fun b!526374 () Bool)

(declare-fun e!306792 () Bool)

(assert (=> b!526374 (= e!306787 (not e!306792))))

(declare-fun res!323112 () Bool)

(assert (=> b!526374 (=> res!323112 e!306792)))

(declare-fun lt!242020 () (_ BitVec 64))

(declare-fun lt!242026 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4534 0))(
  ( (MissingZero!4534 (index!20348 (_ BitVec 32))) (Found!4534 (index!20349 (_ BitVec 32))) (Intermediate!4534 (undefined!5346 Bool) (index!20350 (_ BitVec 32)) (x!49326 (_ BitVec 32))) (Undefined!4534) (MissingVacant!4534 (index!20351 (_ BitVec 32))) )
))
(declare-fun lt!242023 () SeekEntryResult!4534)

(declare-fun lt!242025 () array!33437)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33437 (_ BitVec 32)) SeekEntryResult!4534)

(assert (=> b!526374 (= res!323112 (= lt!242023 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242026 lt!242020 lt!242025 mask!3524)))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!242029 () (_ BitVec 32))

(assert (=> b!526374 (= lt!242023 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242029 (select (arr!16070 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526374 (= lt!242026 (toIndex!0 lt!242020 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!526374 (= lt!242020 (select (store (arr!16070 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!526374 (= lt!242029 (toIndex!0 (select (arr!16070 a!3235) j!176) mask!3524))))

(assert (=> b!526374 (= lt!242025 (array!33438 (store (arr!16070 a!3235) i!1204 k0!2280) (size!16435 a!3235)))))

(declare-fun e!306789 () Bool)

(assert (=> b!526374 e!306789))

(declare-fun res!323107 () Bool)

(assert (=> b!526374 (=> (not res!323107) (not e!306789))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33437 (_ BitVec 32)) Bool)

(assert (=> b!526374 (= res!323107 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16582 0))(
  ( (Unit!16583) )
))
(declare-fun lt!242024 () Unit!16582)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33437 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16582)

(assert (=> b!526374 (= lt!242024 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526375 () Bool)

(declare-fun res!323109 () Bool)

(assert (=> b!526375 (=> (not res!323109) (not e!306790))))

(assert (=> b!526375 (= res!323109 (and (= (size!16435 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16435 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16435 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526376 () Bool)

(declare-fun res!323108 () Bool)

(assert (=> b!526376 (=> (not res!323108) (not e!306790))))

(declare-fun arrayContainsKey!0 (array!33437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526376 (= res!323108 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526377 () Bool)

(declare-fun res!323116 () Bool)

(assert (=> b!526377 (=> (not res!323116) (not e!306790))))

(assert (=> b!526377 (= res!323116 (validKeyInArray!0 (select (arr!16070 a!3235) j!176)))))

(declare-fun b!526378 () Bool)

(declare-fun e!306788 () Unit!16582)

(declare-fun Unit!16584 () Unit!16582)

(assert (=> b!526378 (= e!306788 Unit!16584)))

(declare-fun b!526379 () Bool)

(assert (=> b!526379 (= e!306790 e!306787)))

(declare-fun res!323110 () Bool)

(assert (=> b!526379 (=> (not res!323110) (not e!306787))))

(declare-fun lt!242028 () SeekEntryResult!4534)

(assert (=> b!526379 (= res!323110 (or (= lt!242028 (MissingZero!4534 i!1204)) (= lt!242028 (MissingVacant!4534 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33437 (_ BitVec 32)) SeekEntryResult!4534)

(assert (=> b!526379 (= lt!242028 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!526380 () Bool)

(assert (=> b!526380 (= e!306789 (= (seekEntryOrOpen!0 (select (arr!16070 a!3235) j!176) a!3235 mask!3524) (Found!4534 j!176)))))

(declare-fun b!526381 () Bool)

(declare-fun Unit!16585 () Unit!16582)

(assert (=> b!526381 (= e!306788 Unit!16585)))

(declare-fun lt!242022 () Unit!16582)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33437 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16582)

(assert (=> b!526381 (= lt!242022 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242029 #b00000000000000000000000000000000 (index!20350 lt!242023) (x!49326 lt!242023) mask!3524))))

(declare-fun res!323114 () Bool)

(assert (=> b!526381 (= res!323114 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242029 lt!242020 lt!242025 mask!3524) (Intermediate!4534 false (index!20350 lt!242023) (x!49326 lt!242023))))))

(assert (=> b!526381 (=> (not res!323114) (not e!306786))))

(assert (=> b!526381 e!306786))

(declare-fun b!526382 () Bool)

(declare-fun res!323111 () Bool)

(assert (=> b!526382 (=> (not res!323111) (not e!306787))))

(assert (=> b!526382 (= res!323111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526383 () Bool)

(declare-fun res!323106 () Bool)

(assert (=> b!526383 (=> res!323106 e!306792)))

(get-info :version)

(assert (=> b!526383 (= res!323106 (or (undefined!5346 lt!242023) (not ((_ is Intermediate!4534) lt!242023))))))

(declare-fun b!526384 () Bool)

(assert (=> b!526384 (= e!306792 true)))

(assert (=> b!526384 (= (index!20350 lt!242023) i!1204)))

(declare-fun lt!242021 () Unit!16582)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33437 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16582)

(assert (=> b!526384 (= lt!242021 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242029 #b00000000000000000000000000000000 (index!20350 lt!242023) (x!49326 lt!242023) mask!3524))))

(assert (=> b!526384 (and (or (= (select (arr!16070 a!3235) (index!20350 lt!242023)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16070 a!3235) (index!20350 lt!242023)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16070 a!3235) (index!20350 lt!242023)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16070 a!3235) (index!20350 lt!242023)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242027 () Unit!16582)

(assert (=> b!526384 (= lt!242027 e!306788)))

(declare-fun c!61938 () Bool)

(assert (=> b!526384 (= c!61938 (= (select (arr!16070 a!3235) (index!20350 lt!242023)) (select (arr!16070 a!3235) j!176)))))

(assert (=> b!526384 (and (bvslt (x!49326 lt!242023) #b01111111111111111111111111111110) (or (= (select (arr!16070 a!3235) (index!20350 lt!242023)) (select (arr!16070 a!3235) j!176)) (= (select (arr!16070 a!3235) (index!20350 lt!242023)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16070 a!3235) (index!20350 lt!242023)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!47790 res!323117) b!526375))

(assert (= (and b!526375 res!323109) b!526377))

(assert (= (and b!526377 res!323116) b!526371))

(assert (= (and b!526371 res!323113) b!526376))

(assert (= (and b!526376 res!323108) b!526379))

(assert (= (and b!526379 res!323110) b!526382))

(assert (= (and b!526382 res!323111) b!526373))

(assert (= (and b!526373 res!323115) b!526374))

(assert (= (and b!526374 res!323107) b!526380))

(assert (= (and b!526374 (not res!323112)) b!526383))

(assert (= (and b!526383 (not res!323106)) b!526384))

(assert (= (and b!526384 c!61938) b!526381))

(assert (= (and b!526384 (not c!61938)) b!526378))

(assert (= (and b!526381 res!323114) b!526372))

(declare-fun m!506605 () Bool)

(assert (=> b!526373 m!506605))

(declare-fun m!506607 () Bool)

(assert (=> start!47790 m!506607))

(declare-fun m!506609 () Bool)

(assert (=> start!47790 m!506609))

(declare-fun m!506611 () Bool)

(assert (=> b!526376 m!506611))

(declare-fun m!506613 () Bool)

(assert (=> b!526382 m!506613))

(declare-fun m!506615 () Bool)

(assert (=> b!526380 m!506615))

(assert (=> b!526380 m!506615))

(declare-fun m!506617 () Bool)

(assert (=> b!526380 m!506617))

(declare-fun m!506619 () Bool)

(assert (=> b!526371 m!506619))

(declare-fun m!506621 () Bool)

(assert (=> b!526384 m!506621))

(declare-fun m!506623 () Bool)

(assert (=> b!526384 m!506623))

(assert (=> b!526384 m!506615))

(declare-fun m!506625 () Bool)

(assert (=> b!526379 m!506625))

(assert (=> b!526377 m!506615))

(assert (=> b!526377 m!506615))

(declare-fun m!506627 () Bool)

(assert (=> b!526377 m!506627))

(declare-fun m!506629 () Bool)

(assert (=> b!526381 m!506629))

(declare-fun m!506631 () Bool)

(assert (=> b!526381 m!506631))

(assert (=> b!526374 m!506615))

(declare-fun m!506633 () Bool)

(assert (=> b!526374 m!506633))

(declare-fun m!506635 () Bool)

(assert (=> b!526374 m!506635))

(declare-fun m!506637 () Bool)

(assert (=> b!526374 m!506637))

(declare-fun m!506639 () Bool)

(assert (=> b!526374 m!506639))

(declare-fun m!506641 () Bool)

(assert (=> b!526374 m!506641))

(assert (=> b!526374 m!506615))

(declare-fun m!506643 () Bool)

(assert (=> b!526374 m!506643))

(assert (=> b!526374 m!506615))

(declare-fun m!506645 () Bool)

(assert (=> b!526374 m!506645))

(declare-fun m!506647 () Bool)

(assert (=> b!526374 m!506647))

(check-sat (not b!526371) (not b!526381) (not b!526376) (not b!526379) (not b!526382) (not start!47790) (not b!526377) (not b!526380) (not b!526373) (not b!526384) (not b!526374))
(check-sat)
