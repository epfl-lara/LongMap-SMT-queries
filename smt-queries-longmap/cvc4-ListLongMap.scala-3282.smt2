; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45640 () Bool)

(assert start!45640)

(declare-fun b!503248 () Bool)

(declare-fun res!304571 () Bool)

(declare-fun e!294722 () Bool)

(assert (=> b!503248 (=> res!304571 e!294722)))

(declare-datatypes ((SeekEntryResult!4045 0))(
  ( (MissingZero!4045 (index!18368 (_ BitVec 32))) (Found!4045 (index!18369 (_ BitVec 32))) (Intermediate!4045 (undefined!4857 Bool) (index!18370 (_ BitVec 32)) (x!47390 (_ BitVec 32))) (Undefined!4045) (MissingVacant!4045 (index!18371 (_ BitVec 32))) )
))
(declare-fun lt!228905 () SeekEntryResult!4045)

(assert (=> b!503248 (= res!304571 (or (undefined!4857 lt!228905) (not (is-Intermediate!4045 lt!228905))))))

(declare-fun b!503249 () Bool)

(declare-fun res!304576 () Bool)

(declare-fun e!294726 () Bool)

(assert (=> b!503249 (=> (not res!304576) (not e!294726))))

(declare-datatypes ((array!32396 0))(
  ( (array!32397 (arr!15578 (Array (_ BitVec 32) (_ BitVec 64))) (size!15942 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32396)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32396 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503249 (= res!304576 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503250 () Bool)

(declare-fun e!294728 () Bool)

(assert (=> b!503250 (= e!294728 false)))

(declare-fun b!503251 () Bool)

(declare-fun res!304579 () Bool)

(declare-fun e!294725 () Bool)

(assert (=> b!503251 (=> (not res!304579) (not e!294725))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32396 (_ BitVec 32)) Bool)

(assert (=> b!503251 (= res!304579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503252 () Bool)

(declare-fun res!304569 () Bool)

(assert (=> b!503252 (=> (not res!304569) (not e!294726))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503252 (= res!304569 (validKeyInArray!0 (select (arr!15578 a!3235) j!176)))))

(declare-fun b!503253 () Bool)

(declare-fun res!304570 () Bool)

(assert (=> b!503253 (=> (not res!304570) (not e!294725))))

(declare-datatypes ((List!9736 0))(
  ( (Nil!9733) (Cons!9732 (h!10609 (_ BitVec 64)) (t!15964 List!9736)) )
))
(declare-fun arrayNoDuplicates!0 (array!32396 (_ BitVec 32) List!9736) Bool)

(assert (=> b!503253 (= res!304570 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9733))))

(declare-fun b!503254 () Bool)

(declare-fun e!294724 () Bool)

(assert (=> b!503254 (= e!294722 e!294724)))

(declare-fun res!304572 () Bool)

(assert (=> b!503254 (=> res!304572 e!294724)))

(declare-fun lt!228900 () (_ BitVec 32))

(assert (=> b!503254 (= res!304572 (or (bvsgt (x!47390 lt!228905) #b01111111111111111111111111111110) (bvslt lt!228900 #b00000000000000000000000000000000) (bvsge lt!228900 (size!15942 a!3235)) (bvslt (index!18370 lt!228905) #b00000000000000000000000000000000) (bvsge (index!18370 lt!228905) (size!15942 a!3235)) (not (= lt!228905 (Intermediate!4045 false (index!18370 lt!228905) (x!47390 lt!228905))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!503254 (= (index!18370 lt!228905) i!1204)))

(declare-datatypes ((Unit!15256 0))(
  ( (Unit!15257) )
))
(declare-fun lt!228906 () Unit!15256)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32396 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15256)

(assert (=> b!503254 (= lt!228906 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!228900 #b00000000000000000000000000000000 (index!18370 lt!228905) (x!47390 lt!228905) mask!3524))))

(assert (=> b!503254 (and (or (= (select (arr!15578 a!3235) (index!18370 lt!228905)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15578 a!3235) (index!18370 lt!228905)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15578 a!3235) (index!18370 lt!228905)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15578 a!3235) (index!18370 lt!228905)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228903 () Unit!15256)

(declare-fun e!294721 () Unit!15256)

(assert (=> b!503254 (= lt!228903 e!294721)))

(declare-fun c!59618 () Bool)

(assert (=> b!503254 (= c!59618 (= (select (arr!15578 a!3235) (index!18370 lt!228905)) (select (arr!15578 a!3235) j!176)))))

(assert (=> b!503254 (and (bvslt (x!47390 lt!228905) #b01111111111111111111111111111110) (or (= (select (arr!15578 a!3235) (index!18370 lt!228905)) (select (arr!15578 a!3235) j!176)) (= (select (arr!15578 a!3235) (index!18370 lt!228905)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15578 a!3235) (index!18370 lt!228905)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503255 () Bool)

(declare-fun Unit!15258 () Unit!15256)

(assert (=> b!503255 (= e!294721 Unit!15258)))

(declare-fun res!304580 () Bool)

(assert (=> start!45640 (=> (not res!304580) (not e!294726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45640 (= res!304580 (validMask!0 mask!3524))))

(assert (=> start!45640 e!294726))

(assert (=> start!45640 true))

(declare-fun array_inv!11374 (array!32396) Bool)

(assert (=> start!45640 (array_inv!11374 a!3235)))

(declare-fun b!503256 () Bool)

(assert (=> b!503256 (= e!294726 e!294725)))

(declare-fun res!304583 () Bool)

(assert (=> b!503256 (=> (not res!304583) (not e!294725))))

(declare-fun lt!228902 () SeekEntryResult!4045)

(assert (=> b!503256 (= res!304583 (or (= lt!228902 (MissingZero!4045 i!1204)) (= lt!228902 (MissingVacant!4045 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32396 (_ BitVec 32)) SeekEntryResult!4045)

(assert (=> b!503256 (= lt!228902 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!503257 () Bool)

(declare-fun res!304573 () Bool)

(assert (=> b!503257 (=> (not res!304573) (not e!294726))))

(assert (=> b!503257 (= res!304573 (validKeyInArray!0 k!2280))))

(declare-fun e!294729 () Bool)

(declare-fun b!503258 () Bool)

(assert (=> b!503258 (= e!294729 (= (seekEntryOrOpen!0 (select (arr!15578 a!3235) j!176) a!3235 mask!3524) (Found!4045 j!176)))))

(declare-fun b!503259 () Bool)

(assert (=> b!503259 (= e!294724 true)))

(declare-fun lt!228909 () (_ BitVec 64))

(declare-fun lt!228907 () SeekEntryResult!4045)

(declare-fun lt!228910 () array!32396)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32396 (_ BitVec 32)) SeekEntryResult!4045)

(assert (=> b!503259 (= lt!228907 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228900 lt!228909 lt!228910 mask!3524))))

(declare-fun b!503260 () Bool)

(declare-fun e!294723 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32396 (_ BitVec 32)) SeekEntryResult!4045)

(assert (=> b!503260 (= e!294723 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228900 (index!18370 lt!228905) (select (arr!15578 a!3235) j!176) a!3235 mask!3524) (Found!4045 j!176))))))

(declare-fun b!503261 () Bool)

(assert (=> b!503261 (= e!294725 (not e!294722))))

(declare-fun res!304581 () Bool)

(assert (=> b!503261 (=> res!304581 e!294722)))

(declare-fun lt!228904 () (_ BitVec 32))

(assert (=> b!503261 (= res!304581 (= lt!228905 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228904 lt!228909 lt!228910 mask!3524)))))

(assert (=> b!503261 (= lt!228905 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228900 (select (arr!15578 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503261 (= lt!228904 (toIndex!0 lt!228909 mask!3524))))

(assert (=> b!503261 (= lt!228909 (select (store (arr!15578 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!503261 (= lt!228900 (toIndex!0 (select (arr!15578 a!3235) j!176) mask!3524))))

(assert (=> b!503261 (= lt!228910 (array!32397 (store (arr!15578 a!3235) i!1204 k!2280) (size!15942 a!3235)))))

(assert (=> b!503261 e!294729))

(declare-fun res!304574 () Bool)

(assert (=> b!503261 (=> (not res!304574) (not e!294729))))

(assert (=> b!503261 (= res!304574 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228901 () Unit!15256)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32396 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15256)

(assert (=> b!503261 (= lt!228901 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503262 () Bool)

(declare-fun res!304575 () Bool)

(assert (=> b!503262 (=> (not res!304575) (not e!294726))))

(assert (=> b!503262 (= res!304575 (and (= (size!15942 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15942 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15942 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503263 () Bool)

(declare-fun res!304577 () Bool)

(assert (=> b!503263 (=> res!304577 e!294724)))

(assert (=> b!503263 (= res!304577 e!294723)))

(declare-fun res!304578 () Bool)

(assert (=> b!503263 (=> (not res!304578) (not e!294723))))

(assert (=> b!503263 (= res!304578 (bvsgt #b00000000000000000000000000000000 (x!47390 lt!228905)))))

(declare-fun b!503264 () Bool)

(declare-fun Unit!15259 () Unit!15256)

(assert (=> b!503264 (= e!294721 Unit!15259)))

(declare-fun lt!228908 () Unit!15256)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32396 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15256)

(assert (=> b!503264 (= lt!228908 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!228900 #b00000000000000000000000000000000 (index!18370 lt!228905) (x!47390 lt!228905) mask!3524))))

(declare-fun res!304582 () Bool)

(assert (=> b!503264 (= res!304582 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228900 lt!228909 lt!228910 mask!3524) (Intermediate!4045 false (index!18370 lt!228905) (x!47390 lt!228905))))))

(assert (=> b!503264 (=> (not res!304582) (not e!294728))))

(assert (=> b!503264 e!294728))

(assert (= (and start!45640 res!304580) b!503262))

(assert (= (and b!503262 res!304575) b!503252))

(assert (= (and b!503252 res!304569) b!503257))

(assert (= (and b!503257 res!304573) b!503249))

(assert (= (and b!503249 res!304576) b!503256))

(assert (= (and b!503256 res!304583) b!503251))

(assert (= (and b!503251 res!304579) b!503253))

(assert (= (and b!503253 res!304570) b!503261))

(assert (= (and b!503261 res!304574) b!503258))

(assert (= (and b!503261 (not res!304581)) b!503248))

(assert (= (and b!503248 (not res!304571)) b!503254))

(assert (= (and b!503254 c!59618) b!503264))

(assert (= (and b!503254 (not c!59618)) b!503255))

(assert (= (and b!503264 res!304582) b!503250))

(assert (= (and b!503254 (not res!304572)) b!503263))

(assert (= (and b!503263 res!304578) b!503260))

(assert (= (and b!503263 (not res!304577)) b!503259))

(declare-fun m!484103 () Bool)

(assert (=> b!503259 m!484103))

(declare-fun m!484105 () Bool)

(assert (=> b!503256 m!484105))

(declare-fun m!484107 () Bool)

(assert (=> b!503264 m!484107))

(assert (=> b!503264 m!484103))

(declare-fun m!484109 () Bool)

(assert (=> b!503254 m!484109))

(declare-fun m!484111 () Bool)

(assert (=> b!503254 m!484111))

(declare-fun m!484113 () Bool)

(assert (=> b!503254 m!484113))

(declare-fun m!484115 () Bool)

(assert (=> b!503251 m!484115))

(declare-fun m!484117 () Bool)

(assert (=> b!503253 m!484117))

(assert (=> b!503252 m!484113))

(assert (=> b!503252 m!484113))

(declare-fun m!484119 () Bool)

(assert (=> b!503252 m!484119))

(assert (=> b!503260 m!484113))

(assert (=> b!503260 m!484113))

(declare-fun m!484121 () Bool)

(assert (=> b!503260 m!484121))

(declare-fun m!484123 () Bool)

(assert (=> b!503261 m!484123))

(declare-fun m!484125 () Bool)

(assert (=> b!503261 m!484125))

(declare-fun m!484127 () Bool)

(assert (=> b!503261 m!484127))

(declare-fun m!484129 () Bool)

(assert (=> b!503261 m!484129))

(declare-fun m!484131 () Bool)

(assert (=> b!503261 m!484131))

(assert (=> b!503261 m!484113))

(declare-fun m!484133 () Bool)

(assert (=> b!503261 m!484133))

(assert (=> b!503261 m!484113))

(declare-fun m!484135 () Bool)

(assert (=> b!503261 m!484135))

(assert (=> b!503261 m!484113))

(declare-fun m!484137 () Bool)

(assert (=> b!503261 m!484137))

(declare-fun m!484139 () Bool)

(assert (=> b!503257 m!484139))

(declare-fun m!484141 () Bool)

(assert (=> b!503249 m!484141))

(assert (=> b!503258 m!484113))

(assert (=> b!503258 m!484113))

(declare-fun m!484143 () Bool)

(assert (=> b!503258 m!484143))

(declare-fun m!484145 () Bool)

(assert (=> start!45640 m!484145))

(declare-fun m!484147 () Bool)

(assert (=> start!45640 m!484147))

(push 1)

