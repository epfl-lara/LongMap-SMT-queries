; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68802 () Bool)

(assert start!68802)

(declare-fun b!801914 () Bool)

(declare-fun res!546434 () Bool)

(declare-fun e!444470 () Bool)

(assert (=> b!801914 (=> (not res!546434) (not e!444470))))

(declare-datatypes ((array!43592 0))(
  ( (array!43593 (arr!20876 (Array (_ BitVec 32) (_ BitVec 64))) (size!21297 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43592)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43592 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801914 (= res!546434 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801915 () Bool)

(declare-fun e!444471 () Bool)

(assert (=> b!801915 (= e!444471 (not true))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!358520 () array!43592)

(declare-fun lt!358524 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun lt!358521 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8467 0))(
  ( (MissingZero!8467 (index!36236 (_ BitVec 32))) (Found!8467 (index!36237 (_ BitVec 32))) (Intermediate!8467 (undefined!9279 Bool) (index!36238 (_ BitVec 32)) (x!67089 (_ BitVec 32))) (Undefined!8467) (MissingVacant!8467 (index!36239 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43592 (_ BitVec 32)) SeekEntryResult!8467)

(assert (=> b!801915 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358524 vacantAfter!23 lt!358521 lt!358520 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358524 vacantBefore!23 (select (arr!20876 a!3170) j!153) a!3170 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((Unit!27474 0))(
  ( (Unit!27475) )
))
(declare-fun lt!358522 () Unit!27474)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43592 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27474)

(assert (=> b!801915 (= lt!358522 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!358524 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801915 (= lt!358524 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!546441 () Bool)

(assert (=> start!68802 (=> (not res!546441) (not e!444470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68802 (= res!546441 (validMask!0 mask!3266))))

(assert (=> start!68802 e!444470))

(assert (=> start!68802 true))

(declare-fun array_inv!16672 (array!43592) Bool)

(assert (=> start!68802 (array_inv!16672 a!3170)))

(declare-fun b!801916 () Bool)

(declare-fun e!444473 () Bool)

(assert (=> b!801916 (= e!444473 e!444471)))

(declare-fun res!546438 () Bool)

(assert (=> b!801916 (=> (not res!546438) (not e!444471))))

(declare-fun lt!358526 () SeekEntryResult!8467)

(declare-fun lt!358525 () SeekEntryResult!8467)

(assert (=> b!801916 (= res!546438 (and (= lt!358526 lt!358525) (= lt!358525 (Found!8467 j!153)) (not (= (select (arr!20876 a!3170) index!1236) (select (arr!20876 a!3170) j!153)))))))

(assert (=> b!801916 (= lt!358525 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20876 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43592 (_ BitVec 32)) SeekEntryResult!8467)

(assert (=> b!801916 (= lt!358526 (seekEntryOrOpen!0 (select (arr!20876 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801917 () Bool)

(declare-fun res!546439 () Bool)

(assert (=> b!801917 (=> (not res!546439) (not e!444470))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801917 (= res!546439 (validKeyInArray!0 (select (arr!20876 a!3170) j!153)))))

(declare-fun b!801918 () Bool)

(declare-fun res!546435 () Bool)

(declare-fun e!444472 () Bool)

(assert (=> b!801918 (=> (not res!546435) (not e!444472))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43592 (_ BitVec 32)) Bool)

(assert (=> b!801918 (= res!546435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801919 () Bool)

(declare-fun res!546442 () Bool)

(assert (=> b!801919 (=> (not res!546442) (not e!444472))))

(declare-datatypes ((List!14839 0))(
  ( (Nil!14836) (Cons!14835 (h!15964 (_ BitVec 64)) (t!21154 List!14839)) )
))
(declare-fun arrayNoDuplicates!0 (array!43592 (_ BitVec 32) List!14839) Bool)

(assert (=> b!801919 (= res!546442 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14836))))

(declare-fun b!801920 () Bool)

(declare-fun res!546437 () Bool)

(assert (=> b!801920 (=> (not res!546437) (not e!444470))))

(assert (=> b!801920 (= res!546437 (validKeyInArray!0 k!2044))))

(declare-fun b!801921 () Bool)

(declare-fun res!546433 () Bool)

(assert (=> b!801921 (=> (not res!546433) (not e!444470))))

(assert (=> b!801921 (= res!546433 (and (= (size!21297 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21297 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21297 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801922 () Bool)

(declare-fun res!546440 () Bool)

(assert (=> b!801922 (=> (not res!546440) (not e!444472))))

(assert (=> b!801922 (= res!546440 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21297 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20876 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21297 a!3170)) (= (select (arr!20876 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801923 () Bool)

(assert (=> b!801923 (= e!444472 e!444473)))

(declare-fun res!546443 () Bool)

(assert (=> b!801923 (=> (not res!546443) (not e!444473))))

(assert (=> b!801923 (= res!546443 (= (seekEntryOrOpen!0 lt!358521 lt!358520 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358521 lt!358520 mask!3266)))))

(assert (=> b!801923 (= lt!358521 (select (store (arr!20876 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!801923 (= lt!358520 (array!43593 (store (arr!20876 a!3170) i!1163 k!2044) (size!21297 a!3170)))))

(declare-fun b!801924 () Bool)

(assert (=> b!801924 (= e!444470 e!444472)))

(declare-fun res!546436 () Bool)

(assert (=> b!801924 (=> (not res!546436) (not e!444472))))

(declare-fun lt!358523 () SeekEntryResult!8467)

(assert (=> b!801924 (= res!546436 (or (= lt!358523 (MissingZero!8467 i!1163)) (= lt!358523 (MissingVacant!8467 i!1163))))))

(assert (=> b!801924 (= lt!358523 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68802 res!546441) b!801921))

(assert (= (and b!801921 res!546433) b!801917))

(assert (= (and b!801917 res!546439) b!801920))

(assert (= (and b!801920 res!546437) b!801914))

(assert (= (and b!801914 res!546434) b!801924))

(assert (= (and b!801924 res!546436) b!801918))

(assert (= (and b!801918 res!546435) b!801919))

(assert (= (and b!801919 res!546442) b!801922))

(assert (= (and b!801922 res!546440) b!801923))

(assert (= (and b!801923 res!546443) b!801916))

(assert (= (and b!801916 res!546438) b!801915))

(declare-fun m!743187 () Bool)

(assert (=> b!801920 m!743187))

(declare-fun m!743189 () Bool)

(assert (=> b!801922 m!743189))

(declare-fun m!743191 () Bool)

(assert (=> b!801922 m!743191))

(declare-fun m!743193 () Bool)

(assert (=> b!801919 m!743193))

(declare-fun m!743195 () Bool)

(assert (=> b!801914 m!743195))

(declare-fun m!743197 () Bool)

(assert (=> b!801918 m!743197))

(declare-fun m!743199 () Bool)

(assert (=> b!801916 m!743199))

(declare-fun m!743201 () Bool)

(assert (=> b!801916 m!743201))

(assert (=> b!801916 m!743201))

(declare-fun m!743203 () Bool)

(assert (=> b!801916 m!743203))

(assert (=> b!801916 m!743201))

(declare-fun m!743205 () Bool)

(assert (=> b!801916 m!743205))

(declare-fun m!743207 () Bool)

(assert (=> b!801923 m!743207))

(declare-fun m!743209 () Bool)

(assert (=> b!801923 m!743209))

(declare-fun m!743211 () Bool)

(assert (=> b!801923 m!743211))

(declare-fun m!743213 () Bool)

(assert (=> b!801923 m!743213))

(declare-fun m!743215 () Bool)

(assert (=> b!801924 m!743215))

(assert (=> b!801917 m!743201))

(assert (=> b!801917 m!743201))

(declare-fun m!743217 () Bool)

(assert (=> b!801917 m!743217))

(assert (=> b!801915 m!743201))

(declare-fun m!743219 () Bool)

(assert (=> b!801915 m!743219))

(assert (=> b!801915 m!743201))

(declare-fun m!743221 () Bool)

(assert (=> b!801915 m!743221))

(declare-fun m!743223 () Bool)

(assert (=> b!801915 m!743223))

(declare-fun m!743225 () Bool)

(assert (=> b!801915 m!743225))

(declare-fun m!743227 () Bool)

(assert (=> start!68802 m!743227))

(declare-fun m!743229 () Bool)

(assert (=> start!68802 m!743229))

(push 1)

(assert (not b!801914))

