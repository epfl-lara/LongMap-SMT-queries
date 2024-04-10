; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51258 () Bool)

(assert start!51258)

(declare-fun b!559656 () Bool)

(declare-fun e!322422 () Bool)

(declare-fun e!322421 () Bool)

(assert (=> b!559656 (= e!322422 e!322421)))

(declare-fun res!351053 () Bool)

(assert (=> b!559656 (=> res!351053 e!322421)))

(declare-datatypes ((SeekEntryResult!5344 0))(
  ( (MissingZero!5344 (index!23603 (_ BitVec 32))) (Found!5344 (index!23604 (_ BitVec 32))) (Intermediate!5344 (undefined!6156 Bool) (index!23605 (_ BitVec 32)) (x!52510 (_ BitVec 32))) (Undefined!5344) (MissingVacant!5344 (index!23606 (_ BitVec 32))) )
))
(declare-fun lt!254378 () SeekEntryResult!5344)

(assert (=> b!559656 (= res!351053 (or (undefined!6156 lt!254378) (not (is-Intermediate!5344 lt!254378))))))

(declare-fun res!351045 () Bool)

(declare-fun e!322420 () Bool)

(assert (=> start!51258 (=> (not res!351045) (not e!322420))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51258 (= res!351045 (validMask!0 mask!3119))))

(assert (=> start!51258 e!322420))

(assert (=> start!51258 true))

(declare-datatypes ((array!35186 0))(
  ( (array!35187 (arr!16895 (Array (_ BitVec 32) (_ BitVec 64))) (size!17259 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35186)

(declare-fun array_inv!12691 (array!35186) Bool)

(assert (=> start!51258 (array_inv!12691 a!3118)))

(declare-fun e!322423 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun b!559657 () Bool)

(assert (=> b!559657 (= e!322423 (not (or (undefined!6156 lt!254378) (not (is-Intermediate!5344 lt!254378)) (let ((bdg!16975 (select (arr!16895 a!3118) (index!23605 lt!254378)))) (or (= bdg!16975 (select (arr!16895 a!3118) j!142)) (= bdg!16975 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt (index!23605 lt!254378) #b00000000000000000000000000000000) (bvsge (index!23605 lt!254378) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52510 lt!254378) #b01111111111111111111111111111110) (bvslt (x!52510 lt!254378) #b00000000000000000000000000000000) (= (select (store (arr!16895 a!3118) i!1132 k!1914) (index!23605 lt!254378)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!559657 e!322422))

(declare-fun res!351050 () Bool)

(assert (=> b!559657 (=> (not res!351050) (not e!322422))))

(declare-fun lt!254377 () SeekEntryResult!5344)

(assert (=> b!559657 (= res!351050 (= lt!254377 (Found!5344 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35186 (_ BitVec 32)) SeekEntryResult!5344)

(assert (=> b!559657 (= lt!254377 (seekEntryOrOpen!0 (select (arr!16895 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35186 (_ BitVec 32)) Bool)

(assert (=> b!559657 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17462 0))(
  ( (Unit!17463) )
))
(declare-fun lt!254376 () Unit!17462)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35186 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17462)

(assert (=> b!559657 (= lt!254376 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!559658 () Bool)

(declare-fun res!351047 () Bool)

(declare-fun e!322419 () Bool)

(assert (=> b!559658 (=> (not res!351047) (not e!322419))))

(assert (=> b!559658 (= res!351047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!559659 () Bool)

(declare-fun res!351054 () Bool)

(assert (=> b!559659 (=> (not res!351054) (not e!322420))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!559659 (= res!351054 (validKeyInArray!0 (select (arr!16895 a!3118) j!142)))))

(declare-fun b!559660 () Bool)

(declare-fun res!351046 () Bool)

(assert (=> b!559660 (=> (not res!351046) (not e!322420))))

(assert (=> b!559660 (= res!351046 (validKeyInArray!0 k!1914))))

(declare-fun b!559661 () Bool)

(declare-fun res!351052 () Bool)

(assert (=> b!559661 (=> (not res!351052) (not e!322419))))

(declare-datatypes ((List!10975 0))(
  ( (Nil!10972) (Cons!10971 (h!11971 (_ BitVec 64)) (t!17203 List!10975)) )
))
(declare-fun arrayNoDuplicates!0 (array!35186 (_ BitVec 32) List!10975) Bool)

(assert (=> b!559661 (= res!351052 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10972))))

(declare-fun b!559662 () Bool)

(declare-fun res!351051 () Bool)

(assert (=> b!559662 (=> (not res!351051) (not e!322420))))

(assert (=> b!559662 (= res!351051 (and (= (size!17259 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17259 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17259 a!3118)) (not (= i!1132 j!142))))))

(declare-fun e!322425 () Bool)

(declare-fun b!559663 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35186 (_ BitVec 32)) SeekEntryResult!5344)

(assert (=> b!559663 (= e!322425 (= lt!254377 (seekKeyOrZeroReturnVacant!0 (x!52510 lt!254378) (index!23605 lt!254378) (index!23605 lt!254378) (select (arr!16895 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!559664 () Bool)

(assert (=> b!559664 (= e!322421 e!322425)))

(declare-fun res!351048 () Bool)

(assert (=> b!559664 (=> res!351048 e!322425)))

(declare-fun lt!254380 () (_ BitVec 64))

(assert (=> b!559664 (= res!351048 (or (= lt!254380 (select (arr!16895 a!3118) j!142)) (= lt!254380 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!559664 (= lt!254380 (select (arr!16895 a!3118) (index!23605 lt!254378)))))

(declare-fun b!559665 () Bool)

(declare-fun res!351049 () Bool)

(assert (=> b!559665 (=> (not res!351049) (not e!322420))))

(declare-fun arrayContainsKey!0 (array!35186 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!559665 (= res!351049 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!559666 () Bool)

(assert (=> b!559666 (= e!322420 e!322419)))

(declare-fun res!351055 () Bool)

(assert (=> b!559666 (=> (not res!351055) (not e!322419))))

(declare-fun lt!254373 () SeekEntryResult!5344)

(assert (=> b!559666 (= res!351055 (or (= lt!254373 (MissingZero!5344 i!1132)) (= lt!254373 (MissingVacant!5344 i!1132))))))

(assert (=> b!559666 (= lt!254373 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!559667 () Bool)

(assert (=> b!559667 (= e!322419 e!322423)))

(declare-fun res!351056 () Bool)

(assert (=> b!559667 (=> (not res!351056) (not e!322423))))

(declare-fun lt!254375 () (_ BitVec 32))

(declare-fun lt!254379 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35186 (_ BitVec 32)) SeekEntryResult!5344)

(assert (=> b!559667 (= res!351056 (= lt!254378 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254375 lt!254379 (array!35187 (store (arr!16895 a!3118) i!1132 k!1914) (size!17259 a!3118)) mask!3119)))))

(declare-fun lt!254374 () (_ BitVec 32))

(assert (=> b!559667 (= lt!254378 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254374 (select (arr!16895 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!559667 (= lt!254375 (toIndex!0 lt!254379 mask!3119))))

(assert (=> b!559667 (= lt!254379 (select (store (arr!16895 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!559667 (= lt!254374 (toIndex!0 (select (arr!16895 a!3118) j!142) mask!3119))))

(assert (= (and start!51258 res!351045) b!559662))

(assert (= (and b!559662 res!351051) b!559659))

(assert (= (and b!559659 res!351054) b!559660))

(assert (= (and b!559660 res!351046) b!559665))

(assert (= (and b!559665 res!351049) b!559666))

(assert (= (and b!559666 res!351055) b!559658))

(assert (= (and b!559658 res!351047) b!559661))

(assert (= (and b!559661 res!351052) b!559667))

(assert (= (and b!559667 res!351056) b!559657))

(assert (= (and b!559657 res!351050) b!559656))

(assert (= (and b!559656 (not res!351053)) b!559664))

(assert (= (and b!559664 (not res!351048)) b!559663))

(declare-fun m!537495 () Bool)

(assert (=> b!559663 m!537495))

(assert (=> b!559663 m!537495))

(declare-fun m!537497 () Bool)

(assert (=> b!559663 m!537497))

(assert (=> b!559659 m!537495))

(assert (=> b!559659 m!537495))

(declare-fun m!537499 () Bool)

(assert (=> b!559659 m!537499))

(declare-fun m!537501 () Bool)

(assert (=> b!559665 m!537501))

(declare-fun m!537503 () Bool)

(assert (=> b!559666 m!537503))

(declare-fun m!537505 () Bool)

(assert (=> start!51258 m!537505))

(declare-fun m!537507 () Bool)

(assert (=> start!51258 m!537507))

(assert (=> b!559657 m!537495))

(declare-fun m!537509 () Bool)

(assert (=> b!559657 m!537509))

(declare-fun m!537511 () Bool)

(assert (=> b!559657 m!537511))

(declare-fun m!537513 () Bool)

(assert (=> b!559657 m!537513))

(declare-fun m!537515 () Bool)

(assert (=> b!559657 m!537515))

(declare-fun m!537517 () Bool)

(assert (=> b!559657 m!537517))

(assert (=> b!559657 m!537495))

(declare-fun m!537519 () Bool)

(assert (=> b!559657 m!537519))

(declare-fun m!537521 () Bool)

(assert (=> b!559660 m!537521))

(declare-fun m!537523 () Bool)

(assert (=> b!559661 m!537523))

(assert (=> b!559667 m!537495))

(declare-fun m!537525 () Bool)

(assert (=> b!559667 m!537525))

(assert (=> b!559667 m!537495))

(declare-fun m!537527 () Bool)

(assert (=> b!559667 m!537527))

(declare-fun m!537529 () Bool)

(assert (=> b!559667 m!537529))

(assert (=> b!559667 m!537515))

(assert (=> b!559667 m!537495))

(declare-fun m!537531 () Bool)

(assert (=> b!559667 m!537531))

(declare-fun m!537533 () Bool)

(assert (=> b!559667 m!537533))

(assert (=> b!559664 m!537495))

(assert (=> b!559664 m!537513))

(declare-fun m!537535 () Bool)

(assert (=> b!559658 m!537535))

(push 1)

(assert (not b!559667))

(assert (not b!559666))

(assert (not b!559659))

(assert (not b!559665))

(assert (not b!559661))

(assert (not b!559660))

(assert (not start!51258))

(assert (not b!559658))

(assert (not b!559663))

(assert (not b!559657))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!559746 () Bool)

(declare-fun e!322479 () Bool)

(declare-fun call!32444 () Bool)

(assert (=> b!559746 (= e!322479 call!32444)))

(declare-fun b!559747 () Bool)

(declare-fun e!322480 () Bool)

(assert (=> b!559747 (= e!322480 e!322479)))

(declare-fun c!64673 () Bool)

(assert (=> b!559747 (= c!64673 (validKeyInArray!0 (select (arr!16895 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!559748 () Bool)

(declare-fun e!322481 () Bool)

(assert (=> b!559748 (= e!322481 call!32444)))

(declare-fun bm!32441 () Bool)

(assert (=> bm!32441 (= call!32444 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!559749 () Bool)

(assert (=> b!559749 (= e!322479 e!322481)))

(declare-fun lt!254404 () (_ BitVec 64))

(assert (=> b!559749 (= lt!254404 (select (arr!16895 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!254403 () Unit!17462)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35186 (_ BitVec 64) (_ BitVec 32)) Unit!17462)

(assert (=> b!559749 (= lt!254403 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!254404 #b00000000000000000000000000000000))))

(assert (=> b!559749 (arrayContainsKey!0 a!3118 lt!254404 #b00000000000000000000000000000000)))

(declare-fun lt!254402 () Unit!17462)

(assert (=> b!559749 (= lt!254402 lt!254403)))

(declare-fun res!351087 () Bool)

(assert (=> b!559749 (= res!351087 (= (seekEntryOrOpen!0 (select (arr!16895 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5344 #b00000000000000000000000000000000)))))

(assert (=> b!559749 (=> (not res!351087) (not e!322481))))

(declare-fun d!83797 () Bool)

(declare-fun res!351088 () Bool)

(assert (=> d!83797 (=> res!351088 e!322480)))

(assert (=> d!83797 (= res!351088 (bvsge #b00000000000000000000000000000000 (size!17259 a!3118)))))

(assert (=> d!83797 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!322480)))

(assert (= (and d!83797 (not res!351088)) b!559747))

(assert (= (and b!559747 c!64673) b!559749))

(assert (= (and b!559747 (not c!64673)) b!559746))

(assert (= (and b!559749 res!351087) b!559748))

(assert (= (or b!559748 b!559746) bm!32441))

(declare-fun m!537567 () Bool)

(assert (=> b!559747 m!537567))

(assert (=> b!559747 m!537567))

(declare-fun m!537569 () Bool)

(assert (=> b!559747 m!537569))

(declare-fun m!537571 () Bool)

(assert (=> bm!32441 m!537571))

(assert (=> b!559749 m!537567))

(declare-fun m!537573 () Bool)

(assert (=> b!559749 m!537573))

(declare-fun m!537575 () Bool)

(assert (=> b!559749 m!537575))

(assert (=> b!559749 m!537567))

(declare-fun m!537577 () Bool)

(assert (=> b!559749 m!537577))

(assert (=> b!559658 d!83797))

(declare-fun b!559788 () Bool)

(declare-fun e!322509 () SeekEntryResult!5344)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!559788 (= e!322509 (seekKeyOrZeroReturnVacant!0 (bvadd (x!52510 lt!254378) #b00000000000000000000000000000001) (nextIndex!0 (index!23605 lt!254378) (x!52510 lt!254378) mask!3119) (index!23605 lt!254378) (select (arr!16895 a!3118) j!142) a!3118 mask!3119))))

(declare-fun lt!254433 () SeekEntryResult!5344)

(declare-fun d!83801 () Bool)

(assert (=> d!83801 (and (or (is-Undefined!5344 lt!254433) (not (is-Found!5344 lt!254433)) (and (bvsge (index!23604 lt!254433) #b00000000000000000000000000000000) (bvslt (index!23604 lt!254433) (size!17259 a!3118)))) (or (is-Undefined!5344 lt!254433) (is-Found!5344 lt!254433) (not (is-MissingVacant!5344 lt!254433)) (not (= (index!23606 lt!254433) (index!23605 lt!254378))) (and (bvsge (index!23606 lt!254433) #b00000000000000000000000000000000) (bvslt (index!23606 lt!254433) (size!17259 a!3118)))) (or (is-Undefined!5344 lt!254433) (ite (is-Found!5344 lt!254433) (= (select (arr!16895 a!3118) (index!23604 lt!254433)) (select (arr!16895 a!3118) j!142)) (and (is-MissingVacant!5344 lt!254433) (= (index!23606 lt!254433) (index!23605 lt!254378)) (= (select (arr!16895 a!3118) (index!23606 lt!254433)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!322507 () SeekEntryResult!5344)

(assert (=> d!83801 (= lt!254433 e!322507)))

(declare-fun c!64691 () Bool)

(assert (=> d!83801 (= c!64691 (bvsge (x!52510 lt!254378) #b01111111111111111111111111111110))))

(declare-fun lt!254434 () (_ BitVec 64))

(assert (=> d!83801 (= lt!254434 (select (arr!16895 a!3118) (index!23605 lt!254378)))))

(assert (=> d!83801 (validMask!0 mask!3119)))

(assert (=> d!83801 (= (seekKeyOrZeroReturnVacant!0 (x!52510 lt!254378) (index!23605 lt!254378) (index!23605 lt!254378) (select (arr!16895 a!3118) j!142) a!3118 mask!3119) lt!254433)))

(declare-fun b!559789 () Bool)

(assert (=> b!559789 (= e!322509 (MissingVacant!5344 (index!23605 lt!254378)))))

(declare-fun b!559790 () Bool)

(declare-fun e!322508 () SeekEntryResult!5344)

(assert (=> b!559790 (= e!322507 e!322508)))

(declare-fun c!64690 () Bool)

(assert (=> b!559790 (= c!64690 (= lt!254434 (select (arr!16895 a!3118) j!142)))))

(declare-fun b!559791 () Bool)

(assert (=> b!559791 (= e!322508 (Found!5344 (index!23605 lt!254378)))))

(declare-fun b!559792 () Bool)

(assert (=> b!559792 (= e!322507 Undefined!5344)))

(declare-fun b!559793 () Bool)

(declare-fun c!64689 () Bool)

(assert (=> b!559793 (= c!64689 (= lt!254434 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!559793 (= e!322508 e!322509)))

(assert (= (and d!83801 c!64691) b!559792))

(assert (= (and d!83801 (not c!64691)) b!559790))

(assert (= (and b!559790 c!64690) b!559791))

(assert (= (and b!559790 (not c!64690)) b!559793))

(assert (= (and b!559793 c!64689) b!559789))

(assert (= (and b!559793 (not c!64689)) b!559788))

(declare-fun m!537609 () Bool)

(assert (=> b!559788 m!537609))

(assert (=> b!559788 m!537609))

(assert (=> b!559788 m!537495))

(declare-fun m!537611 () Bool)

(assert (=> b!559788 m!537611))

(declare-fun m!537613 () Bool)

(assert (=> d!83801 m!537613))

(declare-fun m!537615 () Bool)

(assert (=> d!83801 m!537615))

(assert (=> d!83801 m!537513))

(assert (=> d!83801 m!537505))

(assert (=> b!559663 d!83801))

(declare-fun d!83811 () Bool)

(declare-fun res!351103 () Bool)

(declare-fun e!322514 () Bool)

(assert (=> d!83811 (=> res!351103 e!322514)))

(assert (=> d!83811 (= res!351103 (= (select (arr!16895 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!83811 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!322514)))

(declare-fun b!559798 () Bool)

(declare-fun e!322515 () Bool)

(assert (=> b!559798 (= e!322514 e!322515)))

(declare-fun res!351104 () Bool)

(assert (=> b!559798 (=> (not res!351104) (not e!322515))))

(assert (=> b!559798 (= res!351104 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17259 a!3118)))))

(declare-fun b!559799 () Bool)

(assert (=> b!559799 (= e!322515 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83811 (not res!351103)) b!559798))

(assert (= (and b!559798 res!351104) b!559799))

(assert (=> d!83811 m!537567))

(declare-fun m!537617 () Bool)

(assert (=> b!559799 m!537617))

(assert (=> b!559665 d!83811))

(declare-fun d!83813 () Bool)

(assert (=> d!83813 (= (validKeyInArray!0 (select (arr!16895 a!3118) j!142)) (and (not (= (select (arr!16895 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16895 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!559659 d!83813))

(declare-fun b!559856 () Bool)

(declare-fun e!322550 () Bool)

(declare-fun e!322549 () Bool)

(assert (=> b!559856 (= e!322550 e!322549)))

(declare-fun c!64716 () Bool)

(assert (=> b!559856 (= c!64716 (validKeyInArray!0 (select (arr!16895 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!559857 () Bool)

(declare-fun e!322548 () Bool)

(declare-fun contains!2861 (List!10975 (_ BitVec 64)) Bool)

(assert (=> b!559857 (= e!322548 (contains!2861 Nil!10972 (select (arr!16895 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!559858 () Bool)

(declare-fun call!32454 () Bool)

(assert (=> b!559858 (= e!322549 call!32454)))

(declare-fun b!559859 () Bool)

(declare-fun e!322551 () Bool)

(assert (=> b!559859 (= e!322551 e!322550)))

(declare-fun res!351114 () Bool)

(assert (=> b!559859 (=> (not res!351114) (not e!322550))))

(assert (=> b!559859 (= res!351114 (not e!322548))))

(declare-fun res!351115 () Bool)

(assert (=> b!559859 (=> (not res!351115) (not e!322548))))

(assert (=> b!559859 (= res!351115 (validKeyInArray!0 (select (arr!16895 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32451 () Bool)

(assert (=> bm!32451 (= call!32454 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64716 (Cons!10971 (select (arr!16895 a!3118) #b00000000000000000000000000000000) Nil!10972) Nil!10972)))))

(declare-fun b!559860 () Bool)

(assert (=> b!559860 (= e!322549 call!32454)))

(declare-fun d!83815 () Bool)

(declare-fun res!351113 () Bool)

(assert (=> d!83815 (=> res!351113 e!322551)))

(assert (=> d!83815 (= res!351113 (bvsge #b00000000000000000000000000000000 (size!17259 a!3118)))))

(assert (=> d!83815 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10972) e!322551)))

(assert (= (and d!83815 (not res!351113)) b!559859))

(assert (= (and b!559859 res!351115) b!559857))

(assert (= (and b!559859 res!351114) b!559856))

(assert (= (and b!559856 c!64716) b!559858))

(assert (= (and b!559856 (not c!64716)) b!559860))

(assert (= (or b!559858 b!559860) bm!32451))

(assert (=> b!559856 m!537567))

(assert (=> b!559856 m!537567))

(assert (=> b!559856 m!537569))

(assert (=> b!559857 m!537567))

(assert (=> b!559857 m!537567))

(declare-fun m!537657 () Bool)

(assert (=> b!559857 m!537657))

(assert (=> b!559859 m!537567))

(assert (=> b!559859 m!537567))

(assert (=> b!559859 m!537569))

(assert (=> bm!32451 m!537567))

(declare-fun m!537659 () Bool)

(assert (=> bm!32451 m!537659))

(assert (=> b!559661 d!83815))

(declare-fun d!83825 () Bool)

(assert (=> d!83825 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!559660 d!83825))

(declare-fun d!83827 () Bool)

(assert (=> d!83827 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51258 d!83827))

(declare-fun d!83833 () Bool)

(assert (=> d!83833 (= (array_inv!12691 a!3118) (bvsge (size!17259 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51258 d!83833))

(declare-fun b!559936 () Bool)

(declare-fun e!322594 () SeekEntryResult!5344)

(declare-fun lt!254481 () SeekEntryResult!5344)

(assert (=> b!559936 (= e!322594 (MissingZero!5344 (index!23605 lt!254481)))))

(declare-fun b!559937 () Bool)

(declare-fun e!322595 () SeekEntryResult!5344)

(declare-fun e!322593 () SeekEntryResult!5344)

(assert (=> b!559937 (= e!322595 e!322593)))

(declare-fun lt!254482 () (_ BitVec 64))

(assert (=> b!559937 (= lt!254482 (select (arr!16895 a!3118) (index!23605 lt!254481)))))

(declare-fun c!64744 () Bool)

(assert (=> b!559937 (= c!64744 (= lt!254482 k!1914))))

(declare-fun b!559938 () Bool)

(declare-fun c!64745 () Bool)

(assert (=> b!559938 (= c!64745 (= lt!254482 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!559938 (= e!322593 e!322594)))

(declare-fun b!559940 () Bool)

(assert (=> b!559940 (= e!322594 (seekKeyOrZeroReturnVacant!0 (x!52510 lt!254481) (index!23605 lt!254481) (index!23605 lt!254481) k!1914 a!3118 mask!3119))))

(declare-fun b!559941 () Bool)

(assert (=> b!559941 (= e!322595 Undefined!5344)))

(declare-fun b!559939 () Bool)

(assert (=> b!559939 (= e!322593 (Found!5344 (index!23605 lt!254481)))))

(declare-fun d!83835 () Bool)

(declare-fun lt!254483 () SeekEntryResult!5344)

(assert (=> d!83835 (and (or (is-Undefined!5344 lt!254483) (not (is-Found!5344 lt!254483)) (and (bvsge (index!23604 lt!254483) #b00000000000000000000000000000000) (bvslt (index!23604 lt!254483) (size!17259 a!3118)))) (or (is-Undefined!5344 lt!254483) (is-Found!5344 lt!254483) (not (is-MissingZero!5344 lt!254483)) (and (bvsge (index!23603 lt!254483) #b00000000000000000000000000000000) (bvslt (index!23603 lt!254483) (size!17259 a!3118)))) (or (is-Undefined!5344 lt!254483) (is-Found!5344 lt!254483) (is-MissingZero!5344 lt!254483) (not (is-MissingVacant!5344 lt!254483)) (and (bvsge (index!23606 lt!254483) #b00000000000000000000000000000000) (bvslt (index!23606 lt!254483) (size!17259 a!3118)))) (or (is-Undefined!5344 lt!254483) (ite (is-Found!5344 lt!254483) (= (select (arr!16895 a!3118) (index!23604 lt!254483)) k!1914) (ite (is-MissingZero!5344 lt!254483) (= (select (arr!16895 a!3118) (index!23603 lt!254483)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5344 lt!254483) (= (select (arr!16895 a!3118) (index!23606 lt!254483)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83835 (= lt!254483 e!322595)))

(declare-fun c!64746 () Bool)

(assert (=> d!83835 (= c!64746 (and (is-Intermediate!5344 lt!254481) (undefined!6156 lt!254481)))))

(assert (=> d!83835 (= lt!254481 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!83835 (validMask!0 mask!3119)))

(assert (=> d!83835 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!254483)))

(assert (= (and d!83835 c!64746) b!559941))

(assert (= (and d!83835 (not c!64746)) b!559937))

(assert (= (and b!559937 c!64744) b!559939))

(assert (= (and b!559937 (not c!64744)) b!559938))

(assert (= (and b!559938 c!64745) b!559936))

(assert (= (and b!559938 (not c!64745)) b!559940))

(declare-fun m!537677 () Bool)

(assert (=> b!559937 m!537677))

(declare-fun m!537679 () Bool)

(assert (=> b!559940 m!537679))

(declare-fun m!537683 () Bool)

(assert (=> d!83835 m!537683))

(declare-fun m!537685 () Bool)

(assert (=> d!83835 m!537685))

(declare-fun m!537687 () Bool)

(assert (=> d!83835 m!537687))

(assert (=> d!83835 m!537505))

(declare-fun m!537691 () Bool)

(assert (=> d!83835 m!537691))

(assert (=> d!83835 m!537683))

(declare-fun m!537695 () Bool)

(assert (=> d!83835 m!537695))

(assert (=> b!559666 d!83835))

(declare-fun b!559985 () Bool)

(declare-fun e!322625 () Bool)

(declare-fun e!322624 () Bool)

(assert (=> b!559985 (= e!322625 e!322624)))

(declare-fun res!351156 () Bool)

(declare-fun lt!254507 () SeekEntryResult!5344)

(assert (=> b!559985 (= res!351156 (and (is-Intermediate!5344 lt!254507) (not (undefined!6156 lt!254507)) (bvslt (x!52510 lt!254507) #b01111111111111111111111111111110) (bvsge (x!52510 lt!254507) #b00000000000000000000000000000000) (bvsge (x!52510 lt!254507) #b00000000000000000000000000000000)))))

(assert (=> b!559985 (=> (not res!351156) (not e!322624))))

(declare-fun b!559986 () Bool)

(assert (=> b!559986 (= e!322625 (bvsge (x!52510 lt!254507) #b01111111111111111111111111111110))))

(declare-fun d!83845 () Bool)

(assert (=> d!83845 e!322625))

(declare-fun c!64760 () Bool)

(assert (=> d!83845 (= c!64760 (and (is-Intermediate!5344 lt!254507) (undefined!6156 lt!254507)))))

(declare-fun e!322627 () SeekEntryResult!5344)

(assert (=> d!83845 (= lt!254507 e!322627)))

(declare-fun c!64761 () Bool)

(assert (=> d!83845 (= c!64761 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!254508 () (_ BitVec 64))

(assert (=> d!83845 (= lt!254508 (select (arr!16895 (array!35187 (store (arr!16895 a!3118) i!1132 k!1914) (size!17259 a!3118))) lt!254375))))

(assert (=> d!83845 (validMask!0 mask!3119)))

(assert (=> d!83845 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254375 lt!254379 (array!35187 (store (arr!16895 a!3118) i!1132 k!1914) (size!17259 a!3118)) mask!3119) lt!254507)))

(declare-fun b!559987 () Bool)

(assert (=> b!559987 (and (bvsge (index!23605 lt!254507) #b00000000000000000000000000000000) (bvslt (index!23605 lt!254507) (size!17259 (array!35187 (store (arr!16895 a!3118) i!1132 k!1914) (size!17259 a!3118)))))))

(declare-fun res!351158 () Bool)

(assert (=> b!559987 (= res!351158 (= (select (arr!16895 (array!35187 (store (arr!16895 a!3118) i!1132 k!1914) (size!17259 a!3118))) (index!23605 lt!254507)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!322626 () Bool)

(assert (=> b!559987 (=> res!351158 e!322626)))

(declare-fun b!559988 () Bool)

(assert (=> b!559988 (= e!322627 (Intermediate!5344 true lt!254375 #b00000000000000000000000000000000))))

(declare-fun b!559989 () Bool)

(declare-fun e!322623 () SeekEntryResult!5344)

(assert (=> b!559989 (= e!322623 (Intermediate!5344 false lt!254375 #b00000000000000000000000000000000))))

(declare-fun b!559990 () Bool)

(assert (=> b!559990 (= e!322623 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!254375 #b00000000000000000000000000000000 mask!3119) lt!254379 (array!35187 (store (arr!16895 a!3118) i!1132 k!1914) (size!17259 a!3118)) mask!3119))))

(declare-fun b!559991 () Bool)

(assert (=> b!559991 (= e!322627 e!322623)))

(declare-fun c!64762 () Bool)

(assert (=> b!559991 (= c!64762 (or (= lt!254508 lt!254379) (= (bvadd lt!254508 lt!254508) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!559992 () Bool)

(assert (=> b!559992 (and (bvsge (index!23605 lt!254507) #b00000000000000000000000000000000) (bvslt (index!23605 lt!254507) (size!17259 (array!35187 (store (arr!16895 a!3118) i!1132 k!1914) (size!17259 a!3118)))))))

(assert (=> b!559992 (= e!322626 (= (select (arr!16895 (array!35187 (store (arr!16895 a!3118) i!1132 k!1914) (size!17259 a!3118))) (index!23605 lt!254507)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!559993 () Bool)

(assert (=> b!559993 (and (bvsge (index!23605 lt!254507) #b00000000000000000000000000000000) (bvslt (index!23605 lt!254507) (size!17259 (array!35187 (store (arr!16895 a!3118) i!1132 k!1914) (size!17259 a!3118)))))))

(declare-fun res!351157 () Bool)

(assert (=> b!559993 (= res!351157 (= (select (arr!16895 (array!35187 (store (arr!16895 a!3118) i!1132 k!1914) (size!17259 a!3118))) (index!23605 lt!254507)) lt!254379))))

(assert (=> b!559993 (=> res!351157 e!322626)))

(assert (=> b!559993 (= e!322624 e!322626)))

(assert (= (and d!83845 c!64761) b!559988))

(assert (= (and d!83845 (not c!64761)) b!559991))

(assert (= (and b!559991 c!64762) b!559989))

(assert (= (and b!559991 (not c!64762)) b!559990))

(assert (= (and d!83845 c!64760) b!559986))

(assert (= (and d!83845 (not c!64760)) b!559985))

(assert (= (and b!559985 res!351156) b!559993))

(assert (= (and b!559993 (not res!351157)) b!559987))

(assert (= (and b!559987 (not res!351158)) b!559992))

(declare-fun m!537729 () Bool)

(assert (=> b!559992 m!537729))

(assert (=> b!559993 m!537729))

(declare-fun m!537731 () Bool)

(assert (=> b!559990 m!537731))

(assert (=> b!559990 m!537731))

(declare-fun m!537733 () Bool)

(assert (=> b!559990 m!537733))

(declare-fun m!537735 () Bool)

(assert (=> d!83845 m!537735))

(assert (=> d!83845 m!537505))

(assert (=> b!559987 m!537729))

(assert (=> b!559667 d!83845))

(declare-fun b!559994 () Bool)

(declare-fun e!322630 () Bool)

(declare-fun e!322629 () Bool)

(assert (=> b!559994 (= e!322630 e!322629)))

(declare-fun res!351159 () Bool)

(declare-fun lt!254509 () SeekEntryResult!5344)

(assert (=> b!559994 (= res!351159 (and (is-Intermediate!5344 lt!254509) (not (undefined!6156 lt!254509)) (bvslt (x!52510 lt!254509) #b01111111111111111111111111111110) (bvsge (x!52510 lt!254509) #b00000000000000000000000000000000) (bvsge (x!52510 lt!254509) #b00000000000000000000000000000000)))))

(assert (=> b!559994 (=> (not res!351159) (not e!322629))))

(declare-fun b!559995 () Bool)

(assert (=> b!559995 (= e!322630 (bvsge (x!52510 lt!254509) #b01111111111111111111111111111110))))

(declare-fun d!83863 () Bool)

(assert (=> d!83863 e!322630))

(declare-fun c!64763 () Bool)

(assert (=> d!83863 (= c!64763 (and (is-Intermediate!5344 lt!254509) (undefined!6156 lt!254509)))))

(declare-fun e!322632 () SeekEntryResult!5344)

(assert (=> d!83863 (= lt!254509 e!322632)))

(declare-fun c!64764 () Bool)

(assert (=> d!83863 (= c!64764 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!254510 () (_ BitVec 64))

(assert (=> d!83863 (= lt!254510 (select (arr!16895 a!3118) lt!254374))))

(assert (=> d!83863 (validMask!0 mask!3119)))

(assert (=> d!83863 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254374 (select (arr!16895 a!3118) j!142) a!3118 mask!3119) lt!254509)))

(declare-fun b!559996 () Bool)

(assert (=> b!559996 (and (bvsge (index!23605 lt!254509) #b00000000000000000000000000000000) (bvslt (index!23605 lt!254509) (size!17259 a!3118)))))

(declare-fun res!351161 () Bool)

(assert (=> b!559996 (= res!351161 (= (select (arr!16895 a!3118) (index!23605 lt!254509)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!322631 () Bool)

(assert (=> b!559996 (=> res!351161 e!322631)))

(declare-fun b!559997 () Bool)

(assert (=> b!559997 (= e!322632 (Intermediate!5344 true lt!254374 #b00000000000000000000000000000000))))

(declare-fun b!559998 () Bool)

(declare-fun e!322628 () SeekEntryResult!5344)

(assert (=> b!559998 (= e!322628 (Intermediate!5344 false lt!254374 #b00000000000000000000000000000000))))

(declare-fun b!559999 () Bool)

(assert (=> b!559999 (= e!322628 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!254374 #b00000000000000000000000000000000 mask!3119) (select (arr!16895 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!560000 () Bool)

(assert (=> b!560000 (= e!322632 e!322628)))

(declare-fun c!64765 () Bool)

(assert (=> b!560000 (= c!64765 (or (= lt!254510 (select (arr!16895 a!3118) j!142)) (= (bvadd lt!254510 lt!254510) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!560001 () Bool)

(assert (=> b!560001 (and (bvsge (index!23605 lt!254509) #b00000000000000000000000000000000) (bvslt (index!23605 lt!254509) (size!17259 a!3118)))))

(assert (=> b!560001 (= e!322631 (= (select (arr!16895 a!3118) (index!23605 lt!254509)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!560002 () Bool)

(assert (=> b!560002 (and (bvsge (index!23605 lt!254509) #b00000000000000000000000000000000) (bvslt (index!23605 lt!254509) (size!17259 a!3118)))))

(declare-fun res!351160 () Bool)

(assert (=> b!560002 (= res!351160 (= (select (arr!16895 a!3118) (index!23605 lt!254509)) (select (arr!16895 a!3118) j!142)))))

(assert (=> b!560002 (=> res!351160 e!322631)))

(assert (=> b!560002 (= e!322629 e!322631)))

(assert (= (and d!83863 c!64764) b!559997))

(assert (= (and d!83863 (not c!64764)) b!560000))

(assert (= (and b!560000 c!64765) b!559998))

(assert (= (and b!560000 (not c!64765)) b!559999))

(assert (= (and d!83863 c!64763) b!559995))

(assert (= (and d!83863 (not c!64763)) b!559994))

(assert (= (and b!559994 res!351159) b!560002))

(assert (= (and b!560002 (not res!351160)) b!559996))

(assert (= (and b!559996 (not res!351161)) b!560001))

(declare-fun m!537737 () Bool)

(assert (=> b!560001 m!537737))

(assert (=> b!560002 m!537737))

(declare-fun m!537739 () Bool)

(assert (=> b!559999 m!537739))

(assert (=> b!559999 m!537739))

(assert (=> b!559999 m!537495))

(declare-fun m!537741 () Bool)

(assert (=> b!559999 m!537741))

(declare-fun m!537743 () Bool)

(assert (=> d!83863 m!537743))

(assert (=> d!83863 m!537505))

(assert (=> b!559996 m!537737))

(assert (=> b!559667 d!83863))

(declare-fun d!83865 () Bool)

(declare-fun lt!254516 () (_ BitVec 32))

(declare-fun lt!254515 () (_ BitVec 32))

(assert (=> d!83865 (= lt!254516 (bvmul (bvxor lt!254515 (bvlshr lt!254515 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83865 (= lt!254515 ((_ extract 31 0) (bvand (bvxor lt!254379 (bvlshr lt!254379 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

