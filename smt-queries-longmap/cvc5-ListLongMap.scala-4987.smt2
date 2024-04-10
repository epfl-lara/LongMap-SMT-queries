; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68432 () Bool)

(assert start!68432)

(declare-fun b!795375 () Bool)

(declare-fun e!441478 () Bool)

(declare-fun e!441477 () Bool)

(assert (=> b!795375 (= e!441478 e!441477)))

(declare-fun res!539894 () Bool)

(assert (=> b!795375 (=> (not res!539894) (not e!441477))))

(declare-datatypes ((SeekEntryResult!8282 0))(
  ( (MissingZero!8282 (index!35496 (_ BitVec 32))) (Found!8282 (index!35497 (_ BitVec 32))) (Intermediate!8282 (undefined!9094 Bool) (index!35498 (_ BitVec 32)) (x!66416 (_ BitVec 32))) (Undefined!8282) (MissingVacant!8282 (index!35499 (_ BitVec 32))) )
))
(declare-fun lt!354544 () SeekEntryResult!8282)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!795375 (= res!539894 (or (= lt!354544 (MissingZero!8282 i!1163)) (= lt!354544 (MissingVacant!8282 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43222 0))(
  ( (array!43223 (arr!20691 (Array (_ BitVec 32) (_ BitVec 64))) (size!21112 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43222)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43222 (_ BitVec 32)) SeekEntryResult!8282)

(assert (=> b!795375 (= lt!354544 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!795376 () Bool)

(declare-fun res!539899 () Bool)

(assert (=> b!795376 (=> (not res!539899) (not e!441477))))

(declare-datatypes ((List!14654 0))(
  ( (Nil!14651) (Cons!14650 (h!15779 (_ BitVec 64)) (t!20969 List!14654)) )
))
(declare-fun arrayNoDuplicates!0 (array!43222 (_ BitVec 32) List!14654) Bool)

(assert (=> b!795376 (= res!539899 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14651))))

(declare-fun b!795378 () Bool)

(declare-fun res!539903 () Bool)

(assert (=> b!795378 (=> (not res!539903) (not e!441478))))

(declare-fun arrayContainsKey!0 (array!43222 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795378 (= res!539903 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795379 () Bool)

(declare-fun res!539900 () Bool)

(assert (=> b!795379 (=> (not res!539900) (not e!441478))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795379 (= res!539900 (validKeyInArray!0 (select (arr!20691 a!3170) j!153)))))

(declare-fun b!795380 () Bool)

(declare-fun res!539898 () Bool)

(assert (=> b!795380 (=> (not res!539898) (not e!441478))))

(assert (=> b!795380 (= res!539898 (and (= (size!21112 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21112 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21112 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795381 () Bool)

(declare-fun e!441479 () Bool)

(assert (=> b!795381 (= e!441477 e!441479)))

(declare-fun res!539901 () Bool)

(assert (=> b!795381 (=> (not res!539901) (not e!441479))))

(declare-fun lt!354545 () array!43222)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354542 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43222 (_ BitVec 32)) SeekEntryResult!8282)

(assert (=> b!795381 (= res!539901 (= (seekEntryOrOpen!0 lt!354542 lt!354545 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354542 lt!354545 mask!3266)))))

(assert (=> b!795381 (= lt!354542 (select (store (arr!20691 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!795381 (= lt!354545 (array!43223 (store (arr!20691 a!3170) i!1163 k!2044) (size!21112 a!3170)))))

(declare-fun b!795382 () Bool)

(declare-fun res!539895 () Bool)

(assert (=> b!795382 (=> (not res!539895) (not e!441477))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!795382 (= res!539895 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21112 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20691 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21112 a!3170)) (= (select (arr!20691 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!539897 () Bool)

(assert (=> start!68432 (=> (not res!539897) (not e!441478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68432 (= res!539897 (validMask!0 mask!3266))))

(assert (=> start!68432 e!441478))

(assert (=> start!68432 true))

(declare-fun array_inv!16487 (array!43222) Bool)

(assert (=> start!68432 (array_inv!16487 a!3170)))

(declare-fun b!795377 () Bool)

(declare-fun res!539896 () Bool)

(assert (=> b!795377 (=> (not res!539896) (not e!441477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43222 (_ BitVec 32)) Bool)

(assert (=> b!795377 (= res!539896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795383 () Bool)

(declare-fun lt!354541 () SeekEntryResult!8282)

(declare-fun lt!354543 () SeekEntryResult!8282)

(assert (=> b!795383 (= e!441479 (and (= lt!354541 lt!354543) (= lt!354543 (Found!8282 j!153)) (= (select (arr!20691 a!3170) index!1236) (select (arr!20691 a!3170) j!153)) (bvslt mask!3266 #b00000000000000000000000000000000)))))

(assert (=> b!795383 (= lt!354543 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20691 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!795383 (= lt!354541 (seekEntryOrOpen!0 (select (arr!20691 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795384 () Bool)

(declare-fun res!539902 () Bool)

(assert (=> b!795384 (=> (not res!539902) (not e!441478))))

(assert (=> b!795384 (= res!539902 (validKeyInArray!0 k!2044))))

(assert (= (and start!68432 res!539897) b!795380))

(assert (= (and b!795380 res!539898) b!795379))

(assert (= (and b!795379 res!539900) b!795384))

(assert (= (and b!795384 res!539902) b!795378))

(assert (= (and b!795378 res!539903) b!795375))

(assert (= (and b!795375 res!539894) b!795377))

(assert (= (and b!795377 res!539896) b!795376))

(assert (= (and b!795376 res!539899) b!795382))

(assert (= (and b!795382 res!539895) b!795381))

(assert (= (and b!795381 res!539901) b!795383))

(declare-fun m!736001 () Bool)

(assert (=> b!795381 m!736001))

(declare-fun m!736003 () Bool)

(assert (=> b!795381 m!736003))

(declare-fun m!736005 () Bool)

(assert (=> b!795381 m!736005))

(declare-fun m!736007 () Bool)

(assert (=> b!795381 m!736007))

(declare-fun m!736009 () Bool)

(assert (=> b!795382 m!736009))

(declare-fun m!736011 () Bool)

(assert (=> b!795382 m!736011))

(declare-fun m!736013 () Bool)

(assert (=> b!795378 m!736013))

(declare-fun m!736015 () Bool)

(assert (=> b!795384 m!736015))

(declare-fun m!736017 () Bool)

(assert (=> start!68432 m!736017))

(declare-fun m!736019 () Bool)

(assert (=> start!68432 m!736019))

(declare-fun m!736021 () Bool)

(assert (=> b!795383 m!736021))

(declare-fun m!736023 () Bool)

(assert (=> b!795383 m!736023))

(assert (=> b!795383 m!736023))

(declare-fun m!736025 () Bool)

(assert (=> b!795383 m!736025))

(assert (=> b!795383 m!736023))

(declare-fun m!736027 () Bool)

(assert (=> b!795383 m!736027))

(declare-fun m!736029 () Bool)

(assert (=> b!795377 m!736029))

(assert (=> b!795379 m!736023))

(assert (=> b!795379 m!736023))

(declare-fun m!736031 () Bool)

(assert (=> b!795379 m!736031))

(declare-fun m!736033 () Bool)

(assert (=> b!795376 m!736033))

(declare-fun m!736035 () Bool)

(assert (=> b!795375 m!736035))

(push 1)

