; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69098 () Bool)

(assert start!69098)

(declare-fun b!804998 () Bool)

(declare-fun e!446088 () Bool)

(declare-fun e!446089 () Bool)

(assert (=> b!804998 (= e!446088 e!446089)))

(declare-fun res!548976 () Bool)

(assert (=> b!804998 (=> (not res!548976) (not e!446089))))

(declare-datatypes ((SeekEntryResult!8482 0))(
  ( (MissingZero!8482 (index!36296 (_ BitVec 32))) (Found!8482 (index!36297 (_ BitVec 32))) (Intermediate!8482 (undefined!9294 Bool) (index!36298 (_ BitVec 32)) (x!67294 (_ BitVec 32))) (Undefined!8482) (MissingVacant!8482 (index!36299 (_ BitVec 32))) )
))
(declare-fun lt!360425 () SeekEntryResult!8482)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804998 (= res!548976 (or (= lt!360425 (MissingZero!8482 i!1163)) (= lt!360425 (MissingVacant!8482 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43720 0))(
  ( (array!43721 (arr!20935 (Array (_ BitVec 32) (_ BitVec 64))) (size!21355 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43720)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43720 (_ BitVec 32)) SeekEntryResult!8482)

(assert (=> b!804998 (= lt!360425 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!804999 () Bool)

(declare-fun res!548974 () Bool)

(assert (=> b!804999 (=> (not res!548974) (not e!446088))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804999 (= res!548974 (validKeyInArray!0 (select (arr!20935 a!3170) j!153)))))

(declare-fun res!548975 () Bool)

(assert (=> start!69098 (=> (not res!548975) (not e!446088))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69098 (= res!548975 (validMask!0 mask!3266))))

(assert (=> start!69098 e!446088))

(assert (=> start!69098 true))

(declare-fun array_inv!16794 (array!43720) Bool)

(assert (=> start!69098 (array_inv!16794 a!3170)))

(declare-fun b!805000 () Bool)

(declare-fun res!548971 () Bool)

(assert (=> b!805000 (=> (not res!548971) (not e!446089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43720 (_ BitVec 32)) Bool)

(assert (=> b!805000 (= res!548971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805001 () Bool)

(declare-fun res!548969 () Bool)

(assert (=> b!805001 (=> (not res!548969) (not e!446088))))

(assert (=> b!805001 (= res!548969 (validKeyInArray!0 k0!2044))))

(declare-fun b!805002 () Bool)

(declare-fun res!548970 () Bool)

(assert (=> b!805002 (=> (not res!548970) (not e!446088))))

(declare-fun arrayContainsKey!0 (array!43720 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805002 (= res!548970 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun b!805003 () Bool)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!805003 (= e!446089 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21355 a!3170)) (= vacantBefore!23 i!1163) (or (bvslt vacantBefore!23 #b00000000000000000000000000000000) (bvsge vacantBefore!23 (size!21355 a!3170)))))))

(declare-fun b!805004 () Bool)

(declare-fun res!548972 () Bool)

(assert (=> b!805004 (=> (not res!548972) (not e!446088))))

(assert (=> b!805004 (= res!548972 (and (= (size!21355 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21355 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21355 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805005 () Bool)

(declare-fun res!548973 () Bool)

(assert (=> b!805005 (=> (not res!548973) (not e!446089))))

(declare-datatypes ((List!14805 0))(
  ( (Nil!14802) (Cons!14801 (h!15936 (_ BitVec 64)) (t!21112 List!14805)) )
))
(declare-fun arrayNoDuplicates!0 (array!43720 (_ BitVec 32) List!14805) Bool)

(assert (=> b!805005 (= res!548973 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14802))))

(assert (= (and start!69098 res!548975) b!805004))

(assert (= (and b!805004 res!548972) b!804999))

(assert (= (and b!804999 res!548974) b!805001))

(assert (= (and b!805001 res!548969) b!805002))

(assert (= (and b!805002 res!548970) b!804998))

(assert (= (and b!804998 res!548976) b!805000))

(assert (= (and b!805000 res!548971) b!805005))

(assert (= (and b!805005 res!548973) b!805003))

(declare-fun m!747295 () Bool)

(assert (=> b!805002 m!747295))

(declare-fun m!747297 () Bool)

(assert (=> b!805005 m!747297))

(declare-fun m!747299 () Bool)

(assert (=> b!804998 m!747299))

(declare-fun m!747301 () Bool)

(assert (=> b!804999 m!747301))

(assert (=> b!804999 m!747301))

(declare-fun m!747303 () Bool)

(assert (=> b!804999 m!747303))

(declare-fun m!747305 () Bool)

(assert (=> start!69098 m!747305))

(declare-fun m!747307 () Bool)

(assert (=> start!69098 m!747307))

(declare-fun m!747309 () Bool)

(assert (=> b!805000 m!747309))

(declare-fun m!747311 () Bool)

(assert (=> b!805001 m!747311))

(check-sat (not b!805000) (not b!805001) (not b!804998) (not b!804999) (not b!805005) (not b!805002) (not start!69098))
(check-sat)
