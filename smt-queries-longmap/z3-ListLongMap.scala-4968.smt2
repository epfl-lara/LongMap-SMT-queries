; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68298 () Bool)

(assert start!68298)

(declare-fun b!793449 () Bool)

(declare-fun e!440700 () Bool)

(declare-fun e!440701 () Bool)

(assert (=> b!793449 (= e!440700 e!440701)))

(declare-fun res!538108 () Bool)

(assert (=> b!793449 (=> (not res!538108) (not e!440701))))

(declare-datatypes ((SeekEntryResult!8221 0))(
  ( (MissingZero!8221 (index!35252 (_ BitVec 32))) (Found!8221 (index!35253 (_ BitVec 32))) (Intermediate!8221 (undefined!9033 Bool) (index!35254 (_ BitVec 32)) (x!66198 (_ BitVec 32))) (Undefined!8221) (MissingVacant!8221 (index!35255 (_ BitVec 32))) )
))
(declare-fun lt!353554 () SeekEntryResult!8221)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!793449 (= res!538108 (or (= lt!353554 (MissingZero!8221 i!1163)) (= lt!353554 (MissingVacant!8221 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43105 0))(
  ( (array!43106 (arr!20633 (Array (_ BitVec 32) (_ BitVec 64))) (size!21054 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43105)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43105 (_ BitVec 32)) SeekEntryResult!8221)

(assert (=> b!793449 (= lt!353554 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!793450 () Bool)

(declare-fun res!538115 () Bool)

(assert (=> b!793450 (=> (not res!538115) (not e!440701))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793450 (= res!538115 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21054 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20633 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21054 a!3170)) (= (select (arr!20633 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!793451 () Bool)

(declare-fun res!538116 () Bool)

(assert (=> b!793451 (=> (not res!538116) (not e!440701))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43105 (_ BitVec 32)) Bool)

(assert (=> b!793451 (= res!538116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793452 () Bool)

(assert (=> b!793452 (= e!440701 false)))

(declare-fun lt!353558 () (_ BitVec 64))

(declare-fun lt!353557 () array!43105)

(declare-fun lt!353556 () SeekEntryResult!8221)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43105 (_ BitVec 32)) SeekEntryResult!8221)

(assert (=> b!793452 (= lt!353556 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353558 lt!353557 mask!3266))))

(declare-fun lt!353555 () SeekEntryResult!8221)

(assert (=> b!793452 (= lt!353555 (seekEntryOrOpen!0 lt!353558 lt!353557 mask!3266))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793452 (= lt!353558 (select (store (arr!20633 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!793452 (= lt!353557 (array!43106 (store (arr!20633 a!3170) i!1163 k0!2044) (size!21054 a!3170)))))

(declare-fun b!793453 () Bool)

(declare-fun res!538110 () Bool)

(assert (=> b!793453 (=> (not res!538110) (not e!440700))))

(assert (=> b!793453 (= res!538110 (and (= (size!21054 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21054 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21054 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793454 () Bool)

(declare-fun res!538114 () Bool)

(assert (=> b!793454 (=> (not res!538114) (not e!440700))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793454 (= res!538114 (validKeyInArray!0 (select (arr!20633 a!3170) j!153)))))

(declare-fun b!793456 () Bool)

(declare-fun res!538112 () Bool)

(assert (=> b!793456 (=> (not res!538112) (not e!440701))))

(declare-datatypes ((List!14635 0))(
  ( (Nil!14632) (Cons!14631 (h!15760 (_ BitVec 64)) (t!20941 List!14635)) )
))
(declare-fun arrayNoDuplicates!0 (array!43105 (_ BitVec 32) List!14635) Bool)

(assert (=> b!793456 (= res!538112 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14632))))

(declare-fun b!793457 () Bool)

(declare-fun res!538109 () Bool)

(assert (=> b!793457 (=> (not res!538109) (not e!440700))))

(declare-fun arrayContainsKey!0 (array!43105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793457 (= res!538109 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!538113 () Bool)

(assert (=> start!68298 (=> (not res!538113) (not e!440700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68298 (= res!538113 (validMask!0 mask!3266))))

(assert (=> start!68298 e!440700))

(assert (=> start!68298 true))

(declare-fun array_inv!16516 (array!43105) Bool)

(assert (=> start!68298 (array_inv!16516 a!3170)))

(declare-fun b!793455 () Bool)

(declare-fun res!538111 () Bool)

(assert (=> b!793455 (=> (not res!538111) (not e!440700))))

(assert (=> b!793455 (= res!538111 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68298 res!538113) b!793453))

(assert (= (and b!793453 res!538110) b!793454))

(assert (= (and b!793454 res!538114) b!793455))

(assert (= (and b!793455 res!538111) b!793457))

(assert (= (and b!793457 res!538109) b!793449))

(assert (= (and b!793449 res!538108) b!793451))

(assert (= (and b!793451 res!538116) b!793456))

(assert (= (and b!793456 res!538112) b!793450))

(assert (= (and b!793450 res!538115) b!793452))

(declare-fun m!733441 () Bool)

(assert (=> b!793454 m!733441))

(assert (=> b!793454 m!733441))

(declare-fun m!733443 () Bool)

(assert (=> b!793454 m!733443))

(declare-fun m!733445 () Bool)

(assert (=> b!793450 m!733445))

(declare-fun m!733447 () Bool)

(assert (=> b!793450 m!733447))

(declare-fun m!733449 () Bool)

(assert (=> b!793456 m!733449))

(declare-fun m!733451 () Bool)

(assert (=> b!793455 m!733451))

(declare-fun m!733453 () Bool)

(assert (=> b!793452 m!733453))

(declare-fun m!733455 () Bool)

(assert (=> b!793452 m!733455))

(declare-fun m!733457 () Bool)

(assert (=> b!793452 m!733457))

(declare-fun m!733459 () Bool)

(assert (=> b!793452 m!733459))

(declare-fun m!733461 () Bool)

(assert (=> b!793449 m!733461))

(declare-fun m!733463 () Bool)

(assert (=> start!68298 m!733463))

(declare-fun m!733465 () Bool)

(assert (=> start!68298 m!733465))

(declare-fun m!733467 () Bool)

(assert (=> b!793457 m!733467))

(declare-fun m!733469 () Bool)

(assert (=> b!793451 m!733469))

(check-sat (not b!793457) (not b!793451) (not start!68298) (not b!793452) (not b!793455) (not b!793449) (not b!793456) (not b!793454))
(check-sat)
