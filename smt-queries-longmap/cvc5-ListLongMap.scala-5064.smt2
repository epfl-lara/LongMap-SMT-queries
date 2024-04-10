; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68894 () Bool)

(assert start!68894)

(declare-fun b!803504 () Bool)

(declare-fun res!548028 () Bool)

(declare-fun e!445233 () Bool)

(assert (=> b!803504 (=> (not res!548028) (not e!445233))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43684 0))(
  ( (array!43685 (arr!20922 (Array (_ BitVec 32) (_ BitVec 64))) (size!21343 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43684)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!803504 (= res!548028 (and (= (size!21343 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21343 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21343 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803505 () Bool)

(declare-fun e!445234 () Bool)

(declare-fun e!445232 () Bool)

(assert (=> b!803505 (= e!445234 e!445232)))

(declare-fun res!548031 () Bool)

(assert (=> b!803505 (=> (not res!548031) (not e!445232))))

(declare-datatypes ((SeekEntryResult!8513 0))(
  ( (MissingZero!8513 (index!36420 (_ BitVec 32))) (Found!8513 (index!36421 (_ BitVec 32))) (Intermediate!8513 (undefined!9325 Bool) (index!36422 (_ BitVec 32)) (x!67263 (_ BitVec 32))) (Undefined!8513) (MissingVacant!8513 (index!36423 (_ BitVec 32))) )
))
(declare-fun lt!359653 () SeekEntryResult!8513)

(declare-fun lt!359649 () SeekEntryResult!8513)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!803505 (= res!548031 (and (= lt!359649 lt!359653) (= lt!359653 (Found!8513 j!153)) (not (= (select (arr!20922 a!3170) index!1236) (select (arr!20922 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43684 (_ BitVec 32)) SeekEntryResult!8513)

(assert (=> b!803505 (= lt!359653 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20922 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43684 (_ BitVec 32)) SeekEntryResult!8513)

(assert (=> b!803505 (= lt!359649 (seekEntryOrOpen!0 (select (arr!20922 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803506 () Bool)

(assert (=> b!803506 (= e!445232 (not true))))

(declare-fun lt!359654 () array!43684)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!359651 () (_ BitVec 64))

(declare-fun lt!359652 () (_ BitVec 32))

(assert (=> b!803506 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359652 vacantAfter!23 lt!359651 lt!359654 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359652 vacantBefore!23 (select (arr!20922 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27566 0))(
  ( (Unit!27567) )
))
(declare-fun lt!359648 () Unit!27566)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43684 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27566)

(assert (=> b!803506 (= lt!359648 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!359652 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803506 (= lt!359652 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803507 () Bool)

(declare-fun res!548032 () Bool)

(assert (=> b!803507 (=> (not res!548032) (not e!445233))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803507 (= res!548032 (validKeyInArray!0 (select (arr!20922 a!3170) j!153)))))

(declare-fun b!803508 () Bool)

(declare-fun res!548029 () Bool)

(declare-fun e!445231 () Bool)

(assert (=> b!803508 (=> (not res!548029) (not e!445231))))

(declare-datatypes ((List!14885 0))(
  ( (Nil!14882) (Cons!14881 (h!16010 (_ BitVec 64)) (t!21200 List!14885)) )
))
(declare-fun arrayNoDuplicates!0 (array!43684 (_ BitVec 32) List!14885) Bool)

(assert (=> b!803508 (= res!548029 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14882))))

(declare-fun res!548023 () Bool)

(assert (=> start!68894 (=> (not res!548023) (not e!445233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68894 (= res!548023 (validMask!0 mask!3266))))

(assert (=> start!68894 e!445233))

(assert (=> start!68894 true))

(declare-fun array_inv!16718 (array!43684) Bool)

(assert (=> start!68894 (array_inv!16718 a!3170)))

(declare-fun b!803509 () Bool)

(declare-fun res!548026 () Bool)

(assert (=> b!803509 (=> (not res!548026) (not e!445233))))

(declare-fun arrayContainsKey!0 (array!43684 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803509 (= res!548026 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803510 () Bool)

(assert (=> b!803510 (= e!445231 e!445234)))

(declare-fun res!548027 () Bool)

(assert (=> b!803510 (=> (not res!548027) (not e!445234))))

(assert (=> b!803510 (= res!548027 (= (seekEntryOrOpen!0 lt!359651 lt!359654 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359651 lt!359654 mask!3266)))))

(assert (=> b!803510 (= lt!359651 (select (store (arr!20922 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!803510 (= lt!359654 (array!43685 (store (arr!20922 a!3170) i!1163 k!2044) (size!21343 a!3170)))))

(declare-fun b!803511 () Bool)

(assert (=> b!803511 (= e!445233 e!445231)))

(declare-fun res!548033 () Bool)

(assert (=> b!803511 (=> (not res!548033) (not e!445231))))

(declare-fun lt!359650 () SeekEntryResult!8513)

(assert (=> b!803511 (= res!548033 (or (= lt!359650 (MissingZero!8513 i!1163)) (= lt!359650 (MissingVacant!8513 i!1163))))))

(assert (=> b!803511 (= lt!359650 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!803512 () Bool)

(declare-fun res!548025 () Bool)

(assert (=> b!803512 (=> (not res!548025) (not e!445233))))

(assert (=> b!803512 (= res!548025 (validKeyInArray!0 k!2044))))

(declare-fun b!803513 () Bool)

(declare-fun res!548030 () Bool)

(assert (=> b!803513 (=> (not res!548030) (not e!445231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43684 (_ BitVec 32)) Bool)

(assert (=> b!803513 (= res!548030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803514 () Bool)

(declare-fun res!548024 () Bool)

(assert (=> b!803514 (=> (not res!548024) (not e!445231))))

(assert (=> b!803514 (= res!548024 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21343 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20922 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21343 a!3170)) (= (select (arr!20922 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68894 res!548023) b!803504))

(assert (= (and b!803504 res!548028) b!803507))

(assert (= (and b!803507 res!548032) b!803512))

(assert (= (and b!803512 res!548025) b!803509))

(assert (= (and b!803509 res!548026) b!803511))

(assert (= (and b!803511 res!548033) b!803513))

(assert (= (and b!803513 res!548030) b!803508))

(assert (= (and b!803508 res!548029) b!803514))

(assert (= (and b!803514 res!548024) b!803510))

(assert (= (and b!803510 res!548027) b!803505))

(assert (= (and b!803505 res!548031) b!803506))

(declare-fun m!745247 () Bool)

(assert (=> b!803509 m!745247))

(declare-fun m!745249 () Bool)

(assert (=> b!803513 m!745249))

(declare-fun m!745251 () Bool)

(assert (=> b!803508 m!745251))

(declare-fun m!745253 () Bool)

(assert (=> b!803506 m!745253))

(declare-fun m!745255 () Bool)

(assert (=> b!803506 m!745255))

(declare-fun m!745257 () Bool)

(assert (=> b!803506 m!745257))

(assert (=> b!803506 m!745255))

(declare-fun m!745259 () Bool)

(assert (=> b!803506 m!745259))

(declare-fun m!745261 () Bool)

(assert (=> b!803506 m!745261))

(declare-fun m!745263 () Bool)

(assert (=> b!803505 m!745263))

(assert (=> b!803505 m!745255))

(assert (=> b!803505 m!745255))

(declare-fun m!745265 () Bool)

(assert (=> b!803505 m!745265))

(assert (=> b!803505 m!745255))

(declare-fun m!745267 () Bool)

(assert (=> b!803505 m!745267))

(declare-fun m!745269 () Bool)

(assert (=> b!803511 m!745269))

(declare-fun m!745271 () Bool)

(assert (=> start!68894 m!745271))

(declare-fun m!745273 () Bool)

(assert (=> start!68894 m!745273))

(assert (=> b!803507 m!745255))

(assert (=> b!803507 m!745255))

(declare-fun m!745275 () Bool)

(assert (=> b!803507 m!745275))

(declare-fun m!745277 () Bool)

(assert (=> b!803510 m!745277))

(declare-fun m!745279 () Bool)

(assert (=> b!803510 m!745279))

(declare-fun m!745281 () Bool)

(assert (=> b!803510 m!745281))

(declare-fun m!745283 () Bool)

(assert (=> b!803510 m!745283))

(declare-fun m!745285 () Bool)

(assert (=> b!803512 m!745285))

(declare-fun m!745287 () Bool)

(assert (=> b!803514 m!745287))

(declare-fun m!745289 () Bool)

(assert (=> b!803514 m!745289))

(push 1)

