; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45460 () Bool)

(assert start!45460)

(declare-fun b!500313 () Bool)

(declare-fun e!293139 () Bool)

(declare-fun e!293135 () Bool)

(assert (=> b!500313 (= e!293139 e!293135)))

(declare-fun res!302166 () Bool)

(assert (=> b!500313 (=> (not res!302166) (not e!293135))))

(declare-datatypes ((SeekEntryResult!3991 0))(
  ( (MissingZero!3991 (index!18146 (_ BitVec 32))) (Found!3991 (index!18147 (_ BitVec 32))) (Intermediate!3991 (undefined!4803 Bool) (index!18148 (_ BitVec 32)) (x!47180 (_ BitVec 32))) (Undefined!3991) (MissingVacant!3991 (index!18149 (_ BitVec 32))) )
))
(declare-fun lt!227031 () SeekEntryResult!3991)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500313 (= res!302166 (or (= lt!227031 (MissingZero!3991 i!1204)) (= lt!227031 (MissingVacant!3991 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32285 0))(
  ( (array!32286 (arr!15524 (Array (_ BitVec 32) (_ BitVec 64))) (size!15888 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32285)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32285 (_ BitVec 32)) SeekEntryResult!3991)

(assert (=> b!500313 (= lt!227031 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!500314 () Bool)

(declare-fun res!302159 () Bool)

(assert (=> b!500314 (=> (not res!302159) (not e!293139))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!500314 (= res!302159 (and (= (size!15888 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15888 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15888 a!3235)) (not (= i!1204 j!176))))))

(declare-fun e!293140 () Bool)

(declare-fun b!500315 () Bool)

(assert (=> b!500315 (= e!293140 (= (seekEntryOrOpen!0 (select (arr!15524 a!3235) j!176) a!3235 mask!3524) (Found!3991 j!176)))))

(declare-fun b!500316 () Bool)

(declare-fun res!302163 () Bool)

(assert (=> b!500316 (=> (not res!302163) (not e!293139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500316 (= res!302163 (validKeyInArray!0 k!2280))))

(declare-fun b!500317 () Bool)

(declare-fun res!302171 () Bool)

(assert (=> b!500317 (=> (not res!302171) (not e!293139))))

(assert (=> b!500317 (= res!302171 (validKeyInArray!0 (select (arr!15524 a!3235) j!176)))))

(declare-fun res!302161 () Bool)

(assert (=> start!45460 (=> (not res!302161) (not e!293139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45460 (= res!302161 (validMask!0 mask!3524))))

(assert (=> start!45460 e!293139))

(assert (=> start!45460 true))

(declare-fun array_inv!11320 (array!32285) Bool)

(assert (=> start!45460 (array_inv!11320 a!3235)))

(declare-fun b!500318 () Bool)

(declare-fun e!293142 () Bool)

(declare-fun e!293137 () Bool)

(assert (=> b!500318 (= e!293142 e!293137)))

(declare-fun res!302169 () Bool)

(assert (=> b!500318 (=> res!302169 e!293137)))

(declare-fun lt!227035 () (_ BitVec 32))

(declare-fun lt!227034 () SeekEntryResult!3991)

(assert (=> b!500318 (= res!302169 (or (bvsgt #b00000000000000000000000000000000 (x!47180 lt!227034)) (bvsgt (x!47180 lt!227034) #b01111111111111111111111111111110) (bvslt lt!227035 #b00000000000000000000000000000000) (bvsge lt!227035 (size!15888 a!3235)) (bvslt (index!18148 lt!227034) #b00000000000000000000000000000000) (bvsge (index!18148 lt!227034) (size!15888 a!3235)) (not (= lt!227034 (Intermediate!3991 false (index!18148 lt!227034) (x!47180 lt!227034))))))))

(assert (=> b!500318 (and (or (= (select (arr!15524 a!3235) (index!18148 lt!227034)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15524 a!3235) (index!18148 lt!227034)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15524 a!3235) (index!18148 lt!227034)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15524 a!3235) (index!18148 lt!227034)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!15040 0))(
  ( (Unit!15041) )
))
(declare-fun lt!227037 () Unit!15040)

(declare-fun e!293136 () Unit!15040)

(assert (=> b!500318 (= lt!227037 e!293136)))

(declare-fun c!59354 () Bool)

(assert (=> b!500318 (= c!59354 (= (select (arr!15524 a!3235) (index!18148 lt!227034)) (select (arr!15524 a!3235) j!176)))))

(assert (=> b!500318 (and (bvslt (x!47180 lt!227034) #b01111111111111111111111111111110) (or (= (select (arr!15524 a!3235) (index!18148 lt!227034)) (select (arr!15524 a!3235) j!176)) (= (select (arr!15524 a!3235) (index!18148 lt!227034)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15524 a!3235) (index!18148 lt!227034)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500319 () Bool)

(declare-fun res!302164 () Bool)

(assert (=> b!500319 (=> (not res!302164) (not e!293135))))

(declare-datatypes ((List!9682 0))(
  ( (Nil!9679) (Cons!9678 (h!10552 (_ BitVec 64)) (t!15910 List!9682)) )
))
(declare-fun arrayNoDuplicates!0 (array!32285 (_ BitVec 32) List!9682) Bool)

(assert (=> b!500319 (= res!302164 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9679))))

(declare-fun b!500320 () Bool)

(assert (=> b!500320 (= e!293137 true)))

(declare-fun lt!227038 () array!32285)

(declare-fun lt!227036 () (_ BitVec 64))

(declare-fun lt!227032 () SeekEntryResult!3991)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32285 (_ BitVec 32)) SeekEntryResult!3991)

(assert (=> b!500320 (= lt!227032 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227035 lt!227036 lt!227038 mask!3524))))

(declare-fun b!500321 () Bool)

(declare-fun res!302167 () Bool)

(assert (=> b!500321 (=> res!302167 e!293142)))

(assert (=> b!500321 (= res!302167 (or (undefined!4803 lt!227034) (not (is-Intermediate!3991 lt!227034))))))

(declare-fun b!500322 () Bool)

(declare-fun e!293141 () Bool)

(assert (=> b!500322 (= e!293141 false)))

(declare-fun b!500323 () Bool)

(declare-fun Unit!15042 () Unit!15040)

(assert (=> b!500323 (= e!293136 Unit!15042)))

(declare-fun b!500324 () Bool)

(assert (=> b!500324 (= e!293135 (not e!293142))))

(declare-fun res!302165 () Bool)

(assert (=> b!500324 (=> res!302165 e!293142)))

(declare-fun lt!227033 () (_ BitVec 32))

(assert (=> b!500324 (= res!302165 (= lt!227034 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227033 lt!227036 lt!227038 mask!3524)))))

(assert (=> b!500324 (= lt!227034 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227035 (select (arr!15524 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500324 (= lt!227033 (toIndex!0 lt!227036 mask!3524))))

(assert (=> b!500324 (= lt!227036 (select (store (arr!15524 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!500324 (= lt!227035 (toIndex!0 (select (arr!15524 a!3235) j!176) mask!3524))))

(assert (=> b!500324 (= lt!227038 (array!32286 (store (arr!15524 a!3235) i!1204 k!2280) (size!15888 a!3235)))))

(assert (=> b!500324 e!293140))

(declare-fun res!302168 () Bool)

(assert (=> b!500324 (=> (not res!302168) (not e!293140))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32285 (_ BitVec 32)) Bool)

(assert (=> b!500324 (= res!302168 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227030 () Unit!15040)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32285 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15040)

(assert (=> b!500324 (= lt!227030 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500325 () Bool)

(declare-fun Unit!15043 () Unit!15040)

(assert (=> b!500325 (= e!293136 Unit!15043)))

(declare-fun lt!227029 () Unit!15040)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32285 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15040)

(assert (=> b!500325 (= lt!227029 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!227035 #b00000000000000000000000000000000 (index!18148 lt!227034) (x!47180 lt!227034) mask!3524))))

(declare-fun res!302162 () Bool)

(assert (=> b!500325 (= res!302162 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227035 lt!227036 lt!227038 mask!3524) (Intermediate!3991 false (index!18148 lt!227034) (x!47180 lt!227034))))))

(assert (=> b!500325 (=> (not res!302162) (not e!293141))))

(assert (=> b!500325 e!293141))

(declare-fun b!500326 () Bool)

(declare-fun res!302170 () Bool)

(assert (=> b!500326 (=> (not res!302170) (not e!293135))))

(assert (=> b!500326 (= res!302170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500327 () Bool)

(declare-fun res!302160 () Bool)

(assert (=> b!500327 (=> (not res!302160) (not e!293139))))

(declare-fun arrayContainsKey!0 (array!32285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500327 (= res!302160 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45460 res!302161) b!500314))

(assert (= (and b!500314 res!302159) b!500317))

(assert (= (and b!500317 res!302171) b!500316))

(assert (= (and b!500316 res!302163) b!500327))

(assert (= (and b!500327 res!302160) b!500313))

(assert (= (and b!500313 res!302166) b!500326))

(assert (= (and b!500326 res!302170) b!500319))

(assert (= (and b!500319 res!302164) b!500324))

(assert (= (and b!500324 res!302168) b!500315))

(assert (= (and b!500324 (not res!302165)) b!500321))

(assert (= (and b!500321 (not res!302167)) b!500318))

(assert (= (and b!500318 c!59354) b!500325))

(assert (= (and b!500318 (not c!59354)) b!500323))

(assert (= (and b!500325 res!302162) b!500322))

(assert (= (and b!500318 (not res!302169)) b!500320))

(declare-fun m!481455 () Bool)

(assert (=> b!500317 m!481455))

(assert (=> b!500317 m!481455))

(declare-fun m!481457 () Bool)

(assert (=> b!500317 m!481457))

(assert (=> b!500315 m!481455))

(assert (=> b!500315 m!481455))

(declare-fun m!481459 () Bool)

(assert (=> b!500315 m!481459))

(declare-fun m!481461 () Bool)

(assert (=> b!500325 m!481461))

(declare-fun m!481463 () Bool)

(assert (=> b!500325 m!481463))

(declare-fun m!481465 () Bool)

(assert (=> b!500326 m!481465))

(declare-fun m!481467 () Bool)

(assert (=> b!500316 m!481467))

(declare-fun m!481469 () Bool)

(assert (=> b!500319 m!481469))

(declare-fun m!481471 () Bool)

(assert (=> b!500318 m!481471))

(assert (=> b!500318 m!481455))

(declare-fun m!481473 () Bool)

(assert (=> b!500313 m!481473))

(declare-fun m!481475 () Bool)

(assert (=> b!500327 m!481475))

(declare-fun m!481477 () Bool)

(assert (=> b!500324 m!481477))

(declare-fun m!481479 () Bool)

(assert (=> b!500324 m!481479))

(declare-fun m!481481 () Bool)

(assert (=> b!500324 m!481481))

(declare-fun m!481483 () Bool)

(assert (=> b!500324 m!481483))

(declare-fun m!481485 () Bool)

(assert (=> b!500324 m!481485))

(assert (=> b!500324 m!481455))

(declare-fun m!481487 () Bool)

(assert (=> b!500324 m!481487))

(assert (=> b!500324 m!481455))

(declare-fun m!481489 () Bool)

(assert (=> b!500324 m!481489))

(assert (=> b!500324 m!481455))

(declare-fun m!481491 () Bool)

(assert (=> b!500324 m!481491))

(declare-fun m!481493 () Bool)

(assert (=> start!45460 m!481493))

(declare-fun m!481495 () Bool)

(assert (=> start!45460 m!481495))

(assert (=> b!500320 m!481463))

(push 1)

