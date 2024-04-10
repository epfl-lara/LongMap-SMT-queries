; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47456 () Bool)

(assert start!47456)

(declare-fun b!522544 () Bool)

(declare-fun res!320184 () Bool)

(declare-fun e!304773 () Bool)

(assert (=> b!522544 (=> res!320184 e!304773)))

(declare-datatypes ((SeekEntryResult!4464 0))(
  ( (MissingZero!4464 (index!20059 (_ BitVec 32))) (Found!4464 (index!20060 (_ BitVec 32))) (Intermediate!4464 (undefined!5276 Bool) (index!20061 (_ BitVec 32)) (x!49034 (_ BitVec 32))) (Undefined!4464) (MissingVacant!4464 (index!20062 (_ BitVec 32))) )
))
(declare-fun lt!239673 () SeekEntryResult!4464)

(get-info :version)

(assert (=> b!522544 (= res!320184 (or (undefined!5276 lt!239673) (not ((_ is Intermediate!4464) lt!239673))))))

(declare-fun b!522545 () Bool)

(assert (=> b!522545 (= e!304773 true)))

(declare-datatypes ((array!33282 0))(
  ( (array!33283 (arr!15997 (Array (_ BitVec 32) (_ BitVec 64))) (size!16361 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33282)

(assert (=> b!522545 (and (or (= (select (arr!15997 a!3235) (index!20061 lt!239673)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15997 a!3235) (index!20061 lt!239673)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15997 a!3235) (index!20061 lt!239673)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15997 a!3235) (index!20061 lt!239673)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16308 0))(
  ( (Unit!16309) )
))
(declare-fun lt!239669 () Unit!16308)

(declare-fun e!304769 () Unit!16308)

(assert (=> b!522545 (= lt!239669 e!304769)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun c!61481 () Bool)

(assert (=> b!522545 (= c!61481 (= (select (arr!15997 a!3235) (index!20061 lt!239673)) (select (arr!15997 a!3235) j!176)))))

(assert (=> b!522545 (and (bvslt (x!49034 lt!239673) #b01111111111111111111111111111110) (or (= (select (arr!15997 a!3235) (index!20061 lt!239673)) (select (arr!15997 a!3235) j!176)) (= (select (arr!15997 a!3235) (index!20061 lt!239673)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15997 a!3235) (index!20061 lt!239673)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522546 () Bool)

(declare-fun res!320190 () Bool)

(declare-fun e!304767 () Bool)

(assert (=> b!522546 (=> (not res!320190) (not e!304767))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33282 (_ BitVec 32)) Bool)

(assert (=> b!522546 (= res!320190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!522547 () Bool)

(declare-fun e!304770 () Bool)

(assert (=> b!522547 (= e!304770 false)))

(declare-fun res!320195 () Bool)

(declare-fun e!304768 () Bool)

(assert (=> start!47456 (=> (not res!320195) (not e!304768))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47456 (= res!320195 (validMask!0 mask!3524))))

(assert (=> start!47456 e!304768))

(assert (=> start!47456 true))

(declare-fun array_inv!11793 (array!33282) Bool)

(assert (=> start!47456 (array_inv!11793 a!3235)))

(declare-fun b!522548 () Bool)

(declare-fun res!320194 () Bool)

(assert (=> b!522548 (=> (not res!320194) (not e!304768))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!522548 (= res!320194 (validKeyInArray!0 (select (arr!15997 a!3235) j!176)))))

(declare-fun b!522549 () Bool)

(declare-fun res!320189 () Bool)

(assert (=> b!522549 (=> (not res!320189) (not e!304768))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33282 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522549 (= res!320189 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!522550 () Bool)

(declare-fun res!320188 () Bool)

(assert (=> b!522550 (=> (not res!320188) (not e!304768))))

(assert (=> b!522550 (= res!320188 (validKeyInArray!0 k0!2280))))

(declare-fun b!522551 () Bool)

(assert (=> b!522551 (= e!304768 e!304767)))

(declare-fun res!320192 () Bool)

(assert (=> b!522551 (=> (not res!320192) (not e!304767))))

(declare-fun lt!239676 () SeekEntryResult!4464)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!522551 (= res!320192 (or (= lt!239676 (MissingZero!4464 i!1204)) (= lt!239676 (MissingVacant!4464 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33282 (_ BitVec 32)) SeekEntryResult!4464)

(assert (=> b!522551 (= lt!239676 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!522552 () Bool)

(declare-fun res!320191 () Bool)

(assert (=> b!522552 (=> (not res!320191) (not e!304767))))

(declare-datatypes ((List!10155 0))(
  ( (Nil!10152) (Cons!10151 (h!11073 (_ BitVec 64)) (t!16383 List!10155)) )
))
(declare-fun arrayNoDuplicates!0 (array!33282 (_ BitVec 32) List!10155) Bool)

(assert (=> b!522552 (= res!320191 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10152))))

(declare-fun b!522553 () Bool)

(declare-fun res!320187 () Bool)

(assert (=> b!522553 (=> (not res!320187) (not e!304768))))

(assert (=> b!522553 (= res!320187 (and (= (size!16361 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16361 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16361 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!522554 () Bool)

(assert (=> b!522554 (= e!304767 (not e!304773))))

(declare-fun res!320193 () Bool)

(assert (=> b!522554 (=> res!320193 e!304773)))

(declare-fun lt!239675 () (_ BitVec 64))

(declare-fun lt!239672 () (_ BitVec 32))

(declare-fun lt!239671 () array!33282)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33282 (_ BitVec 32)) SeekEntryResult!4464)

(assert (=> b!522554 (= res!320193 (= lt!239673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239672 lt!239675 lt!239671 mask!3524)))))

(declare-fun lt!239670 () (_ BitVec 32))

(assert (=> b!522554 (= lt!239673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239670 (select (arr!15997 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522554 (= lt!239672 (toIndex!0 lt!239675 mask!3524))))

(assert (=> b!522554 (= lt!239675 (select (store (arr!15997 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!522554 (= lt!239670 (toIndex!0 (select (arr!15997 a!3235) j!176) mask!3524))))

(assert (=> b!522554 (= lt!239671 (array!33283 (store (arr!15997 a!3235) i!1204 k0!2280) (size!16361 a!3235)))))

(declare-fun e!304771 () Bool)

(assert (=> b!522554 e!304771))

(declare-fun res!320185 () Bool)

(assert (=> b!522554 (=> (not res!320185) (not e!304771))))

(assert (=> b!522554 (= res!320185 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239677 () Unit!16308)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33282 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16308)

(assert (=> b!522554 (= lt!239677 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!522555 () Bool)

(declare-fun Unit!16310 () Unit!16308)

(assert (=> b!522555 (= e!304769 Unit!16310)))

(declare-fun b!522556 () Bool)

(declare-fun Unit!16311 () Unit!16308)

(assert (=> b!522556 (= e!304769 Unit!16311)))

(declare-fun lt!239674 () Unit!16308)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33282 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16308)

(assert (=> b!522556 (= lt!239674 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239670 #b00000000000000000000000000000000 (index!20061 lt!239673) (x!49034 lt!239673) mask!3524))))

(declare-fun res!320186 () Bool)

(assert (=> b!522556 (= res!320186 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239670 lt!239675 lt!239671 mask!3524) (Intermediate!4464 false (index!20061 lt!239673) (x!49034 lt!239673))))))

(assert (=> b!522556 (=> (not res!320186) (not e!304770))))

(assert (=> b!522556 e!304770))

(declare-fun b!522557 () Bool)

(assert (=> b!522557 (= e!304771 (= (seekEntryOrOpen!0 (select (arr!15997 a!3235) j!176) a!3235 mask!3524) (Found!4464 j!176)))))

(assert (= (and start!47456 res!320195) b!522553))

(assert (= (and b!522553 res!320187) b!522548))

(assert (= (and b!522548 res!320194) b!522550))

(assert (= (and b!522550 res!320188) b!522549))

(assert (= (and b!522549 res!320189) b!522551))

(assert (= (and b!522551 res!320192) b!522546))

(assert (= (and b!522546 res!320190) b!522552))

(assert (= (and b!522552 res!320191) b!522554))

(assert (= (and b!522554 res!320185) b!522557))

(assert (= (and b!522554 (not res!320193)) b!522544))

(assert (= (and b!522544 (not res!320184)) b!522545))

(assert (= (and b!522545 c!61481) b!522556))

(assert (= (and b!522545 (not c!61481)) b!522555))

(assert (= (and b!522556 res!320186) b!522547))

(declare-fun m!503457 () Bool)

(assert (=> b!522554 m!503457))

(declare-fun m!503459 () Bool)

(assert (=> b!522554 m!503459))

(declare-fun m!503461 () Bool)

(assert (=> b!522554 m!503461))

(declare-fun m!503463 () Bool)

(assert (=> b!522554 m!503463))

(declare-fun m!503465 () Bool)

(assert (=> b!522554 m!503465))

(declare-fun m!503467 () Bool)

(assert (=> b!522554 m!503467))

(declare-fun m!503469 () Bool)

(assert (=> b!522554 m!503469))

(assert (=> b!522554 m!503465))

(declare-fun m!503471 () Bool)

(assert (=> b!522554 m!503471))

(assert (=> b!522554 m!503465))

(declare-fun m!503473 () Bool)

(assert (=> b!522554 m!503473))

(declare-fun m!503475 () Bool)

(assert (=> b!522545 m!503475))

(assert (=> b!522545 m!503465))

(declare-fun m!503477 () Bool)

(assert (=> b!522551 m!503477))

(declare-fun m!503479 () Bool)

(assert (=> b!522556 m!503479))

(declare-fun m!503481 () Bool)

(assert (=> b!522556 m!503481))

(declare-fun m!503483 () Bool)

(assert (=> b!522552 m!503483))

(declare-fun m!503485 () Bool)

(assert (=> start!47456 m!503485))

(declare-fun m!503487 () Bool)

(assert (=> start!47456 m!503487))

(declare-fun m!503489 () Bool)

(assert (=> b!522546 m!503489))

(assert (=> b!522548 m!503465))

(assert (=> b!522548 m!503465))

(declare-fun m!503491 () Bool)

(assert (=> b!522548 m!503491))

(assert (=> b!522557 m!503465))

(assert (=> b!522557 m!503465))

(declare-fun m!503493 () Bool)

(assert (=> b!522557 m!503493))

(declare-fun m!503495 () Bool)

(assert (=> b!522549 m!503495))

(declare-fun m!503497 () Bool)

(assert (=> b!522550 m!503497))

(check-sat (not b!522550) (not b!522546) (not b!522552) (not b!522551) (not b!522548) (not start!47456) (not b!522556) (not b!522554) (not b!522557) (not b!522549))
(check-sat)
