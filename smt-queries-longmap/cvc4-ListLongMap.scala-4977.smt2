; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68376 () Bool)

(assert start!68376)

(declare-fun res!539034 () Bool)

(declare-fun e!441143 () Bool)

(assert (=> start!68376 (=> (not res!539034) (not e!441143))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68376 (= res!539034 (validMask!0 mask!3266))))

(assert (=> start!68376 e!441143))

(assert (=> start!68376 true))

(declare-datatypes ((array!43166 0))(
  ( (array!43167 (arr!20663 (Array (_ BitVec 32) (_ BitVec 64))) (size!21084 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43166)

(declare-fun array_inv!16459 (array!43166) Bool)

(assert (=> start!68376 (array_inv!16459 a!3170)))

(declare-fun b!794509 () Bool)

(declare-fun res!539029 () Bool)

(declare-fun e!441141 () Bool)

(assert (=> b!794509 (=> (not res!539029) (not e!441141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43166 (_ BitVec 32)) Bool)

(assert (=> b!794509 (= res!539029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794510 () Bool)

(declare-fun res!539031 () Bool)

(assert (=> b!794510 (=> (not res!539031) (not e!441143))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43166 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794510 (= res!539031 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794511 () Bool)

(assert (=> b!794511 (= e!441141 false)))

(declare-datatypes ((SeekEntryResult!8254 0))(
  ( (MissingZero!8254 (index!35384 (_ BitVec 32))) (Found!8254 (index!35385 (_ BitVec 32))) (Intermediate!8254 (undefined!9066 Bool) (index!35386 (_ BitVec 32)) (x!66308 (_ BitVec 32))) (Undefined!8254) (MissingVacant!8254 (index!35387 (_ BitVec 32))) )
))
(declare-fun lt!354176 () SeekEntryResult!8254)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354177 () (_ BitVec 64))

(declare-fun lt!354179 () array!43166)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43166 (_ BitVec 32)) SeekEntryResult!8254)

(assert (=> b!794511 (= lt!354176 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354177 lt!354179 mask!3266))))

(declare-fun lt!354178 () SeekEntryResult!8254)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43166 (_ BitVec 32)) SeekEntryResult!8254)

(assert (=> b!794511 (= lt!354178 (seekEntryOrOpen!0 lt!354177 lt!354179 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!794511 (= lt!354177 (select (store (arr!20663 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!794511 (= lt!354179 (array!43167 (store (arr!20663 a!3170) i!1163 k!2044) (size!21084 a!3170)))))

(declare-fun b!794512 () Bool)

(declare-fun res!539036 () Bool)

(assert (=> b!794512 (=> (not res!539036) (not e!441141))))

(declare-datatypes ((List!14626 0))(
  ( (Nil!14623) (Cons!14622 (h!15751 (_ BitVec 64)) (t!20941 List!14626)) )
))
(declare-fun arrayNoDuplicates!0 (array!43166 (_ BitVec 32) List!14626) Bool)

(assert (=> b!794512 (= res!539036 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14623))))

(declare-fun b!794513 () Bool)

(declare-fun res!539030 () Bool)

(assert (=> b!794513 (=> (not res!539030) (not e!441143))))

(assert (=> b!794513 (= res!539030 (and (= (size!21084 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21084 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21084 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794514 () Bool)

(assert (=> b!794514 (= e!441143 e!441141)))

(declare-fun res!539033 () Bool)

(assert (=> b!794514 (=> (not res!539033) (not e!441141))))

(declare-fun lt!354175 () SeekEntryResult!8254)

(assert (=> b!794514 (= res!539033 (or (= lt!354175 (MissingZero!8254 i!1163)) (= lt!354175 (MissingVacant!8254 i!1163))))))

(assert (=> b!794514 (= lt!354175 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!794515 () Bool)

(declare-fun res!539035 () Bool)

(assert (=> b!794515 (=> (not res!539035) (not e!441143))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794515 (= res!539035 (validKeyInArray!0 (select (arr!20663 a!3170) j!153)))))

(declare-fun b!794516 () Bool)

(declare-fun res!539032 () Bool)

(assert (=> b!794516 (=> (not res!539032) (not e!441143))))

(assert (=> b!794516 (= res!539032 (validKeyInArray!0 k!2044))))

(declare-fun b!794517 () Bool)

(declare-fun res!539028 () Bool)

(assert (=> b!794517 (=> (not res!539028) (not e!441141))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!794517 (= res!539028 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21084 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20663 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21084 a!3170)) (= (select (arr!20663 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68376 res!539034) b!794513))

(assert (= (and b!794513 res!539030) b!794515))

(assert (= (and b!794515 res!539035) b!794516))

(assert (= (and b!794516 res!539032) b!794510))

(assert (= (and b!794510 res!539031) b!794514))

(assert (= (and b!794514 res!539033) b!794509))

(assert (= (and b!794509 res!539029) b!794512))

(assert (= (and b!794512 res!539036) b!794517))

(assert (= (and b!794517 res!539028) b!794511))

(declare-fun m!735053 () Bool)

(assert (=> start!68376 m!735053))

(declare-fun m!735055 () Bool)

(assert (=> start!68376 m!735055))

(declare-fun m!735057 () Bool)

(assert (=> b!794517 m!735057))

(declare-fun m!735059 () Bool)

(assert (=> b!794517 m!735059))

(declare-fun m!735061 () Bool)

(assert (=> b!794512 m!735061))

(declare-fun m!735063 () Bool)

(assert (=> b!794515 m!735063))

(assert (=> b!794515 m!735063))

(declare-fun m!735065 () Bool)

(assert (=> b!794515 m!735065))

(declare-fun m!735067 () Bool)

(assert (=> b!794514 m!735067))

(declare-fun m!735069 () Bool)

(assert (=> b!794510 m!735069))

(declare-fun m!735071 () Bool)

(assert (=> b!794509 m!735071))

(declare-fun m!735073 () Bool)

(assert (=> b!794516 m!735073))

(declare-fun m!735075 () Bool)

(assert (=> b!794511 m!735075))

(declare-fun m!735077 () Bool)

(assert (=> b!794511 m!735077))

(declare-fun m!735079 () Bool)

(assert (=> b!794511 m!735079))

(declare-fun m!735081 () Bool)

(assert (=> b!794511 m!735081))

(push 1)

(assert (not b!794515))

(assert (not b!794509))

(assert (not b!794516))

(assert (not b!794512))

(assert (not b!794510))

(assert (not b!794514))

(assert (not start!68376))

(assert (not b!794511))

(check-sat)

(pop 1)

