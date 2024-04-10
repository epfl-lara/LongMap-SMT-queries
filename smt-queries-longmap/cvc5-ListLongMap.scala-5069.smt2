; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68924 () Bool)

(assert start!68924)

(declare-fun b!804017 () Bool)

(declare-fun e!445476 () Bool)

(declare-fun e!445477 () Bool)

(assert (=> b!804017 (= e!445476 e!445477)))

(declare-fun res!548540 () Bool)

(assert (=> b!804017 (=> (not res!548540) (not e!445477))))

(declare-datatypes ((array!43714 0))(
  ( (array!43715 (arr!20937 (Array (_ BitVec 32) (_ BitVec 64))) (size!21358 (_ BitVec 32))) )
))
(declare-fun lt!360022 () array!43714)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!360023 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8528 0))(
  ( (MissingZero!8528 (index!36480 (_ BitVec 32))) (Found!8528 (index!36481 (_ BitVec 32))) (Intermediate!8528 (undefined!9340 Bool) (index!36482 (_ BitVec 32)) (x!67318 (_ BitVec 32))) (Undefined!8528) (MissingVacant!8528 (index!36483 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43714 (_ BitVec 32)) SeekEntryResult!8528)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43714 (_ BitVec 32)) SeekEntryResult!8528)

(assert (=> b!804017 (= res!548540 (= (seekEntryOrOpen!0 lt!360023 lt!360022 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360023 lt!360022 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43714)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!804017 (= lt!360023 (select (store (arr!20937 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!804017 (= lt!360022 (array!43715 (store (arr!20937 a!3170) i!1163 k!2044) (size!21358 a!3170)))))

(declare-fun b!804018 () Bool)

(declare-fun res!548545 () Bool)

(declare-fun e!445475 () Bool)

(assert (=> b!804018 (=> (not res!548545) (not e!445475))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804018 (= res!548545 (validKeyInArray!0 (select (arr!20937 a!3170) j!153)))))

(declare-fun res!548536 () Bool)

(assert (=> start!68924 (=> (not res!548536) (not e!445475))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68924 (= res!548536 (validMask!0 mask!3266))))

(assert (=> start!68924 e!445475))

(assert (=> start!68924 true))

(declare-fun array_inv!16733 (array!43714) Bool)

(assert (=> start!68924 (array_inv!16733 a!3170)))

(declare-fun b!804019 () Bool)

(declare-fun res!548539 () Bool)

(assert (=> b!804019 (=> (not res!548539) (not e!445475))))

(assert (=> b!804019 (= res!548539 (and (= (size!21358 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21358 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21358 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804020 () Bool)

(declare-fun res!548538 () Bool)

(assert (=> b!804020 (=> (not res!548538) (not e!445476))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43714 (_ BitVec 32)) Bool)

(assert (=> b!804020 (= res!548538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804021 () Bool)

(declare-fun res!548543 () Bool)

(assert (=> b!804021 (=> (not res!548543) (not e!445476))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!804021 (= res!548543 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21358 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20937 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21358 a!3170)) (= (select (arr!20937 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!804022 () Bool)

(declare-fun res!548546 () Bool)

(assert (=> b!804022 (=> (not res!548546) (not e!445475))))

(declare-fun arrayContainsKey!0 (array!43714 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804022 (= res!548546 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804023 () Bool)

(declare-fun res!548541 () Bool)

(assert (=> b!804023 (=> (not res!548541) (not e!445476))))

(declare-datatypes ((List!14900 0))(
  ( (Nil!14897) (Cons!14896 (h!16025 (_ BitVec 64)) (t!21215 List!14900)) )
))
(declare-fun arrayNoDuplicates!0 (array!43714 (_ BitVec 32) List!14900) Bool)

(assert (=> b!804023 (= res!548541 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14897))))

(declare-fun b!804024 () Bool)

(declare-fun e!445478 () Bool)

(assert (=> b!804024 (= e!445477 e!445478)))

(declare-fun res!548542 () Bool)

(assert (=> b!804024 (=> (not res!548542) (not e!445478))))

(declare-fun lt!360018 () SeekEntryResult!8528)

(declare-fun lt!360021 () SeekEntryResult!8528)

(assert (=> b!804024 (= res!548542 (and (= lt!360021 lt!360018) (= lt!360018 (Found!8528 j!153)) (not (= (select (arr!20937 a!3170) index!1236) (select (arr!20937 a!3170) j!153)))))))

(assert (=> b!804024 (= lt!360018 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20937 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!804024 (= lt!360021 (seekEntryOrOpen!0 (select (arr!20937 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!804025 () Bool)

(assert (=> b!804025 (= e!445478 (not true))))

(declare-fun lt!360017 () (_ BitVec 32))

(assert (=> b!804025 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!360017 vacantAfter!23 lt!360023 lt!360022 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!360017 vacantBefore!23 (select (arr!20937 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27596 0))(
  ( (Unit!27597) )
))
(declare-fun lt!360020 () Unit!27596)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43714 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27596)

(assert (=> b!804025 (= lt!360020 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!360017 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!804025 (= lt!360017 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!804026 () Bool)

(assert (=> b!804026 (= e!445475 e!445476)))

(declare-fun res!548537 () Bool)

(assert (=> b!804026 (=> (not res!548537) (not e!445476))))

(declare-fun lt!360019 () SeekEntryResult!8528)

(assert (=> b!804026 (= res!548537 (or (= lt!360019 (MissingZero!8528 i!1163)) (= lt!360019 (MissingVacant!8528 i!1163))))))

(assert (=> b!804026 (= lt!360019 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!804027 () Bool)

(declare-fun res!548544 () Bool)

(assert (=> b!804027 (=> (not res!548544) (not e!445475))))

(assert (=> b!804027 (= res!548544 (validKeyInArray!0 k!2044))))

(assert (= (and start!68924 res!548536) b!804019))

(assert (= (and b!804019 res!548539) b!804018))

(assert (= (and b!804018 res!548545) b!804027))

(assert (= (and b!804027 res!548544) b!804022))

(assert (= (and b!804022 res!548546) b!804026))

(assert (= (and b!804026 res!548537) b!804020))

(assert (= (and b!804020 res!548538) b!804023))

(assert (= (and b!804023 res!548541) b!804021))

(assert (= (and b!804021 res!548543) b!804017))

(assert (= (and b!804017 res!548540) b!804024))

(assert (= (and b!804024 res!548542) b!804025))

(declare-fun m!745907 () Bool)

(assert (=> start!68924 m!745907))

(declare-fun m!745909 () Bool)

(assert (=> start!68924 m!745909))

(declare-fun m!745911 () Bool)

(assert (=> b!804024 m!745911))

(declare-fun m!745913 () Bool)

(assert (=> b!804024 m!745913))

(assert (=> b!804024 m!745913))

(declare-fun m!745915 () Bool)

(assert (=> b!804024 m!745915))

(assert (=> b!804024 m!745913))

(declare-fun m!745917 () Bool)

(assert (=> b!804024 m!745917))

(declare-fun m!745919 () Bool)

(assert (=> b!804027 m!745919))

(assert (=> b!804018 m!745913))

(assert (=> b!804018 m!745913))

(declare-fun m!745921 () Bool)

(assert (=> b!804018 m!745921))

(declare-fun m!745923 () Bool)

(assert (=> b!804021 m!745923))

(declare-fun m!745925 () Bool)

(assert (=> b!804021 m!745925))

(declare-fun m!745927 () Bool)

(assert (=> b!804022 m!745927))

(declare-fun m!745929 () Bool)

(assert (=> b!804017 m!745929))

(declare-fun m!745931 () Bool)

(assert (=> b!804017 m!745931))

(declare-fun m!745933 () Bool)

(assert (=> b!804017 m!745933))

(declare-fun m!745935 () Bool)

(assert (=> b!804017 m!745935))

(assert (=> b!804025 m!745913))

(declare-fun m!745937 () Bool)

(assert (=> b!804025 m!745937))

(assert (=> b!804025 m!745913))

(declare-fun m!745939 () Bool)

(assert (=> b!804025 m!745939))

(declare-fun m!745941 () Bool)

(assert (=> b!804025 m!745941))

(declare-fun m!745943 () Bool)

(assert (=> b!804025 m!745943))

(declare-fun m!745945 () Bool)

(assert (=> b!804023 m!745945))

(declare-fun m!745947 () Bool)

(assert (=> b!804026 m!745947))

(declare-fun m!745949 () Bool)

(assert (=> b!804020 m!745949))

(push 1)

