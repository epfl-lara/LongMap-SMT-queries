; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68810 () Bool)

(assert start!68810)

(declare-fun res!546570 () Bool)

(declare-fun e!444530 () Bool)

(assert (=> start!68810 (=> (not res!546570) (not e!444530))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68810 (= res!546570 (validMask!0 mask!3266))))

(assert (=> start!68810 e!444530))

(assert (=> start!68810 true))

(declare-datatypes ((array!43600 0))(
  ( (array!43601 (arr!20880 (Array (_ BitVec 32) (_ BitVec 64))) (size!21301 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43600)

(declare-fun array_inv!16676 (array!43600) Bool)

(assert (=> start!68810 (array_inv!16676 a!3170)))

(declare-fun b!802046 () Bool)

(declare-fun e!444531 () Bool)

(assert (=> b!802046 (= e!444531 (not true))))

(declare-fun lt!358609 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!358608 () array!43600)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!358610 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8471 0))(
  ( (MissingZero!8471 (index!36252 (_ BitVec 32))) (Found!8471 (index!36253 (_ BitVec 32))) (Intermediate!8471 (undefined!9283 Bool) (index!36254 (_ BitVec 32)) (x!67109 (_ BitVec 32))) (Undefined!8471) (MissingVacant!8471 (index!36255 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43600 (_ BitVec 32)) SeekEntryResult!8471)

(assert (=> b!802046 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358610 vacantAfter!23 lt!358609 lt!358608 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358610 vacantBefore!23 (select (arr!20880 a!3170) j!153) a!3170 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((Unit!27482 0))(
  ( (Unit!27483) )
))
(declare-fun lt!358607 () Unit!27482)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43600 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27482)

(assert (=> b!802046 (= lt!358607 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!358610 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802046 (= lt!358610 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802047 () Bool)

(declare-fun e!444529 () Bool)

(declare-fun e!444533 () Bool)

(assert (=> b!802047 (= e!444529 e!444533)))

(declare-fun res!546574 () Bool)

(assert (=> b!802047 (=> (not res!546574) (not e!444533))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43600 (_ BitVec 32)) SeekEntryResult!8471)

(assert (=> b!802047 (= res!546574 (= (seekEntryOrOpen!0 lt!358609 lt!358608 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358609 lt!358608 mask!3266)))))

(assert (=> b!802047 (= lt!358609 (select (store (arr!20880 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!802047 (= lt!358608 (array!43601 (store (arr!20880 a!3170) i!1163 k!2044) (size!21301 a!3170)))))

(declare-fun b!802048 () Bool)

(declare-fun res!546572 () Bool)

(assert (=> b!802048 (=> (not res!546572) (not e!444529))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43600 (_ BitVec 32)) Bool)

(assert (=> b!802048 (= res!546572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802049 () Bool)

(assert (=> b!802049 (= e!444533 e!444531)))

(declare-fun res!546573 () Bool)

(assert (=> b!802049 (=> (not res!546573) (not e!444531))))

(declare-fun lt!358605 () SeekEntryResult!8471)

(declare-fun lt!358604 () SeekEntryResult!8471)

(assert (=> b!802049 (= res!546573 (and (= lt!358604 lt!358605) (= lt!358605 (Found!8471 j!153)) (not (= (select (arr!20880 a!3170) index!1236) (select (arr!20880 a!3170) j!153)))))))

(assert (=> b!802049 (= lt!358605 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20880 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802049 (= lt!358604 (seekEntryOrOpen!0 (select (arr!20880 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802050 () Bool)

(declare-fun res!546575 () Bool)

(assert (=> b!802050 (=> (not res!546575) (not e!444529))))

(assert (=> b!802050 (= res!546575 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21301 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20880 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21301 a!3170)) (= (select (arr!20880 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802051 () Bool)

(declare-fun res!546571 () Bool)

(assert (=> b!802051 (=> (not res!546571) (not e!444529))))

(declare-datatypes ((List!14843 0))(
  ( (Nil!14840) (Cons!14839 (h!15968 (_ BitVec 64)) (t!21158 List!14843)) )
))
(declare-fun arrayNoDuplicates!0 (array!43600 (_ BitVec 32) List!14843) Bool)

(assert (=> b!802051 (= res!546571 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14840))))

(declare-fun b!802052 () Bool)

(declare-fun res!546569 () Bool)

(assert (=> b!802052 (=> (not res!546569) (not e!444530))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802052 (= res!546569 (validKeyInArray!0 k!2044))))

(declare-fun b!802053 () Bool)

(declare-fun res!546566 () Bool)

(assert (=> b!802053 (=> (not res!546566) (not e!444530))))

(declare-fun arrayContainsKey!0 (array!43600 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802053 (= res!546566 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802054 () Bool)

(assert (=> b!802054 (= e!444530 e!444529)))

(declare-fun res!546567 () Bool)

(assert (=> b!802054 (=> (not res!546567) (not e!444529))))

(declare-fun lt!358606 () SeekEntryResult!8471)

(assert (=> b!802054 (= res!546567 (or (= lt!358606 (MissingZero!8471 i!1163)) (= lt!358606 (MissingVacant!8471 i!1163))))))

(assert (=> b!802054 (= lt!358606 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!802055 () Bool)

(declare-fun res!546568 () Bool)

(assert (=> b!802055 (=> (not res!546568) (not e!444530))))

(assert (=> b!802055 (= res!546568 (validKeyInArray!0 (select (arr!20880 a!3170) j!153)))))

(declare-fun b!802056 () Bool)

(declare-fun res!546565 () Bool)

(assert (=> b!802056 (=> (not res!546565) (not e!444530))))

(assert (=> b!802056 (= res!546565 (and (= (size!21301 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21301 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21301 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68810 res!546570) b!802056))

(assert (= (and b!802056 res!546565) b!802055))

(assert (= (and b!802055 res!546568) b!802052))

(assert (= (and b!802052 res!546569) b!802053))

(assert (= (and b!802053 res!546566) b!802054))

(assert (= (and b!802054 res!546567) b!802048))

(assert (= (and b!802048 res!546572) b!802051))

(assert (= (and b!802051 res!546571) b!802050))

(assert (= (and b!802050 res!546575) b!802047))

(assert (= (and b!802047 res!546574) b!802049))

(assert (= (and b!802049 res!546573) b!802046))

(declare-fun m!743363 () Bool)

(assert (=> b!802055 m!743363))

(assert (=> b!802055 m!743363))

(declare-fun m!743365 () Bool)

(assert (=> b!802055 m!743365))

(declare-fun m!743367 () Bool)

(assert (=> b!802051 m!743367))

(assert (=> b!802046 m!743363))

(declare-fun m!743369 () Bool)

(assert (=> b!802046 m!743369))

(declare-fun m!743371 () Bool)

(assert (=> b!802046 m!743371))

(declare-fun m!743373 () Bool)

(assert (=> b!802046 m!743373))

(assert (=> b!802046 m!743363))

(declare-fun m!743375 () Bool)

(assert (=> b!802046 m!743375))

(declare-fun m!743377 () Bool)

(assert (=> b!802050 m!743377))

(declare-fun m!743379 () Bool)

(assert (=> b!802050 m!743379))

(declare-fun m!743381 () Bool)

(assert (=> b!802048 m!743381))

(declare-fun m!743383 () Bool)

(assert (=> b!802049 m!743383))

(assert (=> b!802049 m!743363))

(assert (=> b!802049 m!743363))

(declare-fun m!743385 () Bool)

(assert (=> b!802049 m!743385))

(assert (=> b!802049 m!743363))

(declare-fun m!743387 () Bool)

(assert (=> b!802049 m!743387))

(declare-fun m!743389 () Bool)

(assert (=> b!802052 m!743389))

(declare-fun m!743391 () Bool)

(assert (=> b!802053 m!743391))

(declare-fun m!743393 () Bool)

(assert (=> b!802054 m!743393))

(declare-fun m!743395 () Bool)

(assert (=> start!68810 m!743395))

(declare-fun m!743397 () Bool)

(assert (=> start!68810 m!743397))

(declare-fun m!743399 () Bool)

(assert (=> b!802047 m!743399))

(declare-fun m!743401 () Bool)

(assert (=> b!802047 m!743401))

(declare-fun m!743403 () Bool)

(assert (=> b!802047 m!743403))

(declare-fun m!743405 () Bool)

(assert (=> b!802047 m!743405))

(push 1)

