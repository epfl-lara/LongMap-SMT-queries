; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68634 () Bool)

(assert start!68634)

(declare-fun b!797261 () Bool)

(declare-fun e!442431 () Bool)

(declare-fun e!442432 () Bool)

(assert (=> b!797261 (= e!442431 e!442432)))

(declare-fun res!541415 () Bool)

(assert (=> b!797261 (=> (not res!541415) (not e!442432))))

(declare-datatypes ((SeekEntryResult!8272 0))(
  ( (MissingZero!8272 (index!35456 (_ BitVec 32))) (Found!8272 (index!35457 (_ BitVec 32))) (Intermediate!8272 (undefined!9084 Bool) (index!35458 (_ BitVec 32)) (x!66521 (_ BitVec 32))) (Undefined!8272) (MissingVacant!8272 (index!35459 (_ BitVec 32))) )
))
(declare-fun lt!355515 () SeekEntryResult!8272)

(declare-datatypes ((array!43298 0))(
  ( (array!43299 (arr!20725 (Array (_ BitVec 32) (_ BitVec 64))) (size!21145 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43298)

(declare-fun lt!355511 () SeekEntryResult!8272)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!797261 (= res!541415 (and (= lt!355511 lt!355515) (= lt!355515 (Found!8272 j!153)) (= (select (arr!20725 a!3170) index!1236) (select (arr!20725 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43298 (_ BitVec 32)) SeekEntryResult!8272)

(assert (=> b!797261 (= lt!355515 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20725 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43298 (_ BitVec 32)) SeekEntryResult!8272)

(assert (=> b!797261 (= lt!355511 (seekEntryOrOpen!0 (select (arr!20725 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797262 () Bool)

(declare-fun res!541407 () Bool)

(declare-fun e!442435 () Bool)

(assert (=> b!797262 (=> (not res!541407) (not e!442435))))

(declare-datatypes ((List!14595 0))(
  ( (Nil!14592) (Cons!14591 (h!15726 (_ BitVec 64)) (t!20902 List!14595)) )
))
(declare-fun arrayNoDuplicates!0 (array!43298 (_ BitVec 32) List!14595) Bool)

(assert (=> b!797262 (= res!541407 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14592))))

(declare-fun b!797263 () Bool)

(declare-fun res!541411 () Bool)

(assert (=> b!797263 (=> (not res!541411) (not e!442435))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!797263 (= res!541411 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21145 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20725 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21145 a!3170)) (= (select (arr!20725 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797264 () Bool)

(declare-fun res!541412 () Bool)

(assert (=> b!797264 (=> (not res!541412) (not e!442435))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43298 (_ BitVec 32)) Bool)

(assert (=> b!797264 (= res!541412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!541409 () Bool)

(declare-fun e!442433 () Bool)

(assert (=> start!68634 (=> (not res!541409) (not e!442433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68634 (= res!541409 (validMask!0 mask!3266))))

(assert (=> start!68634 e!442433))

(assert (=> start!68634 true))

(declare-fun array_inv!16584 (array!43298) Bool)

(assert (=> start!68634 (array_inv!16584 a!3170)))

(declare-fun b!797265 () Bool)

(assert (=> b!797265 (= e!442433 e!442435)))

(declare-fun res!541416 () Bool)

(assert (=> b!797265 (=> (not res!541416) (not e!442435))))

(declare-fun lt!355514 () SeekEntryResult!8272)

(assert (=> b!797265 (= res!541416 (or (= lt!355514 (MissingZero!8272 i!1163)) (= lt!355514 (MissingVacant!8272 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!797265 (= lt!355514 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!797266 () Bool)

(assert (=> b!797266 (= e!442432 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20725 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!355513 () SeekEntryResult!8272)

(assert (=> b!797266 (= lt!355513 (Found!8272 index!1236))))

(declare-fun b!797267 () Bool)

(declare-fun res!541408 () Bool)

(assert (=> b!797267 (=> (not res!541408) (not e!442433))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797267 (= res!541408 (validKeyInArray!0 (select (arr!20725 a!3170) j!153)))))

(declare-fun b!797268 () Bool)

(declare-fun res!541410 () Bool)

(assert (=> b!797268 (=> (not res!541410) (not e!442433))))

(assert (=> b!797268 (= res!541410 (and (= (size!21145 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21145 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21145 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797269 () Bool)

(declare-fun res!541406 () Bool)

(assert (=> b!797269 (=> (not res!541406) (not e!442433))))

(assert (=> b!797269 (= res!541406 (validKeyInArray!0 k0!2044))))

(declare-fun b!797270 () Bool)

(declare-fun res!541413 () Bool)

(assert (=> b!797270 (=> (not res!541413) (not e!442433))))

(declare-fun arrayContainsKey!0 (array!43298 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797270 (= res!541413 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797271 () Bool)

(assert (=> b!797271 (= e!442435 e!442431)))

(declare-fun res!541414 () Bool)

(assert (=> b!797271 (=> (not res!541414) (not e!442431))))

(declare-fun lt!355510 () SeekEntryResult!8272)

(assert (=> b!797271 (= res!541414 (= lt!355510 lt!355513))))

(declare-fun lt!355512 () (_ BitVec 64))

(declare-fun lt!355516 () array!43298)

(assert (=> b!797271 (= lt!355513 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355512 lt!355516 mask!3266))))

(assert (=> b!797271 (= lt!355510 (seekEntryOrOpen!0 lt!355512 lt!355516 mask!3266))))

(assert (=> b!797271 (= lt!355512 (select (store (arr!20725 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797271 (= lt!355516 (array!43299 (store (arr!20725 a!3170) i!1163 k0!2044) (size!21145 a!3170)))))

(assert (= (and start!68634 res!541409) b!797268))

(assert (= (and b!797268 res!541410) b!797267))

(assert (= (and b!797267 res!541408) b!797269))

(assert (= (and b!797269 res!541406) b!797270))

(assert (= (and b!797270 res!541413) b!797265))

(assert (= (and b!797265 res!541416) b!797264))

(assert (= (and b!797264 res!541412) b!797262))

(assert (= (and b!797262 res!541407) b!797263))

(assert (= (and b!797263 res!541411) b!797271))

(assert (= (and b!797271 res!541414) b!797261))

(assert (= (and b!797261 res!541415) b!797266))

(declare-fun m!738491 () Bool)

(assert (=> b!797269 m!738491))

(declare-fun m!738493 () Bool)

(assert (=> b!797261 m!738493))

(declare-fun m!738495 () Bool)

(assert (=> b!797261 m!738495))

(assert (=> b!797261 m!738495))

(declare-fun m!738497 () Bool)

(assert (=> b!797261 m!738497))

(assert (=> b!797261 m!738495))

(declare-fun m!738499 () Bool)

(assert (=> b!797261 m!738499))

(declare-fun m!738501 () Bool)

(assert (=> b!797266 m!738501))

(declare-fun m!738503 () Bool)

(assert (=> b!797266 m!738503))

(declare-fun m!738505 () Bool)

(assert (=> b!797262 m!738505))

(declare-fun m!738507 () Bool)

(assert (=> b!797264 m!738507))

(declare-fun m!738509 () Bool)

(assert (=> b!797265 m!738509))

(declare-fun m!738511 () Bool)

(assert (=> b!797263 m!738511))

(declare-fun m!738513 () Bool)

(assert (=> b!797263 m!738513))

(declare-fun m!738515 () Bool)

(assert (=> start!68634 m!738515))

(declare-fun m!738517 () Bool)

(assert (=> start!68634 m!738517))

(declare-fun m!738519 () Bool)

(assert (=> b!797270 m!738519))

(assert (=> b!797267 m!738495))

(assert (=> b!797267 m!738495))

(declare-fun m!738521 () Bool)

(assert (=> b!797267 m!738521))

(declare-fun m!738523 () Bool)

(assert (=> b!797271 m!738523))

(declare-fun m!738525 () Bool)

(assert (=> b!797271 m!738525))

(assert (=> b!797271 m!738501))

(declare-fun m!738527 () Bool)

(assert (=> b!797271 m!738527))

(check-sat (not b!797265) (not b!797271) (not b!797269) (not b!797262) (not b!797267) (not b!797261) (not start!68634) (not b!797270) (not b!797264))
(check-sat)
