; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45426 () Bool)

(assert start!45426)

(declare-fun e!292701 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!499547 () Bool)

(declare-datatypes ((array!32261 0))(
  ( (array!32262 (arr!15512 (Array (_ BitVec 32) (_ BitVec 64))) (size!15877 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32261)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3976 0))(
  ( (MissingZero!3976 (index!18086 (_ BitVec 32))) (Found!3976 (index!18087 (_ BitVec 32))) (Intermediate!3976 (undefined!4788 Bool) (index!18088 (_ BitVec 32)) (x!47136 (_ BitVec 32))) (Undefined!3976) (MissingVacant!3976 (index!18089 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32261 (_ BitVec 32)) SeekEntryResult!3976)

(assert (=> b!499547 (= e!292701 (= (seekEntryOrOpen!0 (select (arr!15512 a!3235) j!176) a!3235 mask!3524) (Found!3976 j!176)))))

(declare-fun b!499548 () Bool)

(declare-fun e!292704 () Bool)

(declare-fun e!292703 () Bool)

(assert (=> b!499548 (= e!292704 e!292703)))

(declare-fun res!301602 () Bool)

(assert (=> b!499548 (=> (not res!301602) (not e!292703))))

(declare-fun lt!226466 () SeekEntryResult!3976)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!499548 (= res!301602 (or (= lt!226466 (MissingZero!3976 i!1204)) (= lt!226466 (MissingVacant!3976 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!499548 (= lt!226466 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!499549 () Bool)

(declare-fun e!292698 () Bool)

(declare-fun e!292697 () Bool)

(assert (=> b!499549 (= e!292698 e!292697)))

(declare-fun res!301607 () Bool)

(assert (=> b!499549 (=> res!301607 e!292697)))

(declare-fun lt!226471 () (_ BitVec 32))

(declare-fun lt!226470 () SeekEntryResult!3976)

(assert (=> b!499549 (= res!301607 (or (bvsgt #b00000000000000000000000000000000 (x!47136 lt!226470)) (bvsgt (x!47136 lt!226470) #b01111111111111111111111111111110) (bvslt lt!226471 #b00000000000000000000000000000000) (bvsge lt!226471 (size!15877 a!3235)) (bvslt (index!18088 lt!226470) #b00000000000000000000000000000000) (bvsge (index!18088 lt!226470) (size!15877 a!3235)) (not (= lt!226470 (Intermediate!3976 false (index!18088 lt!226470) (x!47136 lt!226470))))))))

(assert (=> b!499549 (and (or (= (select (arr!15512 a!3235) (index!18088 lt!226470)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15512 a!3235) (index!18088 lt!226470)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15512 a!3235) (index!18088 lt!226470)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15512 a!3235) (index!18088 lt!226470)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!14974 0))(
  ( (Unit!14975) )
))
(declare-fun lt!226474 () Unit!14974)

(declare-fun e!292699 () Unit!14974)

(assert (=> b!499549 (= lt!226474 e!292699)))

(declare-fun c!59250 () Bool)

(assert (=> b!499549 (= c!59250 (= (select (arr!15512 a!3235) (index!18088 lt!226470)) (select (arr!15512 a!3235) j!176)))))

(assert (=> b!499549 (and (bvslt (x!47136 lt!226470) #b01111111111111111111111111111110) (or (= (select (arr!15512 a!3235) (index!18088 lt!226470)) (select (arr!15512 a!3235) j!176)) (= (select (arr!15512 a!3235) (index!18088 lt!226470)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15512 a!3235) (index!18088 lt!226470)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499550 () Bool)

(declare-fun res!301610 () Bool)

(assert (=> b!499550 (=> (not res!301610) (not e!292703))))

(declare-datatypes ((List!9709 0))(
  ( (Nil!9706) (Cons!9705 (h!10579 (_ BitVec 64)) (t!15928 List!9709)) )
))
(declare-fun arrayNoDuplicates!0 (array!32261 (_ BitVec 32) List!9709) Bool)

(assert (=> b!499550 (= res!301610 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9706))))

(declare-fun b!499551 () Bool)

(declare-fun e!292702 () Bool)

(assert (=> b!499551 (= e!292702 false)))

(declare-fun b!499552 () Bool)

(declare-fun Unit!14976 () Unit!14974)

(assert (=> b!499552 (= e!292699 Unit!14976)))

(declare-fun res!301608 () Bool)

(assert (=> start!45426 (=> (not res!301608) (not e!292704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45426 (= res!301608 (validMask!0 mask!3524))))

(assert (=> start!45426 e!292704))

(assert (=> start!45426 true))

(declare-fun array_inv!11395 (array!32261) Bool)

(assert (=> start!45426 (array_inv!11395 a!3235)))

(declare-fun b!499553 () Bool)

(declare-fun Unit!14977 () Unit!14974)

(assert (=> b!499553 (= e!292699 Unit!14977)))

(declare-fun lt!226468 () Unit!14974)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32261 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14974)

(assert (=> b!499553 (= lt!226468 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226471 #b00000000000000000000000000000000 (index!18088 lt!226470) (x!47136 lt!226470) mask!3524))))

(declare-fun lt!226467 () (_ BitVec 64))

(declare-fun res!301605 () Bool)

(declare-fun lt!226473 () array!32261)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32261 (_ BitVec 32)) SeekEntryResult!3976)

(assert (=> b!499553 (= res!301605 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226471 lt!226467 lt!226473 mask!3524) (Intermediate!3976 false (index!18088 lt!226470) (x!47136 lt!226470))))))

(assert (=> b!499553 (=> (not res!301605) (not e!292702))))

(assert (=> b!499553 e!292702))

(declare-fun b!499554 () Bool)

(declare-fun res!301611 () Bool)

(assert (=> b!499554 (=> (not res!301611) (not e!292704))))

(assert (=> b!499554 (= res!301611 (and (= (size!15877 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15877 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15877 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499555 () Bool)

(declare-fun res!301601 () Bool)

(assert (=> b!499555 (=> (not res!301601) (not e!292704))))

(declare-fun arrayContainsKey!0 (array!32261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499555 (= res!301601 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499556 () Bool)

(assert (=> b!499556 (= e!292703 (not e!292698))))

(declare-fun res!301612 () Bool)

(assert (=> b!499556 (=> res!301612 e!292698)))

(declare-fun lt!226472 () (_ BitVec 32))

(assert (=> b!499556 (= res!301612 (= lt!226470 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226472 lt!226467 lt!226473 mask!3524)))))

(assert (=> b!499556 (= lt!226470 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226471 (select (arr!15512 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499556 (= lt!226472 (toIndex!0 lt!226467 mask!3524))))

(assert (=> b!499556 (= lt!226467 (select (store (arr!15512 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!499556 (= lt!226471 (toIndex!0 (select (arr!15512 a!3235) j!176) mask!3524))))

(assert (=> b!499556 (= lt!226473 (array!32262 (store (arr!15512 a!3235) i!1204 k0!2280) (size!15877 a!3235)))))

(assert (=> b!499556 e!292701))

(declare-fun res!301604 () Bool)

(assert (=> b!499556 (=> (not res!301604) (not e!292701))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32261 (_ BitVec 32)) Bool)

(assert (=> b!499556 (= res!301604 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226465 () Unit!14974)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32261 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14974)

(assert (=> b!499556 (= lt!226465 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499557 () Bool)

(declare-fun res!301613 () Bool)

(assert (=> b!499557 (=> (not res!301613) (not e!292704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499557 (= res!301613 (validKeyInArray!0 k0!2280))))

(declare-fun b!499558 () Bool)

(declare-fun res!301609 () Bool)

(assert (=> b!499558 (=> res!301609 e!292698)))

(get-info :version)

(assert (=> b!499558 (= res!301609 (or (undefined!4788 lt!226470) (not ((_ is Intermediate!3976) lt!226470))))))

(declare-fun b!499559 () Bool)

(assert (=> b!499559 (= e!292697 true)))

(declare-fun lt!226469 () SeekEntryResult!3976)

(assert (=> b!499559 (= lt!226469 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226471 lt!226467 lt!226473 mask!3524))))

(declare-fun b!499560 () Bool)

(declare-fun res!301606 () Bool)

(assert (=> b!499560 (=> (not res!301606) (not e!292703))))

(assert (=> b!499560 (= res!301606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499561 () Bool)

(declare-fun res!301603 () Bool)

(assert (=> b!499561 (=> (not res!301603) (not e!292704))))

(assert (=> b!499561 (= res!301603 (validKeyInArray!0 (select (arr!15512 a!3235) j!176)))))

(assert (= (and start!45426 res!301608) b!499554))

(assert (= (and b!499554 res!301611) b!499561))

(assert (= (and b!499561 res!301603) b!499557))

(assert (= (and b!499557 res!301613) b!499555))

(assert (= (and b!499555 res!301601) b!499548))

(assert (= (and b!499548 res!301602) b!499560))

(assert (= (and b!499560 res!301606) b!499550))

(assert (= (and b!499550 res!301610) b!499556))

(assert (= (and b!499556 res!301604) b!499547))

(assert (= (and b!499556 (not res!301612)) b!499558))

(assert (= (and b!499558 (not res!301609)) b!499549))

(assert (= (and b!499549 c!59250) b!499553))

(assert (= (and b!499549 (not c!59250)) b!499552))

(assert (= (and b!499553 res!301605) b!499551))

(assert (= (and b!499549 (not res!301607)) b!499559))

(declare-fun m!480241 () Bool)

(assert (=> b!499555 m!480241))

(declare-fun m!480243 () Bool)

(assert (=> b!499553 m!480243))

(declare-fun m!480245 () Bool)

(assert (=> b!499553 m!480245))

(declare-fun m!480247 () Bool)

(assert (=> b!499547 m!480247))

(assert (=> b!499547 m!480247))

(declare-fun m!480249 () Bool)

(assert (=> b!499547 m!480249))

(declare-fun m!480251 () Bool)

(assert (=> b!499548 m!480251))

(declare-fun m!480253 () Bool)

(assert (=> b!499557 m!480253))

(declare-fun m!480255 () Bool)

(assert (=> b!499549 m!480255))

(assert (=> b!499549 m!480247))

(declare-fun m!480257 () Bool)

(assert (=> b!499550 m!480257))

(declare-fun m!480259 () Bool)

(assert (=> b!499560 m!480259))

(declare-fun m!480261 () Bool)

(assert (=> b!499556 m!480261))

(declare-fun m!480263 () Bool)

(assert (=> b!499556 m!480263))

(declare-fun m!480265 () Bool)

(assert (=> b!499556 m!480265))

(assert (=> b!499556 m!480247))

(declare-fun m!480267 () Bool)

(assert (=> b!499556 m!480267))

(assert (=> b!499556 m!480247))

(declare-fun m!480269 () Bool)

(assert (=> b!499556 m!480269))

(assert (=> b!499556 m!480247))

(declare-fun m!480271 () Bool)

(assert (=> b!499556 m!480271))

(declare-fun m!480273 () Bool)

(assert (=> b!499556 m!480273))

(declare-fun m!480275 () Bool)

(assert (=> b!499556 m!480275))

(declare-fun m!480277 () Bool)

(assert (=> start!45426 m!480277))

(declare-fun m!480279 () Bool)

(assert (=> start!45426 m!480279))

(assert (=> b!499561 m!480247))

(assert (=> b!499561 m!480247))

(declare-fun m!480281 () Bool)

(assert (=> b!499561 m!480281))

(assert (=> b!499559 m!480245))

(check-sat (not b!499560) (not b!499556) (not b!499547) (not b!499555) (not b!499559) (not b!499548) (not b!499557) (not start!45426) (not b!499550) (not b!499553) (not b!499561))
(check-sat)
