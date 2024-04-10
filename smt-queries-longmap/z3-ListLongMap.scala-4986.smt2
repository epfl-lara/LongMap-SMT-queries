; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68428 () Bool)

(assert start!68428)

(declare-fun b!795315 () Bool)

(declare-fun res!539840 () Bool)

(declare-fun e!441453 () Bool)

(assert (=> b!795315 (=> (not res!539840) (not e!441453))))

(declare-datatypes ((array!43218 0))(
  ( (array!43219 (arr!20689 (Array (_ BitVec 32) (_ BitVec 64))) (size!21110 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43218)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43218 (_ BitVec 32)) Bool)

(assert (=> b!795315 (= res!539840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795316 () Bool)

(declare-fun e!441455 () Bool)

(assert (=> b!795316 (= e!441453 e!441455)))

(declare-fun res!539842 () Bool)

(assert (=> b!795316 (=> (not res!539842) (not e!441455))))

(declare-fun lt!354514 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354511 () array!43218)

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8280 0))(
  ( (MissingZero!8280 (index!35488 (_ BitVec 32))) (Found!8280 (index!35489 (_ BitVec 32))) (Intermediate!8280 (undefined!9092 Bool) (index!35490 (_ BitVec 32)) (x!66406 (_ BitVec 32))) (Undefined!8280) (MissingVacant!8280 (index!35491 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43218 (_ BitVec 32)) SeekEntryResult!8280)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43218 (_ BitVec 32)) SeekEntryResult!8280)

(assert (=> b!795316 (= res!539842 (= (seekEntryOrOpen!0 lt!354514 lt!354511 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354514 lt!354511 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!795316 (= lt!354514 (select (store (arr!20689 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795316 (= lt!354511 (array!43219 (store (arr!20689 a!3170) i!1163 k0!2044) (size!21110 a!3170)))))

(declare-fun b!795317 () Bool)

(declare-fun res!539835 () Bool)

(declare-fun e!441452 () Bool)

(assert (=> b!795317 (=> (not res!539835) (not e!441452))))

(declare-fun arrayContainsKey!0 (array!43218 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795317 (= res!539835 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795318 () Bool)

(declare-fun res!539837 () Bool)

(assert (=> b!795318 (=> (not res!539837) (not e!441453))))

(declare-datatypes ((List!14652 0))(
  ( (Nil!14649) (Cons!14648 (h!15777 (_ BitVec 64)) (t!20967 List!14652)) )
))
(declare-fun arrayNoDuplicates!0 (array!43218 (_ BitVec 32) List!14652) Bool)

(assert (=> b!795318 (= res!539837 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14649))))

(declare-fun res!539838 () Bool)

(assert (=> start!68428 (=> (not res!539838) (not e!441452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68428 (= res!539838 (validMask!0 mask!3266))))

(assert (=> start!68428 e!441452))

(assert (=> start!68428 true))

(declare-fun array_inv!16485 (array!43218) Bool)

(assert (=> start!68428 (array_inv!16485 a!3170)))

(declare-fun b!795319 () Bool)

(assert (=> b!795319 (= e!441452 e!441453)))

(declare-fun res!539841 () Bool)

(assert (=> b!795319 (=> (not res!539841) (not e!441453))))

(declare-fun lt!354515 () SeekEntryResult!8280)

(assert (=> b!795319 (= res!539841 (or (= lt!354515 (MissingZero!8280 i!1163)) (= lt!354515 (MissingVacant!8280 i!1163))))))

(assert (=> b!795319 (= lt!354515 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!795320 () Bool)

(declare-fun res!539843 () Bool)

(assert (=> b!795320 (=> (not res!539843) (not e!441452))))

(assert (=> b!795320 (= res!539843 (and (= (size!21110 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21110 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21110 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795321 () Bool)

(declare-fun res!539839 () Bool)

(assert (=> b!795321 (=> (not res!539839) (not e!441452))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795321 (= res!539839 (validKeyInArray!0 k0!2044))))

(declare-fun b!795322 () Bool)

(declare-fun res!539834 () Bool)

(assert (=> b!795322 (=> (not res!539834) (not e!441453))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!795322 (= res!539834 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21110 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20689 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21110 a!3170)) (= (select (arr!20689 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795323 () Bool)

(declare-fun res!539836 () Bool)

(assert (=> b!795323 (=> (not res!539836) (not e!441452))))

(assert (=> b!795323 (= res!539836 (validKeyInArray!0 (select (arr!20689 a!3170) j!153)))))

(declare-fun b!795324 () Bool)

(assert (=> b!795324 (= e!441455 false)))

(declare-fun lt!354513 () SeekEntryResult!8280)

(assert (=> b!795324 (= lt!354513 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20689 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354512 () SeekEntryResult!8280)

(assert (=> b!795324 (= lt!354512 (seekEntryOrOpen!0 (select (arr!20689 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68428 res!539838) b!795320))

(assert (= (and b!795320 res!539843) b!795323))

(assert (= (and b!795323 res!539836) b!795321))

(assert (= (and b!795321 res!539839) b!795317))

(assert (= (and b!795317 res!539835) b!795319))

(assert (= (and b!795319 res!539841) b!795315))

(assert (= (and b!795315 res!539840) b!795318))

(assert (= (and b!795318 res!539837) b!795322))

(assert (= (and b!795322 res!539834) b!795316))

(assert (= (and b!795316 res!539842) b!795324))

(declare-fun m!735933 () Bool)

(assert (=> b!795319 m!735933))

(declare-fun m!735935 () Bool)

(assert (=> b!795318 m!735935))

(declare-fun m!735937 () Bool)

(assert (=> b!795324 m!735937))

(assert (=> b!795324 m!735937))

(declare-fun m!735939 () Bool)

(assert (=> b!795324 m!735939))

(assert (=> b!795324 m!735937))

(declare-fun m!735941 () Bool)

(assert (=> b!795324 m!735941))

(assert (=> b!795323 m!735937))

(assert (=> b!795323 m!735937))

(declare-fun m!735943 () Bool)

(assert (=> b!795323 m!735943))

(declare-fun m!735945 () Bool)

(assert (=> start!68428 m!735945))

(declare-fun m!735947 () Bool)

(assert (=> start!68428 m!735947))

(declare-fun m!735949 () Bool)

(assert (=> b!795316 m!735949))

(declare-fun m!735951 () Bool)

(assert (=> b!795316 m!735951))

(declare-fun m!735953 () Bool)

(assert (=> b!795316 m!735953))

(declare-fun m!735955 () Bool)

(assert (=> b!795316 m!735955))

(declare-fun m!735957 () Bool)

(assert (=> b!795321 m!735957))

(declare-fun m!735959 () Bool)

(assert (=> b!795317 m!735959))

(declare-fun m!735961 () Bool)

(assert (=> b!795315 m!735961))

(declare-fun m!735963 () Bool)

(assert (=> b!795322 m!735963))

(declare-fun m!735965 () Bool)

(assert (=> b!795322 m!735965))

(check-sat (not b!795315) (not start!68428) (not b!795319) (not b!795316) (not b!795323) (not b!795324) (not b!795317) (not b!795318) (not b!795321))
(check-sat)
