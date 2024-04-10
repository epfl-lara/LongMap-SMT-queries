; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68776 () Bool)

(assert start!68776)

(declare-fun b!801459 () Bool)

(declare-fun e!444261 () Bool)

(declare-fun e!444265 () Bool)

(assert (=> b!801459 (= e!444261 e!444265)))

(declare-fun res!545981 () Bool)

(assert (=> b!801459 (=> (not res!545981) (not e!444265))))

(declare-datatypes ((array!43566 0))(
  ( (array!43567 (arr!20863 (Array (_ BitVec 32) (_ BitVec 64))) (size!21284 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43566)

(declare-datatypes ((SeekEntryResult!8454 0))(
  ( (MissingZero!8454 (index!36184 (_ BitVec 32))) (Found!8454 (index!36185 (_ BitVec 32))) (Intermediate!8454 (undefined!9266 Bool) (index!36186 (_ BitVec 32)) (x!67044 (_ BitVec 32))) (Undefined!8454) (MissingVacant!8454 (index!36187 (_ BitVec 32))) )
))
(declare-fun lt!358236 () SeekEntryResult!8454)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!358234 () SeekEntryResult!8454)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!801459 (= res!545981 (and (= lt!358236 lt!358234) (= lt!358234 (Found!8454 j!153)) (not (= (select (arr!20863 a!3170) index!1236) (select (arr!20863 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43566 (_ BitVec 32)) SeekEntryResult!8454)

(assert (=> b!801459 (= lt!358234 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20863 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43566 (_ BitVec 32)) SeekEntryResult!8454)

(assert (=> b!801459 (= lt!358236 (seekEntryOrOpen!0 (select (arr!20863 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801461 () Bool)

(declare-fun res!545987 () Bool)

(declare-fun e!444263 () Bool)

(assert (=> b!801461 (=> (not res!545987) (not e!444263))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801461 (= res!545987 (validKeyInArray!0 k0!2044))))

(declare-fun b!801462 () Bool)

(declare-fun res!545979 () Bool)

(assert (=> b!801462 (=> (not res!545979) (not e!444263))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!801462 (= res!545979 (and (= (size!21284 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21284 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21284 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801463 () Bool)

(declare-fun res!545982 () Bool)

(declare-fun e!444266 () Bool)

(assert (=> b!801463 (=> (not res!545982) (not e!444266))))

(declare-fun lt!358238 () array!43566)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!358235 () SeekEntryResult!8454)

(declare-fun lt!358237 () (_ BitVec 32))

(declare-fun lt!358240 () (_ BitVec 64))

(assert (=> b!801463 (= res!545982 (= lt!358235 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358237 vacantAfter!23 lt!358240 lt!358238 mask!3266)))))

(declare-fun b!801464 () Bool)

(assert (=> b!801464 (= e!444265 e!444266)))

(declare-fun res!545985 () Bool)

(assert (=> b!801464 (=> (not res!545985) (not e!444266))))

(assert (=> b!801464 (= res!545985 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!358237 #b00000000000000000000000000000000) (bvslt lt!358237 (size!21284 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801464 (= lt!358237 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801465 () Bool)

(declare-fun res!545980 () Bool)

(assert (=> b!801465 (=> (not res!545980) (not e!444263))))

(assert (=> b!801465 (= res!545980 (validKeyInArray!0 (select (arr!20863 a!3170) j!153)))))

(declare-fun b!801466 () Bool)

(assert (=> b!801466 (= e!444266 false)))

(declare-fun lt!358241 () SeekEntryResult!8454)

(assert (=> b!801466 (= lt!358241 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358237 vacantBefore!23 (select (arr!20863 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801467 () Bool)

(declare-fun e!444262 () Bool)

(assert (=> b!801467 (= e!444262 e!444261)))

(declare-fun res!545978 () Bool)

(assert (=> b!801467 (=> (not res!545978) (not e!444261))))

(assert (=> b!801467 (= res!545978 (= lt!358235 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358240 lt!358238 mask!3266)))))

(assert (=> b!801467 (= lt!358235 (seekEntryOrOpen!0 lt!358240 lt!358238 mask!3266))))

(assert (=> b!801467 (= lt!358240 (select (store (arr!20863 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801467 (= lt!358238 (array!43567 (store (arr!20863 a!3170) i!1163 k0!2044) (size!21284 a!3170)))))

(declare-fun b!801468 () Bool)

(assert (=> b!801468 (= e!444263 e!444262)))

(declare-fun res!545990 () Bool)

(assert (=> b!801468 (=> (not res!545990) (not e!444262))))

(declare-fun lt!358239 () SeekEntryResult!8454)

(assert (=> b!801468 (= res!545990 (or (= lt!358239 (MissingZero!8454 i!1163)) (= lt!358239 (MissingVacant!8454 i!1163))))))

(assert (=> b!801468 (= lt!358239 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!801469 () Bool)

(declare-fun res!545988 () Bool)

(assert (=> b!801469 (=> (not res!545988) (not e!444262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43566 (_ BitVec 32)) Bool)

(assert (=> b!801469 (= res!545988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801470 () Bool)

(declare-fun res!545986 () Bool)

(assert (=> b!801470 (=> (not res!545986) (not e!444263))))

(declare-fun arrayContainsKey!0 (array!43566 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801470 (= res!545986 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801471 () Bool)

(declare-fun res!545989 () Bool)

(assert (=> b!801471 (=> (not res!545989) (not e!444262))))

(declare-datatypes ((List!14826 0))(
  ( (Nil!14823) (Cons!14822 (h!15951 (_ BitVec 64)) (t!21141 List!14826)) )
))
(declare-fun arrayNoDuplicates!0 (array!43566 (_ BitVec 32) List!14826) Bool)

(assert (=> b!801471 (= res!545989 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14823))))

(declare-fun res!545984 () Bool)

(assert (=> start!68776 (=> (not res!545984) (not e!444263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68776 (= res!545984 (validMask!0 mask!3266))))

(assert (=> start!68776 e!444263))

(assert (=> start!68776 true))

(declare-fun array_inv!16659 (array!43566) Bool)

(assert (=> start!68776 (array_inv!16659 a!3170)))

(declare-fun b!801460 () Bool)

(declare-fun res!545983 () Bool)

(assert (=> b!801460 (=> (not res!545983) (not e!444262))))

(assert (=> b!801460 (= res!545983 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21284 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20863 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21284 a!3170)) (= (select (arr!20863 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68776 res!545984) b!801462))

(assert (= (and b!801462 res!545979) b!801465))

(assert (= (and b!801465 res!545980) b!801461))

(assert (= (and b!801461 res!545987) b!801470))

(assert (= (and b!801470 res!545986) b!801468))

(assert (= (and b!801468 res!545990) b!801469))

(assert (= (and b!801469 res!545988) b!801471))

(assert (= (and b!801471 res!545989) b!801460))

(assert (= (and b!801460 res!545983) b!801467))

(assert (= (and b!801467 res!545978) b!801459))

(assert (= (and b!801459 res!545981) b!801464))

(assert (= (and b!801464 res!545985) b!801463))

(assert (= (and b!801463 res!545982) b!801466))

(declare-fun m!742625 () Bool)

(assert (=> b!801463 m!742625))

(declare-fun m!742627 () Bool)

(assert (=> b!801467 m!742627))

(declare-fun m!742629 () Bool)

(assert (=> b!801467 m!742629))

(declare-fun m!742631 () Bool)

(assert (=> b!801467 m!742631))

(declare-fun m!742633 () Bool)

(assert (=> b!801467 m!742633))

(declare-fun m!742635 () Bool)

(assert (=> b!801466 m!742635))

(assert (=> b!801466 m!742635))

(declare-fun m!742637 () Bool)

(assert (=> b!801466 m!742637))

(assert (=> b!801465 m!742635))

(assert (=> b!801465 m!742635))

(declare-fun m!742639 () Bool)

(assert (=> b!801465 m!742639))

(declare-fun m!742641 () Bool)

(assert (=> b!801461 m!742641))

(declare-fun m!742643 () Bool)

(assert (=> b!801460 m!742643))

(declare-fun m!742645 () Bool)

(assert (=> b!801460 m!742645))

(declare-fun m!742647 () Bool)

(assert (=> b!801469 m!742647))

(declare-fun m!742649 () Bool)

(assert (=> b!801459 m!742649))

(assert (=> b!801459 m!742635))

(assert (=> b!801459 m!742635))

(declare-fun m!742651 () Bool)

(assert (=> b!801459 m!742651))

(assert (=> b!801459 m!742635))

(declare-fun m!742653 () Bool)

(assert (=> b!801459 m!742653))

(declare-fun m!742655 () Bool)

(assert (=> start!68776 m!742655))

(declare-fun m!742657 () Bool)

(assert (=> start!68776 m!742657))

(declare-fun m!742659 () Bool)

(assert (=> b!801470 m!742659))

(declare-fun m!742661 () Bool)

(assert (=> b!801464 m!742661))

(declare-fun m!742663 () Bool)

(assert (=> b!801468 m!742663))

(declare-fun m!742665 () Bool)

(assert (=> b!801471 m!742665))

(check-sat (not b!801459) (not b!801468) (not b!801466) (not b!801465) (not start!68776) (not b!801467) (not b!801470) (not b!801471) (not b!801463) (not b!801469) (not b!801464) (not b!801461))
(check-sat)
