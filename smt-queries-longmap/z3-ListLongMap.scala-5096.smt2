; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69350 () Bool)

(assert start!69350)

(declare-fun b!807724 () Bool)

(declare-fun res!551306 () Bool)

(declare-fun e!447347 () Bool)

(assert (=> b!807724 (=> (not res!551306) (not e!447347))))

(declare-datatypes ((array!43882 0))(
  ( (array!43883 (arr!21013 (Array (_ BitVec 32) (_ BitVec 64))) (size!21433 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43882)

(declare-datatypes ((List!14883 0))(
  ( (Nil!14880) (Cons!14879 (h!16014 (_ BitVec 64)) (t!21190 List!14883)) )
))
(declare-fun arrayNoDuplicates!0 (array!43882 (_ BitVec 32) List!14883) Bool)

(assert (=> b!807724 (= res!551306 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14880))))

(declare-fun b!807725 () Bool)

(declare-fun res!551300 () Bool)

(declare-fun e!447344 () Bool)

(assert (=> b!807725 (=> (not res!551300) (not e!447344))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807725 (= res!551300 (validKeyInArray!0 k0!2044))))

(declare-fun res!551299 () Bool)

(assert (=> start!69350 (=> (not res!551299) (not e!447344))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69350 (= res!551299 (validMask!0 mask!3266))))

(assert (=> start!69350 e!447344))

(assert (=> start!69350 true))

(declare-fun array_inv!16872 (array!43882) Bool)

(assert (=> start!69350 (array_inv!16872 a!3170)))

(declare-fun b!807726 () Bool)

(declare-fun res!551308 () Bool)

(assert (=> b!807726 (=> (not res!551308) (not e!447347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43882 (_ BitVec 32)) Bool)

(assert (=> b!807726 (= res!551308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807727 () Bool)

(declare-fun e!447346 () Bool)

(declare-fun e!447348 () Bool)

(assert (=> b!807727 (= e!447346 e!447348)))

(declare-fun res!551307 () Bool)

(assert (=> b!807727 (=> (not res!551307) (not e!447348))))

(declare-datatypes ((SeekEntryResult!8560 0))(
  ( (MissingZero!8560 (index!36608 (_ BitVec 32))) (Found!8560 (index!36609 (_ BitVec 32))) (Intermediate!8560 (undefined!9372 Bool) (index!36610 (_ BitVec 32)) (x!67586 (_ BitVec 32))) (Undefined!8560) (MissingVacant!8560 (index!36611 (_ BitVec 32))) )
))
(declare-fun lt!361751 () SeekEntryResult!8560)

(declare-fun lt!361749 () SeekEntryResult!8560)

(assert (=> b!807727 (= res!551307 (= lt!361751 lt!361749))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43882 (_ BitVec 32)) SeekEntryResult!8560)

(assert (=> b!807727 (= lt!361749 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21013 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43882 (_ BitVec 32)) SeekEntryResult!8560)

(assert (=> b!807727 (= lt!361751 (seekEntryOrOpen!0 (select (arr!21013 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807728 () Bool)

(assert (=> b!807728 (= e!447347 e!447346)))

(declare-fun res!551309 () Bool)

(assert (=> b!807728 (=> (not res!551309) (not e!447346))))

(declare-fun lt!361752 () SeekEntryResult!8560)

(declare-fun lt!361753 () SeekEntryResult!8560)

(assert (=> b!807728 (= res!551309 (= lt!361752 lt!361753))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!361748 () array!43882)

(declare-fun lt!361750 () (_ BitVec 64))

(assert (=> b!807728 (= lt!361753 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361750 lt!361748 mask!3266))))

(assert (=> b!807728 (= lt!361752 (seekEntryOrOpen!0 lt!361750 lt!361748 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!807728 (= lt!361750 (select (store (arr!21013 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!807728 (= lt!361748 (array!43883 (store (arr!21013 a!3170) i!1163 k0!2044) (size!21433 a!3170)))))

(declare-fun b!807729 () Bool)

(declare-fun lt!361754 () SeekEntryResult!8560)

(declare-fun e!447349 () Bool)

(assert (=> b!807729 (= e!447349 (not (or (not (= lt!361753 lt!361754)) (= lt!361753 lt!361749))))))

(assert (=> b!807729 (= lt!361753 (Found!8560 index!1236))))

(declare-fun b!807730 () Bool)

(declare-fun res!551304 () Bool)

(assert (=> b!807730 (=> (not res!551304) (not e!447344))))

(declare-fun arrayContainsKey!0 (array!43882 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807730 (= res!551304 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807731 () Bool)

(assert (=> b!807731 (= e!447344 e!447347)))

(declare-fun res!551310 () Bool)

(assert (=> b!807731 (=> (not res!551310) (not e!447347))))

(declare-fun lt!361747 () SeekEntryResult!8560)

(assert (=> b!807731 (= res!551310 (or (= lt!361747 (MissingZero!8560 i!1163)) (= lt!361747 (MissingVacant!8560 i!1163))))))

(assert (=> b!807731 (= lt!361747 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!807732 () Bool)

(declare-fun res!551302 () Bool)

(assert (=> b!807732 (=> (not res!551302) (not e!447344))))

(assert (=> b!807732 (= res!551302 (validKeyInArray!0 (select (arr!21013 a!3170) j!153)))))

(declare-fun b!807733 () Bool)

(declare-fun res!551301 () Bool)

(assert (=> b!807733 (=> (not res!551301) (not e!447344))))

(assert (=> b!807733 (= res!551301 (and (= (size!21433 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21433 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21433 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807734 () Bool)

(declare-fun res!551305 () Bool)

(assert (=> b!807734 (=> (not res!551305) (not e!447347))))

(assert (=> b!807734 (= res!551305 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21433 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21013 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21433 a!3170)) (= (select (arr!21013 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807735 () Bool)

(assert (=> b!807735 (= e!447348 e!447349)))

(declare-fun res!551303 () Bool)

(assert (=> b!807735 (=> (not res!551303) (not e!447349))))

(assert (=> b!807735 (= res!551303 (and (= lt!361749 lt!361754) (= (select (arr!21013 a!3170) index!1236) (select (arr!21013 a!3170) j!153))))))

(assert (=> b!807735 (= lt!361754 (Found!8560 j!153))))

(assert (= (and start!69350 res!551299) b!807733))

(assert (= (and b!807733 res!551301) b!807732))

(assert (= (and b!807732 res!551302) b!807725))

(assert (= (and b!807725 res!551300) b!807730))

(assert (= (and b!807730 res!551304) b!807731))

(assert (= (and b!807731 res!551310) b!807726))

(assert (= (and b!807726 res!551308) b!807724))

(assert (= (and b!807724 res!551306) b!807734))

(assert (= (and b!807734 res!551305) b!807728))

(assert (= (and b!807728 res!551309) b!807727))

(assert (= (and b!807727 res!551307) b!807735))

(assert (= (and b!807735 res!551303) b!807729))

(declare-fun m!750049 () Bool)

(assert (=> start!69350 m!750049))

(declare-fun m!750051 () Bool)

(assert (=> start!69350 m!750051))

(declare-fun m!750053 () Bool)

(assert (=> b!807725 m!750053))

(declare-fun m!750055 () Bool)

(assert (=> b!807730 m!750055))

(declare-fun m!750057 () Bool)

(assert (=> b!807727 m!750057))

(assert (=> b!807727 m!750057))

(declare-fun m!750059 () Bool)

(assert (=> b!807727 m!750059))

(assert (=> b!807727 m!750057))

(declare-fun m!750061 () Bool)

(assert (=> b!807727 m!750061))

(declare-fun m!750063 () Bool)

(assert (=> b!807734 m!750063))

(declare-fun m!750065 () Bool)

(assert (=> b!807734 m!750065))

(declare-fun m!750067 () Bool)

(assert (=> b!807728 m!750067))

(declare-fun m!750069 () Bool)

(assert (=> b!807728 m!750069))

(declare-fun m!750071 () Bool)

(assert (=> b!807728 m!750071))

(declare-fun m!750073 () Bool)

(assert (=> b!807728 m!750073))

(declare-fun m!750075 () Bool)

(assert (=> b!807724 m!750075))

(declare-fun m!750077 () Bool)

(assert (=> b!807726 m!750077))

(declare-fun m!750079 () Bool)

(assert (=> b!807731 m!750079))

(assert (=> b!807732 m!750057))

(assert (=> b!807732 m!750057))

(declare-fun m!750081 () Bool)

(assert (=> b!807732 m!750081))

(declare-fun m!750083 () Bool)

(assert (=> b!807735 m!750083))

(assert (=> b!807735 m!750057))

(check-sat (not b!807726) (not b!807730) (not b!807728) (not b!807725) (not b!807732) (not b!807727) (not b!807731) (not b!807724) (not start!69350))
(check-sat)
