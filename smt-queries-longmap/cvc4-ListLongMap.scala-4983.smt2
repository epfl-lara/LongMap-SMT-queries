; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68412 () Bool)

(assert start!68412)

(declare-fun b!795074 () Bool)

(declare-fun res!539597 () Bool)

(declare-fun e!441356 () Bool)

(assert (=> b!795074 (=> (not res!539597) (not e!441356))))

(declare-datatypes ((array!43202 0))(
  ( (array!43203 (arr!20681 (Array (_ BitVec 32) (_ BitVec 64))) (size!21102 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43202)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43202 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795074 (= res!539597 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795075 () Bool)

(declare-fun res!539600 () Bool)

(declare-fun e!441358 () Bool)

(assert (=> b!795075 (=> (not res!539600) (not e!441358))))

(declare-datatypes ((List!14644 0))(
  ( (Nil!14641) (Cons!14640 (h!15769 (_ BitVec 64)) (t!20959 List!14644)) )
))
(declare-fun arrayNoDuplicates!0 (array!43202 (_ BitVec 32) List!14644) Bool)

(assert (=> b!795075 (= res!539600 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14641))))

(declare-fun b!795076 () Bool)

(declare-fun e!441357 () Bool)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!795076 (= e!441357 (and (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (or (bvslt vacantBefore!23 #b00000000000000000000000000000000) (bvsge vacantBefore!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun b!795078 () Bool)

(declare-fun res!539598 () Bool)

(assert (=> b!795078 (=> (not res!539598) (not e!441356))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!795078 (= res!539598 (and (= (size!21102 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21102 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21102 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795079 () Bool)

(declare-fun res!539593 () Bool)

(assert (=> b!795079 (=> (not res!539593) (not e!441358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43202 (_ BitVec 32)) Bool)

(assert (=> b!795079 (= res!539593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795080 () Bool)

(assert (=> b!795080 (= e!441358 e!441357)))

(declare-fun res!539601 () Bool)

(assert (=> b!795080 (=> (not res!539601) (not e!441357))))

(declare-fun lt!354395 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354394 () array!43202)

(declare-datatypes ((SeekEntryResult!8272 0))(
  ( (MissingZero!8272 (index!35456 (_ BitVec 32))) (Found!8272 (index!35457 (_ BitVec 32))) (Intermediate!8272 (undefined!9084 Bool) (index!35458 (_ BitVec 32)) (x!66374 (_ BitVec 32))) (Undefined!8272) (MissingVacant!8272 (index!35459 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43202 (_ BitVec 32)) SeekEntryResult!8272)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43202 (_ BitVec 32)) SeekEntryResult!8272)

(assert (=> b!795080 (= res!539601 (= (seekEntryOrOpen!0 lt!354395 lt!354394 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354395 lt!354394 mask!3266)))))

(assert (=> b!795080 (= lt!354395 (select (store (arr!20681 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!795080 (= lt!354394 (array!43203 (store (arr!20681 a!3170) i!1163 k!2044) (size!21102 a!3170)))))

(declare-fun b!795081 () Bool)

(declare-fun res!539594 () Bool)

(assert (=> b!795081 (=> (not res!539594) (not e!441357))))

(assert (=> b!795081 (= res!539594 (= (seekEntryOrOpen!0 (select (arr!20681 a!3170) j!153) a!3170 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20681 a!3170) j!153) a!3170 mask!3266)))))

(declare-fun b!795082 () Bool)

(declare-fun res!539596 () Bool)

(assert (=> b!795082 (=> (not res!539596) (not e!441356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795082 (= res!539596 (validKeyInArray!0 (select (arr!20681 a!3170) j!153)))))

(declare-fun b!795083 () Bool)

(declare-fun res!539595 () Bool)

(assert (=> b!795083 (=> (not res!539595) (not e!441358))))

(assert (=> b!795083 (= res!539595 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21102 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20681 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21102 a!3170)) (= (select (arr!20681 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795084 () Bool)

(declare-fun res!539603 () Bool)

(assert (=> b!795084 (=> (not res!539603) (not e!441356))))

(assert (=> b!795084 (= res!539603 (validKeyInArray!0 k!2044))))

(declare-fun res!539599 () Bool)

(assert (=> start!68412 (=> (not res!539599) (not e!441356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68412 (= res!539599 (validMask!0 mask!3266))))

(assert (=> start!68412 e!441356))

(assert (=> start!68412 true))

(declare-fun array_inv!16477 (array!43202) Bool)

(assert (=> start!68412 (array_inv!16477 a!3170)))

(declare-fun b!795077 () Bool)

(assert (=> b!795077 (= e!441356 e!441358)))

(declare-fun res!539602 () Bool)

(assert (=> b!795077 (=> (not res!539602) (not e!441358))))

(declare-fun lt!354393 () SeekEntryResult!8272)

(assert (=> b!795077 (= res!539602 (or (= lt!354393 (MissingZero!8272 i!1163)) (= lt!354393 (MissingVacant!8272 i!1163))))))

(assert (=> b!795077 (= lt!354393 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68412 res!539599) b!795078))

(assert (= (and b!795078 res!539598) b!795082))

(assert (= (and b!795082 res!539596) b!795084))

(assert (= (and b!795084 res!539603) b!795074))

(assert (= (and b!795074 res!539597) b!795077))

(assert (= (and b!795077 res!539602) b!795079))

(assert (= (and b!795079 res!539593) b!795075))

(assert (= (and b!795075 res!539600) b!795083))

(assert (= (and b!795083 res!539595) b!795080))

(assert (= (and b!795080 res!539601) b!795081))

(assert (= (and b!795081 res!539594) b!795076))

(declare-fun m!735661 () Bool)

(assert (=> b!795077 m!735661))

(declare-fun m!735663 () Bool)

(assert (=> b!795074 m!735663))

(declare-fun m!735665 () Bool)

(assert (=> b!795083 m!735665))

(declare-fun m!735667 () Bool)

(assert (=> b!795083 m!735667))

(declare-fun m!735669 () Bool)

(assert (=> start!68412 m!735669))

(declare-fun m!735671 () Bool)

(assert (=> start!68412 m!735671))

(declare-fun m!735673 () Bool)

(assert (=> b!795079 m!735673))

(declare-fun m!735675 () Bool)

(assert (=> b!795075 m!735675))

(declare-fun m!735677 () Bool)

(assert (=> b!795082 m!735677))

(assert (=> b!795082 m!735677))

(declare-fun m!735679 () Bool)

(assert (=> b!795082 m!735679))

(declare-fun m!735681 () Bool)

(assert (=> b!795080 m!735681))

(declare-fun m!735683 () Bool)

(assert (=> b!795080 m!735683))

(declare-fun m!735685 () Bool)

(assert (=> b!795080 m!735685))

(declare-fun m!735687 () Bool)

(assert (=> b!795080 m!735687))

(assert (=> b!795081 m!735677))

(assert (=> b!795081 m!735677))

(declare-fun m!735689 () Bool)

(assert (=> b!795081 m!735689))

(assert (=> b!795081 m!735677))

(declare-fun m!735691 () Bool)

(assert (=> b!795081 m!735691))

(declare-fun m!735693 () Bool)

(assert (=> b!795084 m!735693))

(push 1)

(assert (not b!795082))

(assert (not b!795081))

(assert (not b!795084))

(assert (not b!795079))

(assert (not b!795075))

(assert (not b!795074))

(assert (not b!795080))

(assert (not b!795077))

(assert (not start!68412))

(check-sat)

(pop 1)

(push 1)

(check-sat)

