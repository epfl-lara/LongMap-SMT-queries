; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69130 () Bool)

(assert start!69130)

(declare-fun b!805341 () Bool)

(declare-fun res!549314 () Bool)

(declare-fun e!446233 () Bool)

(assert (=> b!805341 (=> (not res!549314) (not e!446233))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((array!43752 0))(
  ( (array!43753 (arr!20951 (Array (_ BitVec 32) (_ BitVec 64))) (size!21371 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43752)

(assert (=> b!805341 (= res!549314 (and (= (size!21371 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21371 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21371 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805342 () Bool)

(declare-fun e!446231 () Bool)

(assert (=> b!805342 (= e!446231 false)))

(declare-fun lt!360515 () Bool)

(declare-datatypes ((List!14821 0))(
  ( (Nil!14818) (Cons!14817 (h!15952 (_ BitVec 64)) (t!21128 List!14821)) )
))
(declare-fun arrayNoDuplicates!0 (array!43752 (_ BitVec 32) List!14821) Bool)

(assert (=> b!805342 (= lt!360515 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14818))))

(declare-fun b!805343 () Bool)

(declare-fun res!549318 () Bool)

(assert (=> b!805343 (=> (not res!549318) (not e!446233))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805343 (= res!549318 (validKeyInArray!0 (select (arr!20951 a!3170) j!153)))))

(declare-fun b!805344 () Bool)

(assert (=> b!805344 (= e!446233 e!446231)))

(declare-fun res!549313 () Bool)

(assert (=> b!805344 (=> (not res!549313) (not e!446231))))

(declare-datatypes ((SeekEntryResult!8498 0))(
  ( (MissingZero!8498 (index!36360 (_ BitVec 32))) (Found!8498 (index!36361 (_ BitVec 32))) (Intermediate!8498 (undefined!9310 Bool) (index!36362 (_ BitVec 32)) (x!67350 (_ BitVec 32))) (Undefined!8498) (MissingVacant!8498 (index!36363 (_ BitVec 32))) )
))
(declare-fun lt!360514 () SeekEntryResult!8498)

(assert (=> b!805344 (= res!549313 (or (= lt!360514 (MissingZero!8498 i!1163)) (= lt!360514 (MissingVacant!8498 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43752 (_ BitVec 32)) SeekEntryResult!8498)

(assert (=> b!805344 (= lt!360514 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!805345 () Bool)

(declare-fun res!549315 () Bool)

(assert (=> b!805345 (=> (not res!549315) (not e!446231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43752 (_ BitVec 32)) Bool)

(assert (=> b!805345 (= res!549315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!549312 () Bool)

(assert (=> start!69130 (=> (not res!549312) (not e!446233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69130 (= res!549312 (validMask!0 mask!3266))))

(assert (=> start!69130 e!446233))

(assert (=> start!69130 true))

(declare-fun array_inv!16810 (array!43752) Bool)

(assert (=> start!69130 (array_inv!16810 a!3170)))

(declare-fun b!805346 () Bool)

(declare-fun res!549317 () Bool)

(assert (=> b!805346 (=> (not res!549317) (not e!446233))))

(assert (=> b!805346 (= res!549317 (validKeyInArray!0 k!2044))))

(declare-fun b!805347 () Bool)

(declare-fun res!549316 () Bool)

(assert (=> b!805347 (=> (not res!549316) (not e!446233))))

(declare-fun arrayContainsKey!0 (array!43752 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805347 (= res!549316 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!69130 res!549312) b!805341))

(assert (= (and b!805341 res!549314) b!805343))

(assert (= (and b!805343 res!549318) b!805346))

(assert (= (and b!805346 res!549317) b!805347))

(assert (= (and b!805347 res!549316) b!805344))

(assert (= (and b!805344 res!549313) b!805345))

(assert (= (and b!805345 res!549315) b!805342))

(declare-fun m!747583 () Bool)

(assert (=> b!805343 m!747583))

(assert (=> b!805343 m!747583))

(declare-fun m!747585 () Bool)

(assert (=> b!805343 m!747585))

(declare-fun m!747587 () Bool)

(assert (=> b!805342 m!747587))

(declare-fun m!747589 () Bool)

(assert (=> b!805344 m!747589))

(declare-fun m!747591 () Bool)

(assert (=> b!805346 m!747591))

(declare-fun m!747593 () Bool)

(assert (=> b!805345 m!747593))

(declare-fun m!747595 () Bool)

(assert (=> start!69130 m!747595))

(declare-fun m!747597 () Bool)

(assert (=> start!69130 m!747597))

(declare-fun m!747599 () Bool)

(assert (=> b!805347 m!747599))

(push 1)

(assert (not b!805346))

(assert (not b!805344))

(assert (not b!805342))

(assert (not start!69130))

(assert (not b!805347))

(assert (not b!805343))

(assert (not b!805345))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

