; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69022 () Bool)

(assert start!69022)

(declare-fun b!805269 () Bool)

(declare-fun e!445980 () Bool)

(declare-fun e!445979 () Bool)

(assert (=> b!805269 (= e!445980 e!445979)))

(declare-fun res!549793 () Bool)

(assert (=> b!805269 (=> (not res!549793) (not e!445979))))

(declare-datatypes ((SeekEntryResult!8577 0))(
  ( (MissingZero!8577 (index!36676 (_ BitVec 32))) (Found!8577 (index!36677 (_ BitVec 32))) (Intermediate!8577 (undefined!9389 Bool) (index!36678 (_ BitVec 32)) (x!67495 (_ BitVec 32))) (Undefined!8577) (MissingVacant!8577 (index!36679 (_ BitVec 32))) )
))
(declare-fun lt!360545 () SeekEntryResult!8577)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!805269 (= res!549793 (or (= lt!360545 (MissingZero!8577 i!1163)) (= lt!360545 (MissingVacant!8577 i!1163))))))

(declare-datatypes ((array!43812 0))(
  ( (array!43813 (arr!20986 (Array (_ BitVec 32) (_ BitVec 64))) (size!21407 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43812)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43812 (_ BitVec 32)) SeekEntryResult!8577)

(assert (=> b!805269 (= lt!360545 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!805270 () Bool)

(declare-fun res!549795 () Bool)

(assert (=> b!805270 (=> (not res!549795) (not e!445980))))

(declare-fun arrayContainsKey!0 (array!43812 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805270 (= res!549795 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805271 () Bool)

(declare-fun e!445982 () Bool)

(assert (=> b!805271 (= e!445979 e!445982)))

(declare-fun res!549789 () Bool)

(assert (=> b!805271 (=> (not res!549789) (not e!445982))))

(declare-fun lt!360542 () array!43812)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!360544 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43812 (_ BitVec 32)) SeekEntryResult!8577)

(assert (=> b!805271 (= res!549789 (= (seekEntryOrOpen!0 lt!360544 lt!360542 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360544 lt!360542 mask!3266)))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!805271 (= lt!360544 (select (store (arr!20986 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!805271 (= lt!360542 (array!43813 (store (arr!20986 a!3170) i!1163 k0!2044) (size!21407 a!3170)))))

(declare-fun b!805272 () Bool)

(assert (=> b!805272 (= e!445982 false)))

(declare-fun lt!360543 () SeekEntryResult!8577)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!805272 (= lt!360543 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20986 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360541 () SeekEntryResult!8577)

(assert (=> b!805272 (= lt!360541 (seekEntryOrOpen!0 (select (arr!20986 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805273 () Bool)

(declare-fun res!549792 () Bool)

(assert (=> b!805273 (=> (not res!549792) (not e!445980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805273 (= res!549792 (validKeyInArray!0 (select (arr!20986 a!3170) j!153)))))

(declare-fun b!805274 () Bool)

(declare-fun res!549794 () Bool)

(assert (=> b!805274 (=> (not res!549794) (not e!445979))))

(declare-datatypes ((List!14949 0))(
  ( (Nil!14946) (Cons!14945 (h!16074 (_ BitVec 64)) (t!21264 List!14949)) )
))
(declare-fun arrayNoDuplicates!0 (array!43812 (_ BitVec 32) List!14949) Bool)

(assert (=> b!805274 (= res!549794 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14946))))

(declare-fun res!549796 () Bool)

(assert (=> start!69022 (=> (not res!549796) (not e!445980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69022 (= res!549796 (validMask!0 mask!3266))))

(assert (=> start!69022 e!445980))

(assert (=> start!69022 true))

(declare-fun array_inv!16782 (array!43812) Bool)

(assert (=> start!69022 (array_inv!16782 a!3170)))

(declare-fun b!805275 () Bool)

(declare-fun res!549790 () Bool)

(assert (=> b!805275 (=> (not res!549790) (not e!445980))))

(assert (=> b!805275 (= res!549790 (and (= (size!21407 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21407 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21407 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805276 () Bool)

(declare-fun res!549788 () Bool)

(assert (=> b!805276 (=> (not res!549788) (not e!445979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43812 (_ BitVec 32)) Bool)

(assert (=> b!805276 (= res!549788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805277 () Bool)

(declare-fun res!549797 () Bool)

(assert (=> b!805277 (=> (not res!549797) (not e!445979))))

(assert (=> b!805277 (= res!549797 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21407 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20986 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21407 a!3170)) (= (select (arr!20986 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805278 () Bool)

(declare-fun res!549791 () Bool)

(assert (=> b!805278 (=> (not res!549791) (not e!445980))))

(assert (=> b!805278 (= res!549791 (validKeyInArray!0 k0!2044))))

(assert (= (and start!69022 res!549796) b!805275))

(assert (= (and b!805275 res!549790) b!805273))

(assert (= (and b!805273 res!549792) b!805278))

(assert (= (and b!805278 res!549791) b!805270))

(assert (= (and b!805270 res!549795) b!805269))

(assert (= (and b!805269 res!549793) b!805276))

(assert (= (and b!805276 res!549788) b!805274))

(assert (= (and b!805274 res!549794) b!805277))

(assert (= (and b!805277 res!549797) b!805271))

(assert (= (and b!805271 res!549789) b!805272))

(declare-fun m!747195 () Bool)

(assert (=> b!805278 m!747195))

(declare-fun m!747197 () Bool)

(assert (=> b!805271 m!747197))

(declare-fun m!747199 () Bool)

(assert (=> b!805271 m!747199))

(declare-fun m!747201 () Bool)

(assert (=> b!805271 m!747201))

(declare-fun m!747203 () Bool)

(assert (=> b!805271 m!747203))

(declare-fun m!747205 () Bool)

(assert (=> b!805277 m!747205))

(declare-fun m!747207 () Bool)

(assert (=> b!805277 m!747207))

(declare-fun m!747209 () Bool)

(assert (=> b!805269 m!747209))

(declare-fun m!747211 () Bool)

(assert (=> b!805270 m!747211))

(declare-fun m!747213 () Bool)

(assert (=> b!805274 m!747213))

(declare-fun m!747215 () Bool)

(assert (=> start!69022 m!747215))

(declare-fun m!747217 () Bool)

(assert (=> start!69022 m!747217))

(declare-fun m!747219 () Bool)

(assert (=> b!805273 m!747219))

(assert (=> b!805273 m!747219))

(declare-fun m!747221 () Bool)

(assert (=> b!805273 m!747221))

(declare-fun m!747223 () Bool)

(assert (=> b!805276 m!747223))

(assert (=> b!805272 m!747219))

(assert (=> b!805272 m!747219))

(declare-fun m!747225 () Bool)

(assert (=> b!805272 m!747225))

(assert (=> b!805272 m!747219))

(declare-fun m!747227 () Bool)

(assert (=> b!805272 m!747227))

(check-sat (not b!805270) (not start!69022) (not b!805276) (not b!805272) (not b!805274) (not b!805278) (not b!805269) (not b!805271) (not b!805273))
(check-sat)
