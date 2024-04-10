; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47904 () Bool)

(assert start!47904)

(declare-fun b!527599 () Bool)

(declare-fun res!323905 () Bool)

(declare-fun e!307490 () Bool)

(assert (=> b!527599 (=> (not res!323905) (not e!307490))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!527599 (= res!323905 (validKeyInArray!0 k!2280))))

(declare-fun b!527600 () Bool)

(declare-fun e!307486 () Bool)

(assert (=> b!527600 (= e!307486 false)))

(declare-fun b!527601 () Bool)

(declare-fun res!323901 () Bool)

(declare-fun e!307485 () Bool)

(assert (=> b!527601 (=> (not res!323901) (not e!307485))))

(declare-datatypes ((array!33472 0))(
  ( (array!33473 (arr!16086 (Array (_ BitVec 32) (_ BitVec 64))) (size!16450 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33472)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33472 (_ BitVec 32)) Bool)

(assert (=> b!527601 (= res!323901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!307491 () Bool)

(declare-fun b!527602 () Bool)

(declare-datatypes ((SeekEntryResult!4553 0))(
  ( (MissingZero!4553 (index!20430 (_ BitVec 32))) (Found!4553 (index!20431 (_ BitVec 32))) (Intermediate!4553 (undefined!5365 Bool) (index!20432 (_ BitVec 32)) (x!49402 (_ BitVec 32))) (Undefined!4553) (MissingVacant!4553 (index!20433 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33472 (_ BitVec 32)) SeekEntryResult!4553)

(assert (=> b!527602 (= e!307491 (= (seekEntryOrOpen!0 (select (arr!16086 a!3235) j!176) a!3235 mask!3524) (Found!4553 j!176)))))

(declare-fun b!527603 () Bool)

(declare-fun e!307488 () Bool)

(assert (=> b!527603 (= e!307485 (not e!307488))))

(declare-fun res!323909 () Bool)

(assert (=> b!527603 (=> res!323909 e!307488)))

(declare-fun lt!242866 () SeekEntryResult!4553)

(declare-fun lt!242859 () (_ BitVec 32))

(declare-fun lt!242865 () array!33472)

(declare-fun lt!242860 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33472 (_ BitVec 32)) SeekEntryResult!4553)

(assert (=> b!527603 (= res!323909 (= lt!242866 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242859 lt!242860 lt!242865 mask!3524)))))

(declare-fun lt!242858 () (_ BitVec 32))

(assert (=> b!527603 (= lt!242866 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242858 (select (arr!16086 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527603 (= lt!242859 (toIndex!0 lt!242860 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!527603 (= lt!242860 (select (store (arr!16086 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!527603 (= lt!242858 (toIndex!0 (select (arr!16086 a!3235) j!176) mask!3524))))

(assert (=> b!527603 (= lt!242865 (array!33473 (store (arr!16086 a!3235) i!1204 k!2280) (size!16450 a!3235)))))

(assert (=> b!527603 e!307491))

(declare-fun res!323911 () Bool)

(assert (=> b!527603 (=> (not res!323911) (not e!307491))))

(assert (=> b!527603 (= res!323911 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16664 0))(
  ( (Unit!16665) )
))
(declare-fun lt!242863 () Unit!16664)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33472 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16664)

(assert (=> b!527603 (= lt!242863 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!527604 () Bool)

(declare-fun res!323912 () Bool)

(assert (=> b!527604 (=> res!323912 e!307488)))

(assert (=> b!527604 (= res!323912 (or (undefined!5365 lt!242866) (not (is-Intermediate!4553 lt!242866))))))

(declare-fun b!527605 () Bool)

(declare-fun e!307489 () Unit!16664)

(declare-fun Unit!16666 () Unit!16664)

(assert (=> b!527605 (= e!307489 Unit!16666)))

(declare-fun lt!242861 () Unit!16664)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33472 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16664)

(assert (=> b!527605 (= lt!242861 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!242858 #b00000000000000000000000000000000 (index!20432 lt!242866) (x!49402 lt!242866) mask!3524))))

(declare-fun res!323908 () Bool)

(assert (=> b!527605 (= res!323908 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242858 lt!242860 lt!242865 mask!3524) (Intermediate!4553 false (index!20432 lt!242866) (x!49402 lt!242866))))))

(assert (=> b!527605 (=> (not res!323908) (not e!307486))))

(assert (=> b!527605 e!307486))

(declare-fun b!527606 () Bool)

(declare-fun Unit!16667 () Unit!16664)

(assert (=> b!527606 (= e!307489 Unit!16667)))

(declare-fun b!527607 () Bool)

(declare-fun res!323907 () Bool)

(assert (=> b!527607 (=> (not res!323907) (not e!307490))))

(declare-fun arrayContainsKey!0 (array!33472 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!527607 (= res!323907 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!323910 () Bool)

(assert (=> start!47904 (=> (not res!323910) (not e!307490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47904 (= res!323910 (validMask!0 mask!3524))))

(assert (=> start!47904 e!307490))

(assert (=> start!47904 true))

(declare-fun array_inv!11882 (array!33472) Bool)

(assert (=> start!47904 (array_inv!11882 a!3235)))

(declare-fun b!527608 () Bool)

(declare-fun res!323904 () Bool)

(assert (=> b!527608 (=> (not res!323904) (not e!307490))))

(assert (=> b!527608 (= res!323904 (and (= (size!16450 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16450 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16450 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!527609 () Bool)

(declare-fun res!323906 () Bool)

(assert (=> b!527609 (=> (not res!323906) (not e!307485))))

(declare-datatypes ((List!10244 0))(
  ( (Nil!10241) (Cons!10240 (h!11174 (_ BitVec 64)) (t!16472 List!10244)) )
))
(declare-fun arrayNoDuplicates!0 (array!33472 (_ BitVec 32) List!10244) Bool)

(assert (=> b!527609 (= res!323906 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10241))))

(declare-fun b!527610 () Bool)

(assert (=> b!527610 (= e!307488 true)))

(assert (=> b!527610 (= (index!20432 lt!242866) i!1204)))

(declare-fun lt!242862 () Unit!16664)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33472 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16664)

(assert (=> b!527610 (= lt!242862 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!242858 #b00000000000000000000000000000000 (index!20432 lt!242866) (x!49402 lt!242866) mask!3524))))

(assert (=> b!527610 (and (or (= (select (arr!16086 a!3235) (index!20432 lt!242866)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16086 a!3235) (index!20432 lt!242866)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16086 a!3235) (index!20432 lt!242866)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16086 a!3235) (index!20432 lt!242866)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242864 () Unit!16664)

(assert (=> b!527610 (= lt!242864 e!307489)))

(declare-fun c!62156 () Bool)

(assert (=> b!527610 (= c!62156 (= (select (arr!16086 a!3235) (index!20432 lt!242866)) (select (arr!16086 a!3235) j!176)))))

(assert (=> b!527610 (and (bvslt (x!49402 lt!242866) #b01111111111111111111111111111110) (or (= (select (arr!16086 a!3235) (index!20432 lt!242866)) (select (arr!16086 a!3235) j!176)) (= (select (arr!16086 a!3235) (index!20432 lt!242866)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16086 a!3235) (index!20432 lt!242866)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527611 () Bool)

(assert (=> b!527611 (= e!307490 e!307485)))

(declare-fun res!323902 () Bool)

(assert (=> b!527611 (=> (not res!323902) (not e!307485))))

(declare-fun lt!242857 () SeekEntryResult!4553)

(assert (=> b!527611 (= res!323902 (or (= lt!242857 (MissingZero!4553 i!1204)) (= lt!242857 (MissingVacant!4553 i!1204))))))

(assert (=> b!527611 (= lt!242857 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!527612 () Bool)

(declare-fun res!323903 () Bool)

(assert (=> b!527612 (=> (not res!323903) (not e!307490))))

(assert (=> b!527612 (= res!323903 (validKeyInArray!0 (select (arr!16086 a!3235) j!176)))))

(assert (= (and start!47904 res!323910) b!527608))

(assert (= (and b!527608 res!323904) b!527612))

(assert (= (and b!527612 res!323903) b!527599))

(assert (= (and b!527599 res!323905) b!527607))

(assert (= (and b!527607 res!323907) b!527611))

(assert (= (and b!527611 res!323902) b!527601))

(assert (= (and b!527601 res!323901) b!527609))

(assert (= (and b!527609 res!323906) b!527603))

(assert (= (and b!527603 res!323911) b!527602))

(assert (= (and b!527603 (not res!323909)) b!527604))

(assert (= (and b!527604 (not res!323912)) b!527610))

(assert (= (and b!527610 c!62156) b!527605))

(assert (= (and b!527610 (not c!62156)) b!527606))

(assert (= (and b!527605 res!323908) b!527600))

(declare-fun m!508257 () Bool)

(assert (=> b!527607 m!508257))

(declare-fun m!508259 () Bool)

(assert (=> b!527605 m!508259))

(declare-fun m!508261 () Bool)

(assert (=> b!527605 m!508261))

(declare-fun m!508263 () Bool)

(assert (=> b!527612 m!508263))

(assert (=> b!527612 m!508263))

(declare-fun m!508265 () Bool)

(assert (=> b!527612 m!508265))

(declare-fun m!508267 () Bool)

(assert (=> b!527603 m!508267))

(declare-fun m!508269 () Bool)

(assert (=> b!527603 m!508269))

(declare-fun m!508271 () Bool)

(assert (=> b!527603 m!508271))

(assert (=> b!527603 m!508263))

(declare-fun m!508273 () Bool)

(assert (=> b!527603 m!508273))

(declare-fun m!508275 () Bool)

(assert (=> b!527603 m!508275))

(assert (=> b!527603 m!508263))

(declare-fun m!508277 () Bool)

(assert (=> b!527603 m!508277))

(declare-fun m!508279 () Bool)

(assert (=> b!527603 m!508279))

(assert (=> b!527603 m!508263))

(declare-fun m!508281 () Bool)

(assert (=> b!527603 m!508281))

(declare-fun m!508283 () Bool)

(assert (=> b!527609 m!508283))

(declare-fun m!508285 () Bool)

(assert (=> start!47904 m!508285))

(declare-fun m!508287 () Bool)

(assert (=> start!47904 m!508287))

(declare-fun m!508289 () Bool)

(assert (=> b!527601 m!508289))

(declare-fun m!508291 () Bool)

(assert (=> b!527610 m!508291))

(declare-fun m!508293 () Bool)

(assert (=> b!527610 m!508293))

(assert (=> b!527610 m!508263))

(assert (=> b!527602 m!508263))

(assert (=> b!527602 m!508263))

(declare-fun m!508295 () Bool)

(assert (=> b!527602 m!508295))

(declare-fun m!508297 () Bool)

(assert (=> b!527611 m!508297))

(declare-fun m!508299 () Bool)

(assert (=> b!527599 m!508299))

(push 1)

