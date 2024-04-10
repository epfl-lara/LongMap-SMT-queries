; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68996 () Bool)

(assert start!68996)

(declare-fun b!804879 () Bool)

(declare-fun e!445826 () Bool)

(assert (=> b!804879 (= e!445826 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43786 0))(
  ( (array!43787 (arr!20973 (Array (_ BitVec 32) (_ BitVec 64))) (size!21394 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43786)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8564 0))(
  ( (MissingZero!8564 (index!36624 (_ BitVec 32))) (Found!8564 (index!36625 (_ BitVec 32))) (Intermediate!8564 (undefined!9376 Bool) (index!36626 (_ BitVec 32)) (x!67450 (_ BitVec 32))) (Undefined!8564) (MissingVacant!8564 (index!36627 (_ BitVec 32))) )
))
(declare-fun lt!360349 () SeekEntryResult!8564)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43786 (_ BitVec 32)) SeekEntryResult!8564)

(assert (=> b!804879 (= lt!360349 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20973 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360348 () SeekEntryResult!8564)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43786 (_ BitVec 32)) SeekEntryResult!8564)

(assert (=> b!804879 (= lt!360348 (seekEntryOrOpen!0 (select (arr!20973 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!804880 () Bool)

(declare-fun e!445825 () Bool)

(assert (=> b!804880 (= e!445825 e!445826)))

(declare-fun res!549404 () Bool)

(assert (=> b!804880 (=> (not res!549404) (not e!445826))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!360350 () (_ BitVec 64))

(declare-fun lt!360346 () array!43786)

(assert (=> b!804880 (= res!549404 (= (seekEntryOrOpen!0 lt!360350 lt!360346 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360350 lt!360346 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804880 (= lt!360350 (select (store (arr!20973 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!804880 (= lt!360346 (array!43787 (store (arr!20973 a!3170) i!1163 k!2044) (size!21394 a!3170)))))

(declare-fun b!804881 () Bool)

(declare-fun res!549400 () Bool)

(declare-fun e!445823 () Bool)

(assert (=> b!804881 (=> (not res!549400) (not e!445823))))

(assert (=> b!804881 (= res!549400 (and (= (size!21394 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21394 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21394 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804882 () Bool)

(declare-fun res!549406 () Bool)

(assert (=> b!804882 (=> (not res!549406) (not e!445823))))

(declare-fun arrayContainsKey!0 (array!43786 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804882 (= res!549406 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804883 () Bool)

(declare-fun res!549398 () Bool)

(assert (=> b!804883 (=> (not res!549398) (not e!445825))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43786 (_ BitVec 32)) Bool)

(assert (=> b!804883 (= res!549398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804884 () Bool)

(declare-fun res!549399 () Bool)

(assert (=> b!804884 (=> (not res!549399) (not e!445825))))

(assert (=> b!804884 (= res!549399 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21394 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20973 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21394 a!3170)) (= (select (arr!20973 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!549402 () Bool)

(assert (=> start!68996 (=> (not res!549402) (not e!445823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68996 (= res!549402 (validMask!0 mask!3266))))

(assert (=> start!68996 e!445823))

(assert (=> start!68996 true))

(declare-fun array_inv!16769 (array!43786) Bool)

(assert (=> start!68996 (array_inv!16769 a!3170)))

(declare-fun b!804885 () Bool)

(declare-fun res!549405 () Bool)

(assert (=> b!804885 (=> (not res!549405) (not e!445825))))

(declare-datatypes ((List!14936 0))(
  ( (Nil!14933) (Cons!14932 (h!16061 (_ BitVec 64)) (t!21251 List!14936)) )
))
(declare-fun arrayNoDuplicates!0 (array!43786 (_ BitVec 32) List!14936) Bool)

(assert (=> b!804885 (= res!549405 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14933))))

(declare-fun b!804886 () Bool)

(assert (=> b!804886 (= e!445823 e!445825)))

(declare-fun res!549403 () Bool)

(assert (=> b!804886 (=> (not res!549403) (not e!445825))))

(declare-fun lt!360347 () SeekEntryResult!8564)

(assert (=> b!804886 (= res!549403 (or (= lt!360347 (MissingZero!8564 i!1163)) (= lt!360347 (MissingVacant!8564 i!1163))))))

(assert (=> b!804886 (= lt!360347 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!804887 () Bool)

(declare-fun res!549407 () Bool)

(assert (=> b!804887 (=> (not res!549407) (not e!445823))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804887 (= res!549407 (validKeyInArray!0 (select (arr!20973 a!3170) j!153)))))

(declare-fun b!804888 () Bool)

(declare-fun res!549401 () Bool)

(assert (=> b!804888 (=> (not res!549401) (not e!445823))))

(assert (=> b!804888 (= res!549401 (validKeyInArray!0 k!2044))))

(assert (= (and start!68996 res!549402) b!804881))

(assert (= (and b!804881 res!549400) b!804887))

(assert (= (and b!804887 res!549407) b!804888))

(assert (= (and b!804888 res!549401) b!804882))

(assert (= (and b!804882 res!549406) b!804886))

(assert (= (and b!804886 res!549403) b!804883))

(assert (= (and b!804883 res!549398) b!804885))

(assert (= (and b!804885 res!549405) b!804884))

(assert (= (and b!804884 res!549399) b!804880))

(assert (= (and b!804880 res!549404) b!804879))

(declare-fun m!746753 () Bool)

(assert (=> b!804888 m!746753))

(declare-fun m!746755 () Bool)

(assert (=> b!804884 m!746755))

(declare-fun m!746757 () Bool)

(assert (=> b!804884 m!746757))

(declare-fun m!746759 () Bool)

(assert (=> b!804887 m!746759))

(assert (=> b!804887 m!746759))

(declare-fun m!746761 () Bool)

(assert (=> b!804887 m!746761))

(assert (=> b!804879 m!746759))

(assert (=> b!804879 m!746759))

(declare-fun m!746763 () Bool)

(assert (=> b!804879 m!746763))

(assert (=> b!804879 m!746759))

(declare-fun m!746765 () Bool)

(assert (=> b!804879 m!746765))

(declare-fun m!746767 () Bool)

(assert (=> b!804880 m!746767))

(declare-fun m!746769 () Bool)

(assert (=> b!804880 m!746769))

(declare-fun m!746771 () Bool)

(assert (=> b!804880 m!746771))

(declare-fun m!746773 () Bool)

(assert (=> b!804880 m!746773))

(declare-fun m!746775 () Bool)

(assert (=> b!804883 m!746775))

(declare-fun m!746777 () Bool)

(assert (=> b!804882 m!746777))

(declare-fun m!746779 () Bool)

(assert (=> b!804885 m!746779))

(declare-fun m!746781 () Bool)

(assert (=> start!68996 m!746781))

(declare-fun m!746783 () Bool)

(assert (=> start!68996 m!746783))

(declare-fun m!746785 () Bool)

(assert (=> b!804886 m!746785))

(push 1)

(assert (not b!804883))

(assert (not b!804886))

(assert (not b!804880))

(assert (not start!68996))

(assert (not b!804879))

(assert (not b!804882))

(assert (not b!804888))

(assert (not b!804885))

(assert (not b!804887))

