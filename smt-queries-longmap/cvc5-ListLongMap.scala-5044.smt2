; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68774 () Bool)

(assert start!68774)

(declare-fun b!801420 () Bool)

(declare-fun res!545944 () Bool)

(declare-fun e!444244 () Bool)

(assert (=> b!801420 (=> (not res!545944) (not e!444244))))

(declare-datatypes ((array!43564 0))(
  ( (array!43565 (arr!20862 (Array (_ BitVec 32) (_ BitVec 64))) (size!21283 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43564)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801420 (= res!545944 (validKeyInArray!0 (select (arr!20862 a!3170) j!153)))))

(declare-fun b!801421 () Bool)

(declare-fun res!545940 () Bool)

(assert (=> b!801421 (=> (not res!545940) (not e!444244))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!801421 (= res!545940 (and (= (size!21283 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21283 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21283 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801422 () Bool)

(declare-fun e!444247 () Bool)

(declare-fun e!444243 () Bool)

(assert (=> b!801422 (= e!444247 e!444243)))

(declare-fun res!545943 () Bool)

(assert (=> b!801422 (=> (not res!545943) (not e!444243))))

(declare-datatypes ((SeekEntryResult!8453 0))(
  ( (MissingZero!8453 (index!36180 (_ BitVec 32))) (Found!8453 (index!36181 (_ BitVec 32))) (Intermediate!8453 (undefined!9265 Bool) (index!36182 (_ BitVec 32)) (x!67043 (_ BitVec 32))) (Undefined!8453) (MissingVacant!8453 (index!36183 (_ BitVec 32))) )
))
(declare-fun lt!358211 () SeekEntryResult!8453)

(declare-fun lt!358217 () array!43564)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!358213 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43564 (_ BitVec 32)) SeekEntryResult!8453)

(assert (=> b!801422 (= res!545943 (= lt!358211 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358213 lt!358217 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43564 (_ BitVec 32)) SeekEntryResult!8453)

(assert (=> b!801422 (= lt!358211 (seekEntryOrOpen!0 lt!358213 lt!358217 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!801422 (= lt!358213 (select (store (arr!20862 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!801422 (= lt!358217 (array!43565 (store (arr!20862 a!3170) i!1163 k!2044) (size!21283 a!3170)))))

(declare-fun b!801423 () Bool)

(assert (=> b!801423 (= e!444244 e!444247)))

(declare-fun res!545950 () Bool)

(assert (=> b!801423 (=> (not res!545950) (not e!444247))))

(declare-fun lt!358210 () SeekEntryResult!8453)

(assert (=> b!801423 (= res!545950 (or (= lt!358210 (MissingZero!8453 i!1163)) (= lt!358210 (MissingVacant!8453 i!1163))))))

(assert (=> b!801423 (= lt!358210 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!801424 () Bool)

(declare-fun res!545947 () Bool)

(declare-fun e!444245 () Bool)

(assert (=> b!801424 (=> (not res!545947) (not e!444245))))

(declare-fun lt!358216 () (_ BitVec 32))

(assert (=> b!801424 (= res!545947 (= lt!358211 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358216 vacantAfter!23 lt!358213 lt!358217 mask!3266)))))

(declare-fun res!545951 () Bool)

(assert (=> start!68774 (=> (not res!545951) (not e!444244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68774 (= res!545951 (validMask!0 mask!3266))))

(assert (=> start!68774 e!444244))

(assert (=> start!68774 true))

(declare-fun array_inv!16658 (array!43564) Bool)

(assert (=> start!68774 (array_inv!16658 a!3170)))

(declare-fun b!801425 () Bool)

(assert (=> b!801425 (= e!444245 false)))

(declare-fun lt!358215 () SeekEntryResult!8453)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!801425 (= lt!358215 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358216 vacantBefore!23 (select (arr!20862 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801426 () Bool)

(declare-fun e!444246 () Bool)

(assert (=> b!801426 (= e!444246 e!444245)))

(declare-fun res!545948 () Bool)

(assert (=> b!801426 (=> (not res!545948) (not e!444245))))

(assert (=> b!801426 (= res!545948 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!358216 #b00000000000000000000000000000000) (bvslt lt!358216 (size!21283 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801426 (= lt!358216 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801427 () Bool)

(declare-fun res!545939 () Bool)

(assert (=> b!801427 (=> (not res!545939) (not e!444247))))

(declare-datatypes ((List!14825 0))(
  ( (Nil!14822) (Cons!14821 (h!15950 (_ BitVec 64)) (t!21140 List!14825)) )
))
(declare-fun arrayNoDuplicates!0 (array!43564 (_ BitVec 32) List!14825) Bool)

(assert (=> b!801427 (= res!545939 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14822))))

(declare-fun b!801428 () Bool)

(declare-fun res!545945 () Bool)

(assert (=> b!801428 (=> (not res!545945) (not e!444244))))

(assert (=> b!801428 (= res!545945 (validKeyInArray!0 k!2044))))

(declare-fun b!801429 () Bool)

(assert (=> b!801429 (= e!444243 e!444246)))

(declare-fun res!545941 () Bool)

(assert (=> b!801429 (=> (not res!545941) (not e!444246))))

(declare-fun lt!358214 () SeekEntryResult!8453)

(declare-fun lt!358212 () SeekEntryResult!8453)

(assert (=> b!801429 (= res!545941 (and (= lt!358212 lt!358214) (= lt!358214 (Found!8453 j!153)) (not (= (select (arr!20862 a!3170) index!1236) (select (arr!20862 a!3170) j!153)))))))

(assert (=> b!801429 (= lt!358214 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20862 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801429 (= lt!358212 (seekEntryOrOpen!0 (select (arr!20862 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801430 () Bool)

(declare-fun res!545949 () Bool)

(assert (=> b!801430 (=> (not res!545949) (not e!444247))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43564 (_ BitVec 32)) Bool)

(assert (=> b!801430 (= res!545949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801431 () Bool)

(declare-fun res!545942 () Bool)

(assert (=> b!801431 (=> (not res!545942) (not e!444247))))

(assert (=> b!801431 (= res!545942 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21283 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20862 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21283 a!3170)) (= (select (arr!20862 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801432 () Bool)

(declare-fun res!545946 () Bool)

(assert (=> b!801432 (=> (not res!545946) (not e!444244))))

(declare-fun arrayContainsKey!0 (array!43564 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801432 (= res!545946 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68774 res!545951) b!801421))

(assert (= (and b!801421 res!545940) b!801420))

(assert (= (and b!801420 res!545944) b!801428))

(assert (= (and b!801428 res!545945) b!801432))

(assert (= (and b!801432 res!545946) b!801423))

(assert (= (and b!801423 res!545950) b!801430))

(assert (= (and b!801430 res!545949) b!801427))

(assert (= (and b!801427 res!545939) b!801431))

(assert (= (and b!801431 res!545942) b!801422))

(assert (= (and b!801422 res!545943) b!801429))

(assert (= (and b!801429 res!545941) b!801426))

(assert (= (and b!801426 res!545948) b!801424))

(assert (= (and b!801424 res!545947) b!801425))

(declare-fun m!742583 () Bool)

(assert (=> b!801425 m!742583))

(assert (=> b!801425 m!742583))

(declare-fun m!742585 () Bool)

(assert (=> b!801425 m!742585))

(declare-fun m!742587 () Bool)

(assert (=> b!801422 m!742587))

(declare-fun m!742589 () Bool)

(assert (=> b!801422 m!742589))

(declare-fun m!742591 () Bool)

(assert (=> b!801422 m!742591))

(declare-fun m!742593 () Bool)

(assert (=> b!801422 m!742593))

(declare-fun m!742595 () Bool)

(assert (=> b!801429 m!742595))

(assert (=> b!801429 m!742583))

(assert (=> b!801429 m!742583))

(declare-fun m!742597 () Bool)

(assert (=> b!801429 m!742597))

(assert (=> b!801429 m!742583))

(declare-fun m!742599 () Bool)

(assert (=> b!801429 m!742599))

(declare-fun m!742601 () Bool)

(assert (=> b!801423 m!742601))

(declare-fun m!742603 () Bool)

(assert (=> b!801431 m!742603))

(declare-fun m!742605 () Bool)

(assert (=> b!801431 m!742605))

(declare-fun m!742607 () Bool)

(assert (=> b!801430 m!742607))

(declare-fun m!742609 () Bool)

(assert (=> start!68774 m!742609))

(declare-fun m!742611 () Bool)

(assert (=> start!68774 m!742611))

(assert (=> b!801420 m!742583))

(assert (=> b!801420 m!742583))

(declare-fun m!742613 () Bool)

(assert (=> b!801420 m!742613))

(declare-fun m!742615 () Bool)

(assert (=> b!801424 m!742615))

(declare-fun m!742617 () Bool)

(assert (=> b!801432 m!742617))

(declare-fun m!742619 () Bool)

(assert (=> b!801427 m!742619))

(declare-fun m!742621 () Bool)

(assert (=> b!801428 m!742621))

(declare-fun m!742623 () Bool)

(assert (=> b!801426 m!742623))

(push 1)

(assert (not start!68774))

(assert (not b!801430))

(assert (not b!801424))

(assert (not b!801425))

(assert (not b!801432))

(assert (not b!801420))

(assert (not b!801422))

(assert (not b!801429))

(assert (not b!801428))

(assert (not b!801423))

(assert (not b!801426))

