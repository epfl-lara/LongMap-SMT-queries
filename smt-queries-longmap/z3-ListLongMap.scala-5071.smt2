; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69104 () Bool)

(assert start!69104)

(declare-fun b!805068 () Bool)

(declare-fun e!446115 () Bool)

(assert (=> b!805068 (= e!446115 false)))

(declare-fun lt!360436 () Bool)

(declare-datatypes ((array!43726 0))(
  ( (array!43727 (arr!20938 (Array (_ BitVec 32) (_ BitVec 64))) (size!21358 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43726)

(declare-datatypes ((List!14808 0))(
  ( (Nil!14805) (Cons!14804 (h!15939 (_ BitVec 64)) (t!21115 List!14808)) )
))
(declare-fun arrayNoDuplicates!0 (array!43726 (_ BitVec 32) List!14808) Bool)

(assert (=> b!805068 (= lt!360436 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14805))))

(declare-fun b!805069 () Bool)

(declare-fun res!549044 () Bool)

(declare-fun e!446114 () Bool)

(assert (=> b!805069 (=> (not res!549044) (not e!446114))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805069 (= res!549044 (validKeyInArray!0 k0!2044))))

(declare-fun b!805070 () Bool)

(declare-fun res!549043 () Bool)

(assert (=> b!805070 (=> (not res!549043) (not e!446115))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43726 (_ BitVec 32)) Bool)

(assert (=> b!805070 (= res!549043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805071 () Bool)

(declare-fun res!549041 () Bool)

(assert (=> b!805071 (=> (not res!549041) (not e!446114))))

(declare-fun arrayContainsKey!0 (array!43726 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805071 (= res!549041 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805072 () Bool)

(declare-fun res!549039 () Bool)

(assert (=> b!805072 (=> (not res!549039) (not e!446114))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!805072 (= res!549039 (validKeyInArray!0 (select (arr!20938 a!3170) j!153)))))

(declare-fun res!549045 () Bool)

(assert (=> start!69104 (=> (not res!549045) (not e!446114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69104 (= res!549045 (validMask!0 mask!3266))))

(assert (=> start!69104 e!446114))

(assert (=> start!69104 true))

(declare-fun array_inv!16797 (array!43726) Bool)

(assert (=> start!69104 (array_inv!16797 a!3170)))

(declare-fun b!805073 () Bool)

(assert (=> b!805073 (= e!446114 e!446115)))

(declare-fun res!549040 () Bool)

(assert (=> b!805073 (=> (not res!549040) (not e!446115))))

(declare-datatypes ((SeekEntryResult!8485 0))(
  ( (MissingZero!8485 (index!36308 (_ BitVec 32))) (Found!8485 (index!36309 (_ BitVec 32))) (Intermediate!8485 (undefined!9297 Bool) (index!36310 (_ BitVec 32)) (x!67305 (_ BitVec 32))) (Undefined!8485) (MissingVacant!8485 (index!36311 (_ BitVec 32))) )
))
(declare-fun lt!360437 () SeekEntryResult!8485)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!805073 (= res!549040 (or (= lt!360437 (MissingZero!8485 i!1163)) (= lt!360437 (MissingVacant!8485 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43726 (_ BitVec 32)) SeekEntryResult!8485)

(assert (=> b!805073 (= lt!360437 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!805074 () Bool)

(declare-fun res!549042 () Bool)

(assert (=> b!805074 (=> (not res!549042) (not e!446114))))

(assert (=> b!805074 (= res!549042 (and (= (size!21358 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21358 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21358 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!69104 res!549045) b!805074))

(assert (= (and b!805074 res!549042) b!805072))

(assert (= (and b!805072 res!549039) b!805069))

(assert (= (and b!805069 res!549044) b!805071))

(assert (= (and b!805071 res!549041) b!805073))

(assert (= (and b!805073 res!549040) b!805070))

(assert (= (and b!805070 res!549043) b!805068))

(declare-fun m!747349 () Bool)

(assert (=> b!805068 m!747349))

(declare-fun m!747351 () Bool)

(assert (=> b!805070 m!747351))

(declare-fun m!747353 () Bool)

(assert (=> b!805071 m!747353))

(declare-fun m!747355 () Bool)

(assert (=> start!69104 m!747355))

(declare-fun m!747357 () Bool)

(assert (=> start!69104 m!747357))

(declare-fun m!747359 () Bool)

(assert (=> b!805073 m!747359))

(declare-fun m!747361 () Bool)

(assert (=> b!805072 m!747361))

(assert (=> b!805072 m!747361))

(declare-fun m!747363 () Bool)

(assert (=> b!805072 m!747363))

(declare-fun m!747365 () Bool)

(assert (=> b!805069 m!747365))

(check-sat (not b!805072) (not b!805070) (not start!69104) (not b!805073) (not b!805069) (not b!805071) (not b!805068))
(check-sat)
