; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68782 () Bool)

(assert start!68782)

(declare-fun b!801576 () Bool)

(declare-fun res!546105 () Bool)

(declare-fun e!444320 () Bool)

(assert (=> b!801576 (=> (not res!546105) (not e!444320))))

(declare-datatypes ((array!43572 0))(
  ( (array!43573 (arr!20866 (Array (_ BitVec 32) (_ BitVec 64))) (size!21287 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43572)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801576 (= res!546105 (validKeyInArray!0 (select (arr!20866 a!3170) j!153)))))

(declare-fun b!801577 () Bool)

(declare-fun res!546098 () Bool)

(declare-fun e!444319 () Bool)

(assert (=> b!801577 (=> (not res!546098) (not e!444319))))

(declare-datatypes ((List!14829 0))(
  ( (Nil!14826) (Cons!14825 (h!15954 (_ BitVec 64)) (t!21144 List!14829)) )
))
(declare-fun arrayNoDuplicates!0 (array!43572 (_ BitVec 32) List!14829) Bool)

(assert (=> b!801577 (= res!546098 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14826))))

(declare-fun b!801578 () Bool)

(declare-fun res!546096 () Bool)

(assert (=> b!801578 (=> (not res!546096) (not e!444320))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!801578 (= res!546096 (validKeyInArray!0 k0!2044))))

(declare-fun b!801579 () Bool)

(declare-fun res!546100 () Bool)

(assert (=> b!801579 (=> (not res!546100) (not e!444320))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!801579 (= res!546100 (and (= (size!21287 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21287 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21287 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!546107 () Bool)

(assert (=> start!68782 (=> (not res!546107) (not e!444320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68782 (= res!546107 (validMask!0 mask!3266))))

(assert (=> start!68782 e!444320))

(assert (=> start!68782 true))

(declare-fun array_inv!16662 (array!43572) Bool)

(assert (=> start!68782 (array_inv!16662 a!3170)))

(declare-fun b!801580 () Bool)

(declare-fun e!444315 () Bool)

(assert (=> b!801580 (= e!444319 e!444315)))

(declare-fun res!546097 () Bool)

(assert (=> b!801580 (=> (not res!546097) (not e!444315))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!358307 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8457 0))(
  ( (MissingZero!8457 (index!36196 (_ BitVec 32))) (Found!8457 (index!36197 (_ BitVec 32))) (Intermediate!8457 (undefined!9269 Bool) (index!36198 (_ BitVec 32)) (x!67055 (_ BitVec 32))) (Undefined!8457) (MissingVacant!8457 (index!36199 (_ BitVec 32))) )
))
(declare-fun lt!358306 () SeekEntryResult!8457)

(declare-fun lt!358310 () array!43572)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43572 (_ BitVec 32)) SeekEntryResult!8457)

(assert (=> b!801580 (= res!546097 (= lt!358306 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358307 lt!358310 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43572 (_ BitVec 32)) SeekEntryResult!8457)

(assert (=> b!801580 (= lt!358306 (seekEntryOrOpen!0 lt!358307 lt!358310 mask!3266))))

(assert (=> b!801580 (= lt!358307 (select (store (arr!20866 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801580 (= lt!358310 (array!43573 (store (arr!20866 a!3170) i!1163 k0!2044) (size!21287 a!3170)))))

(declare-fun b!801581 () Bool)

(declare-fun res!546104 () Bool)

(assert (=> b!801581 (=> (not res!546104) (not e!444320))))

(declare-fun arrayContainsKey!0 (array!43572 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801581 (= res!546104 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801582 () Bool)

(declare-fun e!444317 () Bool)

(assert (=> b!801582 (= e!444315 e!444317)))

(declare-fun res!546103 () Bool)

(assert (=> b!801582 (=> (not res!546103) (not e!444317))))

(declare-fun lt!358312 () SeekEntryResult!8457)

(declare-fun lt!358309 () SeekEntryResult!8457)

(assert (=> b!801582 (= res!546103 (and (= lt!358309 lt!358312) (= lt!358312 (Found!8457 j!153)) (not (= (select (arr!20866 a!3170) index!1236) (select (arr!20866 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!801582 (= lt!358312 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20866 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801582 (= lt!358309 (seekEntryOrOpen!0 (select (arr!20866 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801583 () Bool)

(assert (=> b!801583 (= e!444320 e!444319)))

(declare-fun res!546095 () Bool)

(assert (=> b!801583 (=> (not res!546095) (not e!444319))))

(declare-fun lt!358313 () SeekEntryResult!8457)

(assert (=> b!801583 (= res!546095 (or (= lt!358313 (MissingZero!8457 i!1163)) (= lt!358313 (MissingVacant!8457 i!1163))))))

(assert (=> b!801583 (= lt!358313 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!801584 () Bool)

(declare-fun res!546106 () Bool)

(declare-fun e!444318 () Bool)

(assert (=> b!801584 (=> (not res!546106) (not e!444318))))

(declare-fun lt!358311 () (_ BitVec 32))

(assert (=> b!801584 (= res!546106 (= lt!358306 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358311 vacantAfter!23 lt!358307 lt!358310 mask!3266)))))

(declare-fun b!801585 () Bool)

(declare-fun res!546101 () Bool)

(assert (=> b!801585 (=> (not res!546101) (not e!444319))))

(assert (=> b!801585 (= res!546101 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21287 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20866 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21287 a!3170)) (= (select (arr!20866 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801586 () Bool)

(assert (=> b!801586 (= e!444318 false)))

(declare-fun lt!358308 () SeekEntryResult!8457)

(assert (=> b!801586 (= lt!358308 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358311 vacantBefore!23 (select (arr!20866 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801587 () Bool)

(assert (=> b!801587 (= e!444317 e!444318)))

(declare-fun res!546102 () Bool)

(assert (=> b!801587 (=> (not res!546102) (not e!444318))))

(assert (=> b!801587 (= res!546102 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!358311 #b00000000000000000000000000000000) (bvslt lt!358311 (size!21287 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801587 (= lt!358311 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801588 () Bool)

(declare-fun res!546099 () Bool)

(assert (=> b!801588 (=> (not res!546099) (not e!444319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43572 (_ BitVec 32)) Bool)

(assert (=> b!801588 (= res!546099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68782 res!546107) b!801579))

(assert (= (and b!801579 res!546100) b!801576))

(assert (= (and b!801576 res!546105) b!801578))

(assert (= (and b!801578 res!546096) b!801581))

(assert (= (and b!801581 res!546104) b!801583))

(assert (= (and b!801583 res!546095) b!801588))

(assert (= (and b!801588 res!546099) b!801577))

(assert (= (and b!801577 res!546098) b!801585))

(assert (= (and b!801585 res!546101) b!801580))

(assert (= (and b!801580 res!546097) b!801582))

(assert (= (and b!801582 res!546103) b!801587))

(assert (= (and b!801587 res!546102) b!801584))

(assert (= (and b!801584 res!546106) b!801586))

(declare-fun m!742751 () Bool)

(assert (=> b!801578 m!742751))

(declare-fun m!742753 () Bool)

(assert (=> start!68782 m!742753))

(declare-fun m!742755 () Bool)

(assert (=> start!68782 m!742755))

(declare-fun m!742757 () Bool)

(assert (=> b!801580 m!742757))

(declare-fun m!742759 () Bool)

(assert (=> b!801580 m!742759))

(declare-fun m!742761 () Bool)

(assert (=> b!801580 m!742761))

(declare-fun m!742763 () Bool)

(assert (=> b!801580 m!742763))

(declare-fun m!742765 () Bool)

(assert (=> b!801585 m!742765))

(declare-fun m!742767 () Bool)

(assert (=> b!801585 m!742767))

(declare-fun m!742769 () Bool)

(assert (=> b!801583 m!742769))

(declare-fun m!742771 () Bool)

(assert (=> b!801588 m!742771))

(declare-fun m!742773 () Bool)

(assert (=> b!801577 m!742773))

(declare-fun m!742775 () Bool)

(assert (=> b!801586 m!742775))

(assert (=> b!801586 m!742775))

(declare-fun m!742777 () Bool)

(assert (=> b!801586 m!742777))

(declare-fun m!742779 () Bool)

(assert (=> b!801582 m!742779))

(assert (=> b!801582 m!742775))

(assert (=> b!801582 m!742775))

(declare-fun m!742781 () Bool)

(assert (=> b!801582 m!742781))

(assert (=> b!801582 m!742775))

(declare-fun m!742783 () Bool)

(assert (=> b!801582 m!742783))

(assert (=> b!801576 m!742775))

(assert (=> b!801576 m!742775))

(declare-fun m!742785 () Bool)

(assert (=> b!801576 m!742785))

(declare-fun m!742787 () Bool)

(assert (=> b!801581 m!742787))

(declare-fun m!742789 () Bool)

(assert (=> b!801587 m!742789))

(declare-fun m!742791 () Bool)

(assert (=> b!801584 m!742791))

(check-sat (not b!801578) (not b!801583) (not b!801577) (not b!801588) (not b!801584) (not b!801580) (not b!801576) (not start!68782) (not b!801587) (not b!801581) (not b!801586) (not b!801582))
(check-sat)
