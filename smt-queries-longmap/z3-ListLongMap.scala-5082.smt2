; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68982 () Bool)

(assert start!68982)

(declare-fun b!804719 () Bool)

(declare-fun res!549382 () Bool)

(declare-fun e!445705 () Bool)

(assert (=> b!804719 (=> (not res!549382) (not e!445705))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43789 0))(
  ( (array!43790 (arr!20975 (Array (_ BitVec 32) (_ BitVec 64))) (size!21396 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43789)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!804719 (= res!549382 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21396 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20975 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21396 a!3170)) (= (select (arr!20975 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!804720 () Bool)

(declare-fun res!549381 () Bool)

(declare-fun e!445706 () Bool)

(assert (=> b!804720 (=> (not res!549381) (not e!445706))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!804720 (= res!549381 (and (= (size!21396 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21396 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21396 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804721 () Bool)

(declare-fun res!549384 () Bool)

(assert (=> b!804721 (=> (not res!549384) (not e!445705))))

(declare-datatypes ((List!14977 0))(
  ( (Nil!14974) (Cons!14973 (h!16102 (_ BitVec 64)) (t!21283 List!14977)) )
))
(declare-fun arrayNoDuplicates!0 (array!43789 (_ BitVec 32) List!14977) Bool)

(assert (=> b!804721 (= res!549384 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14974))))

(declare-fun res!549385 () Bool)

(assert (=> start!68982 (=> (not res!549385) (not e!445706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68982 (= res!549385 (validMask!0 mask!3266))))

(assert (=> start!68982 e!445706))

(assert (=> start!68982 true))

(declare-fun array_inv!16858 (array!43789) Bool)

(assert (=> start!68982 (array_inv!16858 a!3170)))

(declare-fun b!804722 () Bool)

(declare-fun res!549380 () Bool)

(assert (=> b!804722 (=> (not res!549380) (not e!445706))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804722 (= res!549380 (validKeyInArray!0 (select (arr!20975 a!3170) j!153)))))

(declare-fun b!804723 () Bool)

(declare-fun res!549387 () Bool)

(assert (=> b!804723 (=> (not res!549387) (not e!445706))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!804723 (= res!549387 (validKeyInArray!0 k0!2044))))

(declare-fun b!804724 () Bool)

(declare-fun e!445708 () Bool)

(assert (=> b!804724 (= e!445708 false)))

(declare-datatypes ((SeekEntryResult!8563 0))(
  ( (MissingZero!8563 (index!36620 (_ BitVec 32))) (Found!8563 (index!36621 (_ BitVec 32))) (Intermediate!8563 (undefined!9375 Bool) (index!36622 (_ BitVec 32)) (x!67452 (_ BitVec 32))) (Undefined!8563) (MissingVacant!8563 (index!36623 (_ BitVec 32))) )
))
(declare-fun lt!360153 () SeekEntryResult!8563)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43789 (_ BitVec 32)) SeekEntryResult!8563)

(assert (=> b!804724 (= lt!360153 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20975 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360155 () SeekEntryResult!8563)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43789 (_ BitVec 32)) SeekEntryResult!8563)

(assert (=> b!804724 (= lt!360155 (seekEntryOrOpen!0 (select (arr!20975 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!804725 () Bool)

(declare-fun res!549378 () Bool)

(assert (=> b!804725 (=> (not res!549378) (not e!445705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43789 (_ BitVec 32)) Bool)

(assert (=> b!804725 (= res!549378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804726 () Bool)

(assert (=> b!804726 (= e!445706 e!445705)))

(declare-fun res!549379 () Bool)

(assert (=> b!804726 (=> (not res!549379) (not e!445705))))

(declare-fun lt!360154 () SeekEntryResult!8563)

(assert (=> b!804726 (= res!549379 (or (= lt!360154 (MissingZero!8563 i!1163)) (= lt!360154 (MissingVacant!8563 i!1163))))))

(assert (=> b!804726 (= lt!360154 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!804727 () Bool)

(declare-fun res!549383 () Bool)

(assert (=> b!804727 (=> (not res!549383) (not e!445706))))

(declare-fun arrayContainsKey!0 (array!43789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804727 (= res!549383 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804728 () Bool)

(assert (=> b!804728 (= e!445705 e!445708)))

(declare-fun res!549386 () Bool)

(assert (=> b!804728 (=> (not res!549386) (not e!445708))))

(declare-fun lt!360152 () (_ BitVec 64))

(declare-fun lt!360151 () array!43789)

(assert (=> b!804728 (= res!549386 (= (seekEntryOrOpen!0 lt!360152 lt!360151 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360152 lt!360151 mask!3266)))))

(assert (=> b!804728 (= lt!360152 (select (store (arr!20975 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!804728 (= lt!360151 (array!43790 (store (arr!20975 a!3170) i!1163 k0!2044) (size!21396 a!3170)))))

(assert (= (and start!68982 res!549385) b!804720))

(assert (= (and b!804720 res!549381) b!804722))

(assert (= (and b!804722 res!549380) b!804723))

(assert (= (and b!804723 res!549387) b!804727))

(assert (= (and b!804727 res!549383) b!804726))

(assert (= (and b!804726 res!549379) b!804725))

(assert (= (and b!804725 res!549378) b!804721))

(assert (= (and b!804721 res!549384) b!804719))

(assert (= (and b!804719 res!549382) b!804728))

(assert (= (and b!804728 res!549386) b!804724))

(declare-fun m!746113 () Bool)

(assert (=> b!804726 m!746113))

(declare-fun m!746115 () Bool)

(assert (=> start!68982 m!746115))

(declare-fun m!746117 () Bool)

(assert (=> start!68982 m!746117))

(declare-fun m!746119 () Bool)

(assert (=> b!804724 m!746119))

(assert (=> b!804724 m!746119))

(declare-fun m!746121 () Bool)

(assert (=> b!804724 m!746121))

(assert (=> b!804724 m!746119))

(declare-fun m!746123 () Bool)

(assert (=> b!804724 m!746123))

(declare-fun m!746125 () Bool)

(assert (=> b!804727 m!746125))

(declare-fun m!746127 () Bool)

(assert (=> b!804719 m!746127))

(declare-fun m!746129 () Bool)

(assert (=> b!804719 m!746129))

(declare-fun m!746131 () Bool)

(assert (=> b!804728 m!746131))

(declare-fun m!746133 () Bool)

(assert (=> b!804728 m!746133))

(declare-fun m!746135 () Bool)

(assert (=> b!804728 m!746135))

(declare-fun m!746137 () Bool)

(assert (=> b!804728 m!746137))

(assert (=> b!804722 m!746119))

(assert (=> b!804722 m!746119))

(declare-fun m!746139 () Bool)

(assert (=> b!804722 m!746139))

(declare-fun m!746141 () Bool)

(assert (=> b!804721 m!746141))

(declare-fun m!746143 () Bool)

(assert (=> b!804723 m!746143))

(declare-fun m!746145 () Bool)

(assert (=> b!804725 m!746145))

(check-sat (not b!804722) (not b!804723) (not start!68982) (not b!804726) (not b!804724) (not b!804727) (not b!804721) (not b!804725) (not b!804728))
(check-sat)
