; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68284 () Bool)

(assert start!68284)

(declare-fun b!793257 () Bool)

(declare-fun res!537779 () Bool)

(declare-fun e!440692 () Bool)

(assert (=> b!793257 (=> (not res!537779) (not e!440692))))

(declare-datatypes ((array!43074 0))(
  ( (array!43075 (arr!20617 (Array (_ BitVec 32) (_ BitVec 64))) (size!21038 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43074)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793257 (= res!537779 (validKeyInArray!0 (select (arr!20617 a!3170) j!153)))))

(declare-fun b!793258 () Bool)

(declare-fun res!537781 () Bool)

(declare-fun e!440691 () Bool)

(assert (=> b!793258 (=> (not res!537781) (not e!440691))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43074 (_ BitVec 32)) Bool)

(assert (=> b!793258 (= res!537781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793259 () Bool)

(declare-fun res!537780 () Bool)

(assert (=> b!793259 (=> (not res!537780) (not e!440692))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!793259 (= res!537780 (and (= (size!21038 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21038 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21038 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793260 () Bool)

(assert (=> b!793260 (= e!440691 false)))

(declare-fun lt!353678 () Bool)

(declare-datatypes ((List!14580 0))(
  ( (Nil!14577) (Cons!14576 (h!15705 (_ BitVec 64)) (t!20895 List!14580)) )
))
(declare-fun arrayNoDuplicates!0 (array!43074 (_ BitVec 32) List!14580) Bool)

(assert (=> b!793260 (= lt!353678 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14577))))

(declare-fun b!793261 () Bool)

(declare-fun res!537778 () Bool)

(assert (=> b!793261 (=> (not res!537778) (not e!440692))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!793261 (= res!537778 (validKeyInArray!0 k0!2044))))

(declare-fun res!537776 () Bool)

(assert (=> start!68284 (=> (not res!537776) (not e!440692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68284 (= res!537776 (validMask!0 mask!3266))))

(assert (=> start!68284 e!440692))

(assert (=> start!68284 true))

(declare-fun array_inv!16413 (array!43074) Bool)

(assert (=> start!68284 (array_inv!16413 a!3170)))

(declare-fun b!793262 () Bool)

(declare-fun res!537777 () Bool)

(assert (=> b!793262 (=> (not res!537777) (not e!440692))))

(declare-fun arrayContainsKey!0 (array!43074 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793262 (= res!537777 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793263 () Bool)

(assert (=> b!793263 (= e!440692 e!440691)))

(declare-fun res!537782 () Bool)

(assert (=> b!793263 (=> (not res!537782) (not e!440691))))

(declare-datatypes ((SeekEntryResult!8208 0))(
  ( (MissingZero!8208 (index!35200 (_ BitVec 32))) (Found!8208 (index!35201 (_ BitVec 32))) (Intermediate!8208 (undefined!9020 Bool) (index!35202 (_ BitVec 32)) (x!66142 (_ BitVec 32))) (Undefined!8208) (MissingVacant!8208 (index!35203 (_ BitVec 32))) )
))
(declare-fun lt!353677 () SeekEntryResult!8208)

(assert (=> b!793263 (= res!537782 (or (= lt!353677 (MissingZero!8208 i!1163)) (= lt!353677 (MissingVacant!8208 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43074 (_ BitVec 32)) SeekEntryResult!8208)

(assert (=> b!793263 (= lt!353677 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!68284 res!537776) b!793259))

(assert (= (and b!793259 res!537780) b!793257))

(assert (= (and b!793257 res!537779) b!793261))

(assert (= (and b!793261 res!537778) b!793262))

(assert (= (and b!793262 res!537777) b!793263))

(assert (= (and b!793263 res!537782) b!793258))

(assert (= (and b!793258 res!537781) b!793260))

(declare-fun m!733733 () Bool)

(assert (=> start!68284 m!733733))

(declare-fun m!733735 () Bool)

(assert (=> start!68284 m!733735))

(declare-fun m!733737 () Bool)

(assert (=> b!793258 m!733737))

(declare-fun m!733739 () Bool)

(assert (=> b!793260 m!733739))

(declare-fun m!733741 () Bool)

(assert (=> b!793261 m!733741))

(declare-fun m!733743 () Bool)

(assert (=> b!793257 m!733743))

(assert (=> b!793257 m!733743))

(declare-fun m!733745 () Bool)

(assert (=> b!793257 m!733745))

(declare-fun m!733747 () Bool)

(assert (=> b!793262 m!733747))

(declare-fun m!733749 () Bool)

(assert (=> b!793263 m!733749))

(check-sat (not b!793261) (not b!793262) (not b!793257) (not start!68284) (not b!793263) (not b!793260) (not b!793258))
(check-sat)
