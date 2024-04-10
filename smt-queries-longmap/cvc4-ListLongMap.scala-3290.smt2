; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45688 () Bool)

(assert start!45688)

(declare-fun b!504472 () Bool)

(declare-fun e!295372 () Bool)

(assert (=> b!504472 (= e!295372 true)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4069 0))(
  ( (MissingZero!4069 (index!18464 (_ BitVec 32))) (Found!4069 (index!18465 (_ BitVec 32))) (Intermediate!4069 (undefined!4881 Bool) (index!18466 (_ BitVec 32)) (x!47478 (_ BitVec 32))) (Undefined!4069) (MissingVacant!4069 (index!18467 (_ BitVec 32))) )
))
(declare-fun lt!229701 () SeekEntryResult!4069)

(declare-datatypes ((array!32444 0))(
  ( (array!32445 (arr!15602 (Array (_ BitVec 32) (_ BitVec 64))) (size!15966 (_ BitVec 32))) )
))
(declare-fun lt!229702 () array!32444)

(declare-fun lt!229697 () (_ BitVec 64))

(declare-fun lt!229695 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32444 (_ BitVec 32)) SeekEntryResult!4069)

(assert (=> b!504472 (= lt!229701 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229695 lt!229697 lt!229702 mask!3524))))

(declare-fun b!504473 () Bool)

(declare-fun res!305656 () Bool)

(declare-fun e!295370 () Bool)

(assert (=> b!504473 (=> (not res!305656) (not e!295370))))

(declare-fun a!3235 () array!32444)

(declare-datatypes ((List!9760 0))(
  ( (Nil!9757) (Cons!9756 (h!10633 (_ BitVec 64)) (t!15988 List!9760)) )
))
(declare-fun arrayNoDuplicates!0 (array!32444 (_ BitVec 32) List!9760) Bool)

(assert (=> b!504473 (= res!305656 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9757))))

(declare-fun b!504474 () Bool)

(declare-datatypes ((Unit!15352 0))(
  ( (Unit!15353) )
))
(declare-fun e!295376 () Unit!15352)

(declare-fun Unit!15354 () Unit!15352)

(assert (=> b!504474 (= e!295376 Unit!15354)))

(declare-fun b!504475 () Bool)

(declare-fun e!295377 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32444 (_ BitVec 32)) SeekEntryResult!4069)

(assert (=> b!504475 (= e!295377 (= (seekEntryOrOpen!0 (select (arr!15602 a!3235) j!176) a!3235 mask!3524) (Found!4069 j!176)))))

(declare-fun b!504476 () Bool)

(declare-fun e!295369 () Bool)

(assert (=> b!504476 (= e!295369 e!295370)))

(declare-fun res!305655 () Bool)

(assert (=> b!504476 (=> (not res!305655) (not e!295370))))

(declare-fun lt!229700 () SeekEntryResult!4069)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!504476 (= res!305655 (or (= lt!229700 (MissingZero!4069 i!1204)) (= lt!229700 (MissingVacant!4069 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!504476 (= lt!229700 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!504477 () Bool)

(declare-fun res!305658 () Bool)

(assert (=> b!504477 (=> (not res!305658) (not e!295370))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32444 (_ BitVec 32)) Bool)

(assert (=> b!504477 (= res!305658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504478 () Bool)

(declare-fun e!295373 () Bool)

(assert (=> b!504478 (= e!295373 false)))

(declare-fun b!504479 () Bool)

(declare-fun res!305650 () Bool)

(assert (=> b!504479 (=> res!305650 e!295372)))

(declare-fun e!295375 () Bool)

(assert (=> b!504479 (= res!305650 e!295375)))

(declare-fun res!305654 () Bool)

(assert (=> b!504479 (=> (not res!305654) (not e!295375))))

(declare-fun lt!229696 () SeekEntryResult!4069)

(assert (=> b!504479 (= res!305654 (bvsgt #b00000000000000000000000000000000 (x!47478 lt!229696)))))

(declare-fun b!504480 () Bool)

(declare-fun res!305652 () Bool)

(assert (=> b!504480 (=> (not res!305652) (not e!295369))))

(declare-fun arrayContainsKey!0 (array!32444 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504480 (= res!305652 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!305660 () Bool)

(assert (=> start!45688 (=> (not res!305660) (not e!295369))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45688 (= res!305660 (validMask!0 mask!3524))))

(assert (=> start!45688 e!295369))

(assert (=> start!45688 true))

(declare-fun array_inv!11398 (array!32444) Bool)

(assert (=> start!45688 (array_inv!11398 a!3235)))

(declare-fun b!504481 () Bool)

(declare-fun res!305649 () Bool)

(declare-fun e!295374 () Bool)

(assert (=> b!504481 (=> res!305649 e!295374)))

(assert (=> b!504481 (= res!305649 (or (undefined!4881 lt!229696) (not (is-Intermediate!4069 lt!229696))))))

(declare-fun b!504482 () Bool)

(declare-fun res!305662 () Bool)

(assert (=> b!504482 (=> (not res!305662) (not e!295369))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504482 (= res!305662 (validKeyInArray!0 (select (arr!15602 a!3235) j!176)))))

(declare-fun b!504483 () Bool)

(assert (=> b!504483 (= e!295374 e!295372)))

(declare-fun res!305659 () Bool)

(assert (=> b!504483 (=> res!305659 e!295372)))

(assert (=> b!504483 (= res!305659 (or (bvsgt (x!47478 lt!229696) #b01111111111111111111111111111110) (bvslt lt!229695 #b00000000000000000000000000000000) (bvsge lt!229695 (size!15966 a!3235)) (bvslt (index!18466 lt!229696) #b00000000000000000000000000000000) (bvsge (index!18466 lt!229696) (size!15966 a!3235)) (not (= lt!229696 (Intermediate!4069 false (index!18466 lt!229696) (x!47478 lt!229696))))))))

(assert (=> b!504483 (= (index!18466 lt!229696) i!1204)))

(declare-fun lt!229693 () Unit!15352)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32444 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15352)

(assert (=> b!504483 (= lt!229693 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!229695 #b00000000000000000000000000000000 (index!18466 lt!229696) (x!47478 lt!229696) mask!3524))))

(assert (=> b!504483 (and (or (= (select (arr!15602 a!3235) (index!18466 lt!229696)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15602 a!3235) (index!18466 lt!229696)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15602 a!3235) (index!18466 lt!229696)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15602 a!3235) (index!18466 lt!229696)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229698 () Unit!15352)

(assert (=> b!504483 (= lt!229698 e!295376)))

(declare-fun c!59690 () Bool)

(assert (=> b!504483 (= c!59690 (= (select (arr!15602 a!3235) (index!18466 lt!229696)) (select (arr!15602 a!3235) j!176)))))

(assert (=> b!504483 (and (bvslt (x!47478 lt!229696) #b01111111111111111111111111111110) (or (= (select (arr!15602 a!3235) (index!18466 lt!229696)) (select (arr!15602 a!3235) j!176)) (= (select (arr!15602 a!3235) (index!18466 lt!229696)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15602 a!3235) (index!18466 lt!229696)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!504484 () Bool)

(assert (=> b!504484 (= e!295370 (not e!295374))))

(declare-fun res!305651 () Bool)

(assert (=> b!504484 (=> res!305651 e!295374)))

(declare-fun lt!229694 () (_ BitVec 32))

(assert (=> b!504484 (= res!305651 (= lt!229696 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229694 lt!229697 lt!229702 mask!3524)))))

(assert (=> b!504484 (= lt!229696 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229695 (select (arr!15602 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504484 (= lt!229694 (toIndex!0 lt!229697 mask!3524))))

(assert (=> b!504484 (= lt!229697 (select (store (arr!15602 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!504484 (= lt!229695 (toIndex!0 (select (arr!15602 a!3235) j!176) mask!3524))))

(assert (=> b!504484 (= lt!229702 (array!32445 (store (arr!15602 a!3235) i!1204 k!2280) (size!15966 a!3235)))))

(assert (=> b!504484 e!295377))

(declare-fun res!305653 () Bool)

(assert (=> b!504484 (=> (not res!305653) (not e!295377))))

(assert (=> b!504484 (= res!305653 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229692 () Unit!15352)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32444 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15352)

(assert (=> b!504484 (= lt!229692 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504485 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32444 (_ BitVec 32)) SeekEntryResult!4069)

(assert (=> b!504485 (= e!295375 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229695 (index!18466 lt!229696) (select (arr!15602 a!3235) j!176) a!3235 mask!3524) (Found!4069 j!176))))))

(declare-fun b!504486 () Bool)

(declare-fun res!305661 () Bool)

(assert (=> b!504486 (=> (not res!305661) (not e!295369))))

(assert (=> b!504486 (= res!305661 (and (= (size!15966 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15966 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15966 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!504487 () Bool)

(declare-fun res!305657 () Bool)

(assert (=> b!504487 (=> (not res!305657) (not e!295369))))

(assert (=> b!504487 (= res!305657 (validKeyInArray!0 k!2280))))

(declare-fun b!504488 () Bool)

(declare-fun Unit!15355 () Unit!15352)

(assert (=> b!504488 (= e!295376 Unit!15355)))

(declare-fun lt!229699 () Unit!15352)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32444 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15352)

(assert (=> b!504488 (= lt!229699 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!229695 #b00000000000000000000000000000000 (index!18466 lt!229696) (x!47478 lt!229696) mask!3524))))

(declare-fun res!305663 () Bool)

(assert (=> b!504488 (= res!305663 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229695 lt!229697 lt!229702 mask!3524) (Intermediate!4069 false (index!18466 lt!229696) (x!47478 lt!229696))))))

(assert (=> b!504488 (=> (not res!305663) (not e!295373))))

(assert (=> b!504488 e!295373))

(assert (= (and start!45688 res!305660) b!504486))

(assert (= (and b!504486 res!305661) b!504482))

(assert (= (and b!504482 res!305662) b!504487))

(assert (= (and b!504487 res!305657) b!504480))

(assert (= (and b!504480 res!305652) b!504476))

(assert (= (and b!504476 res!305655) b!504477))

(assert (= (and b!504477 res!305658) b!504473))

(assert (= (and b!504473 res!305656) b!504484))

(assert (= (and b!504484 res!305653) b!504475))

(assert (= (and b!504484 (not res!305651)) b!504481))

(assert (= (and b!504481 (not res!305649)) b!504483))

(assert (= (and b!504483 c!59690) b!504488))

(assert (= (and b!504483 (not c!59690)) b!504474))

(assert (= (and b!504488 res!305663) b!504478))

(assert (= (and b!504483 (not res!305659)) b!504479))

(assert (= (and b!504479 res!305654) b!504485))

(assert (= (and b!504479 (not res!305650)) b!504472))

(declare-fun m!485207 () Bool)

(assert (=> b!504485 m!485207))

(assert (=> b!504485 m!485207))

(declare-fun m!485209 () Bool)

(assert (=> b!504485 m!485209))

(declare-fun m!485211 () Bool)

(assert (=> b!504487 m!485211))

(declare-fun m!485213 () Bool)

(assert (=> b!504480 m!485213))

(assert (=> b!504482 m!485207))

(assert (=> b!504482 m!485207))

(declare-fun m!485215 () Bool)

(assert (=> b!504482 m!485215))

(declare-fun m!485217 () Bool)

(assert (=> b!504472 m!485217))

(declare-fun m!485219 () Bool)

(assert (=> b!504484 m!485219))

(assert (=> b!504484 m!485207))

(declare-fun m!485221 () Bool)

(assert (=> b!504484 m!485221))

(declare-fun m!485223 () Bool)

(assert (=> b!504484 m!485223))

(declare-fun m!485225 () Bool)

(assert (=> b!504484 m!485225))

(declare-fun m!485227 () Bool)

(assert (=> b!504484 m!485227))

(declare-fun m!485229 () Bool)

(assert (=> b!504484 m!485229))

(assert (=> b!504484 m!485207))

(declare-fun m!485231 () Bool)

(assert (=> b!504484 m!485231))

(assert (=> b!504484 m!485207))

(declare-fun m!485233 () Bool)

(assert (=> b!504484 m!485233))

(declare-fun m!485235 () Bool)

(assert (=> b!504488 m!485235))

(assert (=> b!504488 m!485217))

(declare-fun m!485237 () Bool)

(assert (=> b!504483 m!485237))

(declare-fun m!485239 () Bool)

(assert (=> b!504483 m!485239))

(assert (=> b!504483 m!485207))

(declare-fun m!485241 () Bool)

(assert (=> b!504473 m!485241))

(declare-fun m!485243 () Bool)

(assert (=> b!504477 m!485243))

(declare-fun m!485245 () Bool)

(assert (=> start!45688 m!485245))

(declare-fun m!485247 () Bool)

(assert (=> start!45688 m!485247))

(assert (=> b!504475 m!485207))

(assert (=> b!504475 m!485207))

(declare-fun m!485249 () Bool)

(assert (=> b!504475 m!485249))

(declare-fun m!485251 () Bool)

(assert (=> b!504476 m!485251))

(push 1)

