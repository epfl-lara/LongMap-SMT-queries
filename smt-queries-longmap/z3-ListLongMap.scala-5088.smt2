; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69066 () Bool)

(assert start!69066)

(declare-fun b!805522 () Bool)

(declare-fun e!446088 () Bool)

(declare-fun e!446089 () Bool)

(assert (=> b!805522 (= e!446088 e!446089)))

(declare-fun res!549987 () Bool)

(assert (=> b!805522 (=> (not res!549987) (not e!446089))))

(declare-datatypes ((SeekEntryResult!8581 0))(
  ( (MissingZero!8581 (index!36692 (_ BitVec 32))) (Found!8581 (index!36693 (_ BitVec 32))) (Intermediate!8581 (undefined!9393 Bool) (index!36694 (_ BitVec 32)) (x!67521 (_ BitVec 32))) (Undefined!8581) (MissingVacant!8581 (index!36695 (_ BitVec 32))) )
))
(declare-fun lt!360539 () SeekEntryResult!8581)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!805522 (= res!549987 (or (= lt!360539 (MissingZero!8581 i!1163)) (= lt!360539 (MissingVacant!8581 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43828 0))(
  ( (array!43829 (arr!20993 (Array (_ BitVec 32) (_ BitVec 64))) (size!21414 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43828)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43828 (_ BitVec 32)) SeekEntryResult!8581)

(assert (=> b!805522 (= lt!360539 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!805523 () Bool)

(declare-fun e!446086 () Bool)

(assert (=> b!805523 (= e!446086 (not true))))

(declare-fun lt!360543 () SeekEntryResult!8581)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!805523 (= lt!360543 (Found!8581 index!1236))))

(declare-fun b!805524 () Bool)

(declare-fun e!446087 () Bool)

(assert (=> b!805524 (= e!446089 e!446087)))

(declare-fun res!549985 () Bool)

(assert (=> b!805524 (=> (not res!549985) (not e!446087))))

(declare-fun lt!360542 () SeekEntryResult!8581)

(assert (=> b!805524 (= res!549985 (= lt!360542 lt!360543))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!360544 () (_ BitVec 64))

(declare-fun lt!360540 () array!43828)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43828 (_ BitVec 32)) SeekEntryResult!8581)

(assert (=> b!805524 (= lt!360543 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360544 lt!360540 mask!3266))))

(assert (=> b!805524 (= lt!360542 (seekEntryOrOpen!0 lt!360544 lt!360540 mask!3266))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!805524 (= lt!360544 (select (store (arr!20993 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!805524 (= lt!360540 (array!43829 (store (arr!20993 a!3170) i!1163 k0!2044) (size!21414 a!3170)))))

(declare-fun b!805525 () Bool)

(declare-fun res!549991 () Bool)

(assert (=> b!805525 (=> (not res!549991) (not e!446088))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805525 (= res!549991 (validKeyInArray!0 (select (arr!20993 a!3170) j!153)))))

(declare-fun b!805526 () Bool)

(declare-fun res!549983 () Bool)

(assert (=> b!805526 (=> (not res!549983) (not e!446089))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!805526 (= res!549983 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21414 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20993 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21414 a!3170)) (= (select (arr!20993 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805527 () Bool)

(declare-fun res!549989 () Bool)

(assert (=> b!805527 (=> (not res!549989) (not e!446088))))

(declare-fun arrayContainsKey!0 (array!43828 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805527 (= res!549989 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805528 () Bool)

(declare-fun res!549988 () Bool)

(assert (=> b!805528 (=> (not res!549988) (not e!446089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43828 (_ BitVec 32)) Bool)

(assert (=> b!805528 (= res!549988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!549990 () Bool)

(assert (=> start!69066 (=> (not res!549990) (not e!446088))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69066 (= res!549990 (validMask!0 mask!3266))))

(assert (=> start!69066 e!446088))

(assert (=> start!69066 true))

(declare-fun array_inv!16876 (array!43828) Bool)

(assert (=> start!69066 (array_inv!16876 a!3170)))

(declare-fun b!805529 () Bool)

(declare-fun res!549993 () Bool)

(assert (=> b!805529 (=> (not res!549993) (not e!446088))))

(assert (=> b!805529 (= res!549993 (and (= (size!21414 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21414 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21414 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805530 () Bool)

(declare-fun res!549992 () Bool)

(assert (=> b!805530 (=> (not res!549992) (not e!446088))))

(assert (=> b!805530 (= res!549992 (validKeyInArray!0 k0!2044))))

(declare-fun b!805531 () Bool)

(declare-fun res!549984 () Bool)

(assert (=> b!805531 (=> (not res!549984) (not e!446089))))

(declare-datatypes ((List!14995 0))(
  ( (Nil!14992) (Cons!14991 (h!16120 (_ BitVec 64)) (t!21301 List!14995)) )
))
(declare-fun arrayNoDuplicates!0 (array!43828 (_ BitVec 32) List!14995) Bool)

(assert (=> b!805531 (= res!549984 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14992))))

(declare-fun b!805532 () Bool)

(assert (=> b!805532 (= e!446087 e!446086)))

(declare-fun res!549986 () Bool)

(assert (=> b!805532 (=> (not res!549986) (not e!446086))))

(declare-fun lt!360541 () SeekEntryResult!8581)

(declare-fun lt!360545 () SeekEntryResult!8581)

(assert (=> b!805532 (= res!549986 (and (= lt!360541 lt!360545) (= lt!360545 (Found!8581 j!153)) (= (select (arr!20993 a!3170) index!1236) (select (arr!20993 a!3170) j!153))))))

(assert (=> b!805532 (= lt!360545 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20993 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!805532 (= lt!360541 (seekEntryOrOpen!0 (select (arr!20993 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!69066 res!549990) b!805529))

(assert (= (and b!805529 res!549993) b!805525))

(assert (= (and b!805525 res!549991) b!805530))

(assert (= (and b!805530 res!549992) b!805527))

(assert (= (and b!805527 res!549989) b!805522))

(assert (= (and b!805522 res!549987) b!805528))

(assert (= (and b!805528 res!549988) b!805531))

(assert (= (and b!805531 res!549984) b!805526))

(assert (= (and b!805526 res!549983) b!805524))

(assert (= (and b!805524 res!549985) b!805532))

(assert (= (and b!805532 res!549986) b!805523))

(declare-fun m!746959 () Bool)

(assert (=> b!805522 m!746959))

(declare-fun m!746961 () Bool)

(assert (=> b!805532 m!746961))

(declare-fun m!746963 () Bool)

(assert (=> b!805532 m!746963))

(assert (=> b!805532 m!746963))

(declare-fun m!746965 () Bool)

(assert (=> b!805532 m!746965))

(assert (=> b!805532 m!746963))

(declare-fun m!746967 () Bool)

(assert (=> b!805532 m!746967))

(declare-fun m!746969 () Bool)

(assert (=> b!805524 m!746969))

(declare-fun m!746971 () Bool)

(assert (=> b!805524 m!746971))

(declare-fun m!746973 () Bool)

(assert (=> b!805524 m!746973))

(declare-fun m!746975 () Bool)

(assert (=> b!805524 m!746975))

(assert (=> b!805525 m!746963))

(assert (=> b!805525 m!746963))

(declare-fun m!746977 () Bool)

(assert (=> b!805525 m!746977))

(declare-fun m!746979 () Bool)

(assert (=> b!805527 m!746979))

(declare-fun m!746981 () Bool)

(assert (=> start!69066 m!746981))

(declare-fun m!746983 () Bool)

(assert (=> start!69066 m!746983))

(declare-fun m!746985 () Bool)

(assert (=> b!805531 m!746985))

(declare-fun m!746987 () Bool)

(assert (=> b!805526 m!746987))

(declare-fun m!746989 () Bool)

(assert (=> b!805526 m!746989))

(declare-fun m!746991 () Bool)

(assert (=> b!805528 m!746991))

(declare-fun m!746993 () Bool)

(assert (=> b!805530 m!746993))

(check-sat (not b!805532) (not b!805522) (not b!805531) (not b!805524) (not b!805530) (not b!805525) (not start!69066) (not b!805527) (not b!805528))
(check-sat)
