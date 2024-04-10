; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68768 () Bool)

(assert start!68768)

(declare-fun b!801303 () Bool)

(declare-fun e!444194 () Bool)

(declare-fun e!444193 () Bool)

(assert (=> b!801303 (= e!444194 e!444193)))

(declare-fun res!545834 () Bool)

(assert (=> b!801303 (=> (not res!545834) (not e!444193))))

(declare-fun lt!358143 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8450 0))(
  ( (MissingZero!8450 (index!36168 (_ BitVec 32))) (Found!8450 (index!36169 (_ BitVec 32))) (Intermediate!8450 (undefined!9262 Bool) (index!36170 (_ BitVec 32)) (x!67032 (_ BitVec 32))) (Undefined!8450) (MissingVacant!8450 (index!36171 (_ BitVec 32))) )
))
(declare-fun lt!358138 () SeekEntryResult!8450)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((array!43558 0))(
  ( (array!43559 (arr!20859 (Array (_ BitVec 32) (_ BitVec 64))) (size!21280 (_ BitVec 32))) )
))
(declare-fun lt!358142 () array!43558)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43558 (_ BitVec 32)) SeekEntryResult!8450)

(assert (=> b!801303 (= res!545834 (= lt!358138 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358143 lt!358142 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43558 (_ BitVec 32)) SeekEntryResult!8450)

(assert (=> b!801303 (= lt!358138 (seekEntryOrOpen!0 lt!358143 lt!358142 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43558)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!801303 (= lt!358143 (select (store (arr!20859 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!801303 (= lt!358142 (array!43559 (store (arr!20859 a!3170) i!1163 k!2044) (size!21280 a!3170)))))

(declare-fun b!801304 () Bool)

(declare-fun res!545830 () Bool)

(declare-fun e!444189 () Bool)

(assert (=> b!801304 (=> (not res!545830) (not e!444189))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801304 (= res!545830 (validKeyInArray!0 (select (arr!20859 a!3170) j!153)))))

(declare-fun b!801305 () Bool)

(declare-fun e!444191 () Bool)

(declare-fun e!444190 () Bool)

(assert (=> b!801305 (= e!444191 e!444190)))

(declare-fun res!545828 () Bool)

(assert (=> b!801305 (=> (not res!545828) (not e!444190))))

(declare-fun lt!358140 () (_ BitVec 32))

(assert (=> b!801305 (= res!545828 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!358140 #b00000000000000000000000000000000) (bvslt lt!358140 (size!21280 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801305 (= lt!358140 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801306 () Bool)

(assert (=> b!801306 (= e!444189 e!444194)))

(declare-fun res!545823 () Bool)

(assert (=> b!801306 (=> (not res!545823) (not e!444194))))

(declare-fun lt!358145 () SeekEntryResult!8450)

(assert (=> b!801306 (= res!545823 (or (= lt!358145 (MissingZero!8450 i!1163)) (= lt!358145 (MissingVacant!8450 i!1163))))))

(assert (=> b!801306 (= lt!358145 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!801307 () Bool)

(assert (=> b!801307 (= e!444193 e!444191)))

(declare-fun res!545829 () Bool)

(assert (=> b!801307 (=> (not res!545829) (not e!444191))))

(declare-fun lt!358139 () SeekEntryResult!8450)

(declare-fun lt!358144 () SeekEntryResult!8450)

(assert (=> b!801307 (= res!545829 (and (= lt!358144 lt!358139) (= lt!358139 (Found!8450 j!153)) (not (= (select (arr!20859 a!3170) index!1236) (select (arr!20859 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!801307 (= lt!358139 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20859 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801307 (= lt!358144 (seekEntryOrOpen!0 (select (arr!20859 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801308 () Bool)

(declare-fun res!545822 () Bool)

(assert (=> b!801308 (=> (not res!545822) (not e!444194))))

(declare-datatypes ((List!14822 0))(
  ( (Nil!14819) (Cons!14818 (h!15947 (_ BitVec 64)) (t!21137 List!14822)) )
))
(declare-fun arrayNoDuplicates!0 (array!43558 (_ BitVec 32) List!14822) Bool)

(assert (=> b!801308 (= res!545822 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14819))))

(declare-fun res!545825 () Bool)

(assert (=> start!68768 (=> (not res!545825) (not e!444189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68768 (= res!545825 (validMask!0 mask!3266))))

(assert (=> start!68768 e!444189))

(assert (=> start!68768 true))

(declare-fun array_inv!16655 (array!43558) Bool)

(assert (=> start!68768 (array_inv!16655 a!3170)))

(declare-fun b!801309 () Bool)

(declare-fun res!545826 () Bool)

(assert (=> b!801309 (=> (not res!545826) (not e!444194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43558 (_ BitVec 32)) Bool)

(assert (=> b!801309 (= res!545826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801310 () Bool)

(declare-fun res!545831 () Bool)

(assert (=> b!801310 (=> (not res!545831) (not e!444194))))

(assert (=> b!801310 (= res!545831 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21280 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20859 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21280 a!3170)) (= (select (arr!20859 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801311 () Bool)

(declare-fun res!545824 () Bool)

(assert (=> b!801311 (=> (not res!545824) (not e!444189))))

(assert (=> b!801311 (= res!545824 (validKeyInArray!0 k!2044))))

(declare-fun b!801312 () Bool)

(assert (=> b!801312 (= e!444190 false)))

(declare-fun lt!358141 () SeekEntryResult!8450)

(assert (=> b!801312 (= lt!358141 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358140 vacantBefore!23 (select (arr!20859 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801313 () Bool)

(declare-fun res!545832 () Bool)

(assert (=> b!801313 (=> (not res!545832) (not e!444189))))

(declare-fun arrayContainsKey!0 (array!43558 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801313 (= res!545832 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801314 () Bool)

(declare-fun res!545833 () Bool)

(assert (=> b!801314 (=> (not res!545833) (not e!444190))))

(assert (=> b!801314 (= res!545833 (= lt!358138 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358140 vacantAfter!23 lt!358143 lt!358142 mask!3266)))))

(declare-fun b!801315 () Bool)

(declare-fun res!545827 () Bool)

(assert (=> b!801315 (=> (not res!545827) (not e!444189))))

(assert (=> b!801315 (= res!545827 (and (= (size!21280 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21280 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21280 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68768 res!545825) b!801315))

(assert (= (and b!801315 res!545827) b!801304))

(assert (= (and b!801304 res!545830) b!801311))

(assert (= (and b!801311 res!545824) b!801313))

(assert (= (and b!801313 res!545832) b!801306))

(assert (= (and b!801306 res!545823) b!801309))

(assert (= (and b!801309 res!545826) b!801308))

(assert (= (and b!801308 res!545822) b!801310))

(assert (= (and b!801310 res!545831) b!801303))

(assert (= (and b!801303 res!545834) b!801307))

(assert (= (and b!801307 res!545829) b!801305))

(assert (= (and b!801305 res!545828) b!801314))

(assert (= (and b!801314 res!545833) b!801312))

(declare-fun m!742457 () Bool)

(assert (=> start!68768 m!742457))

(declare-fun m!742459 () Bool)

(assert (=> start!68768 m!742459))

(declare-fun m!742461 () Bool)

(assert (=> b!801310 m!742461))

(declare-fun m!742463 () Bool)

(assert (=> b!801310 m!742463))

(declare-fun m!742465 () Bool)

(assert (=> b!801307 m!742465))

(declare-fun m!742467 () Bool)

(assert (=> b!801307 m!742467))

(assert (=> b!801307 m!742467))

(declare-fun m!742469 () Bool)

(assert (=> b!801307 m!742469))

(assert (=> b!801307 m!742467))

(declare-fun m!742471 () Bool)

(assert (=> b!801307 m!742471))

(declare-fun m!742473 () Bool)

(assert (=> b!801306 m!742473))

(declare-fun m!742475 () Bool)

(assert (=> b!801314 m!742475))

(declare-fun m!742477 () Bool)

(assert (=> b!801313 m!742477))

(declare-fun m!742479 () Bool)

(assert (=> b!801305 m!742479))

(assert (=> b!801312 m!742467))

(assert (=> b!801312 m!742467))

(declare-fun m!742481 () Bool)

(assert (=> b!801312 m!742481))

(declare-fun m!742483 () Bool)

(assert (=> b!801308 m!742483))

(declare-fun m!742485 () Bool)

(assert (=> b!801309 m!742485))

(declare-fun m!742487 () Bool)

(assert (=> b!801303 m!742487))

(declare-fun m!742489 () Bool)

(assert (=> b!801303 m!742489))

(declare-fun m!742491 () Bool)

(assert (=> b!801303 m!742491))

(declare-fun m!742493 () Bool)

(assert (=> b!801303 m!742493))

(assert (=> b!801304 m!742467))

(assert (=> b!801304 m!742467))

(declare-fun m!742495 () Bool)

(assert (=> b!801304 m!742495))

(declare-fun m!742497 () Bool)

(assert (=> b!801311 m!742497))

(push 1)

