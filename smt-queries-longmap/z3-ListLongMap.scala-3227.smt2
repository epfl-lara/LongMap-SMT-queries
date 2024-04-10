; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45170 () Bool)

(assert start!45170)

(declare-fun b!495628 () Bool)

(declare-fun e!290756 () Bool)

(declare-fun e!290754 () Bool)

(assert (=> b!495628 (= e!290756 (not e!290754))))

(declare-fun res!298025 () Bool)

(assert (=> b!495628 (=> res!298025 e!290754)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3879 0))(
  ( (MissingZero!3879 (index!17695 (_ BitVec 32))) (Found!3879 (index!17696 (_ BitVec 32))) (Intermediate!3879 (undefined!4691 Bool) (index!17697 (_ BitVec 32)) (x!46763 (_ BitVec 32))) (Undefined!3879) (MissingVacant!3879 (index!17698 (_ BitVec 32))) )
))
(declare-fun lt!224376 () SeekEntryResult!3879)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!224375 () (_ BitVec 32))

(declare-datatypes ((array!32058 0))(
  ( (array!32059 (arr!15412 (Array (_ BitVec 32) (_ BitVec 64))) (size!15776 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32058)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32058 (_ BitVec 32)) SeekEntryResult!3879)

(assert (=> b!495628 (= res!298025 (= lt!224376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224375 (select (store (arr!15412 a!3235) i!1204 k0!2280) j!176) (array!32059 (store (arr!15412 a!3235) i!1204 k0!2280) (size!15776 a!3235)) mask!3524)))))

(declare-fun lt!224373 () (_ BitVec 32))

(assert (=> b!495628 (= lt!224376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224373 (select (arr!15412 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495628 (= lt!224375 (toIndex!0 (select (store (arr!15412 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!495628 (= lt!224373 (toIndex!0 (select (arr!15412 a!3235) j!176) mask!3524))))

(declare-fun e!290753 () Bool)

(assert (=> b!495628 e!290753))

(declare-fun res!298024 () Bool)

(assert (=> b!495628 (=> (not res!298024) (not e!290753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32058 (_ BitVec 32)) Bool)

(assert (=> b!495628 (= res!298024 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14704 0))(
  ( (Unit!14705) )
))
(declare-fun lt!224377 () Unit!14704)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32058 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14704)

(assert (=> b!495628 (= lt!224377 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495629 () Bool)

(declare-fun res!298016 () Bool)

(assert (=> b!495629 (=> res!298016 e!290754)))

(get-info :version)

(assert (=> b!495629 (= res!298016 (or (undefined!4691 lt!224376) (not ((_ is Intermediate!3879) lt!224376))))))

(declare-fun b!495630 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32058 (_ BitVec 32)) SeekEntryResult!3879)

(assert (=> b!495630 (= e!290753 (= (seekEntryOrOpen!0 (select (arr!15412 a!3235) j!176) a!3235 mask!3524) (Found!3879 j!176)))))

(declare-fun b!495631 () Bool)

(declare-fun res!298018 () Bool)

(assert (=> b!495631 (=> (not res!298018) (not e!290756))))

(declare-datatypes ((List!9570 0))(
  ( (Nil!9567) (Cons!9566 (h!10437 (_ BitVec 64)) (t!15798 List!9570)) )
))
(declare-fun arrayNoDuplicates!0 (array!32058 (_ BitVec 32) List!9570) Bool)

(assert (=> b!495631 (= res!298018 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9567))))

(declare-fun b!495632 () Bool)

(declare-fun res!298015 () Bool)

(declare-fun e!290757 () Bool)

(assert (=> b!495632 (=> (not res!298015) (not e!290757))))

(declare-fun arrayContainsKey!0 (array!32058 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495632 (= res!298015 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495633 () Bool)

(assert (=> b!495633 (= e!290757 e!290756)))

(declare-fun res!298023 () Bool)

(assert (=> b!495633 (=> (not res!298023) (not e!290756))))

(declare-fun lt!224374 () SeekEntryResult!3879)

(assert (=> b!495633 (= res!298023 (or (= lt!224374 (MissingZero!3879 i!1204)) (= lt!224374 (MissingVacant!3879 i!1204))))))

(assert (=> b!495633 (= lt!224374 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!298019 () Bool)

(assert (=> start!45170 (=> (not res!298019) (not e!290757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45170 (= res!298019 (validMask!0 mask!3524))))

(assert (=> start!45170 e!290757))

(assert (=> start!45170 true))

(declare-fun array_inv!11208 (array!32058) Bool)

(assert (=> start!45170 (array_inv!11208 a!3235)))

(declare-fun b!495634 () Bool)

(declare-fun res!298021 () Bool)

(assert (=> b!495634 (=> (not res!298021) (not e!290756))))

(assert (=> b!495634 (= res!298021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495635 () Bool)

(declare-fun res!298020 () Bool)

(assert (=> b!495635 (=> (not res!298020) (not e!290757))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495635 (= res!298020 (validKeyInArray!0 (select (arr!15412 a!3235) j!176)))))

(declare-fun b!495636 () Bool)

(declare-fun res!298017 () Bool)

(assert (=> b!495636 (=> (not res!298017) (not e!290757))))

(assert (=> b!495636 (= res!298017 (validKeyInArray!0 k0!2280))))

(declare-fun b!495637 () Bool)

(assert (=> b!495637 (= e!290754 true)))

(assert (=> b!495637 (and (bvslt (x!46763 lt!224376) #b01111111111111111111111111111110) (or (= (select (arr!15412 a!3235) (index!17697 lt!224376)) (select (arr!15412 a!3235) j!176)) (= (select (arr!15412 a!3235) (index!17697 lt!224376)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15412 a!3235) (index!17697 lt!224376)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495638 () Bool)

(declare-fun res!298022 () Bool)

(assert (=> b!495638 (=> (not res!298022) (not e!290757))))

(assert (=> b!495638 (= res!298022 (and (= (size!15776 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15776 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15776 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45170 res!298019) b!495638))

(assert (= (and b!495638 res!298022) b!495635))

(assert (= (and b!495635 res!298020) b!495636))

(assert (= (and b!495636 res!298017) b!495632))

(assert (= (and b!495632 res!298015) b!495633))

(assert (= (and b!495633 res!298023) b!495634))

(assert (= (and b!495634 res!298021) b!495631))

(assert (= (and b!495631 res!298018) b!495628))

(assert (= (and b!495628 res!298024) b!495630))

(assert (= (and b!495628 (not res!298025)) b!495629))

(assert (= (and b!495629 (not res!298016)) b!495637))

(declare-fun m!476741 () Bool)

(assert (=> b!495630 m!476741))

(assert (=> b!495630 m!476741))

(declare-fun m!476743 () Bool)

(assert (=> b!495630 m!476743))

(declare-fun m!476745 () Bool)

(assert (=> b!495632 m!476745))

(declare-fun m!476747 () Bool)

(assert (=> b!495636 m!476747))

(declare-fun m!476749 () Bool)

(assert (=> b!495634 m!476749))

(assert (=> b!495635 m!476741))

(assert (=> b!495635 m!476741))

(declare-fun m!476751 () Bool)

(assert (=> b!495635 m!476751))

(declare-fun m!476753 () Bool)

(assert (=> b!495628 m!476753))

(declare-fun m!476755 () Bool)

(assert (=> b!495628 m!476755))

(declare-fun m!476757 () Bool)

(assert (=> b!495628 m!476757))

(assert (=> b!495628 m!476757))

(declare-fun m!476759 () Bool)

(assert (=> b!495628 m!476759))

(assert (=> b!495628 m!476741))

(declare-fun m!476761 () Bool)

(assert (=> b!495628 m!476761))

(assert (=> b!495628 m!476741))

(declare-fun m!476763 () Bool)

(assert (=> b!495628 m!476763))

(assert (=> b!495628 m!476741))

(declare-fun m!476765 () Bool)

(assert (=> b!495628 m!476765))

(assert (=> b!495628 m!476757))

(declare-fun m!476767 () Bool)

(assert (=> b!495628 m!476767))

(declare-fun m!476769 () Bool)

(assert (=> b!495631 m!476769))

(declare-fun m!476771 () Bool)

(assert (=> b!495633 m!476771))

(declare-fun m!476773 () Bool)

(assert (=> start!45170 m!476773))

(declare-fun m!476775 () Bool)

(assert (=> start!45170 m!476775))

(declare-fun m!476777 () Bool)

(assert (=> b!495637 m!476777))

(assert (=> b!495637 m!476741))

(check-sat (not b!495633) (not start!45170) (not b!495631) (not b!495636) (not b!495634) (not b!495632) (not b!495635) (not b!495630) (not b!495628))
