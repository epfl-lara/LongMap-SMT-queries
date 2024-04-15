; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68424 () Bool)

(assert start!68424)

(declare-fun b!795305 () Bool)

(declare-fun res!539966 () Bool)

(declare-fun e!441395 () Bool)

(assert (=> b!795305 (=> (not res!539966) (not e!441395))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43231 0))(
  ( (array!43232 (arr!20696 (Array (_ BitVec 32) (_ BitVec 64))) (size!21117 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43231)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!795305 (= res!539966 (and (= (size!21117 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21117 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21117 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795306 () Bool)

(declare-fun e!441396 () Bool)

(assert (=> b!795306 (= e!441395 e!441396)))

(declare-fun res!539967 () Bool)

(assert (=> b!795306 (=> (not res!539967) (not e!441396))))

(declare-datatypes ((SeekEntryResult!8284 0))(
  ( (MissingZero!8284 (index!35504 (_ BitVec 32))) (Found!8284 (index!35505 (_ BitVec 32))) (Intermediate!8284 (undefined!9096 Bool) (index!35506 (_ BitVec 32)) (x!66429 (_ BitVec 32))) (Undefined!8284) (MissingVacant!8284 (index!35507 (_ BitVec 32))) )
))
(declare-fun lt!354394 () SeekEntryResult!8284)

(assert (=> b!795306 (= res!539967 (or (= lt!354394 (MissingZero!8284 i!1163)) (= lt!354394 (MissingVacant!8284 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43231 (_ BitVec 32)) SeekEntryResult!8284)

(assert (=> b!795306 (= lt!354394 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!795307 () Bool)

(declare-fun res!539970 () Bool)

(assert (=> b!795307 (=> (not res!539970) (not e!441396))))

(declare-datatypes ((List!14698 0))(
  ( (Nil!14695) (Cons!14694 (h!15823 (_ BitVec 64)) (t!21004 List!14698)) )
))
(declare-fun arrayNoDuplicates!0 (array!43231 (_ BitVec 32) List!14698) Bool)

(assert (=> b!795307 (= res!539970 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14695))))

(declare-fun b!795308 () Bool)

(declare-fun res!539968 () Bool)

(assert (=> b!795308 (=> (not res!539968) (not e!441396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43231 (_ BitVec 32)) Bool)

(assert (=> b!795308 (= res!539968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795309 () Bool)

(declare-fun lt!354392 () SeekEntryResult!8284)

(declare-fun e!441394 () Bool)

(declare-fun lt!354395 () SeekEntryResult!8284)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!795309 (= e!441394 (and (= lt!354395 lt!354392) (= lt!354392 (Found!8284 j!153)) (= (select (arr!20696 a!3170) index!1236) (select (arr!20696 a!3170) j!153)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43231 (_ BitVec 32)) SeekEntryResult!8284)

(assert (=> b!795309 (= lt!354392 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20696 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!795309 (= lt!354395 (seekEntryOrOpen!0 (select (arr!20696 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795310 () Bool)

(declare-fun res!539964 () Bool)

(assert (=> b!795310 (=> (not res!539964) (not e!441395))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795310 (= res!539964 (validKeyInArray!0 (select (arr!20696 a!3170) j!153)))))

(declare-fun b!795311 () Bool)

(declare-fun res!539971 () Bool)

(assert (=> b!795311 (=> (not res!539971) (not e!441396))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!795311 (= res!539971 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21117 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20696 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21117 a!3170)) (= (select (arr!20696 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795312 () Bool)

(declare-fun res!539972 () Bool)

(assert (=> b!795312 (=> (not res!539972) (not e!441395))))

(assert (=> b!795312 (= res!539972 (validKeyInArray!0 k0!2044))))

(declare-fun res!539969 () Bool)

(assert (=> start!68424 (=> (not res!539969) (not e!441395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68424 (= res!539969 (validMask!0 mask!3266))))

(assert (=> start!68424 e!441395))

(assert (=> start!68424 true))

(declare-fun array_inv!16579 (array!43231) Bool)

(assert (=> start!68424 (array_inv!16579 a!3170)))

(declare-fun b!795313 () Bool)

(declare-fun res!539973 () Bool)

(assert (=> b!795313 (=> (not res!539973) (not e!441395))))

(declare-fun arrayContainsKey!0 (array!43231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795313 (= res!539973 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795314 () Bool)

(assert (=> b!795314 (= e!441396 e!441394)))

(declare-fun res!539965 () Bool)

(assert (=> b!795314 (=> (not res!539965) (not e!441394))))

(declare-fun lt!354391 () (_ BitVec 64))

(declare-fun lt!354393 () array!43231)

(assert (=> b!795314 (= res!539965 (= (seekEntryOrOpen!0 lt!354391 lt!354393 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354391 lt!354393 mask!3266)))))

(assert (=> b!795314 (= lt!354391 (select (store (arr!20696 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795314 (= lt!354393 (array!43232 (store (arr!20696 a!3170) i!1163 k0!2044) (size!21117 a!3170)))))

(assert (= (and start!68424 res!539969) b!795305))

(assert (= (and b!795305 res!539966) b!795310))

(assert (= (and b!795310 res!539964) b!795312))

(assert (= (and b!795312 res!539972) b!795313))

(assert (= (and b!795313 res!539973) b!795306))

(assert (= (and b!795306 res!539967) b!795308))

(assert (= (and b!795308 res!539968) b!795307))

(assert (= (and b!795307 res!539970) b!795311))

(assert (= (and b!795311 res!539971) b!795314))

(assert (= (and b!795314 res!539965) b!795309))

(declare-fun m!735469 () Bool)

(assert (=> b!795310 m!735469))

(assert (=> b!795310 m!735469))

(declare-fun m!735471 () Bool)

(assert (=> b!795310 m!735471))

(declare-fun m!735473 () Bool)

(assert (=> b!795313 m!735473))

(declare-fun m!735475 () Bool)

(assert (=> b!795307 m!735475))

(declare-fun m!735477 () Bool)

(assert (=> b!795311 m!735477))

(declare-fun m!735479 () Bool)

(assert (=> b!795311 m!735479))

(declare-fun m!735481 () Bool)

(assert (=> b!795314 m!735481))

(declare-fun m!735483 () Bool)

(assert (=> b!795314 m!735483))

(declare-fun m!735485 () Bool)

(assert (=> b!795314 m!735485))

(declare-fun m!735487 () Bool)

(assert (=> b!795314 m!735487))

(declare-fun m!735489 () Bool)

(assert (=> b!795308 m!735489))

(declare-fun m!735491 () Bool)

(assert (=> b!795312 m!735491))

(declare-fun m!735493 () Bool)

(assert (=> start!68424 m!735493))

(declare-fun m!735495 () Bool)

(assert (=> start!68424 m!735495))

(declare-fun m!735497 () Bool)

(assert (=> b!795306 m!735497))

(declare-fun m!735499 () Bool)

(assert (=> b!795309 m!735499))

(assert (=> b!795309 m!735469))

(assert (=> b!795309 m!735469))

(declare-fun m!735501 () Bool)

(assert (=> b!795309 m!735501))

(assert (=> b!795309 m!735469))

(declare-fun m!735503 () Bool)

(assert (=> b!795309 m!735503))

(check-sat (not b!795307) (not b!795314) (not b!795309) (not b!795308) (not b!795306) (not b!795310) (not b!795312) (not b!795313) (not start!68424))
(check-sat)
