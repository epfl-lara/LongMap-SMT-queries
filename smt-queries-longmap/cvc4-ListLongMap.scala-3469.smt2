; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48148 () Bool)

(assert start!48148)

(declare-fun b!530401 () Bool)

(declare-fun res!326117 () Bool)

(declare-fun e!309045 () Bool)

(assert (=> b!530401 (=> (not res!326117) (not e!309045))))

(declare-datatypes ((array!33584 0))(
  ( (array!33585 (arr!16139 (Array (_ BitVec 32) (_ BitVec 64))) (size!16503 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33584)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530401 (= res!326117 (validKeyInArray!0 (select (arr!16139 a!3235) j!176)))))

(declare-fun b!530402 () Bool)

(declare-fun res!326113 () Bool)

(assert (=> b!530402 (=> (not res!326113) (not e!309045))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33584 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530402 (= res!326113 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!530403 () Bool)

(declare-fun e!309043 () Bool)

(assert (=> b!530403 (= e!309043 true)))

(declare-fun lt!244755 () array!33584)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!244749 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4606 0))(
  ( (MissingZero!4606 (index!20648 (_ BitVec 32))) (Found!4606 (index!20649 (_ BitVec 32))) (Intermediate!4606 (undefined!5418 Bool) (index!20650 (_ BitVec 32)) (x!49612 (_ BitVec 32))) (Undefined!4606) (MissingVacant!4606 (index!20651 (_ BitVec 32))) )
))
(declare-fun lt!244753 () SeekEntryResult!4606)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33584 (_ BitVec 32)) SeekEntryResult!4606)

(assert (=> b!530403 (= lt!244753 (seekEntryOrOpen!0 lt!244749 lt!244755 mask!3524))))

(assert (=> b!530403 false))

(declare-fun b!530404 () Bool)

(declare-fun e!309041 () Bool)

(assert (=> b!530404 (= e!309045 e!309041)))

(declare-fun res!326114 () Bool)

(assert (=> b!530404 (=> (not res!326114) (not e!309041))))

(declare-fun lt!244748 () SeekEntryResult!4606)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!530404 (= res!326114 (or (= lt!244748 (MissingZero!4606 i!1204)) (= lt!244748 (MissingVacant!4606 i!1204))))))

(assert (=> b!530404 (= lt!244748 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!530405 () Bool)

(declare-fun e!309042 () Bool)

(assert (=> b!530405 (= e!309041 (not e!309042))))

(declare-fun res!326112 () Bool)

(assert (=> b!530405 (=> res!326112 e!309042)))

(declare-fun lt!244752 () SeekEntryResult!4606)

(declare-fun lt!244750 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33584 (_ BitVec 32)) SeekEntryResult!4606)

(assert (=> b!530405 (= res!326112 (= lt!244752 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244750 lt!244749 lt!244755 mask!3524)))))

(declare-fun lt!244751 () (_ BitVec 32))

(assert (=> b!530405 (= lt!244752 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244751 (select (arr!16139 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!530405 (= lt!244750 (toIndex!0 lt!244749 mask!3524))))

(assert (=> b!530405 (= lt!244749 (select (store (arr!16139 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!530405 (= lt!244751 (toIndex!0 (select (arr!16139 a!3235) j!176) mask!3524))))

(assert (=> b!530405 (= lt!244755 (array!33585 (store (arr!16139 a!3235) i!1204 k!2280) (size!16503 a!3235)))))

(declare-fun e!309044 () Bool)

(assert (=> b!530405 e!309044))

(declare-fun res!326109 () Bool)

(assert (=> b!530405 (=> (not res!326109) (not e!309044))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33584 (_ BitVec 32)) Bool)

(assert (=> b!530405 (= res!326109 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16824 0))(
  ( (Unit!16825) )
))
(declare-fun lt!244756 () Unit!16824)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33584 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16824)

(assert (=> b!530405 (= lt!244756 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!326108 () Bool)

(assert (=> start!48148 (=> (not res!326108) (not e!309045))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48148 (= res!326108 (validMask!0 mask!3524))))

(assert (=> start!48148 e!309045))

(assert (=> start!48148 true))

(declare-fun array_inv!11935 (array!33584) Bool)

(assert (=> start!48148 (array_inv!11935 a!3235)))

(declare-fun b!530406 () Bool)

(assert (=> b!530406 (= e!309042 e!309043)))

(declare-fun res!326116 () Bool)

(assert (=> b!530406 (=> res!326116 e!309043)))

(declare-fun lt!244754 () Bool)

(assert (=> b!530406 (= res!326116 (or (and (not lt!244754) (undefined!5418 lt!244752)) (and (not lt!244754) (not (undefined!5418 lt!244752)))))))

(assert (=> b!530406 (= lt!244754 (not (is-Intermediate!4606 lt!244752)))))

(declare-fun b!530407 () Bool)

(declare-fun res!326115 () Bool)

(assert (=> b!530407 (=> (not res!326115) (not e!309041))))

(declare-datatypes ((List!10297 0))(
  ( (Nil!10294) (Cons!10293 (h!11233 (_ BitVec 64)) (t!16525 List!10297)) )
))
(declare-fun arrayNoDuplicates!0 (array!33584 (_ BitVec 32) List!10297) Bool)

(assert (=> b!530407 (= res!326115 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10294))))

(declare-fun b!530408 () Bool)

(declare-fun res!326111 () Bool)

(assert (=> b!530408 (=> (not res!326111) (not e!309041))))

(assert (=> b!530408 (= res!326111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!530409 () Bool)

(declare-fun res!326110 () Bool)

(assert (=> b!530409 (=> (not res!326110) (not e!309045))))

(assert (=> b!530409 (= res!326110 (and (= (size!16503 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16503 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16503 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!530410 () Bool)

(declare-fun res!326107 () Bool)

(assert (=> b!530410 (=> (not res!326107) (not e!309045))))

(assert (=> b!530410 (= res!326107 (validKeyInArray!0 k!2280))))

(declare-fun b!530411 () Bool)

(assert (=> b!530411 (= e!309044 (= (seekEntryOrOpen!0 (select (arr!16139 a!3235) j!176) a!3235 mask!3524) (Found!4606 j!176)))))

(assert (= (and start!48148 res!326108) b!530409))

(assert (= (and b!530409 res!326110) b!530401))

(assert (= (and b!530401 res!326117) b!530410))

(assert (= (and b!530410 res!326107) b!530402))

(assert (= (and b!530402 res!326113) b!530404))

(assert (= (and b!530404 res!326114) b!530408))

(assert (= (and b!530408 res!326111) b!530407))

(assert (= (and b!530407 res!326115) b!530405))

(assert (= (and b!530405 res!326109) b!530411))

(assert (= (and b!530405 (not res!326112)) b!530406))

(assert (= (and b!530406 (not res!326116)) b!530403))

(declare-fun m!510979 () Bool)

(assert (=> b!530407 m!510979))

(declare-fun m!510981 () Bool)

(assert (=> b!530410 m!510981))

(declare-fun m!510983 () Bool)

(assert (=> b!530402 m!510983))

(declare-fun m!510985 () Bool)

(assert (=> b!530411 m!510985))

(assert (=> b!530411 m!510985))

(declare-fun m!510987 () Bool)

(assert (=> b!530411 m!510987))

(declare-fun m!510989 () Bool)

(assert (=> b!530403 m!510989))

(declare-fun m!510991 () Bool)

(assert (=> b!530404 m!510991))

(declare-fun m!510993 () Bool)

(assert (=> b!530408 m!510993))

(assert (=> b!530401 m!510985))

(assert (=> b!530401 m!510985))

(declare-fun m!510995 () Bool)

(assert (=> b!530401 m!510995))

(declare-fun m!510997 () Bool)

(assert (=> b!530405 m!510997))

(declare-fun m!510999 () Bool)

(assert (=> b!530405 m!510999))

(declare-fun m!511001 () Bool)

(assert (=> b!530405 m!511001))

(declare-fun m!511003 () Bool)

(assert (=> b!530405 m!511003))

(assert (=> b!530405 m!510985))

(declare-fun m!511005 () Bool)

(assert (=> b!530405 m!511005))

(assert (=> b!530405 m!510985))

(declare-fun m!511007 () Bool)

(assert (=> b!530405 m!511007))

(assert (=> b!530405 m!510985))

(declare-fun m!511009 () Bool)

(assert (=> b!530405 m!511009))

(declare-fun m!511011 () Bool)

(assert (=> b!530405 m!511011))

(declare-fun m!511013 () Bool)

(assert (=> start!48148 m!511013))

(declare-fun m!511015 () Bool)

(assert (=> start!48148 m!511015))

(push 1)

