; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47758 () Bool)

(assert start!47758)

(declare-fun b!525718 () Bool)

(declare-fun res!322443 () Bool)

(declare-fun e!306500 () Bool)

(assert (=> b!525718 (=> (not res!322443) (not e!306500))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525718 (= res!322443 (validKeyInArray!0 k!2280))))

(declare-fun b!525720 () Bool)

(declare-fun res!322444 () Bool)

(declare-fun e!306502 () Bool)

(assert (=> b!525720 (=> (not res!322444) (not e!306502))))

(declare-datatypes ((array!33395 0))(
  ( (array!33396 (arr!16049 (Array (_ BitVec 32) (_ BitVec 64))) (size!16413 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33395)

(declare-datatypes ((List!10207 0))(
  ( (Nil!10204) (Cons!10203 (h!11134 (_ BitVec 64)) (t!16435 List!10207)) )
))
(declare-fun arrayNoDuplicates!0 (array!33395 (_ BitVec 32) List!10207) Bool)

(assert (=> b!525720 (= res!322444 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10204))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!525721 () Bool)

(declare-fun e!306499 () Bool)

(declare-datatypes ((SeekEntryResult!4516 0))(
  ( (MissingZero!4516 (index!20276 (_ BitVec 32))) (Found!4516 (index!20277 (_ BitVec 32))) (Intermediate!4516 (undefined!5328 Bool) (index!20278 (_ BitVec 32)) (x!49249 (_ BitVec 32))) (Undefined!4516) (MissingVacant!4516 (index!20279 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33395 (_ BitVec 32)) SeekEntryResult!4516)

(assert (=> b!525721 (= e!306499 (= (seekEntryOrOpen!0 (select (arr!16049 a!3235) j!176) a!3235 mask!3524) (Found!4516 j!176)))))

(declare-fun b!525722 () Bool)

(declare-fun e!306501 () Bool)

(assert (=> b!525722 (= e!306501 false)))

(declare-fun b!525723 () Bool)

(declare-fun res!322452 () Bool)

(assert (=> b!525723 (=> (not res!322452) (not e!306500))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!525723 (= res!322452 (and (= (size!16413 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16413 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16413 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525724 () Bool)

(declare-fun res!322453 () Bool)

(declare-fun e!306503 () Bool)

(assert (=> b!525724 (=> res!322453 e!306503)))

(declare-fun lt!241595 () SeekEntryResult!4516)

(assert (=> b!525724 (= res!322453 (or (undefined!5328 lt!241595) (not (is-Intermediate!4516 lt!241595))))))

(declare-fun b!525725 () Bool)

(declare-fun res!322451 () Bool)

(assert (=> b!525725 (=> (not res!322451) (not e!306500))))

(declare-fun arrayContainsKey!0 (array!33395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525725 (= res!322451 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525726 () Bool)

(assert (=> b!525726 (= e!306503 true)))

(assert (=> b!525726 (= (index!20278 lt!241595) i!1204)))

(declare-datatypes ((Unit!16516 0))(
  ( (Unit!16517) )
))
(declare-fun lt!241601 () Unit!16516)

(declare-fun lt!241594 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33395 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16516)

(assert (=> b!525726 (= lt!241601 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!241594 #b00000000000000000000000000000000 (index!20278 lt!241595) (x!49249 lt!241595) mask!3524))))

(assert (=> b!525726 (and (or (= (select (arr!16049 a!3235) (index!20278 lt!241595)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16049 a!3235) (index!20278 lt!241595)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16049 a!3235) (index!20278 lt!241595)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16049 a!3235) (index!20278 lt!241595)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241600 () Unit!16516)

(declare-fun e!306498 () Unit!16516)

(assert (=> b!525726 (= lt!241600 e!306498)))

(declare-fun c!61943 () Bool)

(assert (=> b!525726 (= c!61943 (= (select (arr!16049 a!3235) (index!20278 lt!241595)) (select (arr!16049 a!3235) j!176)))))

(assert (=> b!525726 (and (bvslt (x!49249 lt!241595) #b01111111111111111111111111111110) (or (= (select (arr!16049 a!3235) (index!20278 lt!241595)) (select (arr!16049 a!3235) j!176)) (= (select (arr!16049 a!3235) (index!20278 lt!241595)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16049 a!3235) (index!20278 lt!241595)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525727 () Bool)

(declare-fun res!322449 () Bool)

(assert (=> b!525727 (=> (not res!322449) (not e!306502))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33395 (_ BitVec 32)) Bool)

(assert (=> b!525727 (= res!322449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!322446 () Bool)

(assert (=> start!47758 (=> (not res!322446) (not e!306500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47758 (= res!322446 (validMask!0 mask!3524))))

(assert (=> start!47758 e!306500))

(assert (=> start!47758 true))

(declare-fun array_inv!11845 (array!33395) Bool)

(assert (=> start!47758 (array_inv!11845 a!3235)))

(declare-fun b!525719 () Bool)

(assert (=> b!525719 (= e!306500 e!306502)))

(declare-fun res!322448 () Bool)

(assert (=> b!525719 (=> (not res!322448) (not e!306502))))

(declare-fun lt!241598 () SeekEntryResult!4516)

(assert (=> b!525719 (= res!322448 (or (= lt!241598 (MissingZero!4516 i!1204)) (= lt!241598 (MissingVacant!4516 i!1204))))))

(assert (=> b!525719 (= lt!241598 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!525728 () Bool)

(declare-fun Unit!16518 () Unit!16516)

(assert (=> b!525728 (= e!306498 Unit!16518)))

(declare-fun lt!241599 () Unit!16516)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33395 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16516)

(assert (=> b!525728 (= lt!241599 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!241594 #b00000000000000000000000000000000 (index!20278 lt!241595) (x!49249 lt!241595) mask!3524))))

(declare-fun lt!241603 () array!33395)

(declare-fun res!322445 () Bool)

(declare-fun lt!241596 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33395 (_ BitVec 32)) SeekEntryResult!4516)

(assert (=> b!525728 (= res!322445 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241594 lt!241596 lt!241603 mask!3524) (Intermediate!4516 false (index!20278 lt!241595) (x!49249 lt!241595))))))

(assert (=> b!525728 (=> (not res!322445) (not e!306501))))

(assert (=> b!525728 e!306501))

(declare-fun b!525729 () Bool)

(declare-fun Unit!16519 () Unit!16516)

(assert (=> b!525729 (= e!306498 Unit!16519)))

(declare-fun b!525730 () Bool)

(declare-fun res!322450 () Bool)

(assert (=> b!525730 (=> (not res!322450) (not e!306500))))

(assert (=> b!525730 (= res!322450 (validKeyInArray!0 (select (arr!16049 a!3235) j!176)))))

(declare-fun b!525731 () Bool)

(assert (=> b!525731 (= e!306502 (not e!306503))))

(declare-fun res!322447 () Bool)

(assert (=> b!525731 (=> res!322447 e!306503)))

(declare-fun lt!241602 () (_ BitVec 32))

(assert (=> b!525731 (= res!322447 (= lt!241595 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241602 lt!241596 lt!241603 mask!3524)))))

(assert (=> b!525731 (= lt!241595 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241594 (select (arr!16049 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525731 (= lt!241602 (toIndex!0 lt!241596 mask!3524))))

(assert (=> b!525731 (= lt!241596 (select (store (arr!16049 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!525731 (= lt!241594 (toIndex!0 (select (arr!16049 a!3235) j!176) mask!3524))))

(assert (=> b!525731 (= lt!241603 (array!33396 (store (arr!16049 a!3235) i!1204 k!2280) (size!16413 a!3235)))))

(assert (=> b!525731 e!306499))

(declare-fun res!322454 () Bool)

(assert (=> b!525731 (=> (not res!322454) (not e!306499))))

(assert (=> b!525731 (= res!322454 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241597 () Unit!16516)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33395 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16516)

(assert (=> b!525731 (= lt!241597 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!47758 res!322446) b!525723))

(assert (= (and b!525723 res!322452) b!525730))

(assert (= (and b!525730 res!322450) b!525718))

(assert (= (and b!525718 res!322443) b!525725))

(assert (= (and b!525725 res!322451) b!525719))

(assert (= (and b!525719 res!322448) b!525727))

(assert (= (and b!525727 res!322449) b!525720))

(assert (= (and b!525720 res!322444) b!525731))

(assert (= (and b!525731 res!322454) b!525721))

(assert (= (and b!525731 (not res!322447)) b!525724))

(assert (= (and b!525724 (not res!322453)) b!525726))

(assert (= (and b!525726 c!61943) b!525728))

(assert (= (and b!525726 (not c!61943)) b!525729))

(assert (= (and b!525728 res!322445) b!525722))

(declare-fun m!506389 () Bool)

(assert (=> b!525728 m!506389))

(declare-fun m!506391 () Bool)

(assert (=> b!525728 m!506391))

(declare-fun m!506393 () Bool)

(assert (=> b!525725 m!506393))

(declare-fun m!506395 () Bool)

(assert (=> b!525731 m!506395))

(declare-fun m!506397 () Bool)

(assert (=> b!525731 m!506397))

(declare-fun m!506399 () Bool)

(assert (=> b!525731 m!506399))

(declare-fun m!506401 () Bool)

(assert (=> b!525731 m!506401))

(declare-fun m!506403 () Bool)

(assert (=> b!525731 m!506403))

(declare-fun m!506405 () Bool)

(assert (=> b!525731 m!506405))

(assert (=> b!525731 m!506403))

(declare-fun m!506407 () Bool)

(assert (=> b!525731 m!506407))

(assert (=> b!525731 m!506403))

(declare-fun m!506409 () Bool)

(assert (=> b!525731 m!506409))

(declare-fun m!506411 () Bool)

(assert (=> b!525731 m!506411))

(declare-fun m!506413 () Bool)

(assert (=> start!47758 m!506413))

(declare-fun m!506415 () Bool)

(assert (=> start!47758 m!506415))

(assert (=> b!525721 m!506403))

(assert (=> b!525721 m!506403))

(declare-fun m!506417 () Bool)

(assert (=> b!525721 m!506417))

(assert (=> b!525730 m!506403))

(assert (=> b!525730 m!506403))

(declare-fun m!506419 () Bool)

(assert (=> b!525730 m!506419))

(declare-fun m!506421 () Bool)

(assert (=> b!525727 m!506421))

(declare-fun m!506423 () Bool)

(assert (=> b!525726 m!506423))

(declare-fun m!506425 () Bool)

(assert (=> b!525726 m!506425))

(assert (=> b!525726 m!506403))

(declare-fun m!506427 () Bool)

(assert (=> b!525719 m!506427))

(declare-fun m!506429 () Bool)

(assert (=> b!525720 m!506429))

(declare-fun m!506431 () Bool)

(assert (=> b!525718 m!506431))

(push 1)

