; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45948 () Bool)

(assert start!45948)

(declare-fun b!508596 () Bool)

(declare-fun res!309446 () Bool)

(declare-fun e!297548 () Bool)

(assert (=> b!508596 (=> (not res!309446) (not e!297548))))

(declare-datatypes ((array!32659 0))(
  ( (array!32660 (arr!15708 (Array (_ BitVec 32) (_ BitVec 64))) (size!16072 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32659)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32659 (_ BitVec 32)) Bool)

(assert (=> b!508596 (= res!309446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508597 () Bool)

(declare-fun res!309448 () Bool)

(declare-fun e!297549 () Bool)

(assert (=> b!508597 (=> (not res!309448) (not e!297549))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508597 (= res!309448 (validKeyInArray!0 k!2280))))

(declare-fun b!508598 () Bool)

(declare-fun e!297546 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4175 0))(
  ( (MissingZero!4175 (index!18888 (_ BitVec 32))) (Found!4175 (index!18889 (_ BitVec 32))) (Intermediate!4175 (undefined!4987 Bool) (index!18890 (_ BitVec 32)) (x!47872 (_ BitVec 32))) (Undefined!4175) (MissingVacant!4175 (index!18891 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32659 (_ BitVec 32)) SeekEntryResult!4175)

(assert (=> b!508598 (= e!297546 (= (seekEntryOrOpen!0 (select (arr!15708 a!3235) j!176) a!3235 mask!3524) (Found!4175 j!176)))))

(declare-fun b!508599 () Bool)

(declare-fun res!309449 () Bool)

(assert (=> b!508599 (=> (not res!309449) (not e!297548))))

(declare-datatypes ((List!9866 0))(
  ( (Nil!9863) (Cons!9862 (h!10739 (_ BitVec 64)) (t!16094 List!9866)) )
))
(declare-fun arrayNoDuplicates!0 (array!32659 (_ BitVec 32) List!9866) Bool)

(assert (=> b!508599 (= res!309449 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9863))))

(declare-fun b!508600 () Bool)

(declare-fun res!309443 () Bool)

(assert (=> b!508600 (=> (not res!309443) (not e!297549))))

(declare-fun arrayContainsKey!0 (array!32659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508600 (= res!309443 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508601 () Bool)

(declare-fun res!309442 () Bool)

(assert (=> b!508601 (=> (not res!309442) (not e!297549))))

(assert (=> b!508601 (= res!309442 (validKeyInArray!0 (select (arr!15708 a!3235) j!176)))))

(declare-fun b!508603 () Bool)

(assert (=> b!508603 (= e!297548 (not true))))

(assert (=> b!508603 e!297546))

(declare-fun res!309445 () Bool)

(assert (=> b!508603 (=> (not res!309445) (not e!297546))))

(assert (=> b!508603 (= res!309445 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15608 0))(
  ( (Unit!15609) )
))
(declare-fun lt!232309 () Unit!15608)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32659 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15608)

(assert (=> b!508603 (= lt!232309 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508604 () Bool)

(assert (=> b!508604 (= e!297549 e!297548)))

(declare-fun res!309441 () Bool)

(assert (=> b!508604 (=> (not res!309441) (not e!297548))))

(declare-fun lt!232308 () SeekEntryResult!4175)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508604 (= res!309441 (or (= lt!232308 (MissingZero!4175 i!1204)) (= lt!232308 (MissingVacant!4175 i!1204))))))

(assert (=> b!508604 (= lt!232308 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!309447 () Bool)

(assert (=> start!45948 (=> (not res!309447) (not e!297549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45948 (= res!309447 (validMask!0 mask!3524))))

(assert (=> start!45948 e!297549))

(assert (=> start!45948 true))

(declare-fun array_inv!11504 (array!32659) Bool)

(assert (=> start!45948 (array_inv!11504 a!3235)))

(declare-fun b!508602 () Bool)

(declare-fun res!309444 () Bool)

(assert (=> b!508602 (=> (not res!309444) (not e!297549))))

(assert (=> b!508602 (= res!309444 (and (= (size!16072 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16072 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16072 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45948 res!309447) b!508602))

(assert (= (and b!508602 res!309444) b!508601))

(assert (= (and b!508601 res!309442) b!508597))

(assert (= (and b!508597 res!309448) b!508600))

(assert (= (and b!508600 res!309443) b!508604))

(assert (= (and b!508604 res!309441) b!508596))

(assert (= (and b!508596 res!309446) b!508599))

(assert (= (and b!508599 res!309449) b!508603))

(assert (= (and b!508603 res!309445) b!508598))

(declare-fun m!489357 () Bool)

(assert (=> b!508598 m!489357))

(assert (=> b!508598 m!489357))

(declare-fun m!489359 () Bool)

(assert (=> b!508598 m!489359))

(declare-fun m!489361 () Bool)

(assert (=> start!45948 m!489361))

(declare-fun m!489363 () Bool)

(assert (=> start!45948 m!489363))

(declare-fun m!489365 () Bool)

(assert (=> b!508600 m!489365))

(declare-fun m!489367 () Bool)

(assert (=> b!508596 m!489367))

(assert (=> b!508601 m!489357))

(assert (=> b!508601 m!489357))

(declare-fun m!489369 () Bool)

(assert (=> b!508601 m!489369))

(declare-fun m!489371 () Bool)

(assert (=> b!508603 m!489371))

(declare-fun m!489373 () Bool)

(assert (=> b!508603 m!489373))

(declare-fun m!489375 () Bool)

(assert (=> b!508597 m!489375))

(declare-fun m!489377 () Bool)

(assert (=> b!508599 m!489377))

(declare-fun m!489379 () Bool)

(assert (=> b!508604 m!489379))

(push 1)

