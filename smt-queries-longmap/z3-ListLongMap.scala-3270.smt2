; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45480 () Bool)

(assert start!45480)

(declare-fun b!500760 () Bool)

(declare-fun res!302658 () Bool)

(declare-fun e!293349 () Bool)

(assert (=> b!500760 (=> (not res!302658) (not e!293349))))

(declare-datatypes ((array!32315 0))(
  ( (array!32316 (arr!15539 (Array (_ BitVec 32) (_ BitVec 64))) (size!15904 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32315)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500760 (= res!302658 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500761 () Bool)

(declare-fun res!302653 () Bool)

(assert (=> b!500761 (=> (not res!302653) (not e!293349))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500761 (= res!302653 (validKeyInArray!0 k0!2280))))

(declare-fun b!500762 () Bool)

(declare-fun res!302657 () Bool)

(declare-fun e!293344 () Bool)

(assert (=> b!500762 (=> (not res!302657) (not e!293344))))

(declare-datatypes ((List!9736 0))(
  ( (Nil!9733) (Cons!9732 (h!10606 (_ BitVec 64)) (t!15955 List!9736)) )
))
(declare-fun arrayNoDuplicates!0 (array!32315 (_ BitVec 32) List!9736) Bool)

(assert (=> b!500762 (= res!302657 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9733))))

(declare-fun b!500763 () Bool)

(declare-fun res!302663 () Bool)

(declare-fun e!293348 () Bool)

(assert (=> b!500763 (=> res!302663 e!293348)))

(declare-datatypes ((SeekEntryResult!4003 0))(
  ( (MissingZero!4003 (index!18194 (_ BitVec 32))) (Found!4003 (index!18195 (_ BitVec 32))) (Intermediate!4003 (undefined!4815 Bool) (index!18196 (_ BitVec 32)) (x!47235 (_ BitVec 32))) (Undefined!4003) (MissingVacant!4003 (index!18197 (_ BitVec 32))) )
))
(declare-fun lt!227276 () SeekEntryResult!4003)

(get-info :version)

(assert (=> b!500763 (= res!302663 (or (undefined!4815 lt!227276) (not ((_ is Intermediate!4003) lt!227276))))))

(declare-fun b!500764 () Bool)

(declare-fun res!302652 () Bool)

(assert (=> b!500764 (=> (not res!302652) (not e!293349))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!500764 (= res!302652 (and (= (size!15904 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15904 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15904 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500765 () Bool)

(assert (=> b!500765 (= e!293349 e!293344)))

(declare-fun res!302660 () Bool)

(assert (=> b!500765 (=> (not res!302660) (not e!293344))))

(declare-fun lt!227278 () SeekEntryResult!4003)

(assert (=> b!500765 (= res!302660 (or (= lt!227278 (MissingZero!4003 i!1204)) (= lt!227278 (MissingVacant!4003 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32315 (_ BitVec 32)) SeekEntryResult!4003)

(assert (=> b!500765 (= lt!227278 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!500766 () Bool)

(declare-datatypes ((Unit!15082 0))(
  ( (Unit!15083) )
))
(declare-fun e!293346 () Unit!15082)

(declare-fun Unit!15084 () Unit!15082)

(assert (=> b!500766 (= e!293346 Unit!15084)))

(declare-fun lt!227277 () Unit!15082)

(declare-fun lt!227279 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32315 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15082)

(assert (=> b!500766 (= lt!227277 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227279 #b00000000000000000000000000000000 (index!18196 lt!227276) (x!47235 lt!227276) mask!3524))))

(declare-fun res!302662 () Bool)

(declare-fun lt!227283 () array!32315)

(declare-fun lt!227281 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32315 (_ BitVec 32)) SeekEntryResult!4003)

(assert (=> b!500766 (= res!302662 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227279 lt!227281 lt!227283 mask!3524) (Intermediate!4003 false (index!18196 lt!227276) (x!47235 lt!227276))))))

(declare-fun e!293345 () Bool)

(assert (=> b!500766 (=> (not res!302662) (not e!293345))))

(assert (=> b!500766 e!293345))

(declare-fun b!500767 () Bool)

(assert (=> b!500767 (= e!293348 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!500767 (= (index!18196 lt!227276) i!1204)))

(declare-fun lt!227282 () Unit!15082)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32315 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15082)

(assert (=> b!500767 (= lt!227282 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!227279 #b00000000000000000000000000000000 (index!18196 lt!227276) (x!47235 lt!227276) mask!3524))))

(assert (=> b!500767 (and (or (= (select (arr!15539 a!3235) (index!18196 lt!227276)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15539 a!3235) (index!18196 lt!227276)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15539 a!3235) (index!18196 lt!227276)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15539 a!3235) (index!18196 lt!227276)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227275 () Unit!15082)

(assert (=> b!500767 (= lt!227275 e!293346)))

(declare-fun c!59331 () Bool)

(assert (=> b!500767 (= c!59331 (= (select (arr!15539 a!3235) (index!18196 lt!227276)) (select (arr!15539 a!3235) j!176)))))

(assert (=> b!500767 (and (bvslt (x!47235 lt!227276) #b01111111111111111111111111111110) (or (= (select (arr!15539 a!3235) (index!18196 lt!227276)) (select (arr!15539 a!3235) j!176)) (= (select (arr!15539 a!3235) (index!18196 lt!227276)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15539 a!3235) (index!18196 lt!227276)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500768 () Bool)

(declare-fun Unit!15085 () Unit!15082)

(assert (=> b!500768 (= e!293346 Unit!15085)))

(declare-fun res!302655 () Bool)

(assert (=> start!45480 (=> (not res!302655) (not e!293349))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45480 (= res!302655 (validMask!0 mask!3524))))

(assert (=> start!45480 e!293349))

(assert (=> start!45480 true))

(declare-fun array_inv!11422 (array!32315) Bool)

(assert (=> start!45480 (array_inv!11422 a!3235)))

(declare-fun b!500769 () Bool)

(assert (=> b!500769 (= e!293345 false)))

(declare-fun b!500770 () Bool)

(declare-fun e!293343 () Bool)

(assert (=> b!500770 (= e!293343 (= (seekEntryOrOpen!0 (select (arr!15539 a!3235) j!176) a!3235 mask!3524) (Found!4003 j!176)))))

(declare-fun b!500771 () Bool)

(declare-fun res!302656 () Bool)

(assert (=> b!500771 (=> (not res!302656) (not e!293349))))

(assert (=> b!500771 (= res!302656 (validKeyInArray!0 (select (arr!15539 a!3235) j!176)))))

(declare-fun b!500772 () Bool)

(declare-fun res!302659 () Bool)

(assert (=> b!500772 (=> (not res!302659) (not e!293344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32315 (_ BitVec 32)) Bool)

(assert (=> b!500772 (= res!302659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500773 () Bool)

(assert (=> b!500773 (= e!293344 (not e!293348))))

(declare-fun res!302654 () Bool)

(assert (=> b!500773 (=> res!302654 e!293348)))

(declare-fun lt!227280 () (_ BitVec 32))

(assert (=> b!500773 (= res!302654 (= lt!227276 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227280 lt!227281 lt!227283 mask!3524)))))

(assert (=> b!500773 (= lt!227276 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227279 (select (arr!15539 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500773 (= lt!227280 (toIndex!0 lt!227281 mask!3524))))

(assert (=> b!500773 (= lt!227281 (select (store (arr!15539 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!500773 (= lt!227279 (toIndex!0 (select (arr!15539 a!3235) j!176) mask!3524))))

(assert (=> b!500773 (= lt!227283 (array!32316 (store (arr!15539 a!3235) i!1204 k0!2280) (size!15904 a!3235)))))

(assert (=> b!500773 e!293343))

(declare-fun res!302661 () Bool)

(assert (=> b!500773 (=> (not res!302661) (not e!293343))))

(assert (=> b!500773 (= res!302661 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227284 () Unit!15082)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32315 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15082)

(assert (=> b!500773 (= lt!227284 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45480 res!302655) b!500764))

(assert (= (and b!500764 res!302652) b!500771))

(assert (= (and b!500771 res!302656) b!500761))

(assert (= (and b!500761 res!302653) b!500760))

(assert (= (and b!500760 res!302658) b!500765))

(assert (= (and b!500765 res!302660) b!500772))

(assert (= (and b!500772 res!302659) b!500762))

(assert (= (and b!500762 res!302657) b!500773))

(assert (= (and b!500773 res!302661) b!500770))

(assert (= (and b!500773 (not res!302654)) b!500763))

(assert (= (and b!500763 (not res!302663)) b!500767))

(assert (= (and b!500767 c!59331) b!500766))

(assert (= (and b!500767 (not c!59331)) b!500768))

(assert (= (and b!500766 res!302662) b!500769))

(declare-fun m!481375 () Bool)

(assert (=> b!500766 m!481375))

(declare-fun m!481377 () Bool)

(assert (=> b!500766 m!481377))

(declare-fun m!481379 () Bool)

(assert (=> b!500765 m!481379))

(declare-fun m!481381 () Bool)

(assert (=> b!500771 m!481381))

(assert (=> b!500771 m!481381))

(declare-fun m!481383 () Bool)

(assert (=> b!500771 m!481383))

(declare-fun m!481385 () Bool)

(assert (=> b!500761 m!481385))

(declare-fun m!481387 () Bool)

(assert (=> b!500772 m!481387))

(declare-fun m!481389 () Bool)

(assert (=> b!500773 m!481389))

(declare-fun m!481391 () Bool)

(assert (=> b!500773 m!481391))

(declare-fun m!481393 () Bool)

(assert (=> b!500773 m!481393))

(declare-fun m!481395 () Bool)

(assert (=> b!500773 m!481395))

(assert (=> b!500773 m!481381))

(declare-fun m!481397 () Bool)

(assert (=> b!500773 m!481397))

(assert (=> b!500773 m!481381))

(declare-fun m!481399 () Bool)

(assert (=> b!500773 m!481399))

(assert (=> b!500773 m!481381))

(declare-fun m!481401 () Bool)

(assert (=> b!500773 m!481401))

(declare-fun m!481403 () Bool)

(assert (=> b!500773 m!481403))

(declare-fun m!481405 () Bool)

(assert (=> b!500767 m!481405))

(declare-fun m!481407 () Bool)

(assert (=> b!500767 m!481407))

(assert (=> b!500767 m!481381))

(declare-fun m!481409 () Bool)

(assert (=> b!500762 m!481409))

(declare-fun m!481411 () Bool)

(assert (=> start!45480 m!481411))

(declare-fun m!481413 () Bool)

(assert (=> start!45480 m!481413))

(declare-fun m!481415 () Bool)

(assert (=> b!500760 m!481415))

(assert (=> b!500770 m!481381))

(assert (=> b!500770 m!481381))

(declare-fun m!481417 () Bool)

(assert (=> b!500770 m!481417))

(check-sat (not start!45480) (not b!500760) (not b!500770) (not b!500766) (not b!500767) (not b!500765) (not b!500773) (not b!500762) (not b!500761) (not b!500771) (not b!500772))
(check-sat)
