; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68436 () Bool)

(assert start!68436)

(declare-fun b!795435 () Bool)

(declare-fun res!539954 () Bool)

(declare-fun e!441501 () Bool)

(assert (=> b!795435 (=> (not res!539954) (not e!441501))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((array!43226 0))(
  ( (array!43227 (arr!20693 (Array (_ BitVec 32) (_ BitVec 64))) (size!21114 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43226)

(assert (=> b!795435 (= res!539954 (and (= (size!21114 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21114 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21114 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795436 () Bool)

(declare-fun res!539962 () Bool)

(declare-fun e!441503 () Bool)

(assert (=> b!795436 (=> (not res!539962) (not e!441503))))

(declare-datatypes ((List!14656 0))(
  ( (Nil!14653) (Cons!14652 (h!15781 (_ BitVec 64)) (t!20971 List!14656)) )
))
(declare-fun arrayNoDuplicates!0 (array!43226 (_ BitVec 32) List!14656) Bool)

(assert (=> b!795436 (= res!539962 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14653))))

(declare-fun b!795437 () Bool)

(declare-fun res!539959 () Bool)

(assert (=> b!795437 (=> (not res!539959) (not e!441501))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43226 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795437 (= res!539959 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!8284 0))(
  ( (MissingZero!8284 (index!35504 (_ BitVec 32))) (Found!8284 (index!35505 (_ BitVec 32))) (Intermediate!8284 (undefined!9096 Bool) (index!35506 (_ BitVec 32)) (x!66418 (_ BitVec 32))) (Undefined!8284) (MissingVacant!8284 (index!35507 (_ BitVec 32))) )
))
(declare-fun lt!354571 () SeekEntryResult!8284)

(declare-fun e!441500 () Bool)

(declare-fun lt!354572 () SeekEntryResult!8284)

(declare-fun b!795438 () Bool)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!795438 (= e!441500 (and (= lt!354571 lt!354572) (= lt!354572 (Found!8284 j!153)) (= (select (arr!20693 a!3170) index!1236) (select (arr!20693 a!3170) j!153)) (bvslt mask!3266 #b00000000000000000000000000000000)))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43226 (_ BitVec 32)) SeekEntryResult!8284)

(assert (=> b!795438 (= lt!354572 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20693 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43226 (_ BitVec 32)) SeekEntryResult!8284)

(assert (=> b!795438 (= lt!354571 (seekEntryOrOpen!0 (select (arr!20693 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795439 () Bool)

(assert (=> b!795439 (= e!441503 e!441500)))

(declare-fun res!539961 () Bool)

(assert (=> b!795439 (=> (not res!539961) (not e!441500))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!354575 () (_ BitVec 64))

(declare-fun lt!354574 () array!43226)

(assert (=> b!795439 (= res!539961 (= (seekEntryOrOpen!0 lt!354575 lt!354574 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354575 lt!354574 mask!3266)))))

(assert (=> b!795439 (= lt!354575 (select (store (arr!20693 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!795439 (= lt!354574 (array!43227 (store (arr!20693 a!3170) i!1163 k!2044) (size!21114 a!3170)))))

(declare-fun b!795440 () Bool)

(declare-fun res!539957 () Bool)

(assert (=> b!795440 (=> (not res!539957) (not e!441501))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795440 (= res!539957 (validKeyInArray!0 k!2044))))

(declare-fun b!795441 () Bool)

(declare-fun res!539958 () Bool)

(assert (=> b!795441 (=> (not res!539958) (not e!441501))))

(assert (=> b!795441 (= res!539958 (validKeyInArray!0 (select (arr!20693 a!3170) j!153)))))

(declare-fun b!795442 () Bool)

(declare-fun res!539960 () Bool)

(assert (=> b!795442 (=> (not res!539960) (not e!441503))))

(assert (=> b!795442 (= res!539960 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21114 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20693 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21114 a!3170)) (= (select (arr!20693 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!539963 () Bool)

(assert (=> start!68436 (=> (not res!539963) (not e!441501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68436 (= res!539963 (validMask!0 mask!3266))))

(assert (=> start!68436 e!441501))

(assert (=> start!68436 true))

(declare-fun array_inv!16489 (array!43226) Bool)

(assert (=> start!68436 (array_inv!16489 a!3170)))

(declare-fun b!795443 () Bool)

(assert (=> b!795443 (= e!441501 e!441503)))

(declare-fun res!539956 () Bool)

(assert (=> b!795443 (=> (not res!539956) (not e!441503))))

(declare-fun lt!354573 () SeekEntryResult!8284)

(assert (=> b!795443 (= res!539956 (or (= lt!354573 (MissingZero!8284 i!1163)) (= lt!354573 (MissingVacant!8284 i!1163))))))

(assert (=> b!795443 (= lt!354573 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!795444 () Bool)

(declare-fun res!539955 () Bool)

(assert (=> b!795444 (=> (not res!539955) (not e!441503))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43226 (_ BitVec 32)) Bool)

(assert (=> b!795444 (= res!539955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68436 res!539963) b!795435))

(assert (= (and b!795435 res!539954) b!795441))

(assert (= (and b!795441 res!539958) b!795440))

(assert (= (and b!795440 res!539957) b!795437))

(assert (= (and b!795437 res!539959) b!795443))

(assert (= (and b!795443 res!539956) b!795444))

(assert (= (and b!795444 res!539955) b!795436))

(assert (= (and b!795436 res!539962) b!795442))

(assert (= (and b!795442 res!539960) b!795439))

(assert (= (and b!795439 res!539961) b!795438))

(declare-fun m!736073 () Bool)

(assert (=> b!795444 m!736073))

(declare-fun m!736075 () Bool)

(assert (=> b!795443 m!736075))

(declare-fun m!736077 () Bool)

(assert (=> b!795436 m!736077))

(declare-fun m!736079 () Bool)

(assert (=> b!795441 m!736079))

(assert (=> b!795441 m!736079))

(declare-fun m!736081 () Bool)

(assert (=> b!795441 m!736081))

(declare-fun m!736083 () Bool)

(assert (=> b!795439 m!736083))

(declare-fun m!736085 () Bool)

(assert (=> b!795439 m!736085))

(declare-fun m!736087 () Bool)

(assert (=> b!795439 m!736087))

(declare-fun m!736089 () Bool)

(assert (=> b!795439 m!736089))

(declare-fun m!736091 () Bool)

(assert (=> start!68436 m!736091))

(declare-fun m!736093 () Bool)

(assert (=> start!68436 m!736093))

(declare-fun m!736095 () Bool)

(assert (=> b!795438 m!736095))

(assert (=> b!795438 m!736079))

(assert (=> b!795438 m!736079))

(declare-fun m!736097 () Bool)

(assert (=> b!795438 m!736097))

(assert (=> b!795438 m!736079))

(declare-fun m!736099 () Bool)

(assert (=> b!795438 m!736099))

(declare-fun m!736101 () Bool)

(assert (=> b!795437 m!736101))

(declare-fun m!736103 () Bool)

(assert (=> b!795440 m!736103))

(declare-fun m!736105 () Bool)

(assert (=> b!795442 m!736105))

(declare-fun m!736107 () Bool)

(assert (=> b!795442 m!736107))

(push 1)

(assert (not b!795439))

(assert (not b!795438))

(assert (not b!795436))

(assert (not b!795443))

(assert (not b!795444))

(assert (not b!795440))

