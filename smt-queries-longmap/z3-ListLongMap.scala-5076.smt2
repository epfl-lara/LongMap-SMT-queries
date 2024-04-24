; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69134 () Bool)

(assert start!69134)

(declare-fun b!805383 () Bool)

(declare-fun res!549360 () Bool)

(declare-fun e!446251 () Bool)

(assert (=> b!805383 (=> (not res!549360) (not e!446251))))

(declare-datatypes ((array!43756 0))(
  ( (array!43757 (arr!20953 (Array (_ BitVec 32) (_ BitVec 64))) (size!21373 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43756)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!805383 (= res!549360 (and (= (size!21373 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21373 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21373 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805384 () Bool)

(declare-fun res!549354 () Bool)

(assert (=> b!805384 (=> (not res!549354) (not e!446251))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805384 (= res!549354 (validKeyInArray!0 k0!2044))))

(declare-fun res!549359 () Bool)

(assert (=> start!69134 (=> (not res!549359) (not e!446251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69134 (= res!549359 (validMask!0 mask!3266))))

(assert (=> start!69134 e!446251))

(assert (=> start!69134 true))

(declare-fun array_inv!16812 (array!43756) Bool)

(assert (=> start!69134 (array_inv!16812 a!3170)))

(declare-fun b!805385 () Bool)

(declare-fun e!446249 () Bool)

(assert (=> b!805385 (= e!446251 e!446249)))

(declare-fun res!549358 () Bool)

(assert (=> b!805385 (=> (not res!549358) (not e!446249))))

(declare-datatypes ((SeekEntryResult!8500 0))(
  ( (MissingZero!8500 (index!36368 (_ BitVec 32))) (Found!8500 (index!36369 (_ BitVec 32))) (Intermediate!8500 (undefined!9312 Bool) (index!36370 (_ BitVec 32)) (x!67360 (_ BitVec 32))) (Undefined!8500) (MissingVacant!8500 (index!36371 (_ BitVec 32))) )
))
(declare-fun lt!360526 () SeekEntryResult!8500)

(assert (=> b!805385 (= res!549358 (or (= lt!360526 (MissingZero!8500 i!1163)) (= lt!360526 (MissingVacant!8500 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43756 (_ BitVec 32)) SeekEntryResult!8500)

(assert (=> b!805385 (= lt!360526 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!805386 () Bool)

(declare-fun res!549356 () Bool)

(assert (=> b!805386 (=> (not res!549356) (not e!446249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43756 (_ BitVec 32)) Bool)

(assert (=> b!805386 (= res!549356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805387 () Bool)

(declare-fun res!549357 () Bool)

(assert (=> b!805387 (=> (not res!549357) (not e!446251))))

(assert (=> b!805387 (= res!549357 (validKeyInArray!0 (select (arr!20953 a!3170) j!153)))))

(declare-fun b!805388 () Bool)

(assert (=> b!805388 (= e!446249 false)))

(declare-fun lt!360527 () Bool)

(declare-datatypes ((List!14823 0))(
  ( (Nil!14820) (Cons!14819 (h!15954 (_ BitVec 64)) (t!21130 List!14823)) )
))
(declare-fun arrayNoDuplicates!0 (array!43756 (_ BitVec 32) List!14823) Bool)

(assert (=> b!805388 (= lt!360527 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14820))))

(declare-fun b!805389 () Bool)

(declare-fun res!549355 () Bool)

(assert (=> b!805389 (=> (not res!549355) (not e!446251))))

(declare-fun arrayContainsKey!0 (array!43756 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805389 (= res!549355 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!69134 res!549359) b!805383))

(assert (= (and b!805383 res!549360) b!805387))

(assert (= (and b!805387 res!549357) b!805384))

(assert (= (and b!805384 res!549354) b!805389))

(assert (= (and b!805389 res!549355) b!805385))

(assert (= (and b!805385 res!549358) b!805386))

(assert (= (and b!805386 res!549356) b!805388))

(declare-fun m!747619 () Bool)

(assert (=> start!69134 m!747619))

(declare-fun m!747621 () Bool)

(assert (=> start!69134 m!747621))

(declare-fun m!747623 () Bool)

(assert (=> b!805386 m!747623))

(declare-fun m!747625 () Bool)

(assert (=> b!805389 m!747625))

(declare-fun m!747627 () Bool)

(assert (=> b!805388 m!747627))

(declare-fun m!747629 () Bool)

(assert (=> b!805387 m!747629))

(assert (=> b!805387 m!747629))

(declare-fun m!747631 () Bool)

(assert (=> b!805387 m!747631))

(declare-fun m!747633 () Bool)

(assert (=> b!805385 m!747633))

(declare-fun m!747635 () Bool)

(assert (=> b!805384 m!747635))

(check-sat (not b!805388) (not b!805385) (not b!805389) (not b!805387) (not start!69134) (not b!805386) (not b!805384))
(check-sat)
