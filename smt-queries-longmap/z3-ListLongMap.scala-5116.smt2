; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69390 () Bool)

(assert start!69390)

(declare-fun b!809095 () Bool)

(declare-fun res!552966 () Bool)

(declare-fun e!447849 () Bool)

(assert (=> b!809095 (=> (not res!552966) (not e!447849))))

(declare-datatypes ((array!44005 0))(
  ( (array!44006 (arr!21077 (Array (_ BitVec 32) (_ BitVec 64))) (size!21498 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44005)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!44005 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809095 (= res!552966 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!552970 () Bool)

(assert (=> start!69390 (=> (not res!552970) (not e!447849))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69390 (= res!552970 (validMask!0 mask!3266))))

(assert (=> start!69390 e!447849))

(assert (=> start!69390 true))

(declare-fun array_inv!16960 (array!44005) Bool)

(assert (=> start!69390 (array_inv!16960 a!3170)))

(declare-fun b!809096 () Bool)

(declare-fun e!447853 () Bool)

(assert (=> b!809096 (= e!447853 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!362459 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809096 (= lt!362459 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!809097 () Bool)

(declare-fun res!552963 () Bool)

(declare-fun e!447852 () Bool)

(assert (=> b!809097 (=> (not res!552963) (not e!447852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44005 (_ BitVec 32)) Bool)

(assert (=> b!809097 (= res!552963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!809098 () Bool)

(declare-fun res!552964 () Bool)

(assert (=> b!809098 (=> (not res!552964) (not e!447852))))

(declare-datatypes ((List!15079 0))(
  ( (Nil!15076) (Cons!15075 (h!16204 (_ BitVec 64)) (t!21385 List!15079)) )
))
(declare-fun arrayNoDuplicates!0 (array!44005 (_ BitVec 32) List!15079) Bool)

(assert (=> b!809098 (= res!552964 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15076))))

(declare-fun b!809099 () Bool)

(declare-fun e!447850 () Bool)

(assert (=> b!809099 (= e!447852 e!447850)))

(declare-fun res!552962 () Bool)

(assert (=> b!809099 (=> (not res!552962) (not e!447850))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!362454 () array!44005)

(declare-fun lt!362457 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8665 0))(
  ( (MissingZero!8665 (index!37028 (_ BitVec 32))) (Found!8665 (index!37029 (_ BitVec 32))) (Intermediate!8665 (undefined!9477 Bool) (index!37030 (_ BitVec 32)) (x!67844 (_ BitVec 32))) (Undefined!8665) (MissingVacant!8665 (index!37031 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44005 (_ BitVec 32)) SeekEntryResult!8665)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44005 (_ BitVec 32)) SeekEntryResult!8665)

(assert (=> b!809099 (= res!552962 (= (seekEntryOrOpen!0 lt!362457 lt!362454 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362457 lt!362454 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!809099 (= lt!362457 (select (store (arr!21077 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!809099 (= lt!362454 (array!44006 (store (arr!21077 a!3170) i!1163 k0!2044) (size!21498 a!3170)))))

(declare-fun b!809100 () Bool)

(declare-fun res!552968 () Bool)

(assert (=> b!809100 (=> (not res!552968) (not e!447849))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809100 (= res!552968 (validKeyInArray!0 k0!2044))))

(declare-fun b!809101 () Bool)

(declare-fun res!552972 () Bool)

(assert (=> b!809101 (=> (not res!552972) (not e!447849))))

(assert (=> b!809101 (= res!552972 (and (= (size!21498 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21498 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21498 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!809102 () Bool)

(declare-fun res!552965 () Bool)

(assert (=> b!809102 (=> (not res!552965) (not e!447852))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!809102 (= res!552965 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21498 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21077 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21498 a!3170)) (= (select (arr!21077 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!809103 () Bool)

(assert (=> b!809103 (= e!447850 e!447853)))

(declare-fun res!552969 () Bool)

(assert (=> b!809103 (=> (not res!552969) (not e!447853))))

(declare-fun lt!362455 () SeekEntryResult!8665)

(declare-fun lt!362458 () SeekEntryResult!8665)

(assert (=> b!809103 (= res!552969 (and (= lt!362458 lt!362455) (= lt!362455 (Found!8665 j!153)) (not (= (select (arr!21077 a!3170) index!1236) (select (arr!21077 a!3170) j!153)))))))

(assert (=> b!809103 (= lt!362455 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21077 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!809103 (= lt!362458 (seekEntryOrOpen!0 (select (arr!21077 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809104 () Bool)

(assert (=> b!809104 (= e!447849 e!447852)))

(declare-fun res!552971 () Bool)

(assert (=> b!809104 (=> (not res!552971) (not e!447852))))

(declare-fun lt!362456 () SeekEntryResult!8665)

(assert (=> b!809104 (= res!552971 (or (= lt!362456 (MissingZero!8665 i!1163)) (= lt!362456 (MissingVacant!8665 i!1163))))))

(assert (=> b!809104 (= lt!362456 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!809105 () Bool)

(declare-fun res!552967 () Bool)

(assert (=> b!809105 (=> (not res!552967) (not e!447849))))

(assert (=> b!809105 (= res!552967 (validKeyInArray!0 (select (arr!21077 a!3170) j!153)))))

(assert (= (and start!69390 res!552970) b!809101))

(assert (= (and b!809101 res!552972) b!809105))

(assert (= (and b!809105 res!552967) b!809100))

(assert (= (and b!809100 res!552968) b!809095))

(assert (= (and b!809095 res!552966) b!809104))

(assert (= (and b!809104 res!552971) b!809097))

(assert (= (and b!809097 res!552963) b!809098))

(assert (= (and b!809098 res!552964) b!809102))

(assert (= (and b!809102 res!552965) b!809099))

(assert (= (and b!809099 res!552962) b!809103))

(assert (= (and b!809103 res!552969) b!809096))

(declare-fun m!750781 () Bool)

(assert (=> b!809096 m!750781))

(declare-fun m!750783 () Bool)

(assert (=> start!69390 m!750783))

(declare-fun m!750785 () Bool)

(assert (=> start!69390 m!750785))

(declare-fun m!750787 () Bool)

(assert (=> b!809098 m!750787))

(declare-fun m!750789 () Bool)

(assert (=> b!809097 m!750789))

(declare-fun m!750791 () Bool)

(assert (=> b!809099 m!750791))

(declare-fun m!750793 () Bool)

(assert (=> b!809099 m!750793))

(declare-fun m!750795 () Bool)

(assert (=> b!809099 m!750795))

(declare-fun m!750797 () Bool)

(assert (=> b!809099 m!750797))

(declare-fun m!750799 () Bool)

(assert (=> b!809102 m!750799))

(declare-fun m!750801 () Bool)

(assert (=> b!809102 m!750801))

(declare-fun m!750803 () Bool)

(assert (=> b!809104 m!750803))

(declare-fun m!750805 () Bool)

(assert (=> b!809100 m!750805))

(declare-fun m!750807 () Bool)

(assert (=> b!809095 m!750807))

(declare-fun m!750809 () Bool)

(assert (=> b!809105 m!750809))

(assert (=> b!809105 m!750809))

(declare-fun m!750811 () Bool)

(assert (=> b!809105 m!750811))

(declare-fun m!750813 () Bool)

(assert (=> b!809103 m!750813))

(assert (=> b!809103 m!750809))

(assert (=> b!809103 m!750809))

(declare-fun m!750815 () Bool)

(assert (=> b!809103 m!750815))

(assert (=> b!809103 m!750809))

(declare-fun m!750817 () Bool)

(assert (=> b!809103 m!750817))

(check-sat (not b!809097) (not b!809095) (not b!809099) (not b!809105) (not b!809096) (not b!809098) (not b!809103) (not b!809104) (not b!809100) (not start!69390))
(check-sat)
