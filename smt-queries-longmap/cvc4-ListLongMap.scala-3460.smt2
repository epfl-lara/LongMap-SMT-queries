; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48034 () Bool)

(assert start!48034)

(declare-fun b!529223 () Bool)

(declare-fun res!325115 () Bool)

(declare-fun e!308379 () Bool)

(assert (=> b!529223 (=> res!325115 e!308379)))

(declare-fun e!308381 () Bool)

(assert (=> b!529223 (= res!325115 e!308381)))

(declare-fun res!325122 () Bool)

(assert (=> b!529223 (=> (not res!325122) (not e!308381))))

(declare-datatypes ((SeekEntryResult!4579 0))(
  ( (MissingZero!4579 (index!20540 (_ BitVec 32))) (Found!4579 (index!20541 (_ BitVec 32))) (Intermediate!4579 (undefined!5391 Bool) (index!20542 (_ BitVec 32)) (x!49507 (_ BitVec 32))) (Undefined!4579) (MissingVacant!4579 (index!20543 (_ BitVec 32))) )
))
(declare-fun lt!243972 () SeekEntryResult!4579)

(assert (=> b!529223 (= res!325122 (bvsgt #b00000000000000000000000000000000 (x!49507 lt!243972)))))

(declare-fun b!529224 () Bool)

(declare-fun e!308378 () Bool)

(assert (=> b!529224 (= e!308378 false)))

(declare-fun b!529225 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!243975 () SeekEntryResult!4579)

(declare-datatypes ((array!33527 0))(
  ( (array!33528 (arr!16112 (Array (_ BitVec 32) (_ BitVec 64))) (size!16476 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33527)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!243979 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33527 (_ BitVec 32)) SeekEntryResult!4579)

(assert (=> b!529225 (= e!308381 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243979 (index!20542 lt!243972) (select (arr!16112 a!3235) j!176) a!3235 mask!3524) lt!243975)))))

(declare-fun b!529226 () Bool)

(declare-fun e!308382 () Bool)

(declare-fun e!308376 () Bool)

(assert (=> b!529226 (= e!308382 (not e!308376))))

(declare-fun res!325124 () Bool)

(assert (=> b!529226 (=> res!325124 e!308376)))

(declare-fun lt!243974 () SeekEntryResult!4579)

(assert (=> b!529226 (= res!325124 (or (= lt!243972 lt!243974) (undefined!5391 lt!243972) (not (is-Intermediate!4579 lt!243972))))))

(declare-fun lt!243967 () (_ BitVec 32))

(declare-fun lt!243970 () array!33527)

(declare-fun lt!243966 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33527 (_ BitVec 32)) SeekEntryResult!4579)

(assert (=> b!529226 (= lt!243974 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243967 lt!243966 lt!243970 mask!3524))))

(assert (=> b!529226 (= lt!243972 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243979 (select (arr!16112 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529226 (= lt!243967 (toIndex!0 lt!243966 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!529226 (= lt!243966 (select (store (arr!16112 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!529226 (= lt!243979 (toIndex!0 (select (arr!16112 a!3235) j!176) mask!3524))))

(assert (=> b!529226 (= lt!243970 (array!33528 (store (arr!16112 a!3235) i!1204 k!2280) (size!16476 a!3235)))))

(declare-fun lt!243968 () SeekEntryResult!4579)

(assert (=> b!529226 (= lt!243968 lt!243975)))

(assert (=> b!529226 (= lt!243975 (Found!4579 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33527 (_ BitVec 32)) SeekEntryResult!4579)

(assert (=> b!529226 (= lt!243968 (seekEntryOrOpen!0 (select (arr!16112 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33527 (_ BitVec 32)) Bool)

(assert (=> b!529226 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!16768 0))(
  ( (Unit!16769) )
))
(declare-fun lt!243973 () Unit!16768)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33527 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16768)

(assert (=> b!529226 (= lt!243973 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529227 () Bool)

(declare-fun e!308377 () Unit!16768)

(declare-fun Unit!16770 () Unit!16768)

(assert (=> b!529227 (= e!308377 Unit!16770)))

(declare-fun b!529228 () Bool)

(declare-fun res!325120 () Bool)

(declare-fun e!308380 () Bool)

(assert (=> b!529228 (=> (not res!325120) (not e!308380))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529228 (= res!325120 (validKeyInArray!0 (select (arr!16112 a!3235) j!176)))))

(declare-fun b!529229 () Bool)

(declare-fun lt!243965 () SeekEntryResult!4579)

(assert (=> b!529229 (= e!308379 (= lt!243968 lt!243965))))

(assert (=> b!529229 (= lt!243965 lt!243975)))

(assert (=> b!529229 (= lt!243965 (seekEntryOrOpen!0 lt!243966 lt!243970 mask!3524))))

(declare-fun lt!243976 () Unit!16768)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!33527 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16768)

(assert (=> b!529229 (= lt!243976 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k!2280 j!176 lt!243979 #b00000000000000000000000000000000 (index!20542 lt!243972) (x!49507 lt!243972) mask!3524))))

(declare-fun b!529230 () Bool)

(declare-fun res!325125 () Bool)

(assert (=> b!529230 (=> (not res!325125) (not e!308380))))

(declare-fun arrayContainsKey!0 (array!33527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529230 (= res!325125 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!529231 () Bool)

(declare-fun res!325118 () Bool)

(assert (=> b!529231 (=> (not res!325118) (not e!308382))))

(declare-datatypes ((List!10270 0))(
  ( (Nil!10267) (Cons!10266 (h!11203 (_ BitVec 64)) (t!16498 List!10270)) )
))
(declare-fun arrayNoDuplicates!0 (array!33527 (_ BitVec 32) List!10270) Bool)

(assert (=> b!529231 (= res!325118 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10267))))

(declare-fun b!529232 () Bool)

(assert (=> b!529232 (= e!308380 e!308382)))

(declare-fun res!325123 () Bool)

(assert (=> b!529232 (=> (not res!325123) (not e!308382))))

(declare-fun lt!243977 () SeekEntryResult!4579)

(assert (=> b!529232 (= res!325123 (or (= lt!243977 (MissingZero!4579 i!1204)) (= lt!243977 (MissingVacant!4579 i!1204))))))

(assert (=> b!529232 (= lt!243977 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!529233 () Bool)

(declare-fun Unit!16771 () Unit!16768)

(assert (=> b!529233 (= e!308377 Unit!16771)))

(declare-fun lt!243978 () Unit!16768)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33527 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16768)

(assert (=> b!529233 (= lt!243978 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!243979 #b00000000000000000000000000000000 (index!20542 lt!243972) (x!49507 lt!243972) mask!3524))))

(declare-fun res!325127 () Bool)

(assert (=> b!529233 (= res!325127 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243979 lt!243966 lt!243970 mask!3524) (Intermediate!4579 false (index!20542 lt!243972) (x!49507 lt!243972))))))

(assert (=> b!529233 (=> (not res!325127) (not e!308378))))

(assert (=> b!529233 e!308378))

(declare-fun b!529234 () Bool)

(declare-fun res!325116 () Bool)

(assert (=> b!529234 (=> (not res!325116) (not e!308380))))

(assert (=> b!529234 (= res!325116 (validKeyInArray!0 k!2280))))

(declare-fun b!529235 () Bool)

(declare-fun res!325119 () Bool)

(assert (=> b!529235 (=> (not res!325119) (not e!308382))))

(assert (=> b!529235 (= res!325119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!325121 () Bool)

(assert (=> start!48034 (=> (not res!325121) (not e!308380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48034 (= res!325121 (validMask!0 mask!3524))))

(assert (=> start!48034 e!308380))

(assert (=> start!48034 true))

(declare-fun array_inv!11908 (array!33527) Bool)

(assert (=> start!48034 (array_inv!11908 a!3235)))

(declare-fun b!529236 () Bool)

(declare-fun res!325126 () Bool)

(assert (=> b!529236 (=> (not res!325126) (not e!308380))))

(assert (=> b!529236 (= res!325126 (and (= (size!16476 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16476 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16476 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!529237 () Bool)

(assert (=> b!529237 (= e!308376 e!308379)))

(declare-fun res!325117 () Bool)

(assert (=> b!529237 (=> res!325117 e!308379)))

(assert (=> b!529237 (= res!325117 (or (bvsgt (x!49507 lt!243972) #b01111111111111111111111111111110) (bvslt lt!243979 #b00000000000000000000000000000000) (bvsge lt!243979 (size!16476 a!3235)) (bvslt (index!20542 lt!243972) #b00000000000000000000000000000000) (bvsge (index!20542 lt!243972) (size!16476 a!3235)) (not (= lt!243972 (Intermediate!4579 false (index!20542 lt!243972) (x!49507 lt!243972))))))))

(assert (=> b!529237 (= (index!20542 lt!243972) i!1204)))

(declare-fun lt!243971 () Unit!16768)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33527 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16768)

(assert (=> b!529237 (= lt!243971 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!243979 #b00000000000000000000000000000000 (index!20542 lt!243972) (x!49507 lt!243972) mask!3524))))

(assert (=> b!529237 (and (or (= (select (arr!16112 a!3235) (index!20542 lt!243972)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16112 a!3235) (index!20542 lt!243972)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16112 a!3235) (index!20542 lt!243972)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16112 a!3235) (index!20542 lt!243972)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243969 () Unit!16768)

(assert (=> b!529237 (= lt!243969 e!308377)))

(declare-fun c!62363 () Bool)

(assert (=> b!529237 (= c!62363 (= (select (arr!16112 a!3235) (index!20542 lt!243972)) (select (arr!16112 a!3235) j!176)))))

(assert (=> b!529237 (and (bvslt (x!49507 lt!243972) #b01111111111111111111111111111110) (or (= (select (arr!16112 a!3235) (index!20542 lt!243972)) (select (arr!16112 a!3235) j!176)) (= (select (arr!16112 a!3235) (index!20542 lt!243972)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16112 a!3235) (index!20542 lt!243972)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!529238 () Bool)

(declare-fun res!325114 () Bool)

(assert (=> b!529238 (=> res!325114 e!308379)))

(assert (=> b!529238 (= res!325114 (not (= lt!243974 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243979 lt!243966 lt!243970 mask!3524))))))

(assert (= (and start!48034 res!325121) b!529236))

(assert (= (and b!529236 res!325126) b!529228))

(assert (= (and b!529228 res!325120) b!529234))

(assert (= (and b!529234 res!325116) b!529230))

(assert (= (and b!529230 res!325125) b!529232))

(assert (= (and b!529232 res!325123) b!529235))

(assert (= (and b!529235 res!325119) b!529231))

(assert (= (and b!529231 res!325118) b!529226))

(assert (= (and b!529226 (not res!325124)) b!529237))

(assert (= (and b!529237 c!62363) b!529233))

(assert (= (and b!529237 (not c!62363)) b!529227))

(assert (= (and b!529233 res!325127) b!529224))

(assert (= (and b!529237 (not res!325117)) b!529223))

(assert (= (and b!529223 res!325122) b!529225))

(assert (= (and b!529223 (not res!325115)) b!529238))

(assert (= (and b!529238 (not res!325114)) b!529229))

(declare-fun m!509755 () Bool)

(assert (=> b!529228 m!509755))

(assert (=> b!529228 m!509755))

(declare-fun m!509757 () Bool)

(assert (=> b!529228 m!509757))

(declare-fun m!509759 () Bool)

(assert (=> b!529229 m!509759))

(declare-fun m!509761 () Bool)

(assert (=> b!529229 m!509761))

(declare-fun m!509763 () Bool)

(assert (=> b!529234 m!509763))

(declare-fun m!509765 () Bool)

(assert (=> b!529235 m!509765))

(declare-fun m!509767 () Bool)

(assert (=> b!529231 m!509767))

(assert (=> b!529225 m!509755))

(assert (=> b!529225 m!509755))

(declare-fun m!509769 () Bool)

(assert (=> b!529225 m!509769))

(declare-fun m!509771 () Bool)

(assert (=> b!529233 m!509771))

(declare-fun m!509773 () Bool)

(assert (=> b!529233 m!509773))

(declare-fun m!509775 () Bool)

(assert (=> b!529230 m!509775))

(assert (=> b!529238 m!509773))

(declare-fun m!509777 () Bool)

(assert (=> b!529232 m!509777))

(declare-fun m!509779 () Bool)

(assert (=> start!48034 m!509779))

(declare-fun m!509781 () Bool)

(assert (=> start!48034 m!509781))

(declare-fun m!509783 () Bool)

(assert (=> b!529226 m!509783))

(declare-fun m!509785 () Bool)

(assert (=> b!529226 m!509785))

(declare-fun m!509787 () Bool)

(assert (=> b!529226 m!509787))

(assert (=> b!529226 m!509755))

(declare-fun m!509789 () Bool)

(assert (=> b!529226 m!509789))

(assert (=> b!529226 m!509755))

(declare-fun m!509791 () Bool)

(assert (=> b!529226 m!509791))

(assert (=> b!529226 m!509755))

(declare-fun m!509793 () Bool)

(assert (=> b!529226 m!509793))

(assert (=> b!529226 m!509755))

(declare-fun m!509795 () Bool)

(assert (=> b!529226 m!509795))

(declare-fun m!509797 () Bool)

(assert (=> b!529226 m!509797))

(declare-fun m!509799 () Bool)

(assert (=> b!529226 m!509799))

(declare-fun m!509801 () Bool)

(assert (=> b!529237 m!509801))

(declare-fun m!509803 () Bool)

(assert (=> b!529237 m!509803))

(assert (=> b!529237 m!509755))

(push 1)

