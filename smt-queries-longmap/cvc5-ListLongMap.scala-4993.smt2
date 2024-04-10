; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68468 () Bool)

(assert start!68468)

(declare-fun b!795917 () Bool)

(declare-fun res!540445 () Bool)

(declare-fun e!441697 () Bool)

(assert (=> b!795917 (=> (not res!540445) (not e!441697))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43258 0))(
  ( (array!43259 (arr!20709 (Array (_ BitVec 32) (_ BitVec 64))) (size!21130 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43258)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!795917 (= res!540445 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21130 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20709 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21130 a!3170)) (= (select (arr!20709 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795918 () Bool)

(declare-fun e!441696 () Bool)

(assert (=> b!795918 (= e!441697 e!441696)))

(declare-fun res!540440 () Bool)

(assert (=> b!795918 (=> (not res!540440) (not e!441696))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!354814 () array!43258)

(declare-fun lt!354815 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8300 0))(
  ( (MissingZero!8300 (index!35568 (_ BitVec 32))) (Found!8300 (index!35569 (_ BitVec 32))) (Intermediate!8300 (undefined!9112 Bool) (index!35570 (_ BitVec 32)) (x!66482 (_ BitVec 32))) (Undefined!8300) (MissingVacant!8300 (index!35571 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43258 (_ BitVec 32)) SeekEntryResult!8300)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43258 (_ BitVec 32)) SeekEntryResult!8300)

(assert (=> b!795918 (= res!540440 (= (seekEntryOrOpen!0 lt!354815 lt!354814 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354815 lt!354814 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!795918 (= lt!354815 (select (store (arr!20709 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!795918 (= lt!354814 (array!43259 (store (arr!20709 a!3170) i!1163 k!2044) (size!21130 a!3170)))))

(declare-fun b!795919 () Bool)

(declare-fun res!540441 () Bool)

(declare-fun e!441695 () Bool)

(assert (=> b!795919 (=> (not res!540441) (not e!441695))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795919 (= res!540441 (validKeyInArray!0 (select (arr!20709 a!3170) j!153)))))

(declare-fun b!795920 () Bool)

(declare-fun e!441694 () Bool)

(assert (=> b!795920 (= e!441696 e!441694)))

(declare-fun res!540436 () Bool)

(assert (=> b!795920 (=> (not res!540436) (not e!441694))))

(declare-fun lt!354813 () SeekEntryResult!8300)

(declare-fun lt!354812 () SeekEntryResult!8300)

(assert (=> b!795920 (= res!540436 (and (= lt!354812 lt!354813) (= lt!354813 (Found!8300 j!153)) (= (select (arr!20709 a!3170) index!1236) (select (arr!20709 a!3170) j!153)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20709 a!3170) i!1163 k!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!795920 (= lt!354813 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20709 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!795920 (= lt!354812 (seekEntryOrOpen!0 (select (arr!20709 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!540439 () Bool)

(assert (=> start!68468 (=> (not res!540439) (not e!441695))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68468 (= res!540439 (validMask!0 mask!3266))))

(assert (=> start!68468 e!441695))

(assert (=> start!68468 true))

(declare-fun array_inv!16505 (array!43258) Bool)

(assert (=> start!68468 (array_inv!16505 a!3170)))

(declare-fun b!795921 () Bool)

(assert (=> b!795921 (= e!441695 e!441697)))

(declare-fun res!540437 () Bool)

(assert (=> b!795921 (=> (not res!540437) (not e!441697))))

(declare-fun lt!354811 () SeekEntryResult!8300)

(assert (=> b!795921 (= res!540437 (or (= lt!354811 (MissingZero!8300 i!1163)) (= lt!354811 (MissingVacant!8300 i!1163))))))

(assert (=> b!795921 (= lt!354811 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!795922 () Bool)

(declare-fun res!540438 () Bool)

(assert (=> b!795922 (=> (not res!540438) (not e!441697))))

(declare-datatypes ((List!14672 0))(
  ( (Nil!14669) (Cons!14668 (h!15797 (_ BitVec 64)) (t!20987 List!14672)) )
))
(declare-fun arrayNoDuplicates!0 (array!43258 (_ BitVec 32) List!14672) Bool)

(assert (=> b!795922 (= res!540438 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14669))))

(declare-fun b!795923 () Bool)

(assert (=> b!795923 (= e!441694 (not (validKeyInArray!0 lt!354815)))))

(declare-fun b!795924 () Bool)

(declare-fun res!540443 () Bool)

(assert (=> b!795924 (=> (not res!540443) (not e!441695))))

(declare-fun arrayContainsKey!0 (array!43258 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795924 (= res!540443 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795925 () Bool)

(declare-fun res!540442 () Bool)

(assert (=> b!795925 (=> (not res!540442) (not e!441695))))

(assert (=> b!795925 (= res!540442 (validKeyInArray!0 k!2044))))

(declare-fun b!795926 () Bool)

(declare-fun res!540446 () Bool)

(assert (=> b!795926 (=> (not res!540446) (not e!441695))))

(assert (=> b!795926 (= res!540446 (and (= (size!21130 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21130 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21130 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795927 () Bool)

(declare-fun res!540444 () Bool)

(assert (=> b!795927 (=> (not res!540444) (not e!441697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43258 (_ BitVec 32)) Bool)

(assert (=> b!795927 (= res!540444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68468 res!540439) b!795926))

(assert (= (and b!795926 res!540446) b!795919))

(assert (= (and b!795919 res!540441) b!795925))

(assert (= (and b!795925 res!540442) b!795924))

(assert (= (and b!795924 res!540443) b!795921))

(assert (= (and b!795921 res!540437) b!795927))

(assert (= (and b!795927 res!540444) b!795922))

(assert (= (and b!795922 res!540438) b!795917))

(assert (= (and b!795917 res!540445) b!795918))

(assert (= (and b!795918 res!540440) b!795920))

(assert (= (and b!795920 res!540436) b!795923))

(declare-fun m!736643 () Bool)

(assert (=> b!795917 m!736643))

(declare-fun m!736645 () Bool)

(assert (=> b!795917 m!736645))

(declare-fun m!736647 () Bool)

(assert (=> b!795921 m!736647))

(declare-fun m!736649 () Bool)

(assert (=> b!795925 m!736649))

(declare-fun m!736651 () Bool)

(assert (=> b!795922 m!736651))

(declare-fun m!736653 () Bool)

(assert (=> b!795924 m!736653))

(declare-fun m!736655 () Bool)

(assert (=> b!795923 m!736655))

(declare-fun m!736657 () Bool)

(assert (=> b!795918 m!736657))

(declare-fun m!736659 () Bool)

(assert (=> b!795918 m!736659))

(declare-fun m!736661 () Bool)

(assert (=> b!795918 m!736661))

(declare-fun m!736663 () Bool)

(assert (=> b!795918 m!736663))

(declare-fun m!736665 () Bool)

(assert (=> b!795920 m!736665))

(declare-fun m!736667 () Bool)

(assert (=> b!795920 m!736667))

(declare-fun m!736669 () Bool)

(assert (=> b!795920 m!736669))

(assert (=> b!795920 m!736665))

(declare-fun m!736671 () Bool)

(assert (=> b!795920 m!736671))

(assert (=> b!795920 m!736665))

(declare-fun m!736673 () Bool)

(assert (=> b!795920 m!736673))

(assert (=> b!795920 m!736661))

(assert (=> b!795919 m!736665))

(assert (=> b!795919 m!736665))

(declare-fun m!736675 () Bool)

(assert (=> b!795919 m!736675))

(declare-fun m!736677 () Bool)

(assert (=> b!795927 m!736677))

(declare-fun m!736679 () Bool)

(assert (=> start!68468 m!736679))

(declare-fun m!736681 () Bool)

(assert (=> start!68468 m!736681))

(push 1)

