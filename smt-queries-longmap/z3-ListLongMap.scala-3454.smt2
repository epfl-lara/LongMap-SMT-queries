; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47906 () Bool)

(assert start!47906)

(declare-fun b!527792 () Bool)

(declare-datatypes ((Unit!16651 0))(
  ( (Unit!16652) )
))
(declare-fun e!307580 () Unit!16651)

(declare-fun Unit!16653 () Unit!16651)

(assert (=> b!527792 (= e!307580 Unit!16653)))

(declare-fun b!527793 () Bool)

(declare-fun res!324114 () Bool)

(declare-fun e!307574 () Bool)

(assert (=> b!527793 (=> (not res!324114) (not e!307574))))

(declare-datatypes ((array!33475 0))(
  ( (array!33476 (arr!16087 (Array (_ BitVec 32) (_ BitVec 64))) (size!16451 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33475)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!527793 (= res!324114 (validKeyInArray!0 (select (arr!16087 a!3235) j!176)))))

(declare-fun b!527794 () Bool)

(declare-fun res!324120 () Bool)

(declare-fun e!307575 () Bool)

(assert (=> b!527794 (=> (not res!324120) (not e!307575))))

(declare-datatypes ((List!10152 0))(
  ( (Nil!10149) (Cons!10148 (h!11082 (_ BitVec 64)) (t!16372 List!10152)) )
))
(declare-fun arrayNoDuplicates!0 (array!33475 (_ BitVec 32) List!10152) Bool)

(assert (=> b!527794 (= res!324120 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10149))))

(declare-fun res!324121 () Bool)

(assert (=> start!47906 (=> (not res!324121) (not e!307574))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47906 (= res!324121 (validMask!0 mask!3524))))

(assert (=> start!47906 e!307574))

(assert (=> start!47906 true))

(declare-fun array_inv!11946 (array!33475) Bool)

(assert (=> start!47906 (array_inv!11946 a!3235)))

(declare-fun b!527795 () Bool)

(assert (=> b!527795 (= e!307574 e!307575)))

(declare-fun res!324123 () Bool)

(assert (=> b!527795 (=> (not res!324123) (not e!307575))))

(declare-datatypes ((SeekEntryResult!4510 0))(
  ( (MissingZero!4510 (index!20258 (_ BitVec 32))) (Found!4510 (index!20259 (_ BitVec 32))) (Intermediate!4510 (undefined!5322 Bool) (index!20260 (_ BitVec 32)) (x!49372 (_ BitVec 32))) (Undefined!4510) (MissingVacant!4510 (index!20261 (_ BitVec 32))) )
))
(declare-fun lt!243055 () SeekEntryResult!4510)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!527795 (= res!324123 (or (= lt!243055 (MissingZero!4510 i!1204)) (= lt!243055 (MissingVacant!4510 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33475 (_ BitVec 32)) SeekEntryResult!4510)

(assert (=> b!527795 (= lt!243055 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!527796 () Bool)

(declare-fun res!324116 () Bool)

(assert (=> b!527796 (=> (not res!324116) (not e!307574))))

(declare-fun arrayContainsKey!0 (array!33475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!527796 (= res!324116 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun lt!243056 () (_ BitVec 32))

(declare-fun b!527797 () Bool)

(declare-fun e!307576 () Bool)

(declare-fun lt!243058 () SeekEntryResult!4510)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33475 (_ BitVec 32)) SeekEntryResult!4510)

(assert (=> b!527797 (= e!307576 (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243056 (index!20260 lt!243058) (select (arr!16087 a!3235) j!176) a!3235 mask!3524) (Found!4510 j!176)))))

(declare-fun b!527798 () Bool)

(declare-fun e!307581 () Bool)

(assert (=> b!527798 (= e!307581 e!307576)))

(declare-fun res!324122 () Bool)

(assert (=> b!527798 (=> res!324122 e!307576)))

(assert (=> b!527798 (= res!324122 (or (bvsgt (x!49372 lt!243058) #b01111111111111111111111111111110) (bvslt lt!243056 #b00000000000000000000000000000000) (bvsge lt!243056 (size!16451 a!3235)) (bvslt (index!20260 lt!243058) #b00000000000000000000000000000000) (bvsge (index!20260 lt!243058) (size!16451 a!3235)) (not (= lt!243058 (Intermediate!4510 false (index!20260 lt!243058) (x!49372 lt!243058)))) (bvsle #b00000000000000000000000000000000 (x!49372 lt!243058))))))

(assert (=> b!527798 (= (index!20260 lt!243058) i!1204)))

(declare-fun lt!243053 () Unit!16651)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33475 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16651)

(assert (=> b!527798 (= lt!243053 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!243056 #b00000000000000000000000000000000 (index!20260 lt!243058) (x!49372 lt!243058) mask!3524))))

(assert (=> b!527798 (and (or (= (select (arr!16087 a!3235) (index!20260 lt!243058)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16087 a!3235) (index!20260 lt!243058)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16087 a!3235) (index!20260 lt!243058)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16087 a!3235) (index!20260 lt!243058)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243054 () Unit!16651)

(assert (=> b!527798 (= lt!243054 e!307580)))

(declare-fun c!62147 () Bool)

(assert (=> b!527798 (= c!62147 (= (select (arr!16087 a!3235) (index!20260 lt!243058)) (select (arr!16087 a!3235) j!176)))))

(assert (=> b!527798 (and (bvslt (x!49372 lt!243058) #b01111111111111111111111111111110) (or (= (select (arr!16087 a!3235) (index!20260 lt!243058)) (select (arr!16087 a!3235) j!176)) (= (select (arr!16087 a!3235) (index!20260 lt!243058)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16087 a!3235) (index!20260 lt!243058)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527799 () Bool)

(declare-fun res!324115 () Bool)

(assert (=> b!527799 (=> (not res!324115) (not e!307574))))

(assert (=> b!527799 (= res!324115 (and (= (size!16451 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16451 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16451 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!527800 () Bool)

(declare-fun res!324118 () Bool)

(assert (=> b!527800 (=> (not res!324118) (not e!307575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33475 (_ BitVec 32)) Bool)

(assert (=> b!527800 (= res!324118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!527801 () Bool)

(declare-fun res!324119 () Bool)

(assert (=> b!527801 (=> res!324119 e!307581)))

(get-info :version)

(assert (=> b!527801 (= res!324119 (or (undefined!5322 lt!243058) (not ((_ is Intermediate!4510) lt!243058))))))

(declare-fun b!527802 () Bool)

(assert (=> b!527802 (= e!307575 (not e!307581))))

(declare-fun res!324113 () Bool)

(assert (=> b!527802 (=> res!324113 e!307581)))

(declare-fun lt!243051 () array!33475)

(declare-fun lt!243057 () (_ BitVec 32))

(declare-fun lt!243052 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33475 (_ BitVec 32)) SeekEntryResult!4510)

(assert (=> b!527802 (= res!324113 (= lt!243058 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243057 lt!243052 lt!243051 mask!3524)))))

(assert (=> b!527802 (= lt!243058 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243056 (select (arr!16087 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527802 (= lt!243057 (toIndex!0 lt!243052 mask!3524))))

(assert (=> b!527802 (= lt!243052 (select (store (arr!16087 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!527802 (= lt!243056 (toIndex!0 (select (arr!16087 a!3235) j!176) mask!3524))))

(assert (=> b!527802 (= lt!243051 (array!33476 (store (arr!16087 a!3235) i!1204 k0!2280) (size!16451 a!3235)))))

(declare-fun e!307577 () Bool)

(assert (=> b!527802 e!307577))

(declare-fun res!324117 () Bool)

(assert (=> b!527802 (=> (not res!324117) (not e!307577))))

(assert (=> b!527802 (= res!324117 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!243049 () Unit!16651)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33475 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16651)

(assert (=> b!527802 (= lt!243049 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!527803 () Bool)

(declare-fun res!324112 () Bool)

(assert (=> b!527803 (=> (not res!324112) (not e!307574))))

(assert (=> b!527803 (= res!324112 (validKeyInArray!0 k0!2280))))

(declare-fun b!527804 () Bool)

(declare-fun e!307579 () Bool)

(assert (=> b!527804 (= e!307579 false)))

(declare-fun b!527805 () Bool)

(declare-fun Unit!16654 () Unit!16651)

(assert (=> b!527805 (= e!307580 Unit!16654)))

(declare-fun lt!243050 () Unit!16651)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33475 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16651)

(assert (=> b!527805 (= lt!243050 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!243056 #b00000000000000000000000000000000 (index!20260 lt!243058) (x!49372 lt!243058) mask!3524))))

(declare-fun res!324124 () Bool)

(assert (=> b!527805 (= res!324124 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243056 lt!243052 lt!243051 mask!3524) (Intermediate!4510 false (index!20260 lt!243058) (x!49372 lt!243058))))))

(assert (=> b!527805 (=> (not res!324124) (not e!307579))))

(assert (=> b!527805 e!307579))

(declare-fun b!527806 () Bool)

(assert (=> b!527806 (= e!307577 (= (seekEntryOrOpen!0 (select (arr!16087 a!3235) j!176) a!3235 mask!3524) (Found!4510 j!176)))))

(assert (= (and start!47906 res!324121) b!527799))

(assert (= (and b!527799 res!324115) b!527793))

(assert (= (and b!527793 res!324114) b!527803))

(assert (= (and b!527803 res!324112) b!527796))

(assert (= (and b!527796 res!324116) b!527795))

(assert (= (and b!527795 res!324123) b!527800))

(assert (= (and b!527800 res!324118) b!527794))

(assert (= (and b!527794 res!324120) b!527802))

(assert (= (and b!527802 res!324117) b!527806))

(assert (= (and b!527802 (not res!324113)) b!527801))

(assert (= (and b!527801 (not res!324119)) b!527798))

(assert (= (and b!527798 c!62147) b!527805))

(assert (= (and b!527798 (not c!62147)) b!527792))

(assert (= (and b!527805 res!324124) b!527804))

(assert (= (and b!527798 (not res!324122)) b!527797))

(declare-fun m!508705 () Bool)

(assert (=> b!527805 m!508705))

(declare-fun m!508707 () Bool)

(assert (=> b!527805 m!508707))

(declare-fun m!508709 () Bool)

(assert (=> b!527794 m!508709))

(declare-fun m!508711 () Bool)

(assert (=> b!527795 m!508711))

(declare-fun m!508713 () Bool)

(assert (=> b!527806 m!508713))

(assert (=> b!527806 m!508713))

(declare-fun m!508715 () Bool)

(assert (=> b!527806 m!508715))

(declare-fun m!508717 () Bool)

(assert (=> b!527796 m!508717))

(assert (=> b!527797 m!508713))

(assert (=> b!527797 m!508713))

(declare-fun m!508719 () Bool)

(assert (=> b!527797 m!508719))

(declare-fun m!508721 () Bool)

(assert (=> b!527800 m!508721))

(declare-fun m!508723 () Bool)

(assert (=> b!527798 m!508723))

(declare-fun m!508725 () Bool)

(assert (=> b!527798 m!508725))

(assert (=> b!527798 m!508713))

(declare-fun m!508727 () Bool)

(assert (=> b!527802 m!508727))

(declare-fun m!508729 () Bool)

(assert (=> b!527802 m!508729))

(declare-fun m!508731 () Bool)

(assert (=> b!527802 m!508731))

(declare-fun m!508733 () Bool)

(assert (=> b!527802 m!508733))

(assert (=> b!527802 m!508713))

(declare-fun m!508735 () Bool)

(assert (=> b!527802 m!508735))

(assert (=> b!527802 m!508713))

(assert (=> b!527802 m!508713))

(declare-fun m!508737 () Bool)

(assert (=> b!527802 m!508737))

(declare-fun m!508739 () Bool)

(assert (=> b!527802 m!508739))

(declare-fun m!508741 () Bool)

(assert (=> b!527802 m!508741))

(declare-fun m!508743 () Bool)

(assert (=> start!47906 m!508743))

(declare-fun m!508745 () Bool)

(assert (=> start!47906 m!508745))

(declare-fun m!508747 () Bool)

(assert (=> b!527803 m!508747))

(assert (=> b!527793 m!508713))

(assert (=> b!527793 m!508713))

(declare-fun m!508749 () Bool)

(assert (=> b!527793 m!508749))

(check-sat (not b!527798) (not b!527806) (not start!47906) (not b!527796) (not b!527794) (not b!527800) (not b!527802) (not b!527803) (not b!527805) (not b!527795) (not b!527797) (not b!527793))
(check-sat)
(get-model)

(declare-fun d!80923 () Bool)

(assert (=> d!80923 (= (index!20260 lt!243058) i!1204)))

(declare-fun lt!243121 () Unit!16651)

(declare-fun choose!104 (array!33475 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16651)

(assert (=> d!80923 (= lt!243121 (choose!104 a!3235 i!1204 k0!2280 j!176 lt!243056 #b00000000000000000000000000000000 (index!20260 lt!243058) (x!49372 lt!243058) mask!3524))))

(assert (=> d!80923 (validMask!0 mask!3524)))

(assert (=> d!80923 (= (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!243056 #b00000000000000000000000000000000 (index!20260 lt!243058) (x!49372 lt!243058) mask!3524) lt!243121)))

(declare-fun bs!16562 () Bool)

(assert (= bs!16562 d!80923))

(declare-fun m!508843 () Bool)

(assert (=> bs!16562 m!508843))

(assert (=> bs!16562 m!508743))

(assert (=> b!527798 d!80923))

(declare-fun b!527909 () Bool)

(declare-fun e!307637 () SeekEntryResult!4510)

(assert (=> b!527909 (= e!307637 Undefined!4510)))

(declare-fun d!80925 () Bool)

(declare-fun lt!243127 () SeekEntryResult!4510)

(assert (=> d!80925 (and (or ((_ is Undefined!4510) lt!243127) (not ((_ is Found!4510) lt!243127)) (and (bvsge (index!20259 lt!243127) #b00000000000000000000000000000000) (bvslt (index!20259 lt!243127) (size!16451 a!3235)))) (or ((_ is Undefined!4510) lt!243127) ((_ is Found!4510) lt!243127) (not ((_ is MissingVacant!4510) lt!243127)) (not (= (index!20261 lt!243127) (index!20260 lt!243058))) (and (bvsge (index!20261 lt!243127) #b00000000000000000000000000000000) (bvslt (index!20261 lt!243127) (size!16451 a!3235)))) (or ((_ is Undefined!4510) lt!243127) (ite ((_ is Found!4510) lt!243127) (= (select (arr!16087 a!3235) (index!20259 lt!243127)) (select (arr!16087 a!3235) j!176)) (and ((_ is MissingVacant!4510) lt!243127) (= (index!20261 lt!243127) (index!20260 lt!243058)) (= (select (arr!16087 a!3235) (index!20261 lt!243127)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!80925 (= lt!243127 e!307637)))

(declare-fun c!62160 () Bool)

(assert (=> d!80925 (= c!62160 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!243126 () (_ BitVec 64))

(assert (=> d!80925 (= lt!243126 (select (arr!16087 a!3235) lt!243056))))

(assert (=> d!80925 (validMask!0 mask!3524)))

(assert (=> d!80925 (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243056 (index!20260 lt!243058) (select (arr!16087 a!3235) j!176) a!3235 mask!3524) lt!243127)))

(declare-fun b!527910 () Bool)

(declare-fun e!307636 () SeekEntryResult!4510)

(assert (=> b!527910 (= e!307636 (Found!4510 lt!243056))))

(declare-fun e!307638 () SeekEntryResult!4510)

(declare-fun b!527911 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527911 (= e!307638 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!243056 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (index!20260 lt!243058) (select (arr!16087 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!527912 () Bool)

(assert (=> b!527912 (= e!307637 e!307636)))

(declare-fun c!62161 () Bool)

(assert (=> b!527912 (= c!62161 (= lt!243126 (select (arr!16087 a!3235) j!176)))))

(declare-fun b!527913 () Bool)

(assert (=> b!527913 (= e!307638 (MissingVacant!4510 (index!20260 lt!243058)))))

(declare-fun b!527914 () Bool)

(declare-fun c!62162 () Bool)

(assert (=> b!527914 (= c!62162 (= lt!243126 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!527914 (= e!307636 e!307638)))

(assert (= (and d!80925 c!62160) b!527909))

(assert (= (and d!80925 (not c!62160)) b!527912))

(assert (= (and b!527912 c!62161) b!527910))

(assert (= (and b!527912 (not c!62161)) b!527914))

(assert (= (and b!527914 c!62162) b!527913))

(assert (= (and b!527914 (not c!62162)) b!527911))

(declare-fun m!508845 () Bool)

(assert (=> d!80925 m!508845))

(declare-fun m!508847 () Bool)

(assert (=> d!80925 m!508847))

(declare-fun m!508849 () Bool)

(assert (=> d!80925 m!508849))

(assert (=> d!80925 m!508743))

(declare-fun m!508851 () Bool)

(assert (=> b!527911 m!508851))

(assert (=> b!527911 m!508851))

(assert (=> b!527911 m!508713))

(declare-fun m!508853 () Bool)

(assert (=> b!527911 m!508853))

(assert (=> b!527797 d!80925))

(declare-fun bm!31878 () Bool)

(declare-fun call!31881 () Bool)

(assert (=> bm!31878 (= call!31881 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!80927 () Bool)

(declare-fun res!324208 () Bool)

(declare-fun e!307646 () Bool)

(assert (=> d!80927 (=> res!324208 e!307646)))

(assert (=> d!80927 (= res!324208 (bvsge #b00000000000000000000000000000000 (size!16451 a!3235)))))

(assert (=> d!80927 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!307646)))

(declare-fun b!527923 () Bool)

(declare-fun e!307647 () Bool)

(assert (=> b!527923 (= e!307647 call!31881)))

(declare-fun b!527924 () Bool)

(declare-fun e!307645 () Bool)

(assert (=> b!527924 (= e!307645 call!31881)))

(declare-fun b!527925 () Bool)

(assert (=> b!527925 (= e!307647 e!307645)))

(declare-fun lt!243136 () (_ BitVec 64))

(assert (=> b!527925 (= lt!243136 (select (arr!16087 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!243134 () Unit!16651)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33475 (_ BitVec 64) (_ BitVec 32)) Unit!16651)

(assert (=> b!527925 (= lt!243134 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!243136 #b00000000000000000000000000000000))))

(assert (=> b!527925 (arrayContainsKey!0 a!3235 lt!243136 #b00000000000000000000000000000000)))

(declare-fun lt!243135 () Unit!16651)

(assert (=> b!527925 (= lt!243135 lt!243134)))

(declare-fun res!324207 () Bool)

(assert (=> b!527925 (= res!324207 (= (seekEntryOrOpen!0 (select (arr!16087 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4510 #b00000000000000000000000000000000)))))

(assert (=> b!527925 (=> (not res!324207) (not e!307645))))

(declare-fun b!527926 () Bool)

(assert (=> b!527926 (= e!307646 e!307647)))

(declare-fun c!62165 () Bool)

(assert (=> b!527926 (= c!62165 (validKeyInArray!0 (select (arr!16087 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!80927 (not res!324208)) b!527926))

(assert (= (and b!527926 c!62165) b!527925))

(assert (= (and b!527926 (not c!62165)) b!527923))

(assert (= (and b!527925 res!324207) b!527924))

(assert (= (or b!527924 b!527923) bm!31878))

(declare-fun m!508855 () Bool)

(assert (=> bm!31878 m!508855))

(declare-fun m!508857 () Bool)

(assert (=> b!527925 m!508857))

(declare-fun m!508859 () Bool)

(assert (=> b!527925 m!508859))

(declare-fun m!508861 () Bool)

(assert (=> b!527925 m!508861))

(assert (=> b!527925 m!508857))

(declare-fun m!508863 () Bool)

(assert (=> b!527925 m!508863))

(assert (=> b!527926 m!508857))

(assert (=> b!527926 m!508857))

(declare-fun m!508865 () Bool)

(assert (=> b!527926 m!508865))

(assert (=> b!527800 d!80927))

(declare-fun d!80931 () Bool)

(assert (=> d!80931 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!527803 d!80931))

(declare-fun d!80933 () Bool)

(assert (=> d!80933 (= (validKeyInArray!0 (select (arr!16087 a!3235) j!176)) (and (not (= (select (arr!16087 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16087 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!527793 d!80933))

(declare-fun d!80935 () Bool)

(assert (=> d!80935 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47906 d!80935))

(declare-fun d!80945 () Bool)

(assert (=> d!80945 (= (array_inv!11946 a!3235) (bvsge (size!16451 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47906 d!80945))

(declare-fun d!80947 () Bool)

(declare-fun lt!243145 () (_ BitVec 32))

(declare-fun lt!243144 () (_ BitVec 32))

(assert (=> d!80947 (= lt!243145 (bvmul (bvxor lt!243144 (bvlshr lt!243144 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80947 (= lt!243144 ((_ extract 31 0) (bvand (bvxor (select (arr!16087 a!3235) j!176) (bvlshr (select (arr!16087 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80947 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!324212 (let ((h!11085 ((_ extract 31 0) (bvand (bvxor (select (arr!16087 a!3235) j!176) (bvlshr (select (arr!16087 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49378 (bvmul (bvxor h!11085 (bvlshr h!11085 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49378 (bvlshr x!49378 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!324212 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!324212 #b00000000000000000000000000000000))))))

(assert (=> d!80947 (= (toIndex!0 (select (arr!16087 a!3235) j!176) mask!3524) (bvand (bvxor lt!243145 (bvlshr lt!243145 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!527802 d!80947))

(declare-fun bm!31879 () Bool)

(declare-fun call!31882 () Bool)

(assert (=> bm!31879 (= call!31882 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!80949 () Bool)

(declare-fun res!324214 () Bool)

(declare-fun e!307652 () Bool)

(assert (=> d!80949 (=> res!324214 e!307652)))

(assert (=> d!80949 (= res!324214 (bvsge j!176 (size!16451 a!3235)))))

(assert (=> d!80949 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!307652)))

(declare-fun b!527930 () Bool)

(declare-fun e!307653 () Bool)

(assert (=> b!527930 (= e!307653 call!31882)))

(declare-fun b!527931 () Bool)

(declare-fun e!307651 () Bool)

(assert (=> b!527931 (= e!307651 call!31882)))

(declare-fun b!527932 () Bool)

(assert (=> b!527932 (= e!307653 e!307651)))

(declare-fun lt!243148 () (_ BitVec 64))

(assert (=> b!527932 (= lt!243148 (select (arr!16087 a!3235) j!176))))

(declare-fun lt!243146 () Unit!16651)

(assert (=> b!527932 (= lt!243146 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!243148 j!176))))

(assert (=> b!527932 (arrayContainsKey!0 a!3235 lt!243148 #b00000000000000000000000000000000)))

(declare-fun lt!243147 () Unit!16651)

(assert (=> b!527932 (= lt!243147 lt!243146)))

(declare-fun res!324213 () Bool)

(assert (=> b!527932 (= res!324213 (= (seekEntryOrOpen!0 (select (arr!16087 a!3235) j!176) a!3235 mask!3524) (Found!4510 j!176)))))

(assert (=> b!527932 (=> (not res!324213) (not e!307651))))

(declare-fun b!527933 () Bool)

(assert (=> b!527933 (= e!307652 e!307653)))

(declare-fun c!62166 () Bool)

(assert (=> b!527933 (= c!62166 (validKeyInArray!0 (select (arr!16087 a!3235) j!176)))))

(assert (= (and d!80949 (not res!324214)) b!527933))

(assert (= (and b!527933 c!62166) b!527932))

(assert (= (and b!527933 (not c!62166)) b!527930))

(assert (= (and b!527932 res!324213) b!527931))

(assert (= (or b!527931 b!527930) bm!31879))

(declare-fun m!508871 () Bool)

(assert (=> bm!31879 m!508871))

(assert (=> b!527932 m!508713))

(declare-fun m!508873 () Bool)

(assert (=> b!527932 m!508873))

(declare-fun m!508875 () Bool)

(assert (=> b!527932 m!508875))

(assert (=> b!527932 m!508713))

(assert (=> b!527932 m!508715))

(assert (=> b!527933 m!508713))

(assert (=> b!527933 m!508713))

(assert (=> b!527933 m!508749))

(assert (=> b!527802 d!80949))

(declare-fun e!307688 () SeekEntryResult!4510)

(declare-fun b!527993 () Bool)

(assert (=> b!527993 (= e!307688 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!243056 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (arr!16087 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!527994 () Bool)

(declare-fun e!307692 () Bool)

(declare-fun lt!243175 () SeekEntryResult!4510)

(assert (=> b!527994 (= e!307692 (bvsge (x!49372 lt!243175) #b01111111111111111111111111111110))))

(declare-fun b!527995 () Bool)

(assert (=> b!527995 (and (bvsge (index!20260 lt!243175) #b00000000000000000000000000000000) (bvslt (index!20260 lt!243175) (size!16451 a!3235)))))

(declare-fun res!324237 () Bool)

(assert (=> b!527995 (= res!324237 (= (select (arr!16087 a!3235) (index!20260 lt!243175)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!307691 () Bool)

(assert (=> b!527995 (=> res!324237 e!307691)))

(declare-fun d!80951 () Bool)

(assert (=> d!80951 e!307692))

(declare-fun c!62186 () Bool)

(assert (=> d!80951 (= c!62186 (and ((_ is Intermediate!4510) lt!243175) (undefined!5322 lt!243175)))))

(declare-fun e!307689 () SeekEntryResult!4510)

(assert (=> d!80951 (= lt!243175 e!307689)))

(declare-fun c!62185 () Bool)

(assert (=> d!80951 (= c!62185 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!243176 () (_ BitVec 64))

(assert (=> d!80951 (= lt!243176 (select (arr!16087 a!3235) lt!243056))))

(assert (=> d!80951 (validMask!0 mask!3524)))

(assert (=> d!80951 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243056 (select (arr!16087 a!3235) j!176) a!3235 mask!3524) lt!243175)))

(declare-fun b!527996 () Bool)

(assert (=> b!527996 (and (bvsge (index!20260 lt!243175) #b00000000000000000000000000000000) (bvslt (index!20260 lt!243175) (size!16451 a!3235)))))

(declare-fun res!324238 () Bool)

(assert (=> b!527996 (= res!324238 (= (select (arr!16087 a!3235) (index!20260 lt!243175)) (select (arr!16087 a!3235) j!176)))))

(assert (=> b!527996 (=> res!324238 e!307691)))

(declare-fun e!307690 () Bool)

(assert (=> b!527996 (= e!307690 e!307691)))

(declare-fun b!527997 () Bool)

(assert (=> b!527997 (= e!307688 (Intermediate!4510 false lt!243056 #b00000000000000000000000000000000))))

(declare-fun b!527998 () Bool)

(assert (=> b!527998 (= e!307692 e!307690)))

(declare-fun res!324236 () Bool)

(assert (=> b!527998 (= res!324236 (and ((_ is Intermediate!4510) lt!243175) (not (undefined!5322 lt!243175)) (bvslt (x!49372 lt!243175) #b01111111111111111111111111111110) (bvsge (x!49372 lt!243175) #b00000000000000000000000000000000) (bvsge (x!49372 lt!243175) #b00000000000000000000000000000000)))))

(assert (=> b!527998 (=> (not res!324236) (not e!307690))))

(declare-fun b!528000 () Bool)

(assert (=> b!528000 (and (bvsge (index!20260 lt!243175) #b00000000000000000000000000000000) (bvslt (index!20260 lt!243175) (size!16451 a!3235)))))

(assert (=> b!528000 (= e!307691 (= (select (arr!16087 a!3235) (index!20260 lt!243175)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!528002 () Bool)

(assert (=> b!528002 (= e!307689 (Intermediate!4510 true lt!243056 #b00000000000000000000000000000000))))

(declare-fun b!528003 () Bool)

(assert (=> b!528003 (= e!307689 e!307688)))

(declare-fun c!62187 () Bool)

(assert (=> b!528003 (= c!62187 (or (= lt!243176 (select (arr!16087 a!3235) j!176)) (= (bvadd lt!243176 lt!243176) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!80951 c!62185) b!528002))

(assert (= (and d!80951 (not c!62185)) b!528003))

(assert (= (and b!528003 c!62187) b!527997))

(assert (= (and b!528003 (not c!62187)) b!527993))

(assert (= (and d!80951 c!62186) b!527994))

(assert (= (and d!80951 (not c!62186)) b!527998))

(assert (= (and b!527998 res!324236) b!527996))

(assert (= (and b!527996 (not res!324238)) b!527995))

(assert (= (and b!527995 (not res!324237)) b!528000))

(assert (=> d!80951 m!508849))

(assert (=> d!80951 m!508743))

(declare-fun m!508899 () Bool)

(assert (=> b!527996 m!508899))

(assert (=> b!527995 m!508899))

(assert (=> b!527993 m!508851))

(assert (=> b!527993 m!508851))

(assert (=> b!527993 m!508713))

(declare-fun m!508901 () Bool)

(assert (=> b!527993 m!508901))

(assert (=> b!528000 m!508899))

(assert (=> b!527802 d!80951))

(declare-fun d!80961 () Bool)

(assert (=> d!80961 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!243184 () Unit!16651)

(declare-fun choose!38 (array!33475 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16651)

(assert (=> d!80961 (= lt!243184 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80961 (validMask!0 mask!3524)))

(assert (=> d!80961 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!243184)))

(declare-fun bs!16564 () Bool)

(assert (= bs!16564 d!80961))

(assert (=> bs!16564 m!508741))

(declare-fun m!508911 () Bool)

(assert (=> bs!16564 m!508911))

(assert (=> bs!16564 m!508743))

(assert (=> b!527802 d!80961))

(declare-fun e!307702 () SeekEntryResult!4510)

(declare-fun b!528018 () Bool)

(assert (=> b!528018 (= e!307702 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!243057 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) lt!243052 lt!243051 mask!3524))))

(declare-fun b!528019 () Bool)

(declare-fun e!307706 () Bool)

(declare-fun lt!243185 () SeekEntryResult!4510)

(assert (=> b!528019 (= e!307706 (bvsge (x!49372 lt!243185) #b01111111111111111111111111111110))))

(declare-fun b!528020 () Bool)

(assert (=> b!528020 (and (bvsge (index!20260 lt!243185) #b00000000000000000000000000000000) (bvslt (index!20260 lt!243185) (size!16451 lt!243051)))))

(declare-fun res!324240 () Bool)

(assert (=> b!528020 (= res!324240 (= (select (arr!16087 lt!243051) (index!20260 lt!243185)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!307705 () Bool)

(assert (=> b!528020 (=> res!324240 e!307705)))

(declare-fun d!80963 () Bool)

(assert (=> d!80963 e!307706))

(declare-fun c!62198 () Bool)

(assert (=> d!80963 (= c!62198 (and ((_ is Intermediate!4510) lt!243185) (undefined!5322 lt!243185)))))

(declare-fun e!307703 () SeekEntryResult!4510)

(assert (=> d!80963 (= lt!243185 e!307703)))

(declare-fun c!62197 () Bool)

(assert (=> d!80963 (= c!62197 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!243186 () (_ BitVec 64))

(assert (=> d!80963 (= lt!243186 (select (arr!16087 lt!243051) lt!243057))))

(assert (=> d!80963 (validMask!0 mask!3524)))

(assert (=> d!80963 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243057 lt!243052 lt!243051 mask!3524) lt!243185)))

(declare-fun b!528021 () Bool)

(assert (=> b!528021 (and (bvsge (index!20260 lt!243185) #b00000000000000000000000000000000) (bvslt (index!20260 lt!243185) (size!16451 lt!243051)))))

(declare-fun res!324241 () Bool)

(assert (=> b!528021 (= res!324241 (= (select (arr!16087 lt!243051) (index!20260 lt!243185)) lt!243052))))

(assert (=> b!528021 (=> res!324241 e!307705)))

(declare-fun e!307704 () Bool)

(assert (=> b!528021 (= e!307704 e!307705)))

(declare-fun b!528022 () Bool)

(assert (=> b!528022 (= e!307702 (Intermediate!4510 false lt!243057 #b00000000000000000000000000000000))))

(declare-fun b!528023 () Bool)

(assert (=> b!528023 (= e!307706 e!307704)))

(declare-fun res!324239 () Bool)

(assert (=> b!528023 (= res!324239 (and ((_ is Intermediate!4510) lt!243185) (not (undefined!5322 lt!243185)) (bvslt (x!49372 lt!243185) #b01111111111111111111111111111110) (bvsge (x!49372 lt!243185) #b00000000000000000000000000000000) (bvsge (x!49372 lt!243185) #b00000000000000000000000000000000)))))

(assert (=> b!528023 (=> (not res!324239) (not e!307704))))

(declare-fun b!528024 () Bool)

(assert (=> b!528024 (and (bvsge (index!20260 lt!243185) #b00000000000000000000000000000000) (bvslt (index!20260 lt!243185) (size!16451 lt!243051)))))

(assert (=> b!528024 (= e!307705 (= (select (arr!16087 lt!243051) (index!20260 lt!243185)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!528025 () Bool)

(assert (=> b!528025 (= e!307703 (Intermediate!4510 true lt!243057 #b00000000000000000000000000000000))))

(declare-fun b!528026 () Bool)

(assert (=> b!528026 (= e!307703 e!307702)))

(declare-fun c!62199 () Bool)

(assert (=> b!528026 (= c!62199 (or (= lt!243186 lt!243052) (= (bvadd lt!243186 lt!243186) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!80963 c!62197) b!528025))

(assert (= (and d!80963 (not c!62197)) b!528026))

(assert (= (and b!528026 c!62199) b!528022))

(assert (= (and b!528026 (not c!62199)) b!528018))

(assert (= (and d!80963 c!62198) b!528019))

(assert (= (and d!80963 (not c!62198)) b!528023))

(assert (= (and b!528023 res!324239) b!528021))

(assert (= (and b!528021 (not res!324241)) b!528020))

(assert (= (and b!528020 (not res!324240)) b!528024))

(declare-fun m!508919 () Bool)

(assert (=> d!80963 m!508919))

(assert (=> d!80963 m!508743))

(declare-fun m!508921 () Bool)

(assert (=> b!528021 m!508921))

(assert (=> b!528020 m!508921))

(declare-fun m!508923 () Bool)

(assert (=> b!528018 m!508923))

(assert (=> b!528018 m!508923))

(declare-fun m!508925 () Bool)

(assert (=> b!528018 m!508925))

(assert (=> b!528024 m!508921))

(assert (=> b!527802 d!80963))

(declare-fun d!80967 () Bool)

(declare-fun lt!243188 () (_ BitVec 32))

(declare-fun lt!243187 () (_ BitVec 32))

(assert (=> d!80967 (= lt!243188 (bvmul (bvxor lt!243187 (bvlshr lt!243187 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80967 (= lt!243187 ((_ extract 31 0) (bvand (bvxor lt!243052 (bvlshr lt!243052 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80967 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!324212 (let ((h!11085 ((_ extract 31 0) (bvand (bvxor lt!243052 (bvlshr lt!243052 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49378 (bvmul (bvxor h!11085 (bvlshr h!11085 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49378 (bvlshr x!49378 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!324212 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!324212 #b00000000000000000000000000000000))))))

(assert (=> d!80967 (= (toIndex!0 lt!243052 mask!3524) (bvand (bvxor lt!243188 (bvlshr lt!243188 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!527802 d!80967))

(declare-fun b!528105 () Bool)

(declare-fun e!307762 () SeekEntryResult!4510)

(declare-fun lt!243213 () SeekEntryResult!4510)

(assert (=> b!528105 (= e!307762 (Found!4510 (index!20260 lt!243213)))))

(declare-fun b!528106 () Bool)

(declare-fun e!307763 () SeekEntryResult!4510)

(assert (=> b!528106 (= e!307763 (MissingZero!4510 (index!20260 lt!243213)))))

(declare-fun d!80969 () Bool)

(declare-fun lt!243215 () SeekEntryResult!4510)

(assert (=> d!80969 (and (or ((_ is Undefined!4510) lt!243215) (not ((_ is Found!4510) lt!243215)) (and (bvsge (index!20259 lt!243215) #b00000000000000000000000000000000) (bvslt (index!20259 lt!243215) (size!16451 a!3235)))) (or ((_ is Undefined!4510) lt!243215) ((_ is Found!4510) lt!243215) (not ((_ is MissingZero!4510) lt!243215)) (and (bvsge (index!20258 lt!243215) #b00000000000000000000000000000000) (bvslt (index!20258 lt!243215) (size!16451 a!3235)))) (or ((_ is Undefined!4510) lt!243215) ((_ is Found!4510) lt!243215) ((_ is MissingZero!4510) lt!243215) (not ((_ is MissingVacant!4510) lt!243215)) (and (bvsge (index!20261 lt!243215) #b00000000000000000000000000000000) (bvslt (index!20261 lt!243215) (size!16451 a!3235)))) (or ((_ is Undefined!4510) lt!243215) (ite ((_ is Found!4510) lt!243215) (= (select (arr!16087 a!3235) (index!20259 lt!243215)) k0!2280) (ite ((_ is MissingZero!4510) lt!243215) (= (select (arr!16087 a!3235) (index!20258 lt!243215)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4510) lt!243215) (= (select (arr!16087 a!3235) (index!20261 lt!243215)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!307761 () SeekEntryResult!4510)

(assert (=> d!80969 (= lt!243215 e!307761)))

(declare-fun c!62224 () Bool)

(assert (=> d!80969 (= c!62224 (and ((_ is Intermediate!4510) lt!243213) (undefined!5322 lt!243213)))))

(assert (=> d!80969 (= lt!243213 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!80969 (validMask!0 mask!3524)))

(assert (=> d!80969 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!243215)))

(declare-fun b!528107 () Bool)

(assert (=> b!528107 (= e!307761 Undefined!4510)))

(declare-fun b!528108 () Bool)

(assert (=> b!528108 (= e!307761 e!307762)))

(declare-fun lt!243214 () (_ BitVec 64))

(assert (=> b!528108 (= lt!243214 (select (arr!16087 a!3235) (index!20260 lt!243213)))))

(declare-fun c!62226 () Bool)

(assert (=> b!528108 (= c!62226 (= lt!243214 k0!2280))))

(declare-fun b!528109 () Bool)

(assert (=> b!528109 (= e!307763 (seekKeyOrZeroReturnVacant!0 (x!49372 lt!243213) (index!20260 lt!243213) (index!20260 lt!243213) k0!2280 a!3235 mask!3524))))

(declare-fun b!528110 () Bool)

(declare-fun c!62225 () Bool)

(assert (=> b!528110 (= c!62225 (= lt!243214 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!528110 (= e!307762 e!307763)))

(assert (= (and d!80969 c!62224) b!528107))

(assert (= (and d!80969 (not c!62224)) b!528108))

(assert (= (and b!528108 c!62226) b!528105))

(assert (= (and b!528108 (not c!62226)) b!528110))

(assert (= (and b!528110 c!62225) b!528106))

(assert (= (and b!528110 (not c!62225)) b!528109))

(declare-fun m!508961 () Bool)

(assert (=> d!80969 m!508961))

(declare-fun m!508963 () Bool)

(assert (=> d!80969 m!508963))

(declare-fun m!508965 () Bool)

(assert (=> d!80969 m!508965))

(declare-fun m!508967 () Bool)

(assert (=> d!80969 m!508967))

(assert (=> d!80969 m!508965))

(declare-fun m!508969 () Bool)

(assert (=> d!80969 m!508969))

(assert (=> d!80969 m!508743))

(declare-fun m!508971 () Bool)

(assert (=> b!528108 m!508971))

(declare-fun m!508973 () Bool)

(assert (=> b!528109 m!508973))

(assert (=> b!527795 d!80969))

(declare-fun b!528115 () Bool)

(declare-fun e!307768 () SeekEntryResult!4510)

(declare-fun lt!243219 () SeekEntryResult!4510)

(assert (=> b!528115 (= e!307768 (Found!4510 (index!20260 lt!243219)))))

(declare-fun b!528116 () Bool)

(declare-fun e!307769 () SeekEntryResult!4510)

(assert (=> b!528116 (= e!307769 (MissingZero!4510 (index!20260 lt!243219)))))

(declare-fun d!80985 () Bool)

(declare-fun lt!243221 () SeekEntryResult!4510)

(assert (=> d!80985 (and (or ((_ is Undefined!4510) lt!243221) (not ((_ is Found!4510) lt!243221)) (and (bvsge (index!20259 lt!243221) #b00000000000000000000000000000000) (bvslt (index!20259 lt!243221) (size!16451 a!3235)))) (or ((_ is Undefined!4510) lt!243221) ((_ is Found!4510) lt!243221) (not ((_ is MissingZero!4510) lt!243221)) (and (bvsge (index!20258 lt!243221) #b00000000000000000000000000000000) (bvslt (index!20258 lt!243221) (size!16451 a!3235)))) (or ((_ is Undefined!4510) lt!243221) ((_ is Found!4510) lt!243221) ((_ is MissingZero!4510) lt!243221) (not ((_ is MissingVacant!4510) lt!243221)) (and (bvsge (index!20261 lt!243221) #b00000000000000000000000000000000) (bvslt (index!20261 lt!243221) (size!16451 a!3235)))) (or ((_ is Undefined!4510) lt!243221) (ite ((_ is Found!4510) lt!243221) (= (select (arr!16087 a!3235) (index!20259 lt!243221)) (select (arr!16087 a!3235) j!176)) (ite ((_ is MissingZero!4510) lt!243221) (= (select (arr!16087 a!3235) (index!20258 lt!243221)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4510) lt!243221) (= (select (arr!16087 a!3235) (index!20261 lt!243221)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!307767 () SeekEntryResult!4510)

(assert (=> d!80985 (= lt!243221 e!307767)))

(declare-fun c!62228 () Bool)

(assert (=> d!80985 (= c!62228 (and ((_ is Intermediate!4510) lt!243219) (undefined!5322 lt!243219)))))

(assert (=> d!80985 (= lt!243219 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16087 a!3235) j!176) mask!3524) (select (arr!16087 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80985 (validMask!0 mask!3524)))

(assert (=> d!80985 (= (seekEntryOrOpen!0 (select (arr!16087 a!3235) j!176) a!3235 mask!3524) lt!243221)))

(declare-fun b!528117 () Bool)

(assert (=> b!528117 (= e!307767 Undefined!4510)))

(declare-fun b!528118 () Bool)

(assert (=> b!528118 (= e!307767 e!307768)))

(declare-fun lt!243220 () (_ BitVec 64))

(assert (=> b!528118 (= lt!243220 (select (arr!16087 a!3235) (index!20260 lt!243219)))))

(declare-fun c!62230 () Bool)

(assert (=> b!528118 (= c!62230 (= lt!243220 (select (arr!16087 a!3235) j!176)))))

(declare-fun b!528119 () Bool)

(assert (=> b!528119 (= e!307769 (seekKeyOrZeroReturnVacant!0 (x!49372 lt!243219) (index!20260 lt!243219) (index!20260 lt!243219) (select (arr!16087 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!528120 () Bool)

(declare-fun c!62229 () Bool)

(assert (=> b!528120 (= c!62229 (= lt!243220 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!528120 (= e!307768 e!307769)))

(assert (= (and d!80985 c!62228) b!528117))

(assert (= (and d!80985 (not c!62228)) b!528118))

(assert (= (and b!528118 c!62230) b!528115))

(assert (= (and b!528118 (not c!62230)) b!528120))

(assert (= (and b!528120 c!62229) b!528116))

(assert (= (and b!528120 (not c!62229)) b!528119))

(declare-fun m!508981 () Bool)

(assert (=> d!80985 m!508981))

(declare-fun m!508983 () Bool)

(assert (=> d!80985 m!508983))

(assert (=> d!80985 m!508713))

(assert (=> d!80985 m!508735))

(declare-fun m!508985 () Bool)

(assert (=> d!80985 m!508985))

(assert (=> d!80985 m!508735))

(assert (=> d!80985 m!508713))

(declare-fun m!508987 () Bool)

(assert (=> d!80985 m!508987))

(assert (=> d!80985 m!508743))

(declare-fun m!508989 () Bool)

(assert (=> b!528118 m!508989))

(assert (=> b!528119 m!508713))

(declare-fun m!508991 () Bool)

(assert (=> b!528119 m!508991))

(assert (=> b!527806 d!80985))

(declare-fun d!80989 () Bool)

(declare-fun res!324281 () Bool)

(declare-fun e!307779 () Bool)

(assert (=> d!80989 (=> res!324281 e!307779)))

(assert (=> d!80989 (= res!324281 (= (select (arr!16087 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!80989 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!307779)))

(declare-fun b!528134 () Bool)

(declare-fun e!307780 () Bool)

(assert (=> b!528134 (= e!307779 e!307780)))

(declare-fun res!324282 () Bool)

(assert (=> b!528134 (=> (not res!324282) (not e!307780))))

(assert (=> b!528134 (= res!324282 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16451 a!3235)))))

(declare-fun b!528135 () Bool)

(assert (=> b!528135 (= e!307780 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80989 (not res!324281)) b!528134))

(assert (= (and b!528134 res!324282) b!528135))

(assert (=> d!80989 m!508857))

(declare-fun m!509003 () Bool)

(assert (=> b!528135 m!509003))

(assert (=> b!527796 d!80989))

(declare-fun b!528146 () Bool)

(declare-fun e!307790 () Bool)

(declare-fun contains!2755 (List!10152 (_ BitVec 64)) Bool)

(assert (=> b!528146 (= e!307790 (contains!2755 Nil!10149 (select (arr!16087 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!528147 () Bool)

(declare-fun e!307792 () Bool)

(declare-fun e!307789 () Bool)

(assert (=> b!528147 (= e!307792 e!307789)))

(declare-fun res!324290 () Bool)

(assert (=> b!528147 (=> (not res!324290) (not e!307789))))

(assert (=> b!528147 (= res!324290 (not e!307790))))

(declare-fun res!324291 () Bool)

(assert (=> b!528147 (=> (not res!324291) (not e!307790))))

(assert (=> b!528147 (= res!324291 (validKeyInArray!0 (select (arr!16087 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80995 () Bool)

(declare-fun res!324292 () Bool)

(assert (=> d!80995 (=> res!324292 e!307792)))

(assert (=> d!80995 (= res!324292 (bvsge #b00000000000000000000000000000000 (size!16451 a!3235)))))

(assert (=> d!80995 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10149) e!307792)))

(declare-fun bm!31895 () Bool)

(declare-fun call!31898 () Bool)

(declare-fun c!62236 () Bool)

(assert (=> bm!31895 (= call!31898 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62236 (Cons!10148 (select (arr!16087 a!3235) #b00000000000000000000000000000000) Nil!10149) Nil!10149)))))

(declare-fun b!528148 () Bool)

(declare-fun e!307791 () Bool)

(assert (=> b!528148 (= e!307791 call!31898)))

(declare-fun b!528149 () Bool)

(assert (=> b!528149 (= e!307791 call!31898)))

(declare-fun b!528150 () Bool)

(assert (=> b!528150 (= e!307789 e!307791)))

(assert (=> b!528150 (= c!62236 (validKeyInArray!0 (select (arr!16087 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!80995 (not res!324292)) b!528147))

(assert (= (and b!528147 res!324291) b!528146))

(assert (= (and b!528147 res!324290) b!528150))

(assert (= (and b!528150 c!62236) b!528148))

(assert (= (and b!528150 (not c!62236)) b!528149))

(assert (= (or b!528148 b!528149) bm!31895))

(assert (=> b!528146 m!508857))

(assert (=> b!528146 m!508857))

(declare-fun m!509007 () Bool)

(assert (=> b!528146 m!509007))

(assert (=> b!528147 m!508857))

(assert (=> b!528147 m!508857))

(assert (=> b!528147 m!508865))

(assert (=> bm!31895 m!508857))

(declare-fun m!509009 () Bool)

(assert (=> bm!31895 m!509009))

(assert (=> b!528150 m!508857))

(assert (=> b!528150 m!508857))

(assert (=> b!528150 m!508865))

(assert (=> b!527794 d!80995))

(declare-fun d!80999 () Bool)

(declare-fun e!307803 () Bool)

(assert (=> d!80999 e!307803))

(declare-fun res!324301 () Bool)

(assert (=> d!80999 (=> (not res!324301) (not e!307803))))

(assert (=> d!80999 (= res!324301 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16451 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16451 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16451 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16451 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16451 a!3235))))))

(declare-fun lt!243245 () Unit!16651)

(declare-fun choose!47 (array!33475 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16651)

(assert (=> d!80999 (= lt!243245 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!243056 #b00000000000000000000000000000000 (index!20260 lt!243058) (x!49372 lt!243058) mask!3524))))

(assert (=> d!80999 (validMask!0 mask!3524)))

(assert (=> d!80999 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!243056 #b00000000000000000000000000000000 (index!20260 lt!243058) (x!49372 lt!243058) mask!3524) lt!243245)))

(declare-fun b!528165 () Bool)

(assert (=> b!528165 (= e!307803 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243056 (select (store (arr!16087 a!3235) i!1204 k0!2280) j!176) (array!33476 (store (arr!16087 a!3235) i!1204 k0!2280) (size!16451 a!3235)) mask!3524) (Intermediate!4510 false (index!20260 lt!243058) (x!49372 lt!243058))))))

(assert (= (and d!80999 res!324301) b!528165))

(declare-fun m!509021 () Bool)

(assert (=> d!80999 m!509021))

(assert (=> d!80999 m!508743))

(assert (=> b!528165 m!508727))

(assert (=> b!528165 m!508731))

(assert (=> b!528165 m!508731))

(declare-fun m!509023 () Bool)

(assert (=> b!528165 m!509023))

(assert (=> b!527805 d!80999))

(declare-fun e!307804 () SeekEntryResult!4510)

(declare-fun b!528166 () Bool)

(assert (=> b!528166 (= e!307804 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!243056 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) lt!243052 lt!243051 mask!3524))))

(declare-fun b!528167 () Bool)

(declare-fun e!307808 () Bool)

(declare-fun lt!243246 () SeekEntryResult!4510)

(assert (=> b!528167 (= e!307808 (bvsge (x!49372 lt!243246) #b01111111111111111111111111111110))))

(declare-fun b!528168 () Bool)

(assert (=> b!528168 (and (bvsge (index!20260 lt!243246) #b00000000000000000000000000000000) (bvslt (index!20260 lt!243246) (size!16451 lt!243051)))))

(declare-fun res!324303 () Bool)

(assert (=> b!528168 (= res!324303 (= (select (arr!16087 lt!243051) (index!20260 lt!243246)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!307807 () Bool)

(assert (=> b!528168 (=> res!324303 e!307807)))

(declare-fun d!81009 () Bool)

(assert (=> d!81009 e!307808))

(declare-fun c!62241 () Bool)

(assert (=> d!81009 (= c!62241 (and ((_ is Intermediate!4510) lt!243246) (undefined!5322 lt!243246)))))

(declare-fun e!307805 () SeekEntryResult!4510)

(assert (=> d!81009 (= lt!243246 e!307805)))

(declare-fun c!62240 () Bool)

(assert (=> d!81009 (= c!62240 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!243247 () (_ BitVec 64))

(assert (=> d!81009 (= lt!243247 (select (arr!16087 lt!243051) lt!243056))))

(assert (=> d!81009 (validMask!0 mask!3524)))

(assert (=> d!81009 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243056 lt!243052 lt!243051 mask!3524) lt!243246)))

(declare-fun b!528169 () Bool)

(assert (=> b!528169 (and (bvsge (index!20260 lt!243246) #b00000000000000000000000000000000) (bvslt (index!20260 lt!243246) (size!16451 lt!243051)))))

(declare-fun res!324304 () Bool)

(assert (=> b!528169 (= res!324304 (= (select (arr!16087 lt!243051) (index!20260 lt!243246)) lt!243052))))

(assert (=> b!528169 (=> res!324304 e!307807)))

(declare-fun e!307806 () Bool)

(assert (=> b!528169 (= e!307806 e!307807)))

(declare-fun b!528170 () Bool)

(assert (=> b!528170 (= e!307804 (Intermediate!4510 false lt!243056 #b00000000000000000000000000000000))))

(declare-fun b!528171 () Bool)

(assert (=> b!528171 (= e!307808 e!307806)))

(declare-fun res!324302 () Bool)

(assert (=> b!528171 (= res!324302 (and ((_ is Intermediate!4510) lt!243246) (not (undefined!5322 lt!243246)) (bvslt (x!49372 lt!243246) #b01111111111111111111111111111110) (bvsge (x!49372 lt!243246) #b00000000000000000000000000000000) (bvsge (x!49372 lt!243246) #b00000000000000000000000000000000)))))

(assert (=> b!528171 (=> (not res!324302) (not e!307806))))

(declare-fun b!528172 () Bool)

(assert (=> b!528172 (and (bvsge (index!20260 lt!243246) #b00000000000000000000000000000000) (bvslt (index!20260 lt!243246) (size!16451 lt!243051)))))

(assert (=> b!528172 (= e!307807 (= (select (arr!16087 lt!243051) (index!20260 lt!243246)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!528173 () Bool)

(assert (=> b!528173 (= e!307805 (Intermediate!4510 true lt!243056 #b00000000000000000000000000000000))))

(declare-fun b!528174 () Bool)

(assert (=> b!528174 (= e!307805 e!307804)))

(declare-fun c!62242 () Bool)

(assert (=> b!528174 (= c!62242 (or (= lt!243247 lt!243052) (= (bvadd lt!243247 lt!243247) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!81009 c!62240) b!528173))

(assert (= (and d!81009 (not c!62240)) b!528174))

(assert (= (and b!528174 c!62242) b!528170))

(assert (= (and b!528174 (not c!62242)) b!528166))

(assert (= (and d!81009 c!62241) b!528167))

(assert (= (and d!81009 (not c!62241)) b!528171))

(assert (= (and b!528171 res!324302) b!528169))

(assert (= (and b!528169 (not res!324304)) b!528168))

(assert (= (and b!528168 (not res!324303)) b!528172))

(declare-fun m!509025 () Bool)

(assert (=> d!81009 m!509025))

(assert (=> d!81009 m!508743))

(declare-fun m!509027 () Bool)

(assert (=> b!528169 m!509027))

(assert (=> b!528168 m!509027))

(assert (=> b!528166 m!508851))

(assert (=> b!528166 m!508851))

(declare-fun m!509029 () Bool)

(assert (=> b!528166 m!509029))

(assert (=> b!528172 m!509027))

(assert (=> b!527805 d!81009))

(check-sat (not d!80969) (not d!80963) (not b!527911) (not b!528146) (not d!80961) (not b!527932) (not b!528119) (not b!528135) (not b!528165) (not d!80923) (not b!528166) (not b!528150) (not b!527993) (not b!527933) (not d!80925) (not bm!31879) (not b!528147) (not bm!31895) (not b!528109) (not b!527925) (not d!80999) (not b!527926) (not bm!31878) (not d!80985) (not d!80951) (not b!528018) (not d!81009))
(check-sat)
