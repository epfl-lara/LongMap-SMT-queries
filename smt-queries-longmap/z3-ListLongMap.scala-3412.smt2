; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47382 () Bool)

(assert start!47382)

(declare-fun b!520971 () Bool)

(declare-fun res!318949 () Bool)

(declare-fun e!303947 () Bool)

(assert (=> b!520971 (=> (not res!318949) (not e!303947))))

(declare-datatypes ((array!33218 0))(
  ( (array!33219 (arr!15965 (Array (_ BitVec 32) (_ BitVec 64))) (size!16330 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33218)

(declare-datatypes ((List!10162 0))(
  ( (Nil!10159) (Cons!10158 (h!11080 (_ BitVec 64)) (t!16381 List!10162)) )
))
(declare-fun arrayNoDuplicates!0 (array!33218 (_ BitVec 32) List!10162) Bool)

(assert (=> b!520971 (= res!318949 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10159))))

(declare-fun b!520972 () Bool)

(declare-fun e!303943 () Bool)

(assert (=> b!520972 (= e!303947 (not e!303943))))

(declare-fun res!318942 () Bool)

(assert (=> b!520972 (=> res!318942 e!303943)))

(declare-fun lt!238601 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!238606 () array!33218)

(declare-fun lt!238603 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4429 0))(
  ( (MissingZero!4429 (index!19919 (_ BitVec 32))) (Found!4429 (index!19920 (_ BitVec 32))) (Intermediate!4429 (undefined!5241 Bool) (index!19921 (_ BitVec 32)) (x!48914 (_ BitVec 32))) (Undefined!4429) (MissingVacant!4429 (index!19922 (_ BitVec 32))) )
))
(declare-fun lt!238598 () SeekEntryResult!4429)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33218 (_ BitVec 32)) SeekEntryResult!4429)

(assert (=> b!520972 (= res!318942 (= lt!238598 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238603 lt!238601 lt!238606 mask!3524)))))

(declare-fun lt!238604 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!520972 (= lt!238598 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238604 (select (arr!15965 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!520972 (= lt!238603 (toIndex!0 lt!238601 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!520972 (= lt!238601 (select (store (arr!15965 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!520972 (= lt!238604 (toIndex!0 (select (arr!15965 a!3235) j!176) mask!3524))))

(assert (=> b!520972 (= lt!238606 (array!33219 (store (arr!15965 a!3235) i!1204 k0!2280) (size!16330 a!3235)))))

(declare-fun e!303946 () Bool)

(assert (=> b!520972 e!303946))

(declare-fun res!318939 () Bool)

(assert (=> b!520972 (=> (not res!318939) (not e!303946))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33218 (_ BitVec 32)) Bool)

(assert (=> b!520972 (= res!318939 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16162 0))(
  ( (Unit!16163) )
))
(declare-fun lt!238605 () Unit!16162)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33218 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16162)

(assert (=> b!520972 (= lt!238605 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!520973 () Bool)

(declare-fun res!318950 () Bool)

(declare-fun e!303942 () Bool)

(assert (=> b!520973 (=> (not res!318950) (not e!303942))))

(declare-fun arrayContainsKey!0 (array!33218 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!520973 (= res!318950 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!318947 () Bool)

(assert (=> start!47382 (=> (not res!318947) (not e!303942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47382 (= res!318947 (validMask!0 mask!3524))))

(assert (=> start!47382 e!303942))

(assert (=> start!47382 true))

(declare-fun array_inv!11848 (array!33218) Bool)

(assert (=> start!47382 (array_inv!11848 a!3235)))

(declare-fun b!520974 () Bool)

(declare-fun res!318943 () Bool)

(assert (=> b!520974 (=> (not res!318943) (not e!303942))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!520974 (= res!318943 (validKeyInArray!0 k0!2280))))

(declare-fun b!520975 () Bool)

(declare-fun res!318944 () Bool)

(assert (=> b!520975 (=> (not res!318944) (not e!303942))))

(assert (=> b!520975 (= res!318944 (and (= (size!16330 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16330 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16330 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!520976 () Bool)

(assert (=> b!520976 (= e!303942 e!303947)))

(declare-fun res!318940 () Bool)

(assert (=> b!520976 (=> (not res!318940) (not e!303947))))

(declare-fun lt!238602 () SeekEntryResult!4429)

(assert (=> b!520976 (= res!318940 (or (= lt!238602 (MissingZero!4429 i!1204)) (= lt!238602 (MissingVacant!4429 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33218 (_ BitVec 32)) SeekEntryResult!4429)

(assert (=> b!520976 (= lt!238602 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!520977 () Bool)

(assert (=> b!520977 (= e!303943 true)))

(assert (=> b!520977 (and (or (= (select (arr!15965 a!3235) (index!19921 lt!238598)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15965 a!3235) (index!19921 lt!238598)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15965 a!3235) (index!19921 lt!238598)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15965 a!3235) (index!19921 lt!238598)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!238600 () Unit!16162)

(declare-fun e!303944 () Unit!16162)

(assert (=> b!520977 (= lt!238600 e!303944)))

(declare-fun c!61317 () Bool)

(assert (=> b!520977 (= c!61317 (= (select (arr!15965 a!3235) (index!19921 lt!238598)) (select (arr!15965 a!3235) j!176)))))

(assert (=> b!520977 (and (bvslt (x!48914 lt!238598) #b01111111111111111111111111111110) (or (= (select (arr!15965 a!3235) (index!19921 lt!238598)) (select (arr!15965 a!3235) j!176)) (= (select (arr!15965 a!3235) (index!19921 lt!238598)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15965 a!3235) (index!19921 lt!238598)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520978 () Bool)

(declare-fun res!318945 () Bool)

(assert (=> b!520978 (=> (not res!318945) (not e!303942))))

(assert (=> b!520978 (= res!318945 (validKeyInArray!0 (select (arr!15965 a!3235) j!176)))))

(declare-fun b!520979 () Bool)

(declare-fun e!303945 () Bool)

(assert (=> b!520979 (= e!303945 false)))

(declare-fun b!520980 () Bool)

(declare-fun res!318941 () Bool)

(assert (=> b!520980 (=> (not res!318941) (not e!303947))))

(assert (=> b!520980 (= res!318941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!520981 () Bool)

(declare-fun Unit!16164 () Unit!16162)

(assert (=> b!520981 (= e!303944 Unit!16164)))

(declare-fun lt!238599 () Unit!16162)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33218 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16162)

(assert (=> b!520981 (= lt!238599 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238604 #b00000000000000000000000000000000 (index!19921 lt!238598) (x!48914 lt!238598) mask!3524))))

(declare-fun res!318946 () Bool)

(assert (=> b!520981 (= res!318946 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238604 lt!238601 lt!238606 mask!3524) (Intermediate!4429 false (index!19921 lt!238598) (x!48914 lt!238598))))))

(assert (=> b!520981 (=> (not res!318946) (not e!303945))))

(assert (=> b!520981 e!303945))

(declare-fun b!520982 () Bool)

(declare-fun Unit!16165 () Unit!16162)

(assert (=> b!520982 (= e!303944 Unit!16165)))

(declare-fun b!520983 () Bool)

(assert (=> b!520983 (= e!303946 (= (seekEntryOrOpen!0 (select (arr!15965 a!3235) j!176) a!3235 mask!3524) (Found!4429 j!176)))))

(declare-fun b!520984 () Bool)

(declare-fun res!318948 () Bool)

(assert (=> b!520984 (=> res!318948 e!303943)))

(get-info :version)

(assert (=> b!520984 (= res!318948 (or (undefined!5241 lt!238598) (not ((_ is Intermediate!4429) lt!238598))))))

(assert (= (and start!47382 res!318947) b!520975))

(assert (= (and b!520975 res!318944) b!520978))

(assert (= (and b!520978 res!318945) b!520974))

(assert (= (and b!520974 res!318943) b!520973))

(assert (= (and b!520973 res!318950) b!520976))

(assert (= (and b!520976 res!318940) b!520980))

(assert (= (and b!520980 res!318941) b!520971))

(assert (= (and b!520971 res!318949) b!520972))

(assert (= (and b!520972 res!318939) b!520983))

(assert (= (and b!520972 (not res!318942)) b!520984))

(assert (= (and b!520984 (not res!318948)) b!520977))

(assert (= (and b!520977 c!61317) b!520981))

(assert (= (and b!520977 (not c!61317)) b!520982))

(assert (= (and b!520981 res!318946) b!520979))

(declare-fun m!501403 () Bool)

(assert (=> b!520971 m!501403))

(declare-fun m!501405 () Bool)

(assert (=> b!520976 m!501405))

(declare-fun m!501407 () Bool)

(assert (=> b!520974 m!501407))

(declare-fun m!501409 () Bool)

(assert (=> b!520981 m!501409))

(declare-fun m!501411 () Bool)

(assert (=> b!520981 m!501411))

(declare-fun m!501413 () Bool)

(assert (=> start!47382 m!501413))

(declare-fun m!501415 () Bool)

(assert (=> start!47382 m!501415))

(declare-fun m!501417 () Bool)

(assert (=> b!520980 m!501417))

(declare-fun m!501419 () Bool)

(assert (=> b!520983 m!501419))

(assert (=> b!520983 m!501419))

(declare-fun m!501421 () Bool)

(assert (=> b!520983 m!501421))

(declare-fun m!501423 () Bool)

(assert (=> b!520977 m!501423))

(assert (=> b!520977 m!501419))

(assert (=> b!520978 m!501419))

(assert (=> b!520978 m!501419))

(declare-fun m!501425 () Bool)

(assert (=> b!520978 m!501425))

(declare-fun m!501427 () Bool)

(assert (=> b!520972 m!501427))

(declare-fun m!501429 () Bool)

(assert (=> b!520972 m!501429))

(declare-fun m!501431 () Bool)

(assert (=> b!520972 m!501431))

(declare-fun m!501433 () Bool)

(assert (=> b!520972 m!501433))

(assert (=> b!520972 m!501419))

(declare-fun m!501435 () Bool)

(assert (=> b!520972 m!501435))

(assert (=> b!520972 m!501419))

(assert (=> b!520972 m!501419))

(declare-fun m!501437 () Bool)

(assert (=> b!520972 m!501437))

(declare-fun m!501439 () Bool)

(assert (=> b!520972 m!501439))

(declare-fun m!501441 () Bool)

(assert (=> b!520972 m!501441))

(declare-fun m!501443 () Bool)

(assert (=> b!520973 m!501443))

(check-sat (not b!520981) (not b!520976) (not b!520971) (not b!520980) (not b!520983) (not b!520972) (not start!47382) (not b!520973) (not b!520978) (not b!520974))
(check-sat)
