; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69016 () Bool)

(assert start!69016)

(declare-fun b!805179 () Bool)

(declare-fun e!445945 () Bool)

(declare-fun e!445944 () Bool)

(assert (=> b!805179 (= e!445945 e!445944)))

(declare-fun res!549701 () Bool)

(assert (=> b!805179 (=> (not res!549701) (not e!445944))))

(declare-datatypes ((SeekEntryResult!8574 0))(
  ( (MissingZero!8574 (index!36664 (_ BitVec 32))) (Found!8574 (index!36665 (_ BitVec 32))) (Intermediate!8574 (undefined!9386 Bool) (index!36666 (_ BitVec 32)) (x!67484 (_ BitVec 32))) (Undefined!8574) (MissingVacant!8574 (index!36667 (_ BitVec 32))) )
))
(declare-fun lt!360500 () SeekEntryResult!8574)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!805179 (= res!549701 (or (= lt!360500 (MissingZero!8574 i!1163)) (= lt!360500 (MissingVacant!8574 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43806 0))(
  ( (array!43807 (arr!20983 (Array (_ BitVec 32) (_ BitVec 64))) (size!21404 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43806)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43806 (_ BitVec 32)) SeekEntryResult!8574)

(assert (=> b!805179 (= lt!360500 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!805180 () Bool)

(declare-fun e!445946 () Bool)

(assert (=> b!805180 (= e!445946 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!360499 () SeekEntryResult!8574)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43806 (_ BitVec 32)) SeekEntryResult!8574)

(assert (=> b!805180 (= lt!360499 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20983 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360497 () SeekEntryResult!8574)

(assert (=> b!805180 (= lt!360497 (seekEntryOrOpen!0 (select (arr!20983 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805181 () Bool)

(declare-fun res!549706 () Bool)

(assert (=> b!805181 (=> (not res!549706) (not e!445944))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!805181 (= res!549706 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21404 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20983 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21404 a!3170)) (= (select (arr!20983 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805182 () Bool)

(declare-fun res!549702 () Bool)

(assert (=> b!805182 (=> (not res!549702) (not e!445945))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805182 (= res!549702 (validKeyInArray!0 k0!2044))))

(declare-fun b!805183 () Bool)

(declare-fun res!549698 () Bool)

(assert (=> b!805183 (=> (not res!549698) (not e!445944))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43806 (_ BitVec 32)) Bool)

(assert (=> b!805183 (= res!549698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805184 () Bool)

(declare-fun res!549699 () Bool)

(assert (=> b!805184 (=> (not res!549699) (not e!445945))))

(assert (=> b!805184 (= res!549699 (and (= (size!21404 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21404 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21404 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805185 () Bool)

(declare-fun res!549700 () Bool)

(assert (=> b!805185 (=> (not res!549700) (not e!445945))))

(assert (=> b!805185 (= res!549700 (validKeyInArray!0 (select (arr!20983 a!3170) j!153)))))

(declare-fun b!805186 () Bool)

(declare-fun res!549703 () Bool)

(assert (=> b!805186 (=> (not res!549703) (not e!445944))))

(declare-datatypes ((List!14946 0))(
  ( (Nil!14943) (Cons!14942 (h!16071 (_ BitVec 64)) (t!21261 List!14946)) )
))
(declare-fun arrayNoDuplicates!0 (array!43806 (_ BitVec 32) List!14946) Bool)

(assert (=> b!805186 (= res!549703 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14943))))

(declare-fun b!805187 () Bool)

(assert (=> b!805187 (= e!445944 e!445946)))

(declare-fun res!549704 () Bool)

(assert (=> b!805187 (=> (not res!549704) (not e!445946))))

(declare-fun lt!360498 () (_ BitVec 64))

(declare-fun lt!360496 () array!43806)

(assert (=> b!805187 (= res!549704 (= (seekEntryOrOpen!0 lt!360498 lt!360496 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360498 lt!360496 mask!3266)))))

(assert (=> b!805187 (= lt!360498 (select (store (arr!20983 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!805187 (= lt!360496 (array!43807 (store (arr!20983 a!3170) i!1163 k0!2044) (size!21404 a!3170)))))

(declare-fun res!549705 () Bool)

(assert (=> start!69016 (=> (not res!549705) (not e!445945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69016 (= res!549705 (validMask!0 mask!3266))))

(assert (=> start!69016 e!445945))

(assert (=> start!69016 true))

(declare-fun array_inv!16779 (array!43806) Bool)

(assert (=> start!69016 (array_inv!16779 a!3170)))

(declare-fun b!805188 () Bool)

(declare-fun res!549707 () Bool)

(assert (=> b!805188 (=> (not res!549707) (not e!445945))))

(declare-fun arrayContainsKey!0 (array!43806 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805188 (= res!549707 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!69016 res!549705) b!805184))

(assert (= (and b!805184 res!549699) b!805185))

(assert (= (and b!805185 res!549700) b!805182))

(assert (= (and b!805182 res!549702) b!805188))

(assert (= (and b!805188 res!549707) b!805179))

(assert (= (and b!805179 res!549701) b!805183))

(assert (= (and b!805183 res!549698) b!805186))

(assert (= (and b!805186 res!549703) b!805181))

(assert (= (and b!805181 res!549706) b!805187))

(assert (= (and b!805187 res!549704) b!805180))

(declare-fun m!747093 () Bool)

(assert (=> start!69016 m!747093))

(declare-fun m!747095 () Bool)

(assert (=> start!69016 m!747095))

(declare-fun m!747097 () Bool)

(assert (=> b!805188 m!747097))

(declare-fun m!747099 () Bool)

(assert (=> b!805181 m!747099))

(declare-fun m!747101 () Bool)

(assert (=> b!805181 m!747101))

(declare-fun m!747103 () Bool)

(assert (=> b!805180 m!747103))

(assert (=> b!805180 m!747103))

(declare-fun m!747105 () Bool)

(assert (=> b!805180 m!747105))

(assert (=> b!805180 m!747103))

(declare-fun m!747107 () Bool)

(assert (=> b!805180 m!747107))

(declare-fun m!747109 () Bool)

(assert (=> b!805186 m!747109))

(declare-fun m!747111 () Bool)

(assert (=> b!805182 m!747111))

(assert (=> b!805185 m!747103))

(assert (=> b!805185 m!747103))

(declare-fun m!747113 () Bool)

(assert (=> b!805185 m!747113))

(declare-fun m!747115 () Bool)

(assert (=> b!805187 m!747115))

(declare-fun m!747117 () Bool)

(assert (=> b!805187 m!747117))

(declare-fun m!747119 () Bool)

(assert (=> b!805187 m!747119))

(declare-fun m!747121 () Bool)

(assert (=> b!805187 m!747121))

(declare-fun m!747123 () Bool)

(assert (=> b!805179 m!747123))

(declare-fun m!747125 () Bool)

(assert (=> b!805183 m!747125))

(check-sat (not b!805182) (not b!805179) (not b!805188) (not start!69016) (not b!805180) (not b!805185) (not b!805187) (not b!805186) (not b!805183))
(check-sat)
