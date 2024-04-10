; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68812 () Bool)

(assert start!68812)

(declare-fun res!546598 () Bool)

(declare-fun e!444546 () Bool)

(assert (=> start!68812 (=> (not res!546598) (not e!444546))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68812 (= res!546598 (validMask!0 mask!3266))))

(assert (=> start!68812 e!444546))

(assert (=> start!68812 true))

(declare-datatypes ((array!43602 0))(
  ( (array!43603 (arr!20881 (Array (_ BitVec 32) (_ BitVec 64))) (size!21302 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43602)

(declare-fun array_inv!16677 (array!43602) Bool)

(assert (=> start!68812 (array_inv!16677 a!3170)))

(declare-fun b!802079 () Bool)

(declare-fun res!546605 () Bool)

(declare-fun e!444545 () Bool)

(assert (=> b!802079 (=> (not res!546605) (not e!444545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43602 (_ BitVec 32)) Bool)

(assert (=> b!802079 (= res!546605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802080 () Bool)

(assert (=> b!802080 (= e!444546 e!444545)))

(declare-fun res!546599 () Bool)

(assert (=> b!802080 (=> (not res!546599) (not e!444545))))

(declare-datatypes ((SeekEntryResult!8472 0))(
  ( (MissingZero!8472 (index!36256 (_ BitVec 32))) (Found!8472 (index!36257 (_ BitVec 32))) (Intermediate!8472 (undefined!9284 Bool) (index!36258 (_ BitVec 32)) (x!67110 (_ BitVec 32))) (Undefined!8472) (MissingVacant!8472 (index!36259 (_ BitVec 32))) )
))
(declare-fun lt!358629 () SeekEntryResult!8472)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!802080 (= res!546599 (or (= lt!358629 (MissingZero!8472 i!1163)) (= lt!358629 (MissingVacant!8472 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43602 (_ BitVec 32)) SeekEntryResult!8472)

(assert (=> b!802080 (= lt!358629 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!802081 () Bool)

(declare-fun res!546604 () Bool)

(assert (=> b!802081 (=> (not res!546604) (not e!444546))))

(declare-fun arrayContainsKey!0 (array!43602 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802081 (= res!546604 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802082 () Bool)

(declare-fun res!546608 () Bool)

(assert (=> b!802082 (=> (not res!546608) (not e!444545))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!802082 (= res!546608 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21302 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20881 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21302 a!3170)) (= (select (arr!20881 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802083 () Bool)

(declare-fun e!444547 () Bool)

(declare-fun e!444544 () Bool)

(assert (=> b!802083 (= e!444547 e!444544)))

(declare-fun res!546603 () Bool)

(assert (=> b!802083 (=> (not res!546603) (not e!444544))))

(declare-fun lt!358630 () SeekEntryResult!8472)

(declare-fun lt!358627 () SeekEntryResult!8472)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!802083 (= res!546603 (and (= lt!358627 lt!358630) (= lt!358630 (Found!8472 j!153)) (not (= (select (arr!20881 a!3170) index!1236) (select (arr!20881 a!3170) j!153)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43602 (_ BitVec 32)) SeekEntryResult!8472)

(assert (=> b!802083 (= lt!358630 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20881 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802083 (= lt!358627 (seekEntryOrOpen!0 (select (arr!20881 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802084 () Bool)

(declare-fun res!546600 () Bool)

(assert (=> b!802084 (=> (not res!546600) (not e!444546))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802084 (= res!546600 (validKeyInArray!0 k0!2044))))

(declare-fun b!802085 () Bool)

(declare-fun res!546607 () Bool)

(assert (=> b!802085 (=> (not res!546607) (not e!444546))))

(assert (=> b!802085 (= res!546607 (validKeyInArray!0 (select (arr!20881 a!3170) j!153)))))

(declare-fun b!802086 () Bool)

(declare-fun res!546606 () Bool)

(assert (=> b!802086 (=> (not res!546606) (not e!444545))))

(declare-datatypes ((List!14844 0))(
  ( (Nil!14841) (Cons!14840 (h!15969 (_ BitVec 64)) (t!21159 List!14844)) )
))
(declare-fun arrayNoDuplicates!0 (array!43602 (_ BitVec 32) List!14844) Bool)

(assert (=> b!802086 (= res!546606 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14841))))

(declare-fun b!802087 () Bool)

(assert (=> b!802087 (= e!444544 (not true))))

(declare-fun lt!358631 () (_ BitVec 64))

(declare-fun lt!358625 () (_ BitVec 32))

(declare-fun lt!358628 () array!43602)

(assert (=> b!802087 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358625 vacantAfter!23 lt!358631 lt!358628 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358625 vacantBefore!23 (select (arr!20881 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27484 0))(
  ( (Unit!27485) )
))
(declare-fun lt!358626 () Unit!27484)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43602 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27484)

(assert (=> b!802087 (= lt!358626 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358625 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802087 (= lt!358625 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802088 () Bool)

(assert (=> b!802088 (= e!444545 e!444547)))

(declare-fun res!546601 () Bool)

(assert (=> b!802088 (=> (not res!546601) (not e!444547))))

(assert (=> b!802088 (= res!546601 (= (seekEntryOrOpen!0 lt!358631 lt!358628 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358631 lt!358628 mask!3266)))))

(assert (=> b!802088 (= lt!358631 (select (store (arr!20881 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!802088 (= lt!358628 (array!43603 (store (arr!20881 a!3170) i!1163 k0!2044) (size!21302 a!3170)))))

(declare-fun b!802089 () Bool)

(declare-fun res!546602 () Bool)

(assert (=> b!802089 (=> (not res!546602) (not e!444546))))

(assert (=> b!802089 (= res!546602 (and (= (size!21302 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21302 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21302 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68812 res!546598) b!802089))

(assert (= (and b!802089 res!546602) b!802085))

(assert (= (and b!802085 res!546607) b!802084))

(assert (= (and b!802084 res!546600) b!802081))

(assert (= (and b!802081 res!546604) b!802080))

(assert (= (and b!802080 res!546599) b!802079))

(assert (= (and b!802079 res!546605) b!802086))

(assert (= (and b!802086 res!546606) b!802082))

(assert (= (and b!802082 res!546608) b!802088))

(assert (= (and b!802088 res!546601) b!802083))

(assert (= (and b!802083 res!546603) b!802087))

(declare-fun m!743407 () Bool)

(assert (=> b!802080 m!743407))

(declare-fun m!743409 () Bool)

(assert (=> b!802086 m!743409))

(declare-fun m!743411 () Bool)

(assert (=> b!802079 m!743411))

(declare-fun m!743413 () Bool)

(assert (=> b!802083 m!743413))

(declare-fun m!743415 () Bool)

(assert (=> b!802083 m!743415))

(assert (=> b!802083 m!743415))

(declare-fun m!743417 () Bool)

(assert (=> b!802083 m!743417))

(assert (=> b!802083 m!743415))

(declare-fun m!743419 () Bool)

(assert (=> b!802083 m!743419))

(declare-fun m!743421 () Bool)

(assert (=> b!802081 m!743421))

(assert (=> b!802085 m!743415))

(assert (=> b!802085 m!743415))

(declare-fun m!743423 () Bool)

(assert (=> b!802085 m!743423))

(declare-fun m!743425 () Bool)

(assert (=> start!68812 m!743425))

(declare-fun m!743427 () Bool)

(assert (=> start!68812 m!743427))

(declare-fun m!743429 () Bool)

(assert (=> b!802082 m!743429))

(declare-fun m!743431 () Bool)

(assert (=> b!802082 m!743431))

(assert (=> b!802087 m!743415))

(declare-fun m!743433 () Bool)

(assert (=> b!802087 m!743433))

(declare-fun m!743435 () Bool)

(assert (=> b!802087 m!743435))

(declare-fun m!743437 () Bool)

(assert (=> b!802087 m!743437))

(assert (=> b!802087 m!743415))

(declare-fun m!743439 () Bool)

(assert (=> b!802087 m!743439))

(declare-fun m!743441 () Bool)

(assert (=> b!802084 m!743441))

(declare-fun m!743443 () Bool)

(assert (=> b!802088 m!743443))

(declare-fun m!743445 () Bool)

(assert (=> b!802088 m!743445))

(declare-fun m!743447 () Bool)

(assert (=> b!802088 m!743447))

(declare-fun m!743449 () Bool)

(assert (=> b!802088 m!743449))

(check-sat (not b!802081) (not start!68812) (not b!802088) (not b!802087) (not b!802084) (not b!802080) (not b!802085) (not b!802079) (not b!802083) (not b!802086))
(check-sat)
