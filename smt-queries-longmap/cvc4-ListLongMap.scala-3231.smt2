; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45196 () Bool)

(assert start!45196)

(declare-fun b!496057 () Bool)

(declare-fun e!290952 () Bool)

(declare-fun e!290949 () Bool)

(assert (=> b!496057 (= e!290952 e!290949)))

(declare-fun res!298449 () Bool)

(assert (=> b!496057 (=> (not res!298449) (not e!290949))))

(declare-datatypes ((SeekEntryResult!3892 0))(
  ( (MissingZero!3892 (index!17747 (_ BitVec 32))) (Found!3892 (index!17748 (_ BitVec 32))) (Intermediate!3892 (undefined!4704 Bool) (index!17749 (_ BitVec 32)) (x!46808 (_ BitVec 32))) (Undefined!3892) (MissingVacant!3892 (index!17750 (_ BitVec 32))) )
))
(declare-fun lt!224569 () SeekEntryResult!3892)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!496057 (= res!298449 (or (= lt!224569 (MissingZero!3892 i!1204)) (= lt!224569 (MissingVacant!3892 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-datatypes ((array!32084 0))(
  ( (array!32085 (arr!15425 (Array (_ BitVec 32) (_ BitVec 64))) (size!15789 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32084)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32084 (_ BitVec 32)) SeekEntryResult!3892)

(assert (=> b!496057 (= lt!224569 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!496058 () Bool)

(declare-fun res!298444 () Bool)

(assert (=> b!496058 (=> (not res!298444) (not e!290952))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!496058 (= res!298444 (and (= (size!15789 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15789 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15789 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496059 () Bool)

(declare-fun e!290948 () Bool)

(assert (=> b!496059 (= e!290949 (not e!290948))))

(declare-fun res!298447 () Bool)

(assert (=> b!496059 (=> res!298447 e!290948)))

(declare-fun lt!224570 () SeekEntryResult!3892)

(declare-fun lt!224571 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32084 (_ BitVec 32)) SeekEntryResult!3892)

(assert (=> b!496059 (= res!298447 (= lt!224570 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224571 (select (store (arr!15425 a!3235) i!1204 k!2280) j!176) (array!32085 (store (arr!15425 a!3235) i!1204 k!2280) (size!15789 a!3235)) mask!3524)))))

(declare-fun lt!224568 () (_ BitVec 32))

(assert (=> b!496059 (= lt!224570 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224568 (select (arr!15425 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496059 (= lt!224571 (toIndex!0 (select (store (arr!15425 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!496059 (= lt!224568 (toIndex!0 (select (arr!15425 a!3235) j!176) mask!3524))))

(declare-fun e!290950 () Bool)

(assert (=> b!496059 e!290950))

(declare-fun res!298448 () Bool)

(assert (=> b!496059 (=> (not res!298448) (not e!290950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32084 (_ BitVec 32)) Bool)

(assert (=> b!496059 (= res!298448 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14730 0))(
  ( (Unit!14731) )
))
(declare-fun lt!224572 () Unit!14730)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32084 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14730)

(assert (=> b!496059 (= lt!224572 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496060 () Bool)

(declare-fun res!298451 () Bool)

(assert (=> b!496060 (=> (not res!298451) (not e!290952))))

(declare-fun arrayContainsKey!0 (array!32084 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496060 (= res!298451 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!298446 () Bool)

(assert (=> start!45196 (=> (not res!298446) (not e!290952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45196 (= res!298446 (validMask!0 mask!3524))))

(assert (=> start!45196 e!290952))

(assert (=> start!45196 true))

(declare-fun array_inv!11221 (array!32084) Bool)

(assert (=> start!45196 (array_inv!11221 a!3235)))

(declare-fun b!496061 () Bool)

(declare-fun res!298453 () Bool)

(assert (=> b!496061 (=> (not res!298453) (not e!290952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496061 (= res!298453 (validKeyInArray!0 (select (arr!15425 a!3235) j!176)))))

(declare-fun b!496062 () Bool)

(assert (=> b!496062 (= e!290950 (= (seekEntryOrOpen!0 (select (arr!15425 a!3235) j!176) a!3235 mask!3524) (Found!3892 j!176)))))

(declare-fun b!496063 () Bool)

(declare-fun res!298454 () Bool)

(assert (=> b!496063 (=> (not res!298454) (not e!290949))))

(assert (=> b!496063 (= res!298454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496064 () Bool)

(assert (=> b!496064 (= e!290948 true)))

(assert (=> b!496064 (and (bvslt (x!46808 lt!224570) #b01111111111111111111111111111110) (or (= (select (arr!15425 a!3235) (index!17749 lt!224570)) (select (arr!15425 a!3235) j!176)) (= (select (arr!15425 a!3235) (index!17749 lt!224570)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15425 a!3235) (index!17749 lt!224570)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496065 () Bool)

(declare-fun res!298452 () Bool)

(assert (=> b!496065 (=> (not res!298452) (not e!290952))))

(assert (=> b!496065 (= res!298452 (validKeyInArray!0 k!2280))))

(declare-fun b!496066 () Bool)

(declare-fun res!298450 () Bool)

(assert (=> b!496066 (=> res!298450 e!290948)))

(assert (=> b!496066 (= res!298450 (or (undefined!4704 lt!224570) (not (is-Intermediate!3892 lt!224570))))))

(declare-fun b!496067 () Bool)

(declare-fun res!298445 () Bool)

(assert (=> b!496067 (=> (not res!298445) (not e!290949))))

(declare-datatypes ((List!9583 0))(
  ( (Nil!9580) (Cons!9579 (h!10450 (_ BitVec 64)) (t!15811 List!9583)) )
))
(declare-fun arrayNoDuplicates!0 (array!32084 (_ BitVec 32) List!9583) Bool)

(assert (=> b!496067 (= res!298445 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9580))))

(assert (= (and start!45196 res!298446) b!496058))

(assert (= (and b!496058 res!298444) b!496061))

(assert (= (and b!496061 res!298453) b!496065))

(assert (= (and b!496065 res!298452) b!496060))

(assert (= (and b!496060 res!298451) b!496057))

(assert (= (and b!496057 res!298449) b!496063))

(assert (= (and b!496063 res!298454) b!496067))

(assert (= (and b!496067 res!298445) b!496059))

(assert (= (and b!496059 res!298448) b!496062))

(assert (= (and b!496059 (not res!298447)) b!496066))

(assert (= (and b!496066 (not res!298450)) b!496064))

(declare-fun m!477235 () Bool)

(assert (=> b!496064 m!477235))

(declare-fun m!477237 () Bool)

(assert (=> b!496064 m!477237))

(declare-fun m!477239 () Bool)

(assert (=> b!496067 m!477239))

(assert (=> b!496062 m!477237))

(assert (=> b!496062 m!477237))

(declare-fun m!477241 () Bool)

(assert (=> b!496062 m!477241))

(assert (=> b!496059 m!477237))

(declare-fun m!477243 () Bool)

(assert (=> b!496059 m!477243))

(declare-fun m!477245 () Bool)

(assert (=> b!496059 m!477245))

(declare-fun m!477247 () Bool)

(assert (=> b!496059 m!477247))

(declare-fun m!477249 () Bool)

(assert (=> b!496059 m!477249))

(assert (=> b!496059 m!477249))

(declare-fun m!477251 () Bool)

(assert (=> b!496059 m!477251))

(assert (=> b!496059 m!477237))

(declare-fun m!477253 () Bool)

(assert (=> b!496059 m!477253))

(assert (=> b!496059 m!477237))

(declare-fun m!477255 () Bool)

(assert (=> b!496059 m!477255))

(assert (=> b!496059 m!477249))

(declare-fun m!477257 () Bool)

(assert (=> b!496059 m!477257))

(declare-fun m!477259 () Bool)

(assert (=> b!496065 m!477259))

(assert (=> b!496061 m!477237))

(assert (=> b!496061 m!477237))

(declare-fun m!477261 () Bool)

(assert (=> b!496061 m!477261))

(declare-fun m!477263 () Bool)

(assert (=> start!45196 m!477263))

(declare-fun m!477265 () Bool)

(assert (=> start!45196 m!477265))

(declare-fun m!477267 () Bool)

(assert (=> b!496063 m!477267))

(declare-fun m!477269 () Bool)

(assert (=> b!496057 m!477269))

(declare-fun m!477271 () Bool)

(assert (=> b!496060 m!477271))

(push 1)

