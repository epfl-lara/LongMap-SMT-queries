; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68244 () Bool)

(assert start!68244)

(declare-fun res!537319 () Bool)

(declare-fun e!440513 () Bool)

(assert (=> start!68244 (=> (not res!537319) (not e!440513))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68244 (= res!537319 (validMask!0 mask!3266))))

(assert (=> start!68244 e!440513))

(assert (=> start!68244 true))

(declare-datatypes ((array!43034 0))(
  ( (array!43035 (arr!20597 (Array (_ BitVec 32) (_ BitVec 64))) (size!21018 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43034)

(declare-fun array_inv!16393 (array!43034) Bool)

(assert (=> start!68244 (array_inv!16393 a!3170)))

(declare-fun b!792800 () Bool)

(declare-fun res!537322 () Bool)

(assert (=> b!792800 (=> (not res!537322) (not e!440513))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792800 (= res!537322 (validKeyInArray!0 k!2044))))

(declare-fun b!792801 () Bool)

(declare-fun res!537323 () Bool)

(declare-fun e!440511 () Bool)

(assert (=> b!792801 (=> (not res!537323) (not e!440511))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43034 (_ BitVec 32)) Bool)

(assert (=> b!792801 (= res!537323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792802 () Bool)

(declare-fun res!537320 () Bool)

(assert (=> b!792802 (=> (not res!537320) (not e!440511))))

(declare-datatypes ((List!14560 0))(
  ( (Nil!14557) (Cons!14556 (h!15685 (_ BitVec 64)) (t!20875 List!14560)) )
))
(declare-fun arrayNoDuplicates!0 (array!43034 (_ BitVec 32) List!14560) Bool)

(assert (=> b!792802 (= res!537320 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14557))))

(declare-fun b!792803 () Bool)

(assert (=> b!792803 (= e!440513 e!440511)))

(declare-fun res!537325 () Bool)

(assert (=> b!792803 (=> (not res!537325) (not e!440511))))

(declare-datatypes ((SeekEntryResult!8188 0))(
  ( (MissingZero!8188 (index!35120 (_ BitVec 32))) (Found!8188 (index!35121 (_ BitVec 32))) (Intermediate!8188 (undefined!9000 Bool) (index!35122 (_ BitVec 32)) (x!66066 (_ BitVec 32))) (Undefined!8188) (MissingVacant!8188 (index!35123 (_ BitVec 32))) )
))
(declare-fun lt!353585 () SeekEntryResult!8188)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792803 (= res!537325 (or (= lt!353585 (MissingZero!8188 i!1163)) (= lt!353585 (MissingVacant!8188 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43034 (_ BitVec 32)) SeekEntryResult!8188)

(assert (=> b!792803 (= lt!353585 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!792804 () Bool)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!792804 (= e!440511 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21018 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20597 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21018 a!3170)) (= (select (arr!20597 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvslt mask!3266 #b00000000000000000000000000000000)))))

(declare-fun b!792805 () Bool)

(declare-fun res!537321 () Bool)

(assert (=> b!792805 (=> (not res!537321) (not e!440513))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792805 (= res!537321 (validKeyInArray!0 (select (arr!20597 a!3170) j!153)))))

(declare-fun b!792806 () Bool)

(declare-fun res!537326 () Bool)

(assert (=> b!792806 (=> (not res!537326) (not e!440513))))

(assert (=> b!792806 (= res!537326 (and (= (size!21018 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21018 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21018 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792807 () Bool)

(declare-fun res!537324 () Bool)

(assert (=> b!792807 (=> (not res!537324) (not e!440513))))

(declare-fun arrayContainsKey!0 (array!43034 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792807 (= res!537324 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68244 res!537319) b!792806))

(assert (= (and b!792806 res!537326) b!792805))

(assert (= (and b!792805 res!537321) b!792800))

(assert (= (and b!792800 res!537322) b!792807))

(assert (= (and b!792807 res!537324) b!792803))

(assert (= (and b!792803 res!537325) b!792801))

(assert (= (and b!792801 res!537323) b!792802))

(assert (= (and b!792802 res!537320) b!792804))

(declare-fun m!733315 () Bool)

(assert (=> b!792807 m!733315))

(declare-fun m!733317 () Bool)

(assert (=> start!68244 m!733317))

(declare-fun m!733319 () Bool)

(assert (=> start!68244 m!733319))

(declare-fun m!733321 () Bool)

(assert (=> b!792805 m!733321))

(assert (=> b!792805 m!733321))

(declare-fun m!733323 () Bool)

(assert (=> b!792805 m!733323))

(declare-fun m!733325 () Bool)

(assert (=> b!792804 m!733325))

(declare-fun m!733327 () Bool)

(assert (=> b!792804 m!733327))

(declare-fun m!733329 () Bool)

(assert (=> b!792800 m!733329))

(declare-fun m!733331 () Bool)

(assert (=> b!792803 m!733331))

(declare-fun m!733333 () Bool)

(assert (=> b!792802 m!733333))

(declare-fun m!733335 () Bool)

(assert (=> b!792801 m!733335))

(push 1)

(assert (not b!792802))

(assert (not b!792800))

(assert (not start!68244))

(assert (not b!792803))

(assert (not b!792807))

(assert (not b!792805))

(assert (not b!792801))

(check-sat)

