; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45838 () Bool)

(assert start!45838)

(declare-fun b!507610 () Bool)

(declare-fun res!308576 () Bool)

(declare-fun e!297060 () Bool)

(assert (=> b!507610 (=> (not res!308576) (not e!297060))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507610 (= res!308576 (validKeyInArray!0 k!2280))))

(declare-fun b!507611 () Bool)

(declare-fun e!297055 () Bool)

(assert (=> b!507611 (= e!297055 true)))

(declare-datatypes ((array!32594 0))(
  ( (array!32595 (arr!15677 (Array (_ BitVec 32) (_ BitVec 64))) (size!16041 (_ BitVec 32))) )
))
(declare-fun lt!231867 () array!32594)

(declare-fun lt!231871 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4144 0))(
  ( (MissingZero!4144 (index!18764 (_ BitVec 32))) (Found!4144 (index!18765 (_ BitVec 32))) (Intermediate!4144 (undefined!4956 Bool) (index!18766 (_ BitVec 32)) (x!47753 (_ BitVec 32))) (Undefined!4144) (MissingVacant!4144 (index!18767 (_ BitVec 32))) )
))
(declare-fun lt!231868 () SeekEntryResult!4144)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32594 (_ BitVec 32)) SeekEntryResult!4144)

(assert (=> b!507611 (= lt!231868 (seekEntryOrOpen!0 lt!231871 lt!231867 mask!3524))))

(assert (=> b!507611 false))

(declare-fun b!507612 () Bool)

(declare-fun res!308573 () Bool)

(assert (=> b!507612 (=> (not res!308573) (not e!297060))))

(declare-fun a!3235 () array!32594)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507612 (= res!308573 (validKeyInArray!0 (select (arr!15677 a!3235) j!176)))))

(declare-fun b!507613 () Bool)

(declare-fun e!297057 () Bool)

(declare-fun e!297059 () Bool)

(assert (=> b!507613 (= e!297057 (not e!297059))))

(declare-fun res!308570 () Bool)

(assert (=> b!507613 (=> res!308570 e!297059)))

(declare-fun lt!231866 () (_ BitVec 32))

(declare-fun lt!231869 () SeekEntryResult!4144)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32594 (_ BitVec 32)) SeekEntryResult!4144)

(assert (=> b!507613 (= res!308570 (= lt!231869 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231866 lt!231871 lt!231867 mask!3524)))))

(declare-fun lt!231870 () (_ BitVec 32))

(assert (=> b!507613 (= lt!231869 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231870 (select (arr!15677 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507613 (= lt!231866 (toIndex!0 lt!231871 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507613 (= lt!231871 (select (store (arr!15677 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!507613 (= lt!231870 (toIndex!0 (select (arr!15677 a!3235) j!176) mask!3524))))

(assert (=> b!507613 (= lt!231867 (array!32595 (store (arr!15677 a!3235) i!1204 k!2280) (size!16041 a!3235)))))

(declare-fun e!297056 () Bool)

(assert (=> b!507613 e!297056))

(declare-fun res!308574 () Bool)

(assert (=> b!507613 (=> (not res!308574) (not e!297056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32594 (_ BitVec 32)) Bool)

(assert (=> b!507613 (= res!308574 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15576 0))(
  ( (Unit!15577) )
))
(declare-fun lt!231863 () Unit!15576)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32594 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15576)

(assert (=> b!507613 (= lt!231863 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507614 () Bool)

(declare-fun res!308577 () Bool)

(assert (=> b!507614 (=> (not res!308577) (not e!297060))))

(declare-fun arrayContainsKey!0 (array!32594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507614 (= res!308577 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!308569 () Bool)

(assert (=> start!45838 (=> (not res!308569) (not e!297060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45838 (= res!308569 (validMask!0 mask!3524))))

(assert (=> start!45838 e!297060))

(assert (=> start!45838 true))

(declare-fun array_inv!11473 (array!32594) Bool)

(assert (=> start!45838 (array_inv!11473 a!3235)))

(declare-fun b!507615 () Bool)

(assert (=> b!507615 (= e!297060 e!297057)))

(declare-fun res!308571 () Bool)

(assert (=> b!507615 (=> (not res!308571) (not e!297057))))

(declare-fun lt!231864 () SeekEntryResult!4144)

(assert (=> b!507615 (= res!308571 (or (= lt!231864 (MissingZero!4144 i!1204)) (= lt!231864 (MissingVacant!4144 i!1204))))))

(assert (=> b!507615 (= lt!231864 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!507616 () Bool)

(assert (=> b!507616 (= e!297059 e!297055)))

(declare-fun res!308572 () Bool)

(assert (=> b!507616 (=> res!308572 e!297055)))

(declare-fun lt!231865 () Bool)

(assert (=> b!507616 (= res!308572 (or (and (not lt!231865) (undefined!4956 lt!231869)) (and (not lt!231865) (not (undefined!4956 lt!231869)))))))

(assert (=> b!507616 (= lt!231865 (not (is-Intermediate!4144 lt!231869)))))

(declare-fun b!507617 () Bool)

(assert (=> b!507617 (= e!297056 (= (seekEntryOrOpen!0 (select (arr!15677 a!3235) j!176) a!3235 mask!3524) (Found!4144 j!176)))))

(declare-fun b!507618 () Bool)

(declare-fun res!308579 () Bool)

(assert (=> b!507618 (=> (not res!308579) (not e!297057))))

(assert (=> b!507618 (= res!308579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507619 () Bool)

(declare-fun res!308578 () Bool)

(assert (=> b!507619 (=> (not res!308578) (not e!297057))))

(declare-datatypes ((List!9835 0))(
  ( (Nil!9832) (Cons!9831 (h!10708 (_ BitVec 64)) (t!16063 List!9835)) )
))
(declare-fun arrayNoDuplicates!0 (array!32594 (_ BitVec 32) List!9835) Bool)

(assert (=> b!507619 (= res!308578 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9832))))

(declare-fun b!507620 () Bool)

(declare-fun res!308575 () Bool)

(assert (=> b!507620 (=> (not res!308575) (not e!297060))))

(assert (=> b!507620 (= res!308575 (and (= (size!16041 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16041 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16041 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45838 res!308569) b!507620))

(assert (= (and b!507620 res!308575) b!507612))

(assert (= (and b!507612 res!308573) b!507610))

(assert (= (and b!507610 res!308576) b!507614))

(assert (= (and b!507614 res!308577) b!507615))

(assert (= (and b!507615 res!308571) b!507618))

(assert (= (and b!507618 res!308579) b!507619))

(assert (= (and b!507619 res!308578) b!507613))

(assert (= (and b!507613 res!308574) b!507617))

(assert (= (and b!507613 (not res!308570)) b!507616))

(assert (= (and b!507616 (not res!308572)) b!507611))

(declare-fun m!488407 () Bool)

(assert (=> b!507612 m!488407))

(assert (=> b!507612 m!488407))

(declare-fun m!488409 () Bool)

(assert (=> b!507612 m!488409))

(assert (=> b!507617 m!488407))

(assert (=> b!507617 m!488407))

(declare-fun m!488411 () Bool)

(assert (=> b!507617 m!488411))

(declare-fun m!488413 () Bool)

(assert (=> b!507610 m!488413))

(declare-fun m!488415 () Bool)

(assert (=> b!507613 m!488415))

(declare-fun m!488417 () Bool)

(assert (=> b!507613 m!488417))

(declare-fun m!488419 () Bool)

(assert (=> b!507613 m!488419))

(declare-fun m!488421 () Bool)

(assert (=> b!507613 m!488421))

(declare-fun m!488423 () Bool)

(assert (=> b!507613 m!488423))

(assert (=> b!507613 m!488407))

(declare-fun m!488425 () Bool)

(assert (=> b!507613 m!488425))

(assert (=> b!507613 m!488407))

(declare-fun m!488427 () Bool)

(assert (=> b!507613 m!488427))

(assert (=> b!507613 m!488407))

(declare-fun m!488429 () Bool)

(assert (=> b!507613 m!488429))

(declare-fun m!488431 () Bool)

(assert (=> b!507615 m!488431))

(declare-fun m!488433 () Bool)

(assert (=> start!45838 m!488433))

(declare-fun m!488435 () Bool)

(assert (=> start!45838 m!488435))

(declare-fun m!488437 () Bool)

(assert (=> b!507618 m!488437))

(declare-fun m!488439 () Bool)

(assert (=> b!507611 m!488439))

(declare-fun m!488441 () Bool)

(assert (=> b!507619 m!488441))

(declare-fun m!488443 () Bool)

(assert (=> b!507614 m!488443))

(push 1)

