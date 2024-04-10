; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28218 () Bool)

(assert start!28218)

(declare-fun b!288973 () Bool)

(declare-fun res!150603 () Bool)

(declare-fun e!182961 () Bool)

(assert (=> b!288973 (=> (not res!150603) (not e!182961))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288973 (= res!150603 (validKeyInArray!0 k!2524))))

(declare-fun b!288974 () Bool)

(declare-fun res!150600 () Bool)

(assert (=> b!288974 (=> (not res!150600) (not e!182961))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14532 0))(
  ( (array!14533 (arr!6893 (Array (_ BitVec 32) (_ BitVec 64))) (size!7245 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14532)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!288974 (= res!150600 (and (= (size!7245 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7245 a!3312))))))

(declare-fun b!288975 () Bool)

(declare-fun e!182962 () Bool)

(assert (=> b!288975 (= e!182962 (not true))))

(declare-datatypes ((SeekEntryResult!2042 0))(
  ( (MissingZero!2042 (index!10338 (_ BitVec 32))) (Found!2042 (index!10339 (_ BitVec 32))) (Intermediate!2042 (undefined!2854 Bool) (index!10340 (_ BitVec 32)) (x!28551 (_ BitVec 32))) (Undefined!2042) (MissingVacant!2042 (index!10341 (_ BitVec 32))) )
))
(declare-fun lt!142482 () SeekEntryResult!2042)

(assert (=> b!288975 (and (= (select (arr!6893 a!3312) (index!10340 lt!142482)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10340 lt!142482) i!1256))))

(declare-fun b!288976 () Bool)

(declare-fun e!182960 () Bool)

(assert (=> b!288976 (= e!182960 e!182962)))

(declare-fun res!150598 () Bool)

(assert (=> b!288976 (=> (not res!150598) (not e!182962))))

(declare-fun lt!142484 () Bool)

(assert (=> b!288976 (= res!150598 (and (or lt!142484 (not (undefined!2854 lt!142482))) (or lt!142484 (not (= (select (arr!6893 a!3312) (index!10340 lt!142482)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142484 (not (= (select (arr!6893 a!3312) (index!10340 lt!142482)) k!2524))) (not lt!142484)))))

(assert (=> b!288976 (= lt!142484 (not (is-Intermediate!2042 lt!142482)))))

(declare-fun res!150596 () Bool)

(assert (=> start!28218 (=> (not res!150596) (not e!182961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28218 (= res!150596 (validMask!0 mask!3809))))

(assert (=> start!28218 e!182961))

(assert (=> start!28218 true))

(declare-fun array_inv!4856 (array!14532) Bool)

(assert (=> start!28218 (array_inv!4856 a!3312)))

(declare-fun b!288977 () Bool)

(declare-fun res!150602 () Bool)

(declare-fun e!182963 () Bool)

(assert (=> b!288977 (=> (not res!150602) (not e!182963))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14532 (_ BitVec 32)) Bool)

(assert (=> b!288977 (= res!150602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288978 () Bool)

(declare-fun res!150599 () Bool)

(assert (=> b!288978 (=> (not res!150599) (not e!182961))))

(declare-fun arrayContainsKey!0 (array!14532 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288978 (= res!150599 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288979 () Bool)

(assert (=> b!288979 (= e!182963 e!182960)))

(declare-fun res!150601 () Bool)

(assert (=> b!288979 (=> (not res!150601) (not e!182960))))

(declare-fun lt!142486 () Bool)

(assert (=> b!288979 (= res!150601 lt!142486)))

(declare-fun lt!142485 () SeekEntryResult!2042)

(declare-fun lt!142481 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14532 (_ BitVec 32)) SeekEntryResult!2042)

(assert (=> b!288979 (= lt!142485 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142481 k!2524 (array!14533 (store (arr!6893 a!3312) i!1256 k!2524) (size!7245 a!3312)) mask!3809))))

(assert (=> b!288979 (= lt!142482 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142481 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288979 (= lt!142481 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!288980 () Bool)

(assert (=> b!288980 (= e!182961 e!182963)))

(declare-fun res!150597 () Bool)

(assert (=> b!288980 (=> (not res!150597) (not e!182963))))

(declare-fun lt!142483 () SeekEntryResult!2042)

(assert (=> b!288980 (= res!150597 (or lt!142486 (= lt!142483 (MissingVacant!2042 i!1256))))))

(assert (=> b!288980 (= lt!142486 (= lt!142483 (MissingZero!2042 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14532 (_ BitVec 32)) SeekEntryResult!2042)

(assert (=> b!288980 (= lt!142483 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!28218 res!150596) b!288974))

(assert (= (and b!288974 res!150600) b!288973))

(assert (= (and b!288973 res!150603) b!288978))

(assert (= (and b!288978 res!150599) b!288980))

(assert (= (and b!288980 res!150597) b!288977))

(assert (= (and b!288977 res!150602) b!288979))

(assert (= (and b!288979 res!150601) b!288976))

(assert (= (and b!288976 res!150598) b!288975))

(declare-fun m!303159 () Bool)

(assert (=> b!288979 m!303159))

(declare-fun m!303161 () Bool)

(assert (=> b!288979 m!303161))

(declare-fun m!303163 () Bool)

(assert (=> b!288979 m!303163))

(declare-fun m!303165 () Bool)

(assert (=> b!288979 m!303165))

(declare-fun m!303167 () Bool)

(assert (=> b!288975 m!303167))

(declare-fun m!303169 () Bool)

(assert (=> b!288977 m!303169))

(declare-fun m!303171 () Bool)

(assert (=> start!28218 m!303171))

(declare-fun m!303173 () Bool)

(assert (=> start!28218 m!303173))

(declare-fun m!303175 () Bool)

(assert (=> b!288978 m!303175))

(assert (=> b!288976 m!303167))

(declare-fun m!303177 () Bool)

(assert (=> b!288973 m!303177))

(declare-fun m!303179 () Bool)

(assert (=> b!288980 m!303179))

(push 1)

