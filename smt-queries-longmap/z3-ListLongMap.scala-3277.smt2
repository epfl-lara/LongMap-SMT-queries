; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45596 () Bool)

(assert start!45596)

(declare-fun b!502320 () Bool)

(declare-fun res!303811 () Bool)

(declare-fun e!294231 () Bool)

(assert (=> b!502320 (=> (not res!303811) (not e!294231))))

(declare-datatypes ((array!32353 0))(
  ( (array!32354 (arr!15556 (Array (_ BitVec 32) (_ BitVec 64))) (size!15920 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32353)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502320 (= res!303811 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502321 () Bool)

(declare-fun e!294224 () Bool)

(declare-fun e!294230 () Bool)

(assert (=> b!502321 (= e!294224 e!294230)))

(declare-fun res!303803 () Bool)

(assert (=> b!502321 (=> res!303803 e!294230)))

(declare-datatypes ((SeekEntryResult!3979 0))(
  ( (MissingZero!3979 (index!18104 (_ BitVec 32))) (Found!3979 (index!18105 (_ BitVec 32))) (Intermediate!3979 (undefined!4791 Bool) (index!18106 (_ BitVec 32)) (x!47281 (_ BitVec 32))) (Undefined!3979) (MissingVacant!3979 (index!18107 (_ BitVec 32))) )
))
(declare-fun lt!228351 () SeekEntryResult!3979)

(declare-fun lt!228353 () (_ BitVec 32))

(assert (=> b!502321 (= res!303803 (or (bvsgt (x!47281 lt!228351) #b01111111111111111111111111111110) (bvslt lt!228353 #b00000000000000000000000000000000) (bvsge lt!228353 (size!15920 a!3235)) (bvslt (index!18106 lt!228351) #b00000000000000000000000000000000) (bvsge (index!18106 lt!228351) (size!15920 a!3235)) (not (= lt!228351 (Intermediate!3979 false (index!18106 lt!228351) (x!47281 lt!228351))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!502321 (= (index!18106 lt!228351) i!1204)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((Unit!15151 0))(
  ( (Unit!15152) )
))
(declare-fun lt!228357 () Unit!15151)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15151)

(assert (=> b!502321 (= lt!228357 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228353 #b00000000000000000000000000000000 (index!18106 lt!228351) (x!47281 lt!228351) mask!3524))))

(assert (=> b!502321 (and (or (= (select (arr!15556 a!3235) (index!18106 lt!228351)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15556 a!3235) (index!18106 lt!228351)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15556 a!3235) (index!18106 lt!228351)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15556 a!3235) (index!18106 lt!228351)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228354 () Unit!15151)

(declare-fun e!294228 () Unit!15151)

(assert (=> b!502321 (= lt!228354 e!294228)))

(declare-fun c!59540 () Bool)

(assert (=> b!502321 (= c!59540 (= (select (arr!15556 a!3235) (index!18106 lt!228351)) (select (arr!15556 a!3235) j!176)))))

(assert (=> b!502321 (and (bvslt (x!47281 lt!228351) #b01111111111111111111111111111110) (or (= (select (arr!15556 a!3235) (index!18106 lt!228351)) (select (arr!15556 a!3235) j!176)) (= (select (arr!15556 a!3235) (index!18106 lt!228351)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15556 a!3235) (index!18106 lt!228351)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!502322 () Bool)

(declare-fun Unit!15153 () Unit!15151)

(assert (=> b!502322 (= e!294228 Unit!15153)))

(declare-fun lt!228361 () Unit!15151)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15151)

(assert (=> b!502322 (= lt!228361 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228353 #b00000000000000000000000000000000 (index!18106 lt!228351) (x!47281 lt!228351) mask!3524))))

(declare-fun lt!228358 () array!32353)

(declare-fun lt!228359 () (_ BitVec 64))

(declare-fun res!303804 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32353 (_ BitVec 32)) SeekEntryResult!3979)

(assert (=> b!502322 (= res!303804 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228353 lt!228359 lt!228358 mask!3524) (Intermediate!3979 false (index!18106 lt!228351) (x!47281 lt!228351))))))

(declare-fun e!294225 () Bool)

(assert (=> b!502322 (=> (not res!303804) (not e!294225))))

(assert (=> b!502322 e!294225))

(declare-fun b!502323 () Bool)

(declare-fun res!303805 () Bool)

(assert (=> b!502323 (=> res!303805 e!294224)))

(get-info :version)

(assert (=> b!502323 (= res!303805 (or (undefined!4791 lt!228351) (not ((_ is Intermediate!3979) lt!228351))))))

(declare-fun b!502324 () Bool)

(assert (=> b!502324 (= e!294230 true)))

(declare-fun lt!228355 () SeekEntryResult!3979)

(assert (=> b!502324 (= lt!228355 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228353 lt!228359 lt!228358 mask!3524))))

(declare-fun b!502326 () Bool)

(declare-fun res!303797 () Bool)

(declare-fun e!294223 () Bool)

(assert (=> b!502326 (=> (not res!303797) (not e!294223))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32353 (_ BitVec 32)) Bool)

(assert (=> b!502326 (= res!303797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!502327 () Bool)

(declare-fun Unit!15154 () Unit!15151)

(assert (=> b!502327 (= e!294228 Unit!15154)))

(declare-fun b!502328 () Bool)

(assert (=> b!502328 (= e!294231 e!294223)))

(declare-fun res!303802 () Bool)

(assert (=> b!502328 (=> (not res!303802) (not e!294223))))

(declare-fun lt!228360 () SeekEntryResult!3979)

(assert (=> b!502328 (= res!303802 (or (= lt!228360 (MissingZero!3979 i!1204)) (= lt!228360 (MissingVacant!3979 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32353 (_ BitVec 32)) SeekEntryResult!3979)

(assert (=> b!502328 (= lt!228360 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!502329 () Bool)

(declare-fun e!294229 () Bool)

(assert (=> b!502329 (= e!294229 (= (seekEntryOrOpen!0 (select (arr!15556 a!3235) j!176) a!3235 mask!3524) (Found!3979 j!176)))))

(declare-fun b!502325 () Bool)

(declare-fun res!303809 () Bool)

(assert (=> b!502325 (=> (not res!303809) (not e!294231))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502325 (= res!303809 (validKeyInArray!0 (select (arr!15556 a!3235) j!176)))))

(declare-fun res!303806 () Bool)

(assert (=> start!45596 (=> (not res!303806) (not e!294231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45596 (= res!303806 (validMask!0 mask!3524))))

(assert (=> start!45596 e!294231))

(assert (=> start!45596 true))

(declare-fun array_inv!11415 (array!32353) Bool)

(assert (=> start!45596 (array_inv!11415 a!3235)))

(declare-fun b!502330 () Bool)

(declare-fun res!303808 () Bool)

(assert (=> b!502330 (=> (not res!303808) (not e!294231))))

(assert (=> b!502330 (= res!303808 (validKeyInArray!0 k0!2280))))

(declare-fun b!502331 () Bool)

(declare-fun res!303810 () Bool)

(assert (=> b!502331 (=> (not res!303810) (not e!294223))))

(declare-datatypes ((List!9621 0))(
  ( (Nil!9618) (Cons!9617 (h!10494 (_ BitVec 64)) (t!15841 List!9621)) )
))
(declare-fun arrayNoDuplicates!0 (array!32353 (_ BitVec 32) List!9621) Bool)

(assert (=> b!502331 (= res!303810 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9618))))

(declare-fun e!294226 () Bool)

(declare-fun b!502332 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32353 (_ BitVec 32)) SeekEntryResult!3979)

(assert (=> b!502332 (= e!294226 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228353 (index!18106 lt!228351) (select (arr!15556 a!3235) j!176) a!3235 mask!3524) (Found!3979 j!176))))))

(declare-fun b!502333 () Bool)

(declare-fun res!303798 () Bool)

(assert (=> b!502333 (=> res!303798 e!294230)))

(assert (=> b!502333 (= res!303798 e!294226)))

(declare-fun res!303807 () Bool)

(assert (=> b!502333 (=> (not res!303807) (not e!294226))))

(assert (=> b!502333 (= res!303807 (bvsgt #b00000000000000000000000000000000 (x!47281 lt!228351)))))

(declare-fun b!502334 () Bool)

(assert (=> b!502334 (= e!294223 (not e!294224))))

(declare-fun res!303801 () Bool)

(assert (=> b!502334 (=> res!303801 e!294224)))

(declare-fun lt!228352 () (_ BitVec 32))

(assert (=> b!502334 (= res!303801 (= lt!228351 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228352 lt!228359 lt!228358 mask!3524)))))

(assert (=> b!502334 (= lt!228351 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228353 (select (arr!15556 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502334 (= lt!228352 (toIndex!0 lt!228359 mask!3524))))

(assert (=> b!502334 (= lt!228359 (select (store (arr!15556 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!502334 (= lt!228353 (toIndex!0 (select (arr!15556 a!3235) j!176) mask!3524))))

(assert (=> b!502334 (= lt!228358 (array!32354 (store (arr!15556 a!3235) i!1204 k0!2280) (size!15920 a!3235)))))

(assert (=> b!502334 e!294229))

(declare-fun res!303799 () Bool)

(assert (=> b!502334 (=> (not res!303799) (not e!294229))))

(assert (=> b!502334 (= res!303799 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228356 () Unit!15151)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32353 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15151)

(assert (=> b!502334 (= lt!228356 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!502335 () Bool)

(declare-fun res!303800 () Bool)

(assert (=> b!502335 (=> (not res!303800) (not e!294231))))

(assert (=> b!502335 (= res!303800 (and (= (size!15920 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15920 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15920 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!502336 () Bool)

(assert (=> b!502336 (= e!294225 false)))

(assert (= (and start!45596 res!303806) b!502335))

(assert (= (and b!502335 res!303800) b!502325))

(assert (= (and b!502325 res!303809) b!502330))

(assert (= (and b!502330 res!303808) b!502320))

(assert (= (and b!502320 res!303811) b!502328))

(assert (= (and b!502328 res!303802) b!502326))

(assert (= (and b!502326 res!303797) b!502331))

(assert (= (and b!502331 res!303810) b!502334))

(assert (= (and b!502334 res!303799) b!502329))

(assert (= (and b!502334 (not res!303801)) b!502323))

(assert (= (and b!502323 (not res!303805)) b!502321))

(assert (= (and b!502321 c!59540) b!502322))

(assert (= (and b!502321 (not c!59540)) b!502327))

(assert (= (and b!502322 res!303804) b!502336))

(assert (= (and b!502321 (not res!303803)) b!502333))

(assert (= (and b!502333 res!303807) b!502332))

(assert (= (and b!502333 (not res!303798)) b!502324))

(declare-fun m!483505 () Bool)

(assert (=> b!502322 m!483505))

(declare-fun m!483507 () Bool)

(assert (=> b!502322 m!483507))

(declare-fun m!483509 () Bool)

(assert (=> b!502326 m!483509))

(declare-fun m!483511 () Bool)

(assert (=> b!502330 m!483511))

(declare-fun m!483513 () Bool)

(assert (=> b!502321 m!483513))

(declare-fun m!483515 () Bool)

(assert (=> b!502321 m!483515))

(declare-fun m!483517 () Bool)

(assert (=> b!502321 m!483517))

(declare-fun m!483519 () Bool)

(assert (=> b!502334 m!483519))

(declare-fun m!483521 () Bool)

(assert (=> b!502334 m!483521))

(declare-fun m!483523 () Bool)

(assert (=> b!502334 m!483523))

(declare-fun m!483525 () Bool)

(assert (=> b!502334 m!483525))

(declare-fun m!483527 () Bool)

(assert (=> b!502334 m!483527))

(assert (=> b!502334 m!483517))

(declare-fun m!483529 () Bool)

(assert (=> b!502334 m!483529))

(assert (=> b!502334 m!483517))

(declare-fun m!483531 () Bool)

(assert (=> b!502334 m!483531))

(assert (=> b!502334 m!483517))

(declare-fun m!483533 () Bool)

(assert (=> b!502334 m!483533))

(declare-fun m!483535 () Bool)

(assert (=> b!502331 m!483535))

(declare-fun m!483537 () Bool)

(assert (=> b!502328 m!483537))

(declare-fun m!483539 () Bool)

(assert (=> start!45596 m!483539))

(declare-fun m!483541 () Bool)

(assert (=> start!45596 m!483541))

(assert (=> b!502332 m!483517))

(assert (=> b!502332 m!483517))

(declare-fun m!483543 () Bool)

(assert (=> b!502332 m!483543))

(assert (=> b!502325 m!483517))

(assert (=> b!502325 m!483517))

(declare-fun m!483545 () Bool)

(assert (=> b!502325 m!483545))

(assert (=> b!502324 m!483507))

(assert (=> b!502329 m!483517))

(assert (=> b!502329 m!483517))

(declare-fun m!483547 () Bool)

(assert (=> b!502329 m!483547))

(declare-fun m!483549 () Bool)

(assert (=> b!502320 m!483549))

(check-sat (not b!502329) (not b!502324) (not b!502326) (not b!502328) (not b!502325) (not b!502330) (not b!502322) (not b!502321) (not b!502331) (not b!502332) (not b!502320) (not start!45596) (not b!502334))
(check-sat)
