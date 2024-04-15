; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69204 () Bool)

(assert start!69204)

(declare-fun b!807286 () Bool)

(declare-fun res!551556 () Bool)

(declare-fun e!446940 () Bool)

(assert (=> b!807286 (=> (not res!551556) (not e!446940))))

(declare-datatypes ((array!43921 0))(
  ( (array!43922 (arr!21038 (Array (_ BitVec 32) (_ BitVec 64))) (size!21459 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43921)

(declare-datatypes ((List!15040 0))(
  ( (Nil!15037) (Cons!15036 (h!16165 (_ BitVec 64)) (t!21346 List!15040)) )
))
(declare-fun arrayNoDuplicates!0 (array!43921 (_ BitVec 32) List!15040) Bool)

(assert (=> b!807286 (= res!551556 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15037))))

(declare-fun b!807287 () Bool)

(declare-fun e!446943 () Bool)

(declare-fun e!446942 () Bool)

(assert (=> b!807287 (= e!446943 e!446942)))

(declare-fun res!551552 () Bool)

(assert (=> b!807287 (=> (not res!551552) (not e!446942))))

(declare-datatypes ((SeekEntryResult!8626 0))(
  ( (MissingZero!8626 (index!36872 (_ BitVec 32))) (Found!8626 (index!36873 (_ BitVec 32))) (Intermediate!8626 (undefined!9438 Bool) (index!36874 (_ BitVec 32)) (x!67689 (_ BitVec 32))) (Undefined!8626) (MissingVacant!8626 (index!36875 (_ BitVec 32))) )
))
(declare-fun lt!361546 () SeekEntryResult!8626)

(declare-fun lt!361542 () SeekEntryResult!8626)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!807287 (= res!551552 (and (= lt!361542 lt!361546) (= lt!361546 (Found!8626 j!153)) (not (= (select (arr!21038 a!3170) index!1236) (select (arr!21038 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43921 (_ BitVec 32)) SeekEntryResult!8626)

(assert (=> b!807287 (= lt!361546 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21038 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43921 (_ BitVec 32)) SeekEntryResult!8626)

(assert (=> b!807287 (= lt!361542 (seekEntryOrOpen!0 (select (arr!21038 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807288 () Bool)

(declare-fun res!551551 () Bool)

(declare-fun e!446941 () Bool)

(assert (=> b!807288 (=> (not res!551551) (not e!446941))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807288 (= res!551551 (validKeyInArray!0 (select (arr!21038 a!3170) j!153)))))

(declare-fun b!807289 () Bool)

(declare-fun res!551554 () Bool)

(assert (=> b!807289 (=> (not res!551554) (not e!446941))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!807289 (= res!551554 (validKeyInArray!0 k0!2044))))

(declare-fun b!807290 () Bool)

(assert (=> b!807290 (= e!446940 e!446943)))

(declare-fun res!551557 () Bool)

(assert (=> b!807290 (=> (not res!551557) (not e!446943))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!361543 () (_ BitVec 64))

(declare-fun lt!361544 () array!43921)

(assert (=> b!807290 (= res!551557 (= (seekEntryOrOpen!0 lt!361543 lt!361544 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361543 lt!361544 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!807290 (= lt!361543 (select (store (arr!21038 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!807290 (= lt!361544 (array!43922 (store (arr!21038 a!3170) i!1163 k0!2044) (size!21459 a!3170)))))

(declare-fun b!807291 () Bool)

(declare-fun res!551549 () Bool)

(assert (=> b!807291 (=> (not res!551549) (not e!446941))))

(declare-fun arrayContainsKey!0 (array!43921 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807291 (= res!551549 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807292 () Bool)

(assert (=> b!807292 (= e!446941 e!446940)))

(declare-fun res!551558 () Bool)

(assert (=> b!807292 (=> (not res!551558) (not e!446940))))

(declare-fun lt!361545 () SeekEntryResult!8626)

(assert (=> b!807292 (= res!551558 (or (= lt!361545 (MissingZero!8626 i!1163)) (= lt!361545 (MissingVacant!8626 i!1163))))))

(assert (=> b!807292 (= lt!361545 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!807294 () Bool)

(assert (=> b!807294 (= e!446942 false)))

(declare-fun lt!361547 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807294 (= lt!361547 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807295 () Bool)

(declare-fun res!551559 () Bool)

(assert (=> b!807295 (=> (not res!551559) (not e!446941))))

(assert (=> b!807295 (= res!551559 (and (= (size!21459 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21459 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21459 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807296 () Bool)

(declare-fun res!551550 () Bool)

(assert (=> b!807296 (=> (not res!551550) (not e!446940))))

(assert (=> b!807296 (= res!551550 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21459 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21038 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21459 a!3170)) (= (select (arr!21038 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807293 () Bool)

(declare-fun res!551555 () Bool)

(assert (=> b!807293 (=> (not res!551555) (not e!446940))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43921 (_ BitVec 32)) Bool)

(assert (=> b!807293 (= res!551555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!551553 () Bool)

(assert (=> start!69204 (=> (not res!551553) (not e!446941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69204 (= res!551553 (validMask!0 mask!3266))))

(assert (=> start!69204 e!446941))

(assert (=> start!69204 true))

(declare-fun array_inv!16921 (array!43921) Bool)

(assert (=> start!69204 (array_inv!16921 a!3170)))

(assert (= (and start!69204 res!551553) b!807295))

(assert (= (and b!807295 res!551559) b!807288))

(assert (= (and b!807288 res!551551) b!807289))

(assert (= (and b!807289 res!551554) b!807291))

(assert (= (and b!807291 res!551549) b!807292))

(assert (= (and b!807292 res!551558) b!807293))

(assert (= (and b!807293 res!551555) b!807286))

(assert (= (and b!807286 res!551556) b!807296))

(assert (= (and b!807296 res!551550) b!807290))

(assert (= (and b!807290 res!551557) b!807287))

(assert (= (and b!807287 res!551552) b!807294))

(declare-fun m!748843 () Bool)

(assert (=> b!807291 m!748843))

(declare-fun m!748845 () Bool)

(assert (=> b!807294 m!748845))

(declare-fun m!748847 () Bool)

(assert (=> start!69204 m!748847))

(declare-fun m!748849 () Bool)

(assert (=> start!69204 m!748849))

(declare-fun m!748851 () Bool)

(assert (=> b!807286 m!748851))

(declare-fun m!748853 () Bool)

(assert (=> b!807287 m!748853))

(declare-fun m!748855 () Bool)

(assert (=> b!807287 m!748855))

(assert (=> b!807287 m!748855))

(declare-fun m!748857 () Bool)

(assert (=> b!807287 m!748857))

(assert (=> b!807287 m!748855))

(declare-fun m!748859 () Bool)

(assert (=> b!807287 m!748859))

(declare-fun m!748861 () Bool)

(assert (=> b!807293 m!748861))

(declare-fun m!748863 () Bool)

(assert (=> b!807296 m!748863))

(declare-fun m!748865 () Bool)

(assert (=> b!807296 m!748865))

(declare-fun m!748867 () Bool)

(assert (=> b!807290 m!748867))

(declare-fun m!748869 () Bool)

(assert (=> b!807290 m!748869))

(declare-fun m!748871 () Bool)

(assert (=> b!807290 m!748871))

(declare-fun m!748873 () Bool)

(assert (=> b!807290 m!748873))

(assert (=> b!807288 m!748855))

(assert (=> b!807288 m!748855))

(declare-fun m!748875 () Bool)

(assert (=> b!807288 m!748875))

(declare-fun m!748877 () Bool)

(assert (=> b!807289 m!748877))

(declare-fun m!748879 () Bool)

(assert (=> b!807292 m!748879))

(check-sat (not b!807290) (not b!807292) (not start!69204) (not b!807287) (not b!807293) (not b!807286) (not b!807294) (not b!807289) (not b!807291) (not b!807288))
(check-sat)
