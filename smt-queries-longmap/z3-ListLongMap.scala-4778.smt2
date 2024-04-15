; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65708 () Bool)

(assert start!65708)

(declare-fun b!754279 () Bool)

(declare-fun res!509757 () Bool)

(declare-fun e!420655 () Bool)

(assert (=> b!754279 (=> (not res!509757) (not e!420655))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!754279 (= res!509757 (validKeyInArray!0 k0!2102))))

(declare-datatypes ((array!41898 0))(
  ( (array!41899 (arr!20063 (Array (_ BitVec 32) (_ BitVec 64))) (size!20484 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41898)

(declare-fun e!420645 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!754280 () Bool)

(declare-datatypes ((SeekEntryResult!7660 0))(
  ( (MissingZero!7660 (index!33008 (_ BitVec 32))) (Found!7660 (index!33009 (_ BitVec 32))) (Intermediate!7660 (undefined!8472 Bool) (index!33010 (_ BitVec 32)) (x!63925 (_ BitVec 32))) (Undefined!7660) (MissingVacant!7660 (index!33011 (_ BitVec 32))) )
))
(declare-fun lt!335555 () SeekEntryResult!7660)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41898 (_ BitVec 32)) SeekEntryResult!7660)

(assert (=> b!754280 (= e!420645 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20063 a!3186) j!159) a!3186 mask!3328) lt!335555))))

(declare-fun b!754281 () Bool)

(declare-fun res!509764 () Bool)

(declare-fun e!420647 () Bool)

(assert (=> b!754281 (=> (not res!509764) (not e!420647))))

(assert (=> b!754281 (= res!509764 e!420645)))

(declare-fun c!82644 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!754281 (= c!82644 (bvsle x!1131 resIntermediateX!5))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!754283 () Bool)

(declare-fun lt!335559 () SeekEntryResult!7660)

(declare-fun e!420646 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41898 (_ BitVec 32)) SeekEntryResult!7660)

(assert (=> b!754283 (= e!420646 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20063 a!3186) j!159) a!3186 mask!3328) lt!335559))))

(declare-fun b!754284 () Bool)

(declare-fun e!420654 () Bool)

(declare-fun e!420650 () Bool)

(assert (=> b!754284 (= e!420654 (not e!420650))))

(declare-fun res!509766 () Bool)

(assert (=> b!754284 (=> res!509766 e!420650)))

(declare-fun lt!335556 () SeekEntryResult!7660)

(get-info :version)

(assert (=> b!754284 (= res!509766 (or (not ((_ is Intermediate!7660) lt!335556)) (bvslt x!1131 (x!63925 lt!335556)) (not (= x!1131 (x!63925 lt!335556))) (not (= index!1321 (index!33010 lt!335556)))))))

(assert (=> b!754284 e!420646))

(declare-fun res!509762 () Bool)

(assert (=> b!754284 (=> (not res!509762) (not e!420646))))

(declare-fun lt!335561 () SeekEntryResult!7660)

(assert (=> b!754284 (= res!509762 (= lt!335561 lt!335559))))

(assert (=> b!754284 (= lt!335559 (Found!7660 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41898 (_ BitVec 32)) SeekEntryResult!7660)

(assert (=> b!754284 (= lt!335561 (seekEntryOrOpen!0 (select (arr!20063 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41898 (_ BitVec 32)) Bool)

(assert (=> b!754284 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26000 0))(
  ( (Unit!26001) )
))
(declare-fun lt!335551 () Unit!26000)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41898 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26000)

(assert (=> b!754284 (= lt!335551 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!754285 () Bool)

(declare-fun res!509772 () Bool)

(assert (=> b!754285 (=> (not res!509772) (not e!420655))))

(declare-fun arrayContainsKey!0 (array!41898 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!754285 (= res!509772 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!754286 () Bool)

(declare-fun res!509754 () Bool)

(assert (=> b!754286 (=> (not res!509754) (not e!420647))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!754286 (= res!509754 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20063 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!754287 () Bool)

(declare-fun res!509770 () Bool)

(assert (=> b!754287 (=> (not res!509770) (not e!420655))))

(assert (=> b!754287 (= res!509770 (and (= (size!20484 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20484 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20484 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!754288 () Bool)

(declare-fun res!509771 () Bool)

(assert (=> b!754288 (=> (not res!509771) (not e!420655))))

(assert (=> b!754288 (= res!509771 (validKeyInArray!0 (select (arr!20063 a!3186) j!159)))))

(declare-fun b!754289 () Bool)

(declare-fun res!509756 () Bool)

(declare-fun e!420653 () Bool)

(assert (=> b!754289 (=> (not res!509756) (not e!420653))))

(declare-datatypes ((List!14104 0))(
  ( (Nil!14101) (Cons!14100 (h!15172 (_ BitVec 64)) (t!20410 List!14104)) )
))
(declare-fun arrayNoDuplicates!0 (array!41898 (_ BitVec 32) List!14104) Bool)

(assert (=> b!754289 (= res!509756 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14101))))

(declare-fun b!754290 () Bool)

(assert (=> b!754290 (= e!420645 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20063 a!3186) j!159) a!3186 mask!3328) (Found!7660 j!159)))))

(declare-fun b!754291 () Bool)

(declare-fun res!509759 () Bool)

(declare-fun e!420649 () Bool)

(assert (=> b!754291 (=> (not res!509759) (not e!420649))))

(declare-fun lt!335560 () (_ BitVec 64))

(declare-fun lt!335557 () array!41898)

(assert (=> b!754291 (= res!509759 (= (seekEntryOrOpen!0 lt!335560 lt!335557 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335560 lt!335557 mask!3328)))))

(declare-fun b!754292 () Bool)

(declare-fun res!509765 () Bool)

(assert (=> b!754292 (=> (not res!509765) (not e!420653))))

(assert (=> b!754292 (= res!509765 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20484 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20484 a!3186))))))

(declare-fun b!754293 () Bool)

(declare-fun e!420648 () Unit!26000)

(declare-fun Unit!26002 () Unit!26000)

(assert (=> b!754293 (= e!420648 Unit!26002)))

(assert (=> b!754293 false))

(declare-fun b!754294 () Bool)

(declare-fun res!509761 () Bool)

(assert (=> b!754294 (=> (not res!509761) (not e!420653))))

(assert (=> b!754294 (= res!509761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!509768 () Bool)

(assert (=> start!65708 (=> (not res!509768) (not e!420655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65708 (= res!509768 (validMask!0 mask!3328))))

(assert (=> start!65708 e!420655))

(assert (=> start!65708 true))

(declare-fun array_inv!15946 (array!41898) Bool)

(assert (=> start!65708 (array_inv!15946 a!3186)))

(declare-fun b!754282 () Bool)

(declare-fun e!420652 () Bool)

(assert (=> b!754282 (= e!420650 e!420652)))

(declare-fun res!509755 () Bool)

(assert (=> b!754282 (=> res!509755 e!420652)))

(declare-fun lt!335558 () SeekEntryResult!7660)

(assert (=> b!754282 (= res!509755 (not (= lt!335558 lt!335559)))))

(assert (=> b!754282 (= lt!335558 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20063 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!754295 () Bool)

(declare-fun e!420644 () Bool)

(assert (=> b!754295 (= e!420652 e!420644)))

(declare-fun res!509767 () Bool)

(assert (=> b!754295 (=> res!509767 e!420644)))

(declare-fun lt!335552 () (_ BitVec 64))

(assert (=> b!754295 (= res!509767 (= lt!335552 lt!335560))))

(assert (=> b!754295 (= lt!335552 (select (store (arr!20063 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!754296 () Bool)

(assert (=> b!754296 (= e!420647 e!420654)))

(declare-fun res!509758 () Bool)

(assert (=> b!754296 (=> (not res!509758) (not e!420654))))

(declare-fun lt!335553 () SeekEntryResult!7660)

(assert (=> b!754296 (= res!509758 (= lt!335553 lt!335556))))

(assert (=> b!754296 (= lt!335556 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335560 lt!335557 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!754296 (= lt!335553 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335560 mask!3328) lt!335560 lt!335557 mask!3328))))

(assert (=> b!754296 (= lt!335560 (select (store (arr!20063 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!754296 (= lt!335557 (array!41899 (store (arr!20063 a!3186) i!1173 k0!2102) (size!20484 a!3186)))))

(declare-fun b!754297 () Bool)

(assert (=> b!754297 (= e!420655 e!420653)))

(declare-fun res!509760 () Bool)

(assert (=> b!754297 (=> (not res!509760) (not e!420653))))

(declare-fun lt!335554 () SeekEntryResult!7660)

(assert (=> b!754297 (= res!509760 (or (= lt!335554 (MissingZero!7660 i!1173)) (= lt!335554 (MissingVacant!7660 i!1173))))))

(assert (=> b!754297 (= lt!335554 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!754298 () Bool)

(assert (=> b!754298 (= e!420644 true)))

(assert (=> b!754298 e!420649))

(declare-fun res!509769 () Bool)

(assert (=> b!754298 (=> (not res!509769) (not e!420649))))

(assert (=> b!754298 (= res!509769 (= lt!335552 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335550 () Unit!26000)

(assert (=> b!754298 (= lt!335550 e!420648)))

(declare-fun c!82643 () Bool)

(assert (=> b!754298 (= c!82643 (= lt!335552 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!754299 () Bool)

(assert (=> b!754299 (= e!420649 (= lt!335561 lt!335558))))

(declare-fun b!754300 () Bool)

(assert (=> b!754300 (= e!420653 e!420647)))

(declare-fun res!509763 () Bool)

(assert (=> b!754300 (=> (not res!509763) (not e!420647))))

(assert (=> b!754300 (= res!509763 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20063 a!3186) j!159) mask!3328) (select (arr!20063 a!3186) j!159) a!3186 mask!3328) lt!335555))))

(assert (=> b!754300 (= lt!335555 (Intermediate!7660 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!754301 () Bool)

(declare-fun Unit!26003 () Unit!26000)

(assert (=> b!754301 (= e!420648 Unit!26003)))

(assert (= (and start!65708 res!509768) b!754287))

(assert (= (and b!754287 res!509770) b!754288))

(assert (= (and b!754288 res!509771) b!754279))

(assert (= (and b!754279 res!509757) b!754285))

(assert (= (and b!754285 res!509772) b!754297))

(assert (= (and b!754297 res!509760) b!754294))

(assert (= (and b!754294 res!509761) b!754289))

(assert (= (and b!754289 res!509756) b!754292))

(assert (= (and b!754292 res!509765) b!754300))

(assert (= (and b!754300 res!509763) b!754286))

(assert (= (and b!754286 res!509754) b!754281))

(assert (= (and b!754281 c!82644) b!754280))

(assert (= (and b!754281 (not c!82644)) b!754290))

(assert (= (and b!754281 res!509764) b!754296))

(assert (= (and b!754296 res!509758) b!754284))

(assert (= (and b!754284 res!509762) b!754283))

(assert (= (and b!754284 (not res!509766)) b!754282))

(assert (= (and b!754282 (not res!509755)) b!754295))

(assert (= (and b!754295 (not res!509767)) b!754298))

(assert (= (and b!754298 c!82643) b!754293))

(assert (= (and b!754298 (not c!82643)) b!754301))

(assert (= (and b!754298 res!509769) b!754291))

(assert (= (and b!754291 res!509759) b!754299))

(declare-fun m!702197 () Bool)

(assert (=> b!754285 m!702197))

(declare-fun m!702199 () Bool)

(assert (=> b!754300 m!702199))

(assert (=> b!754300 m!702199))

(declare-fun m!702201 () Bool)

(assert (=> b!754300 m!702201))

(assert (=> b!754300 m!702201))

(assert (=> b!754300 m!702199))

(declare-fun m!702203 () Bool)

(assert (=> b!754300 m!702203))

(declare-fun m!702205 () Bool)

(assert (=> b!754291 m!702205))

(declare-fun m!702207 () Bool)

(assert (=> b!754291 m!702207))

(assert (=> b!754282 m!702199))

(assert (=> b!754282 m!702199))

(declare-fun m!702209 () Bool)

(assert (=> b!754282 m!702209))

(assert (=> b!754284 m!702199))

(assert (=> b!754284 m!702199))

(declare-fun m!702211 () Bool)

(assert (=> b!754284 m!702211))

(declare-fun m!702213 () Bool)

(assert (=> b!754284 m!702213))

(declare-fun m!702215 () Bool)

(assert (=> b!754284 m!702215))

(declare-fun m!702217 () Bool)

(assert (=> b!754286 m!702217))

(declare-fun m!702219 () Bool)

(assert (=> start!65708 m!702219))

(declare-fun m!702221 () Bool)

(assert (=> start!65708 m!702221))

(assert (=> b!754283 m!702199))

(assert (=> b!754283 m!702199))

(declare-fun m!702223 () Bool)

(assert (=> b!754283 m!702223))

(declare-fun m!702225 () Bool)

(assert (=> b!754295 m!702225))

(declare-fun m!702227 () Bool)

(assert (=> b!754295 m!702227))

(declare-fun m!702229 () Bool)

(assert (=> b!754297 m!702229))

(declare-fun m!702231 () Bool)

(assert (=> b!754296 m!702231))

(declare-fun m!702233 () Bool)

(assert (=> b!754296 m!702233))

(declare-fun m!702235 () Bool)

(assert (=> b!754296 m!702235))

(assert (=> b!754296 m!702225))

(declare-fun m!702237 () Bool)

(assert (=> b!754296 m!702237))

(assert (=> b!754296 m!702231))

(declare-fun m!702239 () Bool)

(assert (=> b!754289 m!702239))

(declare-fun m!702241 () Bool)

(assert (=> b!754279 m!702241))

(assert (=> b!754290 m!702199))

(assert (=> b!754290 m!702199))

(assert (=> b!754290 m!702209))

(assert (=> b!754288 m!702199))

(assert (=> b!754288 m!702199))

(declare-fun m!702243 () Bool)

(assert (=> b!754288 m!702243))

(declare-fun m!702245 () Bool)

(assert (=> b!754294 m!702245))

(assert (=> b!754280 m!702199))

(assert (=> b!754280 m!702199))

(declare-fun m!702247 () Bool)

(assert (=> b!754280 m!702247))

(check-sat (not b!754279) (not start!65708) (not b!754280) (not b!754291) (not b!754296) (not b!754282) (not b!754288) (not b!754300) (not b!754283) (not b!754285) (not b!754289) (not b!754297) (not b!754290) (not b!754294) (not b!754284))
(check-sat)
