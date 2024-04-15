; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68430 () Bool)

(assert start!68430)

(declare-fun b!795395 () Bool)

(declare-fun e!441431 () Bool)

(declare-fun e!441430 () Bool)

(assert (=> b!795395 (= e!441431 e!441430)))

(declare-fun res!540060 () Bool)

(assert (=> b!795395 (=> (not res!540060) (not e!441430))))

(declare-datatypes ((SeekEntryResult!8287 0))(
  ( (MissingZero!8287 (index!35516 (_ BitVec 32))) (Found!8287 (index!35517 (_ BitVec 32))) (Intermediate!8287 (undefined!9099 Bool) (index!35518 (_ BitVec 32)) (x!66440 (_ BitVec 32))) (Undefined!8287) (MissingVacant!8287 (index!35519 (_ BitVec 32))) )
))
(declare-fun lt!354437 () SeekEntryResult!8287)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!795395 (= res!540060 (or (= lt!354437 (MissingZero!8287 i!1163)) (= lt!354437 (MissingVacant!8287 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43237 0))(
  ( (array!43238 (arr!20699 (Array (_ BitVec 32) (_ BitVec 64))) (size!21120 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43237)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43237 (_ BitVec 32)) SeekEntryResult!8287)

(assert (=> b!795395 (= lt!354437 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!795396 () Bool)

(declare-fun res!540061 () Bool)

(assert (=> b!795396 (=> (not res!540061) (not e!441430))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!795396 (= res!540061 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21120 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20699 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21120 a!3170)) (= (select (arr!20699 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795397 () Bool)

(declare-fun res!540055 () Bool)

(assert (=> b!795397 (=> (not res!540055) (not e!441431))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!795397 (= res!540055 (and (= (size!21120 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21120 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21120 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795398 () Bool)

(declare-fun e!441432 () Bool)

(assert (=> b!795398 (= e!441432 false)))

(declare-fun lt!354440 () SeekEntryResult!8287)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43237 (_ BitVec 32)) SeekEntryResult!8287)

(assert (=> b!795398 (= lt!354440 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20699 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354436 () SeekEntryResult!8287)

(assert (=> b!795398 (= lt!354436 (seekEntryOrOpen!0 (select (arr!20699 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!540056 () Bool)

(assert (=> start!68430 (=> (not res!540056) (not e!441431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68430 (= res!540056 (validMask!0 mask!3266))))

(assert (=> start!68430 e!441431))

(assert (=> start!68430 true))

(declare-fun array_inv!16582 (array!43237) Bool)

(assert (=> start!68430 (array_inv!16582 a!3170)))

(declare-fun b!795399 () Bool)

(declare-fun res!540057 () Bool)

(assert (=> b!795399 (=> (not res!540057) (not e!441430))))

(declare-datatypes ((List!14701 0))(
  ( (Nil!14698) (Cons!14697 (h!15826 (_ BitVec 64)) (t!21007 List!14701)) )
))
(declare-fun arrayNoDuplicates!0 (array!43237 (_ BitVec 32) List!14701) Bool)

(assert (=> b!795399 (= res!540057 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14698))))

(declare-fun b!795400 () Bool)

(declare-fun res!540058 () Bool)

(assert (=> b!795400 (=> (not res!540058) (not e!441431))))

(declare-fun arrayContainsKey!0 (array!43237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795400 (= res!540058 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795401 () Bool)

(declare-fun res!540063 () Bool)

(assert (=> b!795401 (=> (not res!540063) (not e!441430))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43237 (_ BitVec 32)) Bool)

(assert (=> b!795401 (= res!540063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795402 () Bool)

(declare-fun res!540059 () Bool)

(assert (=> b!795402 (=> (not res!540059) (not e!441431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795402 (= res!540059 (validKeyInArray!0 k0!2044))))

(declare-fun b!795403 () Bool)

(declare-fun res!540062 () Bool)

(assert (=> b!795403 (=> (not res!540062) (not e!441431))))

(assert (=> b!795403 (= res!540062 (validKeyInArray!0 (select (arr!20699 a!3170) j!153)))))

(declare-fun b!795404 () Bool)

(assert (=> b!795404 (= e!441430 e!441432)))

(declare-fun res!540054 () Bool)

(assert (=> b!795404 (=> (not res!540054) (not e!441432))))

(declare-fun lt!354438 () array!43237)

(declare-fun lt!354439 () (_ BitVec 64))

(assert (=> b!795404 (= res!540054 (= (seekEntryOrOpen!0 lt!354439 lt!354438 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354439 lt!354438 mask!3266)))))

(assert (=> b!795404 (= lt!354439 (select (store (arr!20699 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795404 (= lt!354438 (array!43238 (store (arr!20699 a!3170) i!1163 k0!2044) (size!21120 a!3170)))))

(assert (= (and start!68430 res!540056) b!795397))

(assert (= (and b!795397 res!540055) b!795403))

(assert (= (and b!795403 res!540062) b!795402))

(assert (= (and b!795402 res!540059) b!795400))

(assert (= (and b!795400 res!540058) b!795395))

(assert (= (and b!795395 res!540060) b!795401))

(assert (= (and b!795401 res!540063) b!795399))

(assert (= (and b!795399 res!540057) b!795396))

(assert (= (and b!795396 res!540061) b!795404))

(assert (= (and b!795404 res!540054) b!795398))

(declare-fun m!735577 () Bool)

(assert (=> b!795400 m!735577))

(declare-fun m!735579 () Bool)

(assert (=> b!795396 m!735579))

(declare-fun m!735581 () Bool)

(assert (=> b!795396 m!735581))

(declare-fun m!735583 () Bool)

(assert (=> b!795402 m!735583))

(declare-fun m!735585 () Bool)

(assert (=> b!795404 m!735585))

(declare-fun m!735587 () Bool)

(assert (=> b!795404 m!735587))

(declare-fun m!735589 () Bool)

(assert (=> b!795404 m!735589))

(declare-fun m!735591 () Bool)

(assert (=> b!795404 m!735591))

(declare-fun m!735593 () Bool)

(assert (=> b!795398 m!735593))

(assert (=> b!795398 m!735593))

(declare-fun m!735595 () Bool)

(assert (=> b!795398 m!735595))

(assert (=> b!795398 m!735593))

(declare-fun m!735597 () Bool)

(assert (=> b!795398 m!735597))

(declare-fun m!735599 () Bool)

(assert (=> b!795395 m!735599))

(declare-fun m!735601 () Bool)

(assert (=> start!68430 m!735601))

(declare-fun m!735603 () Bool)

(assert (=> start!68430 m!735603))

(declare-fun m!735605 () Bool)

(assert (=> b!795401 m!735605))

(assert (=> b!795403 m!735593))

(assert (=> b!795403 m!735593))

(declare-fun m!735607 () Bool)

(assert (=> b!795403 m!735607))

(declare-fun m!735609 () Bool)

(assert (=> b!795399 m!735609))

(check-sat (not b!795401) (not b!795400) (not b!795402) (not b!795399) (not b!795395) (not b!795398) (not start!68430) (not b!795404) (not b!795403))
(check-sat)
