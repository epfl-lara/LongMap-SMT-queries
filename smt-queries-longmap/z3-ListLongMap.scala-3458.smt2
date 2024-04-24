; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48008 () Bool)

(assert start!48008)

(declare-fun b!528762 () Bool)

(declare-fun e!308134 () Bool)

(assert (=> b!528762 (= e!308134 true)))

(declare-datatypes ((SeekEntryResult!4522 0))(
  ( (MissingZero!4522 (index!20312 (_ BitVec 32))) (Found!4522 (index!20313 (_ BitVec 32))) (Intermediate!4522 (undefined!5334 Bool) (index!20314 (_ BitVec 32)) (x!49431 (_ BitVec 32))) (Undefined!4522) (MissingVacant!4522 (index!20315 (_ BitVec 32))) )
))
(declare-fun lt!243655 () SeekEntryResult!4522)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33502 0))(
  ( (array!33503 (arr!16099 (Array (_ BitVec 32) (_ BitVec 64))) (size!16463 (_ BitVec 32))) )
))
(declare-fun lt!243658 () array!33502)

(declare-fun lt!243661 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33502 (_ BitVec 32)) SeekEntryResult!4522)

(assert (=> b!528762 (= (seekEntryOrOpen!0 lt!243661 lt!243658 mask!3524) lt!243655)))

(declare-fun lt!243650 () SeekEntryResult!4522)

(declare-fun lt!243657 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun a!3235 () array!33502)

(declare-datatypes ((Unit!16699 0))(
  ( (Unit!16700) )
))
(declare-fun lt!243652 () Unit!16699)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!33502 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16699)

(assert (=> b!528762 (= lt!243652 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!243657 #b00000000000000000000000000000000 (index!20314 lt!243650) (x!49431 lt!243650) mask!3524))))

(declare-fun b!528763 () Bool)

(declare-fun e!308132 () Unit!16699)

(declare-fun Unit!16701 () Unit!16699)

(assert (=> b!528763 (= e!308132 Unit!16701)))

(declare-fun lt!243654 () Unit!16699)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33502 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16699)

(assert (=> b!528763 (= lt!243654 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!243657 #b00000000000000000000000000000000 (index!20314 lt!243650) (x!49431 lt!243650) mask!3524))))

(declare-fun res!324766 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33502 (_ BitVec 32)) SeekEntryResult!4522)

(assert (=> b!528763 (= res!324766 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243657 lt!243661 lt!243658 mask!3524) (Intermediate!4522 false (index!20314 lt!243650) (x!49431 lt!243650))))))

(declare-fun e!308128 () Bool)

(assert (=> b!528763 (=> (not res!324766) (not e!308128))))

(assert (=> b!528763 e!308128))

(declare-fun b!528764 () Bool)

(declare-fun res!324762 () Bool)

(assert (=> b!528764 (=> res!324762 e!308134)))

(declare-fun lt!243653 () SeekEntryResult!4522)

(assert (=> b!528764 (= res!324762 (not (= lt!243653 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243657 lt!243661 lt!243658 mask!3524))))))

(declare-fun b!528765 () Bool)

(declare-fun e!308135 () Bool)

(declare-fun e!308133 () Bool)

(assert (=> b!528765 (= e!308135 (not e!308133))))

(declare-fun res!324767 () Bool)

(assert (=> b!528765 (=> res!324767 e!308133)))

(get-info :version)

(assert (=> b!528765 (= res!324767 (or (= lt!243650 lt!243653) (undefined!5334 lt!243650) (not ((_ is Intermediate!4522) lt!243650))))))

(declare-fun lt!243659 () (_ BitVec 32))

(assert (=> b!528765 (= lt!243653 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243659 lt!243661 lt!243658 mask!3524))))

(assert (=> b!528765 (= lt!243650 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243657 (select (arr!16099 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!528765 (= lt!243659 (toIndex!0 lt!243661 mask!3524))))

(assert (=> b!528765 (= lt!243661 (select (store (arr!16099 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!528765 (= lt!243657 (toIndex!0 (select (arr!16099 a!3235) j!176) mask!3524))))

(assert (=> b!528765 (= lt!243658 (array!33503 (store (arr!16099 a!3235) i!1204 k0!2280) (size!16463 a!3235)))))

(assert (=> b!528765 (= lt!243655 (Found!4522 j!176))))

(declare-fun e!308131 () Bool)

(assert (=> b!528765 e!308131))

(declare-fun res!324758 () Bool)

(assert (=> b!528765 (=> (not res!324758) (not e!308131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33502 (_ BitVec 32)) Bool)

(assert (=> b!528765 (= res!324758 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!243651 () Unit!16699)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33502 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16699)

(assert (=> b!528765 (= lt!243651 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!528766 () Bool)

(declare-fun res!324755 () Bool)

(declare-fun e!308136 () Bool)

(assert (=> b!528766 (=> (not res!324755) (not e!308136))))

(declare-fun arrayContainsKey!0 (array!33502 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!528766 (= res!324755 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!528767 () Bool)

(assert (=> b!528767 (= e!308128 false)))

(declare-fun b!528768 () Bool)

(declare-fun res!324769 () Bool)

(assert (=> b!528768 (=> (not res!324769) (not e!308136))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!528768 (= res!324769 (validKeyInArray!0 k0!2280))))

(declare-fun b!528769 () Bool)

(declare-fun res!324764 () Bool)

(assert (=> b!528769 (=> res!324764 e!308134)))

(declare-fun e!308130 () Bool)

(assert (=> b!528769 (= res!324764 e!308130)))

(declare-fun res!324760 () Bool)

(assert (=> b!528769 (=> (not res!324760) (not e!308130))))

(assert (=> b!528769 (= res!324760 (bvsgt #b00000000000000000000000000000000 (x!49431 lt!243650)))))

(declare-fun b!528770 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33502 (_ BitVec 32)) SeekEntryResult!4522)

(assert (=> b!528770 (= e!308130 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243657 (index!20314 lt!243650) (select (arr!16099 a!3235) j!176) a!3235 mask!3524) lt!243655)))))

(declare-fun b!528771 () Bool)

(declare-fun res!324765 () Bool)

(assert (=> b!528771 (=> (not res!324765) (not e!308136))))

(assert (=> b!528771 (= res!324765 (and (= (size!16463 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16463 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16463 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!528772 () Bool)

(declare-fun Unit!16702 () Unit!16699)

(assert (=> b!528772 (= e!308132 Unit!16702)))

(declare-fun res!324768 () Bool)

(assert (=> start!48008 (=> (not res!324768) (not e!308136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48008 (= res!324768 (validMask!0 mask!3524))))

(assert (=> start!48008 e!308136))

(assert (=> start!48008 true))

(declare-fun array_inv!11958 (array!33502) Bool)

(assert (=> start!48008 (array_inv!11958 a!3235)))

(declare-fun b!528773 () Bool)

(assert (=> b!528773 (= e!308131 (= (seekEntryOrOpen!0 (select (arr!16099 a!3235) j!176) a!3235 mask!3524) (Found!4522 j!176)))))

(declare-fun b!528774 () Bool)

(declare-fun res!324759 () Bool)

(assert (=> b!528774 (=> (not res!324759) (not e!308135))))

(assert (=> b!528774 (= res!324759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!528775 () Bool)

(assert (=> b!528775 (= e!308133 e!308134)))

(declare-fun res!324757 () Bool)

(assert (=> b!528775 (=> res!324757 e!308134)))

(assert (=> b!528775 (= res!324757 (or (bvsgt (x!49431 lt!243650) #b01111111111111111111111111111110) (bvslt lt!243657 #b00000000000000000000000000000000) (bvsge lt!243657 (size!16463 a!3235)) (bvslt (index!20314 lt!243650) #b00000000000000000000000000000000) (bvsge (index!20314 lt!243650) (size!16463 a!3235)) (not (= lt!243650 (Intermediate!4522 false (index!20314 lt!243650) (x!49431 lt!243650))))))))

(assert (=> b!528775 (= (index!20314 lt!243650) i!1204)))

(declare-fun lt!243660 () Unit!16699)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33502 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16699)

(assert (=> b!528775 (= lt!243660 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!243657 #b00000000000000000000000000000000 (index!20314 lt!243650) (x!49431 lt!243650) mask!3524))))

(assert (=> b!528775 (and (or (= (select (arr!16099 a!3235) (index!20314 lt!243650)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16099 a!3235) (index!20314 lt!243650)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16099 a!3235) (index!20314 lt!243650)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16099 a!3235) (index!20314 lt!243650)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243656 () Unit!16699)

(assert (=> b!528775 (= lt!243656 e!308132)))

(declare-fun c!62312 () Bool)

(assert (=> b!528775 (= c!62312 (= (select (arr!16099 a!3235) (index!20314 lt!243650)) (select (arr!16099 a!3235) j!176)))))

(assert (=> b!528775 (and (bvslt (x!49431 lt!243650) #b01111111111111111111111111111110) (or (= (select (arr!16099 a!3235) (index!20314 lt!243650)) (select (arr!16099 a!3235) j!176)) (= (select (arr!16099 a!3235) (index!20314 lt!243650)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16099 a!3235) (index!20314 lt!243650)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!528776 () Bool)

(declare-fun res!324756 () Bool)

(assert (=> b!528776 (=> (not res!324756) (not e!308136))))

(assert (=> b!528776 (= res!324756 (validKeyInArray!0 (select (arr!16099 a!3235) j!176)))))

(declare-fun b!528777 () Bool)

(declare-fun res!324761 () Bool)

(assert (=> b!528777 (=> (not res!324761) (not e!308135))))

(declare-datatypes ((List!10164 0))(
  ( (Nil!10161) (Cons!10160 (h!11097 (_ BitVec 64)) (t!16384 List!10164)) )
))
(declare-fun arrayNoDuplicates!0 (array!33502 (_ BitVec 32) List!10164) Bool)

(assert (=> b!528777 (= res!324761 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10161))))

(declare-fun b!528778 () Bool)

(assert (=> b!528778 (= e!308136 e!308135)))

(declare-fun res!324763 () Bool)

(assert (=> b!528778 (=> (not res!324763) (not e!308135))))

(declare-fun lt!243649 () SeekEntryResult!4522)

(assert (=> b!528778 (= res!324763 (or (= lt!243649 (MissingZero!4522 i!1204)) (= lt!243649 (MissingVacant!4522 i!1204))))))

(assert (=> b!528778 (= lt!243649 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!48008 res!324768) b!528771))

(assert (= (and b!528771 res!324765) b!528776))

(assert (= (and b!528776 res!324756) b!528768))

(assert (= (and b!528768 res!324769) b!528766))

(assert (= (and b!528766 res!324755) b!528778))

(assert (= (and b!528778 res!324763) b!528774))

(assert (= (and b!528774 res!324759) b!528777))

(assert (= (and b!528777 res!324761) b!528765))

(assert (= (and b!528765 res!324758) b!528773))

(assert (= (and b!528765 (not res!324767)) b!528775))

(assert (= (and b!528775 c!62312) b!528763))

(assert (= (and b!528775 (not c!62312)) b!528772))

(assert (= (and b!528763 res!324766) b!528767))

(assert (= (and b!528775 (not res!324757)) b!528769))

(assert (= (and b!528769 res!324760) b!528770))

(assert (= (and b!528769 (not res!324764)) b!528764))

(assert (= (and b!528764 (not res!324762)) b!528762))

(declare-fun m!509539 () Bool)

(assert (=> b!528778 m!509539))

(declare-fun m!509541 () Bool)

(assert (=> b!528776 m!509541))

(assert (=> b!528776 m!509541))

(declare-fun m!509543 () Bool)

(assert (=> b!528776 m!509543))

(declare-fun m!509545 () Bool)

(assert (=> b!528765 m!509545))

(declare-fun m!509547 () Bool)

(assert (=> b!528765 m!509547))

(declare-fun m!509549 () Bool)

(assert (=> b!528765 m!509549))

(assert (=> b!528765 m!509541))

(declare-fun m!509551 () Bool)

(assert (=> b!528765 m!509551))

(assert (=> b!528765 m!509541))

(declare-fun m!509553 () Bool)

(assert (=> b!528765 m!509553))

(assert (=> b!528765 m!509541))

(declare-fun m!509555 () Bool)

(assert (=> b!528765 m!509555))

(declare-fun m!509557 () Bool)

(assert (=> b!528765 m!509557))

(declare-fun m!509559 () Bool)

(assert (=> b!528765 m!509559))

(declare-fun m!509561 () Bool)

(assert (=> start!48008 m!509561))

(declare-fun m!509563 () Bool)

(assert (=> start!48008 m!509563))

(declare-fun m!509565 () Bool)

(assert (=> b!528768 m!509565))

(declare-fun m!509567 () Bool)

(assert (=> b!528775 m!509567))

(declare-fun m!509569 () Bool)

(assert (=> b!528775 m!509569))

(assert (=> b!528775 m!509541))

(declare-fun m!509571 () Bool)

(assert (=> b!528777 m!509571))

(declare-fun m!509573 () Bool)

(assert (=> b!528764 m!509573))

(assert (=> b!528770 m!509541))

(assert (=> b!528770 m!509541))

(declare-fun m!509575 () Bool)

(assert (=> b!528770 m!509575))

(declare-fun m!509577 () Bool)

(assert (=> b!528762 m!509577))

(declare-fun m!509579 () Bool)

(assert (=> b!528762 m!509579))

(declare-fun m!509581 () Bool)

(assert (=> b!528774 m!509581))

(declare-fun m!509583 () Bool)

(assert (=> b!528763 m!509583))

(assert (=> b!528763 m!509573))

(assert (=> b!528773 m!509541))

(assert (=> b!528773 m!509541))

(declare-fun m!509585 () Bool)

(assert (=> b!528773 m!509585))

(declare-fun m!509587 () Bool)

(assert (=> b!528766 m!509587))

(check-sat (not b!528776) (not b!528773) (not b!528768) (not start!48008) (not b!528774) (not b!528770) (not b!528777) (not b!528766) (not b!528762) (not b!528775) (not b!528764) (not b!528763) (not b!528765) (not b!528778))
(check-sat)
