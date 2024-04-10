; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47708 () Bool)

(assert start!47708)

(declare-fun b!524664 () Bool)

(declare-fun res!321547 () Bool)

(declare-fun e!305974 () Bool)

(assert (=> b!524664 (=> (not res!321547) (not e!305974))))

(declare-datatypes ((array!33345 0))(
  ( (array!33346 (arr!16024 (Array (_ BitVec 32) (_ BitVec 64))) (size!16388 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33345)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524664 (= res!321547 (validKeyInArray!0 (select (arr!16024 a!3235) j!176)))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!305972 () Bool)

(declare-fun b!524665 () Bool)

(declare-datatypes ((SeekEntryResult!4491 0))(
  ( (MissingZero!4491 (index!20176 (_ BitVec 32))) (Found!4491 (index!20177 (_ BitVec 32))) (Intermediate!4491 (undefined!5303 Bool) (index!20178 (_ BitVec 32)) (x!49160 (_ BitVec 32))) (Undefined!4491) (MissingVacant!4491 (index!20179 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33345 (_ BitVec 32)) SeekEntryResult!4491)

(assert (=> b!524665 (= e!305972 (= (seekEntryOrOpen!0 (select (arr!16024 a!3235) j!176) a!3235 mask!3524) (Found!4491 j!176)))))

(declare-fun b!524666 () Bool)

(declare-fun res!321540 () Bool)

(declare-fun e!305973 () Bool)

(assert (=> b!524666 (=> (not res!321540) (not e!305973))))

(declare-datatypes ((List!10182 0))(
  ( (Nil!10179) (Cons!10178 (h!11109 (_ BitVec 64)) (t!16410 List!10182)) )
))
(declare-fun arrayNoDuplicates!0 (array!33345 (_ BitVec 32) List!10182) Bool)

(assert (=> b!524666 (= res!321540 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10179))))

(declare-fun e!305970 () Bool)

(declare-fun lt!240840 () array!33345)

(declare-fun b!524667 () Bool)

(declare-fun lt!240841 () SeekEntryResult!4491)

(declare-fun lt!240848 () (_ BitVec 64))

(declare-fun lt!240847 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33345 (_ BitVec 32)) SeekEntryResult!4491)

(assert (=> b!524667 (= e!305970 (not (= lt!240841 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240847 lt!240848 lt!240840 mask!3524))))))

(declare-fun b!524668 () Bool)

(declare-fun res!321551 () Bool)

(assert (=> b!524668 (=> (not res!321551) (not e!305973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33345 (_ BitVec 32)) Bool)

(assert (=> b!524668 (= res!321551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524669 () Bool)

(declare-datatypes ((Unit!16416 0))(
  ( (Unit!16417) )
))
(declare-fun e!305975 () Unit!16416)

(declare-fun Unit!16418 () Unit!16416)

(assert (=> b!524669 (= e!305975 Unit!16418)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!240842 () Unit!16416)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33345 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16416)

(assert (=> b!524669 (= lt!240842 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240847 #b00000000000000000000000000000000 (index!20178 lt!240841) (x!49160 lt!240841) mask!3524))))

(declare-fun res!321539 () Bool)

(assert (=> b!524669 (= res!321539 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240847 lt!240848 lt!240840 mask!3524) (Intermediate!4491 false (index!20178 lt!240841) (x!49160 lt!240841))))))

(declare-fun e!305969 () Bool)

(assert (=> b!524669 (=> (not res!321539) (not e!305969))))

(assert (=> b!524669 e!305969))

(declare-fun b!524670 () Bool)

(declare-fun res!321549 () Bool)

(assert (=> b!524670 (=> (not res!321549) (not e!305974))))

(assert (=> b!524670 (= res!321549 (and (= (size!16388 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16388 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16388 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524671 () Bool)

(declare-fun e!305976 () Bool)

(assert (=> b!524671 (= e!305976 e!305970)))

(declare-fun res!321542 () Bool)

(assert (=> b!524671 (=> res!321542 e!305970)))

(assert (=> b!524671 (= res!321542 (or (bvsgt #b00000000000000000000000000000000 (x!49160 lt!240841)) (bvsgt (x!49160 lt!240841) #b01111111111111111111111111111110) (bvslt lt!240847 #b00000000000000000000000000000000) (bvsge lt!240847 (size!16388 a!3235)) (bvslt (index!20178 lt!240841) #b00000000000000000000000000000000) (bvsge (index!20178 lt!240841) (size!16388 a!3235)) (not (= lt!240841 (Intermediate!4491 false (index!20178 lt!240841) (x!49160 lt!240841))))))))

(declare-fun lt!240845 () Bool)

(declare-fun lt!240849 () (_ BitVec 64))

(assert (=> b!524671 (and (or lt!240845 (= lt!240849 #b1000000000000000000000000000000000000000000000000000000000000000)) (not lt!240845) (= lt!240849 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!524671 (= lt!240845 (= lt!240849 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240843 () Unit!16416)

(assert (=> b!524671 (= lt!240843 e!305975)))

(declare-fun c!61868 () Bool)

(assert (=> b!524671 (= c!61868 (= lt!240849 (select (arr!16024 a!3235) j!176)))))

(assert (=> b!524671 (= lt!240849 (select (arr!16024 a!3235) (index!20178 lt!240841)))))

(assert (=> b!524671 (and (bvslt (x!49160 lt!240841) #b01111111111111111111111111111110) (let ((bdg!15568 (select (arr!16024 a!3235) (index!20178 lt!240841)))) (or (= bdg!15568 (select (arr!16024 a!3235) j!176)) (= bdg!15568 #b0000000000000000000000000000000000000000000000000000000000000000) (= bdg!15568 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!524672 () Bool)

(declare-fun Unit!16419 () Unit!16416)

(assert (=> b!524672 (= e!305975 Unit!16419)))

(declare-fun b!524673 () Bool)

(assert (=> b!524673 (= e!305969 false)))

(declare-fun b!524674 () Bool)

(assert (=> b!524674 (= e!305973 (not e!305976))))

(declare-fun res!321541 () Bool)

(assert (=> b!524674 (=> res!321541 e!305976)))

(declare-fun lt!240850 () (_ BitVec 32))

(assert (=> b!524674 (= res!321541 (= lt!240841 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240850 lt!240848 lt!240840 mask!3524)))))

(assert (=> b!524674 (= lt!240841 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240847 (select (arr!16024 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524674 (= lt!240850 (toIndex!0 lt!240848 mask!3524))))

(assert (=> b!524674 (= lt!240848 (select (store (arr!16024 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!524674 (= lt!240847 (toIndex!0 (select (arr!16024 a!3235) j!176) mask!3524))))

(assert (=> b!524674 (= lt!240840 (array!33346 (store (arr!16024 a!3235) i!1204 k0!2280) (size!16388 a!3235)))))

(assert (=> b!524674 e!305972))

(declare-fun res!321546 () Bool)

(assert (=> b!524674 (=> (not res!321546) (not e!305972))))

(assert (=> b!524674 (= res!321546 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240844 () Unit!16416)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33345 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16416)

(assert (=> b!524674 (= lt!240844 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524675 () Bool)

(declare-fun res!321544 () Bool)

(assert (=> b!524675 (=> res!321544 e!305976)))

(get-info :version)

(assert (=> b!524675 (= res!321544 (or (undefined!5303 lt!240841) (not ((_ is Intermediate!4491) lt!240841))))))

(declare-fun b!524676 () Bool)

(assert (=> b!524676 (= e!305974 e!305973)))

(declare-fun res!321548 () Bool)

(assert (=> b!524676 (=> (not res!321548) (not e!305973))))

(declare-fun lt!240846 () SeekEntryResult!4491)

(assert (=> b!524676 (= res!321548 (or (= lt!240846 (MissingZero!4491 i!1204)) (= lt!240846 (MissingVacant!4491 i!1204))))))

(assert (=> b!524676 (= lt!240846 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!524678 () Bool)

(declare-fun res!321543 () Bool)

(assert (=> b!524678 (=> (not res!321543) (not e!305974))))

(declare-fun arrayContainsKey!0 (array!33345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524678 (= res!321543 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524677 () Bool)

(declare-fun res!321550 () Bool)

(assert (=> b!524677 (=> (not res!321550) (not e!305974))))

(assert (=> b!524677 (= res!321550 (validKeyInArray!0 k0!2280))))

(declare-fun res!321545 () Bool)

(assert (=> start!47708 (=> (not res!321545) (not e!305974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47708 (= res!321545 (validMask!0 mask!3524))))

(assert (=> start!47708 e!305974))

(assert (=> start!47708 true))

(declare-fun array_inv!11820 (array!33345) Bool)

(assert (=> start!47708 (array_inv!11820 a!3235)))

(assert (= (and start!47708 res!321545) b!524670))

(assert (= (and b!524670 res!321549) b!524664))

(assert (= (and b!524664 res!321547) b!524677))

(assert (= (and b!524677 res!321550) b!524678))

(assert (= (and b!524678 res!321543) b!524676))

(assert (= (and b!524676 res!321548) b!524668))

(assert (= (and b!524668 res!321551) b!524666))

(assert (= (and b!524666 res!321540) b!524674))

(assert (= (and b!524674 res!321546) b!524665))

(assert (= (and b!524674 (not res!321541)) b!524675))

(assert (= (and b!524675 (not res!321544)) b!524671))

(assert (= (and b!524671 c!61868) b!524669))

(assert (= (and b!524671 (not c!61868)) b!524672))

(assert (= (and b!524669 res!321539) b!524673))

(assert (= (and b!524671 (not res!321542)) b!524667))

(declare-fun m!505293 () Bool)

(assert (=> b!524664 m!505293))

(assert (=> b!524664 m!505293))

(declare-fun m!505295 () Bool)

(assert (=> b!524664 m!505295))

(declare-fun m!505297 () Bool)

(assert (=> b!524678 m!505297))

(declare-fun m!505299 () Bool)

(assert (=> b!524676 m!505299))

(declare-fun m!505301 () Bool)

(assert (=> b!524677 m!505301))

(declare-fun m!505303 () Bool)

(assert (=> b!524668 m!505303))

(declare-fun m!505305 () Bool)

(assert (=> b!524669 m!505305))

(declare-fun m!505307 () Bool)

(assert (=> b!524669 m!505307))

(declare-fun m!505309 () Bool)

(assert (=> start!47708 m!505309))

(declare-fun m!505311 () Bool)

(assert (=> start!47708 m!505311))

(declare-fun m!505313 () Bool)

(assert (=> b!524674 m!505313))

(declare-fun m!505315 () Bool)

(assert (=> b!524674 m!505315))

(declare-fun m!505317 () Bool)

(assert (=> b!524674 m!505317))

(declare-fun m!505319 () Bool)

(assert (=> b!524674 m!505319))

(declare-fun m!505321 () Bool)

(assert (=> b!524674 m!505321))

(assert (=> b!524674 m!505293))

(declare-fun m!505323 () Bool)

(assert (=> b!524674 m!505323))

(assert (=> b!524674 m!505293))

(declare-fun m!505325 () Bool)

(assert (=> b!524674 m!505325))

(assert (=> b!524674 m!505293))

(declare-fun m!505327 () Bool)

(assert (=> b!524674 m!505327))

(assert (=> b!524667 m!505307))

(declare-fun m!505329 () Bool)

(assert (=> b!524666 m!505329))

(assert (=> b!524665 m!505293))

(assert (=> b!524665 m!505293))

(declare-fun m!505331 () Bool)

(assert (=> b!524665 m!505331))

(assert (=> b!524671 m!505293))

(declare-fun m!505333 () Bool)

(assert (=> b!524671 m!505333))

(check-sat (not b!524667) (not b!524674) (not b!524669) (not b!524665) (not b!524666) (not b!524668) (not b!524676) (not b!524664) (not b!524678) (not start!47708) (not b!524677))
(check-sat)
