; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47804 () Bool)

(assert start!47804)

(declare-fun b!526684 () Bool)

(declare-datatypes ((Unit!16608 0))(
  ( (Unit!16609) )
))
(declare-fun e!306985 () Unit!16608)

(declare-fun Unit!16610 () Unit!16608)

(assert (=> b!526684 (= e!306985 Unit!16610)))

(declare-fun b!526685 () Bool)

(declare-fun res!323279 () Bool)

(declare-fun e!306982 () Bool)

(assert (=> b!526685 (=> (not res!323279) (not e!306982))))

(declare-datatypes ((array!33441 0))(
  ( (array!33442 (arr!16072 (Array (_ BitVec 32) (_ BitVec 64))) (size!16436 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33441)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526685 (= res!323279 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526686 () Bool)

(declare-fun res!323271 () Bool)

(assert (=> b!526686 (=> (not res!323271) (not e!306982))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!526686 (= res!323271 (and (= (size!16436 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16436 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16436 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526687 () Bool)

(declare-fun e!306981 () Bool)

(declare-datatypes ((SeekEntryResult!4539 0))(
  ( (MissingZero!4539 (index!20368 (_ BitVec 32))) (Found!4539 (index!20369 (_ BitVec 32))) (Intermediate!4539 (undefined!5351 Bool) (index!20370 (_ BitVec 32)) (x!49336 (_ BitVec 32))) (Undefined!4539) (MissingVacant!4539 (index!20371 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33441 (_ BitVec 32)) SeekEntryResult!4539)

(assert (=> b!526687 (= e!306981 (= (seekEntryOrOpen!0 (select (arr!16072 a!3235) j!176) a!3235 mask!3524) (Found!4539 j!176)))))

(declare-fun b!526688 () Bool)

(declare-fun e!306986 () Bool)

(assert (=> b!526688 (= e!306986 true)))

(declare-fun lt!242291 () SeekEntryResult!4539)

(assert (=> b!526688 (= (index!20370 lt!242291) i!1204)))

(declare-fun lt!242292 () (_ BitVec 32))

(declare-fun lt!242286 () Unit!16608)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33441 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16608)

(assert (=> b!526688 (= lt!242286 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242292 #b00000000000000000000000000000000 (index!20370 lt!242291) (x!49336 lt!242291) mask!3524))))

(assert (=> b!526688 (and (or (= (select (arr!16072 a!3235) (index!20370 lt!242291)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16072 a!3235) (index!20370 lt!242291)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16072 a!3235) (index!20370 lt!242291)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16072 a!3235) (index!20370 lt!242291)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242289 () Unit!16608)

(assert (=> b!526688 (= lt!242289 e!306985)))

(declare-fun c!62012 () Bool)

(assert (=> b!526688 (= c!62012 (= (select (arr!16072 a!3235) (index!20370 lt!242291)) (select (arr!16072 a!3235) j!176)))))

(assert (=> b!526688 (and (bvslt (x!49336 lt!242291) #b01111111111111111111111111111110) (or (= (select (arr!16072 a!3235) (index!20370 lt!242291)) (select (arr!16072 a!3235) j!176)) (= (select (arr!16072 a!3235) (index!20370 lt!242291)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16072 a!3235) (index!20370 lt!242291)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526689 () Bool)

(declare-fun res!323281 () Bool)

(declare-fun e!306984 () Bool)

(assert (=> b!526689 (=> (not res!323281) (not e!306984))))

(declare-datatypes ((List!10230 0))(
  ( (Nil!10227) (Cons!10226 (h!11157 (_ BitVec 64)) (t!16458 List!10230)) )
))
(declare-fun arrayNoDuplicates!0 (array!33441 (_ BitVec 32) List!10230) Bool)

(assert (=> b!526689 (= res!323281 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10227))))

(declare-fun b!526691 () Bool)

(assert (=> b!526691 (= e!306982 e!306984)))

(declare-fun res!323278 () Bool)

(assert (=> b!526691 (=> (not res!323278) (not e!306984))))

(declare-fun lt!242290 () SeekEntryResult!4539)

(assert (=> b!526691 (= res!323278 (or (= lt!242290 (MissingZero!4539 i!1204)) (= lt!242290 (MissingVacant!4539 i!1204))))))

(assert (=> b!526691 (= lt!242290 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!526692 () Bool)

(declare-fun res!323273 () Bool)

(assert (=> b!526692 (=> (not res!323273) (not e!306984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33441 (_ BitVec 32)) Bool)

(assert (=> b!526692 (= res!323273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526693 () Bool)

(declare-fun Unit!16611 () Unit!16608)

(assert (=> b!526693 (= e!306985 Unit!16611)))

(declare-fun lt!242285 () Unit!16608)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33441 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16608)

(assert (=> b!526693 (= lt!242285 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242292 #b00000000000000000000000000000000 (index!20370 lt!242291) (x!49336 lt!242291) mask!3524))))

(declare-fun res!323272 () Bool)

(declare-fun lt!242293 () (_ BitVec 64))

(declare-fun lt!242288 () array!33441)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33441 (_ BitVec 32)) SeekEntryResult!4539)

(assert (=> b!526693 (= res!323272 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242292 lt!242293 lt!242288 mask!3524) (Intermediate!4539 false (index!20370 lt!242291) (x!49336 lt!242291))))))

(declare-fun e!306987 () Bool)

(assert (=> b!526693 (=> (not res!323272) (not e!306987))))

(assert (=> b!526693 e!306987))

(declare-fun b!526694 () Bool)

(assert (=> b!526694 (= e!306984 (not e!306986))))

(declare-fun res!323277 () Bool)

(assert (=> b!526694 (=> res!323277 e!306986)))

(declare-fun lt!242284 () (_ BitVec 32))

(assert (=> b!526694 (= res!323277 (= lt!242291 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242284 lt!242293 lt!242288 mask!3524)))))

(assert (=> b!526694 (= lt!242291 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242292 (select (arr!16072 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526694 (= lt!242284 (toIndex!0 lt!242293 mask!3524))))

(assert (=> b!526694 (= lt!242293 (select (store (arr!16072 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!526694 (= lt!242292 (toIndex!0 (select (arr!16072 a!3235) j!176) mask!3524))))

(assert (=> b!526694 (= lt!242288 (array!33442 (store (arr!16072 a!3235) i!1204 k0!2280) (size!16436 a!3235)))))

(assert (=> b!526694 e!306981))

(declare-fun res!323280 () Bool)

(assert (=> b!526694 (=> (not res!323280) (not e!306981))))

(assert (=> b!526694 (= res!323280 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242287 () Unit!16608)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33441 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16608)

(assert (=> b!526694 (= lt!242287 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526695 () Bool)

(declare-fun res!323275 () Bool)

(assert (=> b!526695 (=> (not res!323275) (not e!306982))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526695 (= res!323275 (validKeyInArray!0 k0!2280))))

(declare-fun b!526696 () Bool)

(declare-fun res!323282 () Bool)

(assert (=> b!526696 (=> (not res!323282) (not e!306982))))

(assert (=> b!526696 (= res!323282 (validKeyInArray!0 (select (arr!16072 a!3235) j!176)))))

(declare-fun b!526697 () Bool)

(assert (=> b!526697 (= e!306987 false)))

(declare-fun res!323276 () Bool)

(assert (=> start!47804 (=> (not res!323276) (not e!306982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47804 (= res!323276 (validMask!0 mask!3524))))

(assert (=> start!47804 e!306982))

(assert (=> start!47804 true))

(declare-fun array_inv!11868 (array!33441) Bool)

(assert (=> start!47804 (array_inv!11868 a!3235)))

(declare-fun b!526690 () Bool)

(declare-fun res!323274 () Bool)

(assert (=> b!526690 (=> res!323274 e!306986)))

(get-info :version)

(assert (=> b!526690 (= res!323274 (or (undefined!5351 lt!242291) (not ((_ is Intermediate!4539) lt!242291))))))

(assert (= (and start!47804 res!323276) b!526686))

(assert (= (and b!526686 res!323271) b!526696))

(assert (= (and b!526696 res!323282) b!526695))

(assert (= (and b!526695 res!323275) b!526685))

(assert (= (and b!526685 res!323279) b!526691))

(assert (= (and b!526691 res!323278) b!526692))

(assert (= (and b!526692 res!323273) b!526689))

(assert (= (and b!526689 res!323281) b!526694))

(assert (= (and b!526694 res!323280) b!526687))

(assert (= (and b!526694 (not res!323277)) b!526690))

(assert (= (and b!526690 (not res!323274)) b!526688))

(assert (= (and b!526688 c!62012) b!526693))

(assert (= (and b!526688 (not c!62012)) b!526684))

(assert (= (and b!526693 res!323272) b!526697))

(declare-fun m!507401 () Bool)

(assert (=> b!526692 m!507401))

(declare-fun m!507403 () Bool)

(assert (=> b!526695 m!507403))

(declare-fun m!507405 () Bool)

(assert (=> b!526694 m!507405))

(declare-fun m!507407 () Bool)

(assert (=> b!526694 m!507407))

(declare-fun m!507409 () Bool)

(assert (=> b!526694 m!507409))

(declare-fun m!507411 () Bool)

(assert (=> b!526694 m!507411))

(declare-fun m!507413 () Bool)

(assert (=> b!526694 m!507413))

(assert (=> b!526694 m!507411))

(declare-fun m!507415 () Bool)

(assert (=> b!526694 m!507415))

(assert (=> b!526694 m!507411))

(declare-fun m!507417 () Bool)

(assert (=> b!526694 m!507417))

(declare-fun m!507419 () Bool)

(assert (=> b!526694 m!507419))

(declare-fun m!507421 () Bool)

(assert (=> b!526694 m!507421))

(declare-fun m!507423 () Bool)

(assert (=> b!526693 m!507423))

(declare-fun m!507425 () Bool)

(assert (=> b!526693 m!507425))

(declare-fun m!507427 () Bool)

(assert (=> b!526691 m!507427))

(declare-fun m!507429 () Bool)

(assert (=> start!47804 m!507429))

(declare-fun m!507431 () Bool)

(assert (=> start!47804 m!507431))

(declare-fun m!507433 () Bool)

(assert (=> b!526689 m!507433))

(declare-fun m!507435 () Bool)

(assert (=> b!526688 m!507435))

(declare-fun m!507437 () Bool)

(assert (=> b!526688 m!507437))

(assert (=> b!526688 m!507411))

(declare-fun m!507439 () Bool)

(assert (=> b!526685 m!507439))

(assert (=> b!526687 m!507411))

(assert (=> b!526687 m!507411))

(declare-fun m!507441 () Bool)

(assert (=> b!526687 m!507441))

(assert (=> b!526696 m!507411))

(assert (=> b!526696 m!507411))

(declare-fun m!507443 () Bool)

(assert (=> b!526696 m!507443))

(check-sat (not b!526687) (not b!526693) (not b!526695) (not b!526694) (not b!526696) (not b!526688) (not b!526685) (not start!47804) (not b!526692) (not b!526689) (not b!526691))
(check-sat)
