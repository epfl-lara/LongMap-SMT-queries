; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45964 () Bool)

(assert start!45964)

(declare-fun b!508812 () Bool)

(declare-fun res!309665 () Bool)

(declare-fun e!297645 () Bool)

(assert (=> b!508812 (=> (not res!309665) (not e!297645))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32675 0))(
  ( (array!32676 (arr!15716 (Array (_ BitVec 32) (_ BitVec 64))) (size!16080 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32675)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!508812 (= res!309665 (and (= (size!16080 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16080 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16080 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!309662 () Bool)

(assert (=> start!45964 (=> (not res!309662) (not e!297645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45964 (= res!309662 (validMask!0 mask!3524))))

(assert (=> start!45964 e!297645))

(assert (=> start!45964 true))

(declare-fun array_inv!11512 (array!32675) Bool)

(assert (=> start!45964 (array_inv!11512 a!3235)))

(declare-fun b!508813 () Bool)

(declare-fun res!309657 () Bool)

(assert (=> b!508813 (=> (not res!309657) (not e!297645))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508813 (= res!309657 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508814 () Bool)

(declare-fun res!309664 () Bool)

(declare-fun e!297643 () Bool)

(assert (=> b!508814 (=> (not res!309664) (not e!297643))))

(declare-datatypes ((List!9874 0))(
  ( (Nil!9871) (Cons!9870 (h!10747 (_ BitVec 64)) (t!16102 List!9874)) )
))
(declare-fun arrayNoDuplicates!0 (array!32675 (_ BitVec 32) List!9874) Bool)

(assert (=> b!508814 (= res!309664 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9871))))

(declare-fun b!508815 () Bool)

(assert (=> b!508815 (= e!297643 (not true))))

(declare-fun lt!232366 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!508815 (= lt!232366 (toIndex!0 (select (arr!15716 a!3235) j!176) mask!3524))))

(declare-fun e!297644 () Bool)

(assert (=> b!508815 e!297644))

(declare-fun res!309660 () Bool)

(assert (=> b!508815 (=> (not res!309660) (not e!297644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32675 (_ BitVec 32)) Bool)

(assert (=> b!508815 (= res!309660 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15624 0))(
  ( (Unit!15625) )
))
(declare-fun lt!232364 () Unit!15624)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32675 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15624)

(assert (=> b!508815 (= lt!232364 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508816 () Bool)

(declare-fun res!309659 () Bool)

(assert (=> b!508816 (=> (not res!309659) (not e!297643))))

(assert (=> b!508816 (= res!309659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508817 () Bool)

(declare-datatypes ((SeekEntryResult!4183 0))(
  ( (MissingZero!4183 (index!18920 (_ BitVec 32))) (Found!4183 (index!18921 (_ BitVec 32))) (Intermediate!4183 (undefined!4995 Bool) (index!18922 (_ BitVec 32)) (x!47896 (_ BitVec 32))) (Undefined!4183) (MissingVacant!4183 (index!18923 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32675 (_ BitVec 32)) SeekEntryResult!4183)

(assert (=> b!508817 (= e!297644 (= (seekEntryOrOpen!0 (select (arr!15716 a!3235) j!176) a!3235 mask!3524) (Found!4183 j!176)))))

(declare-fun b!508818 () Bool)

(assert (=> b!508818 (= e!297645 e!297643)))

(declare-fun res!309658 () Bool)

(assert (=> b!508818 (=> (not res!309658) (not e!297643))))

(declare-fun lt!232365 () SeekEntryResult!4183)

(assert (=> b!508818 (= res!309658 (or (= lt!232365 (MissingZero!4183 i!1204)) (= lt!232365 (MissingVacant!4183 i!1204))))))

(assert (=> b!508818 (= lt!232365 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!508819 () Bool)

(declare-fun res!309661 () Bool)

(assert (=> b!508819 (=> (not res!309661) (not e!297645))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508819 (= res!309661 (validKeyInArray!0 k!2280))))

(declare-fun b!508820 () Bool)

(declare-fun res!309663 () Bool)

(assert (=> b!508820 (=> (not res!309663) (not e!297645))))

(assert (=> b!508820 (= res!309663 (validKeyInArray!0 (select (arr!15716 a!3235) j!176)))))

(assert (= (and start!45964 res!309662) b!508812))

(assert (= (and b!508812 res!309665) b!508820))

(assert (= (and b!508820 res!309663) b!508819))

(assert (= (and b!508819 res!309661) b!508813))

(assert (= (and b!508813 res!309657) b!508818))

(assert (= (and b!508818 res!309658) b!508816))

(assert (= (and b!508816 res!309659) b!508814))

(assert (= (and b!508814 res!309664) b!508815))

(assert (= (and b!508815 res!309660) b!508817))

(declare-fun m!489553 () Bool)

(assert (=> b!508813 m!489553))

(declare-fun m!489555 () Bool)

(assert (=> start!45964 m!489555))

(declare-fun m!489557 () Bool)

(assert (=> start!45964 m!489557))

(declare-fun m!489559 () Bool)

(assert (=> b!508817 m!489559))

(assert (=> b!508817 m!489559))

(declare-fun m!489561 () Bool)

(assert (=> b!508817 m!489561))

(assert (=> b!508815 m!489559))

(assert (=> b!508815 m!489559))

(declare-fun m!489563 () Bool)

(assert (=> b!508815 m!489563))

(declare-fun m!489565 () Bool)

(assert (=> b!508815 m!489565))

(declare-fun m!489567 () Bool)

(assert (=> b!508815 m!489567))

(declare-fun m!489569 () Bool)

(assert (=> b!508814 m!489569))

(declare-fun m!489571 () Bool)

(assert (=> b!508818 m!489571))

(declare-fun m!489573 () Bool)

(assert (=> b!508816 m!489573))

(declare-fun m!489575 () Bool)

(assert (=> b!508819 m!489575))

(assert (=> b!508820 m!489559))

(assert (=> b!508820 m!489559))

(declare-fun m!489577 () Bool)

(assert (=> b!508820 m!489577))

(push 1)

(assert (not b!508815))

