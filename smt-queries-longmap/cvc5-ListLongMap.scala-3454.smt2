; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47916 () Bool)

(assert start!47916)

(declare-fun b!527853 () Bool)

(declare-fun e!307620 () Bool)

(declare-fun e!307613 () Bool)

(assert (=> b!527853 (= e!307620 e!307613)))

(declare-fun res!324124 () Bool)

(assert (=> b!527853 (=> res!324124 e!307613)))

(declare-datatypes ((SeekEntryResult!4559 0))(
  ( (MissingZero!4559 (index!20454 (_ BitVec 32))) (Found!4559 (index!20455 (_ BitVec 32))) (Intermediate!4559 (undefined!5371 Bool) (index!20456 (_ BitVec 32)) (x!49424 (_ BitVec 32))) (Undefined!4559) (MissingVacant!4559 (index!20457 (_ BitVec 32))) )
))
(declare-fun lt!243038 () SeekEntryResult!4559)

(declare-datatypes ((array!33484 0))(
  ( (array!33485 (arr!16092 (Array (_ BitVec 32) (_ BitVec 64))) (size!16456 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33484)

(declare-fun lt!243045 () (_ BitVec 32))

(assert (=> b!527853 (= res!324124 (or (bvsgt (x!49424 lt!243038) #b01111111111111111111111111111110) (bvslt lt!243045 #b00000000000000000000000000000000) (bvsge lt!243045 (size!16456 a!3235)) (bvslt (index!20456 lt!243038) #b00000000000000000000000000000000) (bvsge (index!20456 lt!243038) (size!16456 a!3235)) (not (= lt!243038 (Intermediate!4559 false (index!20456 lt!243038) (x!49424 lt!243038)))) (bvsle #b00000000000000000000000000000000 (x!49424 lt!243038))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!527853 (= (index!20456 lt!243038) i!1204)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((Unit!16688 0))(
  ( (Unit!16689) )
))
(declare-fun lt!243046 () Unit!16688)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33484 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16688)

(assert (=> b!527853 (= lt!243046 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!243045 #b00000000000000000000000000000000 (index!20456 lt!243038) (x!49424 lt!243038) mask!3524))))

(assert (=> b!527853 (and (or (= (select (arr!16092 a!3235) (index!20456 lt!243038)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16092 a!3235) (index!20456 lt!243038)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16092 a!3235) (index!20456 lt!243038)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16092 a!3235) (index!20456 lt!243038)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243039 () Unit!16688)

(declare-fun e!307618 () Unit!16688)

(assert (=> b!527853 (= lt!243039 e!307618)))

(declare-fun c!62174 () Bool)

(assert (=> b!527853 (= c!62174 (= (select (arr!16092 a!3235) (index!20456 lt!243038)) (select (arr!16092 a!3235) j!176)))))

(assert (=> b!527853 (and (bvslt (x!49424 lt!243038) #b01111111111111111111111111111110) (or (= (select (arr!16092 a!3235) (index!20456 lt!243038)) (select (arr!16092 a!3235) j!176)) (= (select (arr!16092 a!3235) (index!20456 lt!243038)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16092 a!3235) (index!20456 lt!243038)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527854 () Bool)

(declare-fun res!324123 () Bool)

(declare-fun e!307614 () Bool)

(assert (=> b!527854 (=> (not res!324123) (not e!307614))))

(declare-datatypes ((List!10250 0))(
  ( (Nil!10247) (Cons!10246 (h!11180 (_ BitVec 64)) (t!16478 List!10250)) )
))
(declare-fun arrayNoDuplicates!0 (array!33484 (_ BitVec 32) List!10250) Bool)

(assert (=> b!527854 (= res!324123 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10247))))

(declare-fun b!527855 () Bool)

(declare-fun res!324119 () Bool)

(assert (=> b!527855 (=> (not res!324119) (not e!307614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33484 (_ BitVec 32)) Bool)

(assert (=> b!527855 (= res!324119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!527856 () Bool)

(declare-fun res!324131 () Bool)

(declare-fun e!307616 () Bool)

(assert (=> b!527856 (=> (not res!324131) (not e!307616))))

(declare-fun arrayContainsKey!0 (array!33484 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!527856 (= res!324131 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!527857 () Bool)

(declare-fun res!324122 () Bool)

(assert (=> b!527857 (=> res!324122 e!307620)))

(assert (=> b!527857 (= res!324122 (or (undefined!5371 lt!243038) (not (is-Intermediate!4559 lt!243038))))))

(declare-fun b!527859 () Bool)

(declare-fun res!324126 () Bool)

(assert (=> b!527859 (=> (not res!324126) (not e!307616))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!527859 (= res!324126 (validKeyInArray!0 (select (arr!16092 a!3235) j!176)))))

(declare-fun b!527860 () Bool)

(assert (=> b!527860 (= e!307614 (not e!307620))))

(declare-fun res!324120 () Bool)

(assert (=> b!527860 (=> res!324120 e!307620)))

(declare-fun lt!243043 () (_ BitVec 32))

(declare-fun lt!243037 () (_ BitVec 64))

(declare-fun lt!243044 () array!33484)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33484 (_ BitVec 32)) SeekEntryResult!4559)

(assert (=> b!527860 (= res!324120 (= lt!243038 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243043 lt!243037 lt!243044 mask!3524)))))

(assert (=> b!527860 (= lt!243038 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243045 (select (arr!16092 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527860 (= lt!243043 (toIndex!0 lt!243037 mask!3524))))

(assert (=> b!527860 (= lt!243037 (select (store (arr!16092 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!527860 (= lt!243045 (toIndex!0 (select (arr!16092 a!3235) j!176) mask!3524))))

(assert (=> b!527860 (= lt!243044 (array!33485 (store (arr!16092 a!3235) i!1204 k!2280) (size!16456 a!3235)))))

(declare-fun e!307619 () Bool)

(assert (=> b!527860 e!307619))

(declare-fun res!324127 () Bool)

(assert (=> b!527860 (=> (not res!324127) (not e!307619))))

(assert (=> b!527860 (= res!324127 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!243042 () Unit!16688)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33484 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16688)

(assert (=> b!527860 (= lt!243042 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!527861 () Bool)

(declare-fun Unit!16690 () Unit!16688)

(assert (=> b!527861 (= e!307618 Unit!16690)))

(declare-fun lt!243040 () Unit!16688)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33484 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16688)

(assert (=> b!527861 (= lt!243040 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!243045 #b00000000000000000000000000000000 (index!20456 lt!243038) (x!49424 lt!243038) mask!3524))))

(declare-fun res!324129 () Bool)

(assert (=> b!527861 (= res!324129 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243045 lt!243037 lt!243044 mask!3524) (Intermediate!4559 false (index!20456 lt!243038) (x!49424 lt!243038))))))

(declare-fun e!307617 () Bool)

(assert (=> b!527861 (=> (not res!324129) (not e!307617))))

(assert (=> b!527861 e!307617))

(declare-fun b!527862 () Bool)

(assert (=> b!527862 (= e!307616 e!307614)))

(declare-fun res!324121 () Bool)

(assert (=> b!527862 (=> (not res!324121) (not e!307614))))

(declare-fun lt!243041 () SeekEntryResult!4559)

(assert (=> b!527862 (= res!324121 (or (= lt!243041 (MissingZero!4559 i!1204)) (= lt!243041 (MissingVacant!4559 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33484 (_ BitVec 32)) SeekEntryResult!4559)

(assert (=> b!527862 (= lt!243041 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!527863 () Bool)

(declare-fun res!324130 () Bool)

(assert (=> b!527863 (=> (not res!324130) (not e!307616))))

(assert (=> b!527863 (= res!324130 (and (= (size!16456 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16456 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16456 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!527864 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33484 (_ BitVec 32)) SeekEntryResult!4559)

(assert (=> b!527864 (= e!307613 (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243045 (index!20456 lt!243038) (select (arr!16092 a!3235) j!176) a!3235 mask!3524) (Found!4559 j!176)))))

(declare-fun b!527865 () Bool)

(assert (=> b!527865 (= e!307619 (= (seekEntryOrOpen!0 (select (arr!16092 a!3235) j!176) a!3235 mask!3524) (Found!4559 j!176)))))

(declare-fun res!324128 () Bool)

(assert (=> start!47916 (=> (not res!324128) (not e!307616))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47916 (= res!324128 (validMask!0 mask!3524))))

(assert (=> start!47916 e!307616))

(assert (=> start!47916 true))

(declare-fun array_inv!11888 (array!33484) Bool)

(assert (=> start!47916 (array_inv!11888 a!3235)))

(declare-fun b!527858 () Bool)

(assert (=> b!527858 (= e!307617 false)))

(declare-fun b!527866 () Bool)

(declare-fun Unit!16691 () Unit!16688)

(assert (=> b!527866 (= e!307618 Unit!16691)))

(declare-fun b!527867 () Bool)

(declare-fun res!324125 () Bool)

(assert (=> b!527867 (=> (not res!324125) (not e!307616))))

(assert (=> b!527867 (= res!324125 (validKeyInArray!0 k!2280))))

(assert (= (and start!47916 res!324128) b!527863))

(assert (= (and b!527863 res!324130) b!527859))

(assert (= (and b!527859 res!324126) b!527867))

(assert (= (and b!527867 res!324125) b!527856))

(assert (= (and b!527856 res!324131) b!527862))

(assert (= (and b!527862 res!324121) b!527855))

(assert (= (and b!527855 res!324119) b!527854))

(assert (= (and b!527854 res!324123) b!527860))

(assert (= (and b!527860 res!324127) b!527865))

(assert (= (and b!527860 (not res!324120)) b!527857))

(assert (= (and b!527857 (not res!324122)) b!527853))

(assert (= (and b!527853 c!62174) b!527861))

(assert (= (and b!527853 (not c!62174)) b!527866))

(assert (= (and b!527861 res!324129) b!527858))

(assert (= (and b!527853 (not res!324124)) b!527864))

(declare-fun m!508521 () Bool)

(assert (=> b!527854 m!508521))

(declare-fun m!508523 () Bool)

(assert (=> b!527865 m!508523))

(assert (=> b!527865 m!508523))

(declare-fun m!508525 () Bool)

(assert (=> b!527865 m!508525))

(declare-fun m!508527 () Bool)

(assert (=> b!527861 m!508527))

(declare-fun m!508529 () Bool)

(assert (=> b!527861 m!508529))

(assert (=> b!527864 m!508523))

(assert (=> b!527864 m!508523))

(declare-fun m!508531 () Bool)

(assert (=> b!527864 m!508531))

(declare-fun m!508533 () Bool)

(assert (=> b!527853 m!508533))

(declare-fun m!508535 () Bool)

(assert (=> b!527853 m!508535))

(assert (=> b!527853 m!508523))

(declare-fun m!508537 () Bool)

(assert (=> start!47916 m!508537))

(declare-fun m!508539 () Bool)

(assert (=> start!47916 m!508539))

(declare-fun m!508541 () Bool)

(assert (=> b!527862 m!508541))

(declare-fun m!508543 () Bool)

(assert (=> b!527867 m!508543))

(declare-fun m!508545 () Bool)

(assert (=> b!527855 m!508545))

(declare-fun m!508547 () Bool)

(assert (=> b!527860 m!508547))

(declare-fun m!508549 () Bool)

(assert (=> b!527860 m!508549))

(declare-fun m!508551 () Bool)

(assert (=> b!527860 m!508551))

(assert (=> b!527860 m!508523))

(declare-fun m!508553 () Bool)

(assert (=> b!527860 m!508553))

(assert (=> b!527860 m!508523))

(assert (=> b!527860 m!508523))

(declare-fun m!508555 () Bool)

(assert (=> b!527860 m!508555))

(declare-fun m!508557 () Bool)

(assert (=> b!527860 m!508557))

(declare-fun m!508559 () Bool)

(assert (=> b!527860 m!508559))

(declare-fun m!508561 () Bool)

(assert (=> b!527860 m!508561))

(declare-fun m!508563 () Bool)

(assert (=> b!527856 m!508563))

(assert (=> b!527859 m!508523))

(assert (=> b!527859 m!508523))

(declare-fun m!508565 () Bool)

(assert (=> b!527859 m!508565))

(push 1)

(assert (not b!527865))

(assert (not b!527859))

(assert (not b!527860))

(assert (not b!527864))

(assert (not b!527867))

(assert (not b!527855))

(assert (not b!527854))

(assert (not b!527853))

(assert (not start!47916))

(assert (not b!527856))

(assert (not b!527861))

(assert (not b!527862))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!528006 () Bool)

(declare-fun e!307699 () SeekEntryResult!4559)

(assert (=> b!528006 (= e!307699 (MissingVacant!4559 (index!20456 lt!243038)))))

(declare-fun b!528007 () Bool)

(declare-fun e!307701 () SeekEntryResult!4559)

(declare-fun e!307700 () SeekEntryResult!4559)

(assert (=> b!528007 (= e!307701 e!307700)))

(declare-fun c!62197 () Bool)

(declare-fun lt!243121 () (_ BitVec 64))

(assert (=> b!528007 (= c!62197 (= lt!243121 (select (arr!16092 a!3235) j!176)))))

(declare-fun b!528008 () Bool)

(assert (=> b!528008 (= e!307700 (Found!4559 lt!243045))))

(declare-fun b!528009 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!528009 (= e!307699 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!243045 #b00000000000000000000000000000000 mask!3524) (index!20456 lt!243038) (select (arr!16092 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!528010 () Bool)

(declare-fun c!62196 () Bool)

(assert (=> b!528010 (= c!62196 (= lt!243121 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!528010 (= e!307700 e!307699)))

(declare-fun lt!243120 () SeekEntryResult!4559)

(declare-fun d!80897 () Bool)

(assert (=> d!80897 (and (or (is-Undefined!4559 lt!243120) (not (is-Found!4559 lt!243120)) (and (bvsge (index!20455 lt!243120) #b00000000000000000000000000000000) (bvslt (index!20455 lt!243120) (size!16456 a!3235)))) (or (is-Undefined!4559 lt!243120) (is-Found!4559 lt!243120) (not (is-MissingVacant!4559 lt!243120)) (not (= (index!20457 lt!243120) (index!20456 lt!243038))) (and (bvsge (index!20457 lt!243120) #b00000000000000000000000000000000) (bvslt (index!20457 lt!243120) (size!16456 a!3235)))) (or (is-Undefined!4559 lt!243120) (ite (is-Found!4559 lt!243120) (= (select (arr!16092 a!3235) (index!20455 lt!243120)) (select (arr!16092 a!3235) j!176)) (and (is-MissingVacant!4559 lt!243120) (= (index!20457 lt!243120) (index!20456 lt!243038)) (= (select (arr!16092 a!3235) (index!20457 lt!243120)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!80897 (= lt!243120 e!307701)))

(declare-fun c!62198 () Bool)

(assert (=> d!80897 (= c!62198 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80897 (= lt!243121 (select (arr!16092 a!3235) lt!243045))))

(assert (=> d!80897 (validMask!0 mask!3524)))

(assert (=> d!80897 (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243045 (index!20456 lt!243038) (select (arr!16092 a!3235) j!176) a!3235 mask!3524) lt!243120)))

(declare-fun b!528011 () Bool)

(assert (=> b!528011 (= e!307701 Undefined!4559)))

(assert (= (and d!80897 c!62198) b!528011))

(assert (= (and d!80897 (not c!62198)) b!528007))

(assert (= (and b!528007 c!62197) b!528008))

(assert (= (and b!528007 (not c!62197)) b!528010))

(assert (= (and b!528010 c!62196) b!528006))

(assert (= (and b!528010 (not c!62196)) b!528009))

(declare-fun m!508675 () Bool)

(assert (=> b!528009 m!508675))

(assert (=> b!528009 m!508675))

(assert (=> b!528009 m!508523))

(declare-fun m!508677 () Bool)

(assert (=> b!528009 m!508677))

(declare-fun m!508679 () Bool)

(assert (=> d!80897 m!508679))

(declare-fun m!508681 () Bool)

(assert (=> d!80897 m!508681))

(declare-fun m!508683 () Bool)

(assert (=> d!80897 m!508683))

(assert (=> d!80897 m!508537))

(assert (=> b!527864 d!80897))

(declare-fun d!80909 () Bool)

(assert (=> d!80909 (= (index!20456 lt!243038) i!1204)))

(declare-fun lt!243124 () Unit!16688)

(declare-fun choose!104 (array!33484 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16688)

(assert (=> d!80909 (= lt!243124 (choose!104 a!3235 i!1204 k!2280 j!176 lt!243045 #b00000000000000000000000000000000 (index!20456 lt!243038) (x!49424 lt!243038) mask!3524))))

(assert (=> d!80909 (validMask!0 mask!3524)))

(assert (=> d!80909 (= (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!243045 #b00000000000000000000000000000000 (index!20456 lt!243038) (x!49424 lt!243038) mask!3524) lt!243124)))

(declare-fun bs!16546 () Bool)

(assert (= bs!16546 d!80909))

(declare-fun m!508685 () Bool)

(assert (=> bs!16546 m!508685))

(assert (=> bs!16546 m!508537))

(assert (=> b!527853 d!80909))

(declare-fun d!80911 () Bool)

(declare-fun res!324233 () Bool)

(declare-fun e!307725 () Bool)

(assert (=> d!80911 (=> res!324233 e!307725)))

(assert (=> d!80911 (= res!324233 (bvsge #b00000000000000000000000000000000 (size!16456 a!3235)))))

(assert (=> d!80911 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!307725)))

(declare-fun b!528050 () Bool)

(declare-fun e!307724 () Bool)

(assert (=> b!528050 (= e!307725 e!307724)))

(declare-fun c!62216 () Bool)

(assert (=> b!528050 (= c!62216 (validKeyInArray!0 (select (arr!16092 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!528051 () Bool)

(declare-fun e!307723 () Bool)

(assert (=> b!528051 (= e!307724 e!307723)))

(declare-fun lt!243143 () (_ BitVec 64))

(assert (=> b!528051 (= lt!243143 (select (arr!16092 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!243144 () Unit!16688)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33484 (_ BitVec 64) (_ BitVec 32)) Unit!16688)

(assert (=> b!528051 (= lt!243144 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!243143 #b00000000000000000000000000000000))))

(assert (=> b!528051 (arrayContainsKey!0 a!3235 lt!243143 #b00000000000000000000000000000000)))

(declare-fun lt!243145 () Unit!16688)

(assert (=> b!528051 (= lt!243145 lt!243144)))

(declare-fun res!324232 () Bool)

(assert (=> b!528051 (= res!324232 (= (seekEntryOrOpen!0 (select (arr!16092 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4559 #b00000000000000000000000000000000)))))

(assert (=> b!528051 (=> (not res!324232) (not e!307723))))

(declare-fun bm!31892 () Bool)

(declare-fun call!31895 () Bool)

(assert (=> bm!31892 (= call!31895 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!528052 () Bool)

(assert (=> b!528052 (= e!307724 call!31895)))

(declare-fun b!528053 () Bool)

(assert (=> b!528053 (= e!307723 call!31895)))

(assert (= (and d!80911 (not res!324233)) b!528050))

(assert (= (and b!528050 c!62216) b!528051))

(assert (= (and b!528050 (not c!62216)) b!528052))

(assert (= (and b!528051 res!324232) b!528053))

(assert (= (or b!528053 b!528052) bm!31892))

(declare-fun m!508689 () Bool)

(assert (=> b!528050 m!508689))

(assert (=> b!528050 m!508689))

(declare-fun m!508695 () Bool)

(assert (=> b!528050 m!508695))

(assert (=> b!528051 m!508689))

(declare-fun m!508699 () Bool)

(assert (=> b!528051 m!508699))

(declare-fun m!508701 () Bool)

(assert (=> b!528051 m!508701))

(assert (=> b!528051 m!508689))

(declare-fun m!508705 () Bool)

(assert (=> b!528051 m!508705))

(declare-fun m!508707 () Bool)

(assert (=> bm!31892 m!508707))

(assert (=> b!527855 d!80911))

(declare-fun d!80915 () Bool)

(declare-fun lt!243170 () SeekEntryResult!4559)

(assert (=> d!80915 (and (or (is-Undefined!4559 lt!243170) (not (is-Found!4559 lt!243170)) (and (bvsge (index!20455 lt!243170) #b00000000000000000000000000000000) (bvslt (index!20455 lt!243170) (size!16456 a!3235)))) (or (is-Undefined!4559 lt!243170) (is-Found!4559 lt!243170) (not (is-MissingZero!4559 lt!243170)) (and (bvsge (index!20454 lt!243170) #b00000000000000000000000000000000) (bvslt (index!20454 lt!243170) (size!16456 a!3235)))) (or (is-Undefined!4559 lt!243170) (is-Found!4559 lt!243170) (is-MissingZero!4559 lt!243170) (not (is-MissingVacant!4559 lt!243170)) (and (bvsge (index!20457 lt!243170) #b00000000000000000000000000000000) (bvslt (index!20457 lt!243170) (size!16456 a!3235)))) (or (is-Undefined!4559 lt!243170) (ite (is-Found!4559 lt!243170) (= (select (arr!16092 a!3235) (index!20455 lt!243170)) (select (arr!16092 a!3235) j!176)) (ite (is-MissingZero!4559 lt!243170) (= (select (arr!16092 a!3235) (index!20454 lt!243170)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4559 lt!243170) (= (select (arr!16092 a!3235) (index!20457 lt!243170)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!307768 () SeekEntryResult!4559)

(assert (=> d!80915 (= lt!243170 e!307768)))

(declare-fun c!62239 () Bool)

(declare-fun lt!243172 () SeekEntryResult!4559)

(assert (=> d!80915 (= c!62239 (and (is-Intermediate!4559 lt!243172) (undefined!5371 lt!243172)))))

(assert (=> d!80915 (= lt!243172 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16092 a!3235) j!176) mask!3524) (select (arr!16092 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80915 (validMask!0 mask!3524)))

(assert (=> d!80915 (= (seekEntryOrOpen!0 (select (arr!16092 a!3235) j!176) a!3235 mask!3524) lt!243170)))

(declare-fun b!528115 () Bool)

(assert (=> b!528115 (= e!307768 Undefined!4559)))

(declare-fun b!528116 () Bool)

(declare-fun c!62237 () Bool)

(declare-fun lt!243171 () (_ BitVec 64))

(assert (=> b!528116 (= c!62237 (= lt!243171 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!307767 () SeekEntryResult!4559)

(declare-fun e!307769 () SeekEntryResult!4559)

(assert (=> b!528116 (= e!307767 e!307769)))

(declare-fun b!528117 () Bool)

(assert (=> b!528117 (= e!307768 e!307767)))

(assert (=> b!528117 (= lt!243171 (select (arr!16092 a!3235) (index!20456 lt!243172)))))

(declare-fun c!62238 () Bool)

(assert (=> b!528117 (= c!62238 (= lt!243171 (select (arr!16092 a!3235) j!176)))))

(declare-fun b!528118 () Bool)

(assert (=> b!528118 (= e!307767 (Found!4559 (index!20456 lt!243172)))))

(declare-fun b!528119 () Bool)

(assert (=> b!528119 (= e!307769 (seekKeyOrZeroReturnVacant!0 (x!49424 lt!243172) (index!20456 lt!243172) (index!20456 lt!243172) (select (arr!16092 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!528120 () Bool)

(assert (=> b!528120 (= e!307769 (MissingZero!4559 (index!20456 lt!243172)))))

(assert (= (and d!80915 c!62239) b!528115))

(assert (= (and d!80915 (not c!62239)) b!528117))

(assert (= (and b!528117 c!62238) b!528118))

(assert (= (and b!528117 (not c!62238)) b!528116))

(assert (= (and b!528116 c!62237) b!528120))

(assert (= (and b!528116 (not c!62237)) b!528119))

(assert (=> d!80915 m!508523))

(assert (=> d!80915 m!508553))

(assert (=> d!80915 m!508553))

(assert (=> d!80915 m!508523))

(declare-fun m!508755 () Bool)

(assert (=> d!80915 m!508755))

(declare-fun m!508757 () Bool)

(assert (=> d!80915 m!508757))

(declare-fun m!508759 () Bool)

(assert (=> d!80915 m!508759))

(assert (=> d!80915 m!508537))

(declare-fun m!508761 () Bool)

(assert (=> d!80915 m!508761))

(declare-fun m!508763 () Bool)

(assert (=> b!528117 m!508763))

(assert (=> b!528119 m!508523))

(declare-fun m!508765 () Bool)

(assert (=> b!528119 m!508765))

(assert (=> b!527865 d!80915))

(declare-fun b!528139 () Bool)

(declare-fun e!307785 () Bool)

(declare-fun contains!2778 (List!10250 (_ BitVec 64)) Bool)

(assert (=> b!528139 (= e!307785 (contains!2778 Nil!10247 (select (arr!16092 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80927 () Bool)

(declare-fun res!324267 () Bool)

(declare-fun e!307788 () Bool)

(assert (=> d!80927 (=> res!324267 e!307788)))

(assert (=> d!80927 (= res!324267 (bvsge #b00000000000000000000000000000000 (size!16456 a!3235)))))

(assert (=> d!80927 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10247) e!307788)))

(declare-fun b!528140 () Bool)

(declare-fun e!307787 () Bool)

(assert (=> b!528140 (= e!307788 e!307787)))

(declare-fun res!324268 () Bool)

(assert (=> b!528140 (=> (not res!324268) (not e!307787))))

(assert (=> b!528140 (= res!324268 (not e!307785))))

(declare-fun res!324269 () Bool)

(assert (=> b!528140 (=> (not res!324269) (not e!307785))))

(assert (=> b!528140 (= res!324269 (validKeyInArray!0 (select (arr!16092 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31904 () Bool)

(declare-fun call!31907 () Bool)

(declare-fun c!62243 () Bool)

(assert (=> bm!31904 (= call!31907 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62243 (Cons!10246 (select (arr!16092 a!3235) #b00000000000000000000000000000000) Nil!10247) Nil!10247)))))

(declare-fun b!528141 () Bool)

(declare-fun e!307786 () Bool)

(assert (=> b!528141 (= e!307787 e!307786)))

(assert (=> b!528141 (= c!62243 (validKeyInArray!0 (select (arr!16092 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!528142 () Bool)

(assert (=> b!528142 (= e!307786 call!31907)))

(declare-fun b!528143 () Bool)

(assert (=> b!528143 (= e!307786 call!31907)))

(assert (= (and d!80927 (not res!324267)) b!528140))

(assert (= (and b!528140 res!324269) b!528139))

(assert (= (and b!528140 res!324268) b!528141))

(assert (= (and b!528141 c!62243) b!528143))

(assert (= (and b!528141 (not c!62243)) b!528142))

(assert (= (or b!528143 b!528142) bm!31904))

(assert (=> b!528139 m!508689))

(assert (=> b!528139 m!508689))

(declare-fun m!508775 () Bool)

(assert (=> b!528139 m!508775))

(assert (=> b!528140 m!508689))

(assert (=> b!528140 m!508689))

(assert (=> b!528140 m!508695))

(assert (=> bm!31904 m!508689))

(declare-fun m!508777 () Bool)

(assert (=> bm!31904 m!508777))

(assert (=> b!528141 m!508689))

(assert (=> b!528141 m!508689))

(assert (=> b!528141 m!508695))

(assert (=> b!527854 d!80927))

(declare-fun d!80933 () Bool)

(assert (=> d!80933 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!527867 d!80933))

(declare-fun d!80935 () Bool)

(declare-fun res!324274 () Bool)

(declare-fun e!307793 () Bool)

(assert (=> d!80935 (=> res!324274 e!307793)))

(assert (=> d!80935 (= res!324274 (= (select (arr!16092 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!80935 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!307793)))

(declare-fun b!528148 () Bool)

(declare-fun e!307794 () Bool)

(assert (=> b!528148 (= e!307793 e!307794)))

(declare-fun res!324275 () Bool)

(assert (=> b!528148 (=> (not res!324275) (not e!307794))))

(assert (=> b!528148 (= res!324275 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16456 a!3235)))))

(declare-fun b!528149 () Bool)

(assert (=> b!528149 (= e!307794 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80935 (not res!324274)) b!528148))

(assert (= (and b!528148 res!324275) b!528149))

(assert (=> d!80935 m!508689))

(declare-fun m!508779 () Bool)

(assert (=> b!528149 m!508779))

(assert (=> b!527856 d!80935))

(declare-fun d!80937 () Bool)

(assert (=> d!80937 (= (validKeyInArray!0 (select (arr!16092 a!3235) j!176)) (and (not (= (select (arr!16092 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16092 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!527859 d!80937))

(declare-fun d!80939 () Bool)

(declare-fun res!324277 () Bool)

(declare-fun e!307797 () Bool)

(assert (=> d!80939 (=> res!324277 e!307797)))

(assert (=> d!80939 (= res!324277 (bvsge j!176 (size!16456 a!3235)))))

(assert (=> d!80939 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!307797)))

(declare-fun b!528150 () Bool)

(declare-fun e!307796 () Bool)

(assert (=> b!528150 (= e!307797 e!307796)))

(declare-fun c!62244 () Bool)

(assert (=> b!528150 (= c!62244 (validKeyInArray!0 (select (arr!16092 a!3235) j!176)))))

(declare-fun b!528151 () Bool)

(declare-fun e!307795 () Bool)

(assert (=> b!528151 (= e!307796 e!307795)))

(declare-fun lt!243176 () (_ BitVec 64))

(assert (=> b!528151 (= lt!243176 (select (arr!16092 a!3235) j!176))))

(declare-fun lt!243177 () Unit!16688)

(assert (=> b!528151 (= lt!243177 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!243176 j!176))))

(assert (=> b!528151 (arrayContainsKey!0 a!3235 lt!243176 #b00000000000000000000000000000000)))

(declare-fun lt!243178 () Unit!16688)

(assert (=> b!528151 (= lt!243178 lt!243177)))

(declare-fun res!324276 () Bool)

(assert (=> b!528151 (= res!324276 (= (seekEntryOrOpen!0 (select (arr!16092 a!3235) j!176) a!3235 mask!3524) (Found!4559 j!176)))))

(assert (=> b!528151 (=> (not res!324276) (not e!307795))))

(declare-fun call!31908 () Bool)

(declare-fun bm!31905 () Bool)

(assert (=> bm!31905 (= call!31908 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!528152 () Bool)

(assert (=> b!528152 (= e!307796 call!31908)))

(declare-fun b!528153 () Bool)

(assert (=> b!528153 (= e!307795 call!31908)))

(assert (= (and d!80939 (not res!324277)) b!528150))

(assert (= (and b!528150 c!62244) b!528151))

(assert (= (and b!528150 (not c!62244)) b!528152))

(assert (= (and b!528151 res!324276) b!528153))

(assert (= (or b!528153 b!528152) bm!31905))

(assert (=> b!528150 m!508523))

(assert (=> b!528150 m!508523))

(assert (=> b!528150 m!508565))

(assert (=> b!528151 m!508523))

(declare-fun m!508781 () Bool)

(assert (=> b!528151 m!508781))

(declare-fun m!508783 () Bool)

(assert (=> b!528151 m!508783))

(assert (=> b!528151 m!508523))

(assert (=> b!528151 m!508525))

(declare-fun m!508785 () Bool)

(assert (=> bm!31905 m!508785))

(assert (=> b!527860 d!80939))

(declare-fun d!80941 () Bool)

(declare-fun lt!243188 () (_ BitVec 32))

(declare-fun lt!243187 () (_ BitVec 32))

(assert (=> d!80941 (= lt!243188 (bvmul (bvxor lt!243187 (bvlshr lt!243187 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80941 (= lt!243187 ((_ extract 31 0) (bvand (bvxor lt!243037 (bvlshr lt!243037 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80941 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!324278 (let ((h!11183 ((_ extract 31 0) (bvand (bvxor lt!243037 (bvlshr lt!243037 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49434 (bvmul (bvxor h!11183 (bvlshr h!11183 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49434 (bvlshr x!49434 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!324278 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!324278 #b00000000000000000000000000000000))))))

(assert (=> d!80941 (= (toIndex!0 lt!243037 mask!3524) (bvand (bvxor lt!243188 (bvlshr lt!243188 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!527860 d!80941))

(declare-fun d!80943 () Bool)

(assert (=> d!80943 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!243196 () Unit!16688)

(declare-fun choose!38 (array!33484 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16688)

(assert (=> d!80943 (= lt!243196 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80943 (validMask!0 mask!3524)))

(assert (=> d!80943 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!243196)))

(declare-fun bs!16549 () Bool)

(assert (= bs!16549 d!80943))

(assert (=> bs!16549 m!508557))

(declare-fun m!508797 () Bool)

(assert (=> bs!16549 m!508797))

(assert (=> bs!16549 m!508537))

(assert (=> b!527860 d!80943))

(declare-fun b!528251 () Bool)

(declare-fun lt!243235 () SeekEntryResult!4559)

(assert (=> b!528251 (and (bvsge (index!20456 lt!243235) #b00000000000000000000000000000000) (bvslt (index!20456 lt!243235) (size!16456 a!3235)))))

(declare-fun res!324311 () Bool)

(assert (=> b!528251 (= res!324311 (= (select (arr!16092 a!3235) (index!20456 lt!243235)) (select (arr!16092 a!3235) j!176)))))

(declare-fun e!307856 () Bool)

(assert (=> b!528251 (=> res!324311 e!307856)))

(declare-fun e!307855 () Bool)

(assert (=> b!528251 (= e!307855 e!307856)))

(declare-fun b!528252 () Bool)

(declare-fun e!307854 () SeekEntryResult!4559)

(assert (=> b!528252 (= e!307854 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!243045 #b00000000000000000000000000000000 mask!3524) (select (arr!16092 a!3235) j!176) a!3235 mask!3524))))

(declare-fun d!80951 () Bool)

(declare-fun e!307858 () Bool)

(assert (=> d!80951 e!307858))

(declare-fun c!62281 () Bool)

(assert (=> d!80951 (= c!62281 (and (is-Intermediate!4559 lt!243235) (undefined!5371 lt!243235)))))

(declare-fun e!307857 () SeekEntryResult!4559)

(assert (=> d!80951 (= lt!243235 e!307857)))

(declare-fun c!62280 () Bool)

(assert (=> d!80951 (= c!62280 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!243234 () (_ BitVec 64))

(assert (=> d!80951 (= lt!243234 (select (arr!16092 a!3235) lt!243045))))

(assert (=> d!80951 (validMask!0 mask!3524)))

(assert (=> d!80951 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243045 (select (arr!16092 a!3235) j!176) a!3235 mask!3524) lt!243235)))

(declare-fun b!528253 () Bool)

(assert (=> b!528253 (= e!307858 e!307855)))

(declare-fun res!324310 () Bool)

(assert (=> b!528253 (= res!324310 (and (is-Intermediate!4559 lt!243235) (not (undefined!5371 lt!243235)) (bvslt (x!49424 lt!243235) #b01111111111111111111111111111110) (bvsge (x!49424 lt!243235) #b00000000000000000000000000000000) (bvsge (x!49424 lt!243235) #b00000000000000000000000000000000)))))

(assert (=> b!528253 (=> (not res!324310) (not e!307855))))

(declare-fun b!528254 () Bool)

(assert (=> b!528254 (and (bvsge (index!20456 lt!243235) #b00000000000000000000000000000000) (bvslt (index!20456 lt!243235) (size!16456 a!3235)))))

(assert (=> b!528254 (= e!307856 (= (select (arr!16092 a!3235) (index!20456 lt!243235)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!528255 () Bool)

(assert (=> b!528255 (= e!307857 (Intermediate!4559 true lt!243045 #b00000000000000000000000000000000))))

(declare-fun b!528256 () Bool)

(assert (=> b!528256 (= e!307858 (bvsge (x!49424 lt!243235) #b01111111111111111111111111111110))))

(declare-fun b!528257 () Bool)

(assert (=> b!528257 (= e!307857 e!307854)))

(declare-fun c!62279 () Bool)

(assert (=> b!528257 (= c!62279 (or (= lt!243234 (select (arr!16092 a!3235) j!176)) (= (bvadd lt!243234 lt!243234) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!528258 () Bool)

(assert (=> b!528258 (and (bvsge (index!20456 lt!243235) #b00000000000000000000000000000000) (bvslt (index!20456 lt!243235) (size!16456 a!3235)))))

(declare-fun res!324309 () Bool)

(assert (=> b!528258 (= res!324309 (= (select (arr!16092 a!3235) (index!20456 lt!243235)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!528258 (=> res!324309 e!307856)))

(declare-fun b!528259 () Bool)

(assert (=> b!528259 (= e!307854 (Intermediate!4559 false lt!243045 #b00000000000000000000000000000000))))

(assert (= (and d!80951 c!62280) b!528255))

(assert (= (and d!80951 (not c!62280)) b!528257))

(assert (= (and b!528257 c!62279) b!528259))

(assert (= (and b!528257 (not c!62279)) b!528252))

(assert (= (and d!80951 c!62281) b!528256))

(assert (= (and d!80951 (not c!62281)) b!528253))

(assert (= (and b!528253 res!324310) b!528251))

(assert (= (and b!528251 (not res!324311)) b!528258))

(assert (= (and b!528258 (not res!324309)) b!528254))

(assert (=> b!528252 m!508675))

(assert (=> b!528252 m!508675))

(assert (=> b!528252 m!508523))

(declare-fun m!508833 () Bool)

(assert (=> b!528252 m!508833))

(declare-fun m!508835 () Bool)

(assert (=> b!528258 m!508835))

(assert (=> d!80951 m!508683))

(assert (=> d!80951 m!508537))

(assert (=> b!528251 m!508835))

(assert (=> b!528254 m!508835))

(assert (=> b!527860 d!80951))

(declare-fun d!80967 () Bool)

(declare-fun lt!243237 () (_ BitVec 32))

(declare-fun lt!243236 () (_ BitVec 32))

(assert (=> d!80967 (= lt!243237 (bvmul (bvxor lt!243236 (bvlshr lt!243236 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80967 (= lt!243236 ((_ extract 31 0) (bvand (bvxor (select (arr!16092 a!3235) j!176) (bvlshr (select (arr!16092 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80967 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!324278 (let ((h!11183 ((_ extract 31 0) (bvand (bvxor (select (arr!16092 a!3235) j!176) (bvlshr (select (arr!16092 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49434 (bvmul (bvxor h!11183 (bvlshr h!11183 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49434 (bvlshr x!49434 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!324278 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!324278 #b00000000000000000000000000000000))))))

(assert (=> d!80967 (= (toIndex!0 (select (arr!16092 a!3235) j!176) mask!3524) (bvand (bvxor lt!243237 (bvlshr lt!243237 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!527860 d!80967))

(declare-fun b!528260 () Bool)

(declare-fun lt!243239 () SeekEntryResult!4559)

(assert (=> b!528260 (and (bvsge (index!20456 lt!243239) #b00000000000000000000000000000000) (bvslt (index!20456 lt!243239) (size!16456 lt!243044)))))

(declare-fun res!324314 () Bool)

(assert (=> b!528260 (= res!324314 (= (select (arr!16092 lt!243044) (index!20456 lt!243239)) lt!243037))))

(declare-fun e!307861 () Bool)

(assert (=> b!528260 (=> res!324314 e!307861)))

(declare-fun e!307860 () Bool)

(assert (=> b!528260 (= e!307860 e!307861)))

(declare-fun e!307859 () SeekEntryResult!4559)

(declare-fun b!528261 () Bool)

(assert (=> b!528261 (= e!307859 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!243043 #b00000000000000000000000000000000 mask!3524) lt!243037 lt!243044 mask!3524))))

(declare-fun d!80969 () Bool)

(declare-fun e!307863 () Bool)

(assert (=> d!80969 e!307863))

(declare-fun c!62284 () Bool)

(assert (=> d!80969 (= c!62284 (and (is-Intermediate!4559 lt!243239) (undefined!5371 lt!243239)))))

(declare-fun e!307862 () SeekEntryResult!4559)

(assert (=> d!80969 (= lt!243239 e!307862)))

(declare-fun c!62283 () Bool)

(assert (=> d!80969 (= c!62283 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!243238 () (_ BitVec 64))

(assert (=> d!80969 (= lt!243238 (select (arr!16092 lt!243044) lt!243043))))

(assert (=> d!80969 (validMask!0 mask!3524)))

(assert (=> d!80969 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243043 lt!243037 lt!243044 mask!3524) lt!243239)))

(declare-fun b!528262 () Bool)

(assert (=> b!528262 (= e!307863 e!307860)))

(declare-fun res!324313 () Bool)

(assert (=> b!528262 (= res!324313 (and (is-Intermediate!4559 lt!243239) (not (undefined!5371 lt!243239)) (bvslt (x!49424 lt!243239) #b01111111111111111111111111111110) (bvsge (x!49424 lt!243239) #b00000000000000000000000000000000) (bvsge (x!49424 lt!243239) #b00000000000000000000000000000000)))))

(assert (=> b!528262 (=> (not res!324313) (not e!307860))))

(declare-fun b!528263 () Bool)

(assert (=> b!528263 (and (bvsge (index!20456 lt!243239) #b00000000000000000000000000000000) (bvslt (index!20456 lt!243239) (size!16456 lt!243044)))))

(assert (=> b!528263 (= e!307861 (= (select (arr!16092 lt!243044) (index!20456 lt!243239)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!528264 () Bool)

(assert (=> b!528264 (= e!307862 (Intermediate!4559 true lt!243043 #b00000000000000000000000000000000))))

(declare-fun b!528265 () Bool)

(assert (=> b!528265 (= e!307863 (bvsge (x!49424 lt!243239) #b01111111111111111111111111111110))))

(declare-fun b!528266 () Bool)

(assert (=> b!528266 (= e!307862 e!307859)))

(declare-fun c!62282 () Bool)

(assert (=> b!528266 (= c!62282 (or (= lt!243238 lt!243037) (= (bvadd lt!243238 lt!243238) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!528267 () Bool)

(assert (=> b!528267 (and (bvsge (index!20456 lt!243239) #b00000000000000000000000000000000) (bvslt (index!20456 lt!243239) (size!16456 lt!243044)))))

(declare-fun res!324312 () Bool)

(assert (=> b!528267 (= res!324312 (= (select (arr!16092 lt!243044) (index!20456 lt!243239)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!528267 (=> res!324312 e!307861)))

(declare-fun b!528268 () Bool)

(assert (=> b!528268 (= e!307859 (Intermediate!4559 false lt!243043 #b00000000000000000000000000000000))))

(assert (= (and d!80969 c!62283) b!528264))

(assert (= (and d!80969 (not c!62283)) b!528266))

(assert (= (and b!528266 c!62282) b!528268))

(assert (= (and b!528266 (not c!62282)) b!528261))

(assert (= (and d!80969 c!62284) b!528265))

(assert (= (and d!80969 (not c!62284)) b!528262))

(assert (= (and b!528262 res!324313) b!528260))

(assert (= (and b!528260 (not res!324314)) b!528267))

(assert (= (and b!528267 (not res!324312)) b!528263))

(declare-fun m!508837 () Bool)

(assert (=> b!528261 m!508837))

(assert (=> b!528261 m!508837))

(declare-fun m!508839 () Bool)

(assert (=> b!528261 m!508839))

(declare-fun m!508841 () Bool)

(assert (=> b!528267 m!508841))

(declare-fun m!508843 () Bool)

(assert (=> d!80969 m!508843))

(assert (=> d!80969 m!508537))

(assert (=> b!528260 m!508841))

(assert (=> b!528263 m!508841))

(assert (=> b!527860 d!80969))

(declare-fun d!80971 () Bool)

(declare-fun e!307866 () Bool)

(assert (=> d!80971 e!307866))

(declare-fun res!324317 () Bool)

(assert (=> d!80971 (=> (not res!324317) (not e!307866))))

(assert (=> d!80971 (= res!324317 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16456 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16456 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16456 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16456 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16456 a!3235))))))

(declare-fun lt!243242 () Unit!16688)

(declare-fun choose!47 (array!33484 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16688)

(assert (=> d!80971 (= lt!243242 (choose!47 a!3235 i!1204 k!2280 j!176 lt!243045 #b00000000000000000000000000000000 (index!20456 lt!243038) (x!49424 lt!243038) mask!3524))))

(assert (=> d!80971 (validMask!0 mask!3524)))

(assert (=> d!80971 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!243045 #b00000000000000000000000000000000 (index!20456 lt!243038) (x!49424 lt!243038) mask!3524) lt!243242)))

(declare-fun b!528271 () Bool)

(assert (=> b!528271 (= e!307866 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243045 (select (store (arr!16092 a!3235) i!1204 k!2280) j!176) (array!33485 (store (arr!16092 a!3235) i!1204 k!2280) (size!16456 a!3235)) mask!3524) (Intermediate!4559 false (index!20456 lt!243038) (x!49424 lt!243038))))))

(assert (= (and d!80971 res!324317) b!528271))

(declare-fun m!508845 () Bool)

(assert (=> d!80971 m!508845))

(assert (=> d!80971 m!508537))

(assert (=> b!528271 m!508547))

(assert (=> b!528271 m!508549))

(assert (=> b!528271 m!508549))

(declare-fun m!508847 () Bool)

(assert (=> b!528271 m!508847))

(assert (=> b!527861 d!80971))

(declare-fun b!528272 () Bool)

(declare-fun lt!243244 () SeekEntryResult!4559)

(assert (=> b!528272 (and (bvsge (index!20456 lt!243244) #b00000000000000000000000000000000) (bvslt (index!20456 lt!243244) (size!16456 lt!243044)))))

(declare-fun res!324320 () Bool)

(assert (=> b!528272 (= res!324320 (= (select (arr!16092 lt!243044) (index!20456 lt!243244)) lt!243037))))

(declare-fun e!307869 () Bool)

(assert (=> b!528272 (=> res!324320 e!307869)))

(declare-fun e!307868 () Bool)

(assert (=> b!528272 (= e!307868 e!307869)))

(declare-fun e!307867 () SeekEntryResult!4559)

(declare-fun b!528273 () Bool)

(assert (=> b!528273 (= e!307867 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!243045 #b00000000000000000000000000000000 mask!3524) lt!243037 lt!243044 mask!3524))))

(declare-fun d!80977 () Bool)

(declare-fun e!307871 () Bool)

(assert (=> d!80977 e!307871))

(declare-fun c!62287 () Bool)

(assert (=> d!80977 (= c!62287 (and (is-Intermediate!4559 lt!243244) (undefined!5371 lt!243244)))))

(declare-fun e!307870 () SeekEntryResult!4559)

(assert (=> d!80977 (= lt!243244 e!307870)))

(declare-fun c!62286 () Bool)

(assert (=> d!80977 (= c!62286 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!243243 () (_ BitVec 64))

(assert (=> d!80977 (= lt!243243 (select (arr!16092 lt!243044) lt!243045))))

(assert (=> d!80977 (validMask!0 mask!3524)))

(assert (=> d!80977 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243045 lt!243037 lt!243044 mask!3524) lt!243244)))

(declare-fun b!528274 () Bool)

(assert (=> b!528274 (= e!307871 e!307868)))

(declare-fun res!324319 () Bool)

(assert (=> b!528274 (= res!324319 (and (is-Intermediate!4559 lt!243244) (not (undefined!5371 lt!243244)) (bvslt (x!49424 lt!243244) #b01111111111111111111111111111110) (bvsge (x!49424 lt!243244) #b00000000000000000000000000000000) (bvsge (x!49424 lt!243244) #b00000000000000000000000000000000)))))

(assert (=> b!528274 (=> (not res!324319) (not e!307868))))

(declare-fun b!528275 () Bool)

(assert (=> b!528275 (and (bvsge (index!20456 lt!243244) #b00000000000000000000000000000000) (bvslt (index!20456 lt!243244) (size!16456 lt!243044)))))

(assert (=> b!528275 (= e!307869 (= (select (arr!16092 lt!243044) (index!20456 lt!243244)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!528276 () Bool)

(assert (=> b!528276 (= e!307870 (Intermediate!4559 true lt!243045 #b00000000000000000000000000000000))))

(declare-fun b!528277 () Bool)

(assert (=> b!528277 (= e!307871 (bvsge (x!49424 lt!243244) #b01111111111111111111111111111110))))

(declare-fun b!528278 () Bool)

(assert (=> b!528278 (= e!307870 e!307867)))

(declare-fun c!62285 () Bool)

(assert (=> b!528278 (= c!62285 (or (= lt!243243 lt!243037) (= (bvadd lt!243243 lt!243243) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!528279 () Bool)

(assert (=> b!528279 (and (bvsge (index!20456 lt!243244) #b00000000000000000000000000000000) (bvslt (index!20456 lt!243244) (size!16456 lt!243044)))))

(declare-fun res!324318 () Bool)

(assert (=> b!528279 (= res!324318 (= (select (arr!16092 lt!243044) (index!20456 lt!243244)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!528279 (=> res!324318 e!307869)))

(declare-fun b!528280 () Bool)

(assert (=> b!528280 (= e!307867 (Intermediate!4559 false lt!243045 #b00000000000000000000000000000000))))

(assert (= (and d!80977 c!62286) b!528276))

(assert (= (and d!80977 (not c!62286)) b!528278))

(assert (= (and b!528278 c!62285) b!528280))

(assert (= (and b!528278 (not c!62285)) b!528273))

(assert (= (and d!80977 c!62287) b!528277))

(assert (= (and d!80977 (not c!62287)) b!528274))

(assert (= (and b!528274 res!324319) b!528272))

(assert (= (and b!528272 (not res!324320)) b!528279))

(assert (= (and b!528279 (not res!324318)) b!528275))

(assert (=> b!528273 m!508675))

(assert (=> b!528273 m!508675))

(declare-fun m!508849 () Bool)

(assert (=> b!528273 m!508849))

(declare-fun m!508851 () Bool)

(assert (=> b!528279 m!508851))

(declare-fun m!508853 () Bool)

(assert (=> d!80977 m!508853))

(assert (=> d!80977 m!508537))

(assert (=> b!528272 m!508851))

(assert (=> b!528275 m!508851))

(assert (=> b!527861 d!80977))

(declare-fun d!80979 () Bool)

(assert (=> d!80979 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47916 d!80979))

(declare-fun d!80983 () Bool)

(assert (=> d!80983 (= (array_inv!11888 a!3235) (bvsge (size!16456 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47916 d!80983))

(declare-fun d!80985 () Bool)

