; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45636 () Bool)

(assert start!45636)

(declare-fun b!503181 () Bool)

(declare-fun e!294659 () Bool)

(declare-fun e!294660 () Bool)

(assert (=> b!503181 (= e!294659 e!294660)))

(declare-fun res!304624 () Bool)

(assert (=> b!503181 (=> res!304624 e!294660)))

(declare-datatypes ((SeekEntryResult!4045 0))(
  ( (MissingZero!4045 (index!18368 (_ BitVec 32))) (Found!4045 (index!18369 (_ BitVec 32))) (Intermediate!4045 (undefined!4857 Bool) (index!18370 (_ BitVec 32)) (x!47401 (_ BitVec 32))) (Undefined!4045) (MissingVacant!4045 (index!18371 (_ BitVec 32))) )
))
(declare-fun lt!228802 () SeekEntryResult!4045)

(declare-datatypes ((array!32402 0))(
  ( (array!32403 (arr!15581 (Array (_ BitVec 32) (_ BitVec 64))) (size!15946 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32402)

(declare-fun lt!228800 () (_ BitVec 32))

(assert (=> b!503181 (= res!304624 (or (bvsgt (x!47401 lt!228802) #b01111111111111111111111111111110) (bvslt lt!228800 #b00000000000000000000000000000000) (bvsge lt!228800 (size!15946 a!3235)) (bvslt (index!18370 lt!228802) #b00000000000000000000000000000000) (bvsge (index!18370 lt!228802) (size!15946 a!3235)) (not (= lt!228802 (Intermediate!4045 false (index!18370 lt!228802) (x!47401 lt!228802))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!503181 (= (index!18370 lt!228802) i!1204)))

(declare-datatypes ((Unit!15250 0))(
  ( (Unit!15251) )
))
(declare-fun lt!228803 () Unit!15250)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32402 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15250)

(assert (=> b!503181 (= lt!228803 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228800 #b00000000000000000000000000000000 (index!18370 lt!228802) (x!47401 lt!228802) mask!3524))))

(assert (=> b!503181 (and (or (= (select (arr!15581 a!3235) (index!18370 lt!228802)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15581 a!3235) (index!18370 lt!228802)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15581 a!3235) (index!18370 lt!228802)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15581 a!3235) (index!18370 lt!228802)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228799 () Unit!15250)

(declare-fun e!294661 () Unit!15250)

(assert (=> b!503181 (= lt!228799 e!294661)))

(declare-fun c!59559 () Bool)

(assert (=> b!503181 (= c!59559 (= (select (arr!15581 a!3235) (index!18370 lt!228802)) (select (arr!15581 a!3235) j!176)))))

(assert (=> b!503181 (and (bvslt (x!47401 lt!228802) #b01111111111111111111111111111110) (or (= (select (arr!15581 a!3235) (index!18370 lt!228802)) (select (arr!15581 a!3235) j!176)) (= (select (arr!15581 a!3235) (index!18370 lt!228802)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15581 a!3235) (index!18370 lt!228802)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!294657 () Bool)

(declare-fun b!503182 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32402 (_ BitVec 32)) SeekEntryResult!4045)

(assert (=> b!503182 (= e!294657 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228800 (index!18370 lt!228802) (select (arr!15581 a!3235) j!176) a!3235 mask!3524) (Found!4045 j!176))))))

(declare-fun res!304626 () Bool)

(declare-fun e!294655 () Bool)

(assert (=> start!45636 (=> (not res!304626) (not e!294655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45636 (= res!304626 (validMask!0 mask!3524))))

(assert (=> start!45636 e!294655))

(assert (=> start!45636 true))

(declare-fun array_inv!11464 (array!32402) Bool)

(assert (=> start!45636 (array_inv!11464 a!3235)))

(declare-fun b!503183 () Bool)

(declare-fun res!304633 () Bool)

(assert (=> b!503183 (=> res!304633 e!294660)))

(assert (=> b!503183 (= res!304633 e!294657)))

(declare-fun res!304634 () Bool)

(assert (=> b!503183 (=> (not res!304634) (not e!294657))))

(assert (=> b!503183 (= res!304634 (bvsgt #b00000000000000000000000000000000 (x!47401 lt!228802)))))

(declare-fun b!503184 () Bool)

(declare-fun e!294663 () Bool)

(assert (=> b!503184 (= e!294663 false)))

(declare-fun b!503185 () Bool)

(declare-fun e!294658 () Bool)

(assert (=> b!503185 (= e!294655 e!294658)))

(declare-fun res!304620 () Bool)

(assert (=> b!503185 (=> (not res!304620) (not e!294658))))

(declare-fun lt!228798 () SeekEntryResult!4045)

(assert (=> b!503185 (= res!304620 (or (= lt!228798 (MissingZero!4045 i!1204)) (= lt!228798 (MissingVacant!4045 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32402 (_ BitVec 32)) SeekEntryResult!4045)

(assert (=> b!503185 (= lt!228798 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!503186 () Bool)

(declare-fun res!304629 () Bool)

(assert (=> b!503186 (=> (not res!304629) (not e!294658))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32402 (_ BitVec 32)) Bool)

(assert (=> b!503186 (= res!304629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503187 () Bool)

(assert (=> b!503187 (= e!294658 (not e!294659))))

(declare-fun res!304631 () Bool)

(assert (=> b!503187 (=> res!304631 e!294659)))

(declare-fun lt!228806 () array!32402)

(declare-fun lt!228801 () (_ BitVec 64))

(declare-fun lt!228805 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32402 (_ BitVec 32)) SeekEntryResult!4045)

(assert (=> b!503187 (= res!304631 (= lt!228802 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228805 lt!228801 lt!228806 mask!3524)))))

(assert (=> b!503187 (= lt!228802 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228800 (select (arr!15581 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503187 (= lt!228805 (toIndex!0 lt!228801 mask!3524))))

(assert (=> b!503187 (= lt!228801 (select (store (arr!15581 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!503187 (= lt!228800 (toIndex!0 (select (arr!15581 a!3235) j!176) mask!3524))))

(assert (=> b!503187 (= lt!228806 (array!32403 (store (arr!15581 a!3235) i!1204 k0!2280) (size!15946 a!3235)))))

(declare-fun e!294656 () Bool)

(assert (=> b!503187 e!294656))

(declare-fun res!304630 () Bool)

(assert (=> b!503187 (=> (not res!304630) (not e!294656))))

(assert (=> b!503187 (= res!304630 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228807 () Unit!15250)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32402 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15250)

(assert (=> b!503187 (= lt!228807 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503188 () Bool)

(declare-fun Unit!15252 () Unit!15250)

(assert (=> b!503188 (= e!294661 Unit!15252)))

(declare-fun lt!228808 () Unit!15250)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32402 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15250)

(assert (=> b!503188 (= lt!228808 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228800 #b00000000000000000000000000000000 (index!18370 lt!228802) (x!47401 lt!228802) mask!3524))))

(declare-fun res!304621 () Bool)

(assert (=> b!503188 (= res!304621 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228800 lt!228801 lt!228806 mask!3524) (Intermediate!4045 false (index!18370 lt!228802) (x!47401 lt!228802))))))

(assert (=> b!503188 (=> (not res!304621) (not e!294663))))

(assert (=> b!503188 e!294663))

(declare-fun b!503189 () Bool)

(assert (=> b!503189 (= e!294660 true)))

(declare-fun lt!228804 () SeekEntryResult!4045)

(assert (=> b!503189 (= lt!228804 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228800 lt!228801 lt!228806 mask!3524))))

(declare-fun b!503190 () Bool)

(declare-fun Unit!15253 () Unit!15250)

(assert (=> b!503190 (= e!294661 Unit!15253)))

(declare-fun b!503191 () Bool)

(assert (=> b!503191 (= e!294656 (= (seekEntryOrOpen!0 (select (arr!15581 a!3235) j!176) a!3235 mask!3524) (Found!4045 j!176)))))

(declare-fun b!503192 () Bool)

(declare-fun res!304622 () Bool)

(assert (=> b!503192 (=> (not res!304622) (not e!294655))))

(assert (=> b!503192 (= res!304622 (and (= (size!15946 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15946 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15946 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503193 () Bool)

(declare-fun res!304628 () Bool)

(assert (=> b!503193 (=> (not res!304628) (not e!294658))))

(declare-datatypes ((List!9778 0))(
  ( (Nil!9775) (Cons!9774 (h!10651 (_ BitVec 64)) (t!15997 List!9778)) )
))
(declare-fun arrayNoDuplicates!0 (array!32402 (_ BitVec 32) List!9778) Bool)

(assert (=> b!503193 (= res!304628 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9775))))

(declare-fun b!503194 () Bool)

(declare-fun res!304627 () Bool)

(assert (=> b!503194 (=> res!304627 e!294659)))

(get-info :version)

(assert (=> b!503194 (= res!304627 (or (undefined!4857 lt!228802) (not ((_ is Intermediate!4045) lt!228802))))))

(declare-fun b!503195 () Bool)

(declare-fun res!304623 () Bool)

(assert (=> b!503195 (=> (not res!304623) (not e!294655))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503195 (= res!304623 (validKeyInArray!0 k0!2280))))

(declare-fun b!503196 () Bool)

(declare-fun res!304632 () Bool)

(assert (=> b!503196 (=> (not res!304632) (not e!294655))))

(declare-fun arrayContainsKey!0 (array!32402 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503196 (= res!304632 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503197 () Bool)

(declare-fun res!304625 () Bool)

(assert (=> b!503197 (=> (not res!304625) (not e!294655))))

(assert (=> b!503197 (= res!304625 (validKeyInArray!0 (select (arr!15581 a!3235) j!176)))))

(assert (= (and start!45636 res!304626) b!503192))

(assert (= (and b!503192 res!304622) b!503197))

(assert (= (and b!503197 res!304625) b!503195))

(assert (= (and b!503195 res!304623) b!503196))

(assert (= (and b!503196 res!304632) b!503185))

(assert (= (and b!503185 res!304620) b!503186))

(assert (= (and b!503186 res!304629) b!503193))

(assert (= (and b!503193 res!304628) b!503187))

(assert (= (and b!503187 res!304630) b!503191))

(assert (= (and b!503187 (not res!304631)) b!503194))

(assert (= (and b!503194 (not res!304627)) b!503181))

(assert (= (and b!503181 c!59559) b!503188))

(assert (= (and b!503181 (not c!59559)) b!503190))

(assert (= (and b!503188 res!304621) b!503184))

(assert (= (and b!503181 (not res!304624)) b!503183))

(assert (= (and b!503183 res!304634) b!503182))

(assert (= (and b!503183 (not res!304633)) b!503189))

(declare-fun m!483535 () Bool)

(assert (=> b!503189 m!483535))

(declare-fun m!483537 () Bool)

(assert (=> b!503186 m!483537))

(declare-fun m!483539 () Bool)

(assert (=> b!503191 m!483539))

(assert (=> b!503191 m!483539))

(declare-fun m!483541 () Bool)

(assert (=> b!503191 m!483541))

(declare-fun m!483543 () Bool)

(assert (=> b!503196 m!483543))

(declare-fun m!483545 () Bool)

(assert (=> b!503195 m!483545))

(declare-fun m!483547 () Bool)

(assert (=> b!503188 m!483547))

(assert (=> b!503188 m!483535))

(assert (=> b!503197 m!483539))

(assert (=> b!503197 m!483539))

(declare-fun m!483549 () Bool)

(assert (=> b!503197 m!483549))

(declare-fun m!483551 () Bool)

(assert (=> start!45636 m!483551))

(declare-fun m!483553 () Bool)

(assert (=> start!45636 m!483553))

(assert (=> b!503182 m!483539))

(assert (=> b!503182 m!483539))

(declare-fun m!483555 () Bool)

(assert (=> b!503182 m!483555))

(declare-fun m!483557 () Bool)

(assert (=> b!503185 m!483557))

(declare-fun m!483559 () Bool)

(assert (=> b!503181 m!483559))

(declare-fun m!483561 () Bool)

(assert (=> b!503181 m!483561))

(assert (=> b!503181 m!483539))

(declare-fun m!483563 () Bool)

(assert (=> b!503193 m!483563))

(assert (=> b!503187 m!483539))

(declare-fun m!483565 () Bool)

(assert (=> b!503187 m!483565))

(declare-fun m!483567 () Bool)

(assert (=> b!503187 m!483567))

(declare-fun m!483569 () Bool)

(assert (=> b!503187 m!483569))

(declare-fun m!483571 () Bool)

(assert (=> b!503187 m!483571))

(declare-fun m!483573 () Bool)

(assert (=> b!503187 m!483573))

(assert (=> b!503187 m!483539))

(declare-fun m!483575 () Bool)

(assert (=> b!503187 m!483575))

(assert (=> b!503187 m!483539))

(declare-fun m!483577 () Bool)

(assert (=> b!503187 m!483577))

(declare-fun m!483579 () Bool)

(assert (=> b!503187 m!483579))

(check-sat (not b!503185) (not b!503191) (not b!503181) (not b!503197) (not b!503186) (not b!503182) (not b!503193) (not b!503187) (not b!503189) (not b!503196) (not b!503188) (not start!45636) (not b!503195))
(check-sat)
