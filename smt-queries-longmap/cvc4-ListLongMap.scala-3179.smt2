; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44704 () Bool)

(assert start!44704)

(declare-fun b!490596 () Bool)

(declare-fun res!293532 () Bool)

(declare-fun e!288376 () Bool)

(assert (=> b!490596 (=> (not res!293532) (not e!288376))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490596 (= res!293532 (validKeyInArray!0 k!2280))))

(declare-fun b!490597 () Bool)

(declare-fun res!293533 () Bool)

(assert (=> b!490597 (=> (not res!293533) (not e!288376))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31763 0))(
  ( (array!31764 (arr!15269 (Array (_ BitVec 32) (_ BitVec 64))) (size!15633 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31763)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!490597 (= res!293533 (and (= (size!15633 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15633 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15633 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490598 () Bool)

(declare-fun res!293534 () Bool)

(declare-fun e!288375 () Bool)

(assert (=> b!490598 (=> (not res!293534) (not e!288375))))

(declare-datatypes ((List!9427 0))(
  ( (Nil!9424) (Cons!9423 (h!10285 (_ BitVec 64)) (t!15655 List!9427)) )
))
(declare-fun arrayNoDuplicates!0 (array!31763 (_ BitVec 32) List!9427) Bool)

(assert (=> b!490598 (= res!293534 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9424))))

(declare-fun res!293536 () Bool)

(assert (=> start!44704 (=> (not res!293536) (not e!288376))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44704 (= res!293536 (validMask!0 mask!3524))))

(assert (=> start!44704 e!288376))

(assert (=> start!44704 true))

(declare-fun array_inv!11065 (array!31763) Bool)

(assert (=> start!44704 (array_inv!11065 a!3235)))

(declare-fun b!490599 () Bool)

(declare-fun res!293539 () Bool)

(assert (=> b!490599 (=> (not res!293539) (not e!288375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31763 (_ BitVec 32)) Bool)

(assert (=> b!490599 (= res!293539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490600 () Bool)

(declare-fun res!293540 () Bool)

(assert (=> b!490600 (=> (not res!293540) (not e!288376))))

(assert (=> b!490600 (= res!293540 (validKeyInArray!0 (select (arr!15269 a!3235) j!176)))))

(declare-fun b!490601 () Bool)

(declare-fun res!293535 () Bool)

(assert (=> b!490601 (=> (not res!293535) (not e!288376))))

(declare-fun arrayContainsKey!0 (array!31763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490601 (= res!293535 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490602 () Bool)

(declare-fun e!288378 () Bool)

(assert (=> b!490602 (= e!288375 (not e!288378))))

(declare-fun res!293537 () Bool)

(assert (=> b!490602 (=> res!293537 e!288378)))

(declare-fun lt!221602 () array!31763)

(declare-fun lt!221598 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3736 0))(
  ( (MissingZero!3736 (index!17123 (_ BitVec 32))) (Found!3736 (index!17124 (_ BitVec 32))) (Intermediate!3736 (undefined!4548 Bool) (index!17125 (_ BitVec 32)) (x!46218 (_ BitVec 32))) (Undefined!3736) (MissingVacant!3736 (index!17126 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31763 (_ BitVec 32)) SeekEntryResult!3736)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490602 (= res!293537 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15269 a!3235) j!176) mask!3524) (select (arr!15269 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221598 mask!3524) lt!221598 lt!221602 mask!3524))))))

(assert (=> b!490602 (= lt!221598 (select (store (arr!15269 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!490602 (= lt!221602 (array!31764 (store (arr!15269 a!3235) i!1204 k!2280) (size!15633 a!3235)))))

(declare-fun lt!221601 () SeekEntryResult!3736)

(assert (=> b!490602 (= lt!221601 (Found!3736 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31763 (_ BitVec 32)) SeekEntryResult!3736)

(assert (=> b!490602 (= lt!221601 (seekEntryOrOpen!0 (select (arr!15269 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!490602 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14418 0))(
  ( (Unit!14419) )
))
(declare-fun lt!221597 () Unit!14418)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31763 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14418)

(assert (=> b!490602 (= lt!221597 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490603 () Bool)

(assert (=> b!490603 (= e!288376 e!288375)))

(declare-fun res!293538 () Bool)

(assert (=> b!490603 (=> (not res!293538) (not e!288375))))

(declare-fun lt!221600 () SeekEntryResult!3736)

(assert (=> b!490603 (= res!293538 (or (= lt!221600 (MissingZero!3736 i!1204)) (= lt!221600 (MissingVacant!3736 i!1204))))))

(assert (=> b!490603 (= lt!221600 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!490604 () Bool)

(assert (=> b!490604 (= e!288378 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!490604 (= lt!221601 (seekEntryOrOpen!0 lt!221598 lt!221602 mask!3524))))

(declare-fun lt!221599 () Unit!14418)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31763 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14418)

(assert (=> b!490604 (= lt!221599 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(assert (= (and start!44704 res!293536) b!490597))

(assert (= (and b!490597 res!293533) b!490600))

(assert (= (and b!490600 res!293540) b!490596))

(assert (= (and b!490596 res!293532) b!490601))

(assert (= (and b!490601 res!293535) b!490603))

(assert (= (and b!490603 res!293538) b!490599))

(assert (= (and b!490599 res!293539) b!490598))

(assert (= (and b!490598 res!293534) b!490602))

(assert (= (and b!490602 (not res!293537)) b!490604))

(declare-fun m!470777 () Bool)

(assert (=> b!490604 m!470777))

(declare-fun m!470779 () Bool)

(assert (=> b!490604 m!470779))

(declare-fun m!470781 () Bool)

(assert (=> b!490601 m!470781))

(declare-fun m!470783 () Bool)

(assert (=> start!44704 m!470783))

(declare-fun m!470785 () Bool)

(assert (=> start!44704 m!470785))

(declare-fun m!470787 () Bool)

(assert (=> b!490599 m!470787))

(declare-fun m!470789 () Bool)

(assert (=> b!490603 m!470789))

(declare-fun m!470791 () Bool)

(assert (=> b!490602 m!470791))

(declare-fun m!470793 () Bool)

(assert (=> b!490602 m!470793))

(declare-fun m!470795 () Bool)

(assert (=> b!490602 m!470795))

(declare-fun m!470797 () Bool)

(assert (=> b!490602 m!470797))

(declare-fun m!470799 () Bool)

(assert (=> b!490602 m!470799))

(declare-fun m!470801 () Bool)

(assert (=> b!490602 m!470801))

(assert (=> b!490602 m!470799))

(assert (=> b!490602 m!470797))

(assert (=> b!490602 m!470799))

(declare-fun m!470803 () Bool)

(assert (=> b!490602 m!470803))

(assert (=> b!490602 m!470799))

(declare-fun m!470805 () Bool)

(assert (=> b!490602 m!470805))

(declare-fun m!470807 () Bool)

(assert (=> b!490602 m!470807))

(declare-fun m!470809 () Bool)

(assert (=> b!490602 m!470809))

(assert (=> b!490602 m!470807))

(assert (=> b!490600 m!470799))

(assert (=> b!490600 m!470799))

(declare-fun m!470811 () Bool)

(assert (=> b!490600 m!470811))

(declare-fun m!470813 () Bool)

(assert (=> b!490598 m!470813))

(declare-fun m!470815 () Bool)

(assert (=> b!490596 m!470815))

(push 1)

(assert (not b!490602))

(assert (not b!490600))

(assert (not b!490596))

(assert (not b!490599))

(assert (not b!490598))

(assert (not b!490601))

(assert (not b!490603))

(assert (not start!44704))

(assert (not b!490604))

(check-sat)

(pop 1)

(push 1)

(check-sat)

