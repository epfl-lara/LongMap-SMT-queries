; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45156 () Bool)

(assert start!45156)

(declare-fun b!495397 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32044 0))(
  ( (array!32045 (arr!15405 (Array (_ BitVec 32) (_ BitVec 64))) (size!15769 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32044)

(declare-fun e!290652 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3872 0))(
  ( (MissingZero!3872 (index!17667 (_ BitVec 32))) (Found!3872 (index!17668 (_ BitVec 32))) (Intermediate!3872 (undefined!4684 Bool) (index!17669 (_ BitVec 32)) (x!46740 (_ BitVec 32))) (Undefined!3872) (MissingVacant!3872 (index!17670 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32044 (_ BitVec 32)) SeekEntryResult!3872)

(assert (=> b!495397 (= e!290652 (= (seekEntryOrOpen!0 (select (arr!15405 a!3235) j!176) a!3235 mask!3524) (Found!3872 j!176)))))

(declare-fun b!495398 () Bool)

(declare-fun res!297789 () Bool)

(declare-fun e!290651 () Bool)

(assert (=> b!495398 (=> res!297789 e!290651)))

(declare-fun lt!224272 () SeekEntryResult!3872)

(assert (=> b!495398 (= res!297789 (or (undefined!4684 lt!224272) (not (is-Intermediate!3872 lt!224272))))))

(declare-fun res!297786 () Bool)

(declare-fun e!290650 () Bool)

(assert (=> start!45156 (=> (not res!297786) (not e!290650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45156 (= res!297786 (validMask!0 mask!3524))))

(assert (=> start!45156 e!290650))

(assert (=> start!45156 true))

(declare-fun array_inv!11201 (array!32044) Bool)

(assert (=> start!45156 (array_inv!11201 a!3235)))

(declare-fun b!495399 () Bool)

(declare-fun e!290649 () Bool)

(assert (=> b!495399 (= e!290650 e!290649)))

(declare-fun res!297790 () Bool)

(assert (=> b!495399 (=> (not res!297790) (not e!290649))))

(declare-fun lt!224271 () SeekEntryResult!3872)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!495399 (= res!297790 (or (= lt!224271 (MissingZero!3872 i!1204)) (= lt!224271 (MissingVacant!3872 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!495399 (= lt!224271 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!495400 () Bool)

(declare-fun res!297793 () Bool)

(assert (=> b!495400 (=> (not res!297793) (not e!290650))))

(declare-fun arrayContainsKey!0 (array!32044 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495400 (= res!297793 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495401 () Bool)

(declare-fun res!297784 () Bool)

(assert (=> b!495401 (=> (not res!297784) (not e!290650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495401 (= res!297784 (validKeyInArray!0 (select (arr!15405 a!3235) j!176)))))

(declare-fun b!495402 () Bool)

(declare-fun res!297788 () Bool)

(assert (=> b!495402 (=> (not res!297788) (not e!290650))))

(assert (=> b!495402 (= res!297788 (and (= (size!15769 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15769 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15769 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495403 () Bool)

(declare-fun res!297794 () Bool)

(assert (=> b!495403 (=> (not res!297794) (not e!290649))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32044 (_ BitVec 32)) Bool)

(assert (=> b!495403 (= res!297794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495404 () Bool)

(declare-fun res!297787 () Bool)

(assert (=> b!495404 (=> (not res!297787) (not e!290650))))

(assert (=> b!495404 (= res!297787 (validKeyInArray!0 k!2280))))

(declare-fun b!495405 () Bool)

(assert (=> b!495405 (= e!290649 (not e!290651))))

(declare-fun res!297791 () Bool)

(assert (=> b!495405 (=> res!297791 e!290651)))

(declare-fun lt!224270 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32044 (_ BitVec 32)) SeekEntryResult!3872)

(assert (=> b!495405 (= res!297791 (= lt!224272 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224270 (select (store (arr!15405 a!3235) i!1204 k!2280) j!176) (array!32045 (store (arr!15405 a!3235) i!1204 k!2280) (size!15769 a!3235)) mask!3524)))))

(declare-fun lt!224269 () (_ BitVec 32))

(assert (=> b!495405 (= lt!224272 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224269 (select (arr!15405 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495405 (= lt!224270 (toIndex!0 (select (store (arr!15405 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!495405 (= lt!224269 (toIndex!0 (select (arr!15405 a!3235) j!176) mask!3524))))

(assert (=> b!495405 e!290652))

(declare-fun res!297785 () Bool)

(assert (=> b!495405 (=> (not res!297785) (not e!290652))))

(assert (=> b!495405 (= res!297785 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14690 0))(
  ( (Unit!14691) )
))
(declare-fun lt!224268 () Unit!14690)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32044 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14690)

(assert (=> b!495405 (= lt!224268 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495406 () Bool)

(declare-fun res!297792 () Bool)

(assert (=> b!495406 (=> (not res!297792) (not e!290649))))

(declare-datatypes ((List!9563 0))(
  ( (Nil!9560) (Cons!9559 (h!10430 (_ BitVec 64)) (t!15791 List!9563)) )
))
(declare-fun arrayNoDuplicates!0 (array!32044 (_ BitVec 32) List!9563) Bool)

(assert (=> b!495406 (= res!297792 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9560))))

(declare-fun b!495407 () Bool)

(assert (=> b!495407 (= e!290651 true)))

(assert (=> b!495407 (and (bvslt (x!46740 lt!224272) #b01111111111111111111111111111110) (or (= (select (arr!15405 a!3235) (index!17669 lt!224272)) (select (arr!15405 a!3235) j!176)) (= (select (arr!15405 a!3235) (index!17669 lt!224272)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15405 a!3235) (index!17669 lt!224272)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45156 res!297786) b!495402))

(assert (= (and b!495402 res!297788) b!495401))

(assert (= (and b!495401 res!297784) b!495404))

(assert (= (and b!495404 res!297787) b!495400))

(assert (= (and b!495400 res!297793) b!495399))

(assert (= (and b!495399 res!297790) b!495403))

(assert (= (and b!495403 res!297794) b!495406))

(assert (= (and b!495406 res!297792) b!495405))

(assert (= (and b!495405 res!297785) b!495397))

(assert (= (and b!495405 (not res!297791)) b!495398))

(assert (= (and b!495398 (not res!297789)) b!495407))

(declare-fun m!476475 () Bool)

(assert (=> b!495404 m!476475))

(declare-fun m!476477 () Bool)

(assert (=> b!495400 m!476477))

(declare-fun m!476479 () Bool)

(assert (=> b!495406 m!476479))

(declare-fun m!476481 () Bool)

(assert (=> b!495401 m!476481))

(assert (=> b!495401 m!476481))

(declare-fun m!476483 () Bool)

(assert (=> b!495401 m!476483))

(declare-fun m!476485 () Bool)

(assert (=> start!45156 m!476485))

(declare-fun m!476487 () Bool)

(assert (=> start!45156 m!476487))

(declare-fun m!476489 () Bool)

(assert (=> b!495403 m!476489))

(assert (=> b!495397 m!476481))

(assert (=> b!495397 m!476481))

(declare-fun m!476491 () Bool)

(assert (=> b!495397 m!476491))

(declare-fun m!476493 () Bool)

(assert (=> b!495405 m!476493))

(declare-fun m!476495 () Bool)

(assert (=> b!495405 m!476495))

(declare-fun m!476497 () Bool)

(assert (=> b!495405 m!476497))

(assert (=> b!495405 m!476481))

(declare-fun m!476499 () Bool)

(assert (=> b!495405 m!476499))

(assert (=> b!495405 m!476481))

(assert (=> b!495405 m!476497))

(declare-fun m!476501 () Bool)

(assert (=> b!495405 m!476501))

(assert (=> b!495405 m!476481))

(declare-fun m!476503 () Bool)

(assert (=> b!495405 m!476503))

(declare-fun m!476505 () Bool)

(assert (=> b!495405 m!476505))

(assert (=> b!495405 m!476497))

(declare-fun m!476507 () Bool)

(assert (=> b!495405 m!476507))

(declare-fun m!476509 () Bool)

(assert (=> b!495407 m!476509))

(assert (=> b!495407 m!476481))

(declare-fun m!476511 () Bool)

(assert (=> b!495399 m!476511))

(push 1)

