; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68884 () Bool)

(assert start!68884)

(declare-fun b!803330 () Bool)

(declare-fun e!445150 () Bool)

(declare-fun e!445148 () Bool)

(assert (=> b!803330 (= e!445150 e!445148)))

(declare-fun res!547858 () Bool)

(assert (=> b!803330 (=> (not res!547858) (not e!445148))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43674 0))(
  ( (array!43675 (arr!20917 (Array (_ BitVec 32) (_ BitVec 64))) (size!21338 (_ BitVec 32))) )
))
(declare-fun lt!359519 () array!43674)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!359522 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8508 0))(
  ( (MissingZero!8508 (index!36400 (_ BitVec 32))) (Found!8508 (index!36401 (_ BitVec 32))) (Intermediate!8508 (undefined!9320 Bool) (index!36402 (_ BitVec 32)) (x!67242 (_ BitVec 32))) (Undefined!8508) (MissingVacant!8508 (index!36403 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43674 (_ BitVec 32)) SeekEntryResult!8508)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43674 (_ BitVec 32)) SeekEntryResult!8508)

(assert (=> b!803330 (= res!547858 (= (seekEntryOrOpen!0 lt!359522 lt!359519 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359522 lt!359519 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43674)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!803330 (= lt!359522 (select (store (arr!20917 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!803330 (= lt!359519 (array!43675 (store (arr!20917 a!3170) i!1163 k0!2044) (size!21338 a!3170)))))

(declare-fun b!803331 () Bool)

(declare-fun e!445149 () Bool)

(assert (=> b!803331 (= e!445148 e!445149)))

(declare-fun res!547857 () Bool)

(assert (=> b!803331 (=> (not res!547857) (not e!445149))))

(declare-fun lt!359521 () SeekEntryResult!8508)

(declare-fun lt!359518 () SeekEntryResult!8508)

(assert (=> b!803331 (= res!547857 (and (= lt!359518 lt!359521) (= lt!359521 (Found!8508 j!153)) (not (= (select (arr!20917 a!3170) index!1236) (select (arr!20917 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!803331 (= lt!359521 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20917 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803331 (= lt!359518 (seekEntryOrOpen!0 (select (arr!20917 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803332 () Bool)

(assert (=> b!803332 (= e!445149 (not true))))

(declare-fun lt!359520 () (_ BitVec 32))

(assert (=> b!803332 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359520 vacantAfter!23 lt!359522 lt!359519 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359520 vacantBefore!23 (select (arr!20917 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27556 0))(
  ( (Unit!27557) )
))
(declare-fun lt!359516 () Unit!27556)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43674 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27556)

(assert (=> b!803332 (= lt!359516 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359520 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803332 (= lt!359520 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803333 () Bool)

(declare-fun res!547856 () Bool)

(assert (=> b!803333 (=> (not res!547856) (not e!445150))))

(declare-datatypes ((List!14880 0))(
  ( (Nil!14877) (Cons!14876 (h!16005 (_ BitVec 64)) (t!21195 List!14880)) )
))
(declare-fun arrayNoDuplicates!0 (array!43674 (_ BitVec 32) List!14880) Bool)

(assert (=> b!803333 (= res!547856 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14877))))

(declare-fun b!803334 () Bool)

(declare-fun res!547854 () Bool)

(assert (=> b!803334 (=> (not res!547854) (not e!445150))))

(assert (=> b!803334 (= res!547854 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21338 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20917 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21338 a!3170)) (= (select (arr!20917 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803335 () Bool)

(declare-fun res!547850 () Bool)

(declare-fun e!445147 () Bool)

(assert (=> b!803335 (=> (not res!547850) (not e!445147))))

(declare-fun arrayContainsKey!0 (array!43674 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803335 (= res!547850 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803336 () Bool)

(declare-fun res!547859 () Bool)

(assert (=> b!803336 (=> (not res!547859) (not e!445147))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803336 (= res!547859 (validKeyInArray!0 k0!2044))))

(declare-fun res!547855 () Bool)

(assert (=> start!68884 (=> (not res!547855) (not e!445147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68884 (= res!547855 (validMask!0 mask!3266))))

(assert (=> start!68884 e!445147))

(assert (=> start!68884 true))

(declare-fun array_inv!16713 (array!43674) Bool)

(assert (=> start!68884 (array_inv!16713 a!3170)))

(declare-fun b!803337 () Bool)

(assert (=> b!803337 (= e!445147 e!445150)))

(declare-fun res!547852 () Bool)

(assert (=> b!803337 (=> (not res!547852) (not e!445150))))

(declare-fun lt!359517 () SeekEntryResult!8508)

(assert (=> b!803337 (= res!547852 (or (= lt!359517 (MissingZero!8508 i!1163)) (= lt!359517 (MissingVacant!8508 i!1163))))))

(assert (=> b!803337 (= lt!359517 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!803338 () Bool)

(declare-fun res!547849 () Bool)

(assert (=> b!803338 (=> (not res!547849) (not e!445147))))

(assert (=> b!803338 (= res!547849 (validKeyInArray!0 (select (arr!20917 a!3170) j!153)))))

(declare-fun b!803339 () Bool)

(declare-fun res!547853 () Bool)

(assert (=> b!803339 (=> (not res!547853) (not e!445150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43674 (_ BitVec 32)) Bool)

(assert (=> b!803339 (= res!547853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803340 () Bool)

(declare-fun res!547851 () Bool)

(assert (=> b!803340 (=> (not res!547851) (not e!445147))))

(assert (=> b!803340 (= res!547851 (and (= (size!21338 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21338 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21338 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68884 res!547855) b!803340))

(assert (= (and b!803340 res!547851) b!803338))

(assert (= (and b!803338 res!547849) b!803336))

(assert (= (and b!803336 res!547859) b!803335))

(assert (= (and b!803335 res!547850) b!803337))

(assert (= (and b!803337 res!547852) b!803339))

(assert (= (and b!803339 res!547853) b!803333))

(assert (= (and b!803333 res!547856) b!803334))

(assert (= (and b!803334 res!547854) b!803330))

(assert (= (and b!803330 res!547858) b!803331))

(assert (= (and b!803331 res!547857) b!803332))

(declare-fun m!745027 () Bool)

(assert (=> b!803331 m!745027))

(declare-fun m!745029 () Bool)

(assert (=> b!803331 m!745029))

(assert (=> b!803331 m!745029))

(declare-fun m!745031 () Bool)

(assert (=> b!803331 m!745031))

(assert (=> b!803331 m!745029))

(declare-fun m!745033 () Bool)

(assert (=> b!803331 m!745033))

(declare-fun m!745035 () Bool)

(assert (=> b!803336 m!745035))

(declare-fun m!745037 () Bool)

(assert (=> b!803333 m!745037))

(declare-fun m!745039 () Bool)

(assert (=> b!803332 m!745039))

(declare-fun m!745041 () Bool)

(assert (=> b!803332 m!745041))

(assert (=> b!803332 m!745029))

(declare-fun m!745043 () Bool)

(assert (=> b!803332 m!745043))

(declare-fun m!745045 () Bool)

(assert (=> b!803332 m!745045))

(assert (=> b!803332 m!745029))

(declare-fun m!745047 () Bool)

(assert (=> b!803334 m!745047))

(declare-fun m!745049 () Bool)

(assert (=> b!803334 m!745049))

(declare-fun m!745051 () Bool)

(assert (=> b!803335 m!745051))

(declare-fun m!745053 () Bool)

(assert (=> b!803330 m!745053))

(declare-fun m!745055 () Bool)

(assert (=> b!803330 m!745055))

(declare-fun m!745057 () Bool)

(assert (=> b!803330 m!745057))

(declare-fun m!745059 () Bool)

(assert (=> b!803330 m!745059))

(assert (=> b!803338 m!745029))

(assert (=> b!803338 m!745029))

(declare-fun m!745061 () Bool)

(assert (=> b!803338 m!745061))

(declare-fun m!745063 () Bool)

(assert (=> b!803339 m!745063))

(declare-fun m!745065 () Bool)

(assert (=> b!803337 m!745065))

(declare-fun m!745067 () Bool)

(assert (=> start!68884 m!745067))

(declare-fun m!745069 () Bool)

(assert (=> start!68884 m!745069))

(check-sat (not b!803331) (not b!803336) (not b!803333) (not b!803339) (not b!803338) (not b!803332) (not b!803337) (not start!68884) (not b!803335) (not b!803330))
(check-sat)
