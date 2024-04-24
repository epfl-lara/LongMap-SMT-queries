; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45488 () Bool)

(assert start!45488)

(declare-fun b!501096 () Bool)

(declare-fun e!293547 () Bool)

(assert (=> b!501096 (= e!293547 false)))

(declare-fun b!501097 () Bool)

(declare-fun res!302883 () Bool)

(declare-fun e!293541 () Bool)

(assert (=> b!501097 (=> res!302883 e!293541)))

(declare-datatypes ((SeekEntryResult!3961 0))(
  ( (MissingZero!3961 (index!18026 (_ BitVec 32))) (Found!3961 (index!18027 (_ BitVec 32))) (Intermediate!3961 (undefined!4773 Bool) (index!18028 (_ BitVec 32)) (x!47203 (_ BitVec 32))) (Undefined!3961) (MissingVacant!3961 (index!18029 (_ BitVec 32))) )
))
(declare-fun lt!227611 () SeekEntryResult!3961)

(get-info :version)

(assert (=> b!501097 (= res!302883 (or (undefined!4773 lt!227611) (not ((_ is Intermediate!3961) lt!227611))))))

(declare-fun b!501098 () Bool)

(declare-datatypes ((Unit!15079 0))(
  ( (Unit!15080) )
))
(declare-fun e!293546 () Unit!15079)

(declare-fun Unit!15081 () Unit!15079)

(assert (=> b!501098 (= e!293546 Unit!15081)))

(declare-fun lt!227620 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32314 0))(
  ( (array!32315 (arr!15538 (Array (_ BitVec 32) (_ BitVec 64))) (size!15902 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32314)

(declare-fun lt!227617 () Unit!15079)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32314 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15079)

(assert (=> b!501098 (= lt!227617 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227620 #b00000000000000000000000000000000 (index!18028 lt!227611) (x!47203 lt!227611) mask!3524))))

(declare-fun lt!227612 () array!32314)

(declare-fun lt!227618 () (_ BitVec 64))

(declare-fun res!302892 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32314 (_ BitVec 32)) SeekEntryResult!3961)

(assert (=> b!501098 (= res!302892 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227620 lt!227618 lt!227612 mask!3524) (Intermediate!3961 false (index!18028 lt!227611) (x!47203 lt!227611))))))

(assert (=> b!501098 (=> (not res!302892) (not e!293547))))

(assert (=> b!501098 e!293547))

(declare-fun b!501099 () Bool)

(assert (=> b!501099 (= e!293541 (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> b!501099 (= (index!18028 lt!227611) i!1204)))

(declare-fun lt!227619 () Unit!15079)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32314 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15079)

(assert (=> b!501099 (= lt!227619 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!227620 #b00000000000000000000000000000000 (index!18028 lt!227611) (x!47203 lt!227611) mask!3524))))

(assert (=> b!501099 (and (or (= (select (arr!15538 a!3235) (index!18028 lt!227611)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15538 a!3235) (index!18028 lt!227611)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15538 a!3235) (index!18028 lt!227611)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15538 a!3235) (index!18028 lt!227611)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227616 () Unit!15079)

(assert (=> b!501099 (= lt!227616 e!293546)))

(declare-fun c!59384 () Bool)

(assert (=> b!501099 (= c!59384 (= (select (arr!15538 a!3235) (index!18028 lt!227611)) (select (arr!15538 a!3235) j!176)))))

(assert (=> b!501099 (and (bvslt (x!47203 lt!227611) #b01111111111111111111111111111110) (or (= (select (arr!15538 a!3235) (index!18028 lt!227611)) (select (arr!15538 a!3235) j!176)) (= (select (arr!15538 a!3235) (index!18028 lt!227611)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15538 a!3235) (index!18028 lt!227611)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!501100 () Bool)

(declare-fun res!302887 () Bool)

(declare-fun e!293545 () Bool)

(assert (=> b!501100 (=> (not res!302887) (not e!293545))))

(declare-fun arrayContainsKey!0 (array!32314 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!501100 (= res!302887 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!501101 () Bool)

(declare-fun res!302891 () Bool)

(assert (=> b!501101 (=> (not res!302891) (not e!293545))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!501101 (= res!302891 (validKeyInArray!0 k0!2280))))

(declare-fun res!302888 () Bool)

(assert (=> start!45488 (=> (not res!302888) (not e!293545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45488 (= res!302888 (validMask!0 mask!3524))))

(assert (=> start!45488 e!293545))

(assert (=> start!45488 true))

(declare-fun array_inv!11397 (array!32314) Bool)

(assert (=> start!45488 (array_inv!11397 a!3235)))

(declare-fun b!501102 () Bool)

(declare-fun e!293544 () Bool)

(assert (=> b!501102 (= e!293545 e!293544)))

(declare-fun res!302889 () Bool)

(assert (=> b!501102 (=> (not res!302889) (not e!293544))))

(declare-fun lt!227615 () SeekEntryResult!3961)

(assert (=> b!501102 (= res!302889 (or (= lt!227615 (MissingZero!3961 i!1204)) (= lt!227615 (MissingVacant!3961 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32314 (_ BitVec 32)) SeekEntryResult!3961)

(assert (=> b!501102 (= lt!227615 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!501103 () Bool)

(declare-fun res!302886 () Bool)

(assert (=> b!501103 (=> (not res!302886) (not e!293544))))

(declare-datatypes ((List!9603 0))(
  ( (Nil!9600) (Cons!9599 (h!10473 (_ BitVec 64)) (t!15823 List!9603)) )
))
(declare-fun arrayNoDuplicates!0 (array!32314 (_ BitVec 32) List!9603) Bool)

(assert (=> b!501103 (= res!302886 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9600))))

(declare-fun b!501104 () Bool)

(declare-fun Unit!15082 () Unit!15079)

(assert (=> b!501104 (= e!293546 Unit!15082)))

(declare-fun b!501105 () Bool)

(declare-fun res!302882 () Bool)

(assert (=> b!501105 (=> (not res!302882) (not e!293545))))

(assert (=> b!501105 (= res!302882 (validKeyInArray!0 (select (arr!15538 a!3235) j!176)))))

(declare-fun b!501106 () Bool)

(declare-fun res!302885 () Bool)

(assert (=> b!501106 (=> (not res!302885) (not e!293544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32314 (_ BitVec 32)) Bool)

(assert (=> b!501106 (= res!302885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!501107 () Bool)

(declare-fun e!293543 () Bool)

(assert (=> b!501107 (= e!293543 (= (seekEntryOrOpen!0 (select (arr!15538 a!3235) j!176) a!3235 mask!3524) (Found!3961 j!176)))))

(declare-fun b!501108 () Bool)

(assert (=> b!501108 (= e!293544 (not e!293541))))

(declare-fun res!302893 () Bool)

(assert (=> b!501108 (=> res!302893 e!293541)))

(declare-fun lt!227614 () (_ BitVec 32))

(assert (=> b!501108 (= res!302893 (= lt!227611 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227614 lt!227618 lt!227612 mask!3524)))))

(assert (=> b!501108 (= lt!227611 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227620 (select (arr!15538 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501108 (= lt!227614 (toIndex!0 lt!227618 mask!3524))))

(assert (=> b!501108 (= lt!227618 (select (store (arr!15538 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!501108 (= lt!227620 (toIndex!0 (select (arr!15538 a!3235) j!176) mask!3524))))

(assert (=> b!501108 (= lt!227612 (array!32315 (store (arr!15538 a!3235) i!1204 k0!2280) (size!15902 a!3235)))))

(assert (=> b!501108 e!293543))

(declare-fun res!302884 () Bool)

(assert (=> b!501108 (=> (not res!302884) (not e!293543))))

(assert (=> b!501108 (= res!302884 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227613 () Unit!15079)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32314 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15079)

(assert (=> b!501108 (= lt!227613 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!501109 () Bool)

(declare-fun res!302890 () Bool)

(assert (=> b!501109 (=> (not res!302890) (not e!293545))))

(assert (=> b!501109 (= res!302890 (and (= (size!15902 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15902 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15902 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45488 res!302888) b!501109))

(assert (= (and b!501109 res!302890) b!501105))

(assert (= (and b!501105 res!302882) b!501101))

(assert (= (and b!501101 res!302891) b!501100))

(assert (= (and b!501100 res!302887) b!501102))

(assert (= (and b!501102 res!302889) b!501106))

(assert (= (and b!501106 res!302885) b!501103))

(assert (= (and b!501103 res!302886) b!501108))

(assert (= (and b!501108 res!302884) b!501107))

(assert (= (and b!501108 (not res!302893)) b!501097))

(assert (= (and b!501097 (not res!302883)) b!501099))

(assert (= (and b!501099 c!59384) b!501098))

(assert (= (and b!501099 (not c!59384)) b!501104))

(assert (= (and b!501098 res!302892) b!501096))

(declare-fun m!482443 () Bool)

(assert (=> b!501105 m!482443))

(assert (=> b!501105 m!482443))

(declare-fun m!482445 () Bool)

(assert (=> b!501105 m!482445))

(declare-fun m!482447 () Bool)

(assert (=> b!501100 m!482447))

(assert (=> b!501108 m!482443))

(declare-fun m!482449 () Bool)

(assert (=> b!501108 m!482449))

(declare-fun m!482451 () Bool)

(assert (=> b!501108 m!482451))

(declare-fun m!482453 () Bool)

(assert (=> b!501108 m!482453))

(declare-fun m!482455 () Bool)

(assert (=> b!501108 m!482455))

(declare-fun m!482457 () Bool)

(assert (=> b!501108 m!482457))

(assert (=> b!501108 m!482443))

(declare-fun m!482459 () Bool)

(assert (=> b!501108 m!482459))

(declare-fun m!482461 () Bool)

(assert (=> b!501108 m!482461))

(assert (=> b!501108 m!482443))

(declare-fun m!482463 () Bool)

(assert (=> b!501108 m!482463))

(declare-fun m!482465 () Bool)

(assert (=> start!45488 m!482465))

(declare-fun m!482467 () Bool)

(assert (=> start!45488 m!482467))

(declare-fun m!482469 () Bool)

(assert (=> b!501103 m!482469))

(declare-fun m!482471 () Bool)

(assert (=> b!501098 m!482471))

(declare-fun m!482473 () Bool)

(assert (=> b!501098 m!482473))

(declare-fun m!482475 () Bool)

(assert (=> b!501106 m!482475))

(declare-fun m!482477 () Bool)

(assert (=> b!501102 m!482477))

(declare-fun m!482479 () Bool)

(assert (=> b!501099 m!482479))

(declare-fun m!482481 () Bool)

(assert (=> b!501099 m!482481))

(assert (=> b!501099 m!482443))

(declare-fun m!482483 () Bool)

(assert (=> b!501101 m!482483))

(assert (=> b!501107 m!482443))

(assert (=> b!501107 m!482443))

(declare-fun m!482485 () Bool)

(assert (=> b!501107 m!482485))

(check-sat (not start!45488) (not b!501103) (not b!501098) (not b!501099) (not b!501107) (not b!501101) (not b!501108) (not b!501105) (not b!501100) (not b!501106) (not b!501102))
(check-sat)
(get-model)

(declare-fun d!78559 () Bool)

(declare-fun e!293592 () Bool)

(assert (=> d!78559 e!293592))

(declare-fun res!302968 () Bool)

(assert (=> d!78559 (=> (not res!302968) (not e!293592))))

(assert (=> d!78559 (= res!302968 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!15902 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15902 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!15902 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15902 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15902 a!3235))))))

(declare-fun lt!227683 () Unit!15079)

(declare-fun choose!47 (array!32314 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15079)

(assert (=> d!78559 (= lt!227683 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!227620 #b00000000000000000000000000000000 (index!18028 lt!227611) (x!47203 lt!227611) mask!3524))))

(assert (=> d!78559 (validMask!0 mask!3524)))

(assert (=> d!78559 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227620 #b00000000000000000000000000000000 (index!18028 lt!227611) (x!47203 lt!227611) mask!3524) lt!227683)))

(declare-fun b!501196 () Bool)

(assert (=> b!501196 (= e!293592 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227620 (select (store (arr!15538 a!3235) i!1204 k0!2280) j!176) (array!32315 (store (arr!15538 a!3235) i!1204 k0!2280) (size!15902 a!3235)) mask!3524) (Intermediate!3961 false (index!18028 lt!227611) (x!47203 lt!227611))))))

(assert (= (and d!78559 res!302968) b!501196))

(declare-fun m!482575 () Bool)

(assert (=> d!78559 m!482575))

(assert (=> d!78559 m!482465))

(assert (=> b!501196 m!482451))

(assert (=> b!501196 m!482455))

(assert (=> b!501196 m!482455))

(declare-fun m!482577 () Bool)

(assert (=> b!501196 m!482577))

(assert (=> b!501098 d!78559))

(declare-fun b!501215 () Bool)

(declare-fun e!293603 () Bool)

(declare-fun lt!227688 () SeekEntryResult!3961)

(assert (=> b!501215 (= e!293603 (bvsge (x!47203 lt!227688) #b01111111111111111111111111111110))))

(declare-fun b!501216 () Bool)

(assert (=> b!501216 (and (bvsge (index!18028 lt!227688) #b00000000000000000000000000000000) (bvslt (index!18028 lt!227688) (size!15902 lt!227612)))))

(declare-fun res!302976 () Bool)

(assert (=> b!501216 (= res!302976 (= (select (arr!15538 lt!227612) (index!18028 lt!227688)) lt!227618))))

(declare-fun e!293607 () Bool)

(assert (=> b!501216 (=> res!302976 e!293607)))

(declare-fun e!293604 () Bool)

(assert (=> b!501216 (= e!293604 e!293607)))

(declare-fun b!501217 () Bool)

(declare-fun e!293605 () SeekEntryResult!3961)

(declare-fun e!293606 () SeekEntryResult!3961)

(assert (=> b!501217 (= e!293605 e!293606)))

(declare-fun c!59397 () Bool)

(declare-fun lt!227689 () (_ BitVec 64))

(assert (=> b!501217 (= c!59397 (or (= lt!227689 lt!227618) (= (bvadd lt!227689 lt!227689) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!501219 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501219 (= e!293606 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!227620 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) lt!227618 lt!227612 mask!3524))))

(declare-fun b!501220 () Bool)

(assert (=> b!501220 (= e!293606 (Intermediate!3961 false lt!227620 #b00000000000000000000000000000000))))

(declare-fun b!501221 () Bool)

(assert (=> b!501221 (= e!293603 e!293604)))

(declare-fun res!302977 () Bool)

(assert (=> b!501221 (= res!302977 (and ((_ is Intermediate!3961) lt!227688) (not (undefined!4773 lt!227688)) (bvslt (x!47203 lt!227688) #b01111111111111111111111111111110) (bvsge (x!47203 lt!227688) #b00000000000000000000000000000000) (bvsge (x!47203 lt!227688) #b00000000000000000000000000000000)))))

(assert (=> b!501221 (=> (not res!302977) (not e!293604))))

(declare-fun b!501222 () Bool)

(assert (=> b!501222 (and (bvsge (index!18028 lt!227688) #b00000000000000000000000000000000) (bvslt (index!18028 lt!227688) (size!15902 lt!227612)))))

(assert (=> b!501222 (= e!293607 (= (select (arr!15538 lt!227612) (index!18028 lt!227688)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!501223 () Bool)

(assert (=> b!501223 (and (bvsge (index!18028 lt!227688) #b00000000000000000000000000000000) (bvslt (index!18028 lt!227688) (size!15902 lt!227612)))))

(declare-fun res!302975 () Bool)

(assert (=> b!501223 (= res!302975 (= (select (arr!15538 lt!227612) (index!18028 lt!227688)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!501223 (=> res!302975 e!293607)))

(declare-fun b!501218 () Bool)

(assert (=> b!501218 (= e!293605 (Intermediate!3961 true lt!227620 #b00000000000000000000000000000000))))

(declare-fun d!78561 () Bool)

(assert (=> d!78561 e!293603))

(declare-fun c!59399 () Bool)

(assert (=> d!78561 (= c!59399 (and ((_ is Intermediate!3961) lt!227688) (undefined!4773 lt!227688)))))

(assert (=> d!78561 (= lt!227688 e!293605)))

(declare-fun c!59398 () Bool)

(assert (=> d!78561 (= c!59398 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78561 (= lt!227689 (select (arr!15538 lt!227612) lt!227620))))

(assert (=> d!78561 (validMask!0 mask!3524)))

(assert (=> d!78561 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227620 lt!227618 lt!227612 mask!3524) lt!227688)))

(assert (= (and d!78561 c!59398) b!501218))

(assert (= (and d!78561 (not c!59398)) b!501217))

(assert (= (and b!501217 c!59397) b!501220))

(assert (= (and b!501217 (not c!59397)) b!501219))

(assert (= (and d!78561 c!59399) b!501215))

(assert (= (and d!78561 (not c!59399)) b!501221))

(assert (= (and b!501221 res!302977) b!501216))

(assert (= (and b!501216 (not res!302976)) b!501223))

(assert (= (and b!501223 (not res!302975)) b!501222))

(declare-fun m!482579 () Bool)

(assert (=> b!501216 m!482579))

(assert (=> b!501222 m!482579))

(declare-fun m!482581 () Bool)

(assert (=> d!78561 m!482581))

(assert (=> d!78561 m!482465))

(assert (=> b!501223 m!482579))

(declare-fun m!482583 () Bool)

(assert (=> b!501219 m!482583))

(assert (=> b!501219 m!482583))

(declare-fun m!482585 () Bool)

(assert (=> b!501219 m!482585))

(assert (=> b!501098 d!78561))

(declare-fun d!78563 () Bool)

(assert (=> d!78563 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!45488 d!78563))

(declare-fun d!78567 () Bool)

(assert (=> d!78567 (= (array_inv!11397 a!3235) (bvsge (size!15902 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!45488 d!78567))

(declare-fun d!78569 () Bool)

(assert (=> d!78569 (= (index!18028 lt!227611) i!1204)))

(declare-fun lt!227692 () Unit!15079)

(declare-fun choose!104 (array!32314 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15079)

(assert (=> d!78569 (= lt!227692 (choose!104 a!3235 i!1204 k0!2280 j!176 lt!227620 #b00000000000000000000000000000000 (index!18028 lt!227611) (x!47203 lt!227611) mask!3524))))

(assert (=> d!78569 (validMask!0 mask!3524)))

(assert (=> d!78569 (= (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!227620 #b00000000000000000000000000000000 (index!18028 lt!227611) (x!47203 lt!227611) mask!3524) lt!227692)))

(declare-fun bs!15944 () Bool)

(assert (= bs!15944 d!78569))

(declare-fun m!482587 () Bool)

(assert (=> bs!15944 m!482587))

(assert (=> bs!15944 m!482465))

(assert (=> b!501099 d!78569))

(declare-fun d!78571 () Bool)

(declare-fun lt!227716 () SeekEntryResult!3961)

(assert (=> d!78571 (and (or ((_ is Undefined!3961) lt!227716) (not ((_ is Found!3961) lt!227716)) (and (bvsge (index!18027 lt!227716) #b00000000000000000000000000000000) (bvslt (index!18027 lt!227716) (size!15902 a!3235)))) (or ((_ is Undefined!3961) lt!227716) ((_ is Found!3961) lt!227716) (not ((_ is MissingZero!3961) lt!227716)) (and (bvsge (index!18026 lt!227716) #b00000000000000000000000000000000) (bvslt (index!18026 lt!227716) (size!15902 a!3235)))) (or ((_ is Undefined!3961) lt!227716) ((_ is Found!3961) lt!227716) ((_ is MissingZero!3961) lt!227716) (not ((_ is MissingVacant!3961) lt!227716)) (and (bvsge (index!18029 lt!227716) #b00000000000000000000000000000000) (bvslt (index!18029 lt!227716) (size!15902 a!3235)))) (or ((_ is Undefined!3961) lt!227716) (ite ((_ is Found!3961) lt!227716) (= (select (arr!15538 a!3235) (index!18027 lt!227716)) k0!2280) (ite ((_ is MissingZero!3961) lt!227716) (= (select (arr!15538 a!3235) (index!18026 lt!227716)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3961) lt!227716) (= (select (arr!15538 a!3235) (index!18029 lt!227716)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!293641 () SeekEntryResult!3961)

(assert (=> d!78571 (= lt!227716 e!293641)))

(declare-fun c!59418 () Bool)

(declare-fun lt!227714 () SeekEntryResult!3961)

(assert (=> d!78571 (= c!59418 (and ((_ is Intermediate!3961) lt!227714) (undefined!4773 lt!227714)))))

(assert (=> d!78571 (= lt!227714 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!78571 (validMask!0 mask!3524)))

(assert (=> d!78571 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!227716)))

(declare-fun b!501275 () Bool)

(declare-fun e!293642 () SeekEntryResult!3961)

(assert (=> b!501275 (= e!293641 e!293642)))

(declare-fun lt!227715 () (_ BitVec 64))

(assert (=> b!501275 (= lt!227715 (select (arr!15538 a!3235) (index!18028 lt!227714)))))

(declare-fun c!59419 () Bool)

(assert (=> b!501275 (= c!59419 (= lt!227715 k0!2280))))

(declare-fun b!501276 () Bool)

(declare-fun e!293643 () SeekEntryResult!3961)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32314 (_ BitVec 32)) SeekEntryResult!3961)

(assert (=> b!501276 (= e!293643 (seekKeyOrZeroReturnVacant!0 (x!47203 lt!227714) (index!18028 lt!227714) (index!18028 lt!227714) k0!2280 a!3235 mask!3524))))

(declare-fun b!501277 () Bool)

(declare-fun c!59420 () Bool)

(assert (=> b!501277 (= c!59420 (= lt!227715 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!501277 (= e!293642 e!293643)))

(declare-fun b!501278 () Bool)

(assert (=> b!501278 (= e!293643 (MissingZero!3961 (index!18028 lt!227714)))))

(declare-fun b!501279 () Bool)

(assert (=> b!501279 (= e!293641 Undefined!3961)))

(declare-fun b!501280 () Bool)

(assert (=> b!501280 (= e!293642 (Found!3961 (index!18028 lt!227714)))))

(assert (= (and d!78571 c!59418) b!501279))

(assert (= (and d!78571 (not c!59418)) b!501275))

(assert (= (and b!501275 c!59419) b!501280))

(assert (= (and b!501275 (not c!59419)) b!501277))

(assert (= (and b!501277 c!59420) b!501278))

(assert (= (and b!501277 (not c!59420)) b!501276))

(declare-fun m!482613 () Bool)

(assert (=> d!78571 m!482613))

(assert (=> d!78571 m!482613))

(declare-fun m!482615 () Bool)

(assert (=> d!78571 m!482615))

(declare-fun m!482617 () Bool)

(assert (=> d!78571 m!482617))

(declare-fun m!482619 () Bool)

(assert (=> d!78571 m!482619))

(declare-fun m!482621 () Bool)

(assert (=> d!78571 m!482621))

(assert (=> d!78571 m!482465))

(declare-fun m!482623 () Bool)

(assert (=> b!501275 m!482623))

(declare-fun m!482625 () Bool)

(assert (=> b!501276 m!482625))

(assert (=> b!501102 d!78571))

(declare-fun d!78587 () Bool)

(declare-fun lt!227731 () (_ BitVec 32))

(declare-fun lt!227730 () (_ BitVec 32))

(assert (=> d!78587 (= lt!227731 (bvmul (bvxor lt!227730 (bvlshr lt!227730 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78587 (= lt!227730 ((_ extract 31 0) (bvand (bvxor (select (arr!15538 a!3235) j!176) (bvlshr (select (arr!15538 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78587 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!302994 (let ((h!10477 ((_ extract 31 0) (bvand (bvxor (select (arr!15538 a!3235) j!176) (bvlshr (select (arr!15538 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!47210 (bvmul (bvxor h!10477 (bvlshr h!10477 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!47210 (bvlshr x!47210 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!302994 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!302994 #b00000000000000000000000000000000))))))

(assert (=> d!78587 (= (toIndex!0 (select (arr!15538 a!3235) j!176) mask!3524) (bvand (bvxor lt!227731 (bvlshr lt!227731 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!501108 d!78587))

(declare-fun b!501304 () Bool)

(declare-fun e!293663 () Bool)

(declare-fun call!31446 () Bool)

(assert (=> b!501304 (= e!293663 call!31446)))

(declare-fun d!78593 () Bool)

(declare-fun res!303009 () Bool)

(declare-fun e!293664 () Bool)

(assert (=> d!78593 (=> res!303009 e!293664)))

(assert (=> d!78593 (= res!303009 (bvsge j!176 (size!15902 a!3235)))))

(assert (=> d!78593 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!293664)))

(declare-fun b!501305 () Bool)

(declare-fun e!293662 () Bool)

(assert (=> b!501305 (= e!293663 e!293662)))

(declare-fun lt!227743 () (_ BitVec 64))

(assert (=> b!501305 (= lt!227743 (select (arr!15538 a!3235) j!176))))

(declare-fun lt!227742 () Unit!15079)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32314 (_ BitVec 64) (_ BitVec 32)) Unit!15079)

(assert (=> b!501305 (= lt!227742 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!227743 j!176))))

(assert (=> b!501305 (arrayContainsKey!0 a!3235 lt!227743 #b00000000000000000000000000000000)))

(declare-fun lt!227741 () Unit!15079)

(assert (=> b!501305 (= lt!227741 lt!227742)))

(declare-fun res!303008 () Bool)

(assert (=> b!501305 (= res!303008 (= (seekEntryOrOpen!0 (select (arr!15538 a!3235) j!176) a!3235 mask!3524) (Found!3961 j!176)))))

(assert (=> b!501305 (=> (not res!303008) (not e!293662))))

(declare-fun b!501306 () Bool)

(assert (=> b!501306 (= e!293664 e!293663)))

(declare-fun c!59426 () Bool)

(assert (=> b!501306 (= c!59426 (validKeyInArray!0 (select (arr!15538 a!3235) j!176)))))

(declare-fun b!501307 () Bool)

(assert (=> b!501307 (= e!293662 call!31446)))

(declare-fun bm!31443 () Bool)

(assert (=> bm!31443 (= call!31446 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!78593 (not res!303009)) b!501306))

(assert (= (and b!501306 c!59426) b!501305))

(assert (= (and b!501306 (not c!59426)) b!501304))

(assert (= (and b!501305 res!303008) b!501307))

(assert (= (or b!501307 b!501304) bm!31443))

(assert (=> b!501305 m!482443))

(declare-fun m!482637 () Bool)

(assert (=> b!501305 m!482637))

(declare-fun m!482639 () Bool)

(assert (=> b!501305 m!482639))

(assert (=> b!501305 m!482443))

(assert (=> b!501305 m!482485))

(assert (=> b!501306 m!482443))

(assert (=> b!501306 m!482443))

(assert (=> b!501306 m!482445))

(declare-fun m!482641 () Bool)

(assert (=> bm!31443 m!482641))

(assert (=> b!501108 d!78593))

(declare-fun d!78597 () Bool)

(declare-fun lt!227745 () (_ BitVec 32))

(declare-fun lt!227744 () (_ BitVec 32))

(assert (=> d!78597 (= lt!227745 (bvmul (bvxor lt!227744 (bvlshr lt!227744 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78597 (= lt!227744 ((_ extract 31 0) (bvand (bvxor lt!227618 (bvlshr lt!227618 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78597 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!302994 (let ((h!10477 ((_ extract 31 0) (bvand (bvxor lt!227618 (bvlshr lt!227618 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!47210 (bvmul (bvxor h!10477 (bvlshr h!10477 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!47210 (bvlshr x!47210 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!302994 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!302994 #b00000000000000000000000000000000))))))

(assert (=> d!78597 (= (toIndex!0 lt!227618 mask!3524) (bvand (bvxor lt!227745 (bvlshr lt!227745 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!501108 d!78597))

(declare-fun b!501308 () Bool)

(declare-fun e!293665 () Bool)

(declare-fun lt!227746 () SeekEntryResult!3961)

(assert (=> b!501308 (= e!293665 (bvsge (x!47203 lt!227746) #b01111111111111111111111111111110))))

(declare-fun b!501309 () Bool)

(assert (=> b!501309 (and (bvsge (index!18028 lt!227746) #b00000000000000000000000000000000) (bvslt (index!18028 lt!227746) (size!15902 a!3235)))))

(declare-fun res!303011 () Bool)

(assert (=> b!501309 (= res!303011 (= (select (arr!15538 a!3235) (index!18028 lt!227746)) (select (arr!15538 a!3235) j!176)))))

(declare-fun e!293669 () Bool)

(assert (=> b!501309 (=> res!303011 e!293669)))

(declare-fun e!293666 () Bool)

(assert (=> b!501309 (= e!293666 e!293669)))

(declare-fun b!501310 () Bool)

(declare-fun e!293667 () SeekEntryResult!3961)

(declare-fun e!293668 () SeekEntryResult!3961)

(assert (=> b!501310 (= e!293667 e!293668)))

(declare-fun lt!227747 () (_ BitVec 64))

(declare-fun c!59427 () Bool)

(assert (=> b!501310 (= c!59427 (or (= lt!227747 (select (arr!15538 a!3235) j!176)) (= (bvadd lt!227747 lt!227747) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!501312 () Bool)

(assert (=> b!501312 (= e!293668 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!227620 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (arr!15538 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!501313 () Bool)

(assert (=> b!501313 (= e!293668 (Intermediate!3961 false lt!227620 #b00000000000000000000000000000000))))

(declare-fun b!501314 () Bool)

(assert (=> b!501314 (= e!293665 e!293666)))

(declare-fun res!303012 () Bool)

(assert (=> b!501314 (= res!303012 (and ((_ is Intermediate!3961) lt!227746) (not (undefined!4773 lt!227746)) (bvslt (x!47203 lt!227746) #b01111111111111111111111111111110) (bvsge (x!47203 lt!227746) #b00000000000000000000000000000000) (bvsge (x!47203 lt!227746) #b00000000000000000000000000000000)))))

(assert (=> b!501314 (=> (not res!303012) (not e!293666))))

(declare-fun b!501315 () Bool)

(assert (=> b!501315 (and (bvsge (index!18028 lt!227746) #b00000000000000000000000000000000) (bvslt (index!18028 lt!227746) (size!15902 a!3235)))))

(assert (=> b!501315 (= e!293669 (= (select (arr!15538 a!3235) (index!18028 lt!227746)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!501316 () Bool)

(assert (=> b!501316 (and (bvsge (index!18028 lt!227746) #b00000000000000000000000000000000) (bvslt (index!18028 lt!227746) (size!15902 a!3235)))))

(declare-fun res!303010 () Bool)

(assert (=> b!501316 (= res!303010 (= (select (arr!15538 a!3235) (index!18028 lt!227746)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!501316 (=> res!303010 e!293669)))

(declare-fun b!501311 () Bool)

(assert (=> b!501311 (= e!293667 (Intermediate!3961 true lt!227620 #b00000000000000000000000000000000))))

(declare-fun d!78599 () Bool)

(assert (=> d!78599 e!293665))

(declare-fun c!59429 () Bool)

(assert (=> d!78599 (= c!59429 (and ((_ is Intermediate!3961) lt!227746) (undefined!4773 lt!227746)))))

(assert (=> d!78599 (= lt!227746 e!293667)))

(declare-fun c!59428 () Bool)

(assert (=> d!78599 (= c!59428 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78599 (= lt!227747 (select (arr!15538 a!3235) lt!227620))))

(assert (=> d!78599 (validMask!0 mask!3524)))

(assert (=> d!78599 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227620 (select (arr!15538 a!3235) j!176) a!3235 mask!3524) lt!227746)))

(assert (= (and d!78599 c!59428) b!501311))

(assert (= (and d!78599 (not c!59428)) b!501310))

(assert (= (and b!501310 c!59427) b!501313))

(assert (= (and b!501310 (not c!59427)) b!501312))

(assert (= (and d!78599 c!59429) b!501308))

(assert (= (and d!78599 (not c!59429)) b!501314))

(assert (= (and b!501314 res!303012) b!501309))

(assert (= (and b!501309 (not res!303011)) b!501316))

(assert (= (and b!501316 (not res!303010)) b!501315))

(declare-fun m!482643 () Bool)

(assert (=> b!501309 m!482643))

(assert (=> b!501315 m!482643))

(declare-fun m!482645 () Bool)

(assert (=> d!78599 m!482645))

(assert (=> d!78599 m!482465))

(assert (=> b!501316 m!482643))

(assert (=> b!501312 m!482583))

(assert (=> b!501312 m!482583))

(assert (=> b!501312 m!482443))

(declare-fun m!482647 () Bool)

(assert (=> b!501312 m!482647))

(assert (=> b!501108 d!78599))

(declare-fun d!78601 () Bool)

(assert (=> d!78601 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!227754 () Unit!15079)

(declare-fun choose!38 (array!32314 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15079)

(assert (=> d!78601 (= lt!227754 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78601 (validMask!0 mask!3524)))

(assert (=> d!78601 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!227754)))

(declare-fun bs!15945 () Bool)

(assert (= bs!15945 d!78601))

(assert (=> bs!15945 m!482459))

(declare-fun m!482649 () Bool)

(assert (=> bs!15945 m!482649))

(assert (=> bs!15945 m!482465))

(assert (=> b!501108 d!78601))

(declare-fun b!501335 () Bool)

(declare-fun e!293680 () Bool)

(declare-fun lt!227755 () SeekEntryResult!3961)

(assert (=> b!501335 (= e!293680 (bvsge (x!47203 lt!227755) #b01111111111111111111111111111110))))

(declare-fun b!501336 () Bool)

(assert (=> b!501336 (and (bvsge (index!18028 lt!227755) #b00000000000000000000000000000000) (bvslt (index!18028 lt!227755) (size!15902 lt!227612)))))

(declare-fun res!303020 () Bool)

(assert (=> b!501336 (= res!303020 (= (select (arr!15538 lt!227612) (index!18028 lt!227755)) lt!227618))))

(declare-fun e!293684 () Bool)

(assert (=> b!501336 (=> res!303020 e!293684)))

(declare-fun e!293681 () Bool)

(assert (=> b!501336 (= e!293681 e!293684)))

(declare-fun b!501337 () Bool)

(declare-fun e!293682 () SeekEntryResult!3961)

(declare-fun e!293683 () SeekEntryResult!3961)

(assert (=> b!501337 (= e!293682 e!293683)))

(declare-fun c!59436 () Bool)

(declare-fun lt!227756 () (_ BitVec 64))

(assert (=> b!501337 (= c!59436 (or (= lt!227756 lt!227618) (= (bvadd lt!227756 lt!227756) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!501339 () Bool)

(assert (=> b!501339 (= e!293683 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!227614 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) lt!227618 lt!227612 mask!3524))))

(declare-fun b!501340 () Bool)

(assert (=> b!501340 (= e!293683 (Intermediate!3961 false lt!227614 #b00000000000000000000000000000000))))

(declare-fun b!501341 () Bool)

(assert (=> b!501341 (= e!293680 e!293681)))

(declare-fun res!303021 () Bool)

(assert (=> b!501341 (= res!303021 (and ((_ is Intermediate!3961) lt!227755) (not (undefined!4773 lt!227755)) (bvslt (x!47203 lt!227755) #b01111111111111111111111111111110) (bvsge (x!47203 lt!227755) #b00000000000000000000000000000000) (bvsge (x!47203 lt!227755) #b00000000000000000000000000000000)))))

(assert (=> b!501341 (=> (not res!303021) (not e!293681))))

(declare-fun b!501342 () Bool)

(assert (=> b!501342 (and (bvsge (index!18028 lt!227755) #b00000000000000000000000000000000) (bvslt (index!18028 lt!227755) (size!15902 lt!227612)))))

(assert (=> b!501342 (= e!293684 (= (select (arr!15538 lt!227612) (index!18028 lt!227755)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!501343 () Bool)

(assert (=> b!501343 (and (bvsge (index!18028 lt!227755) #b00000000000000000000000000000000) (bvslt (index!18028 lt!227755) (size!15902 lt!227612)))))

(declare-fun res!303019 () Bool)

(assert (=> b!501343 (= res!303019 (= (select (arr!15538 lt!227612) (index!18028 lt!227755)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!501343 (=> res!303019 e!293684)))

(declare-fun b!501338 () Bool)

(assert (=> b!501338 (= e!293682 (Intermediate!3961 true lt!227614 #b00000000000000000000000000000000))))

(declare-fun d!78603 () Bool)

(assert (=> d!78603 e!293680))

(declare-fun c!59438 () Bool)

(assert (=> d!78603 (= c!59438 (and ((_ is Intermediate!3961) lt!227755) (undefined!4773 lt!227755)))))

(assert (=> d!78603 (= lt!227755 e!293682)))

(declare-fun c!59437 () Bool)

(assert (=> d!78603 (= c!59437 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78603 (= lt!227756 (select (arr!15538 lt!227612) lt!227614))))

(assert (=> d!78603 (validMask!0 mask!3524)))

(assert (=> d!78603 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227614 lt!227618 lt!227612 mask!3524) lt!227755)))

(assert (= (and d!78603 c!59437) b!501338))

(assert (= (and d!78603 (not c!59437)) b!501337))

(assert (= (and b!501337 c!59436) b!501340))

(assert (= (and b!501337 (not c!59436)) b!501339))

(assert (= (and d!78603 c!59438) b!501335))

(assert (= (and d!78603 (not c!59438)) b!501341))

(assert (= (and b!501341 res!303021) b!501336))

(assert (= (and b!501336 (not res!303020)) b!501343))

(assert (= (and b!501343 (not res!303019)) b!501342))

(declare-fun m!482651 () Bool)

(assert (=> b!501336 m!482651))

(assert (=> b!501342 m!482651))

(declare-fun m!482653 () Bool)

(assert (=> d!78603 m!482653))

(assert (=> d!78603 m!482465))

(assert (=> b!501343 m!482651))

(declare-fun m!482655 () Bool)

(assert (=> b!501339 m!482655))

(assert (=> b!501339 m!482655))

(declare-fun m!482657 () Bool)

(assert (=> b!501339 m!482657))

(assert (=> b!501108 d!78603))

(declare-fun b!501372 () Bool)

(declare-fun e!293705 () Bool)

(declare-fun e!293703 () Bool)

(assert (=> b!501372 (= e!293705 e!293703)))

(declare-fun res!303033 () Bool)

(assert (=> b!501372 (=> (not res!303033) (not e!293703))))

(declare-fun e!293702 () Bool)

(assert (=> b!501372 (= res!303033 (not e!293702))))

(declare-fun res!303031 () Bool)

(assert (=> b!501372 (=> (not res!303031) (not e!293702))))

(assert (=> b!501372 (= res!303031 (validKeyInArray!0 (select (arr!15538 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!501373 () Bool)

(declare-fun e!293704 () Bool)

(declare-fun call!31449 () Bool)

(assert (=> b!501373 (= e!293704 call!31449)))

(declare-fun bm!31446 () Bool)

(declare-fun c!59448 () Bool)

(assert (=> bm!31446 (= call!31449 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!59448 (Cons!9599 (select (arr!15538 a!3235) #b00000000000000000000000000000000) Nil!9600) Nil!9600)))))

(declare-fun b!501374 () Bool)

(assert (=> b!501374 (= e!293703 e!293704)))

(assert (=> b!501374 (= c!59448 (validKeyInArray!0 (select (arr!15538 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!501375 () Bool)

(assert (=> b!501375 (= e!293704 call!31449)))

(declare-fun b!501371 () Bool)

(declare-fun contains!2696 (List!9603 (_ BitVec 64)) Bool)

(assert (=> b!501371 (= e!293702 (contains!2696 Nil!9600 (select (arr!15538 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!78605 () Bool)

(declare-fun res!303032 () Bool)

(assert (=> d!78605 (=> res!303032 e!293705)))

(assert (=> d!78605 (= res!303032 (bvsge #b00000000000000000000000000000000 (size!15902 a!3235)))))

(assert (=> d!78605 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9600) e!293705)))

(assert (= (and d!78605 (not res!303032)) b!501372))

(assert (= (and b!501372 res!303031) b!501371))

(assert (= (and b!501372 res!303033) b!501374))

(assert (= (and b!501374 c!59448) b!501375))

(assert (= (and b!501374 (not c!59448)) b!501373))

(assert (= (or b!501375 b!501373) bm!31446))

(declare-fun m!482669 () Bool)

(assert (=> b!501372 m!482669))

(assert (=> b!501372 m!482669))

(declare-fun m!482671 () Bool)

(assert (=> b!501372 m!482671))

(assert (=> bm!31446 m!482669))

(declare-fun m!482673 () Bool)

(assert (=> bm!31446 m!482673))

(assert (=> b!501374 m!482669))

(assert (=> b!501374 m!482669))

(assert (=> b!501374 m!482671))

(assert (=> b!501371 m!482669))

(assert (=> b!501371 m!482669))

(declare-fun m!482675 () Bool)

(assert (=> b!501371 m!482675))

(assert (=> b!501103 d!78605))

(declare-fun b!501388 () Bool)

(declare-fun e!293712 () Bool)

(declare-fun call!31450 () Bool)

(assert (=> b!501388 (= e!293712 call!31450)))

(declare-fun d!78611 () Bool)

(declare-fun res!303038 () Bool)

(declare-fun e!293714 () Bool)

(assert (=> d!78611 (=> res!303038 e!293714)))

(assert (=> d!78611 (= res!303038 (bvsge #b00000000000000000000000000000000 (size!15902 a!3235)))))

(assert (=> d!78611 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!293714)))

(declare-fun b!501389 () Bool)

(declare-fun e!293711 () Bool)

(assert (=> b!501389 (= e!293712 e!293711)))

(declare-fun lt!227770 () (_ BitVec 64))

(assert (=> b!501389 (= lt!227770 (select (arr!15538 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!227769 () Unit!15079)

(assert (=> b!501389 (= lt!227769 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!227770 #b00000000000000000000000000000000))))

(assert (=> b!501389 (arrayContainsKey!0 a!3235 lt!227770 #b00000000000000000000000000000000)))

(declare-fun lt!227768 () Unit!15079)

(assert (=> b!501389 (= lt!227768 lt!227769)))

(declare-fun res!303037 () Bool)

(assert (=> b!501389 (= res!303037 (= (seekEntryOrOpen!0 (select (arr!15538 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3961 #b00000000000000000000000000000000)))))

(assert (=> b!501389 (=> (not res!303037) (not e!293711))))

(declare-fun b!501390 () Bool)

(assert (=> b!501390 (= e!293714 e!293712)))

(declare-fun c!59452 () Bool)

(assert (=> b!501390 (= c!59452 (validKeyInArray!0 (select (arr!15538 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!501391 () Bool)

(assert (=> b!501391 (= e!293711 call!31450)))

(declare-fun bm!31447 () Bool)

(assert (=> bm!31447 (= call!31450 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!78611 (not res!303038)) b!501390))

(assert (= (and b!501390 c!59452) b!501389))

(assert (= (and b!501390 (not c!59452)) b!501388))

(assert (= (and b!501389 res!303037) b!501391))

(assert (= (or b!501391 b!501388) bm!31447))

(assert (=> b!501389 m!482669))

(declare-fun m!482677 () Bool)

(assert (=> b!501389 m!482677))

(declare-fun m!482679 () Bool)

(assert (=> b!501389 m!482679))

(assert (=> b!501389 m!482669))

(declare-fun m!482681 () Bool)

(assert (=> b!501389 m!482681))

(assert (=> b!501390 m!482669))

(assert (=> b!501390 m!482669))

(assert (=> b!501390 m!482671))

(declare-fun m!482685 () Bool)

(assert (=> bm!31447 m!482685))

(assert (=> b!501106 d!78611))

(declare-fun d!78613 () Bool)

(assert (=> d!78613 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!501101 d!78613))

(declare-fun d!78619 () Bool)

(declare-fun lt!227775 () SeekEntryResult!3961)

(assert (=> d!78619 (and (or ((_ is Undefined!3961) lt!227775) (not ((_ is Found!3961) lt!227775)) (and (bvsge (index!18027 lt!227775) #b00000000000000000000000000000000) (bvslt (index!18027 lt!227775) (size!15902 a!3235)))) (or ((_ is Undefined!3961) lt!227775) ((_ is Found!3961) lt!227775) (not ((_ is MissingZero!3961) lt!227775)) (and (bvsge (index!18026 lt!227775) #b00000000000000000000000000000000) (bvslt (index!18026 lt!227775) (size!15902 a!3235)))) (or ((_ is Undefined!3961) lt!227775) ((_ is Found!3961) lt!227775) ((_ is MissingZero!3961) lt!227775) (not ((_ is MissingVacant!3961) lt!227775)) (and (bvsge (index!18029 lt!227775) #b00000000000000000000000000000000) (bvslt (index!18029 lt!227775) (size!15902 a!3235)))) (or ((_ is Undefined!3961) lt!227775) (ite ((_ is Found!3961) lt!227775) (= (select (arr!15538 a!3235) (index!18027 lt!227775)) (select (arr!15538 a!3235) j!176)) (ite ((_ is MissingZero!3961) lt!227775) (= (select (arr!15538 a!3235) (index!18026 lt!227775)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3961) lt!227775) (= (select (arr!15538 a!3235) (index!18029 lt!227775)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!293720 () SeekEntryResult!3961)

(assert (=> d!78619 (= lt!227775 e!293720)))

(declare-fun c!59455 () Bool)

(declare-fun lt!227773 () SeekEntryResult!3961)

(assert (=> d!78619 (= c!59455 (and ((_ is Intermediate!3961) lt!227773) (undefined!4773 lt!227773)))))

(assert (=> d!78619 (= lt!227773 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15538 a!3235) j!176) mask!3524) (select (arr!15538 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78619 (validMask!0 mask!3524)))

(assert (=> d!78619 (= (seekEntryOrOpen!0 (select (arr!15538 a!3235) j!176) a!3235 mask!3524) lt!227775)))

(declare-fun b!501399 () Bool)

(declare-fun e!293721 () SeekEntryResult!3961)

(assert (=> b!501399 (= e!293720 e!293721)))

(declare-fun lt!227774 () (_ BitVec 64))

(assert (=> b!501399 (= lt!227774 (select (arr!15538 a!3235) (index!18028 lt!227773)))))

(declare-fun c!59456 () Bool)

(assert (=> b!501399 (= c!59456 (= lt!227774 (select (arr!15538 a!3235) j!176)))))

(declare-fun b!501400 () Bool)

(declare-fun e!293722 () SeekEntryResult!3961)

(assert (=> b!501400 (= e!293722 (seekKeyOrZeroReturnVacant!0 (x!47203 lt!227773) (index!18028 lt!227773) (index!18028 lt!227773) (select (arr!15538 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!501401 () Bool)

(declare-fun c!59457 () Bool)

(assert (=> b!501401 (= c!59457 (= lt!227774 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!501401 (= e!293721 e!293722)))

(declare-fun b!501402 () Bool)

(assert (=> b!501402 (= e!293722 (MissingZero!3961 (index!18028 lt!227773)))))

(declare-fun b!501403 () Bool)

(assert (=> b!501403 (= e!293720 Undefined!3961)))

(declare-fun b!501404 () Bool)

(assert (=> b!501404 (= e!293721 (Found!3961 (index!18028 lt!227773)))))

(assert (= (and d!78619 c!59455) b!501403))

(assert (= (and d!78619 (not c!59455)) b!501399))

(assert (= (and b!501399 c!59456) b!501404))

(assert (= (and b!501399 (not c!59456)) b!501401))

(assert (= (and b!501401 c!59457) b!501402))

(assert (= (and b!501401 (not c!59457)) b!501400))

(assert (=> d!78619 m!482443))

(assert (=> d!78619 m!482463))

(assert (=> d!78619 m!482463))

(assert (=> d!78619 m!482443))

(declare-fun m!482693 () Bool)

(assert (=> d!78619 m!482693))

(declare-fun m!482695 () Bool)

(assert (=> d!78619 m!482695))

(declare-fun m!482697 () Bool)

(assert (=> d!78619 m!482697))

(declare-fun m!482699 () Bool)

(assert (=> d!78619 m!482699))

(assert (=> d!78619 m!482465))

(declare-fun m!482701 () Bool)

(assert (=> b!501399 m!482701))

(assert (=> b!501400 m!482443))

(declare-fun m!482703 () Bool)

(assert (=> b!501400 m!482703))

(assert (=> b!501107 d!78619))

(declare-fun d!78621 () Bool)

(assert (=> d!78621 (= (validKeyInArray!0 (select (arr!15538 a!3235) j!176)) (and (not (= (select (arr!15538 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15538 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!501105 d!78621))

(declare-fun d!78623 () Bool)

(declare-fun res!303052 () Bool)

(declare-fun e!293732 () Bool)

(assert (=> d!78623 (=> res!303052 e!293732)))

(assert (=> d!78623 (= res!303052 (= (select (arr!15538 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!78623 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!293732)))

(declare-fun b!501418 () Bool)

(declare-fun e!293733 () Bool)

(assert (=> b!501418 (= e!293732 e!293733)))

(declare-fun res!303053 () Bool)

(assert (=> b!501418 (=> (not res!303053) (not e!293733))))

(assert (=> b!501418 (= res!303053 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15902 a!3235)))))

(declare-fun b!501419 () Bool)

(assert (=> b!501419 (= e!293733 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78623 (not res!303052)) b!501418))

(assert (= (and b!501418 res!303053) b!501419))

(assert (=> d!78623 m!482669))

(declare-fun m!482713 () Bool)

(assert (=> b!501419 m!482713))

(assert (=> b!501100 d!78623))

(check-sat (not bm!31443) (not b!501339) (not d!78603) (not b!501374) (not b!501389) (not b!501219) (not b!501305) (not b!501306) (not b!501390) (not b!501400) (not d!78601) (not d!78619) (not b!501419) (not b!501276) (not b!501372) (not d!78559) (not b!501196) (not bm!31446) (not d!78561) (not d!78599) (not d!78571) (not bm!31447) (not b!501312) (not d!78569) (not b!501371))
(check-sat)
