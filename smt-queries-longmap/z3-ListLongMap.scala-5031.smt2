; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68864 () Bool)

(assert start!68864)

(declare-fun b!800787 () Bool)

(declare-fun e!444117 () Bool)

(assert (=> b!800787 (= e!444117 false)))

(declare-fun lt!357635 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43486 0))(
  ( (array!43487 (arr!20818 (Array (_ BitVec 32) (_ BitVec 64))) (size!21238 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43486)

(declare-fun j!153 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8365 0))(
  ( (MissingZero!8365 (index!35828 (_ BitVec 32))) (Found!8365 (index!35829 (_ BitVec 32))) (Intermediate!8365 (undefined!9177 Bool) (index!35830 (_ BitVec 32)) (x!66865 (_ BitVec 32))) (Undefined!8365) (MissingVacant!8365 (index!35831 (_ BitVec 32))) )
))
(declare-fun lt!357631 () SeekEntryResult!8365)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43486 (_ BitVec 32)) SeekEntryResult!8365)

(assert (=> b!800787 (= lt!357631 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357635 vacantBefore!23 (select (arr!20818 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800788 () Bool)

(declare-fun res!544768 () Bool)

(declare-fun e!444116 () Bool)

(assert (=> b!800788 (=> (not res!544768) (not e!444116))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!800788 (= res!544768 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21238 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20818 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21238 a!3170)) (= (select (arr!20818 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800789 () Bool)

(declare-fun res!544761 () Bool)

(assert (=> b!800789 (=> (not res!544761) (not e!444116))))

(declare-datatypes ((List!14688 0))(
  ( (Nil!14685) (Cons!14684 (h!15819 (_ BitVec 64)) (t!20995 List!14688)) )
))
(declare-fun arrayNoDuplicates!0 (array!43486 (_ BitVec 32) List!14688) Bool)

(assert (=> b!800789 (= res!544761 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14685))))

(declare-fun b!800790 () Bool)

(declare-fun e!444113 () Bool)

(assert (=> b!800790 (= e!444113 e!444116)))

(declare-fun res!544764 () Bool)

(assert (=> b!800790 (=> (not res!544764) (not e!444116))))

(declare-fun lt!357636 () SeekEntryResult!8365)

(assert (=> b!800790 (= res!544764 (or (= lt!357636 (MissingZero!8365 i!1163)) (= lt!357636 (MissingVacant!8365 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43486 (_ BitVec 32)) SeekEntryResult!8365)

(assert (=> b!800790 (= lt!357636 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!800791 () Bool)

(declare-fun res!544770 () Bool)

(assert (=> b!800791 (=> (not res!544770) (not e!444117))))

(declare-fun lt!357633 () array!43486)

(declare-fun lt!357634 () SeekEntryResult!8365)

(declare-fun lt!357632 () (_ BitVec 64))

(assert (=> b!800791 (= res!544770 (= lt!357634 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357635 vacantAfter!23 lt!357632 lt!357633 mask!3266)))))

(declare-fun b!800792 () Bool)

(declare-fun e!444118 () Bool)

(assert (=> b!800792 (= e!444116 e!444118)))

(declare-fun res!544765 () Bool)

(assert (=> b!800792 (=> (not res!544765) (not e!444118))))

(assert (=> b!800792 (= res!544765 (= lt!357634 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357632 lt!357633 mask!3266)))))

(assert (=> b!800792 (= lt!357634 (seekEntryOrOpen!0 lt!357632 lt!357633 mask!3266))))

(assert (=> b!800792 (= lt!357632 (select (store (arr!20818 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!800792 (= lt!357633 (array!43487 (store (arr!20818 a!3170) i!1163 k0!2044) (size!21238 a!3170)))))

(declare-fun b!800794 () Bool)

(declare-fun e!444114 () Bool)

(assert (=> b!800794 (= e!444114 e!444117)))

(declare-fun res!544767 () Bool)

(assert (=> b!800794 (=> (not res!544767) (not e!444117))))

(assert (=> b!800794 (= res!544767 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357635 #b00000000000000000000000000000000) (bvslt lt!357635 (size!21238 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800794 (= lt!357635 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!800795 () Bool)

(declare-fun res!544762 () Bool)

(assert (=> b!800795 (=> (not res!544762) (not e!444113))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800795 (= res!544762 (validKeyInArray!0 k0!2044))))

(declare-fun b!800793 () Bool)

(declare-fun res!544769 () Bool)

(assert (=> b!800793 (=> (not res!544769) (not e!444113))))

(assert (=> b!800793 (= res!544769 (validKeyInArray!0 (select (arr!20818 a!3170) j!153)))))

(declare-fun res!544766 () Bool)

(assert (=> start!68864 (=> (not res!544766) (not e!444113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68864 (= res!544766 (validMask!0 mask!3266))))

(assert (=> start!68864 e!444113))

(assert (=> start!68864 true))

(declare-fun array_inv!16677 (array!43486) Bool)

(assert (=> start!68864 (array_inv!16677 a!3170)))

(declare-fun b!800796 () Bool)

(assert (=> b!800796 (= e!444118 e!444114)))

(declare-fun res!544760 () Bool)

(assert (=> b!800796 (=> (not res!544760) (not e!444114))))

(declare-fun lt!357637 () SeekEntryResult!8365)

(declare-fun lt!357638 () SeekEntryResult!8365)

(assert (=> b!800796 (= res!544760 (and (= lt!357638 lt!357637) (= lt!357637 (Found!8365 j!153)) (not (= (select (arr!20818 a!3170) index!1236) (select (arr!20818 a!3170) j!153)))))))

(assert (=> b!800796 (= lt!357637 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20818 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!800796 (= lt!357638 (seekEntryOrOpen!0 (select (arr!20818 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800797 () Bool)

(declare-fun res!544758 () Bool)

(assert (=> b!800797 (=> (not res!544758) (not e!444113))))

(declare-fun arrayContainsKey!0 (array!43486 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800797 (= res!544758 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800798 () Bool)

(declare-fun res!544759 () Bool)

(assert (=> b!800798 (=> (not res!544759) (not e!444113))))

(assert (=> b!800798 (= res!544759 (and (= (size!21238 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21238 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21238 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800799 () Bool)

(declare-fun res!544763 () Bool)

(assert (=> b!800799 (=> (not res!544763) (not e!444116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43486 (_ BitVec 32)) Bool)

(assert (=> b!800799 (= res!544763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68864 res!544766) b!800798))

(assert (= (and b!800798 res!544759) b!800793))

(assert (= (and b!800793 res!544769) b!800795))

(assert (= (and b!800795 res!544762) b!800797))

(assert (= (and b!800797 res!544758) b!800790))

(assert (= (and b!800790 res!544764) b!800799))

(assert (= (and b!800799 res!544763) b!800789))

(assert (= (and b!800789 res!544761) b!800788))

(assert (= (and b!800788 res!544768) b!800792))

(assert (= (and b!800792 res!544765) b!800796))

(assert (= (and b!800796 res!544760) b!800794))

(assert (= (and b!800794 res!544767) b!800791))

(assert (= (and b!800791 res!544770) b!800787))

(declare-fun m!742201 () Bool)

(assert (=> b!800791 m!742201))

(declare-fun m!742203 () Bool)

(assert (=> b!800789 m!742203))

(declare-fun m!742205 () Bool)

(assert (=> b!800787 m!742205))

(assert (=> b!800787 m!742205))

(declare-fun m!742207 () Bool)

(assert (=> b!800787 m!742207))

(declare-fun m!742209 () Bool)

(assert (=> start!68864 m!742209))

(declare-fun m!742211 () Bool)

(assert (=> start!68864 m!742211))

(declare-fun m!742213 () Bool)

(assert (=> b!800792 m!742213))

(declare-fun m!742215 () Bool)

(assert (=> b!800792 m!742215))

(declare-fun m!742217 () Bool)

(assert (=> b!800792 m!742217))

(declare-fun m!742219 () Bool)

(assert (=> b!800792 m!742219))

(declare-fun m!742221 () Bool)

(assert (=> b!800795 m!742221))

(declare-fun m!742223 () Bool)

(assert (=> b!800796 m!742223))

(assert (=> b!800796 m!742205))

(assert (=> b!800796 m!742205))

(declare-fun m!742225 () Bool)

(assert (=> b!800796 m!742225))

(assert (=> b!800796 m!742205))

(declare-fun m!742227 () Bool)

(assert (=> b!800796 m!742227))

(declare-fun m!742229 () Bool)

(assert (=> b!800790 m!742229))

(declare-fun m!742231 () Bool)

(assert (=> b!800794 m!742231))

(declare-fun m!742233 () Bool)

(assert (=> b!800799 m!742233))

(declare-fun m!742235 () Bool)

(assert (=> b!800797 m!742235))

(assert (=> b!800793 m!742205))

(assert (=> b!800793 m!742205))

(declare-fun m!742237 () Bool)

(assert (=> b!800793 m!742237))

(declare-fun m!742239 () Bool)

(assert (=> b!800788 m!742239))

(declare-fun m!742241 () Bool)

(assert (=> b!800788 m!742241))

(check-sat (not b!800797) (not start!68864) (not b!800799) (not b!800789) (not b!800796) (not b!800795) (not b!800792) (not b!800790) (not b!800793) (not b!800787) (not b!800791) (not b!800794))
(check-sat)
