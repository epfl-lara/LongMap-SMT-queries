; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48018 () Bool)

(assert start!48018)

(declare-fun b!528823 () Bool)

(declare-fun res!324768 () Bool)

(declare-fun e!308167 () Bool)

(assert (=> b!528823 (=> (not res!324768) (not e!308167))))

(declare-datatypes ((array!33511 0))(
  ( (array!33512 (arr!16104 (Array (_ BitVec 32) (_ BitVec 64))) (size!16468 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33511)

(declare-datatypes ((List!10262 0))(
  ( (Nil!10259) (Cons!10258 (h!11195 (_ BitVec 64)) (t!16490 List!10262)) )
))
(declare-fun arrayNoDuplicates!0 (array!33511 (_ BitVec 32) List!10262) Bool)

(assert (=> b!528823 (= res!324768 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10259))))

(declare-fun b!528824 () Bool)

(declare-fun e!308171 () Bool)

(assert (=> b!528824 (= e!308171 true)))

(declare-fun lt!243646 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4571 0))(
  ( (MissingZero!4571 (index!20508 (_ BitVec 32))) (Found!4571 (index!20509 (_ BitVec 32))) (Intermediate!4571 (undefined!5383 Bool) (index!20510 (_ BitVec 32)) (x!49483 (_ BitVec 32))) (Undefined!4571) (MissingVacant!4571 (index!20511 (_ BitVec 32))) )
))
(declare-fun lt!243639 () SeekEntryResult!4571)

(declare-fun lt!243637 () array!33511)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33511 (_ BitVec 32)) SeekEntryResult!4571)

(assert (=> b!528824 (= (seekEntryOrOpen!0 lt!243646 lt!243637 mask!3524) lt!243639)))

(declare-datatypes ((Unit!16736 0))(
  ( (Unit!16737) )
))
(declare-fun lt!243645 () Unit!16736)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!243640 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!243641 () SeekEntryResult!4571)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!33511 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16736)

(assert (=> b!528824 (= lt!243645 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k!2280 j!176 lt!243640 #b00000000000000000000000000000000 (index!20510 lt!243641) (x!49483 lt!243641) mask!3524))))

(declare-fun b!528825 () Bool)

(declare-fun e!308168 () Bool)

(assert (=> b!528825 (= e!308167 (not e!308168))))

(declare-fun res!324766 () Bool)

(assert (=> b!528825 (=> res!324766 e!308168)))

(declare-fun lt!243638 () SeekEntryResult!4571)

(assert (=> b!528825 (= res!324766 (or (= lt!243641 lt!243638) (undefined!5383 lt!243641) (not (is-Intermediate!4571 lt!243641))))))

(declare-fun lt!243644 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33511 (_ BitVec 32)) SeekEntryResult!4571)

(assert (=> b!528825 (= lt!243638 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243644 lt!243646 lt!243637 mask!3524))))

(assert (=> b!528825 (= lt!243641 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243640 (select (arr!16104 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!528825 (= lt!243644 (toIndex!0 lt!243646 mask!3524))))

(assert (=> b!528825 (= lt!243646 (select (store (arr!16104 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!528825 (= lt!243640 (toIndex!0 (select (arr!16104 a!3235) j!176) mask!3524))))

(assert (=> b!528825 (= lt!243637 (array!33512 (store (arr!16104 a!3235) i!1204 k!2280) (size!16468 a!3235)))))

(assert (=> b!528825 (= lt!243639 (Found!4571 j!176))))

(declare-fun e!308173 () Bool)

(assert (=> b!528825 e!308173))

(declare-fun res!324771 () Bool)

(assert (=> b!528825 (=> (not res!324771) (not e!308173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33511 (_ BitVec 32)) Bool)

(assert (=> b!528825 (= res!324771 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!243649 () Unit!16736)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33511 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16736)

(assert (=> b!528825 (= lt!243649 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!528826 () Bool)

(declare-fun e!308170 () Unit!16736)

(declare-fun Unit!16738 () Unit!16736)

(assert (=> b!528826 (= e!308170 Unit!16738)))

(declare-fun lt!243643 () Unit!16736)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33511 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16736)

(assert (=> b!528826 (= lt!243643 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!243640 #b00000000000000000000000000000000 (index!20510 lt!243641) (x!49483 lt!243641) mask!3524))))

(declare-fun res!324770 () Bool)

(assert (=> b!528826 (= res!324770 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243640 lt!243646 lt!243637 mask!3524) (Intermediate!4571 false (index!20510 lt!243641) (x!49483 lt!243641))))))

(declare-fun e!308172 () Bool)

(assert (=> b!528826 (=> (not res!324770) (not e!308172))))

(assert (=> b!528826 e!308172))

(declare-fun b!528827 () Bool)

(assert (=> b!528827 (= e!308168 e!308171)))

(declare-fun res!324767 () Bool)

(assert (=> b!528827 (=> res!324767 e!308171)))

(assert (=> b!528827 (= res!324767 (or (bvsgt (x!49483 lt!243641) #b01111111111111111111111111111110) (bvslt lt!243640 #b00000000000000000000000000000000) (bvsge lt!243640 (size!16468 a!3235)) (bvslt (index!20510 lt!243641) #b00000000000000000000000000000000) (bvsge (index!20510 lt!243641) (size!16468 a!3235)) (not (= lt!243641 (Intermediate!4571 false (index!20510 lt!243641) (x!49483 lt!243641))))))))

(assert (=> b!528827 (= (index!20510 lt!243641) i!1204)))

(declare-fun lt!243647 () Unit!16736)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33511 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16736)

(assert (=> b!528827 (= lt!243647 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!243640 #b00000000000000000000000000000000 (index!20510 lt!243641) (x!49483 lt!243641) mask!3524))))

(assert (=> b!528827 (and (or (= (select (arr!16104 a!3235) (index!20510 lt!243641)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16104 a!3235) (index!20510 lt!243641)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16104 a!3235) (index!20510 lt!243641)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16104 a!3235) (index!20510 lt!243641)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243648 () Unit!16736)

(assert (=> b!528827 (= lt!243648 e!308170)))

(declare-fun c!62339 () Bool)

(assert (=> b!528827 (= c!62339 (= (select (arr!16104 a!3235) (index!20510 lt!243641)) (select (arr!16104 a!3235) j!176)))))

(assert (=> b!528827 (and (bvslt (x!49483 lt!243641) #b01111111111111111111111111111110) (or (= (select (arr!16104 a!3235) (index!20510 lt!243641)) (select (arr!16104 a!3235) j!176)) (= (select (arr!16104 a!3235) (index!20510 lt!243641)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16104 a!3235) (index!20510 lt!243641)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!528828 () Bool)

(declare-fun res!324765 () Bool)

(declare-fun e!308169 () Bool)

(assert (=> b!528828 (=> (not res!324765) (not e!308169))))

(declare-fun arrayContainsKey!0 (array!33511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!528828 (= res!324765 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!528829 () Bool)

(declare-fun res!324773 () Bool)

(assert (=> b!528829 (=> res!324773 e!308171)))

(declare-fun e!308174 () Bool)

(assert (=> b!528829 (= res!324773 e!308174)))

(declare-fun res!324774 () Bool)

(assert (=> b!528829 (=> (not res!324774) (not e!308174))))

(assert (=> b!528829 (= res!324774 (bvsgt #b00000000000000000000000000000000 (x!49483 lt!243641)))))

(declare-fun b!528831 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33511 (_ BitVec 32)) SeekEntryResult!4571)

(assert (=> b!528831 (= e!308174 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243640 (index!20510 lt!243641) (select (arr!16104 a!3235) j!176) a!3235 mask!3524) lt!243639)))))

(declare-fun b!528832 () Bool)

(declare-fun res!324775 () Bool)

(assert (=> b!528832 (=> (not res!324775) (not e!308169))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!528832 (= res!324775 (validKeyInArray!0 (select (arr!16104 a!3235) j!176)))))

(declare-fun b!528833 () Bool)

(assert (=> b!528833 (= e!308172 false)))

(declare-fun b!528834 () Bool)

(declare-fun res!324772 () Bool)

(assert (=> b!528834 (=> (not res!324772) (not e!308169))))

(assert (=> b!528834 (= res!324772 (and (= (size!16468 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16468 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16468 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!528835 () Bool)

(assert (=> b!528835 (= e!308173 (= (seekEntryOrOpen!0 (select (arr!16104 a!3235) j!176) a!3235 mask!3524) (Found!4571 j!176)))))

(declare-fun b!528836 () Bool)

(declare-fun res!324776 () Bool)

(assert (=> b!528836 (=> res!324776 e!308171)))

(assert (=> b!528836 (= res!324776 (not (= lt!243638 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243640 lt!243646 lt!243637 mask!3524))))))

(declare-fun b!528837 () Bool)

(declare-fun res!324764 () Bool)

(assert (=> b!528837 (=> (not res!324764) (not e!308167))))

(assert (=> b!528837 (= res!324764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!528838 () Bool)

(assert (=> b!528838 (= e!308169 e!308167)))

(declare-fun res!324763 () Bool)

(assert (=> b!528838 (=> (not res!324763) (not e!308167))))

(declare-fun lt!243642 () SeekEntryResult!4571)

(assert (=> b!528838 (= res!324763 (or (= lt!243642 (MissingZero!4571 i!1204)) (= lt!243642 (MissingVacant!4571 i!1204))))))

(assert (=> b!528838 (= lt!243642 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!528839 () Bool)

(declare-fun res!324762 () Bool)

(assert (=> b!528839 (=> (not res!324762) (not e!308169))))

(assert (=> b!528839 (= res!324762 (validKeyInArray!0 k!2280))))

(declare-fun res!324769 () Bool)

(assert (=> start!48018 (=> (not res!324769) (not e!308169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48018 (= res!324769 (validMask!0 mask!3524))))

(assert (=> start!48018 e!308169))

(assert (=> start!48018 true))

(declare-fun array_inv!11900 (array!33511) Bool)

(assert (=> start!48018 (array_inv!11900 a!3235)))

(declare-fun b!528830 () Bool)

(declare-fun Unit!16739 () Unit!16736)

(assert (=> b!528830 (= e!308170 Unit!16739)))

(assert (= (and start!48018 res!324769) b!528834))

(assert (= (and b!528834 res!324772) b!528832))

(assert (= (and b!528832 res!324775) b!528839))

(assert (= (and b!528839 res!324762) b!528828))

(assert (= (and b!528828 res!324765) b!528838))

(assert (= (and b!528838 res!324763) b!528837))

(assert (= (and b!528837 res!324764) b!528823))

(assert (= (and b!528823 res!324768) b!528825))

(assert (= (and b!528825 res!324771) b!528835))

(assert (= (and b!528825 (not res!324766)) b!528827))

(assert (= (and b!528827 c!62339) b!528826))

(assert (= (and b!528827 (not c!62339)) b!528830))

(assert (= (and b!528826 res!324770) b!528833))

(assert (= (and b!528827 (not res!324767)) b!528829))

(assert (= (and b!528829 res!324774) b!528831))

(assert (= (and b!528829 (not res!324773)) b!528836))

(assert (= (and b!528836 (not res!324776)) b!528824))

(declare-fun m!509355 () Bool)

(assert (=> b!528832 m!509355))

(assert (=> b!528832 m!509355))

(declare-fun m!509357 () Bool)

(assert (=> b!528832 m!509357))

(declare-fun m!509359 () Bool)

(assert (=> start!48018 m!509359))

(declare-fun m!509361 () Bool)

(assert (=> start!48018 m!509361))

(declare-fun m!509363 () Bool)

(assert (=> b!528837 m!509363))

(assert (=> b!528835 m!509355))

(assert (=> b!528835 m!509355))

(declare-fun m!509365 () Bool)

(assert (=> b!528835 m!509365))

(declare-fun m!509367 () Bool)

(assert (=> b!528828 m!509367))

(declare-fun m!509369 () Bool)

(assert (=> b!528839 m!509369))

(declare-fun m!509371 () Bool)

(assert (=> b!528826 m!509371))

(declare-fun m!509373 () Bool)

(assert (=> b!528826 m!509373))

(declare-fun m!509375 () Bool)

(assert (=> b!528827 m!509375))

(declare-fun m!509377 () Bool)

(assert (=> b!528827 m!509377))

(assert (=> b!528827 m!509355))

(declare-fun m!509379 () Bool)

(assert (=> b!528838 m!509379))

(assert (=> b!528836 m!509373))

(assert (=> b!528831 m!509355))

(assert (=> b!528831 m!509355))

(declare-fun m!509381 () Bool)

(assert (=> b!528831 m!509381))

(declare-fun m!509383 () Bool)

(assert (=> b!528824 m!509383))

(declare-fun m!509385 () Bool)

(assert (=> b!528824 m!509385))

(declare-fun m!509387 () Bool)

(assert (=> b!528825 m!509387))

(declare-fun m!509389 () Bool)

(assert (=> b!528825 m!509389))

(declare-fun m!509391 () Bool)

(assert (=> b!528825 m!509391))

(assert (=> b!528825 m!509355))

(declare-fun m!509393 () Bool)

(assert (=> b!528825 m!509393))

(declare-fun m!509395 () Bool)

(assert (=> b!528825 m!509395))

(declare-fun m!509397 () Bool)

(assert (=> b!528825 m!509397))

(assert (=> b!528825 m!509355))

(declare-fun m!509399 () Bool)

(assert (=> b!528825 m!509399))

(assert (=> b!528825 m!509355))

(declare-fun m!509401 () Bool)

(assert (=> b!528825 m!509401))

(declare-fun m!509403 () Bool)

(assert (=> b!528823 m!509403))

(push 1)

