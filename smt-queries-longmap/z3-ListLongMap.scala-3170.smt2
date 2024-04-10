; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44648 () Bool)

(assert start!44648)

(declare-fun b!489840 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31707 0))(
  ( (array!31708 (arr!15241 (Array (_ BitVec 32) (_ BitVec 64))) (size!15605 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31707)

(declare-fun e!288042 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3708 0))(
  ( (MissingZero!3708 (index!17011 (_ BitVec 32))) (Found!3708 (index!17012 (_ BitVec 32))) (Intermediate!3708 (undefined!4520 Bool) (index!17013 (_ BitVec 32)) (x!46118 (_ BitVec 32))) (Undefined!3708) (MissingVacant!3708 (index!17014 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31707 (_ BitVec 32)) SeekEntryResult!3708)

(assert (=> b!489840 (= e!288042 (= (seekEntryOrOpen!0 (select (arr!15241 a!3235) j!176) a!3235 mask!3524) (Found!3708 j!176)))))

(declare-fun b!489842 () Bool)

(declare-fun e!288041 () Bool)

(assert (=> b!489842 (= e!288041 (not true))))

(declare-fun lt!221098 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!221095 () SeekEntryResult!3708)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31707 (_ BitVec 32)) SeekEntryResult!3708)

(assert (=> b!489842 (= lt!221095 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221098 (select (store (arr!15241 a!3235) i!1204 k0!2280) j!176) (array!31708 (store (arr!15241 a!3235) i!1204 k0!2280) (size!15605 a!3235)) mask!3524))))

(declare-fun lt!221096 () SeekEntryResult!3708)

(declare-fun lt!221097 () (_ BitVec 32))

(assert (=> b!489842 (= lt!221096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221097 (select (arr!15241 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489842 (= lt!221098 (toIndex!0 (select (store (arr!15241 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489842 (= lt!221097 (toIndex!0 (select (arr!15241 a!3235) j!176) mask!3524))))

(assert (=> b!489842 e!288042))

(declare-fun res!292779 () Bool)

(assert (=> b!489842 (=> (not res!292779) (not e!288042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31707 (_ BitVec 32)) Bool)

(assert (=> b!489842 (= res!292779 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14362 0))(
  ( (Unit!14363) )
))
(declare-fun lt!221093 () Unit!14362)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31707 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14362)

(assert (=> b!489842 (= lt!221093 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489843 () Bool)

(declare-fun e!288039 () Bool)

(assert (=> b!489843 (= e!288039 e!288041)))

(declare-fun res!292781 () Bool)

(assert (=> b!489843 (=> (not res!292781) (not e!288041))))

(declare-fun lt!221094 () SeekEntryResult!3708)

(assert (=> b!489843 (= res!292781 (or (= lt!221094 (MissingZero!3708 i!1204)) (= lt!221094 (MissingVacant!3708 i!1204))))))

(assert (=> b!489843 (= lt!221094 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!489844 () Bool)

(declare-fun res!292780 () Bool)

(assert (=> b!489844 (=> (not res!292780) (not e!288039))))

(declare-fun arrayContainsKey!0 (array!31707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489844 (= res!292780 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489845 () Bool)

(declare-fun res!292782 () Bool)

(assert (=> b!489845 (=> (not res!292782) (not e!288039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489845 (= res!292782 (validKeyInArray!0 k0!2280))))

(declare-fun b!489846 () Bool)

(declare-fun res!292777 () Bool)

(assert (=> b!489846 (=> (not res!292777) (not e!288039))))

(assert (=> b!489846 (= res!292777 (and (= (size!15605 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15605 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15605 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!292784 () Bool)

(assert (=> start!44648 (=> (not res!292784) (not e!288039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44648 (= res!292784 (validMask!0 mask!3524))))

(assert (=> start!44648 e!288039))

(assert (=> start!44648 true))

(declare-fun array_inv!11037 (array!31707) Bool)

(assert (=> start!44648 (array_inv!11037 a!3235)))

(declare-fun b!489841 () Bool)

(declare-fun res!292783 () Bool)

(assert (=> b!489841 (=> (not res!292783) (not e!288041))))

(assert (=> b!489841 (= res!292783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489847 () Bool)

(declare-fun res!292776 () Bool)

(assert (=> b!489847 (=> (not res!292776) (not e!288041))))

(declare-datatypes ((List!9399 0))(
  ( (Nil!9396) (Cons!9395 (h!10257 (_ BitVec 64)) (t!15627 List!9399)) )
))
(declare-fun arrayNoDuplicates!0 (array!31707 (_ BitVec 32) List!9399) Bool)

(assert (=> b!489847 (= res!292776 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9396))))

(declare-fun b!489848 () Bool)

(declare-fun res!292778 () Bool)

(assert (=> b!489848 (=> (not res!292778) (not e!288039))))

(assert (=> b!489848 (= res!292778 (validKeyInArray!0 (select (arr!15241 a!3235) j!176)))))

(assert (= (and start!44648 res!292784) b!489846))

(assert (= (and b!489846 res!292777) b!489848))

(assert (= (and b!489848 res!292778) b!489845))

(assert (= (and b!489845 res!292782) b!489844))

(assert (= (and b!489844 res!292780) b!489843))

(assert (= (and b!489843 res!292781) b!489841))

(assert (= (and b!489841 res!292783) b!489847))

(assert (= (and b!489847 res!292776) b!489842))

(assert (= (and b!489842 res!292779) b!489840))

(declare-fun m!469749 () Bool)

(assert (=> b!489847 m!469749))

(declare-fun m!469751 () Bool)

(assert (=> b!489842 m!469751))

(declare-fun m!469753 () Bool)

(assert (=> b!489842 m!469753))

(declare-fun m!469755 () Bool)

(assert (=> b!489842 m!469755))

(declare-fun m!469757 () Bool)

(assert (=> b!489842 m!469757))

(assert (=> b!489842 m!469751))

(declare-fun m!469759 () Bool)

(assert (=> b!489842 m!469759))

(assert (=> b!489842 m!469751))

(declare-fun m!469761 () Bool)

(assert (=> b!489842 m!469761))

(assert (=> b!489842 m!469757))

(declare-fun m!469763 () Bool)

(assert (=> b!489842 m!469763))

(declare-fun m!469765 () Bool)

(assert (=> b!489842 m!469765))

(assert (=> b!489842 m!469757))

(declare-fun m!469767 () Bool)

(assert (=> b!489842 m!469767))

(declare-fun m!469769 () Bool)

(assert (=> b!489843 m!469769))

(assert (=> b!489840 m!469751))

(assert (=> b!489840 m!469751))

(declare-fun m!469771 () Bool)

(assert (=> b!489840 m!469771))

(declare-fun m!469773 () Bool)

(assert (=> b!489845 m!469773))

(declare-fun m!469775 () Bool)

(assert (=> b!489844 m!469775))

(assert (=> b!489848 m!469751))

(assert (=> b!489848 m!469751))

(declare-fun m!469777 () Bool)

(assert (=> b!489848 m!469777))

(declare-fun m!469779 () Bool)

(assert (=> start!44648 m!469779))

(declare-fun m!469781 () Bool)

(assert (=> start!44648 m!469781))

(declare-fun m!469783 () Bool)

(assert (=> b!489841 m!469783))

(check-sat (not b!489841) (not b!489842) (not b!489844) (not b!489847) (not b!489848) (not start!44648) (not b!489845) (not b!489843) (not b!489840))
