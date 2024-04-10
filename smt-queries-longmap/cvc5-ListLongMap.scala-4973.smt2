; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68348 () Bool)

(assert start!68348)

(declare-fun b!794115 () Bool)

(declare-fun e!441002 () Bool)

(declare-fun e!441000 () Bool)

(assert (=> b!794115 (= e!441002 e!441000)))

(declare-fun res!538641 () Bool)

(assert (=> b!794115 (=> (not res!538641) (not e!441000))))

(declare-fun lt!353997 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((array!43138 0))(
  ( (array!43139 (arr!20649 (Array (_ BitVec 32) (_ BitVec 64))) (size!21070 (_ BitVec 32))) )
))
(declare-fun lt!353999 () array!43138)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8240 0))(
  ( (MissingZero!8240 (index!35328 (_ BitVec 32))) (Found!8240 (index!35329 (_ BitVec 32))) (Intermediate!8240 (undefined!9052 Bool) (index!35330 (_ BitVec 32)) (x!66262 (_ BitVec 32))) (Undefined!8240) (MissingVacant!8240 (index!35331 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43138 (_ BitVec 32)) SeekEntryResult!8240)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43138 (_ BitVec 32)) SeekEntryResult!8240)

(assert (=> b!794115 (= res!538641 (= (seekEntryOrOpen!0 lt!353997 lt!353999 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353997 lt!353999 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43138)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!794115 (= lt!353997 (select (store (arr!20649 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!794115 (= lt!353999 (array!43139 (store (arr!20649 a!3170) i!1163 k!2044) (size!21070 a!3170)))))

(declare-fun b!794116 () Bool)

(declare-fun e!440999 () Bool)

(assert (=> b!794116 (= e!440999 e!441002)))

(declare-fun res!538642 () Bool)

(assert (=> b!794116 (=> (not res!538642) (not e!441002))))

(declare-fun lt!353998 () SeekEntryResult!8240)

(assert (=> b!794116 (= res!538642 (or (= lt!353998 (MissingZero!8240 i!1163)) (= lt!353998 (MissingVacant!8240 i!1163))))))

(assert (=> b!794116 (= lt!353998 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!794117 () Bool)

(declare-fun res!538637 () Bool)

(assert (=> b!794117 (=> (not res!538637) (not e!440999))))

(declare-fun arrayContainsKey!0 (array!43138 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794117 (= res!538637 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794118 () Bool)

(declare-fun res!538635 () Bool)

(assert (=> b!794118 (=> (not res!538635) (not e!440999))))

(assert (=> b!794118 (= res!538635 (and (= (size!21070 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21070 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21070 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794119 () Bool)

(declare-fun res!538634 () Bool)

(assert (=> b!794119 (=> (not res!538634) (not e!441002))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43138 (_ BitVec 32)) Bool)

(assert (=> b!794119 (= res!538634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794120 () Bool)

(assert (=> b!794120 (= e!441000 (and (bvsge mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(declare-fun b!794121 () Bool)

(declare-fun res!538643 () Bool)

(assert (=> b!794121 (=> (not res!538643) (not e!441002))))

(declare-datatypes ((List!14612 0))(
  ( (Nil!14609) (Cons!14608 (h!15737 (_ BitVec 64)) (t!20927 List!14612)) )
))
(declare-fun arrayNoDuplicates!0 (array!43138 (_ BitVec 32) List!14612) Bool)

(assert (=> b!794121 (= res!538643 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14609))))

(declare-fun b!794122 () Bool)

(declare-fun res!538638 () Bool)

(assert (=> b!794122 (=> (not res!538638) (not e!440999))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794122 (= res!538638 (validKeyInArray!0 k!2044))))

(declare-fun b!794123 () Bool)

(declare-fun res!538636 () Bool)

(assert (=> b!794123 (=> (not res!538636) (not e!440999))))

(assert (=> b!794123 (= res!538636 (validKeyInArray!0 (select (arr!20649 a!3170) j!153)))))

(declare-fun res!538640 () Bool)

(assert (=> start!68348 (=> (not res!538640) (not e!440999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68348 (= res!538640 (validMask!0 mask!3266))))

(assert (=> start!68348 e!440999))

(assert (=> start!68348 true))

(declare-fun array_inv!16445 (array!43138) Bool)

(assert (=> start!68348 (array_inv!16445 a!3170)))

(declare-fun b!794124 () Bool)

(declare-fun res!538639 () Bool)

(assert (=> b!794124 (=> (not res!538639) (not e!441002))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!794124 (= res!538639 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21070 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20649 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21070 a!3170)) (= (select (arr!20649 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68348 res!538640) b!794118))

(assert (= (and b!794118 res!538635) b!794123))

(assert (= (and b!794123 res!538636) b!794122))

(assert (= (and b!794122 res!538638) b!794117))

(assert (= (and b!794117 res!538637) b!794116))

(assert (= (and b!794116 res!538642) b!794119))

(assert (= (and b!794119 res!538634) b!794121))

(assert (= (and b!794121 res!538643) b!794124))

(assert (= (and b!794124 res!538639) b!794115))

(assert (= (and b!794115 res!538641) b!794120))

(declare-fun m!734633 () Bool)

(assert (=> b!794119 m!734633))

(declare-fun m!734635 () Bool)

(assert (=> start!68348 m!734635))

(declare-fun m!734637 () Bool)

(assert (=> start!68348 m!734637))

(declare-fun m!734639 () Bool)

(assert (=> b!794122 m!734639))

(declare-fun m!734641 () Bool)

(assert (=> b!794121 m!734641))

(declare-fun m!734643 () Bool)

(assert (=> b!794117 m!734643))

(declare-fun m!734645 () Bool)

(assert (=> b!794116 m!734645))

(declare-fun m!734647 () Bool)

(assert (=> b!794123 m!734647))

(assert (=> b!794123 m!734647))

(declare-fun m!734649 () Bool)

(assert (=> b!794123 m!734649))

(declare-fun m!734651 () Bool)

(assert (=> b!794115 m!734651))

(declare-fun m!734653 () Bool)

(assert (=> b!794115 m!734653))

(declare-fun m!734655 () Bool)

(assert (=> b!794115 m!734655))

(declare-fun m!734657 () Bool)

(assert (=> b!794115 m!734657))

(declare-fun m!734659 () Bool)

(assert (=> b!794124 m!734659))

(declare-fun m!734661 () Bool)

(assert (=> b!794124 m!734661))

(push 1)

(assert (not b!794123))

(assert (not b!794117))

(assert (not b!794116))

(assert (not b!794122))

(assert (not b!794119))

(assert (not b!794115))

(assert (not b!794121))

(assert (not start!68348))

(check-sat)

(pop 1)

(push 1)

(check-sat)

