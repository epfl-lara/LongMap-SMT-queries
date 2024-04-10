; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68970 () Bool)

(assert start!68970)

(declare-fun b!804537 () Bool)

(declare-fun res!549062 () Bool)

(declare-fun e!445696 () Bool)

(assert (=> b!804537 (=> (not res!549062) (not e!445696))))

(declare-datatypes ((array!43760 0))(
  ( (array!43761 (arr!20960 (Array (_ BitVec 32) (_ BitVec 64))) (size!21381 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43760)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43760 (_ BitVec 32)) Bool)

(assert (=> b!804537 (= res!549062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804538 () Bool)

(declare-fun e!445697 () Bool)

(assert (=> b!804538 (= e!445697 e!445696)))

(declare-fun res!549058 () Bool)

(assert (=> b!804538 (=> (not res!549058) (not e!445696))))

(declare-datatypes ((SeekEntryResult!8551 0))(
  ( (MissingZero!8551 (index!36572 (_ BitVec 32))) (Found!8551 (index!36573 (_ BitVec 32))) (Intermediate!8551 (undefined!9363 Bool) (index!36574 (_ BitVec 32)) (x!67397 (_ BitVec 32))) (Undefined!8551) (MissingVacant!8551 (index!36575 (_ BitVec 32))) )
))
(declare-fun lt!360182 () SeekEntryResult!8551)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804538 (= res!549058 (or (= lt!360182 (MissingZero!8551 i!1163)) (= lt!360182 (MissingVacant!8551 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43760 (_ BitVec 32)) SeekEntryResult!8551)

(assert (=> b!804538 (= lt!360182 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!804539 () Bool)

(declare-fun res!549060 () Bool)

(assert (=> b!804539 (=> (not res!549060) (not e!445697))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804539 (= res!549060 (validKeyInArray!0 (select (arr!20960 a!3170) j!153)))))

(declare-fun res!549057 () Bool)

(assert (=> start!68970 (=> (not res!549057) (not e!445697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68970 (= res!549057 (validMask!0 mask!3266))))

(assert (=> start!68970 e!445697))

(assert (=> start!68970 true))

(declare-fun array_inv!16756 (array!43760) Bool)

(assert (=> start!68970 (array_inv!16756 a!3170)))

(declare-fun b!804540 () Bool)

(declare-fun res!549059 () Bool)

(assert (=> b!804540 (=> (not res!549059) (not e!445697))))

(assert (=> b!804540 (= res!549059 (validKeyInArray!0 k!2044))))

(declare-fun b!804541 () Bool)

(assert (=> b!804541 (= e!445696 false)))

(declare-fun lt!360181 () Bool)

(declare-datatypes ((List!14923 0))(
  ( (Nil!14920) (Cons!14919 (h!16048 (_ BitVec 64)) (t!21238 List!14923)) )
))
(declare-fun arrayNoDuplicates!0 (array!43760 (_ BitVec 32) List!14923) Bool)

(assert (=> b!804541 (= lt!360181 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14920))))

(declare-fun b!804542 () Bool)

(declare-fun res!549056 () Bool)

(assert (=> b!804542 (=> (not res!549056) (not e!445697))))

(assert (=> b!804542 (= res!549056 (and (= (size!21381 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21381 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21381 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804543 () Bool)

(declare-fun res!549061 () Bool)

(assert (=> b!804543 (=> (not res!549061) (not e!445697))))

(declare-fun arrayContainsKey!0 (array!43760 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804543 (= res!549061 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68970 res!549057) b!804542))

(assert (= (and b!804542 res!549056) b!804539))

(assert (= (and b!804539 res!549060) b!804540))

(assert (= (and b!804540 res!549059) b!804543))

(assert (= (and b!804543 res!549061) b!804538))

(assert (= (and b!804538 res!549058) b!804537))

(assert (= (and b!804537 res!549062) b!804541))

(declare-fun m!746399 () Bool)

(assert (=> b!804540 m!746399))

(declare-fun m!746401 () Bool)

(assert (=> start!68970 m!746401))

(declare-fun m!746403 () Bool)

(assert (=> start!68970 m!746403))

(declare-fun m!746405 () Bool)

(assert (=> b!804537 m!746405))

(declare-fun m!746407 () Bool)

(assert (=> b!804543 m!746407))

(declare-fun m!746409 () Bool)

(assert (=> b!804538 m!746409))

(declare-fun m!746411 () Bool)

(assert (=> b!804541 m!746411))

(declare-fun m!746413 () Bool)

(assert (=> b!804539 m!746413))

(assert (=> b!804539 m!746413))

(declare-fun m!746415 () Bool)

(assert (=> b!804539 m!746415))

(push 1)

