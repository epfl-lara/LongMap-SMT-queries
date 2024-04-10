; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68938 () Bool)

(assert start!68938)

(declare-fun res!548725 () Bool)

(declare-fun e!445553 () Bool)

(assert (=> start!68938 (=> (not res!548725) (not e!445553))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68938 (= res!548725 (validMask!0 mask!3266))))

(assert (=> start!68938 e!445553))

(assert (=> start!68938 true))

(declare-datatypes ((array!43728 0))(
  ( (array!43729 (arr!20944 (Array (_ BitVec 32) (_ BitVec 64))) (size!21365 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43728)

(declare-fun array_inv!16740 (array!43728) Bool)

(assert (=> start!68938 (array_inv!16740 a!3170)))

(declare-fun b!804201 () Bool)

(declare-fun e!445552 () Bool)

(assert (=> b!804201 (= e!445552 false)))

(declare-fun lt!360086 () Bool)

(declare-datatypes ((List!14907 0))(
  ( (Nil!14904) (Cons!14903 (h!16032 (_ BitVec 64)) (t!21222 List!14907)) )
))
(declare-fun arrayNoDuplicates!0 (array!43728 (_ BitVec 32) List!14907) Bool)

(assert (=> b!804201 (= lt!360086 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14904))))

(declare-fun b!804202 () Bool)

(declare-fun res!548720 () Bool)

(assert (=> b!804202 (=> (not res!548720) (not e!445553))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!804202 (= res!548720 (and (= (size!21365 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21365 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21365 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804203 () Bool)

(declare-fun res!548726 () Bool)

(assert (=> b!804203 (=> (not res!548726) (not e!445553))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804203 (= res!548726 (validKeyInArray!0 (select (arr!20944 a!3170) j!153)))))

(declare-fun b!804204 () Bool)

(assert (=> b!804204 (= e!445553 e!445552)))

(declare-fun res!548723 () Bool)

(assert (=> b!804204 (=> (not res!548723) (not e!445552))))

(declare-datatypes ((SeekEntryResult!8535 0))(
  ( (MissingZero!8535 (index!36508 (_ BitVec 32))) (Found!8535 (index!36509 (_ BitVec 32))) (Intermediate!8535 (undefined!9347 Bool) (index!36510 (_ BitVec 32)) (x!67341 (_ BitVec 32))) (Undefined!8535) (MissingVacant!8535 (index!36511 (_ BitVec 32))) )
))
(declare-fun lt!360085 () SeekEntryResult!8535)

(assert (=> b!804204 (= res!548723 (or (= lt!360085 (MissingZero!8535 i!1163)) (= lt!360085 (MissingVacant!8535 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43728 (_ BitVec 32)) SeekEntryResult!8535)

(assert (=> b!804204 (= lt!360085 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!804205 () Bool)

(declare-fun res!548724 () Bool)

(assert (=> b!804205 (=> (not res!548724) (not e!445553))))

(assert (=> b!804205 (= res!548724 (validKeyInArray!0 k0!2044))))

(declare-fun b!804206 () Bool)

(declare-fun res!548721 () Bool)

(assert (=> b!804206 (=> (not res!548721) (not e!445552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43728 (_ BitVec 32)) Bool)

(assert (=> b!804206 (= res!548721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804207 () Bool)

(declare-fun res!548722 () Bool)

(assert (=> b!804207 (=> (not res!548722) (not e!445553))))

(declare-fun arrayContainsKey!0 (array!43728 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804207 (= res!548722 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68938 res!548725) b!804202))

(assert (= (and b!804202 res!548720) b!804203))

(assert (= (and b!804203 res!548726) b!804205))

(assert (= (and b!804205 res!548724) b!804207))

(assert (= (and b!804207 res!548722) b!804204))

(assert (= (and b!804204 res!548723) b!804206))

(assert (= (and b!804206 res!548721) b!804201))

(declare-fun m!746111 () Bool)

(assert (=> start!68938 m!746111))

(declare-fun m!746113 () Bool)

(assert (=> start!68938 m!746113))

(declare-fun m!746115 () Bool)

(assert (=> b!804206 m!746115))

(declare-fun m!746117 () Bool)

(assert (=> b!804203 m!746117))

(assert (=> b!804203 m!746117))

(declare-fun m!746119 () Bool)

(assert (=> b!804203 m!746119))

(declare-fun m!746121 () Bool)

(assert (=> b!804201 m!746121))

(declare-fun m!746123 () Bool)

(assert (=> b!804207 m!746123))

(declare-fun m!746125 () Bool)

(assert (=> b!804204 m!746125))

(declare-fun m!746127 () Bool)

(assert (=> b!804205 m!746127))

(check-sat (not b!804207) (not b!804205) (not start!68938) (not b!804204) (not b!804203) (not b!804206) (not b!804201))
(check-sat)
