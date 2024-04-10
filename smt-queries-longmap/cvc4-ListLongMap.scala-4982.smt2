; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68406 () Bool)

(assert start!68406)

(declare-fun b!794976 () Bool)

(declare-fun res!539499 () Bool)

(declare-fun e!441321 () Bool)

(assert (=> b!794976 (=> (not res!539499) (not e!441321))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43196 0))(
  ( (array!43197 (arr!20678 (Array (_ BitVec 32) (_ BitVec 64))) (size!21099 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43196)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!794976 (= res!539499 (and (= (size!21099 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21099 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21099 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794977 () Bool)

(declare-fun res!539500 () Bool)

(assert (=> b!794977 (=> (not res!539500) (not e!441321))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794977 (= res!539500 (validKeyInArray!0 k!2044))))

(declare-fun b!794979 () Bool)

(declare-fun e!441320 () Bool)

(declare-fun e!441323 () Bool)

(assert (=> b!794979 (= e!441320 e!441323)))

(declare-fun res!539504 () Bool)

(assert (=> b!794979 (=> (not res!539504) (not e!441323))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354366 () array!43196)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!354365 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8269 0))(
  ( (MissingZero!8269 (index!35444 (_ BitVec 32))) (Found!8269 (index!35445 (_ BitVec 32))) (Intermediate!8269 (undefined!9081 Bool) (index!35446 (_ BitVec 32)) (x!66363 (_ BitVec 32))) (Undefined!8269) (MissingVacant!8269 (index!35447 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43196 (_ BitVec 32)) SeekEntryResult!8269)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43196 (_ BitVec 32)) SeekEntryResult!8269)

(assert (=> b!794979 (= res!539504 (= (seekEntryOrOpen!0 lt!354365 lt!354366 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354365 lt!354366 mask!3266)))))

(assert (=> b!794979 (= lt!354365 (select (store (arr!20678 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!794979 (= lt!354366 (array!43197 (store (arr!20678 a!3170) i!1163 k!2044) (size!21099 a!3170)))))

(declare-fun b!794980 () Bool)

(assert (=> b!794980 (= e!441321 e!441320)))

(declare-fun res!539498 () Bool)

(assert (=> b!794980 (=> (not res!539498) (not e!441320))))

(declare-fun lt!354364 () SeekEntryResult!8269)

(assert (=> b!794980 (= res!539498 (or (= lt!354364 (MissingZero!8269 i!1163)) (= lt!354364 (MissingVacant!8269 i!1163))))))

(assert (=> b!794980 (= lt!354364 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!794981 () Bool)

(declare-fun res!539501 () Bool)

(assert (=> b!794981 (=> (not res!539501) (not e!441320))))

(declare-datatypes ((List!14641 0))(
  ( (Nil!14638) (Cons!14637 (h!15766 (_ BitVec 64)) (t!20956 List!14641)) )
))
(declare-fun arrayNoDuplicates!0 (array!43196 (_ BitVec 32) List!14641) Bool)

(assert (=> b!794981 (= res!539501 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14638))))

(declare-fun b!794982 () Bool)

(assert (=> b!794982 (= e!441323 false)))

(declare-fun lt!354368 () SeekEntryResult!8269)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!794982 (= lt!354368 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20678 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354367 () SeekEntryResult!8269)

(assert (=> b!794982 (= lt!354367 (seekEntryOrOpen!0 (select (arr!20678 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!794983 () Bool)

(declare-fun res!539502 () Bool)

(assert (=> b!794983 (=> (not res!539502) (not e!441320))))

(assert (=> b!794983 (= res!539502 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21099 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20678 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21099 a!3170)) (= (select (arr!20678 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794984 () Bool)

(declare-fun res!539495 () Bool)

(assert (=> b!794984 (=> (not res!539495) (not e!441321))))

(declare-fun arrayContainsKey!0 (array!43196 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794984 (= res!539495 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794985 () Bool)

(declare-fun res!539496 () Bool)

(assert (=> b!794985 (=> (not res!539496) (not e!441320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43196 (_ BitVec 32)) Bool)

(assert (=> b!794985 (= res!539496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794978 () Bool)

(declare-fun res!539503 () Bool)

(assert (=> b!794978 (=> (not res!539503) (not e!441321))))

(assert (=> b!794978 (= res!539503 (validKeyInArray!0 (select (arr!20678 a!3170) j!153)))))

(declare-fun res!539497 () Bool)

(assert (=> start!68406 (=> (not res!539497) (not e!441321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68406 (= res!539497 (validMask!0 mask!3266))))

(assert (=> start!68406 e!441321))

(assert (=> start!68406 true))

(declare-fun array_inv!16474 (array!43196) Bool)

(assert (=> start!68406 (array_inv!16474 a!3170)))

(assert (= (and start!68406 res!539497) b!794976))

(assert (= (and b!794976 res!539499) b!794978))

(assert (= (and b!794978 res!539503) b!794977))

(assert (= (and b!794977 res!539500) b!794984))

(assert (= (and b!794984 res!539495) b!794980))

(assert (= (and b!794980 res!539498) b!794985))

(assert (= (and b!794985 res!539496) b!794981))

(assert (= (and b!794981 res!539501) b!794983))

(assert (= (and b!794983 res!539502) b!794979))

(assert (= (and b!794979 res!539504) b!794982))

(declare-fun m!735559 () Bool)

(assert (=> b!794978 m!735559))

(assert (=> b!794978 m!735559))

(declare-fun m!735561 () Bool)

(assert (=> b!794978 m!735561))

(declare-fun m!735563 () Bool)

(assert (=> b!794981 m!735563))

(declare-fun m!735565 () Bool)

(assert (=> b!794977 m!735565))

(declare-fun m!735567 () Bool)

(assert (=> start!68406 m!735567))

(declare-fun m!735569 () Bool)

(assert (=> start!68406 m!735569))

(declare-fun m!735571 () Bool)

(assert (=> b!794979 m!735571))

(declare-fun m!735573 () Bool)

(assert (=> b!794979 m!735573))

(declare-fun m!735575 () Bool)

(assert (=> b!794979 m!735575))

(declare-fun m!735577 () Bool)

(assert (=> b!794979 m!735577))

(declare-fun m!735579 () Bool)

(assert (=> b!794980 m!735579))

(declare-fun m!735581 () Bool)

(assert (=> b!794983 m!735581))

(declare-fun m!735583 () Bool)

(assert (=> b!794983 m!735583))

(assert (=> b!794982 m!735559))

(assert (=> b!794982 m!735559))

(declare-fun m!735585 () Bool)

(assert (=> b!794982 m!735585))

(assert (=> b!794982 m!735559))

(declare-fun m!735587 () Bool)

(assert (=> b!794982 m!735587))

(declare-fun m!735589 () Bool)

(assert (=> b!794984 m!735589))

(declare-fun m!735591 () Bool)

(assert (=> b!794985 m!735591))

(push 1)

