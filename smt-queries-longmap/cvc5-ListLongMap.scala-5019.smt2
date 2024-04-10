; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68624 () Bool)

(assert start!68624)

(declare-fun b!798570 () Bool)

(declare-fun res!543095 () Bool)

(declare-fun e!442945 () Bool)

(assert (=> b!798570 (=> (not res!543095) (not e!442945))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43414 0))(
  ( (array!43415 (arr!20787 (Array (_ BitVec 32) (_ BitVec 64))) (size!21208 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43414)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798570 (= res!543095 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21208 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20787 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21208 a!3170)) (= (select (arr!20787 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798571 () Bool)

(declare-fun e!442944 () Bool)

(assert (=> b!798571 (= e!442944 e!442945)))

(declare-fun res!543089 () Bool)

(assert (=> b!798571 (=> (not res!543089) (not e!442945))))

(declare-datatypes ((SeekEntryResult!8378 0))(
  ( (MissingZero!8378 (index!35880 (_ BitVec 32))) (Found!8378 (index!35881 (_ BitVec 32))) (Intermediate!8378 (undefined!9190 Bool) (index!35882 (_ BitVec 32)) (x!66768 (_ BitVec 32))) (Undefined!8378) (MissingVacant!8378 (index!35883 (_ BitVec 32))) )
))
(declare-fun lt!356489 () SeekEntryResult!8378)

(assert (=> b!798571 (= res!543089 (or (= lt!356489 (MissingZero!8378 i!1163)) (= lt!356489 (MissingVacant!8378 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43414 (_ BitVec 32)) SeekEntryResult!8378)

(assert (=> b!798571 (= lt!356489 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!798572 () Bool)

(declare-fun res!543090 () Bool)

(assert (=> b!798572 (=> (not res!543090) (not e!442944))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798572 (= res!543090 (validKeyInArray!0 (select (arr!20787 a!3170) j!153)))))

(declare-fun b!798573 () Bool)

(declare-fun res!543097 () Bool)

(assert (=> b!798573 (=> (not res!543097) (not e!442944))))

(declare-fun arrayContainsKey!0 (array!43414 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798573 (= res!543097 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798574 () Bool)

(declare-fun res!543094 () Bool)

(assert (=> b!798574 (=> (not res!543094) (not e!442944))))

(assert (=> b!798574 (= res!543094 (and (= (size!21208 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21208 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21208 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798575 () Bool)

(declare-fun res!543096 () Bool)

(assert (=> b!798575 (=> (not res!543096) (not e!442944))))

(assert (=> b!798575 (= res!543096 (validKeyInArray!0 k!2044))))

(declare-fun res!543093 () Bool)

(assert (=> start!68624 (=> (not res!543093) (not e!442944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68624 (= res!543093 (validMask!0 mask!3266))))

(assert (=> start!68624 e!442944))

(assert (=> start!68624 true))

(declare-fun array_inv!16583 (array!43414) Bool)

(assert (=> start!68624 (array_inv!16583 a!3170)))

(declare-fun b!798576 () Bool)

(declare-fun res!543098 () Bool)

(assert (=> b!798576 (=> (not res!543098) (not e!442945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43414 (_ BitVec 32)) Bool)

(assert (=> b!798576 (= res!543098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun lt!356485 () SeekEntryResult!8378)

(declare-fun b!798577 () Bool)

(declare-fun lt!356487 () SeekEntryResult!8378)

(declare-fun e!442946 () Bool)

(assert (=> b!798577 (= e!442946 (and (= lt!356485 lt!356487) (= lt!356487 (Found!8378 j!153)) (not (= (select (arr!20787 a!3170) index!1236) (select (arr!20787 a!3170) j!153))) (bvslt mask!3266 #b00000000000000000000000000000000)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43414 (_ BitVec 32)) SeekEntryResult!8378)

(assert (=> b!798577 (= lt!356487 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20787 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798577 (= lt!356485 (seekEntryOrOpen!0 (select (arr!20787 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798578 () Bool)

(assert (=> b!798578 (= e!442945 e!442946)))

(declare-fun res!543091 () Bool)

(assert (=> b!798578 (=> (not res!543091) (not e!442946))))

(declare-fun lt!356488 () (_ BitVec 64))

(declare-fun lt!356486 () array!43414)

(assert (=> b!798578 (= res!543091 (= (seekEntryOrOpen!0 lt!356488 lt!356486 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356488 lt!356486 mask!3266)))))

(assert (=> b!798578 (= lt!356488 (select (store (arr!20787 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!798578 (= lt!356486 (array!43415 (store (arr!20787 a!3170) i!1163 k!2044) (size!21208 a!3170)))))

(declare-fun b!798579 () Bool)

(declare-fun res!543092 () Bool)

(assert (=> b!798579 (=> (not res!543092) (not e!442945))))

(declare-datatypes ((List!14750 0))(
  ( (Nil!14747) (Cons!14746 (h!15875 (_ BitVec 64)) (t!21065 List!14750)) )
))
(declare-fun arrayNoDuplicates!0 (array!43414 (_ BitVec 32) List!14750) Bool)

(assert (=> b!798579 (= res!543092 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14747))))

(assert (= (and start!68624 res!543093) b!798574))

(assert (= (and b!798574 res!543094) b!798572))

(assert (= (and b!798572 res!543090) b!798575))

(assert (= (and b!798575 res!543096) b!798573))

(assert (= (and b!798573 res!543097) b!798571))

(assert (= (and b!798571 res!543089) b!798576))

(assert (= (and b!798576 res!543098) b!798579))

(assert (= (and b!798579 res!543092) b!798570))

(assert (= (and b!798570 res!543095) b!798578))

(assert (= (and b!798578 res!543091) b!798577))

(declare-fun m!739493 () Bool)

(assert (=> b!798573 m!739493))

(declare-fun m!739495 () Bool)

(assert (=> b!798578 m!739495))

(declare-fun m!739497 () Bool)

(assert (=> b!798578 m!739497))

(declare-fun m!739499 () Bool)

(assert (=> b!798578 m!739499))

(declare-fun m!739501 () Bool)

(assert (=> b!798578 m!739501))

(declare-fun m!739503 () Bool)

(assert (=> start!68624 m!739503))

(declare-fun m!739505 () Bool)

(assert (=> start!68624 m!739505))

(declare-fun m!739507 () Bool)

(assert (=> b!798576 m!739507))

(declare-fun m!739509 () Bool)

(assert (=> b!798571 m!739509))

(declare-fun m!739511 () Bool)

(assert (=> b!798579 m!739511))

(declare-fun m!739513 () Bool)

(assert (=> b!798575 m!739513))

(declare-fun m!739515 () Bool)

(assert (=> b!798572 m!739515))

(assert (=> b!798572 m!739515))

(declare-fun m!739517 () Bool)

(assert (=> b!798572 m!739517))

(declare-fun m!739519 () Bool)

(assert (=> b!798577 m!739519))

(assert (=> b!798577 m!739515))

(assert (=> b!798577 m!739515))

(declare-fun m!739521 () Bool)

(assert (=> b!798577 m!739521))

(assert (=> b!798577 m!739515))

(declare-fun m!739523 () Bool)

(assert (=> b!798577 m!739523))

(declare-fun m!739525 () Bool)

(assert (=> b!798570 m!739525))

(declare-fun m!739527 () Bool)

(assert (=> b!798570 m!739527))

(push 1)

(assert (not b!798577))

(assert (not b!798571))

(assert (not b!798576))

(assert (not b!798579))

(assert (not start!68624))

(assert (not b!798572))

(assert (not b!798578))

(assert (not b!798573))

(assert (not b!798575))

(check-sat)

