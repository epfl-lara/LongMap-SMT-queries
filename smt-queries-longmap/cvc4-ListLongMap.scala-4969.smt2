; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68306 () Bool)

(assert start!68306)

(declare-fun res!538222 () Bool)

(declare-fun e!440736 () Bool)

(assert (=> start!68306 (=> (not res!538222) (not e!440736))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68306 (= res!538222 (validMask!0 mask!3266))))

(assert (=> start!68306 e!440736))

(assert (=> start!68306 true))

(declare-datatypes ((array!43113 0))(
  ( (array!43114 (arr!20637 (Array (_ BitVec 32) (_ BitVec 64))) (size!21058 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43113)

(declare-fun array_inv!16520 (array!43113) Bool)

(assert (=> start!68306 (array_inv!16520 a!3170)))

(declare-fun b!793557 () Bool)

(declare-fun e!440735 () Bool)

(assert (=> b!793557 (= e!440735 false)))

(declare-datatypes ((SeekEntryResult!8225 0))(
  ( (MissingZero!8225 (index!35268 (_ BitVec 32))) (Found!8225 (index!35269 (_ BitVec 32))) (Intermediate!8225 (undefined!9037 Bool) (index!35270 (_ BitVec 32)) (x!66210 (_ BitVec 32))) (Undefined!8225) (MissingVacant!8225 (index!35271 (_ BitVec 32))) )
))
(declare-fun lt!353614 () SeekEntryResult!8225)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!353617 () (_ BitVec 64))

(declare-fun lt!353618 () array!43113)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43113 (_ BitVec 32)) SeekEntryResult!8225)

(assert (=> b!793557 (= lt!353614 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353617 lt!353618 mask!3266))))

(declare-fun lt!353615 () SeekEntryResult!8225)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43113 (_ BitVec 32)) SeekEntryResult!8225)

(assert (=> b!793557 (= lt!353615 (seekEntryOrOpen!0 lt!353617 lt!353618 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793557 (= lt!353617 (select (store (arr!20637 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!793557 (= lt!353618 (array!43114 (store (arr!20637 a!3170) i!1163 k!2044) (size!21058 a!3170)))))

(declare-fun b!793558 () Bool)

(declare-fun res!538224 () Bool)

(assert (=> b!793558 (=> (not res!538224) (not e!440736))))

(assert (=> b!793558 (= res!538224 (and (= (size!21058 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21058 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21058 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793559 () Bool)

(assert (=> b!793559 (= e!440736 e!440735)))

(declare-fun res!538219 () Bool)

(assert (=> b!793559 (=> (not res!538219) (not e!440735))))

(declare-fun lt!353616 () SeekEntryResult!8225)

(assert (=> b!793559 (= res!538219 (or (= lt!353616 (MissingZero!8225 i!1163)) (= lt!353616 (MissingVacant!8225 i!1163))))))

(assert (=> b!793559 (= lt!353616 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!793560 () Bool)

(declare-fun res!538218 () Bool)

(assert (=> b!793560 (=> (not res!538218) (not e!440736))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793560 (= res!538218 (validKeyInArray!0 k!2044))))

(declare-fun b!793561 () Bool)

(declare-fun res!538217 () Bool)

(assert (=> b!793561 (=> (not res!538217) (not e!440735))))

(declare-datatypes ((List!14639 0))(
  ( (Nil!14636) (Cons!14635 (h!15764 (_ BitVec 64)) (t!20945 List!14639)) )
))
(declare-fun arrayNoDuplicates!0 (array!43113 (_ BitVec 32) List!14639) Bool)

(assert (=> b!793561 (= res!538217 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14636))))

(declare-fun b!793562 () Bool)

(declare-fun res!538221 () Bool)

(assert (=> b!793562 (=> (not res!538221) (not e!440736))))

(declare-fun arrayContainsKey!0 (array!43113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793562 (= res!538221 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793563 () Bool)

(declare-fun res!538223 () Bool)

(assert (=> b!793563 (=> (not res!538223) (not e!440735))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!793563 (= res!538223 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21058 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20637 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21058 a!3170)) (= (select (arr!20637 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!793564 () Bool)

(declare-fun res!538216 () Bool)

(assert (=> b!793564 (=> (not res!538216) (not e!440735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43113 (_ BitVec 32)) Bool)

(assert (=> b!793564 (= res!538216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793565 () Bool)

(declare-fun res!538220 () Bool)

(assert (=> b!793565 (=> (not res!538220) (not e!440736))))

(assert (=> b!793565 (= res!538220 (validKeyInArray!0 (select (arr!20637 a!3170) j!153)))))

(assert (= (and start!68306 res!538222) b!793558))

(assert (= (and b!793558 res!538224) b!793565))

(assert (= (and b!793565 res!538220) b!793560))

(assert (= (and b!793560 res!538218) b!793562))

(assert (= (and b!793562 res!538221) b!793559))

(assert (= (and b!793559 res!538219) b!793564))

(assert (= (and b!793564 res!538216) b!793561))

(assert (= (and b!793561 res!538217) b!793563))

(assert (= (and b!793563 res!538223) b!793557))

(declare-fun m!733561 () Bool)

(assert (=> start!68306 m!733561))

(declare-fun m!733563 () Bool)

(assert (=> start!68306 m!733563))

(declare-fun m!733565 () Bool)

(assert (=> b!793562 m!733565))

(declare-fun m!733567 () Bool)

(assert (=> b!793563 m!733567))

(declare-fun m!733569 () Bool)

(assert (=> b!793563 m!733569))

(declare-fun m!733571 () Bool)

(assert (=> b!793564 m!733571))

(declare-fun m!733573 () Bool)

(assert (=> b!793565 m!733573))

(assert (=> b!793565 m!733573))

(declare-fun m!733575 () Bool)

(assert (=> b!793565 m!733575))

(declare-fun m!733577 () Bool)

(assert (=> b!793561 m!733577))

(declare-fun m!733579 () Bool)

(assert (=> b!793560 m!733579))

(declare-fun m!733581 () Bool)

(assert (=> b!793557 m!733581))

(declare-fun m!733583 () Bool)

(assert (=> b!793557 m!733583))

(declare-fun m!733585 () Bool)

(assert (=> b!793557 m!733585))

(declare-fun m!733587 () Bool)

(assert (=> b!793557 m!733587))

(declare-fun m!733589 () Bool)

(assert (=> b!793559 m!733589))

(push 1)

(assert (not b!793561))

(assert (not b!793560))

(assert (not b!793559))

(assert (not b!793565))

(assert (not b!793557))

(assert (not start!68306))

(assert (not b!793564))

(assert (not b!793562))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

