; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68868 () Bool)

(assert start!68868)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun e!445002 () Bool)

(declare-datatypes ((SeekEntryResult!8500 0))(
  ( (MissingZero!8500 (index!36368 (_ BitVec 32))) (Found!8500 (index!36369 (_ BitVec 32))) (Intermediate!8500 (undefined!9312 Bool) (index!36370 (_ BitVec 32)) (x!67210 (_ BitVec 32))) (Undefined!8500) (MissingVacant!8500 (index!36371 (_ BitVec 32))) )
))
(declare-fun lt!359296 () SeekEntryResult!8500)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun b!803038 () Bool)

(declare-fun lt!359292 () SeekEntryResult!8500)

(assert (=> b!803038 (= e!445002 (not (or (not (= lt!359296 lt!359292)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun lt!359298 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43658 0))(
  ( (array!43659 (arr!20909 (Array (_ BitVec 32) (_ BitVec 64))) (size!21330 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43658)

(declare-fun lt!359294 () (_ BitVec 64))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun lt!359299 () array!43658)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43658 (_ BitVec 32)) SeekEntryResult!8500)

(assert (=> b!803038 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359298 vacantAfter!23 lt!359294 lt!359299 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359298 vacantBefore!23 (select (arr!20909 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27540 0))(
  ( (Unit!27541) )
))
(declare-fun lt!359293 () Unit!27540)

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43658 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27540)

(assert (=> b!803038 (= lt!359293 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!359298 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803038 (= lt!359298 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803039 () Bool)

(declare-fun res!547559 () Bool)

(declare-fun e!445000 () Bool)

(assert (=> b!803039 (=> (not res!547559) (not e!445000))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43658 (_ BitVec 32)) Bool)

(assert (=> b!803039 (= res!547559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!547558 () Bool)

(declare-fun e!444999 () Bool)

(assert (=> start!68868 (=> (not res!547558) (not e!444999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68868 (= res!547558 (validMask!0 mask!3266))))

(assert (=> start!68868 e!444999))

(assert (=> start!68868 true))

(declare-fun array_inv!16705 (array!43658) Bool)

(assert (=> start!68868 (array_inv!16705 a!3170)))

(declare-fun b!803040 () Bool)

(declare-fun e!445003 () Bool)

(assert (=> b!803040 (= e!445003 e!445002)))

(declare-fun res!547568 () Bool)

(assert (=> b!803040 (=> (not res!547568) (not e!445002))))

(declare-fun lt!359297 () SeekEntryResult!8500)

(assert (=> b!803040 (= res!547568 (and (= lt!359297 lt!359292) (not (= (select (arr!20909 a!3170) index!1236) (select (arr!20909 a!3170) j!153)))))))

(assert (=> b!803040 (= lt!359292 (Found!8500 j!153))))

(declare-fun b!803041 () Bool)

(declare-fun res!547564 () Bool)

(assert (=> b!803041 (=> (not res!547564) (not e!444999))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803041 (= res!547564 (validKeyInArray!0 k!2044))))

(declare-fun b!803042 () Bool)

(declare-fun res!547563 () Bool)

(assert (=> b!803042 (=> (not res!547563) (not e!444999))))

(assert (=> b!803042 (= res!547563 (validKeyInArray!0 (select (arr!20909 a!3170) j!153)))))

(declare-fun b!803043 () Bool)

(declare-fun res!547566 () Bool)

(assert (=> b!803043 (=> (not res!547566) (not e!445000))))

(assert (=> b!803043 (= res!547566 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21330 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20909 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21330 a!3170)) (= (select (arr!20909 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803044 () Bool)

(declare-fun e!445004 () Bool)

(assert (=> b!803044 (= e!445000 e!445004)))

(declare-fun res!547560 () Bool)

(assert (=> b!803044 (=> (not res!547560) (not e!445004))))

(declare-fun lt!359300 () SeekEntryResult!8500)

(assert (=> b!803044 (= res!547560 (= lt!359300 lt!359296))))

(assert (=> b!803044 (= lt!359296 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359294 lt!359299 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43658 (_ BitVec 32)) SeekEntryResult!8500)

(assert (=> b!803044 (= lt!359300 (seekEntryOrOpen!0 lt!359294 lt!359299 mask!3266))))

(assert (=> b!803044 (= lt!359294 (select (store (arr!20909 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!803044 (= lt!359299 (array!43659 (store (arr!20909 a!3170) i!1163 k!2044) (size!21330 a!3170)))))

(declare-fun b!803045 () Bool)

(assert (=> b!803045 (= e!445004 e!445003)))

(declare-fun res!547557 () Bool)

(assert (=> b!803045 (=> (not res!547557) (not e!445003))))

(declare-fun lt!359295 () SeekEntryResult!8500)

(assert (=> b!803045 (= res!547557 (= lt!359295 lt!359297))))

(assert (=> b!803045 (= lt!359297 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20909 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803045 (= lt!359295 (seekEntryOrOpen!0 (select (arr!20909 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803046 () Bool)

(assert (=> b!803046 (= e!444999 e!445000)))

(declare-fun res!547567 () Bool)

(assert (=> b!803046 (=> (not res!547567) (not e!445000))))

(declare-fun lt!359291 () SeekEntryResult!8500)

(assert (=> b!803046 (= res!547567 (or (= lt!359291 (MissingZero!8500 i!1163)) (= lt!359291 (MissingVacant!8500 i!1163))))))

(assert (=> b!803046 (= lt!359291 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!803047 () Bool)

(declare-fun res!547565 () Bool)

(assert (=> b!803047 (=> (not res!547565) (not e!444999))))

(assert (=> b!803047 (= res!547565 (and (= (size!21330 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21330 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21330 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803048 () Bool)

(declare-fun res!547562 () Bool)

(assert (=> b!803048 (=> (not res!547562) (not e!445000))))

(declare-datatypes ((List!14872 0))(
  ( (Nil!14869) (Cons!14868 (h!15997 (_ BitVec 64)) (t!21187 List!14872)) )
))
(declare-fun arrayNoDuplicates!0 (array!43658 (_ BitVec 32) List!14872) Bool)

(assert (=> b!803048 (= res!547562 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14869))))

(declare-fun b!803049 () Bool)

(declare-fun res!547561 () Bool)

(assert (=> b!803049 (=> (not res!547561) (not e!444999))))

(declare-fun arrayContainsKey!0 (array!43658 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803049 (= res!547561 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68868 res!547558) b!803047))

(assert (= (and b!803047 res!547565) b!803042))

(assert (= (and b!803042 res!547563) b!803041))

(assert (= (and b!803041 res!547564) b!803049))

(assert (= (and b!803049 res!547561) b!803046))

(assert (= (and b!803046 res!547567) b!803039))

(assert (= (and b!803039 res!547559) b!803048))

(assert (= (and b!803048 res!547562) b!803043))

(assert (= (and b!803043 res!547566) b!803044))

(assert (= (and b!803044 res!547560) b!803045))

(assert (= (and b!803045 res!547557) b!803040))

(assert (= (and b!803040 res!547568) b!803038))

(declare-fun m!744657 () Bool)

(assert (=> b!803045 m!744657))

(assert (=> b!803045 m!744657))

(declare-fun m!744659 () Bool)

(assert (=> b!803045 m!744659))

(assert (=> b!803045 m!744657))

(declare-fun m!744661 () Bool)

(assert (=> b!803045 m!744661))

(declare-fun m!744663 () Bool)

(assert (=> b!803039 m!744663))

(declare-fun m!744665 () Bool)

(assert (=> b!803040 m!744665))

(assert (=> b!803040 m!744657))

(assert (=> b!803042 m!744657))

(assert (=> b!803042 m!744657))

(declare-fun m!744667 () Bool)

(assert (=> b!803042 m!744667))

(assert (=> b!803038 m!744657))

(declare-fun m!744669 () Bool)

(assert (=> b!803038 m!744669))

(assert (=> b!803038 m!744657))

(declare-fun m!744671 () Bool)

(assert (=> b!803038 m!744671))

(declare-fun m!744673 () Bool)

(assert (=> b!803038 m!744673))

(declare-fun m!744675 () Bool)

(assert (=> b!803038 m!744675))

(declare-fun m!744677 () Bool)

(assert (=> b!803043 m!744677))

(declare-fun m!744679 () Bool)

(assert (=> b!803043 m!744679))

(declare-fun m!744681 () Bool)

(assert (=> b!803048 m!744681))

(declare-fun m!744683 () Bool)

(assert (=> start!68868 m!744683))

(declare-fun m!744685 () Bool)

(assert (=> start!68868 m!744685))

(declare-fun m!744687 () Bool)

(assert (=> b!803041 m!744687))

(declare-fun m!744689 () Bool)

(assert (=> b!803044 m!744689))

(declare-fun m!744691 () Bool)

(assert (=> b!803044 m!744691))

(declare-fun m!744693 () Bool)

(assert (=> b!803044 m!744693))

(declare-fun m!744695 () Bool)

(assert (=> b!803044 m!744695))

(declare-fun m!744697 () Bool)

(assert (=> b!803046 m!744697))

(declare-fun m!744699 () Bool)

(assert (=> b!803049 m!744699))

(push 1)

(assert (not b!803042))

(assert (not b!803039))

(assert (not b!803048))

(assert (not b!803044))

(assert (not b!803045))

(assert (not b!803046))

(assert (not start!68868))

(assert (not b!803041))

(assert (not b!803049))

(assert (not b!803038))

(check-sat)

(pop 1)

(push 1)

(check-sat)

