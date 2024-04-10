; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68778 () Bool)

(assert start!68778)

(declare-fun res!546022 () Bool)

(declare-fun e!444283 () Bool)

(assert (=> start!68778 (=> (not res!546022) (not e!444283))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68778 (= res!546022 (validMask!0 mask!3266))))

(assert (=> start!68778 e!444283))

(assert (=> start!68778 true))

(declare-datatypes ((array!43568 0))(
  ( (array!43569 (arr!20864 (Array (_ BitVec 32) (_ BitVec 64))) (size!21285 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43568)

(declare-fun array_inv!16660 (array!43568) Bool)

(assert (=> start!68778 (array_inv!16660 a!3170)))

(declare-fun b!801498 () Bool)

(declare-fun res!546023 () Bool)

(declare-fun e!444279 () Bool)

(assert (=> b!801498 (=> (not res!546023) (not e!444279))))

(declare-datatypes ((List!14827 0))(
  ( (Nil!14824) (Cons!14823 (h!15952 (_ BitVec 64)) (t!21142 List!14827)) )
))
(declare-fun arrayNoDuplicates!0 (array!43568 (_ BitVec 32) List!14827) Bool)

(assert (=> b!801498 (= res!546023 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14824))))

(declare-fun b!801499 () Bool)

(declare-fun e!444280 () Bool)

(declare-fun e!444281 () Bool)

(assert (=> b!801499 (= e!444280 e!444281)))

(declare-fun res!546026 () Bool)

(assert (=> b!801499 (=> (not res!546026) (not e!444281))))

(declare-fun lt!358265 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(assert (=> b!801499 (= res!546026 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!358265 #b00000000000000000000000000000000) (bvslt lt!358265 (size!21285 a!3170))))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801499 (= lt!358265 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801500 () Bool)

(declare-fun e!444284 () Bool)

(assert (=> b!801500 (= e!444284 e!444280)))

(declare-fun res!546020 () Bool)

(assert (=> b!801500 (=> (not res!546020) (not e!444280))))

(declare-datatypes ((SeekEntryResult!8455 0))(
  ( (MissingZero!8455 (index!36188 (_ BitVec 32))) (Found!8455 (index!36189 (_ BitVec 32))) (Intermediate!8455 (undefined!9267 Bool) (index!36190 (_ BitVec 32)) (x!67045 (_ BitVec 32))) (Undefined!8455) (MissingVacant!8455 (index!36191 (_ BitVec 32))) )
))
(declare-fun lt!358263 () SeekEntryResult!8455)

(declare-fun lt!358262 () SeekEntryResult!8455)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!801500 (= res!546020 (and (= lt!358262 lt!358263) (= lt!358263 (Found!8455 j!153)) (not (= (select (arr!20864 a!3170) index!1236) (select (arr!20864 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43568 (_ BitVec 32)) SeekEntryResult!8455)

(assert (=> b!801500 (= lt!358263 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20864 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43568 (_ BitVec 32)) SeekEntryResult!8455)

(assert (=> b!801500 (= lt!358262 (seekEntryOrOpen!0 (select (arr!20864 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801501 () Bool)

(assert (=> b!801501 (= e!444283 e!444279)))

(declare-fun res!546021 () Bool)

(assert (=> b!801501 (=> (not res!546021) (not e!444279))))

(declare-fun lt!358259 () SeekEntryResult!8455)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!801501 (= res!546021 (or (= lt!358259 (MissingZero!8455 i!1163)) (= lt!358259 (MissingVacant!8455 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!801501 (= lt!358259 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!801502 () Bool)

(declare-fun res!546017 () Bool)

(assert (=> b!801502 (=> (not res!546017) (not e!444283))))

(assert (=> b!801502 (= res!546017 (and (= (size!21285 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21285 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21285 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801503 () Bool)

(assert (=> b!801503 (= e!444281 false)))

(declare-fun lt!358264 () SeekEntryResult!8455)

(assert (=> b!801503 (= lt!358264 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358265 vacantBefore!23 (select (arr!20864 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801504 () Bool)

(declare-fun res!546019 () Bool)

(assert (=> b!801504 (=> (not res!546019) (not e!444279))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!801504 (= res!546019 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21285 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20864 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21285 a!3170)) (= (select (arr!20864 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801505 () Bool)

(declare-fun res!546027 () Bool)

(assert (=> b!801505 (=> (not res!546027) (not e!444283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801505 (= res!546027 (validKeyInArray!0 (select (arr!20864 a!3170) j!153)))))

(declare-fun b!801506 () Bool)

(assert (=> b!801506 (= e!444279 e!444284)))

(declare-fun res!546028 () Bool)

(assert (=> b!801506 (=> (not res!546028) (not e!444284))))

(declare-fun lt!358260 () SeekEntryResult!8455)

(declare-fun lt!358258 () array!43568)

(declare-fun lt!358261 () (_ BitVec 64))

(assert (=> b!801506 (= res!546028 (= lt!358260 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358261 lt!358258 mask!3266)))))

(assert (=> b!801506 (= lt!358260 (seekEntryOrOpen!0 lt!358261 lt!358258 mask!3266))))

(assert (=> b!801506 (= lt!358261 (select (store (arr!20864 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!801506 (= lt!358258 (array!43569 (store (arr!20864 a!3170) i!1163 k!2044) (size!21285 a!3170)))))

(declare-fun b!801507 () Bool)

(declare-fun res!546029 () Bool)

(assert (=> b!801507 (=> (not res!546029) (not e!444283))))

(assert (=> b!801507 (= res!546029 (validKeyInArray!0 k!2044))))

(declare-fun b!801508 () Bool)

(declare-fun res!546025 () Bool)

(assert (=> b!801508 (=> (not res!546025) (not e!444283))))

(declare-fun arrayContainsKey!0 (array!43568 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801508 (= res!546025 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801509 () Bool)

(declare-fun res!546024 () Bool)

(assert (=> b!801509 (=> (not res!546024) (not e!444279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43568 (_ BitVec 32)) Bool)

(assert (=> b!801509 (= res!546024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801510 () Bool)

(declare-fun res!546018 () Bool)

(assert (=> b!801510 (=> (not res!546018) (not e!444281))))

(assert (=> b!801510 (= res!546018 (= lt!358260 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358265 vacantAfter!23 lt!358261 lt!358258 mask!3266)))))

(assert (= (and start!68778 res!546022) b!801502))

(assert (= (and b!801502 res!546017) b!801505))

(assert (= (and b!801505 res!546027) b!801507))

(assert (= (and b!801507 res!546029) b!801508))

(assert (= (and b!801508 res!546025) b!801501))

(assert (= (and b!801501 res!546021) b!801509))

(assert (= (and b!801509 res!546024) b!801498))

(assert (= (and b!801498 res!546023) b!801504))

(assert (= (and b!801504 res!546019) b!801506))

(assert (= (and b!801506 res!546028) b!801500))

(assert (= (and b!801500 res!546020) b!801499))

(assert (= (and b!801499 res!546026) b!801510))

(assert (= (and b!801510 res!546018) b!801503))

(declare-fun m!742667 () Bool)

(assert (=> b!801507 m!742667))

(declare-fun m!742669 () Bool)

(assert (=> b!801510 m!742669))

(declare-fun m!742671 () Bool)

(assert (=> b!801500 m!742671))

(declare-fun m!742673 () Bool)

(assert (=> b!801500 m!742673))

(assert (=> b!801500 m!742673))

(declare-fun m!742675 () Bool)

(assert (=> b!801500 m!742675))

(assert (=> b!801500 m!742673))

(declare-fun m!742677 () Bool)

(assert (=> b!801500 m!742677))

(declare-fun m!742679 () Bool)

(assert (=> b!801509 m!742679))

(assert (=> b!801505 m!742673))

(assert (=> b!801505 m!742673))

(declare-fun m!742681 () Bool)

(assert (=> b!801505 m!742681))

(declare-fun m!742683 () Bool)

(assert (=> start!68778 m!742683))

(declare-fun m!742685 () Bool)

(assert (=> start!68778 m!742685))

(declare-fun m!742687 () Bool)

(assert (=> b!801498 m!742687))

(declare-fun m!742689 () Bool)

(assert (=> b!801501 m!742689))

(declare-fun m!742691 () Bool)

(assert (=> b!801499 m!742691))

(declare-fun m!742693 () Bool)

(assert (=> b!801504 m!742693))

(declare-fun m!742695 () Bool)

(assert (=> b!801504 m!742695))

(assert (=> b!801503 m!742673))

(assert (=> b!801503 m!742673))

(declare-fun m!742697 () Bool)

(assert (=> b!801503 m!742697))

(declare-fun m!742699 () Bool)

(assert (=> b!801506 m!742699))

(declare-fun m!742701 () Bool)

(assert (=> b!801506 m!742701))

(declare-fun m!742703 () Bool)

(assert (=> b!801506 m!742703))

(declare-fun m!742705 () Bool)

(assert (=> b!801506 m!742705))

(declare-fun m!742707 () Bool)

(assert (=> b!801508 m!742707))

(push 1)

