; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68478 () Bool)

(assert start!68478)

(declare-fun res!540822 () Bool)

(declare-fun e!441765 () Bool)

(assert (=> start!68478 (=> (not res!540822) (not e!441765))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68478 (= res!540822 (validMask!0 mask!3266))))

(assert (=> start!68478 e!441765))

(assert (=> start!68478 true))

(declare-datatypes ((array!43285 0))(
  ( (array!43286 (arr!20723 (Array (_ BitVec 32) (_ BitVec 64))) (size!21144 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43285)

(declare-fun array_inv!16606 (array!43285) Bool)

(assert (=> start!68478 (array_inv!16606 a!3170)))

(declare-fun b!796162 () Bool)

(declare-fun res!540824 () Bool)

(declare-fun e!441767 () Bool)

(assert (=> b!796162 (=> (not res!540824) (not e!441767))))

(declare-datatypes ((List!14725 0))(
  ( (Nil!14722) (Cons!14721 (h!15850 (_ BitVec 64)) (t!21031 List!14725)) )
))
(declare-fun arrayNoDuplicates!0 (array!43285 (_ BitVec 32) List!14725) Bool)

(assert (=> b!796162 (= res!540824 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14722))))

(declare-fun b!796163 () Bool)

(declare-fun res!540831 () Bool)

(assert (=> b!796163 (=> (not res!540831) (not e!441765))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796163 (= res!540831 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796164 () Bool)

(declare-fun res!540826 () Bool)

(assert (=> b!796164 (=> (not res!540826) (not e!441767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43285 (_ BitVec 32)) Bool)

(assert (=> b!796164 (= res!540826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796165 () Bool)

(declare-fun res!540828 () Bool)

(assert (=> b!796165 (=> (not res!540828) (not e!441765))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796165 (= res!540828 (validKeyInArray!0 (select (arr!20723 a!3170) j!153)))))

(declare-fun b!796166 () Bool)

(declare-fun res!540830 () Bool)

(assert (=> b!796166 (=> (not res!540830) (not e!441767))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!796166 (= res!540830 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21144 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20723 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21144 a!3170)) (= (select (arr!20723 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796167 () Bool)

(assert (=> b!796167 (= e!441765 e!441767)))

(declare-fun res!540829 () Bool)

(assert (=> b!796167 (=> (not res!540829) (not e!441767))))

(declare-datatypes ((SeekEntryResult!8311 0))(
  ( (MissingZero!8311 (index!35612 (_ BitVec 32))) (Found!8311 (index!35613 (_ BitVec 32))) (Intermediate!8311 (undefined!9123 Bool) (index!35614 (_ BitVec 32)) (x!66528 (_ BitVec 32))) (Undefined!8311) (MissingVacant!8311 (index!35615 (_ BitVec 32))) )
))
(declare-fun lt!354878 () SeekEntryResult!8311)

(assert (=> b!796167 (= res!540829 (or (= lt!354878 (MissingZero!8311 i!1163)) (= lt!354878 (MissingVacant!8311 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43285 (_ BitVec 32)) SeekEntryResult!8311)

(assert (=> b!796167 (= lt!354878 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!796168 () Bool)

(declare-fun e!441768 () Bool)

(assert (=> b!796168 (= e!441768 (not true))))

(declare-fun lt!354875 () SeekEntryResult!8311)

(assert (=> b!796168 (= lt!354875 (Found!8311 index!1236))))

(declare-fun b!796169 () Bool)

(declare-fun res!540825 () Bool)

(assert (=> b!796169 (=> (not res!540825) (not e!441765))))

(assert (=> b!796169 (= res!540825 (and (= (size!21144 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21144 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21144 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796170 () Bool)

(declare-fun e!441766 () Bool)

(assert (=> b!796170 (= e!441766 e!441768)))

(declare-fun res!540827 () Bool)

(assert (=> b!796170 (=> (not res!540827) (not e!441768))))

(declare-fun lt!354873 () SeekEntryResult!8311)

(declare-fun lt!354872 () SeekEntryResult!8311)

(assert (=> b!796170 (= res!540827 (and (= lt!354873 lt!354872) (= lt!354872 (Found!8311 j!153)) (= (select (arr!20723 a!3170) index!1236) (select (arr!20723 a!3170) j!153))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43285 (_ BitVec 32)) SeekEntryResult!8311)

(assert (=> b!796170 (= lt!354872 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20723 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796170 (= lt!354873 (seekEntryOrOpen!0 (select (arr!20723 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796171 () Bool)

(declare-fun res!540823 () Bool)

(assert (=> b!796171 (=> (not res!540823) (not e!441765))))

(assert (=> b!796171 (= res!540823 (validKeyInArray!0 k0!2044))))

(declare-fun b!796172 () Bool)

(assert (=> b!796172 (= e!441767 e!441766)))

(declare-fun res!540821 () Bool)

(assert (=> b!796172 (=> (not res!540821) (not e!441766))))

(declare-fun lt!354877 () SeekEntryResult!8311)

(assert (=> b!796172 (= res!540821 (= lt!354877 lt!354875))))

(declare-fun lt!354876 () array!43285)

(declare-fun lt!354874 () (_ BitVec 64))

(assert (=> b!796172 (= lt!354875 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354874 lt!354876 mask!3266))))

(assert (=> b!796172 (= lt!354877 (seekEntryOrOpen!0 lt!354874 lt!354876 mask!3266))))

(assert (=> b!796172 (= lt!354874 (select (store (arr!20723 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796172 (= lt!354876 (array!43286 (store (arr!20723 a!3170) i!1163 k0!2044) (size!21144 a!3170)))))

(assert (= (and start!68478 res!540822) b!796169))

(assert (= (and b!796169 res!540825) b!796165))

(assert (= (and b!796165 res!540828) b!796171))

(assert (= (and b!796171 res!540823) b!796163))

(assert (= (and b!796163 res!540831) b!796167))

(assert (= (and b!796167 res!540829) b!796164))

(assert (= (and b!796164 res!540826) b!796162))

(assert (= (and b!796162 res!540824) b!796166))

(assert (= (and b!796166 res!540830) b!796172))

(assert (= (and b!796172 res!540821) b!796170))

(assert (= (and b!796170 res!540827) b!796168))

(declare-fun m!736453 () Bool)

(assert (=> b!796164 m!736453))

(declare-fun m!736455 () Bool)

(assert (=> b!796170 m!736455))

(declare-fun m!736457 () Bool)

(assert (=> b!796170 m!736457))

(assert (=> b!796170 m!736457))

(declare-fun m!736459 () Bool)

(assert (=> b!796170 m!736459))

(assert (=> b!796170 m!736457))

(declare-fun m!736461 () Bool)

(assert (=> b!796170 m!736461))

(declare-fun m!736463 () Bool)

(assert (=> b!796171 m!736463))

(assert (=> b!796165 m!736457))

(assert (=> b!796165 m!736457))

(declare-fun m!736465 () Bool)

(assert (=> b!796165 m!736465))

(declare-fun m!736467 () Bool)

(assert (=> b!796166 m!736467))

(declare-fun m!736469 () Bool)

(assert (=> b!796166 m!736469))

(declare-fun m!736471 () Bool)

(assert (=> b!796167 m!736471))

(declare-fun m!736473 () Bool)

(assert (=> b!796172 m!736473))

(declare-fun m!736475 () Bool)

(assert (=> b!796172 m!736475))

(declare-fun m!736477 () Bool)

(assert (=> b!796172 m!736477))

(declare-fun m!736479 () Bool)

(assert (=> b!796172 m!736479))

(declare-fun m!736481 () Bool)

(assert (=> start!68478 m!736481))

(declare-fun m!736483 () Bool)

(assert (=> start!68478 m!736483))

(declare-fun m!736485 () Bool)

(assert (=> b!796163 m!736485))

(declare-fun m!736487 () Bool)

(assert (=> b!796162 m!736487))

(check-sat (not b!796163) (not b!796164) (not b!796167) (not start!68478) (not b!796162) (not b!796171) (not b!796170) (not b!796172) (not b!796165))
(check-sat)
