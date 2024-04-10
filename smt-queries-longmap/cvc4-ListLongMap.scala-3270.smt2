; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45496 () Bool)

(assert start!45496)

(declare-fun b!501115 () Bool)

(declare-fun e!293561 () Bool)

(assert (=> b!501115 (= e!293561 false)))

(declare-fun b!501116 () Bool)

(declare-fun e!293562 () Bool)

(declare-fun e!293564 () Bool)

(assert (=> b!501116 (= e!293562 e!293564)))

(declare-fun res!302854 () Bool)

(assert (=> b!501116 (=> (not res!302854) (not e!293564))))

(declare-datatypes ((SeekEntryResult!4009 0))(
  ( (MissingZero!4009 (index!18218 (_ BitVec 32))) (Found!4009 (index!18219 (_ BitVec 32))) (Intermediate!4009 (undefined!4821 Bool) (index!18220 (_ BitVec 32)) (x!47246 (_ BitVec 32))) (Undefined!4009) (MissingVacant!4009 (index!18221 (_ BitVec 32))) )
))
(declare-fun lt!227574 () SeekEntryResult!4009)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!501116 (= res!302854 (or (= lt!227574 (MissingZero!4009 i!1204)) (= lt!227574 (MissingVacant!4009 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32321 0))(
  ( (array!32322 (arr!15542 (Array (_ BitVec 32) (_ BitVec 64))) (size!15906 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32321)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32321 (_ BitVec 32)) SeekEntryResult!4009)

(assert (=> b!501116 (= lt!227574 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!501117 () Bool)

(declare-fun res!302859 () Bool)

(assert (=> b!501117 (=> (not res!302859) (not e!293562))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!501117 (= res!302859 (and (= (size!15906 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15906 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15906 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!302857 () Bool)

(assert (=> start!45496 (=> (not res!302857) (not e!293562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45496 (= res!302857 (validMask!0 mask!3524))))

(assert (=> start!45496 e!293562))

(assert (=> start!45496 true))

(declare-fun array_inv!11338 (array!32321) Bool)

(assert (=> start!45496 (array_inv!11338 a!3235)))

(declare-fun b!501118 () Bool)

(declare-fun e!293560 () Bool)

(assert (=> b!501118 (= e!293564 (not e!293560))))

(declare-fun res!302858 () Bool)

(assert (=> b!501118 (=> res!302858 e!293560)))

(declare-fun lt!227572 () SeekEntryResult!4009)

(declare-fun lt!227577 () array!32321)

(declare-fun lt!227569 () (_ BitVec 32))

(declare-fun lt!227575 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32321 (_ BitVec 32)) SeekEntryResult!4009)

(assert (=> b!501118 (= res!302858 (= lt!227572 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227569 lt!227575 lt!227577 mask!3524)))))

(declare-fun lt!227576 () (_ BitVec 32))

(assert (=> b!501118 (= lt!227572 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227576 (select (arr!15542 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501118 (= lt!227569 (toIndex!0 lt!227575 mask!3524))))

(assert (=> b!501118 (= lt!227575 (select (store (arr!15542 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!501118 (= lt!227576 (toIndex!0 (select (arr!15542 a!3235) j!176) mask!3524))))

(assert (=> b!501118 (= lt!227577 (array!32322 (store (arr!15542 a!3235) i!1204 k!2280) (size!15906 a!3235)))))

(declare-fun e!293559 () Bool)

(assert (=> b!501118 e!293559))

(declare-fun res!302864 () Bool)

(assert (=> b!501118 (=> (not res!302864) (not e!293559))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32321 (_ BitVec 32)) Bool)

(assert (=> b!501118 (= res!302864 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15112 0))(
  ( (Unit!15113) )
))
(declare-fun lt!227578 () Unit!15112)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32321 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15112)

(assert (=> b!501118 (= lt!227578 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!501119 () Bool)

(assert (=> b!501119 (= e!293560 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!501119 (= (index!18220 lt!227572) i!1204)))

(declare-fun lt!227570 () Unit!15112)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32321 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15112)

(assert (=> b!501119 (= lt!227570 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!227576 #b00000000000000000000000000000000 (index!18220 lt!227572) (x!47246 lt!227572) mask!3524))))

(assert (=> b!501119 (and (or (= (select (arr!15542 a!3235) (index!18220 lt!227572)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15542 a!3235) (index!18220 lt!227572)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15542 a!3235) (index!18220 lt!227572)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15542 a!3235) (index!18220 lt!227572)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227573 () Unit!15112)

(declare-fun e!293563 () Unit!15112)

(assert (=> b!501119 (= lt!227573 e!293563)))

(declare-fun c!59408 () Bool)

(assert (=> b!501119 (= c!59408 (= (select (arr!15542 a!3235) (index!18220 lt!227572)) (select (arr!15542 a!3235) j!176)))))

(assert (=> b!501119 (and (bvslt (x!47246 lt!227572) #b01111111111111111111111111111110) (or (= (select (arr!15542 a!3235) (index!18220 lt!227572)) (select (arr!15542 a!3235) j!176)) (= (select (arr!15542 a!3235) (index!18220 lt!227572)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15542 a!3235) (index!18220 lt!227572)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!501120 () Bool)

(declare-fun Unit!15114 () Unit!15112)

(assert (=> b!501120 (= e!293563 Unit!15114)))

(declare-fun b!501121 () Bool)

(declare-fun res!302860 () Bool)

(assert (=> b!501121 (=> (not res!302860) (not e!293564))))

(assert (=> b!501121 (= res!302860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!501122 () Bool)

(assert (=> b!501122 (= e!293559 (= (seekEntryOrOpen!0 (select (arr!15542 a!3235) j!176) a!3235 mask!3524) (Found!4009 j!176)))))

(declare-fun b!501123 () Bool)

(declare-fun res!302862 () Bool)

(assert (=> b!501123 (=> (not res!302862) (not e!293562))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!501123 (= res!302862 (validKeyInArray!0 (select (arr!15542 a!3235) j!176)))))

(declare-fun b!501124 () Bool)

(declare-fun Unit!15115 () Unit!15112)

(assert (=> b!501124 (= e!293563 Unit!15115)))

(declare-fun lt!227571 () Unit!15112)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32321 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15112)

(assert (=> b!501124 (= lt!227571 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!227576 #b00000000000000000000000000000000 (index!18220 lt!227572) (x!47246 lt!227572) mask!3524))))

(declare-fun res!302853 () Bool)

(assert (=> b!501124 (= res!302853 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227576 lt!227575 lt!227577 mask!3524) (Intermediate!4009 false (index!18220 lt!227572) (x!47246 lt!227572))))))

(assert (=> b!501124 (=> (not res!302853) (not e!293561))))

(assert (=> b!501124 e!293561))

(declare-fun b!501125 () Bool)

(declare-fun res!302863 () Bool)

(assert (=> b!501125 (=> (not res!302863) (not e!293564))))

(declare-datatypes ((List!9700 0))(
  ( (Nil!9697) (Cons!9696 (h!10570 (_ BitVec 64)) (t!15928 List!9700)) )
))
(declare-fun arrayNoDuplicates!0 (array!32321 (_ BitVec 32) List!9700) Bool)

(assert (=> b!501125 (= res!302863 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9697))))

(declare-fun b!501126 () Bool)

(declare-fun res!302856 () Bool)

(assert (=> b!501126 (=> (not res!302856) (not e!293562))))

(declare-fun arrayContainsKey!0 (array!32321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!501126 (= res!302856 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!501127 () Bool)

(declare-fun res!302855 () Bool)

(assert (=> b!501127 (=> (not res!302855) (not e!293562))))

(assert (=> b!501127 (= res!302855 (validKeyInArray!0 k!2280))))

(declare-fun b!501128 () Bool)

(declare-fun res!302861 () Bool)

(assert (=> b!501128 (=> res!302861 e!293560)))

(assert (=> b!501128 (= res!302861 (or (undefined!4821 lt!227572) (not (is-Intermediate!4009 lt!227572))))))

(assert (= (and start!45496 res!302857) b!501117))

(assert (= (and b!501117 res!302859) b!501123))

(assert (= (and b!501123 res!302862) b!501127))

(assert (= (and b!501127 res!302855) b!501126))

(assert (= (and b!501126 res!302856) b!501116))

(assert (= (and b!501116 res!302854) b!501121))

(assert (= (and b!501121 res!302860) b!501125))

(assert (= (and b!501125 res!302863) b!501118))

(assert (= (and b!501118 res!302864) b!501122))

(assert (= (and b!501118 (not res!302858)) b!501128))

(assert (= (and b!501128 (not res!302861)) b!501119))

(assert (= (and b!501119 c!59408) b!501124))

(assert (= (and b!501119 (not c!59408)) b!501120))

(assert (= (and b!501124 res!302853) b!501115))

(declare-fun m!482215 () Bool)

(assert (=> b!501116 m!482215))

(declare-fun m!482217 () Bool)

(assert (=> b!501121 m!482217))

(declare-fun m!482219 () Bool)

(assert (=> b!501126 m!482219))

(declare-fun m!482221 () Bool)

(assert (=> b!501125 m!482221))

(declare-fun m!482223 () Bool)

(assert (=> b!501118 m!482223))

(declare-fun m!482225 () Bool)

(assert (=> b!501118 m!482225))

(declare-fun m!482227 () Bool)

(assert (=> b!501118 m!482227))

(declare-fun m!482229 () Bool)

(assert (=> b!501118 m!482229))

(declare-fun m!482231 () Bool)

(assert (=> b!501118 m!482231))

(declare-fun m!482233 () Bool)

(assert (=> b!501118 m!482233))

(assert (=> b!501118 m!482229))

(declare-fun m!482235 () Bool)

(assert (=> b!501118 m!482235))

(assert (=> b!501118 m!482229))

(declare-fun m!482237 () Bool)

(assert (=> b!501118 m!482237))

(declare-fun m!482239 () Bool)

(assert (=> b!501118 m!482239))

(declare-fun m!482241 () Bool)

(assert (=> b!501127 m!482241))

(assert (=> b!501123 m!482229))

(assert (=> b!501123 m!482229))

(declare-fun m!482243 () Bool)

(assert (=> b!501123 m!482243))

(assert (=> b!501122 m!482229))

(assert (=> b!501122 m!482229))

(declare-fun m!482245 () Bool)

(assert (=> b!501122 m!482245))

(declare-fun m!482247 () Bool)

(assert (=> b!501124 m!482247))

(declare-fun m!482249 () Bool)

(assert (=> b!501124 m!482249))

(declare-fun m!482251 () Bool)

(assert (=> start!45496 m!482251))

(declare-fun m!482253 () Bool)

(assert (=> start!45496 m!482253))

(declare-fun m!482255 () Bool)

(assert (=> b!501119 m!482255))

(declare-fun m!482257 () Bool)

(assert (=> b!501119 m!482257))

(assert (=> b!501119 m!482229))

(push 1)

