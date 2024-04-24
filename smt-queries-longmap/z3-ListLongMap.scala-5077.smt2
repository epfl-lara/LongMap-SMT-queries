; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69140 () Bool)

(assert start!69140)

(declare-fun b!805446 () Bool)

(declare-fun res!549419 () Bool)

(declare-fun e!446278 () Bool)

(assert (=> b!805446 (=> (not res!549419) (not e!446278))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805446 (= res!549419 (validKeyInArray!0 k0!2044))))

(declare-fun b!805447 () Bool)

(declare-fun res!549423 () Bool)

(assert (=> b!805447 (=> (not res!549423) (not e!446278))))

(declare-datatypes ((array!43762 0))(
  ( (array!43763 (arr!20956 (Array (_ BitVec 32) (_ BitVec 64))) (size!21376 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43762)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!805447 (= res!549423 (validKeyInArray!0 (select (arr!20956 a!3170) j!153)))))

(declare-fun res!549422 () Bool)

(assert (=> start!69140 (=> (not res!549422) (not e!446278))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69140 (= res!549422 (validMask!0 mask!3266))))

(assert (=> start!69140 e!446278))

(assert (=> start!69140 true))

(declare-fun array_inv!16815 (array!43762) Bool)

(assert (=> start!69140 (array_inv!16815 a!3170)))

(declare-fun b!805448 () Bool)

(declare-fun res!549418 () Bool)

(assert (=> b!805448 (=> (not res!549418) (not e!446278))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!805448 (= res!549418 (and (= (size!21376 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21376 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21376 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805449 () Bool)

(declare-fun e!446277 () Bool)

(assert (=> b!805449 (= e!446278 e!446277)))

(declare-fun res!549417 () Bool)

(assert (=> b!805449 (=> (not res!549417) (not e!446277))))

(declare-datatypes ((SeekEntryResult!8503 0))(
  ( (MissingZero!8503 (index!36380 (_ BitVec 32))) (Found!8503 (index!36381 (_ BitVec 32))) (Intermediate!8503 (undefined!9315 Bool) (index!36382 (_ BitVec 32)) (x!67371 (_ BitVec 32))) (Undefined!8503) (MissingVacant!8503 (index!36383 (_ BitVec 32))) )
))
(declare-fun lt!360544 () SeekEntryResult!8503)

(assert (=> b!805449 (= res!549417 (or (= lt!360544 (MissingZero!8503 i!1163)) (= lt!360544 (MissingVacant!8503 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43762 (_ BitVec 32)) SeekEntryResult!8503)

(assert (=> b!805449 (= lt!360544 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!805450 () Bool)

(assert (=> b!805450 (= e!446277 false)))

(declare-fun lt!360545 () Bool)

(declare-datatypes ((List!14826 0))(
  ( (Nil!14823) (Cons!14822 (h!15957 (_ BitVec 64)) (t!21133 List!14826)) )
))
(declare-fun arrayNoDuplicates!0 (array!43762 (_ BitVec 32) List!14826) Bool)

(assert (=> b!805450 (= lt!360545 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14823))))

(declare-fun b!805451 () Bool)

(declare-fun res!549421 () Bool)

(assert (=> b!805451 (=> (not res!549421) (not e!446278))))

(declare-fun arrayContainsKey!0 (array!43762 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805451 (= res!549421 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805452 () Bool)

(declare-fun res!549420 () Bool)

(assert (=> b!805452 (=> (not res!549420) (not e!446277))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43762 (_ BitVec 32)) Bool)

(assert (=> b!805452 (= res!549420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!69140 res!549422) b!805448))

(assert (= (and b!805448 res!549418) b!805447))

(assert (= (and b!805447 res!549423) b!805446))

(assert (= (and b!805446 res!549419) b!805451))

(assert (= (and b!805451 res!549421) b!805449))

(assert (= (and b!805449 res!549417) b!805452))

(assert (= (and b!805452 res!549420) b!805450))

(declare-fun m!747673 () Bool)

(assert (=> start!69140 m!747673))

(declare-fun m!747675 () Bool)

(assert (=> start!69140 m!747675))

(declare-fun m!747677 () Bool)

(assert (=> b!805451 m!747677))

(declare-fun m!747679 () Bool)

(assert (=> b!805450 m!747679))

(declare-fun m!747681 () Bool)

(assert (=> b!805447 m!747681))

(assert (=> b!805447 m!747681))

(declare-fun m!747683 () Bool)

(assert (=> b!805447 m!747683))

(declare-fun m!747685 () Bool)

(assert (=> b!805449 m!747685))

(declare-fun m!747687 () Bool)

(assert (=> b!805446 m!747687))

(declare-fun m!747689 () Bool)

(assert (=> b!805452 m!747689))

(check-sat (not b!805446) (not start!69140) (not b!805450) (not b!805447) (not b!805452) (not b!805449) (not b!805451))
(check-sat)
