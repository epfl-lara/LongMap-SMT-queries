; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45846 () Bool)

(assert start!45846)

(declare-fun b!507662 () Bool)

(declare-fun res!308762 () Bool)

(declare-fun e!297057 () Bool)

(assert (=> b!507662 (=> (not res!308762) (not e!297057))))

(declare-datatypes ((array!32612 0))(
  ( (array!32613 (arr!15686 (Array (_ BitVec 32) (_ BitVec 64))) (size!16051 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32612)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32612 (_ BitVec 32)) Bool)

(assert (=> b!507662 (= res!308762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507663 () Bool)

(declare-fun e!297056 () Bool)

(assert (=> b!507663 (= e!297056 e!297057)))

(declare-fun res!308764 () Bool)

(assert (=> b!507663 (=> (not res!308764) (not e!297057))))

(declare-datatypes ((SeekEntryResult!4150 0))(
  ( (MissingZero!4150 (index!18788 (_ BitVec 32))) (Found!4150 (index!18789 (_ BitVec 32))) (Intermediate!4150 (undefined!4962 Bool) (index!18790 (_ BitVec 32)) (x!47786 (_ BitVec 32))) (Undefined!4150) (MissingVacant!4150 (index!18791 (_ BitVec 32))) )
))
(declare-fun lt!231886 () SeekEntryResult!4150)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507663 (= res!308764 (or (= lt!231886 (MissingZero!4150 i!1204)) (= lt!231886 (MissingVacant!4150 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32612 (_ BitVec 32)) SeekEntryResult!4150)

(assert (=> b!507663 (= lt!231886 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!507664 () Bool)

(declare-fun res!308767 () Bool)

(assert (=> b!507664 (=> (not res!308767) (not e!297056))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507664 (= res!308767 (and (= (size!16051 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16051 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16051 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507665 () Bool)

(assert (=> b!507665 (= e!297057 false)))

(declare-fun lt!231885 () Bool)

(declare-datatypes ((List!9883 0))(
  ( (Nil!9880) (Cons!9879 (h!10756 (_ BitVec 64)) (t!16102 List!9883)) )
))
(declare-fun arrayNoDuplicates!0 (array!32612 (_ BitVec 32) List!9883) Bool)

(assert (=> b!507665 (= lt!231885 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9880))))

(declare-fun b!507666 () Bool)

(declare-fun res!308768 () Bool)

(assert (=> b!507666 (=> (not res!308768) (not e!297056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507666 (= res!308768 (validKeyInArray!0 (select (arr!15686 a!3235) j!176)))))

(declare-fun b!507667 () Bool)

(declare-fun res!308766 () Bool)

(assert (=> b!507667 (=> (not res!308766) (not e!297056))))

(declare-fun arrayContainsKey!0 (array!32612 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507667 (= res!308766 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507661 () Bool)

(declare-fun res!308765 () Bool)

(assert (=> b!507661 (=> (not res!308765) (not e!297056))))

(assert (=> b!507661 (= res!308765 (validKeyInArray!0 k0!2280))))

(declare-fun res!308763 () Bool)

(assert (=> start!45846 (=> (not res!308763) (not e!297056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45846 (= res!308763 (validMask!0 mask!3524))))

(assert (=> start!45846 e!297056))

(assert (=> start!45846 true))

(declare-fun array_inv!11569 (array!32612) Bool)

(assert (=> start!45846 (array_inv!11569 a!3235)))

(assert (= (and start!45846 res!308763) b!507664))

(assert (= (and b!507664 res!308767) b!507666))

(assert (= (and b!507666 res!308768) b!507661))

(assert (= (and b!507661 res!308765) b!507667))

(assert (= (and b!507667 res!308766) b!507663))

(assert (= (and b!507663 res!308764) b!507662))

(assert (= (and b!507662 res!308762) b!507665))

(declare-fun m!488035 () Bool)

(assert (=> b!507667 m!488035))

(declare-fun m!488037 () Bool)

(assert (=> b!507666 m!488037))

(assert (=> b!507666 m!488037))

(declare-fun m!488039 () Bool)

(assert (=> b!507666 m!488039))

(declare-fun m!488041 () Bool)

(assert (=> b!507663 m!488041))

(declare-fun m!488043 () Bool)

(assert (=> b!507665 m!488043))

(declare-fun m!488045 () Bool)

(assert (=> b!507662 m!488045))

(declare-fun m!488047 () Bool)

(assert (=> b!507661 m!488047))

(declare-fun m!488049 () Bool)

(assert (=> start!45846 m!488049))

(declare-fun m!488051 () Bool)

(assert (=> start!45846 m!488051))

(check-sat (not b!507663) (not b!507667) (not b!507662) (not b!507665) (not start!45846) (not b!507666) (not b!507661))
(check-sat)
