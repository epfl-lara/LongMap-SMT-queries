; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68840 () Bool)

(assert start!68840)

(declare-fun b!802552 () Bool)

(declare-fun res!547071 () Bool)

(declare-fun e!444765 () Bool)

(assert (=> b!802552 (=> (not res!547071) (not e!444765))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43630 0))(
  ( (array!43631 (arr!20895 (Array (_ BitVec 32) (_ BitVec 64))) (size!21316 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43630)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!802552 (= res!547071 (and (= (size!21316 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21316 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21316 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802553 () Bool)

(declare-fun e!444767 () Bool)

(declare-fun e!444770 () Bool)

(assert (=> b!802553 (= e!444767 e!444770)))

(declare-fun res!547081 () Bool)

(assert (=> b!802553 (=> (not res!547081) (not e!444770))))

(declare-datatypes ((SeekEntryResult!8486 0))(
  ( (MissingZero!8486 (index!36312 (_ BitVec 32))) (Found!8486 (index!36313 (_ BitVec 32))) (Intermediate!8486 (undefined!9298 Bool) (index!36314 (_ BitVec 32)) (x!67164 (_ BitVec 32))) (Undefined!8486) (MissingVacant!8486 (index!36315 (_ BitVec 32))) )
))
(declare-fun lt!358925 () SeekEntryResult!8486)

(declare-fun lt!358927 () SeekEntryResult!8486)

(assert (=> b!802553 (= res!547081 (= lt!358925 lt!358927))))

(declare-fun lt!358932 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!358931 () array!43630)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43630 (_ BitVec 32)) SeekEntryResult!8486)

(assert (=> b!802553 (= lt!358927 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358932 lt!358931 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43630 (_ BitVec 32)) SeekEntryResult!8486)

(assert (=> b!802553 (= lt!358925 (seekEntryOrOpen!0 lt!358932 lt!358931 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!802553 (= lt!358932 (select (store (arr!20895 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!802553 (= lt!358931 (array!43631 (store (arr!20895 a!3170) i!1163 k!2044) (size!21316 a!3170)))))

(declare-fun b!802554 () Bool)

(assert (=> b!802554 (= e!444765 e!444767)))

(declare-fun res!547072 () Bool)

(assert (=> b!802554 (=> (not res!547072) (not e!444767))))

(declare-fun lt!358934 () SeekEntryResult!8486)

(assert (=> b!802554 (= res!547072 (or (= lt!358934 (MissingZero!8486 i!1163)) (= lt!358934 (MissingVacant!8486 i!1163))))))

(assert (=> b!802554 (= lt!358934 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!802555 () Bool)

(declare-fun res!547077 () Bool)

(assert (=> b!802555 (=> (not res!547077) (not e!444767))))

(declare-datatypes ((List!14858 0))(
  ( (Nil!14855) (Cons!14854 (h!15983 (_ BitVec 64)) (t!21173 List!14858)) )
))
(declare-fun arrayNoDuplicates!0 (array!43630 (_ BitVec 32) List!14858) Bool)

(assert (=> b!802555 (= res!547077 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14855))))

(declare-fun b!802556 () Bool)

(declare-fun res!547082 () Bool)

(assert (=> b!802556 (=> (not res!547082) (not e!444765))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802556 (= res!547082 (validKeyInArray!0 k!2044))))

(declare-fun b!802557 () Bool)

(declare-fun lt!358926 () SeekEntryResult!8486)

(declare-fun e!444766 () Bool)

(assert (=> b!802557 (= e!444766 (not (or (not (= lt!358927 lt!358926)) (bvsge mask!3266 #b00000000000000000000000000000000))))))

(declare-fun lt!358933 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!802557 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358933 vacantAfter!23 lt!358932 lt!358931 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358933 vacantBefore!23 (select (arr!20895 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27512 0))(
  ( (Unit!27513) )
))
(declare-fun lt!358929 () Unit!27512)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43630 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27512)

(assert (=> b!802557 (= lt!358929 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!358933 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802557 (= lt!358933 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802558 () Bool)

(declare-fun res!547074 () Bool)

(assert (=> b!802558 (=> (not res!547074) (not e!444767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43630 (_ BitVec 32)) Bool)

(assert (=> b!802558 (= res!547074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802559 () Bool)

(declare-fun e!444768 () Bool)

(assert (=> b!802559 (= e!444770 e!444768)))

(declare-fun res!547073 () Bool)

(assert (=> b!802559 (=> (not res!547073) (not e!444768))))

(declare-fun lt!358928 () SeekEntryResult!8486)

(declare-fun lt!358930 () SeekEntryResult!8486)

(assert (=> b!802559 (= res!547073 (= lt!358928 lt!358930))))

(assert (=> b!802559 (= lt!358930 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20895 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802559 (= lt!358928 (seekEntryOrOpen!0 (select (arr!20895 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802561 () Bool)

(assert (=> b!802561 (= e!444768 e!444766)))

(declare-fun res!547076 () Bool)

(assert (=> b!802561 (=> (not res!547076) (not e!444766))))

(assert (=> b!802561 (= res!547076 (and (= lt!358930 lt!358926) (not (= (select (arr!20895 a!3170) index!1236) (select (arr!20895 a!3170) j!153)))))))

(assert (=> b!802561 (= lt!358926 (Found!8486 j!153))))

(declare-fun b!802562 () Bool)

(declare-fun res!547075 () Bool)

(assert (=> b!802562 (=> (not res!547075) (not e!444765))))

(assert (=> b!802562 (= res!547075 (validKeyInArray!0 (select (arr!20895 a!3170) j!153)))))

(declare-fun b!802563 () Bool)

(declare-fun res!547080 () Bool)

(assert (=> b!802563 (=> (not res!547080) (not e!444767))))

(assert (=> b!802563 (= res!547080 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21316 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20895 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21316 a!3170)) (= (select (arr!20895 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!547079 () Bool)

(assert (=> start!68840 (=> (not res!547079) (not e!444765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68840 (= res!547079 (validMask!0 mask!3266))))

(assert (=> start!68840 e!444765))

(assert (=> start!68840 true))

(declare-fun array_inv!16691 (array!43630) Bool)

(assert (=> start!68840 (array_inv!16691 a!3170)))

(declare-fun b!802560 () Bool)

(declare-fun res!547078 () Bool)

(assert (=> b!802560 (=> (not res!547078) (not e!444765))))

(declare-fun arrayContainsKey!0 (array!43630 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802560 (= res!547078 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68840 res!547079) b!802552))

(assert (= (and b!802552 res!547071) b!802562))

(assert (= (and b!802562 res!547075) b!802556))

(assert (= (and b!802556 res!547082) b!802560))

(assert (= (and b!802560 res!547078) b!802554))

(assert (= (and b!802554 res!547072) b!802558))

(assert (= (and b!802558 res!547074) b!802555))

(assert (= (and b!802555 res!547077) b!802563))

(assert (= (and b!802563 res!547080) b!802553))

(assert (= (and b!802553 res!547081) b!802559))

(assert (= (and b!802559 res!547073) b!802561))

(assert (= (and b!802561 res!547076) b!802557))

(declare-fun m!744041 () Bool)

(assert (=> b!802556 m!744041))

(declare-fun m!744043 () Bool)

(assert (=> b!802561 m!744043))

(declare-fun m!744045 () Bool)

(assert (=> b!802561 m!744045))

(assert (=> b!802559 m!744045))

(assert (=> b!802559 m!744045))

(declare-fun m!744047 () Bool)

(assert (=> b!802559 m!744047))

(assert (=> b!802559 m!744045))

(declare-fun m!744049 () Bool)

(assert (=> b!802559 m!744049))

(declare-fun m!744051 () Bool)

(assert (=> start!68840 m!744051))

(declare-fun m!744053 () Bool)

(assert (=> start!68840 m!744053))

(declare-fun m!744055 () Bool)

(assert (=> b!802563 m!744055))

(declare-fun m!744057 () Bool)

(assert (=> b!802563 m!744057))

(assert (=> b!802557 m!744045))

(declare-fun m!744059 () Bool)

(assert (=> b!802557 m!744059))

(declare-fun m!744061 () Bool)

(assert (=> b!802557 m!744061))

(assert (=> b!802557 m!744045))

(declare-fun m!744063 () Bool)

(assert (=> b!802557 m!744063))

(declare-fun m!744065 () Bool)

(assert (=> b!802557 m!744065))

(declare-fun m!744067 () Bool)

(assert (=> b!802554 m!744067))

(declare-fun m!744069 () Bool)

(assert (=> b!802558 m!744069))

(assert (=> b!802562 m!744045))

(assert (=> b!802562 m!744045))

(declare-fun m!744071 () Bool)

(assert (=> b!802562 m!744071))

(declare-fun m!744073 () Bool)

(assert (=> b!802555 m!744073))

(declare-fun m!744075 () Bool)

(assert (=> b!802560 m!744075))

(declare-fun m!744077 () Bool)

(assert (=> b!802553 m!744077))

(declare-fun m!744079 () Bool)

(assert (=> b!802553 m!744079))

(declare-fun m!744081 () Bool)

(assert (=> b!802553 m!744081))

(declare-fun m!744083 () Bool)

(assert (=> b!802553 m!744083))

(push 1)

