; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47908 () Bool)

(assert start!47908)

(declare-fun b!527683 () Bool)

(declare-fun e!307531 () Bool)

(assert (=> b!527683 (= e!307531 true)))

(declare-datatypes ((SeekEntryResult!4555 0))(
  ( (MissingZero!4555 (index!20438 (_ BitVec 32))) (Found!4555 (index!20439 (_ BitVec 32))) (Intermediate!4555 (undefined!5367 Bool) (index!20440 (_ BitVec 32)) (x!49404 (_ BitVec 32))) (Undefined!4555) (MissingVacant!4555 (index!20441 (_ BitVec 32))) )
))
(declare-fun lt!242921 () SeekEntryResult!4555)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!527683 (= (index!20440 lt!242921) i!1204)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33476 0))(
  ( (array!33477 (arr!16088 (Array (_ BitVec 32) (_ BitVec 64))) (size!16452 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33476)

(declare-datatypes ((Unit!16672 0))(
  ( (Unit!16673) )
))
(declare-fun lt!242919 () Unit!16672)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!242922 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33476 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16672)

(assert (=> b!527683 (= lt!242919 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!242922 #b00000000000000000000000000000000 (index!20440 lt!242921) (x!49404 lt!242921) mask!3524))))

(assert (=> b!527683 (and (or (= (select (arr!16088 a!3235) (index!20440 lt!242921)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16088 a!3235) (index!20440 lt!242921)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16088 a!3235) (index!20440 lt!242921)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16088 a!3235) (index!20440 lt!242921)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242918 () Unit!16672)

(declare-fun e!307529 () Unit!16672)

(assert (=> b!527683 (= lt!242918 e!307529)))

(declare-fun c!62162 () Bool)

(assert (=> b!527683 (= c!62162 (= (select (arr!16088 a!3235) (index!20440 lt!242921)) (select (arr!16088 a!3235) j!176)))))

(assert (=> b!527683 (and (bvslt (x!49404 lt!242921) #b01111111111111111111111111111110) (or (= (select (arr!16088 a!3235) (index!20440 lt!242921)) (select (arr!16088 a!3235) j!176)) (= (select (arr!16088 a!3235) (index!20440 lt!242921)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16088 a!3235) (index!20440 lt!242921)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527684 () Bool)

(declare-fun e!307530 () Bool)

(assert (=> b!527684 (= e!307530 false)))

(declare-fun b!527685 () Bool)

(declare-fun res!323979 () Bool)

(assert (=> b!527685 (=> res!323979 e!307531)))

(assert (=> b!527685 (= res!323979 (or (undefined!5367 lt!242921) (not (is-Intermediate!4555 lt!242921))))))

(declare-fun b!527686 () Bool)

(declare-fun res!323978 () Bool)

(declare-fun e!307532 () Bool)

(assert (=> b!527686 (=> (not res!323978) (not e!307532))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!527686 (= res!323978 (validKeyInArray!0 (select (arr!16088 a!3235) j!176)))))

(declare-fun res!323984 () Bool)

(assert (=> start!47908 (=> (not res!323984) (not e!307532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47908 (= res!323984 (validMask!0 mask!3524))))

(assert (=> start!47908 e!307532))

(assert (=> start!47908 true))

(declare-fun array_inv!11884 (array!33476) Bool)

(assert (=> start!47908 (array_inv!11884 a!3235)))

(declare-fun e!307528 () Bool)

(declare-fun b!527687 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33476 (_ BitVec 32)) SeekEntryResult!4555)

(assert (=> b!527687 (= e!307528 (= (seekEntryOrOpen!0 (select (arr!16088 a!3235) j!176) a!3235 mask!3524) (Found!4555 j!176)))))

(declare-fun b!527688 () Bool)

(declare-fun res!323976 () Bool)

(assert (=> b!527688 (=> (not res!323976) (not e!307532))))

(declare-fun arrayContainsKey!0 (array!33476 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!527688 (= res!323976 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!527689 () Bool)

(declare-fun Unit!16674 () Unit!16672)

(assert (=> b!527689 (= e!307529 Unit!16674)))

(declare-fun b!527690 () Bool)

(declare-fun res!323981 () Bool)

(assert (=> b!527690 (=> (not res!323981) (not e!307532))))

(assert (=> b!527690 (= res!323981 (validKeyInArray!0 k!2280))))

(declare-fun b!527691 () Bool)

(declare-fun res!323980 () Bool)

(assert (=> b!527691 (=> (not res!323980) (not e!307532))))

(assert (=> b!527691 (= res!323980 (and (= (size!16452 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16452 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16452 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!527692 () Bool)

(declare-fun res!323974 () Bool)

(declare-fun e!307527 () Bool)

(assert (=> b!527692 (=> (not res!323974) (not e!307527))))

(declare-datatypes ((List!10246 0))(
  ( (Nil!10243) (Cons!10242 (h!11176 (_ BitVec 64)) (t!16474 List!10246)) )
))
(declare-fun arrayNoDuplicates!0 (array!33476 (_ BitVec 32) List!10246) Bool)

(assert (=> b!527692 (= res!323974 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10243))))

(declare-fun b!527693 () Bool)

(assert (=> b!527693 (= e!307527 (not e!307531))))

(declare-fun res!323973 () Bool)

(assert (=> b!527693 (=> res!323973 e!307531)))

(declare-fun lt!242920 () (_ BitVec 32))

(declare-fun lt!242925 () (_ BitVec 64))

(declare-fun lt!242926 () array!33476)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33476 (_ BitVec 32)) SeekEntryResult!4555)

(assert (=> b!527693 (= res!323973 (= lt!242921 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242920 lt!242925 lt!242926 mask!3524)))))

(assert (=> b!527693 (= lt!242921 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242922 (select (arr!16088 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527693 (= lt!242920 (toIndex!0 lt!242925 mask!3524))))

(assert (=> b!527693 (= lt!242925 (select (store (arr!16088 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!527693 (= lt!242922 (toIndex!0 (select (arr!16088 a!3235) j!176) mask!3524))))

(assert (=> b!527693 (= lt!242926 (array!33477 (store (arr!16088 a!3235) i!1204 k!2280) (size!16452 a!3235)))))

(assert (=> b!527693 e!307528))

(declare-fun res!323982 () Bool)

(assert (=> b!527693 (=> (not res!323982) (not e!307528))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33476 (_ BitVec 32)) Bool)

(assert (=> b!527693 (= res!323982 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242917 () Unit!16672)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33476 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16672)

(assert (=> b!527693 (= lt!242917 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!527694 () Bool)

(declare-fun Unit!16675 () Unit!16672)

(assert (=> b!527694 (= e!307529 Unit!16675)))

(declare-fun lt!242923 () Unit!16672)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33476 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16672)

(assert (=> b!527694 (= lt!242923 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!242922 #b00000000000000000000000000000000 (index!20440 lt!242921) (x!49404 lt!242921) mask!3524))))

(declare-fun res!323975 () Bool)

(assert (=> b!527694 (= res!323975 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242922 lt!242925 lt!242926 mask!3524) (Intermediate!4555 false (index!20440 lt!242921) (x!49404 lt!242921))))))

(assert (=> b!527694 (=> (not res!323975) (not e!307530))))

(assert (=> b!527694 e!307530))

(declare-fun b!527695 () Bool)

(assert (=> b!527695 (= e!307532 e!307527)))

(declare-fun res!323983 () Bool)

(assert (=> b!527695 (=> (not res!323983) (not e!307527))))

(declare-fun lt!242924 () SeekEntryResult!4555)

(assert (=> b!527695 (= res!323983 (or (= lt!242924 (MissingZero!4555 i!1204)) (= lt!242924 (MissingVacant!4555 i!1204))))))

(assert (=> b!527695 (= lt!242924 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!527696 () Bool)

(declare-fun res!323977 () Bool)

(assert (=> b!527696 (=> (not res!323977) (not e!307527))))

(assert (=> b!527696 (= res!323977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!47908 res!323984) b!527691))

(assert (= (and b!527691 res!323980) b!527686))

(assert (= (and b!527686 res!323978) b!527690))

(assert (= (and b!527690 res!323981) b!527688))

(assert (= (and b!527688 res!323976) b!527695))

(assert (= (and b!527695 res!323983) b!527696))

(assert (= (and b!527696 res!323977) b!527692))

(assert (= (and b!527692 res!323974) b!527693))

(assert (= (and b!527693 res!323982) b!527687))

(assert (= (and b!527693 (not res!323973)) b!527685))

(assert (= (and b!527685 (not res!323979)) b!527683))

(assert (= (and b!527683 c!62162) b!527694))

(assert (= (and b!527683 (not c!62162)) b!527689))

(assert (= (and b!527694 res!323975) b!527684))

(declare-fun m!508345 () Bool)

(assert (=> b!527687 m!508345))

(assert (=> b!527687 m!508345))

(declare-fun m!508347 () Bool)

(assert (=> b!527687 m!508347))

(declare-fun m!508349 () Bool)

(assert (=> b!527696 m!508349))

(declare-fun m!508351 () Bool)

(assert (=> b!527692 m!508351))

(declare-fun m!508353 () Bool)

(assert (=> b!527690 m!508353))

(declare-fun m!508355 () Bool)

(assert (=> b!527695 m!508355))

(declare-fun m!508357 () Bool)

(assert (=> b!527683 m!508357))

(declare-fun m!508359 () Bool)

(assert (=> b!527683 m!508359))

(assert (=> b!527683 m!508345))

(declare-fun m!508361 () Bool)

(assert (=> start!47908 m!508361))

(declare-fun m!508363 () Bool)

(assert (=> start!47908 m!508363))

(declare-fun m!508365 () Bool)

(assert (=> b!527688 m!508365))

(assert (=> b!527686 m!508345))

(assert (=> b!527686 m!508345))

(declare-fun m!508367 () Bool)

(assert (=> b!527686 m!508367))

(declare-fun m!508369 () Bool)

(assert (=> b!527693 m!508369))

(assert (=> b!527693 m!508345))

(declare-fun m!508371 () Bool)

(assert (=> b!527693 m!508371))

(declare-fun m!508373 () Bool)

(assert (=> b!527693 m!508373))

(declare-fun m!508375 () Bool)

(assert (=> b!527693 m!508375))

(assert (=> b!527693 m!508345))

(declare-fun m!508377 () Bool)

(assert (=> b!527693 m!508377))

(assert (=> b!527693 m!508345))

(declare-fun m!508379 () Bool)

(assert (=> b!527693 m!508379))

(declare-fun m!508381 () Bool)

(assert (=> b!527693 m!508381))

(declare-fun m!508383 () Bool)

(assert (=> b!527693 m!508383))

(declare-fun m!508385 () Bool)

(assert (=> b!527694 m!508385))

(declare-fun m!508387 () Bool)

(assert (=> b!527694 m!508387))

(push 1)

(assert (not b!527687))

(assert (not b!527683))

(assert (not b!527693))

(assert (not b!527694))

(assert (not b!527692))

