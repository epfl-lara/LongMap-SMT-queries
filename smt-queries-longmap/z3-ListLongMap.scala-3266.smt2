; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45470 () Bool)

(assert start!45470)

(declare-fun b!500538 () Bool)

(declare-fun res!302355 () Bool)

(declare-fun e!293257 () Bool)

(assert (=> b!500538 (=> (not res!302355) (not e!293257))))

(declare-datatypes ((array!32295 0))(
  ( (array!32296 (arr!15529 (Array (_ BitVec 32) (_ BitVec 64))) (size!15893 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32295)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500538 (= res!302355 (validKeyInArray!0 (select (arr!15529 a!3235) j!176)))))

(declare-fun b!500539 () Bool)

(declare-fun res!302364 () Bool)

(assert (=> b!500539 (=> (not res!302364) (not e!293257))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!500539 (= res!302364 (validKeyInArray!0 k0!2280))))

(declare-fun b!500540 () Bool)

(declare-datatypes ((Unit!15060 0))(
  ( (Unit!15061) )
))
(declare-fun e!293259 () Unit!15060)

(declare-fun Unit!15062 () Unit!15060)

(assert (=> b!500540 (= e!293259 Unit!15062)))

(declare-fun b!500541 () Bool)

(declare-fun e!293255 () Bool)

(assert (=> b!500541 (= e!293257 e!293255)))

(declare-fun res!302354 () Bool)

(assert (=> b!500541 (=> (not res!302354) (not e!293255))))

(declare-datatypes ((SeekEntryResult!3996 0))(
  ( (MissingZero!3996 (index!18166 (_ BitVec 32))) (Found!3996 (index!18167 (_ BitVec 32))) (Intermediate!3996 (undefined!4808 Bool) (index!18168 (_ BitVec 32)) (x!47201 (_ BitVec 32))) (Undefined!3996) (MissingVacant!3996 (index!18169 (_ BitVec 32))) )
))
(declare-fun lt!227179 () SeekEntryResult!3996)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500541 (= res!302354 (or (= lt!227179 (MissingZero!3996 i!1204)) (= lt!227179 (MissingVacant!3996 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32295 (_ BitVec 32)) SeekEntryResult!3996)

(assert (=> b!500541 (= lt!227179 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!500542 () Bool)

(declare-fun e!293261 () Bool)

(assert (=> b!500542 (= e!293261 false)))

(declare-fun b!500543 () Bool)

(declare-fun e!293262 () Bool)

(assert (=> b!500543 (= e!293255 (not e!293262))))

(declare-fun res!302356 () Bool)

(assert (=> b!500543 (=> res!302356 e!293262)))

(declare-fun lt!227184 () (_ BitVec 32))

(declare-fun lt!227186 () (_ BitVec 64))

(declare-fun lt!227185 () array!32295)

(declare-fun lt!227180 () SeekEntryResult!3996)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32295 (_ BitVec 32)) SeekEntryResult!3996)

(assert (=> b!500543 (= res!302356 (= lt!227180 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227184 lt!227186 lt!227185 mask!3524)))))

(declare-fun lt!227183 () (_ BitVec 32))

(assert (=> b!500543 (= lt!227180 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227183 (select (arr!15529 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500543 (= lt!227184 (toIndex!0 lt!227186 mask!3524))))

(assert (=> b!500543 (= lt!227186 (select (store (arr!15529 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!500543 (= lt!227183 (toIndex!0 (select (arr!15529 a!3235) j!176) mask!3524))))

(assert (=> b!500543 (= lt!227185 (array!32296 (store (arr!15529 a!3235) i!1204 k0!2280) (size!15893 a!3235)))))

(declare-fun e!293258 () Bool)

(assert (=> b!500543 e!293258))

(declare-fun res!302357 () Bool)

(assert (=> b!500543 (=> (not res!302357) (not e!293258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32295 (_ BitVec 32)) Bool)

(assert (=> b!500543 (= res!302357 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227187 () Unit!15060)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32295 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15060)

(assert (=> b!500543 (= lt!227187 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500544 () Bool)

(assert (=> b!500544 (= e!293258 (= (seekEntryOrOpen!0 (select (arr!15529 a!3235) j!176) a!3235 mask!3524) (Found!3996 j!176)))))

(declare-fun b!500545 () Bool)

(declare-fun res!302362 () Bool)

(assert (=> b!500545 (=> (not res!302362) (not e!293257))))

(declare-fun arrayContainsKey!0 (array!32295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500545 (= res!302362 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500546 () Bool)

(declare-fun res!302366 () Bool)

(assert (=> b!500546 (=> (not res!302366) (not e!293257))))

(assert (=> b!500546 (= res!302366 (and (= (size!15893 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15893 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15893 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!302359 () Bool)

(assert (=> start!45470 (=> (not res!302359) (not e!293257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45470 (= res!302359 (validMask!0 mask!3524))))

(assert (=> start!45470 e!293257))

(assert (=> start!45470 true))

(declare-fun array_inv!11325 (array!32295) Bool)

(assert (=> start!45470 (array_inv!11325 a!3235)))

(declare-fun b!500547 () Bool)

(declare-fun res!302363 () Bool)

(assert (=> b!500547 (=> res!302363 e!293262)))

(get-info :version)

(assert (=> b!500547 (= res!302363 (or (undefined!4808 lt!227180) (not ((_ is Intermediate!3996) lt!227180))))))

(declare-fun b!500548 () Bool)

(declare-fun res!302365 () Bool)

(assert (=> b!500548 (=> (not res!302365) (not e!293255))))

(assert (=> b!500548 (= res!302365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500549 () Bool)

(declare-fun res!302361 () Bool)

(assert (=> b!500549 (=> (not res!302361) (not e!293255))))

(declare-datatypes ((List!9687 0))(
  ( (Nil!9684) (Cons!9683 (h!10557 (_ BitVec 64)) (t!15915 List!9687)) )
))
(declare-fun arrayNoDuplicates!0 (array!32295 (_ BitVec 32) List!9687) Bool)

(assert (=> b!500549 (= res!302361 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9684))))

(declare-fun b!500550 () Bool)

(declare-fun e!293256 () Bool)

(assert (=> b!500550 (= e!293262 e!293256)))

(declare-fun res!302360 () Bool)

(assert (=> b!500550 (=> res!302360 e!293256)))

(assert (=> b!500550 (= res!302360 (or (bvsgt #b00000000000000000000000000000000 (x!47201 lt!227180)) (bvsgt (x!47201 lt!227180) #b01111111111111111111111111111110) (bvslt lt!227183 #b00000000000000000000000000000000) (bvsge lt!227183 (size!15893 a!3235)) (bvslt (index!18168 lt!227180) #b00000000000000000000000000000000) (bvsge (index!18168 lt!227180) (size!15893 a!3235)) (not (= lt!227180 (Intermediate!3996 false (index!18168 lt!227180) (x!47201 lt!227180))))))))

(assert (=> b!500550 (and (or (= (select (arr!15529 a!3235) (index!18168 lt!227180)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15529 a!3235) (index!18168 lt!227180)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15529 a!3235) (index!18168 lt!227180)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15529 a!3235) (index!18168 lt!227180)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227188 () Unit!15060)

(assert (=> b!500550 (= lt!227188 e!293259)))

(declare-fun c!59369 () Bool)

(assert (=> b!500550 (= c!59369 (= (select (arr!15529 a!3235) (index!18168 lt!227180)) (select (arr!15529 a!3235) j!176)))))

(assert (=> b!500550 (and (bvslt (x!47201 lt!227180) #b01111111111111111111111111111110) (or (= (select (arr!15529 a!3235) (index!18168 lt!227180)) (select (arr!15529 a!3235) j!176)) (= (select (arr!15529 a!3235) (index!18168 lt!227180)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15529 a!3235) (index!18168 lt!227180)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500551 () Bool)

(declare-fun Unit!15063 () Unit!15060)

(assert (=> b!500551 (= e!293259 Unit!15063)))

(declare-fun lt!227182 () Unit!15060)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32295 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15060)

(assert (=> b!500551 (= lt!227182 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227183 #b00000000000000000000000000000000 (index!18168 lt!227180) (x!47201 lt!227180) mask!3524))))

(declare-fun res!302358 () Bool)

(assert (=> b!500551 (= res!302358 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227183 lt!227186 lt!227185 mask!3524) (Intermediate!3996 false (index!18168 lt!227180) (x!47201 lt!227180))))))

(assert (=> b!500551 (=> (not res!302358) (not e!293261))))

(assert (=> b!500551 e!293261))

(declare-fun b!500552 () Bool)

(assert (=> b!500552 (= e!293256 true)))

(declare-fun lt!227181 () SeekEntryResult!3996)

(assert (=> b!500552 (= lt!227181 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227183 lt!227186 lt!227185 mask!3524))))

(assert (= (and start!45470 res!302359) b!500546))

(assert (= (and b!500546 res!302366) b!500538))

(assert (= (and b!500538 res!302355) b!500539))

(assert (= (and b!500539 res!302364) b!500545))

(assert (= (and b!500545 res!302362) b!500541))

(assert (= (and b!500541 res!302354) b!500548))

(assert (= (and b!500548 res!302365) b!500549))

(assert (= (and b!500549 res!302361) b!500543))

(assert (= (and b!500543 res!302357) b!500544))

(assert (= (and b!500543 (not res!302356)) b!500547))

(assert (= (and b!500547 (not res!302363)) b!500550))

(assert (= (and b!500550 c!59369) b!500551))

(assert (= (and b!500550 (not c!59369)) b!500540))

(assert (= (and b!500551 res!302358) b!500542))

(assert (= (and b!500550 (not res!302360)) b!500552))

(declare-fun m!481665 () Bool)

(assert (=> b!500550 m!481665))

(declare-fun m!481667 () Bool)

(assert (=> b!500550 m!481667))

(assert (=> b!500544 m!481667))

(assert (=> b!500544 m!481667))

(declare-fun m!481669 () Bool)

(assert (=> b!500544 m!481669))

(declare-fun m!481671 () Bool)

(assert (=> b!500541 m!481671))

(declare-fun m!481673 () Bool)

(assert (=> b!500545 m!481673))

(declare-fun m!481675 () Bool)

(assert (=> b!500543 m!481675))

(declare-fun m!481677 () Bool)

(assert (=> b!500543 m!481677))

(declare-fun m!481679 () Bool)

(assert (=> b!500543 m!481679))

(declare-fun m!481681 () Bool)

(assert (=> b!500543 m!481681))

(assert (=> b!500543 m!481667))

(declare-fun m!481683 () Bool)

(assert (=> b!500543 m!481683))

(assert (=> b!500543 m!481667))

(declare-fun m!481685 () Bool)

(assert (=> b!500543 m!481685))

(assert (=> b!500543 m!481667))

(declare-fun m!481687 () Bool)

(assert (=> b!500543 m!481687))

(declare-fun m!481689 () Bool)

(assert (=> b!500543 m!481689))

(declare-fun m!481691 () Bool)

(assert (=> b!500548 m!481691))

(declare-fun m!481693 () Bool)

(assert (=> b!500552 m!481693))

(declare-fun m!481695 () Bool)

(assert (=> b!500549 m!481695))

(declare-fun m!481697 () Bool)

(assert (=> b!500539 m!481697))

(declare-fun m!481699 () Bool)

(assert (=> start!45470 m!481699))

(declare-fun m!481701 () Bool)

(assert (=> start!45470 m!481701))

(assert (=> b!500538 m!481667))

(assert (=> b!500538 m!481667))

(declare-fun m!481703 () Bool)

(assert (=> b!500538 m!481703))

(declare-fun m!481705 () Bool)

(assert (=> b!500551 m!481705))

(assert (=> b!500551 m!481693))

(check-sat (not b!500538) (not b!500548) (not b!500543) (not b!500545) (not start!45470) (not b!500549) (not b!500539) (not b!500552) (not b!500544) (not b!500551) (not b!500541))
