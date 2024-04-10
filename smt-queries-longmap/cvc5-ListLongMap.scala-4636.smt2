; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64516 () Bool)

(assert start!64516)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41034 0))(
  ( (array!41035 (arr!19638 (Array (_ BitVec 32) (_ BitVec 64))) (size!20059 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41034)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!406637 () Bool)

(declare-fun b!726242 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7238 0))(
  ( (MissingZero!7238 (index!31320 (_ BitVec 32))) (Found!7238 (index!31321 (_ BitVec 32))) (Intermediate!7238 (undefined!8050 Bool) (index!31322 (_ BitVec 32)) (x!62312 (_ BitVec 32))) (Undefined!7238) (MissingVacant!7238 (index!31323 (_ BitVec 32))) )
))
(declare-fun lt!321630 () SeekEntryResult!7238)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41034 (_ BitVec 32)) SeekEntryResult!7238)

(assert (=> b!726242 (= e!406637 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19638 a!3186) j!159) a!3186 mask!3328) lt!321630))))

(declare-fun e!406638 () Bool)

(declare-fun b!726243 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!321632 () SeekEntryResult!7238)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41034 (_ BitVec 32)) SeekEntryResult!7238)

(assert (=> b!726243 (= e!406638 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19638 a!3186) j!159) a!3186 mask!3328) lt!321632))))

(declare-fun b!726244 () Bool)

(declare-fun res!487262 () Bool)

(declare-fun e!406639 () Bool)

(assert (=> b!726244 (=> (not res!487262) (not e!406639))))

(declare-datatypes ((List!13640 0))(
  ( (Nil!13637) (Cons!13636 (h!14693 (_ BitVec 64)) (t!19955 List!13640)) )
))
(declare-fun arrayNoDuplicates!0 (array!41034 (_ BitVec 32) List!13640) Bool)

(assert (=> b!726244 (= res!487262 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13637))))

(declare-fun b!726245 () Bool)

(declare-fun lt!321633 () SeekEntryResult!7238)

(declare-fun e!406636 () Bool)

(assert (=> b!726245 (= e!406636 (not (or (not (is-Intermediate!7238 lt!321633)) (bvsge x!1131 (x!62312 lt!321633)) (bvsge mask!3328 #b00000000000000000000000000000000))))))

(declare-fun e!406634 () Bool)

(assert (=> b!726245 e!406634))

(declare-fun res!487260 () Bool)

(assert (=> b!726245 (=> (not res!487260) (not e!406634))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41034 (_ BitVec 32)) Bool)

(assert (=> b!726245 (= res!487260 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24794 0))(
  ( (Unit!24795) )
))
(declare-fun lt!321629 () Unit!24794)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41034 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24794)

(assert (=> b!726245 (= lt!321629 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!726246 () Bool)

(declare-fun e!406635 () Bool)

(assert (=> b!726246 (= e!406635 e!406639)))

(declare-fun res!487249 () Bool)

(assert (=> b!726246 (=> (not res!487249) (not e!406639))))

(declare-fun lt!321628 () SeekEntryResult!7238)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!726246 (= res!487249 (or (= lt!321628 (MissingZero!7238 i!1173)) (= lt!321628 (MissingVacant!7238 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41034 (_ BitVec 32)) SeekEntryResult!7238)

(assert (=> b!726246 (= lt!321628 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!726247 () Bool)

(declare-fun e!406640 () Bool)

(assert (=> b!726247 (= e!406640 e!406636)))

(declare-fun res!487261 () Bool)

(assert (=> b!726247 (=> (not res!487261) (not e!406636))))

(declare-fun lt!321631 () SeekEntryResult!7238)

(assert (=> b!726247 (= res!487261 (= lt!321631 lt!321633))))

(declare-fun lt!321634 () array!41034)

(declare-fun lt!321635 () (_ BitVec 64))

(assert (=> b!726247 (= lt!321633 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321635 lt!321634 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726247 (= lt!321631 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321635 mask!3328) lt!321635 lt!321634 mask!3328))))

(assert (=> b!726247 (= lt!321635 (select (store (arr!19638 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!726247 (= lt!321634 (array!41035 (store (arr!19638 a!3186) i!1173 k!2102) (size!20059 a!3186)))))

(declare-fun b!726248 () Bool)

(assert (=> b!726248 (= e!406639 e!406640)))

(declare-fun res!487255 () Bool)

(assert (=> b!726248 (=> (not res!487255) (not e!406640))))

(assert (=> b!726248 (= res!487255 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19638 a!3186) j!159) mask!3328) (select (arr!19638 a!3186) j!159) a!3186 mask!3328) lt!321632))))

(assert (=> b!726248 (= lt!321632 (Intermediate!7238 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!726249 () Bool)

(declare-fun res!487258 () Bool)

(assert (=> b!726249 (=> (not res!487258) (not e!406635))))

(assert (=> b!726249 (= res!487258 (and (= (size!20059 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20059 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20059 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!726250 () Bool)

(assert (=> b!726250 (= e!406634 e!406637)))

(declare-fun res!487252 () Bool)

(assert (=> b!726250 (=> (not res!487252) (not e!406637))))

(assert (=> b!726250 (= res!487252 (= (seekEntryOrOpen!0 (select (arr!19638 a!3186) j!159) a!3186 mask!3328) lt!321630))))

(assert (=> b!726250 (= lt!321630 (Found!7238 j!159))))

(declare-fun res!487250 () Bool)

(assert (=> start!64516 (=> (not res!487250) (not e!406635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64516 (= res!487250 (validMask!0 mask!3328))))

(assert (=> start!64516 e!406635))

(assert (=> start!64516 true))

(declare-fun array_inv!15434 (array!41034) Bool)

(assert (=> start!64516 (array_inv!15434 a!3186)))

(declare-fun b!726251 () Bool)

(declare-fun res!487254 () Bool)

(assert (=> b!726251 (=> (not res!487254) (not e!406640))))

(assert (=> b!726251 (= res!487254 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19638 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!726252 () Bool)

(declare-fun res!487257 () Bool)

(assert (=> b!726252 (=> (not res!487257) (not e!406640))))

(assert (=> b!726252 (= res!487257 e!406638)))

(declare-fun c!79870 () Bool)

(assert (=> b!726252 (= c!79870 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726253 () Bool)

(declare-fun res!487253 () Bool)

(assert (=> b!726253 (=> (not res!487253) (not e!406635))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726253 (= res!487253 (validKeyInArray!0 (select (arr!19638 a!3186) j!159)))))

(declare-fun b!726254 () Bool)

(assert (=> b!726254 (= e!406638 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19638 a!3186) j!159) a!3186 mask!3328) (Found!7238 j!159)))))

(declare-fun b!726255 () Bool)

(declare-fun res!487256 () Bool)

(assert (=> b!726255 (=> (not res!487256) (not e!406635))))

(assert (=> b!726255 (= res!487256 (validKeyInArray!0 k!2102))))

(declare-fun b!726256 () Bool)

(declare-fun res!487251 () Bool)

(assert (=> b!726256 (=> (not res!487251) (not e!406639))))

(assert (=> b!726256 (= res!487251 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20059 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20059 a!3186))))))

(declare-fun b!726257 () Bool)

(declare-fun res!487259 () Bool)

(assert (=> b!726257 (=> (not res!487259) (not e!406635))))

(declare-fun arrayContainsKey!0 (array!41034 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726257 (= res!487259 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726258 () Bool)

(declare-fun res!487248 () Bool)

(assert (=> b!726258 (=> (not res!487248) (not e!406639))))

(assert (=> b!726258 (= res!487248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!64516 res!487250) b!726249))

(assert (= (and b!726249 res!487258) b!726253))

(assert (= (and b!726253 res!487253) b!726255))

(assert (= (and b!726255 res!487256) b!726257))

(assert (= (and b!726257 res!487259) b!726246))

(assert (= (and b!726246 res!487249) b!726258))

(assert (= (and b!726258 res!487248) b!726244))

(assert (= (and b!726244 res!487262) b!726256))

(assert (= (and b!726256 res!487251) b!726248))

(assert (= (and b!726248 res!487255) b!726251))

(assert (= (and b!726251 res!487254) b!726252))

(assert (= (and b!726252 c!79870) b!726243))

(assert (= (and b!726252 (not c!79870)) b!726254))

(assert (= (and b!726252 res!487257) b!726247))

(assert (= (and b!726247 res!487261) b!726245))

(assert (= (and b!726245 res!487260) b!726250))

(assert (= (and b!726250 res!487252) b!726242))

(declare-fun m!680323 () Bool)

(assert (=> b!726257 m!680323))

(declare-fun m!680325 () Bool)

(assert (=> b!726247 m!680325))

(declare-fun m!680327 () Bool)

(assert (=> b!726247 m!680327))

(declare-fun m!680329 () Bool)

(assert (=> b!726247 m!680329))

(declare-fun m!680331 () Bool)

(assert (=> b!726247 m!680331))

(assert (=> b!726247 m!680327))

(declare-fun m!680333 () Bool)

(assert (=> b!726247 m!680333))

(declare-fun m!680335 () Bool)

(assert (=> b!726248 m!680335))

(assert (=> b!726248 m!680335))

(declare-fun m!680337 () Bool)

(assert (=> b!726248 m!680337))

(assert (=> b!726248 m!680337))

(assert (=> b!726248 m!680335))

(declare-fun m!680339 () Bool)

(assert (=> b!726248 m!680339))

(declare-fun m!680341 () Bool)

(assert (=> b!726255 m!680341))

(declare-fun m!680343 () Bool)

(assert (=> b!726244 m!680343))

(declare-fun m!680345 () Bool)

(assert (=> b!726245 m!680345))

(declare-fun m!680347 () Bool)

(assert (=> b!726245 m!680347))

(declare-fun m!680349 () Bool)

(assert (=> b!726246 m!680349))

(assert (=> b!726253 m!680335))

(assert (=> b!726253 m!680335))

(declare-fun m!680351 () Bool)

(assert (=> b!726253 m!680351))

(declare-fun m!680353 () Bool)

(assert (=> b!726251 m!680353))

(declare-fun m!680355 () Bool)

(assert (=> start!64516 m!680355))

(declare-fun m!680357 () Bool)

(assert (=> start!64516 m!680357))

(assert (=> b!726242 m!680335))

(assert (=> b!726242 m!680335))

(declare-fun m!680359 () Bool)

(assert (=> b!726242 m!680359))

(assert (=> b!726254 m!680335))

(assert (=> b!726254 m!680335))

(declare-fun m!680361 () Bool)

(assert (=> b!726254 m!680361))

(assert (=> b!726243 m!680335))

(assert (=> b!726243 m!680335))

(declare-fun m!680363 () Bool)

(assert (=> b!726243 m!680363))

(declare-fun m!680365 () Bool)

(assert (=> b!726258 m!680365))

(assert (=> b!726250 m!680335))

(assert (=> b!726250 m!680335))

(declare-fun m!680367 () Bool)

(assert (=> b!726250 m!680367))

(push 1)

