; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68370 () Bool)

(assert start!68370)

(declare-fun b!794428 () Bool)

(declare-fun res!538949 () Bool)

(declare-fun e!441115 () Bool)

(assert (=> b!794428 (=> (not res!538949) (not e!441115))))

(declare-datatypes ((array!43160 0))(
  ( (array!43161 (arr!20660 (Array (_ BitVec 32) (_ BitVec 64))) (size!21081 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43160)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794428 (= res!538949 (validKeyInArray!0 (select (arr!20660 a!3170) j!153)))))

(declare-fun res!538952 () Bool)

(assert (=> start!68370 (=> (not res!538952) (not e!441115))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68370 (= res!538952 (validMask!0 mask!3266))))

(assert (=> start!68370 e!441115))

(assert (=> start!68370 true))

(declare-fun array_inv!16456 (array!43160) Bool)

(assert (=> start!68370 (array_inv!16456 a!3170)))

(declare-fun b!794429 () Bool)

(declare-fun res!538950 () Bool)

(assert (=> b!794429 (=> (not res!538950) (not e!441115))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!794429 (= res!538950 (validKeyInArray!0 k!2044))))

(declare-fun b!794430 () Bool)

(declare-fun e!441116 () Bool)

(assert (=> b!794430 (= e!441116 false)))

(declare-fun lt!354130 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8251 0))(
  ( (MissingZero!8251 (index!35372 (_ BitVec 32))) (Found!8251 (index!35373 (_ BitVec 32))) (Intermediate!8251 (undefined!9063 Bool) (index!35374 (_ BitVec 32)) (x!66297 (_ BitVec 32))) (Undefined!8251) (MissingVacant!8251 (index!35375 (_ BitVec 32))) )
))
(declare-fun lt!354132 () SeekEntryResult!8251)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!354131 () array!43160)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43160 (_ BitVec 32)) SeekEntryResult!8251)

(assert (=> b!794430 (= lt!354132 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354130 lt!354131 mask!3266))))

(declare-fun lt!354134 () SeekEntryResult!8251)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43160 (_ BitVec 32)) SeekEntryResult!8251)

(assert (=> b!794430 (= lt!354134 (seekEntryOrOpen!0 lt!354130 lt!354131 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!794430 (= lt!354130 (select (store (arr!20660 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!794430 (= lt!354131 (array!43161 (store (arr!20660 a!3170) i!1163 k!2044) (size!21081 a!3170)))))

(declare-fun b!794431 () Bool)

(declare-fun res!538953 () Bool)

(assert (=> b!794431 (=> (not res!538953) (not e!441116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43160 (_ BitVec 32)) Bool)

(assert (=> b!794431 (= res!538953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794432 () Bool)

(declare-fun res!538951 () Bool)

(assert (=> b!794432 (=> (not res!538951) (not e!441116))))

(declare-datatypes ((List!14623 0))(
  ( (Nil!14620) (Cons!14619 (h!15748 (_ BitVec 64)) (t!20938 List!14623)) )
))
(declare-fun arrayNoDuplicates!0 (array!43160 (_ BitVec 32) List!14623) Bool)

(assert (=> b!794432 (= res!538951 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14620))))

(declare-fun b!794433 () Bool)

(declare-fun res!538955 () Bool)

(assert (=> b!794433 (=> (not res!538955) (not e!441115))))

(assert (=> b!794433 (= res!538955 (and (= (size!21081 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21081 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21081 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794434 () Bool)

(declare-fun res!538948 () Bool)

(assert (=> b!794434 (=> (not res!538948) (not e!441115))))

(declare-fun arrayContainsKey!0 (array!43160 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794434 (= res!538948 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794435 () Bool)

(declare-fun res!538947 () Bool)

(assert (=> b!794435 (=> (not res!538947) (not e!441116))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!794435 (= res!538947 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21081 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20660 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21081 a!3170)) (= (select (arr!20660 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794436 () Bool)

(assert (=> b!794436 (= e!441115 e!441116)))

(declare-fun res!538954 () Bool)

(assert (=> b!794436 (=> (not res!538954) (not e!441116))))

(declare-fun lt!354133 () SeekEntryResult!8251)

(assert (=> b!794436 (= res!538954 (or (= lt!354133 (MissingZero!8251 i!1163)) (= lt!354133 (MissingVacant!8251 i!1163))))))

(assert (=> b!794436 (= lt!354133 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68370 res!538952) b!794433))

(assert (= (and b!794433 res!538955) b!794428))

(assert (= (and b!794428 res!538949) b!794429))

(assert (= (and b!794429 res!538950) b!794434))

(assert (= (and b!794434 res!538948) b!794436))

(assert (= (and b!794436 res!538954) b!794431))

(assert (= (and b!794431 res!538953) b!794432))

(assert (= (and b!794432 res!538951) b!794435))

(assert (= (and b!794435 res!538947) b!794430))

(declare-fun m!734963 () Bool)

(assert (=> b!794435 m!734963))

(declare-fun m!734965 () Bool)

(assert (=> b!794435 m!734965))

(declare-fun m!734967 () Bool)

(assert (=> b!794430 m!734967))

(declare-fun m!734969 () Bool)

(assert (=> b!794430 m!734969))

(declare-fun m!734971 () Bool)

(assert (=> b!794430 m!734971))

(declare-fun m!734973 () Bool)

(assert (=> b!794430 m!734973))

(declare-fun m!734975 () Bool)

(assert (=> b!794428 m!734975))

(assert (=> b!794428 m!734975))

(declare-fun m!734977 () Bool)

(assert (=> b!794428 m!734977))

(declare-fun m!734979 () Bool)

(assert (=> b!794431 m!734979))

(declare-fun m!734981 () Bool)

(assert (=> b!794434 m!734981))

(declare-fun m!734983 () Bool)

(assert (=> b!794432 m!734983))

(declare-fun m!734985 () Bool)

(assert (=> b!794429 m!734985))

(declare-fun m!734987 () Bool)

(assert (=> b!794436 m!734987))

(declare-fun m!734989 () Bool)

(assert (=> start!68370 m!734989))

(declare-fun m!734991 () Bool)

(assert (=> start!68370 m!734991))

(push 1)

