; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45644 () Bool)

(assert start!45644)

(declare-fun res!304888 () Bool)

(declare-fun e!294876 () Bool)

(assert (=> start!45644 (=> (not res!304888) (not e!294876))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45644 (= res!304888 (validMask!0 mask!3524))))

(assert (=> start!45644 e!294876))

(assert (=> start!45644 true))

(declare-datatypes ((array!32401 0))(
  ( (array!32402 (arr!15580 (Array (_ BitVec 32) (_ BitVec 64))) (size!15944 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32401)

(declare-fun array_inv!11439 (array!32401) Bool)

(assert (=> start!45644 (array_inv!11439 a!3235)))

(declare-datatypes ((SeekEntryResult!4003 0))(
  ( (MissingZero!4003 (index!18200 (_ BitVec 32))) (Found!4003 (index!18201 (_ BitVec 32))) (Intermediate!4003 (undefined!4815 Bool) (index!18202 (_ BitVec 32)) (x!47369 (_ BitVec 32))) (Undefined!4003) (MissingVacant!4003 (index!18203 (_ BitVec 32))) )
))
(declare-fun lt!229146 () SeekEntryResult!4003)

(declare-fun lt!229150 () (_ BitVec 32))

(declare-fun b!503544 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!294878 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32401 (_ BitVec 32)) SeekEntryResult!4003)

(assert (=> b!503544 (= e!294878 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229150 (index!18202 lt!229146) (select (arr!15580 a!3235) j!176) a!3235 mask!3524) (Found!4003 j!176))))))

(declare-fun b!503545 () Bool)

(declare-fun e!294872 () Bool)

(assert (=> b!503545 (= e!294872 false)))

(declare-fun e!294877 () Bool)

(declare-fun b!503546 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32401 (_ BitVec 32)) SeekEntryResult!4003)

(assert (=> b!503546 (= e!294877 (= (seekEntryOrOpen!0 (select (arr!15580 a!3235) j!176) a!3235 mask!3524) (Found!4003 j!176)))))

(declare-fun b!503547 () Bool)

(declare-fun res!304887 () Bool)

(declare-fun e!294875 () Bool)

(assert (=> b!503547 (=> (not res!304887) (not e!294875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32401 (_ BitVec 32)) Bool)

(assert (=> b!503547 (= res!304887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503548 () Bool)

(declare-datatypes ((Unit!15247 0))(
  ( (Unit!15248) )
))
(declare-fun e!294879 () Unit!15247)

(declare-fun Unit!15249 () Unit!15247)

(assert (=> b!503548 (= e!294879 Unit!15249)))

(declare-fun b!503549 () Bool)

(declare-fun res!304879 () Bool)

(declare-fun e!294871 () Bool)

(assert (=> b!503549 (=> res!304879 e!294871)))

(get-info :version)

(assert (=> b!503549 (= res!304879 (or (undefined!4815 lt!229146) (not ((_ is Intermediate!4003) lt!229146))))))

(declare-fun b!503550 () Bool)

(declare-fun res!304890 () Bool)

(assert (=> b!503550 (=> (not res!304890) (not e!294876))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503550 (= res!304890 (validKeyInArray!0 (select (arr!15580 a!3235) j!176)))))

(declare-fun b!503551 () Bool)

(assert (=> b!503551 (= e!294876 e!294875)))

(declare-fun res!304881 () Bool)

(assert (=> b!503551 (=> (not res!304881) (not e!294875))))

(declare-fun lt!229144 () SeekEntryResult!4003)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!503551 (= res!304881 (or (= lt!229144 (MissingZero!4003 i!1204)) (= lt!229144 (MissingVacant!4003 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!503551 (= lt!229144 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!503552 () Bool)

(declare-fun e!294873 () Bool)

(assert (=> b!503552 (= e!294873 true)))

(declare-fun lt!229145 () (_ BitVec 64))

(declare-fun lt!229151 () SeekEntryResult!4003)

(declare-fun lt!229147 () array!32401)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32401 (_ BitVec 32)) SeekEntryResult!4003)

(assert (=> b!503552 (= lt!229151 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229150 lt!229145 lt!229147 mask!3524))))

(declare-fun b!503553 () Bool)

(declare-fun res!304877 () Bool)

(assert (=> b!503553 (=> (not res!304877) (not e!294876))))

(declare-fun arrayContainsKey!0 (array!32401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503553 (= res!304877 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503554 () Bool)

(declare-fun Unit!15250 () Unit!15247)

(assert (=> b!503554 (= e!294879 Unit!15250)))

(declare-fun lt!229143 () Unit!15247)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32401 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15247)

(assert (=> b!503554 (= lt!229143 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229150 #b00000000000000000000000000000000 (index!18202 lt!229146) (x!47369 lt!229146) mask!3524))))

(declare-fun res!304883 () Bool)

(assert (=> b!503554 (= res!304883 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229150 lt!229145 lt!229147 mask!3524) (Intermediate!4003 false (index!18202 lt!229146) (x!47369 lt!229146))))))

(assert (=> b!503554 (=> (not res!304883) (not e!294872))))

(assert (=> b!503554 e!294872))

(declare-fun b!503555 () Bool)

(declare-fun res!304891 () Bool)

(assert (=> b!503555 (=> (not res!304891) (not e!294876))))

(assert (=> b!503555 (= res!304891 (and (= (size!15944 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15944 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15944 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503556 () Bool)

(assert (=> b!503556 (= e!294875 (not e!294871))))

(declare-fun res!304878 () Bool)

(assert (=> b!503556 (=> res!304878 e!294871)))

(declare-fun lt!229153 () (_ BitVec 32))

(assert (=> b!503556 (= res!304878 (= lt!229146 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229153 lt!229145 lt!229147 mask!3524)))))

(assert (=> b!503556 (= lt!229146 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229150 (select (arr!15580 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503556 (= lt!229153 (toIndex!0 lt!229145 mask!3524))))

(assert (=> b!503556 (= lt!229145 (select (store (arr!15580 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!503556 (= lt!229150 (toIndex!0 (select (arr!15580 a!3235) j!176) mask!3524))))

(assert (=> b!503556 (= lt!229147 (array!32402 (store (arr!15580 a!3235) i!1204 k0!2280) (size!15944 a!3235)))))

(assert (=> b!503556 e!294877))

(declare-fun res!304886 () Bool)

(assert (=> b!503556 (=> (not res!304886) (not e!294877))))

(assert (=> b!503556 (= res!304886 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229148 () Unit!15247)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32401 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15247)

(assert (=> b!503556 (= lt!229148 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503557 () Bool)

(assert (=> b!503557 (= e!294871 e!294873)))

(declare-fun res!304885 () Bool)

(assert (=> b!503557 (=> res!304885 e!294873)))

(assert (=> b!503557 (= res!304885 (or (bvsgt (x!47369 lt!229146) #b01111111111111111111111111111110) (bvslt lt!229150 #b00000000000000000000000000000000) (bvsge lt!229150 (size!15944 a!3235)) (bvslt (index!18202 lt!229146) #b00000000000000000000000000000000) (bvsge (index!18202 lt!229146) (size!15944 a!3235)) (not (= lt!229146 (Intermediate!4003 false (index!18202 lt!229146) (x!47369 lt!229146))))))))

(assert (=> b!503557 (= (index!18202 lt!229146) i!1204)))

(declare-fun lt!229149 () Unit!15247)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32401 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15247)

(assert (=> b!503557 (= lt!229149 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229150 #b00000000000000000000000000000000 (index!18202 lt!229146) (x!47369 lt!229146) mask!3524))))

(assert (=> b!503557 (and (or (= (select (arr!15580 a!3235) (index!18202 lt!229146)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15580 a!3235) (index!18202 lt!229146)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15580 a!3235) (index!18202 lt!229146)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15580 a!3235) (index!18202 lt!229146)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229152 () Unit!15247)

(assert (=> b!503557 (= lt!229152 e!294879)))

(declare-fun c!59612 () Bool)

(assert (=> b!503557 (= c!59612 (= (select (arr!15580 a!3235) (index!18202 lt!229146)) (select (arr!15580 a!3235) j!176)))))

(assert (=> b!503557 (and (bvslt (x!47369 lt!229146) #b01111111111111111111111111111110) (or (= (select (arr!15580 a!3235) (index!18202 lt!229146)) (select (arr!15580 a!3235) j!176)) (= (select (arr!15580 a!3235) (index!18202 lt!229146)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15580 a!3235) (index!18202 lt!229146)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503558 () Bool)

(declare-fun res!304884 () Bool)

(assert (=> b!503558 (=> (not res!304884) (not e!294875))))

(declare-datatypes ((List!9645 0))(
  ( (Nil!9642) (Cons!9641 (h!10518 (_ BitVec 64)) (t!15865 List!9645)) )
))
(declare-fun arrayNoDuplicates!0 (array!32401 (_ BitVec 32) List!9645) Bool)

(assert (=> b!503558 (= res!304884 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9642))))

(declare-fun b!503559 () Bool)

(declare-fun res!304882 () Bool)

(assert (=> b!503559 (=> (not res!304882) (not e!294876))))

(assert (=> b!503559 (= res!304882 (validKeyInArray!0 k0!2280))))

(declare-fun b!503560 () Bool)

(declare-fun res!304880 () Bool)

(assert (=> b!503560 (=> res!304880 e!294873)))

(assert (=> b!503560 (= res!304880 e!294878)))

(declare-fun res!304889 () Bool)

(assert (=> b!503560 (=> (not res!304889) (not e!294878))))

(assert (=> b!503560 (= res!304889 (bvsgt #b00000000000000000000000000000000 (x!47369 lt!229146)))))

(assert (= (and start!45644 res!304888) b!503555))

(assert (= (and b!503555 res!304891) b!503550))

(assert (= (and b!503550 res!304890) b!503559))

(assert (= (and b!503559 res!304882) b!503553))

(assert (= (and b!503553 res!304877) b!503551))

(assert (= (and b!503551 res!304881) b!503547))

(assert (= (and b!503547 res!304887) b!503558))

(assert (= (and b!503558 res!304884) b!503556))

(assert (= (and b!503556 res!304886) b!503546))

(assert (= (and b!503556 (not res!304878)) b!503549))

(assert (= (and b!503549 (not res!304879)) b!503557))

(assert (= (and b!503557 c!59612) b!503554))

(assert (= (and b!503557 (not c!59612)) b!503548))

(assert (= (and b!503554 res!304883) b!503545))

(assert (= (and b!503557 (not res!304885)) b!503560))

(assert (= (and b!503560 res!304889) b!503544))

(assert (= (and b!503560 (not res!304880)) b!503552))

(declare-fun m!484609 () Bool)

(assert (=> b!503547 m!484609))

(declare-fun m!484611 () Bool)

(assert (=> b!503551 m!484611))

(declare-fun m!484613 () Bool)

(assert (=> b!503559 m!484613))

(declare-fun m!484615 () Bool)

(assert (=> b!503544 m!484615))

(assert (=> b!503544 m!484615))

(declare-fun m!484617 () Bool)

(assert (=> b!503544 m!484617))

(declare-fun m!484619 () Bool)

(assert (=> b!503552 m!484619))

(assert (=> b!503550 m!484615))

(assert (=> b!503550 m!484615))

(declare-fun m!484621 () Bool)

(assert (=> b!503550 m!484621))

(assert (=> b!503556 m!484615))

(declare-fun m!484623 () Bool)

(assert (=> b!503556 m!484623))

(declare-fun m!484625 () Bool)

(assert (=> b!503556 m!484625))

(declare-fun m!484627 () Bool)

(assert (=> b!503556 m!484627))

(declare-fun m!484629 () Bool)

(assert (=> b!503556 m!484629))

(declare-fun m!484631 () Bool)

(assert (=> b!503556 m!484631))

(assert (=> b!503556 m!484615))

(declare-fun m!484633 () Bool)

(assert (=> b!503556 m!484633))

(assert (=> b!503556 m!484615))

(declare-fun m!484635 () Bool)

(assert (=> b!503556 m!484635))

(declare-fun m!484637 () Bool)

(assert (=> b!503556 m!484637))

(assert (=> b!503546 m!484615))

(assert (=> b!503546 m!484615))

(declare-fun m!484639 () Bool)

(assert (=> b!503546 m!484639))

(declare-fun m!484641 () Bool)

(assert (=> b!503553 m!484641))

(declare-fun m!484643 () Bool)

(assert (=> b!503554 m!484643))

(assert (=> b!503554 m!484619))

(declare-fun m!484645 () Bool)

(assert (=> b!503558 m!484645))

(declare-fun m!484647 () Bool)

(assert (=> b!503557 m!484647))

(declare-fun m!484649 () Bool)

(assert (=> b!503557 m!484649))

(assert (=> b!503557 m!484615))

(declare-fun m!484651 () Bool)

(assert (=> start!45644 m!484651))

(declare-fun m!484653 () Bool)

(assert (=> start!45644 m!484653))

(check-sat (not b!503550) (not b!503558) (not b!503552) (not b!503557) (not b!503546) (not b!503554) (not start!45644) (not b!503559) (not b!503551) (not b!503547) (not b!503556) (not b!503553) (not b!503544))
(check-sat)
