; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68404 () Bool)

(assert start!68404)

(declare-fun b!794946 () Bool)

(declare-fun e!441308 () Bool)

(assert (=> b!794946 (= e!441308 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43194 0))(
  ( (array!43195 (arr!20677 (Array (_ BitVec 32) (_ BitVec 64))) (size!21098 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43194)

(declare-datatypes ((SeekEntryResult!8268 0))(
  ( (MissingZero!8268 (index!35440 (_ BitVec 32))) (Found!8268 (index!35441 (_ BitVec 32))) (Intermediate!8268 (undefined!9080 Bool) (index!35442 (_ BitVec 32)) (x!66362 (_ BitVec 32))) (Undefined!8268) (MissingVacant!8268 (index!35443 (_ BitVec 32))) )
))
(declare-fun lt!354349 () SeekEntryResult!8268)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43194 (_ BitVec 32)) SeekEntryResult!8268)

(assert (=> b!794946 (= lt!354349 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20677 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354351 () SeekEntryResult!8268)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43194 (_ BitVec 32)) SeekEntryResult!8268)

(assert (=> b!794946 (= lt!354351 (seekEntryOrOpen!0 (select (arr!20677 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!539467 () Bool)

(declare-fun e!441309 () Bool)

(assert (=> start!68404 (=> (not res!539467) (not e!441309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68404 (= res!539467 (validMask!0 mask!3266))))

(assert (=> start!68404 e!441309))

(assert (=> start!68404 true))

(declare-fun array_inv!16473 (array!43194) Bool)

(assert (=> start!68404 (array_inv!16473 a!3170)))

(declare-fun b!794947 () Bool)

(declare-fun res!539473 () Bool)

(declare-fun e!441310 () Bool)

(assert (=> b!794947 (=> (not res!539473) (not e!441310))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!794947 (= res!539473 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21098 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20677 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21098 a!3170)) (= (select (arr!20677 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794948 () Bool)

(declare-fun res!539474 () Bool)

(assert (=> b!794948 (=> (not res!539474) (not e!441309))))

(assert (=> b!794948 (= res!539474 (and (= (size!21098 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21098 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21098 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794949 () Bool)

(assert (=> b!794949 (= e!441310 e!441308)))

(declare-fun res!539466 () Bool)

(assert (=> b!794949 (=> (not res!539466) (not e!441308))))

(declare-fun lt!354352 () array!43194)

(declare-fun lt!354353 () (_ BitVec 64))

(assert (=> b!794949 (= res!539466 (= (seekEntryOrOpen!0 lt!354353 lt!354352 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354353 lt!354352 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!794949 (= lt!354353 (select (store (arr!20677 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794949 (= lt!354352 (array!43195 (store (arr!20677 a!3170) i!1163 k0!2044) (size!21098 a!3170)))))

(declare-fun b!794950 () Bool)

(assert (=> b!794950 (= e!441309 e!441310)))

(declare-fun res!539471 () Bool)

(assert (=> b!794950 (=> (not res!539471) (not e!441310))))

(declare-fun lt!354350 () SeekEntryResult!8268)

(assert (=> b!794950 (= res!539471 (or (= lt!354350 (MissingZero!8268 i!1163)) (= lt!354350 (MissingVacant!8268 i!1163))))))

(assert (=> b!794950 (= lt!354350 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!794951 () Bool)

(declare-fun res!539465 () Bool)

(assert (=> b!794951 (=> (not res!539465) (not e!441310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43194 (_ BitVec 32)) Bool)

(assert (=> b!794951 (= res!539465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794952 () Bool)

(declare-fun res!539468 () Bool)

(assert (=> b!794952 (=> (not res!539468) (not e!441309))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794952 (= res!539468 (validKeyInArray!0 k0!2044))))

(declare-fun b!794953 () Bool)

(declare-fun res!539472 () Bool)

(assert (=> b!794953 (=> (not res!539472) (not e!441309))))

(declare-fun arrayContainsKey!0 (array!43194 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794953 (= res!539472 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794954 () Bool)

(declare-fun res!539469 () Bool)

(assert (=> b!794954 (=> (not res!539469) (not e!441310))))

(declare-datatypes ((List!14640 0))(
  ( (Nil!14637) (Cons!14636 (h!15765 (_ BitVec 64)) (t!20955 List!14640)) )
))
(declare-fun arrayNoDuplicates!0 (array!43194 (_ BitVec 32) List!14640) Bool)

(assert (=> b!794954 (= res!539469 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14637))))

(declare-fun b!794955 () Bool)

(declare-fun res!539470 () Bool)

(assert (=> b!794955 (=> (not res!539470) (not e!441309))))

(assert (=> b!794955 (= res!539470 (validKeyInArray!0 (select (arr!20677 a!3170) j!153)))))

(assert (= (and start!68404 res!539467) b!794948))

(assert (= (and b!794948 res!539474) b!794955))

(assert (= (and b!794955 res!539470) b!794952))

(assert (= (and b!794952 res!539468) b!794953))

(assert (= (and b!794953 res!539472) b!794950))

(assert (= (and b!794950 res!539471) b!794951))

(assert (= (and b!794951 res!539465) b!794954))

(assert (= (and b!794954 res!539469) b!794947))

(assert (= (and b!794947 res!539473) b!794949))

(assert (= (and b!794949 res!539466) b!794946))

(declare-fun m!735525 () Bool)

(assert (=> b!794955 m!735525))

(assert (=> b!794955 m!735525))

(declare-fun m!735527 () Bool)

(assert (=> b!794955 m!735527))

(assert (=> b!794946 m!735525))

(assert (=> b!794946 m!735525))

(declare-fun m!735529 () Bool)

(assert (=> b!794946 m!735529))

(assert (=> b!794946 m!735525))

(declare-fun m!735531 () Bool)

(assert (=> b!794946 m!735531))

(declare-fun m!735533 () Bool)

(assert (=> b!794953 m!735533))

(declare-fun m!735535 () Bool)

(assert (=> b!794952 m!735535))

(declare-fun m!735537 () Bool)

(assert (=> b!794950 m!735537))

(declare-fun m!735539 () Bool)

(assert (=> b!794951 m!735539))

(declare-fun m!735541 () Bool)

(assert (=> start!68404 m!735541))

(declare-fun m!735543 () Bool)

(assert (=> start!68404 m!735543))

(declare-fun m!735545 () Bool)

(assert (=> b!794954 m!735545))

(declare-fun m!735547 () Bool)

(assert (=> b!794949 m!735547))

(declare-fun m!735549 () Bool)

(assert (=> b!794949 m!735549))

(declare-fun m!735551 () Bool)

(assert (=> b!794949 m!735551))

(declare-fun m!735553 () Bool)

(assert (=> b!794949 m!735553))

(declare-fun m!735555 () Bool)

(assert (=> b!794947 m!735555))

(declare-fun m!735557 () Bool)

(assert (=> b!794947 m!735557))

(check-sat (not start!68404) (not b!794950) (not b!794946) (not b!794954) (not b!794951) (not b!794949) (not b!794953) (not b!794955) (not b!794952))
