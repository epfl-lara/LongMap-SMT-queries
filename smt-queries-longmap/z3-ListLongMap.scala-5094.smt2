; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69338 () Bool)

(assert start!69338)

(declare-fun b!807524 () Bool)

(declare-fun res!551106 () Bool)

(declare-fun e!447256 () Bool)

(assert (=> b!807524 (=> (not res!551106) (not e!447256))))

(declare-datatypes ((array!43870 0))(
  ( (array!43871 (arr!21007 (Array (_ BitVec 32) (_ BitVec 64))) (size!21427 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43870)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43870 (_ BitVec 32)) Bool)

(assert (=> b!807524 (= res!551106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807525 () Bool)

(declare-fun res!551099 () Bool)

(declare-fun e!447254 () Bool)

(assert (=> b!807525 (=> (not res!551099) (not e!447254))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!807525 (= res!551099 (and (= (size!21427 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21427 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21427 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807526 () Bool)

(declare-fun e!447252 () Bool)

(declare-fun e!447253 () Bool)

(assert (=> b!807526 (= e!447252 e!447253)))

(declare-fun res!551107 () Bool)

(assert (=> b!807526 (=> (not res!551107) (not e!447253))))

(declare-datatypes ((SeekEntryResult!8554 0))(
  ( (MissingZero!8554 (index!36584 (_ BitVec 32))) (Found!8554 (index!36585 (_ BitVec 32))) (Intermediate!8554 (undefined!9366 Bool) (index!36586 (_ BitVec 32)) (x!67564 (_ BitVec 32))) (Undefined!8554) (MissingVacant!8554 (index!36587 (_ BitVec 32))) )
))
(declare-fun lt!361619 () SeekEntryResult!8554)

(declare-fun lt!361623 () SeekEntryResult!8554)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!807526 (= res!551107 (and (= lt!361619 lt!361623) (= lt!361623 (Found!8554 j!153)) (= (select (arr!21007 a!3170) index!1236) (select (arr!21007 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43870 (_ BitVec 32)) SeekEntryResult!8554)

(assert (=> b!807526 (= lt!361623 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21007 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43870 (_ BitVec 32)) SeekEntryResult!8554)

(assert (=> b!807526 (= lt!361619 (seekEntryOrOpen!0 (select (arr!21007 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807527 () Bool)

(declare-fun res!551101 () Bool)

(assert (=> b!807527 (=> (not res!551101) (not e!447256))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!807527 (= res!551101 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21427 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21007 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21427 a!3170)) (= (select (arr!21007 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807528 () Bool)

(declare-fun res!551109 () Bool)

(assert (=> b!807528 (=> (not res!551109) (not e!447254))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807528 (= res!551109 (validKeyInArray!0 k0!2044))))

(declare-fun b!807529 () Bool)

(declare-fun res!551102 () Bool)

(assert (=> b!807529 (=> (not res!551102) (not e!447254))))

(assert (=> b!807529 (= res!551102 (validKeyInArray!0 (select (arr!21007 a!3170) j!153)))))

(declare-fun b!807530 () Bool)

(declare-fun res!551104 () Bool)

(assert (=> b!807530 (=> (not res!551104) (not e!447254))))

(declare-fun arrayContainsKey!0 (array!43870 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807530 (= res!551104 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!551103 () Bool)

(assert (=> start!69338 (=> (not res!551103) (not e!447254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69338 (= res!551103 (validMask!0 mask!3266))))

(assert (=> start!69338 e!447254))

(assert (=> start!69338 true))

(declare-fun array_inv!16866 (array!43870) Bool)

(assert (=> start!69338 (array_inv!16866 a!3170)))

(declare-fun b!807531 () Bool)

(assert (=> b!807531 (= e!447254 e!447256)))

(declare-fun res!551108 () Bool)

(assert (=> b!807531 (=> (not res!551108) (not e!447256))))

(declare-fun lt!361620 () SeekEntryResult!8554)

(assert (=> b!807531 (= res!551108 (or (= lt!361620 (MissingZero!8554 i!1163)) (= lt!361620 (MissingVacant!8554 i!1163))))))

(assert (=> b!807531 (= lt!361620 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!807532 () Bool)

(assert (=> b!807532 (= e!447253 (not true))))

(declare-fun lt!361621 () SeekEntryResult!8554)

(assert (=> b!807532 (= lt!361621 (Found!8554 index!1236))))

(declare-fun b!807533 () Bool)

(assert (=> b!807533 (= e!447256 e!447252)))

(declare-fun res!551105 () Bool)

(assert (=> b!807533 (=> (not res!551105) (not e!447252))))

(declare-fun lt!361624 () SeekEntryResult!8554)

(assert (=> b!807533 (= res!551105 (= lt!361624 lt!361621))))

(declare-fun lt!361625 () (_ BitVec 64))

(declare-fun lt!361622 () array!43870)

(assert (=> b!807533 (= lt!361621 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361625 lt!361622 mask!3266))))

(assert (=> b!807533 (= lt!361624 (seekEntryOrOpen!0 lt!361625 lt!361622 mask!3266))))

(assert (=> b!807533 (= lt!361625 (select (store (arr!21007 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!807533 (= lt!361622 (array!43871 (store (arr!21007 a!3170) i!1163 k0!2044) (size!21427 a!3170)))))

(declare-fun b!807534 () Bool)

(declare-fun res!551100 () Bool)

(assert (=> b!807534 (=> (not res!551100) (not e!447256))))

(declare-datatypes ((List!14877 0))(
  ( (Nil!14874) (Cons!14873 (h!16008 (_ BitVec 64)) (t!21184 List!14877)) )
))
(declare-fun arrayNoDuplicates!0 (array!43870 (_ BitVec 32) List!14877) Bool)

(assert (=> b!807534 (= res!551100 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14874))))

(assert (= (and start!69338 res!551103) b!807525))

(assert (= (and b!807525 res!551099) b!807529))

(assert (= (and b!807529 res!551102) b!807528))

(assert (= (and b!807528 res!551109) b!807530))

(assert (= (and b!807530 res!551104) b!807531))

(assert (= (and b!807531 res!551108) b!807524))

(assert (= (and b!807524 res!551106) b!807534))

(assert (= (and b!807534 res!551100) b!807527))

(assert (= (and b!807527 res!551101) b!807533))

(assert (= (and b!807533 res!551105) b!807526))

(assert (= (and b!807526 res!551107) b!807532))

(declare-fun m!749833 () Bool)

(assert (=> b!807529 m!749833))

(assert (=> b!807529 m!749833))

(declare-fun m!749835 () Bool)

(assert (=> b!807529 m!749835))

(declare-fun m!749837 () Bool)

(assert (=> b!807534 m!749837))

(declare-fun m!749839 () Bool)

(assert (=> start!69338 m!749839))

(declare-fun m!749841 () Bool)

(assert (=> start!69338 m!749841))

(declare-fun m!749843 () Bool)

(assert (=> b!807527 m!749843))

(declare-fun m!749845 () Bool)

(assert (=> b!807527 m!749845))

(declare-fun m!749847 () Bool)

(assert (=> b!807533 m!749847))

(declare-fun m!749849 () Bool)

(assert (=> b!807533 m!749849))

(declare-fun m!749851 () Bool)

(assert (=> b!807533 m!749851))

(declare-fun m!749853 () Bool)

(assert (=> b!807533 m!749853))

(declare-fun m!749855 () Bool)

(assert (=> b!807531 m!749855))

(declare-fun m!749857 () Bool)

(assert (=> b!807526 m!749857))

(assert (=> b!807526 m!749833))

(assert (=> b!807526 m!749833))

(declare-fun m!749859 () Bool)

(assert (=> b!807526 m!749859))

(assert (=> b!807526 m!749833))

(declare-fun m!749861 () Bool)

(assert (=> b!807526 m!749861))

(declare-fun m!749863 () Bool)

(assert (=> b!807530 m!749863))

(declare-fun m!749865 () Bool)

(assert (=> b!807524 m!749865))

(declare-fun m!749867 () Bool)

(assert (=> b!807528 m!749867))

(check-sat (not b!807531) (not b!807534) (not b!807526) (not b!807529) (not start!69338) (not b!807528) (not b!807533) (not b!807530) (not b!807524))
(check-sat)
