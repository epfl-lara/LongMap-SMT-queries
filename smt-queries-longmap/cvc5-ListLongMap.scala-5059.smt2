; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68864 () Bool)

(assert start!68864)

(declare-datatypes ((SeekEntryResult!8498 0))(
  ( (MissingZero!8498 (index!36360 (_ BitVec 32))) (Found!8498 (index!36361 (_ BitVec 32))) (Intermediate!8498 (undefined!9310 Bool) (index!36362 (_ BitVec 32)) (x!67208 (_ BitVec 32))) (Undefined!8498) (MissingVacant!8498 (index!36363 (_ BitVec 32))) )
))
(declare-fun lt!359234 () SeekEntryResult!8498)

(declare-fun b!802966 () Bool)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun e!444964 () Bool)

(declare-fun lt!359232 () SeekEntryResult!8498)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!802966 (= e!444964 (not (or (not (= lt!359232 lt!359234)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun lt!359240 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-datatypes ((array!43654 0))(
  ( (array!43655 (arr!20907 (Array (_ BitVec 32) (_ BitVec 64))) (size!21328 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43654)

(declare-fun lt!359231 () array!43654)

(declare-fun lt!359239 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43654 (_ BitVec 32)) SeekEntryResult!8498)

(assert (=> b!802966 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359239 vacantAfter!23 lt!359240 lt!359231 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359239 vacantBefore!23 (select (arr!20907 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27536 0))(
  ( (Unit!27537) )
))
(declare-fun lt!359236 () Unit!27536)

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43654 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27536)

(assert (=> b!802966 (= lt!359236 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!359239 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802966 (= lt!359239 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802967 () Bool)

(declare-fun e!444966 () Bool)

(declare-fun e!444963 () Bool)

(assert (=> b!802967 (= e!444966 e!444963)))

(declare-fun res!547488 () Bool)

(assert (=> b!802967 (=> (not res!547488) (not e!444963))))

(declare-fun lt!359233 () SeekEntryResult!8498)

(assert (=> b!802967 (= res!547488 (= lt!359233 lt!359232))))

(assert (=> b!802967 (= lt!359232 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359240 lt!359231 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43654 (_ BitVec 32)) SeekEntryResult!8498)

(assert (=> b!802967 (= lt!359233 (seekEntryOrOpen!0 lt!359240 lt!359231 mask!3266))))

(assert (=> b!802967 (= lt!359240 (select (store (arr!20907 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!802967 (= lt!359231 (array!43655 (store (arr!20907 a!3170) i!1163 k!2044) (size!21328 a!3170)))))

(declare-fun b!802968 () Bool)

(declare-fun e!444967 () Bool)

(assert (=> b!802968 (= e!444967 e!444964)))

(declare-fun res!547491 () Bool)

(assert (=> b!802968 (=> (not res!547491) (not e!444964))))

(declare-fun lt!359235 () SeekEntryResult!8498)

(assert (=> b!802968 (= res!547491 (and (= lt!359235 lt!359234) (not (= (select (arr!20907 a!3170) index!1236) (select (arr!20907 a!3170) j!153)))))))

(assert (=> b!802968 (= lt!359234 (Found!8498 j!153))))

(declare-fun b!802969 () Bool)

(declare-fun res!547495 () Bool)

(assert (=> b!802969 (=> (not res!547495) (not e!444966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43654 (_ BitVec 32)) Bool)

(assert (=> b!802969 (= res!547495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802970 () Bool)

(assert (=> b!802970 (= e!444963 e!444967)))

(declare-fun res!547485 () Bool)

(assert (=> b!802970 (=> (not res!547485) (not e!444967))))

(declare-fun lt!359237 () SeekEntryResult!8498)

(assert (=> b!802970 (= res!547485 (= lt!359237 lt!359235))))

(assert (=> b!802970 (= lt!359235 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20907 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802970 (= lt!359237 (seekEntryOrOpen!0 (select (arr!20907 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802971 () Bool)

(declare-fun res!547492 () Bool)

(declare-fun e!444968 () Bool)

(assert (=> b!802971 (=> (not res!547492) (not e!444968))))

(declare-fun arrayContainsKey!0 (array!43654 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802971 (= res!547492 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!547489 () Bool)

(assert (=> start!68864 (=> (not res!547489) (not e!444968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68864 (= res!547489 (validMask!0 mask!3266))))

(assert (=> start!68864 e!444968))

(assert (=> start!68864 true))

(declare-fun array_inv!16703 (array!43654) Bool)

(assert (=> start!68864 (array_inv!16703 a!3170)))

(declare-fun b!802972 () Bool)

(declare-fun res!547486 () Bool)

(assert (=> b!802972 (=> (not res!547486) (not e!444966))))

(assert (=> b!802972 (= res!547486 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21328 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20907 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21328 a!3170)) (= (select (arr!20907 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802973 () Bool)

(declare-fun res!547493 () Bool)

(assert (=> b!802973 (=> (not res!547493) (not e!444968))))

(assert (=> b!802973 (= res!547493 (and (= (size!21328 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21328 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21328 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802974 () Bool)

(declare-fun res!547487 () Bool)

(assert (=> b!802974 (=> (not res!547487) (not e!444966))))

(declare-datatypes ((List!14870 0))(
  ( (Nil!14867) (Cons!14866 (h!15995 (_ BitVec 64)) (t!21185 List!14870)) )
))
(declare-fun arrayNoDuplicates!0 (array!43654 (_ BitVec 32) List!14870) Bool)

(assert (=> b!802974 (= res!547487 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14867))))

(declare-fun b!802975 () Bool)

(declare-fun res!547490 () Bool)

(assert (=> b!802975 (=> (not res!547490) (not e!444968))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802975 (= res!547490 (validKeyInArray!0 (select (arr!20907 a!3170) j!153)))))

(declare-fun b!802976 () Bool)

(declare-fun res!547496 () Bool)

(assert (=> b!802976 (=> (not res!547496) (not e!444968))))

(assert (=> b!802976 (= res!547496 (validKeyInArray!0 k!2044))))

(declare-fun b!802977 () Bool)

(assert (=> b!802977 (= e!444968 e!444966)))

(declare-fun res!547494 () Bool)

(assert (=> b!802977 (=> (not res!547494) (not e!444966))))

(declare-fun lt!359238 () SeekEntryResult!8498)

(assert (=> b!802977 (= res!547494 (or (= lt!359238 (MissingZero!8498 i!1163)) (= lt!359238 (MissingVacant!8498 i!1163))))))

(assert (=> b!802977 (= lt!359238 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68864 res!547489) b!802973))

(assert (= (and b!802973 res!547493) b!802975))

(assert (= (and b!802975 res!547490) b!802976))

(assert (= (and b!802976 res!547496) b!802971))

(assert (= (and b!802971 res!547492) b!802977))

(assert (= (and b!802977 res!547494) b!802969))

(assert (= (and b!802969 res!547495) b!802974))

(assert (= (and b!802974 res!547487) b!802972))

(assert (= (and b!802972 res!547486) b!802967))

(assert (= (and b!802967 res!547488) b!802970))

(assert (= (and b!802970 res!547485) b!802968))

(assert (= (and b!802968 res!547491) b!802966))

(declare-fun m!744569 () Bool)

(assert (=> start!68864 m!744569))

(declare-fun m!744571 () Bool)

(assert (=> start!68864 m!744571))

(declare-fun m!744573 () Bool)

(assert (=> b!802968 m!744573))

(declare-fun m!744575 () Bool)

(assert (=> b!802968 m!744575))

(assert (=> b!802975 m!744575))

(assert (=> b!802975 m!744575))

(declare-fun m!744577 () Bool)

(assert (=> b!802975 m!744577))

(assert (=> b!802966 m!744575))

(declare-fun m!744579 () Bool)

(assert (=> b!802966 m!744579))

(declare-fun m!744581 () Bool)

(assert (=> b!802966 m!744581))

(assert (=> b!802966 m!744575))

(declare-fun m!744583 () Bool)

(assert (=> b!802966 m!744583))

(declare-fun m!744585 () Bool)

(assert (=> b!802966 m!744585))

(declare-fun m!744587 () Bool)

(assert (=> b!802974 m!744587))

(assert (=> b!802970 m!744575))

(assert (=> b!802970 m!744575))

(declare-fun m!744589 () Bool)

(assert (=> b!802970 m!744589))

(assert (=> b!802970 m!744575))

(declare-fun m!744591 () Bool)

(assert (=> b!802970 m!744591))

(declare-fun m!744593 () Bool)

(assert (=> b!802969 m!744593))

(declare-fun m!744595 () Bool)

(assert (=> b!802972 m!744595))

(declare-fun m!744597 () Bool)

(assert (=> b!802972 m!744597))

(declare-fun m!744599 () Bool)

(assert (=> b!802967 m!744599))

(declare-fun m!744601 () Bool)

(assert (=> b!802967 m!744601))

(declare-fun m!744603 () Bool)

(assert (=> b!802967 m!744603))

(declare-fun m!744605 () Bool)

(assert (=> b!802967 m!744605))

(declare-fun m!744607 () Bool)

(assert (=> b!802971 m!744607))

(declare-fun m!744609 () Bool)

(assert (=> b!802977 m!744609))

(declare-fun m!744611 () Bool)

(assert (=> b!802976 m!744611))

(push 1)

(assert (not start!68864))

(assert (not b!802971))

(assert (not b!802976))

(assert (not b!802975))

(assert (not b!802966))

(assert (not b!802970))

(assert (not b!802974))

(assert (not b!802967))

(assert (not b!802969))

(assert (not b!802977))

(check-sat)

(pop 1)

(push 1)

(check-sat)

