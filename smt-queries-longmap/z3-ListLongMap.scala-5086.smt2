; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69028 () Bool)

(assert start!69028)

(declare-fun b!805359 () Bool)

(declare-fun e!446015 () Bool)

(assert (=> b!805359 (= e!446015 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((array!43818 0))(
  ( (array!43819 (arr!20989 (Array (_ BitVec 32) (_ BitVec 64))) (size!21410 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43818)

(declare-datatypes ((SeekEntryResult!8580 0))(
  ( (MissingZero!8580 (index!36688 (_ BitVec 32))) (Found!8580 (index!36689 (_ BitVec 32))) (Intermediate!8580 (undefined!9392 Bool) (index!36690 (_ BitVec 32)) (x!67506 (_ BitVec 32))) (Undefined!8580) (MissingVacant!8580 (index!36691 (_ BitVec 32))) )
))
(declare-fun lt!360587 () SeekEntryResult!8580)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43818 (_ BitVec 32)) SeekEntryResult!8580)

(assert (=> b!805359 (= lt!360587 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20989 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360590 () SeekEntryResult!8580)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43818 (_ BitVec 32)) SeekEntryResult!8580)

(assert (=> b!805359 (= lt!360590 (seekEntryOrOpen!0 (select (arr!20989 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805360 () Bool)

(declare-fun res!549887 () Bool)

(declare-fun e!446016 () Bool)

(assert (=> b!805360 (=> (not res!549887) (not e!446016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43818 (_ BitVec 32)) Bool)

(assert (=> b!805360 (= res!549887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805361 () Bool)

(declare-fun res!549881 () Bool)

(declare-fun e!446018 () Bool)

(assert (=> b!805361 (=> (not res!549881) (not e!446018))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805361 (= res!549881 (validKeyInArray!0 k0!2044))))

(declare-fun b!805362 () Bool)

(declare-fun res!549885 () Bool)

(assert (=> b!805362 (=> (not res!549885) (not e!446018))))

(declare-fun arrayContainsKey!0 (array!43818 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805362 (= res!549885 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805363 () Bool)

(declare-fun res!549883 () Bool)

(assert (=> b!805363 (=> (not res!549883) (not e!446016))))

(declare-datatypes ((List!14952 0))(
  ( (Nil!14949) (Cons!14948 (h!16077 (_ BitVec 64)) (t!21267 List!14952)) )
))
(declare-fun arrayNoDuplicates!0 (array!43818 (_ BitVec 32) List!14952) Bool)

(assert (=> b!805363 (= res!549883 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14949))))

(declare-fun res!549879 () Bool)

(assert (=> start!69028 (=> (not res!549879) (not e!446018))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69028 (= res!549879 (validMask!0 mask!3266))))

(assert (=> start!69028 e!446018))

(assert (=> start!69028 true))

(declare-fun array_inv!16785 (array!43818) Bool)

(assert (=> start!69028 (array_inv!16785 a!3170)))

(declare-fun b!805364 () Bool)

(assert (=> b!805364 (= e!446018 e!446016)))

(declare-fun res!549882 () Bool)

(assert (=> b!805364 (=> (not res!549882) (not e!446016))))

(declare-fun lt!360586 () SeekEntryResult!8580)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!805364 (= res!549882 (or (= lt!360586 (MissingZero!8580 i!1163)) (= lt!360586 (MissingVacant!8580 i!1163))))))

(assert (=> b!805364 (= lt!360586 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!805365 () Bool)

(declare-fun res!549880 () Bool)

(assert (=> b!805365 (=> (not res!549880) (not e!446018))))

(assert (=> b!805365 (= res!549880 (and (= (size!21410 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21410 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21410 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805366 () Bool)

(declare-fun res!549878 () Bool)

(assert (=> b!805366 (=> (not res!549878) (not e!446016))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!805366 (= res!549878 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21410 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20989 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21410 a!3170)) (= (select (arr!20989 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805367 () Bool)

(assert (=> b!805367 (= e!446016 e!446015)))

(declare-fun res!549886 () Bool)

(assert (=> b!805367 (=> (not res!549886) (not e!446015))))

(declare-fun lt!360588 () array!43818)

(declare-fun lt!360589 () (_ BitVec 64))

(assert (=> b!805367 (= res!549886 (= (seekEntryOrOpen!0 lt!360589 lt!360588 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360589 lt!360588 mask!3266)))))

(assert (=> b!805367 (= lt!360589 (select (store (arr!20989 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!805367 (= lt!360588 (array!43819 (store (arr!20989 a!3170) i!1163 k0!2044) (size!21410 a!3170)))))

(declare-fun b!805368 () Bool)

(declare-fun res!549884 () Bool)

(assert (=> b!805368 (=> (not res!549884) (not e!446018))))

(assert (=> b!805368 (= res!549884 (validKeyInArray!0 (select (arr!20989 a!3170) j!153)))))

(assert (= (and start!69028 res!549879) b!805365))

(assert (= (and b!805365 res!549880) b!805368))

(assert (= (and b!805368 res!549884) b!805361))

(assert (= (and b!805361 res!549881) b!805362))

(assert (= (and b!805362 res!549885) b!805364))

(assert (= (and b!805364 res!549882) b!805360))

(assert (= (and b!805360 res!549887) b!805363))

(assert (= (and b!805363 res!549883) b!805366))

(assert (= (and b!805366 res!549878) b!805367))

(assert (= (and b!805367 res!549886) b!805359))

(declare-fun m!747297 () Bool)

(assert (=> b!805363 m!747297))

(declare-fun m!747299 () Bool)

(assert (=> b!805362 m!747299))

(declare-fun m!747301 () Bool)

(assert (=> b!805368 m!747301))

(assert (=> b!805368 m!747301))

(declare-fun m!747303 () Bool)

(assert (=> b!805368 m!747303))

(declare-fun m!747305 () Bool)

(assert (=> start!69028 m!747305))

(declare-fun m!747307 () Bool)

(assert (=> start!69028 m!747307))

(declare-fun m!747309 () Bool)

(assert (=> b!805366 m!747309))

(declare-fun m!747311 () Bool)

(assert (=> b!805366 m!747311))

(declare-fun m!747313 () Bool)

(assert (=> b!805367 m!747313))

(declare-fun m!747315 () Bool)

(assert (=> b!805367 m!747315))

(declare-fun m!747317 () Bool)

(assert (=> b!805367 m!747317))

(declare-fun m!747319 () Bool)

(assert (=> b!805367 m!747319))

(declare-fun m!747321 () Bool)

(assert (=> b!805361 m!747321))

(declare-fun m!747323 () Bool)

(assert (=> b!805360 m!747323))

(assert (=> b!805359 m!747301))

(assert (=> b!805359 m!747301))

(declare-fun m!747325 () Bool)

(assert (=> b!805359 m!747325))

(assert (=> b!805359 m!747301))

(declare-fun m!747327 () Bool)

(assert (=> b!805359 m!747327))

(declare-fun m!747329 () Bool)

(assert (=> b!805364 m!747329))

(check-sat (not b!805359) (not start!69028) (not b!805368) (not b!805364) (not b!805361) (not b!805362) (not b!805363) (not b!805360) (not b!805367))
(check-sat)
