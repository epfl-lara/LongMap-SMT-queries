; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46120 () Bool)

(assert start!46120)

(declare-fun b!510918 () Bool)

(declare-fun res!311771 () Bool)

(declare-fun e!298579 () Bool)

(assert (=> b!510918 (=> (not res!311771) (not e!298579))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510918 (= res!311771 (validKeyInArray!0 k!2280))))

(declare-fun b!510919 () Bool)

(declare-fun res!311769 () Bool)

(declare-fun e!298578 () Bool)

(assert (=> b!510919 (=> (not res!311769) (not e!298578))))

(declare-datatypes ((array!32831 0))(
  ( (array!32832 (arr!15794 (Array (_ BitVec 32) (_ BitVec 64))) (size!16158 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32831)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32831 (_ BitVec 32)) Bool)

(assert (=> b!510919 (= res!311769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!510920 () Bool)

(declare-fun e!298581 () Bool)

(declare-datatypes ((SeekEntryResult!4261 0))(
  ( (MissingZero!4261 (index!19232 (_ BitVec 32))) (Found!4261 (index!19233 (_ BitVec 32))) (Intermediate!4261 (undefined!5073 Bool) (index!19234 (_ BitVec 32)) (x!48182 (_ BitVec 32))) (Undefined!4261) (MissingVacant!4261 (index!19235 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32831 (_ BitVec 32)) SeekEntryResult!4261)

(assert (=> b!510920 (= e!298581 (= (seekEntryOrOpen!0 (select (arr!15794 a!3235) j!176) a!3235 mask!3524) (Found!4261 j!176)))))

(declare-fun res!311770 () Bool)

(assert (=> start!46120 (=> (not res!311770) (not e!298579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46120 (= res!311770 (validMask!0 mask!3524))))

(assert (=> start!46120 e!298579))

(assert (=> start!46120 true))

(declare-fun array_inv!11590 (array!32831) Bool)

(assert (=> start!46120 (array_inv!11590 a!3235)))

(declare-fun b!510921 () Bool)

(declare-fun res!311767 () Bool)

(assert (=> b!510921 (=> (not res!311767) (not e!298578))))

(declare-datatypes ((List!9952 0))(
  ( (Nil!9949) (Cons!9948 (h!10825 (_ BitVec 64)) (t!16180 List!9952)) )
))
(declare-fun arrayNoDuplicates!0 (array!32831 (_ BitVec 32) List!9952) Bool)

(assert (=> b!510921 (= res!311767 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9949))))

(declare-fun b!510922 () Bool)

(declare-fun res!311764 () Bool)

(assert (=> b!510922 (=> (not res!311764) (not e!298579))))

(assert (=> b!510922 (= res!311764 (validKeyInArray!0 (select (arr!15794 a!3235) j!176)))))

(declare-fun b!510923 () Bool)

(declare-fun res!311768 () Bool)

(assert (=> b!510923 (=> (not res!311768) (not e!298579))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510923 (= res!311768 (and (= (size!16158 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16158 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16158 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510924 () Bool)

(assert (=> b!510924 (= e!298578 (not true))))

(declare-fun lt!233702 () (_ BitVec 32))

(declare-fun lt!233704 () SeekEntryResult!4261)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32831 (_ BitVec 32)) SeekEntryResult!4261)

(assert (=> b!510924 (= lt!233704 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233702 (select (store (arr!15794 a!3235) i!1204 k!2280) j!176) (array!32832 (store (arr!15794 a!3235) i!1204 k!2280) (size!16158 a!3235)) mask!3524))))

(declare-fun lt!233705 () (_ BitVec 32))

(declare-fun lt!233703 () SeekEntryResult!4261)

(assert (=> b!510924 (= lt!233703 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233705 (select (arr!15794 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510924 (= lt!233702 (toIndex!0 (select (store (arr!15794 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!510924 (= lt!233705 (toIndex!0 (select (arr!15794 a!3235) j!176) mask!3524))))

(assert (=> b!510924 e!298581))

(declare-fun res!311763 () Bool)

(assert (=> b!510924 (=> (not res!311763) (not e!298581))))

(assert (=> b!510924 (= res!311763 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15780 0))(
  ( (Unit!15781) )
))
(declare-fun lt!233707 () Unit!15780)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32831 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15780)

(assert (=> b!510924 (= lt!233707 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510925 () Bool)

(assert (=> b!510925 (= e!298579 e!298578)))

(declare-fun res!311765 () Bool)

(assert (=> b!510925 (=> (not res!311765) (not e!298578))))

(declare-fun lt!233706 () SeekEntryResult!4261)

(assert (=> b!510925 (= res!311765 (or (= lt!233706 (MissingZero!4261 i!1204)) (= lt!233706 (MissingVacant!4261 i!1204))))))

(assert (=> b!510925 (= lt!233706 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!510926 () Bool)

(declare-fun res!311766 () Bool)

(assert (=> b!510926 (=> (not res!311766) (not e!298579))))

(declare-fun arrayContainsKey!0 (array!32831 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510926 (= res!311766 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!46120 res!311770) b!510923))

(assert (= (and b!510923 res!311768) b!510922))

(assert (= (and b!510922 res!311764) b!510918))

(assert (= (and b!510918 res!311771) b!510926))

(assert (= (and b!510926 res!311766) b!510925))

(assert (= (and b!510925 res!311765) b!510919))

(assert (= (and b!510919 res!311769) b!510921))

(assert (= (and b!510921 res!311767) b!510924))

(assert (= (and b!510924 res!311763) b!510920))

(declare-fun m!492393 () Bool)

(assert (=> b!510924 m!492393))

(declare-fun m!492395 () Bool)

(assert (=> b!510924 m!492395))

(declare-fun m!492397 () Bool)

(assert (=> b!510924 m!492397))

(declare-fun m!492399 () Bool)

(assert (=> b!510924 m!492399))

(declare-fun m!492401 () Bool)

(assert (=> b!510924 m!492401))

(assert (=> b!510924 m!492399))

(declare-fun m!492403 () Bool)

(assert (=> b!510924 m!492403))

(assert (=> b!510924 m!492399))

(declare-fun m!492405 () Bool)

(assert (=> b!510924 m!492405))

(assert (=> b!510924 m!492397))

(declare-fun m!492407 () Bool)

(assert (=> b!510924 m!492407))

(assert (=> b!510924 m!492397))

(declare-fun m!492409 () Bool)

(assert (=> b!510924 m!492409))

(assert (=> b!510920 m!492399))

(assert (=> b!510920 m!492399))

(declare-fun m!492411 () Bool)

(assert (=> b!510920 m!492411))

(declare-fun m!492413 () Bool)

(assert (=> b!510919 m!492413))

(declare-fun m!492415 () Bool)

(assert (=> start!46120 m!492415))

(declare-fun m!492417 () Bool)

(assert (=> start!46120 m!492417))

(declare-fun m!492419 () Bool)

(assert (=> b!510925 m!492419))

(declare-fun m!492421 () Bool)

(assert (=> b!510926 m!492421))

(declare-fun m!492423 () Bool)

(assert (=> b!510918 m!492423))

(assert (=> b!510922 m!492399))

(assert (=> b!510922 m!492399))

(declare-fun m!492425 () Bool)

(assert (=> b!510922 m!492425))

(declare-fun m!492427 () Bool)

(assert (=> b!510921 m!492427))

(push 1)

