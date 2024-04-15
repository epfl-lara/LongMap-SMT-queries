; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68880 () Bool)

(assert start!68880)

(declare-fun b!803355 () Bool)

(declare-fun e!445125 () Bool)

(declare-fun e!445126 () Bool)

(assert (=> b!803355 (= e!445125 e!445126)))

(declare-fun res!548019 () Bool)

(assert (=> b!803355 (=> (not res!548019) (not e!445126))))

(declare-datatypes ((SeekEntryResult!8512 0))(
  ( (MissingZero!8512 (index!36416 (_ BitVec 32))) (Found!8512 (index!36417 (_ BitVec 32))) (Intermediate!8512 (undefined!9324 Bool) (index!36418 (_ BitVec 32)) (x!67265 (_ BitVec 32))) (Undefined!8512) (MissingVacant!8512 (index!36419 (_ BitVec 32))) )
))
(declare-fun lt!359484 () SeekEntryResult!8512)

(declare-fun lt!359477 () SeekEntryResult!8512)

(assert (=> b!803355 (= res!548019 (= lt!359484 lt!359477))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43687 0))(
  ( (array!43688 (arr!20924 (Array (_ BitVec 32) (_ BitVec 64))) (size!21345 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43687)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43687 (_ BitVec 32)) SeekEntryResult!8512)

(assert (=> b!803355 (= lt!359477 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20924 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43687 (_ BitVec 32)) SeekEntryResult!8512)

(assert (=> b!803355 (= lt!359484 (seekEntryOrOpen!0 (select (arr!20924 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803356 () Bool)

(declare-fun e!445127 () Bool)

(assert (=> b!803356 (= e!445126 e!445127)))

(declare-fun res!548020 () Bool)

(assert (=> b!803356 (=> (not res!548020) (not e!445127))))

(declare-fun lt!359483 () SeekEntryResult!8512)

(assert (=> b!803356 (= res!548020 (and (= lt!359477 lt!359483) (not (= (select (arr!20924 a!3170) index!1236) (select (arr!20924 a!3170) j!153)))))))

(assert (=> b!803356 (= lt!359483 (Found!8512 j!153))))

(declare-fun b!803357 () Bool)

(declare-fun res!548021 () Bool)

(declare-fun e!445124 () Bool)

(assert (=> b!803357 (=> (not res!548021) (not e!445124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803357 (= res!548021 (validKeyInArray!0 (select (arr!20924 a!3170) j!153)))))

(declare-fun b!803358 () Bool)

(declare-fun res!548014 () Bool)

(declare-fun e!445128 () Bool)

(assert (=> b!803358 (=> (not res!548014) (not e!445128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43687 (_ BitVec 32)) Bool)

(assert (=> b!803358 (= res!548014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803359 () Bool)

(declare-fun res!548016 () Bool)

(assert (=> b!803359 (=> (not res!548016) (not e!445128))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!803359 (= res!548016 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21345 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20924 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21345 a!3170)) (= (select (arr!20924 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803360 () Bool)

(declare-fun res!548022 () Bool)

(assert (=> b!803360 (=> (not res!548022) (not e!445124))))

(assert (=> b!803360 (= res!548022 (and (= (size!21345 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21345 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21345 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!548017 () Bool)

(assert (=> start!68880 (=> (not res!548017) (not e!445124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68880 (= res!548017 (validMask!0 mask!3266))))

(assert (=> start!68880 e!445124))

(assert (=> start!68880 true))

(declare-fun array_inv!16807 (array!43687) Bool)

(assert (=> start!68880 (array_inv!16807 a!3170)))

(declare-fun lt!359486 () SeekEntryResult!8512)

(declare-fun b!803361 () Bool)

(assert (=> b!803361 (= e!445127 (not (or (not (= lt!359486 lt!359483)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun lt!359485 () array!43687)

(declare-fun lt!359478 () (_ BitVec 64))

(declare-fun lt!359481 () (_ BitVec 32))

(assert (=> b!803361 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359481 vacantAfter!23 lt!359478 lt!359485 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359481 vacantBefore!23 (select (arr!20924 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27538 0))(
  ( (Unit!27539) )
))
(declare-fun lt!359479 () Unit!27538)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43687 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27538)

(assert (=> b!803361 (= lt!359479 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359481 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803361 (= lt!359481 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803362 () Bool)

(assert (=> b!803362 (= e!445124 e!445128)))

(declare-fun res!548023 () Bool)

(assert (=> b!803362 (=> (not res!548023) (not e!445128))))

(declare-fun lt!359480 () SeekEntryResult!8512)

(assert (=> b!803362 (= res!548023 (or (= lt!359480 (MissingZero!8512 i!1163)) (= lt!359480 (MissingVacant!8512 i!1163))))))

(assert (=> b!803362 (= lt!359480 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!803363 () Bool)

(declare-fun res!548015 () Bool)

(assert (=> b!803363 (=> (not res!548015) (not e!445124))))

(declare-fun arrayContainsKey!0 (array!43687 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803363 (= res!548015 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803364 () Bool)

(assert (=> b!803364 (= e!445128 e!445125)))

(declare-fun res!548024 () Bool)

(assert (=> b!803364 (=> (not res!548024) (not e!445125))))

(declare-fun lt!359482 () SeekEntryResult!8512)

(assert (=> b!803364 (= res!548024 (= lt!359482 lt!359486))))

(assert (=> b!803364 (= lt!359486 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359478 lt!359485 mask!3266))))

(assert (=> b!803364 (= lt!359482 (seekEntryOrOpen!0 lt!359478 lt!359485 mask!3266))))

(assert (=> b!803364 (= lt!359478 (select (store (arr!20924 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!803364 (= lt!359485 (array!43688 (store (arr!20924 a!3170) i!1163 k0!2044) (size!21345 a!3170)))))

(declare-fun b!803365 () Bool)

(declare-fun res!548018 () Bool)

(assert (=> b!803365 (=> (not res!548018) (not e!445124))))

(assert (=> b!803365 (= res!548018 (validKeyInArray!0 k0!2044))))

(declare-fun b!803366 () Bool)

(declare-fun res!548025 () Bool)

(assert (=> b!803366 (=> (not res!548025) (not e!445128))))

(declare-datatypes ((List!14926 0))(
  ( (Nil!14923) (Cons!14922 (h!16051 (_ BitVec 64)) (t!21232 List!14926)) )
))
(declare-fun arrayNoDuplicates!0 (array!43687 (_ BitVec 32) List!14926) Bool)

(assert (=> b!803366 (= res!548025 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14923))))

(assert (= (and start!68880 res!548017) b!803360))

(assert (= (and b!803360 res!548022) b!803357))

(assert (= (and b!803357 res!548021) b!803365))

(assert (= (and b!803365 res!548018) b!803363))

(assert (= (and b!803363 res!548015) b!803362))

(assert (= (and b!803362 res!548023) b!803358))

(assert (= (and b!803358 res!548014) b!803366))

(assert (= (and b!803366 res!548025) b!803359))

(assert (= (and b!803359 res!548016) b!803364))

(assert (= (and b!803364 res!548024) b!803355))

(assert (= (and b!803355 res!548019) b!803356))

(assert (= (and b!803356 res!548020) b!803361))

(declare-fun m!744637 () Bool)

(assert (=> b!803355 m!744637))

(assert (=> b!803355 m!744637))

(declare-fun m!744639 () Bool)

(assert (=> b!803355 m!744639))

(assert (=> b!803355 m!744637))

(declare-fun m!744641 () Bool)

(assert (=> b!803355 m!744641))

(assert (=> b!803357 m!744637))

(assert (=> b!803357 m!744637))

(declare-fun m!744643 () Bool)

(assert (=> b!803357 m!744643))

(declare-fun m!744645 () Bool)

(assert (=> b!803364 m!744645))

(declare-fun m!744647 () Bool)

(assert (=> b!803364 m!744647))

(declare-fun m!744649 () Bool)

(assert (=> b!803364 m!744649))

(declare-fun m!744651 () Bool)

(assert (=> b!803364 m!744651))

(declare-fun m!744653 () Bool)

(assert (=> b!803356 m!744653))

(assert (=> b!803356 m!744637))

(declare-fun m!744655 () Bool)

(assert (=> b!803365 m!744655))

(declare-fun m!744657 () Bool)

(assert (=> b!803358 m!744657))

(declare-fun m!744659 () Bool)

(assert (=> b!803363 m!744659))

(declare-fun m!744661 () Bool)

(assert (=> b!803362 m!744661))

(declare-fun m!744663 () Bool)

(assert (=> start!68880 m!744663))

(declare-fun m!744665 () Bool)

(assert (=> start!68880 m!744665))

(assert (=> b!803361 m!744637))

(declare-fun m!744667 () Bool)

(assert (=> b!803361 m!744667))

(declare-fun m!744669 () Bool)

(assert (=> b!803361 m!744669))

(declare-fun m!744671 () Bool)

(assert (=> b!803361 m!744671))

(assert (=> b!803361 m!744637))

(declare-fun m!744673 () Bool)

(assert (=> b!803361 m!744673))

(declare-fun m!744675 () Bool)

(assert (=> b!803366 m!744675))

(declare-fun m!744677 () Bool)

(assert (=> b!803359 m!744677))

(declare-fun m!744679 () Bool)

(assert (=> b!803359 m!744679))

(check-sat (not start!68880) (not b!803362) (not b!803364) (not b!803358) (not b!803365) (not b!803357) (not b!803355) (not b!803361) (not b!803363) (not b!803366))
(check-sat)
