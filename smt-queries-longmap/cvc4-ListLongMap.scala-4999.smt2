; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68508 () Bool)

(assert start!68508)

(declare-fun b!796577 () Bool)

(declare-fun e!441995 () Bool)

(declare-fun e!441996 () Bool)

(assert (=> b!796577 (= e!441995 e!441996)))

(declare-fun res!541097 () Bool)

(assert (=> b!796577 (=> (not res!541097) (not e!441996))))

(declare-datatypes ((SeekEntryResult!8320 0))(
  ( (MissingZero!8320 (index!35648 (_ BitVec 32))) (Found!8320 (index!35649 (_ BitVec 32))) (Intermediate!8320 (undefined!9132 Bool) (index!35650 (_ BitVec 32)) (x!66550 (_ BitVec 32))) (Undefined!8320) (MissingVacant!8320 (index!35651 (_ BitVec 32))) )
))
(declare-fun lt!355218 () SeekEntryResult!8320)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!796577 (= res!541097 (or (= lt!355218 (MissingZero!8320 i!1163)) (= lt!355218 (MissingVacant!8320 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43298 0))(
  ( (array!43299 (arr!20729 (Array (_ BitVec 32) (_ BitVec 64))) (size!21150 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43298)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43298 (_ BitVec 32)) SeekEntryResult!8320)

(assert (=> b!796577 (= lt!355218 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!796578 () Bool)

(declare-fun res!541106 () Bool)

(assert (=> b!796578 (=> (not res!541106) (not e!441996))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43298 (_ BitVec 32)) Bool)

(assert (=> b!796578 (= res!541106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796579 () Bool)

(declare-fun res!541101 () Bool)

(assert (=> b!796579 (=> (not res!541101) (not e!441995))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796579 (= res!541101 (validKeyInArray!0 k!2044))))

(declare-fun b!796580 () Bool)

(declare-fun res!541104 () Bool)

(assert (=> b!796580 (=> (not res!541104) (not e!441996))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!796580 (= res!541104 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21150 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20729 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21150 a!3170)) (= (select (arr!20729 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun e!441997 () Bool)

(declare-fun b!796581 () Bool)

(assert (=> b!796581 (= e!441997 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun lt!355220 () SeekEntryResult!8320)

(assert (=> b!796581 (= lt!355220 (Found!8320 index!1236))))

(declare-fun res!541103 () Bool)

(assert (=> start!68508 (=> (not res!541103) (not e!441995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68508 (= res!541103 (validMask!0 mask!3266))))

(assert (=> start!68508 e!441995))

(assert (=> start!68508 true))

(declare-fun array_inv!16525 (array!43298) Bool)

(assert (=> start!68508 (array_inv!16525 a!3170)))

(declare-fun b!796582 () Bool)

(declare-fun res!541102 () Bool)

(assert (=> b!796582 (=> (not res!541102) (not e!441996))))

(declare-datatypes ((List!14692 0))(
  ( (Nil!14689) (Cons!14688 (h!15817 (_ BitVec 64)) (t!21007 List!14692)) )
))
(declare-fun arrayNoDuplicates!0 (array!43298 (_ BitVec 32) List!14692) Bool)

(assert (=> b!796582 (= res!541102 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14689))))

(declare-fun b!796583 () Bool)

(declare-fun e!441998 () Bool)

(assert (=> b!796583 (= e!441998 e!441997)))

(declare-fun res!541105 () Bool)

(assert (=> b!796583 (=> (not res!541105) (not e!441997))))

(declare-fun lt!355221 () SeekEntryResult!8320)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!355223 () SeekEntryResult!8320)

(assert (=> b!796583 (= res!541105 (and (= lt!355221 lt!355223) (= lt!355223 (Found!8320 j!153)) (= (select (arr!20729 a!3170) index!1236) (select (arr!20729 a!3170) j!153))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43298 (_ BitVec 32)) SeekEntryResult!8320)

(assert (=> b!796583 (= lt!355223 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20729 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796583 (= lt!355221 (seekEntryOrOpen!0 (select (arr!20729 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796584 () Bool)

(declare-fun res!541100 () Bool)

(assert (=> b!796584 (=> (not res!541100) (not e!441995))))

(declare-fun arrayContainsKey!0 (array!43298 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796584 (= res!541100 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796585 () Bool)

(declare-fun res!541099 () Bool)

(assert (=> b!796585 (=> (not res!541099) (not e!441995))))

(assert (=> b!796585 (= res!541099 (and (= (size!21150 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21150 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21150 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796586 () Bool)

(assert (=> b!796586 (= e!441996 e!441998)))

(declare-fun res!541098 () Bool)

(assert (=> b!796586 (=> (not res!541098) (not e!441998))))

(declare-fun lt!355219 () SeekEntryResult!8320)

(assert (=> b!796586 (= res!541098 (= lt!355219 lt!355220))))

(declare-fun lt!355217 () array!43298)

(declare-fun lt!355222 () (_ BitVec 64))

(assert (=> b!796586 (= lt!355220 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355222 lt!355217 mask!3266))))

(assert (=> b!796586 (= lt!355219 (seekEntryOrOpen!0 lt!355222 lt!355217 mask!3266))))

(assert (=> b!796586 (= lt!355222 (select (store (arr!20729 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!796586 (= lt!355217 (array!43299 (store (arr!20729 a!3170) i!1163 k!2044) (size!21150 a!3170)))))

(declare-fun b!796587 () Bool)

(declare-fun res!541096 () Bool)

(assert (=> b!796587 (=> (not res!541096) (not e!441995))))

(assert (=> b!796587 (= res!541096 (validKeyInArray!0 (select (arr!20729 a!3170) j!153)))))

(assert (= (and start!68508 res!541103) b!796585))

(assert (= (and b!796585 res!541099) b!796587))

(assert (= (and b!796587 res!541096) b!796579))

(assert (= (and b!796579 res!541101) b!796584))

(assert (= (and b!796584 res!541100) b!796577))

(assert (= (and b!796577 res!541097) b!796578))

(assert (= (and b!796578 res!541106) b!796582))

(assert (= (and b!796582 res!541102) b!796580))

(assert (= (and b!796580 res!541104) b!796586))

(assert (= (and b!796586 res!541098) b!796583))

(assert (= (and b!796583 res!541105) b!796581))

(declare-fun m!737375 () Bool)

(assert (=> b!796580 m!737375))

(declare-fun m!737377 () Bool)

(assert (=> b!796580 m!737377))

(declare-fun m!737379 () Bool)

(assert (=> b!796579 m!737379))

(declare-fun m!737381 () Bool)

(assert (=> b!796582 m!737381))

(declare-fun m!737383 () Bool)

(assert (=> b!796577 m!737383))

(declare-fun m!737385 () Bool)

(assert (=> start!68508 m!737385))

(declare-fun m!737387 () Bool)

(assert (=> start!68508 m!737387))

(declare-fun m!737389 () Bool)

(assert (=> b!796584 m!737389))

(declare-fun m!737391 () Bool)

(assert (=> b!796586 m!737391))

(declare-fun m!737393 () Bool)

(assert (=> b!796586 m!737393))

(declare-fun m!737395 () Bool)

(assert (=> b!796586 m!737395))

(declare-fun m!737397 () Bool)

(assert (=> b!796586 m!737397))

(declare-fun m!737399 () Bool)

(assert (=> b!796578 m!737399))

(declare-fun m!737401 () Bool)

(assert (=> b!796583 m!737401))

(declare-fun m!737403 () Bool)

(assert (=> b!796583 m!737403))

(assert (=> b!796583 m!737403))

(declare-fun m!737405 () Bool)

(assert (=> b!796583 m!737405))

(assert (=> b!796583 m!737403))

(declare-fun m!737407 () Bool)

(assert (=> b!796583 m!737407))

(assert (=> b!796587 m!737403))

(assert (=> b!796587 m!737403))

(declare-fun m!737409 () Bool)

(assert (=> b!796587 m!737409))

(push 1)

(assert (not b!796582))

(assert (not start!68508))

(assert (not b!796587))

(assert (not b!796583))

(assert (not b!796577))

(assert (not b!796586))

(assert (not b!796584))

(assert (not b!796578))

(assert (not b!796579))

(check-sat)

(pop 1)

(push 1)

(check-sat)

