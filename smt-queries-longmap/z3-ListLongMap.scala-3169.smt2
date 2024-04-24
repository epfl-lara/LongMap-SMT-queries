; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44630 () Bool)

(assert start!44630)

(declare-fun b!489671 () Bool)

(declare-fun res!292665 () Bool)

(declare-fun e!287953 () Bool)

(assert (=> b!489671 (=> (not res!292665) (not e!287953))))

(declare-datatypes ((array!31690 0))(
  ( (array!31691 (arr!15232 (Array (_ BitVec 32) (_ BitVec 64))) (size!15596 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31690)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31690 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489671 (= res!292665 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489672 () Bool)

(declare-fun res!292664 () Bool)

(assert (=> b!489672 (=> (not res!292664) (not e!287953))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489672 (= res!292664 (validKeyInArray!0 (select (arr!15232 a!3235) j!176)))))

(declare-fun res!292662 () Bool)

(assert (=> start!44630 (=> (not res!292662) (not e!287953))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44630 (= res!292662 (validMask!0 mask!3524))))

(assert (=> start!44630 e!287953))

(assert (=> start!44630 true))

(declare-fun array_inv!11091 (array!31690) Bool)

(assert (=> start!44630 (array_inv!11091 a!3235)))

(declare-fun b!489673 () Bool)

(declare-fun res!292669 () Bool)

(declare-fun e!287952 () Bool)

(assert (=> b!489673 (=> (not res!292669) (not e!287952))))

(declare-datatypes ((List!9297 0))(
  ( (Nil!9294) (Cons!9293 (h!10155 (_ BitVec 64)) (t!15517 List!9297)) )
))
(declare-fun arrayNoDuplicates!0 (array!31690 (_ BitVec 32) List!9297) Bool)

(assert (=> b!489673 (= res!292669 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9294))))

(declare-fun b!489674 () Bool)

(assert (=> b!489674 (= e!287953 e!287952)))

(declare-fun res!292666 () Bool)

(assert (=> b!489674 (=> (not res!292666) (not e!287952))))

(declare-datatypes ((SeekEntryResult!3655 0))(
  ( (MissingZero!3655 (index!16799 (_ BitVec 32))) (Found!3655 (index!16800 (_ BitVec 32))) (Intermediate!3655 (undefined!4467 Bool) (index!16801 (_ BitVec 32)) (x!46054 (_ BitVec 32))) (Undefined!3655) (MissingVacant!3655 (index!16802 (_ BitVec 32))) )
))
(declare-fun lt!221033 () SeekEntryResult!3655)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!489674 (= res!292666 (or (= lt!221033 (MissingZero!3655 i!1204)) (= lt!221033 (MissingVacant!3655 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31690 (_ BitVec 32)) SeekEntryResult!3655)

(assert (=> b!489674 (= lt!221033 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!489675 () Bool)

(assert (=> b!489675 (= e!287952 (not true))))

(declare-fun lt!221037 () SeekEntryResult!3655)

(declare-fun lt!221035 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31690 (_ BitVec 32)) SeekEntryResult!3655)

(assert (=> b!489675 (= lt!221037 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221035 (select (store (arr!15232 a!3235) i!1204 k0!2280) j!176) (array!31691 (store (arr!15232 a!3235) i!1204 k0!2280) (size!15596 a!3235)) mask!3524))))

(declare-fun lt!221034 () SeekEntryResult!3655)

(declare-fun lt!221038 () (_ BitVec 32))

(assert (=> b!489675 (= lt!221034 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221038 (select (arr!15232 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489675 (= lt!221035 (toIndex!0 (select (store (arr!15232 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489675 (= lt!221038 (toIndex!0 (select (arr!15232 a!3235) j!176) mask!3524))))

(declare-fun e!287954 () Bool)

(assert (=> b!489675 e!287954))

(declare-fun res!292667 () Bool)

(assert (=> b!489675 (=> (not res!292667) (not e!287954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31690 (_ BitVec 32)) Bool)

(assert (=> b!489675 (= res!292667 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14317 0))(
  ( (Unit!14318) )
))
(declare-fun lt!221036 () Unit!14317)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31690 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14317)

(assert (=> b!489675 (= lt!221036 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489676 () Bool)

(assert (=> b!489676 (= e!287954 (= (seekEntryOrOpen!0 (select (arr!15232 a!3235) j!176) a!3235 mask!3524) (Found!3655 j!176)))))

(declare-fun b!489677 () Bool)

(declare-fun res!292661 () Bool)

(assert (=> b!489677 (=> (not res!292661) (not e!287953))))

(assert (=> b!489677 (= res!292661 (and (= (size!15596 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15596 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15596 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489678 () Bool)

(declare-fun res!292663 () Bool)

(assert (=> b!489678 (=> (not res!292663) (not e!287953))))

(assert (=> b!489678 (= res!292663 (validKeyInArray!0 k0!2280))))

(declare-fun b!489679 () Bool)

(declare-fun res!292668 () Bool)

(assert (=> b!489679 (=> (not res!292668) (not e!287952))))

(assert (=> b!489679 (= res!292668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44630 res!292662) b!489677))

(assert (= (and b!489677 res!292661) b!489672))

(assert (= (and b!489672 res!292664) b!489678))

(assert (= (and b!489678 res!292663) b!489671))

(assert (= (and b!489671 res!292665) b!489674))

(assert (= (and b!489674 res!292666) b!489679))

(assert (= (and b!489679 res!292668) b!489673))

(assert (= (and b!489673 res!292669) b!489675))

(assert (= (and b!489675 res!292667) b!489676))

(declare-fun m!469789 () Bool)

(assert (=> b!489679 m!469789))

(declare-fun m!469791 () Bool)

(assert (=> b!489676 m!469791))

(assert (=> b!489676 m!469791))

(declare-fun m!469793 () Bool)

(assert (=> b!489676 m!469793))

(declare-fun m!469795 () Bool)

(assert (=> b!489674 m!469795))

(declare-fun m!469797 () Bool)

(assert (=> b!489675 m!469797))

(declare-fun m!469799 () Bool)

(assert (=> b!489675 m!469799))

(declare-fun m!469801 () Bool)

(assert (=> b!489675 m!469801))

(declare-fun m!469803 () Bool)

(assert (=> b!489675 m!469803))

(assert (=> b!489675 m!469797))

(assert (=> b!489675 m!469791))

(declare-fun m!469805 () Bool)

(assert (=> b!489675 m!469805))

(assert (=> b!489675 m!469791))

(declare-fun m!469807 () Bool)

(assert (=> b!489675 m!469807))

(assert (=> b!489675 m!469791))

(declare-fun m!469809 () Bool)

(assert (=> b!489675 m!469809))

(assert (=> b!489675 m!469797))

(declare-fun m!469811 () Bool)

(assert (=> b!489675 m!469811))

(declare-fun m!469813 () Bool)

(assert (=> b!489673 m!469813))

(declare-fun m!469815 () Bool)

(assert (=> start!44630 m!469815))

(declare-fun m!469817 () Bool)

(assert (=> start!44630 m!469817))

(assert (=> b!489672 m!469791))

(assert (=> b!489672 m!469791))

(declare-fun m!469819 () Bool)

(assert (=> b!489672 m!469819))

(declare-fun m!469821 () Bool)

(assert (=> b!489671 m!469821))

(declare-fun m!469823 () Bool)

(assert (=> b!489678 m!469823))

(check-sat (not b!489678) (not b!489679) (not b!489676) (not start!44630) (not b!489675) (not b!489673) (not b!489674) (not b!489671) (not b!489672))
(check-sat)
