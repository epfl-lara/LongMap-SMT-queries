; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69146 () Bool)

(assert start!69146)

(declare-fun b!805513 () Bool)

(declare-fun e!446305 () Bool)

(assert (=> b!805513 (= e!446305 false)))

(declare-datatypes ((SeekEntryResult!8506 0))(
  ( (MissingZero!8506 (index!36392 (_ BitVec 32))) (Found!8506 (index!36393 (_ BitVec 32))) (Intermediate!8506 (undefined!9318 Bool) (index!36394 (_ BitVec 32)) (x!67382 (_ BitVec 32))) (Undefined!8506) (MissingVacant!8506 (index!36395 (_ BitVec 32))) )
))
(declare-fun lt!360569 () SeekEntryResult!8506)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43768 0))(
  ( (array!43769 (arr!20959 (Array (_ BitVec 32) (_ BitVec 64))) (size!21379 (_ BitVec 32))) )
))
(declare-fun lt!360568 () array!43768)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!360571 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43768 (_ BitVec 32)) SeekEntryResult!8506)

(assert (=> b!805513 (= lt!360569 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360571 lt!360568 mask!3266))))

(declare-fun lt!360572 () SeekEntryResult!8506)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43768 (_ BitVec 32)) SeekEntryResult!8506)

(assert (=> b!805513 (= lt!360572 (seekEntryOrOpen!0 lt!360571 lt!360568 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43768)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!805513 (= lt!360571 (select (store (arr!20959 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!805513 (= lt!360568 (array!43769 (store (arr!20959 a!3170) i!1163 k0!2044) (size!21379 a!3170)))))

(declare-fun b!805514 () Bool)

(declare-fun e!446303 () Bool)

(assert (=> b!805514 (= e!446303 e!446305)))

(declare-fun res!549488 () Bool)

(assert (=> b!805514 (=> (not res!549488) (not e!446305))))

(declare-fun lt!360570 () SeekEntryResult!8506)

(assert (=> b!805514 (= res!549488 (or (= lt!360570 (MissingZero!8506 i!1163)) (= lt!360570 (MissingVacant!8506 i!1163))))))

(assert (=> b!805514 (= lt!360570 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!805515 () Bool)

(declare-fun res!549484 () Bool)

(assert (=> b!805515 (=> (not res!549484) (not e!446303))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805515 (= res!549484 (validKeyInArray!0 k0!2044))))

(declare-fun b!805516 () Bool)

(declare-fun res!549492 () Bool)

(assert (=> b!805516 (=> (not res!549492) (not e!446305))))

(declare-datatypes ((List!14829 0))(
  ( (Nil!14826) (Cons!14825 (h!15960 (_ BitVec 64)) (t!21136 List!14829)) )
))
(declare-fun arrayNoDuplicates!0 (array!43768 (_ BitVec 32) List!14829) Bool)

(assert (=> b!805516 (= res!549492 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14826))))

(declare-fun b!805517 () Bool)

(declare-fun res!549491 () Bool)

(assert (=> b!805517 (=> (not res!549491) (not e!446303))))

(declare-fun arrayContainsKey!0 (array!43768 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805517 (= res!549491 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805518 () Bool)

(declare-fun res!549489 () Bool)

(assert (=> b!805518 (=> (not res!549489) (not e!446305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43768 (_ BitVec 32)) Bool)

(assert (=> b!805518 (= res!549489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!549487 () Bool)

(assert (=> start!69146 (=> (not res!549487) (not e!446303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69146 (= res!549487 (validMask!0 mask!3266))))

(assert (=> start!69146 e!446303))

(assert (=> start!69146 true))

(declare-fun array_inv!16818 (array!43768) Bool)

(assert (=> start!69146 (array_inv!16818 a!3170)))

(declare-fun b!805519 () Bool)

(declare-fun res!549490 () Bool)

(assert (=> b!805519 (=> (not res!549490) (not e!446303))))

(assert (=> b!805519 (= res!549490 (and (= (size!21379 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21379 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21379 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805520 () Bool)

(declare-fun res!549485 () Bool)

(assert (=> b!805520 (=> (not res!549485) (not e!446305))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!805520 (= res!549485 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21379 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20959 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21379 a!3170)) (= (select (arr!20959 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805521 () Bool)

(declare-fun res!549486 () Bool)

(assert (=> b!805521 (=> (not res!549486) (not e!446303))))

(assert (=> b!805521 (= res!549486 (validKeyInArray!0 (select (arr!20959 a!3170) j!153)))))

(assert (= (and start!69146 res!549487) b!805519))

(assert (= (and b!805519 res!549490) b!805521))

(assert (= (and b!805521 res!549486) b!805515))

(assert (= (and b!805515 res!549484) b!805517))

(assert (= (and b!805517 res!549491) b!805514))

(assert (= (and b!805514 res!549488) b!805518))

(assert (= (and b!805518 res!549489) b!805516))

(assert (= (and b!805516 res!549492) b!805520))

(assert (= (and b!805520 res!549485) b!805513))

(declare-fun m!747727 () Bool)

(assert (=> b!805517 m!747727))

(declare-fun m!747729 () Bool)

(assert (=> start!69146 m!747729))

(declare-fun m!747731 () Bool)

(assert (=> start!69146 m!747731))

(declare-fun m!747733 () Bool)

(assert (=> b!805516 m!747733))

(declare-fun m!747735 () Bool)

(assert (=> b!805513 m!747735))

(declare-fun m!747737 () Bool)

(assert (=> b!805513 m!747737))

(declare-fun m!747739 () Bool)

(assert (=> b!805513 m!747739))

(declare-fun m!747741 () Bool)

(assert (=> b!805513 m!747741))

(declare-fun m!747743 () Bool)

(assert (=> b!805515 m!747743))

(declare-fun m!747745 () Bool)

(assert (=> b!805521 m!747745))

(assert (=> b!805521 m!747745))

(declare-fun m!747747 () Bool)

(assert (=> b!805521 m!747747))

(declare-fun m!747749 () Bool)

(assert (=> b!805520 m!747749))

(declare-fun m!747751 () Bool)

(assert (=> b!805520 m!747751))

(declare-fun m!747753 () Bool)

(assert (=> b!805518 m!747753))

(declare-fun m!747755 () Bool)

(assert (=> b!805514 m!747755))

(check-sat (not start!69146) (not b!805518) (not b!805517) (not b!805516) (not b!805514) (not b!805515) (not b!805513) (not b!805521))
(check-sat)
