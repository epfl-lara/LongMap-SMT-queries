; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69018 () Bool)

(assert start!69018)

(declare-fun b!805209 () Bool)

(declare-fun res!549730 () Bool)

(declare-fun e!445955 () Bool)

(assert (=> b!805209 (=> (not res!549730) (not e!445955))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43808 0))(
  ( (array!43809 (arr!20984 (Array (_ BitVec 32) (_ BitVec 64))) (size!21405 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43808)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!805209 (= res!549730 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21405 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20984 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21405 a!3170)) (= (select (arr!20984 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805210 () Bool)

(declare-fun e!445958 () Bool)

(assert (=> b!805210 (= e!445958 false)))

(declare-datatypes ((SeekEntryResult!8575 0))(
  ( (MissingZero!8575 (index!36668 (_ BitVec 32))) (Found!8575 (index!36669 (_ BitVec 32))) (Intermediate!8575 (undefined!9387 Bool) (index!36670 (_ BitVec 32)) (x!67485 (_ BitVec 32))) (Undefined!8575) (MissingVacant!8575 (index!36671 (_ BitVec 32))) )
))
(declare-fun lt!360514 () SeekEntryResult!8575)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43808 (_ BitVec 32)) SeekEntryResult!8575)

(assert (=> b!805210 (= lt!360514 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20984 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360513 () SeekEntryResult!8575)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43808 (_ BitVec 32)) SeekEntryResult!8575)

(assert (=> b!805210 (= lt!360513 (seekEntryOrOpen!0 (select (arr!20984 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805211 () Bool)

(declare-fun e!445956 () Bool)

(assert (=> b!805211 (= e!445956 e!445955)))

(declare-fun res!549728 () Bool)

(assert (=> b!805211 (=> (not res!549728) (not e!445955))))

(declare-fun lt!360511 () SeekEntryResult!8575)

(assert (=> b!805211 (= res!549728 (or (= lt!360511 (MissingZero!8575 i!1163)) (= lt!360511 (MissingVacant!8575 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!805211 (= lt!360511 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!805212 () Bool)

(declare-fun res!549732 () Bool)

(assert (=> b!805212 (=> (not res!549732) (not e!445956))))

(declare-fun arrayContainsKey!0 (array!43808 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805212 (= res!549732 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805214 () Bool)

(declare-fun res!549735 () Bool)

(assert (=> b!805214 (=> (not res!549735) (not e!445956))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805214 (= res!549735 (validKeyInArray!0 (select (arr!20984 a!3170) j!153)))))

(declare-fun b!805215 () Bool)

(declare-fun res!549736 () Bool)

(assert (=> b!805215 (=> (not res!549736) (not e!445956))))

(assert (=> b!805215 (= res!549736 (and (= (size!21405 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21405 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21405 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805216 () Bool)

(assert (=> b!805216 (= e!445955 e!445958)))

(declare-fun res!549729 () Bool)

(assert (=> b!805216 (=> (not res!549729) (not e!445958))))

(declare-fun lt!360512 () array!43808)

(declare-fun lt!360515 () (_ BitVec 64))

(assert (=> b!805216 (= res!549729 (= (seekEntryOrOpen!0 lt!360515 lt!360512 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360515 lt!360512 mask!3266)))))

(assert (=> b!805216 (= lt!360515 (select (store (arr!20984 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!805216 (= lt!360512 (array!43809 (store (arr!20984 a!3170) i!1163 k!2044) (size!21405 a!3170)))))

(declare-fun b!805217 () Bool)

(declare-fun res!549733 () Bool)

(assert (=> b!805217 (=> (not res!549733) (not e!445955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43808 (_ BitVec 32)) Bool)

(assert (=> b!805217 (= res!549733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805218 () Bool)

(declare-fun res!549731 () Bool)

(assert (=> b!805218 (=> (not res!549731) (not e!445956))))

(assert (=> b!805218 (= res!549731 (validKeyInArray!0 k!2044))))

(declare-fun res!549737 () Bool)

(assert (=> start!69018 (=> (not res!549737) (not e!445956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69018 (= res!549737 (validMask!0 mask!3266))))

(assert (=> start!69018 e!445956))

(assert (=> start!69018 true))

(declare-fun array_inv!16780 (array!43808) Bool)

(assert (=> start!69018 (array_inv!16780 a!3170)))

(declare-fun b!805213 () Bool)

(declare-fun res!549734 () Bool)

(assert (=> b!805213 (=> (not res!549734) (not e!445955))))

(declare-datatypes ((List!14947 0))(
  ( (Nil!14944) (Cons!14943 (h!16072 (_ BitVec 64)) (t!21262 List!14947)) )
))
(declare-fun arrayNoDuplicates!0 (array!43808 (_ BitVec 32) List!14947) Bool)

(assert (=> b!805213 (= res!549734 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14944))))

(assert (= (and start!69018 res!549737) b!805215))

(assert (= (and b!805215 res!549736) b!805214))

(assert (= (and b!805214 res!549735) b!805218))

(assert (= (and b!805218 res!549731) b!805212))

(assert (= (and b!805212 res!549732) b!805211))

(assert (= (and b!805211 res!549728) b!805217))

(assert (= (and b!805217 res!549733) b!805213))

(assert (= (and b!805213 res!549734) b!805209))

(assert (= (and b!805209 res!549730) b!805216))

(assert (= (and b!805216 res!549729) b!805210))

(declare-fun m!747127 () Bool)

(assert (=> b!805213 m!747127))

(declare-fun m!747129 () Bool)

(assert (=> b!805218 m!747129))

(declare-fun m!747131 () Bool)

(assert (=> b!805212 m!747131))

(declare-fun m!747133 () Bool)

(assert (=> b!805217 m!747133))

(declare-fun m!747135 () Bool)

(assert (=> b!805211 m!747135))

(declare-fun m!747137 () Bool)

(assert (=> b!805209 m!747137))

(declare-fun m!747139 () Bool)

(assert (=> b!805209 m!747139))

(declare-fun m!747141 () Bool)

(assert (=> b!805216 m!747141))

(declare-fun m!747143 () Bool)

(assert (=> b!805216 m!747143))

(declare-fun m!747145 () Bool)

(assert (=> b!805216 m!747145))

(declare-fun m!747147 () Bool)

(assert (=> b!805216 m!747147))

(declare-fun m!747149 () Bool)

(assert (=> b!805214 m!747149))

(assert (=> b!805214 m!747149))

(declare-fun m!747151 () Bool)

(assert (=> b!805214 m!747151))

(declare-fun m!747153 () Bool)

(assert (=> start!69018 m!747153))

(declare-fun m!747155 () Bool)

(assert (=> start!69018 m!747155))

(assert (=> b!805210 m!747149))

(assert (=> b!805210 m!747149))

(declare-fun m!747157 () Bool)

(assert (=> b!805210 m!747157))

(assert (=> b!805210 m!747149))

(declare-fun m!747159 () Bool)

(assert (=> b!805210 m!747159))

(push 1)

(assert (not start!69018))

(assert (not b!805217))

(assert (not b!805218))

(assert (not b!805212))

(assert (not b!805213))

