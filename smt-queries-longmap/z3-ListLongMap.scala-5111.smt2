; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69328 () Bool)

(assert start!69328)

(declare-fun b!808622 () Bool)

(declare-fun res!552549 () Bool)

(declare-fun e!447631 () Bool)

(assert (=> b!808622 (=> (not res!552549) (not e!447631))))

(declare-datatypes ((array!43977 0))(
  ( (array!43978 (arr!21064 (Array (_ BitVec 32) (_ BitVec 64))) (size!21485 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43977)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808622 (= res!552549 (validKeyInArray!0 (select (arr!21064 a!3170) j!153)))))

(declare-fun res!552548 () Bool)

(assert (=> start!69328 (=> (not res!552548) (not e!447631))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69328 (= res!552548 (validMask!0 mask!3266))))

(assert (=> start!69328 e!447631))

(assert (=> start!69328 true))

(declare-fun array_inv!16860 (array!43977) Bool)

(assert (=> start!69328 (array_inv!16860 a!3170)))

(declare-fun b!808623 () Bool)

(declare-fun res!552557 () Bool)

(declare-fun e!447633 () Bool)

(assert (=> b!808623 (=> (not res!552557) (not e!447633))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!808623 (= res!552557 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21485 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21064 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21485 a!3170)) (= (select (arr!21064 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!808624 () Bool)

(declare-fun res!552554 () Bool)

(assert (=> b!808624 (=> (not res!552554) (not e!447631))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808624 (= res!552554 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808625 () Bool)

(declare-fun res!552552 () Bool)

(assert (=> b!808625 (=> (not res!552552) (not e!447633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43977 (_ BitVec 32)) Bool)

(assert (=> b!808625 (= res!552552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!808626 () Bool)

(declare-fun e!447632 () Bool)

(assert (=> b!808626 (= e!447632 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000)))))

(declare-fun lt!362341 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808626 (= lt!362341 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!808627 () Bool)

(declare-fun res!552551 () Bool)

(assert (=> b!808627 (=> (not res!552551) (not e!447631))))

(assert (=> b!808627 (= res!552551 (validKeyInArray!0 k0!2044))))

(declare-fun b!808628 () Bool)

(declare-fun res!552553 () Bool)

(assert (=> b!808628 (=> (not res!552553) (not e!447631))))

(assert (=> b!808628 (= res!552553 (and (= (size!21485 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21485 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21485 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!808629 () Bool)

(assert (=> b!808629 (= e!447631 e!447633)))

(declare-fun res!552550 () Bool)

(assert (=> b!808629 (=> (not res!552550) (not e!447633))))

(declare-datatypes ((SeekEntryResult!8655 0))(
  ( (MissingZero!8655 (index!36988 (_ BitVec 32))) (Found!8655 (index!36989 (_ BitVec 32))) (Intermediate!8655 (undefined!9467 Bool) (index!36990 (_ BitVec 32)) (x!67793 (_ BitVec 32))) (Undefined!8655) (MissingVacant!8655 (index!36991 (_ BitVec 32))) )
))
(declare-fun lt!362339 () SeekEntryResult!8655)

(assert (=> b!808629 (= res!552550 (or (= lt!362339 (MissingZero!8655 i!1163)) (= lt!362339 (MissingVacant!8655 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43977 (_ BitVec 32)) SeekEntryResult!8655)

(assert (=> b!808629 (= lt!362339 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!808630 () Bool)

(declare-fun e!447635 () Bool)

(assert (=> b!808630 (= e!447635 e!447632)))

(declare-fun res!552555 () Bool)

(assert (=> b!808630 (=> (not res!552555) (not e!447632))))

(declare-fun lt!362340 () SeekEntryResult!8655)

(declare-fun lt!362342 () SeekEntryResult!8655)

(assert (=> b!808630 (= res!552555 (and (= lt!362340 lt!362342) (= lt!362342 (Found!8655 j!153)) (not (= (select (arr!21064 a!3170) index!1236) (select (arr!21064 a!3170) j!153)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43977 (_ BitVec 32)) SeekEntryResult!8655)

(assert (=> b!808630 (= lt!362342 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21064 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!808630 (= lt!362340 (seekEntryOrOpen!0 (select (arr!21064 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808631 () Bool)

(assert (=> b!808631 (= e!447633 e!447635)))

(declare-fun res!552556 () Bool)

(assert (=> b!808631 (=> (not res!552556) (not e!447635))))

(declare-fun lt!362337 () array!43977)

(declare-fun lt!362338 () (_ BitVec 64))

(assert (=> b!808631 (= res!552556 (= (seekEntryOrOpen!0 lt!362338 lt!362337 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362338 lt!362337 mask!3266)))))

(assert (=> b!808631 (= lt!362338 (select (store (arr!21064 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!808631 (= lt!362337 (array!43978 (store (arr!21064 a!3170) i!1163 k0!2044) (size!21485 a!3170)))))

(declare-fun b!808632 () Bool)

(declare-fun res!552547 () Bool)

(assert (=> b!808632 (=> (not res!552547) (not e!447633))))

(declare-datatypes ((List!15027 0))(
  ( (Nil!15024) (Cons!15023 (h!16152 (_ BitVec 64)) (t!21342 List!15027)) )
))
(declare-fun arrayNoDuplicates!0 (array!43977 (_ BitVec 32) List!15027) Bool)

(assert (=> b!808632 (= res!552547 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15024))))

(assert (= (and start!69328 res!552548) b!808628))

(assert (= (and b!808628 res!552553) b!808622))

(assert (= (and b!808622 res!552549) b!808627))

(assert (= (and b!808627 res!552551) b!808624))

(assert (= (and b!808624 res!552554) b!808629))

(assert (= (and b!808629 res!552550) b!808625))

(assert (= (and b!808625 res!552552) b!808632))

(assert (= (and b!808632 res!552547) b!808623))

(assert (= (and b!808623 res!552557) b!808631))

(assert (= (and b!808631 res!552556) b!808630))

(assert (= (and b!808630 res!552555) b!808626))

(declare-fun m!750763 () Bool)

(assert (=> b!808624 m!750763))

(declare-fun m!750765 () Bool)

(assert (=> b!808625 m!750765))

(declare-fun m!750767 () Bool)

(assert (=> b!808631 m!750767))

(declare-fun m!750769 () Bool)

(assert (=> b!808631 m!750769))

(declare-fun m!750771 () Bool)

(assert (=> b!808631 m!750771))

(declare-fun m!750773 () Bool)

(assert (=> b!808631 m!750773))

(declare-fun m!750775 () Bool)

(assert (=> b!808630 m!750775))

(declare-fun m!750777 () Bool)

(assert (=> b!808630 m!750777))

(assert (=> b!808630 m!750777))

(declare-fun m!750779 () Bool)

(assert (=> b!808630 m!750779))

(assert (=> b!808630 m!750777))

(declare-fun m!750781 () Bool)

(assert (=> b!808630 m!750781))

(declare-fun m!750783 () Bool)

(assert (=> b!808627 m!750783))

(declare-fun m!750785 () Bool)

(assert (=> b!808623 m!750785))

(declare-fun m!750787 () Bool)

(assert (=> b!808623 m!750787))

(declare-fun m!750789 () Bool)

(assert (=> b!808632 m!750789))

(declare-fun m!750791 () Bool)

(assert (=> start!69328 m!750791))

(declare-fun m!750793 () Bool)

(assert (=> start!69328 m!750793))

(assert (=> b!808622 m!750777))

(assert (=> b!808622 m!750777))

(declare-fun m!750795 () Bool)

(assert (=> b!808622 m!750795))

(declare-fun m!750797 () Bool)

(assert (=> b!808626 m!750797))

(declare-fun m!750799 () Bool)

(assert (=> b!808629 m!750799))

(check-sat (not b!808625) (not b!808631) (not b!808630) (not b!808626) (not b!808629) (not b!808624) (not b!808632) (not start!69328) (not b!808627) (not b!808622))
(check-sat)
