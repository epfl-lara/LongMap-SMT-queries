; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45028 () Bool)

(assert start!45028)

(declare-fun b!494066 () Bool)

(declare-fun res!296642 () Bool)

(declare-fun e!290035 () Bool)

(assert (=> b!494066 (=> (not res!296642) (not e!290035))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31973 0))(
  ( (array!31974 (arr!15371 (Array (_ BitVec 32) (_ BitVec 64))) (size!15735 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31973)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!494066 (= res!296642 (and (= (size!15735 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15735 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15735 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494067 () Bool)

(declare-fun e!290037 () Bool)

(assert (=> b!494067 (= e!290035 e!290037)))

(declare-fun res!296636 () Bool)

(assert (=> b!494067 (=> (not res!296636) (not e!290037))))

(declare-datatypes ((SeekEntryResult!3838 0))(
  ( (MissingZero!3838 (index!17531 (_ BitVec 32))) (Found!3838 (index!17532 (_ BitVec 32))) (Intermediate!3838 (undefined!4650 Bool) (index!17533 (_ BitVec 32)) (x!46604 (_ BitVec 32))) (Undefined!3838) (MissingVacant!3838 (index!17534 (_ BitVec 32))) )
))
(declare-fun lt!223550 () SeekEntryResult!3838)

(assert (=> b!494067 (= res!296636 (or (= lt!223550 (MissingZero!3838 i!1204)) (= lt!223550 (MissingVacant!3838 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31973 (_ BitVec 32)) SeekEntryResult!3838)

(assert (=> b!494067 (= lt!223550 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!494068 () Bool)

(declare-fun res!296639 () Bool)

(declare-fun e!290034 () Bool)

(assert (=> b!494068 (=> res!296639 e!290034)))

(declare-fun lt!223547 () SeekEntryResult!3838)

(assert (=> b!494068 (= res!296639 (or (not (is-Intermediate!3838 lt!223547)) (not (undefined!4650 lt!223547))))))

(declare-fun b!494069 () Bool)

(declare-fun res!296645 () Bool)

(assert (=> b!494069 (=> (not res!296645) (not e!290035))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494069 (= res!296645 (validKeyInArray!0 (select (arr!15371 a!3235) j!176)))))

(declare-fun b!494070 () Bool)

(assert (=> b!494070 (= e!290037 (not e!290034))))

(declare-fun res!296640 () Bool)

(assert (=> b!494070 (=> res!296640 e!290034)))

(declare-fun lt!223548 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31973 (_ BitVec 32)) SeekEntryResult!3838)

(assert (=> b!494070 (= res!296640 (= lt!223547 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223548 (select (store (arr!15371 a!3235) i!1204 k!2280) j!176) (array!31974 (store (arr!15371 a!3235) i!1204 k!2280) (size!15735 a!3235)) mask!3524)))))

(declare-fun lt!223552 () (_ BitVec 32))

(assert (=> b!494070 (= lt!223547 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223552 (select (arr!15371 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494070 (= lt!223548 (toIndex!0 (select (store (arr!15371 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!494070 (= lt!223552 (toIndex!0 (select (arr!15371 a!3235) j!176) mask!3524))))

(declare-fun lt!223549 () SeekEntryResult!3838)

(assert (=> b!494070 (= lt!223549 (Found!3838 j!176))))

(assert (=> b!494070 (= lt!223549 (seekEntryOrOpen!0 (select (arr!15371 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31973 (_ BitVec 32)) Bool)

(assert (=> b!494070 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14622 0))(
  ( (Unit!14623) )
))
(declare-fun lt!223551 () Unit!14622)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31973 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14622)

(assert (=> b!494070 (= lt!223551 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494071 () Bool)

(declare-fun res!296641 () Bool)

(assert (=> b!494071 (=> (not res!296641) (not e!290035))))

(declare-fun arrayContainsKey!0 (array!31973 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494071 (= res!296641 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494072 () Bool)

(declare-fun res!296644 () Bool)

(assert (=> b!494072 (=> (not res!296644) (not e!290037))))

(assert (=> b!494072 (= res!296644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494074 () Bool)

(declare-fun res!296638 () Bool)

(assert (=> b!494074 (=> (not res!296638) (not e!290035))))

(assert (=> b!494074 (= res!296638 (validKeyInArray!0 k!2280))))

(declare-fun b!494075 () Bool)

(declare-fun res!296637 () Bool)

(assert (=> b!494075 (=> (not res!296637) (not e!290037))))

(declare-datatypes ((List!9529 0))(
  ( (Nil!9526) (Cons!9525 (h!10393 (_ BitVec 64)) (t!15757 List!9529)) )
))
(declare-fun arrayNoDuplicates!0 (array!31973 (_ BitVec 32) List!9529) Bool)

(assert (=> b!494075 (= res!296637 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9526))))

(declare-fun b!494073 () Bool)

(assert (=> b!494073 (= e!290034 true)))

(assert (=> b!494073 (= lt!223549 Undefined!3838)))

(declare-fun res!296643 () Bool)

(assert (=> start!45028 (=> (not res!296643) (not e!290035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45028 (= res!296643 (validMask!0 mask!3524))))

(assert (=> start!45028 e!290035))

(assert (=> start!45028 true))

(declare-fun array_inv!11167 (array!31973) Bool)

(assert (=> start!45028 (array_inv!11167 a!3235)))

(assert (= (and start!45028 res!296643) b!494066))

(assert (= (and b!494066 res!296642) b!494069))

(assert (= (and b!494069 res!296645) b!494074))

(assert (= (and b!494074 res!296638) b!494071))

(assert (= (and b!494071 res!296641) b!494067))

(assert (= (and b!494067 res!296636) b!494072))

(assert (= (and b!494072 res!296644) b!494075))

(assert (= (and b!494075 res!296637) b!494070))

(assert (= (and b!494070 (not res!296640)) b!494068))

(assert (= (and b!494068 (not res!296639)) b!494073))

(declare-fun m!475035 () Bool)

(assert (=> b!494067 m!475035))

(declare-fun m!475037 () Bool)

(assert (=> b!494072 m!475037))

(declare-fun m!475039 () Bool)

(assert (=> b!494074 m!475039))

(declare-fun m!475041 () Bool)

(assert (=> b!494075 m!475041))

(declare-fun m!475043 () Bool)

(assert (=> start!45028 m!475043))

(declare-fun m!475045 () Bool)

(assert (=> start!45028 m!475045))

(declare-fun m!475047 () Bool)

(assert (=> b!494071 m!475047))

(declare-fun m!475049 () Bool)

(assert (=> b!494070 m!475049))

(declare-fun m!475051 () Bool)

(assert (=> b!494070 m!475051))

(declare-fun m!475053 () Bool)

(assert (=> b!494070 m!475053))

(assert (=> b!494070 m!475053))

(declare-fun m!475055 () Bool)

(assert (=> b!494070 m!475055))

(declare-fun m!475057 () Bool)

(assert (=> b!494070 m!475057))

(declare-fun m!475059 () Bool)

(assert (=> b!494070 m!475059))

(assert (=> b!494070 m!475057))

(declare-fun m!475061 () Bool)

(assert (=> b!494070 m!475061))

(assert (=> b!494070 m!475057))

(declare-fun m!475063 () Bool)

(assert (=> b!494070 m!475063))

(assert (=> b!494070 m!475053))

(declare-fun m!475065 () Bool)

(assert (=> b!494070 m!475065))

(assert (=> b!494070 m!475057))

(declare-fun m!475067 () Bool)

(assert (=> b!494070 m!475067))

(assert (=> b!494069 m!475057))

(assert (=> b!494069 m!475057))

(declare-fun m!475069 () Bool)

(assert (=> b!494069 m!475069))

(push 1)

(assert (not start!45028))

(assert (not b!494070))

(assert (not b!494075))

