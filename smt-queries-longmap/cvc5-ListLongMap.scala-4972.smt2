; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68342 () Bool)

(assert start!68342)

(declare-fun res!538554 () Bool)

(declare-fun e!440971 () Bool)

(assert (=> start!68342 (=> (not res!538554) (not e!440971))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68342 (= res!538554 (validMask!0 mask!3266))))

(assert (=> start!68342 e!440971))

(assert (=> start!68342 true))

(declare-datatypes ((array!43132 0))(
  ( (array!43133 (arr!20646 (Array (_ BitVec 32) (_ BitVec 64))) (size!21067 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43132)

(declare-fun array_inv!16442 (array!43132) Bool)

(assert (=> start!68342 (array_inv!16442 a!3170)))

(declare-fun b!794032 () Bool)

(declare-fun res!538558 () Bool)

(assert (=> b!794032 (=> (not res!538558) (not e!440971))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794032 (= res!538558 (validKeyInArray!0 (select (arr!20646 a!3170) j!153)))))

(declare-fun b!794033 () Bool)

(declare-fun res!538552 () Bool)

(assert (=> b!794033 (=> (not res!538552) (not e!440971))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!794033 (= res!538552 (and (= (size!21067 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21067 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21067 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794034 () Bool)

(declare-fun res!538551 () Bool)

(declare-fun e!440970 () Bool)

(assert (=> b!794034 (=> (not res!538551) (not e!440970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43132 (_ BitVec 32)) Bool)

(assert (=> b!794034 (= res!538551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794035 () Bool)

(assert (=> b!794035 (= e!440971 e!440970)))

(declare-fun res!538555 () Bool)

(assert (=> b!794035 (=> (not res!538555) (not e!440970))))

(declare-datatypes ((SeekEntryResult!8237 0))(
  ( (MissingZero!8237 (index!35316 (_ BitVec 32))) (Found!8237 (index!35317 (_ BitVec 32))) (Intermediate!8237 (undefined!9049 Bool) (index!35318 (_ BitVec 32)) (x!66251 (_ BitVec 32))) (Undefined!8237) (MissingVacant!8237 (index!35319 (_ BitVec 32))) )
))
(declare-fun lt!353956 () SeekEntryResult!8237)

(assert (=> b!794035 (= res!538555 (or (= lt!353956 (MissingZero!8237 i!1163)) (= lt!353956 (MissingVacant!8237 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43132 (_ BitVec 32)) SeekEntryResult!8237)

(assert (=> b!794035 (= lt!353956 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!794036 () Bool)

(declare-fun res!538556 () Bool)

(assert (=> b!794036 (=> (not res!538556) (not e!440970))))

(declare-datatypes ((List!14609 0))(
  ( (Nil!14606) (Cons!14605 (h!15734 (_ BitVec 64)) (t!20924 List!14609)) )
))
(declare-fun arrayNoDuplicates!0 (array!43132 (_ BitVec 32) List!14609) Bool)

(assert (=> b!794036 (= res!538556 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14606))))

(declare-fun b!794037 () Bool)

(declare-fun res!538557 () Bool)

(assert (=> b!794037 (=> (not res!538557) (not e!440970))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!794037 (= res!538557 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21067 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20646 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21067 a!3170)) (= (select (arr!20646 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794038 () Bool)

(assert (=> b!794038 (= e!440970 false)))

(declare-fun lt!353959 () SeekEntryResult!8237)

(declare-fun lt!353958 () (_ BitVec 64))

(declare-fun lt!353960 () array!43132)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43132 (_ BitVec 32)) SeekEntryResult!8237)

(assert (=> b!794038 (= lt!353959 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353958 lt!353960 mask!3266))))

(declare-fun lt!353957 () SeekEntryResult!8237)

(assert (=> b!794038 (= lt!353957 (seekEntryOrOpen!0 lt!353958 lt!353960 mask!3266))))

(assert (=> b!794038 (= lt!353958 (select (store (arr!20646 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!794038 (= lt!353960 (array!43133 (store (arr!20646 a!3170) i!1163 k!2044) (size!21067 a!3170)))))

(declare-fun b!794039 () Bool)

(declare-fun res!538559 () Bool)

(assert (=> b!794039 (=> (not res!538559) (not e!440971))))

(assert (=> b!794039 (= res!538559 (validKeyInArray!0 k!2044))))

(declare-fun b!794040 () Bool)

(declare-fun res!538553 () Bool)

(assert (=> b!794040 (=> (not res!538553) (not e!440971))))

(declare-fun arrayContainsKey!0 (array!43132 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794040 (= res!538553 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68342 res!538554) b!794033))

(assert (= (and b!794033 res!538552) b!794032))

(assert (= (and b!794032 res!538558) b!794039))

(assert (= (and b!794039 res!538559) b!794040))

(assert (= (and b!794040 res!538553) b!794035))

(assert (= (and b!794035 res!538555) b!794034))

(assert (= (and b!794034 res!538551) b!794036))

(assert (= (and b!794036 res!538556) b!794037))

(assert (= (and b!794037 res!538557) b!794038))

(declare-fun m!734543 () Bool)

(assert (=> b!794040 m!734543))

(declare-fun m!734545 () Bool)

(assert (=> b!794032 m!734545))

(assert (=> b!794032 m!734545))

(declare-fun m!734547 () Bool)

(assert (=> b!794032 m!734547))

(declare-fun m!734549 () Bool)

(assert (=> b!794036 m!734549))

(declare-fun m!734551 () Bool)

(assert (=> b!794039 m!734551))

(declare-fun m!734553 () Bool)

(assert (=> b!794035 m!734553))

(declare-fun m!734555 () Bool)

(assert (=> start!68342 m!734555))

(declare-fun m!734557 () Bool)

(assert (=> start!68342 m!734557))

(declare-fun m!734559 () Bool)

(assert (=> b!794038 m!734559))

(declare-fun m!734561 () Bool)

(assert (=> b!794038 m!734561))

(declare-fun m!734563 () Bool)

(assert (=> b!794038 m!734563))

(declare-fun m!734565 () Bool)

(assert (=> b!794038 m!734565))

(declare-fun m!734567 () Bool)

(assert (=> b!794037 m!734567))

(declare-fun m!734569 () Bool)

(assert (=> b!794037 m!734569))

(declare-fun m!734571 () Bool)

(assert (=> b!794034 m!734571))

(push 1)

