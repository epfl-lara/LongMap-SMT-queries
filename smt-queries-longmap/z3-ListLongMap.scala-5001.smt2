; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68640 () Bool)

(assert start!68640)

(declare-fun b!797362 () Bool)

(declare-fun res!541516 () Bool)

(declare-fun e!442483 () Bool)

(assert (=> b!797362 (=> (not res!541516) (not e!442483))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797362 (= res!541516 (validKeyInArray!0 k0!2044))))

(declare-fun b!797363 () Bool)

(declare-fun e!442480 () Bool)

(declare-fun e!442479 () Bool)

(assert (=> b!797363 (= e!442480 e!442479)))

(declare-fun res!541512 () Bool)

(assert (=> b!797363 (=> (not res!541512) (not e!442479))))

(declare-datatypes ((SeekEntryResult!8275 0))(
  ( (MissingZero!8275 (index!35468 (_ BitVec 32))) (Found!8275 (index!35469 (_ BitVec 32))) (Intermediate!8275 (undefined!9087 Bool) (index!35470 (_ BitVec 32)) (x!66532 (_ BitVec 32))) (Undefined!8275) (MissingVacant!8275 (index!35471 (_ BitVec 32))) )
))
(declare-fun lt!355577 () SeekEntryResult!8275)

(declare-fun lt!355579 () SeekEntryResult!8275)

(assert (=> b!797363 (= res!541512 (= lt!355577 lt!355579))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43304 0))(
  ( (array!43305 (arr!20728 (Array (_ BitVec 32) (_ BitVec 64))) (size!21148 (_ BitVec 32))) )
))
(declare-fun lt!355576 () array!43304)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!355575 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43304 (_ BitVec 32)) SeekEntryResult!8275)

(assert (=> b!797363 (= lt!355579 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355575 lt!355576 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43304 (_ BitVec 32)) SeekEntryResult!8275)

(assert (=> b!797363 (= lt!355577 (seekEntryOrOpen!0 lt!355575 lt!355576 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43304)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!797363 (= lt!355575 (select (store (arr!20728 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797363 (= lt!355576 (array!43305 (store (arr!20728 a!3170) i!1163 k0!2044) (size!21148 a!3170)))))

(declare-fun res!541514 () Bool)

(assert (=> start!68640 (=> (not res!541514) (not e!442483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68640 (= res!541514 (validMask!0 mask!3266))))

(assert (=> start!68640 e!442483))

(assert (=> start!68640 true))

(declare-fun array_inv!16587 (array!43304) Bool)

(assert (=> start!68640 (array_inv!16587 a!3170)))

(declare-fun b!797364 () Bool)

(assert (=> b!797364 (= e!442483 e!442480)))

(declare-fun res!541513 () Bool)

(assert (=> b!797364 (=> (not res!541513) (not e!442480))))

(declare-fun lt!355578 () SeekEntryResult!8275)

(assert (=> b!797364 (= res!541513 (or (= lt!355578 (MissingZero!8275 i!1163)) (= lt!355578 (MissingVacant!8275 i!1163))))))

(assert (=> b!797364 (= lt!355578 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!797365 () Bool)

(declare-fun res!541510 () Bool)

(assert (=> b!797365 (=> (not res!541510) (not e!442480))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!797365 (= res!541510 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21148 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20728 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21148 a!3170)) (= (select (arr!20728 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797366 () Bool)

(declare-fun res!541518 () Bool)

(assert (=> b!797366 (=> (not res!541518) (not e!442483))))

(assert (=> b!797366 (= res!541518 (validKeyInArray!0 (select (arr!20728 a!3170) j!153)))))

(declare-fun b!797367 () Bool)

(declare-fun res!541507 () Bool)

(assert (=> b!797367 (=> (not res!541507) (not e!442483))))

(assert (=> b!797367 (= res!541507 (and (= (size!21148 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21148 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21148 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797368 () Bool)

(declare-fun e!442478 () Bool)

(declare-fun e!442481 () Bool)

(assert (=> b!797368 (= e!442478 (not e!442481))))

(declare-fun res!541515 () Bool)

(assert (=> b!797368 (=> res!541515 e!442481)))

(assert (=> b!797368 (= res!541515 (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20728 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!797368 (= lt!355579 (Found!8275 index!1236))))

(declare-fun b!797369 () Bool)

(declare-fun res!541509 () Bool)

(assert (=> b!797369 (=> (not res!541509) (not e!442480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43304 (_ BitVec 32)) Bool)

(assert (=> b!797369 (= res!541509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797370 () Bool)

(declare-fun res!541511 () Bool)

(assert (=> b!797370 (=> (not res!541511) (not e!442480))))

(declare-datatypes ((List!14598 0))(
  ( (Nil!14595) (Cons!14594 (h!15729 (_ BitVec 64)) (t!20905 List!14598)) )
))
(declare-fun arrayNoDuplicates!0 (array!43304 (_ BitVec 32) List!14598) Bool)

(assert (=> b!797370 (= res!541511 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14595))))

(declare-fun b!797371 () Bool)

(declare-fun res!541517 () Bool)

(assert (=> b!797371 (=> (not res!541517) (not e!442483))))

(declare-fun arrayContainsKey!0 (array!43304 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797371 (= res!541517 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797372 () Bool)

(assert (=> b!797372 (= e!442481 (validKeyInArray!0 lt!355575))))

(declare-fun b!797373 () Bool)

(assert (=> b!797373 (= e!442479 e!442478)))

(declare-fun res!541508 () Bool)

(assert (=> b!797373 (=> (not res!541508) (not e!442478))))

(declare-fun lt!355573 () SeekEntryResult!8275)

(declare-fun lt!355574 () SeekEntryResult!8275)

(assert (=> b!797373 (= res!541508 (and (= lt!355573 lt!355574) (= lt!355574 (Found!8275 j!153)) (= (select (arr!20728 a!3170) index!1236) (select (arr!20728 a!3170) j!153))))))

(assert (=> b!797373 (= lt!355574 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20728 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797373 (= lt!355573 (seekEntryOrOpen!0 (select (arr!20728 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68640 res!541514) b!797367))

(assert (= (and b!797367 res!541507) b!797366))

(assert (= (and b!797366 res!541518) b!797362))

(assert (= (and b!797362 res!541516) b!797371))

(assert (= (and b!797371 res!541517) b!797364))

(assert (= (and b!797364 res!541513) b!797369))

(assert (= (and b!797369 res!541509) b!797370))

(assert (= (and b!797370 res!541511) b!797365))

(assert (= (and b!797365 res!541510) b!797363))

(assert (= (and b!797363 res!541512) b!797373))

(assert (= (and b!797373 res!541508) b!797368))

(assert (= (and b!797368 (not res!541515)) b!797372))

(declare-fun m!738605 () Bool)

(assert (=> b!797371 m!738605))

(declare-fun m!738607 () Bool)

(assert (=> b!797365 m!738607))

(declare-fun m!738609 () Bool)

(assert (=> b!797365 m!738609))

(declare-fun m!738611 () Bool)

(assert (=> b!797373 m!738611))

(declare-fun m!738613 () Bool)

(assert (=> b!797373 m!738613))

(assert (=> b!797373 m!738613))

(declare-fun m!738615 () Bool)

(assert (=> b!797373 m!738615))

(assert (=> b!797373 m!738613))

(declare-fun m!738617 () Bool)

(assert (=> b!797373 m!738617))

(declare-fun m!738619 () Bool)

(assert (=> start!68640 m!738619))

(declare-fun m!738621 () Bool)

(assert (=> start!68640 m!738621))

(declare-fun m!738623 () Bool)

(assert (=> b!797362 m!738623))

(declare-fun m!738625 () Bool)

(assert (=> b!797372 m!738625))

(declare-fun m!738627 () Bool)

(assert (=> b!797370 m!738627))

(assert (=> b!797366 m!738613))

(assert (=> b!797366 m!738613))

(declare-fun m!738629 () Bool)

(assert (=> b!797366 m!738629))

(declare-fun m!738631 () Bool)

(assert (=> b!797369 m!738631))

(declare-fun m!738633 () Bool)

(assert (=> b!797363 m!738633))

(declare-fun m!738635 () Bool)

(assert (=> b!797363 m!738635))

(declare-fun m!738637 () Bool)

(assert (=> b!797363 m!738637))

(declare-fun m!738639 () Bool)

(assert (=> b!797363 m!738639))

(assert (=> b!797368 m!738637))

(declare-fun m!738641 () Bool)

(assert (=> b!797368 m!738641))

(declare-fun m!738643 () Bool)

(assert (=> b!797364 m!738643))

(check-sat (not b!797369) (not b!797370) (not b!797372) (not b!797363) (not b!797373) (not b!797362) (not b!797364) (not b!797366) (not start!68640) (not b!797371))
(check-sat)
