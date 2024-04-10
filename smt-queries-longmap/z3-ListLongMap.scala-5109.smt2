; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69262 () Bool)

(assert start!69262)

(declare-fun b!808163 () Bool)

(declare-fun e!447382 () Bool)

(declare-fun e!447381 () Bool)

(assert (=> b!808163 (= e!447382 e!447381)))

(declare-fun res!552293 () Bool)

(assert (=> b!808163 (=> (not res!552293) (not e!447381))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!362125 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((array!43962 0))(
  ( (array!43963 (arr!21058 (Array (_ BitVec 32) (_ BitVec 64))) (size!21479 (_ BitVec 32))) )
))
(declare-fun lt!362124 () array!43962)

(declare-datatypes ((SeekEntryResult!8649 0))(
  ( (MissingZero!8649 (index!36964 (_ BitVec 32))) (Found!8649 (index!36965 (_ BitVec 32))) (Intermediate!8649 (undefined!9461 Bool) (index!36966 (_ BitVec 32)) (x!67765 (_ BitVec 32))) (Undefined!8649) (MissingVacant!8649 (index!36967 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43962 (_ BitVec 32)) SeekEntryResult!8649)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43962 (_ BitVec 32)) SeekEntryResult!8649)

(assert (=> b!808163 (= res!552293 (= (seekEntryOrOpen!0 lt!362125 lt!362124 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362125 lt!362124 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun a!3170 () array!43962)

(assert (=> b!808163 (= lt!362125 (select (store (arr!21058 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!808163 (= lt!362124 (array!43963 (store (arr!21058 a!3170) i!1163 k0!2044) (size!21479 a!3170)))))

(declare-fun b!808164 () Bool)

(declare-fun res!552295 () Bool)

(declare-fun e!447383 () Bool)

(assert (=> b!808164 (=> (not res!552295) (not e!447383))))

(assert (=> b!808164 (= res!552295 (and (= (size!21479 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21479 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21479 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!808165 () Bool)

(declare-fun e!447380 () Bool)

(assert (=> b!808165 (= e!447381 e!447380)))

(declare-fun res!552290 () Bool)

(assert (=> b!808165 (=> (not res!552290) (not e!447380))))

(declare-fun lt!362129 () SeekEntryResult!8649)

(declare-fun lt!362128 () SeekEntryResult!8649)

(assert (=> b!808165 (= res!552290 (and (= lt!362128 lt!362129) (= lt!362129 (Found!8649 j!153)) (not (= (select (arr!21058 a!3170) index!1236) (select (arr!21058 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!808165 (= lt!362129 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21058 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!808165 (= lt!362128 (seekEntryOrOpen!0 (select (arr!21058 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!552289 () Bool)

(assert (=> start!69262 (=> (not res!552289) (not e!447383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69262 (= res!552289 (validMask!0 mask!3266))))

(assert (=> start!69262 e!447383))

(assert (=> start!69262 true))

(declare-fun array_inv!16854 (array!43962) Bool)

(assert (=> start!69262 (array_inv!16854 a!3170)))

(declare-fun b!808166 () Bool)

(declare-fun res!552286 () Bool)

(assert (=> b!808166 (=> (not res!552286) (not e!447383))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808166 (= res!552286 (validKeyInArray!0 k0!2044))))

(declare-fun b!808167 () Bool)

(declare-fun res!552288 () Bool)

(assert (=> b!808167 (=> (not res!552288) (not e!447383))))

(declare-fun arrayContainsKey!0 (array!43962 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808167 (= res!552288 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808168 () Bool)

(assert (=> b!808168 (= e!447380 false)))

(declare-fun lt!362126 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808168 (= lt!362126 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!808169 () Bool)

(declare-fun res!552294 () Bool)

(assert (=> b!808169 (=> (not res!552294) (not e!447383))))

(assert (=> b!808169 (= res!552294 (validKeyInArray!0 (select (arr!21058 a!3170) j!153)))))

(declare-fun b!808170 () Bool)

(declare-fun res!552296 () Bool)

(assert (=> b!808170 (=> (not res!552296) (not e!447382))))

(assert (=> b!808170 (= res!552296 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21479 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21058 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21479 a!3170)) (= (select (arr!21058 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!808171 () Bool)

(declare-fun res!552292 () Bool)

(assert (=> b!808171 (=> (not res!552292) (not e!447382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43962 (_ BitVec 32)) Bool)

(assert (=> b!808171 (= res!552292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!808172 () Bool)

(assert (=> b!808172 (= e!447383 e!447382)))

(declare-fun res!552291 () Bool)

(assert (=> b!808172 (=> (not res!552291) (not e!447382))))

(declare-fun lt!362127 () SeekEntryResult!8649)

(assert (=> b!808172 (= res!552291 (or (= lt!362127 (MissingZero!8649 i!1163)) (= lt!362127 (MissingVacant!8649 i!1163))))))

(assert (=> b!808172 (= lt!362127 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!808173 () Bool)

(declare-fun res!552287 () Bool)

(assert (=> b!808173 (=> (not res!552287) (not e!447382))))

(declare-datatypes ((List!15021 0))(
  ( (Nil!15018) (Cons!15017 (h!16146 (_ BitVec 64)) (t!21336 List!15021)) )
))
(declare-fun arrayNoDuplicates!0 (array!43962 (_ BitVec 32) List!15021) Bool)

(assert (=> b!808173 (= res!552287 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15018))))

(assert (= (and start!69262 res!552289) b!808164))

(assert (= (and b!808164 res!552295) b!808169))

(assert (= (and b!808169 res!552294) b!808166))

(assert (= (and b!808166 res!552286) b!808167))

(assert (= (and b!808167 res!552288) b!808172))

(assert (= (and b!808172 res!552291) b!808171))

(assert (= (and b!808171 res!552292) b!808173))

(assert (= (and b!808173 res!552287) b!808170))

(assert (= (and b!808170 res!552296) b!808163))

(assert (= (and b!808163 res!552293) b!808165))

(assert (= (and b!808165 res!552290) b!808168))

(declare-fun m!750307 () Bool)

(assert (=> b!808165 m!750307))

(declare-fun m!750309 () Bool)

(assert (=> b!808165 m!750309))

(assert (=> b!808165 m!750309))

(declare-fun m!750311 () Bool)

(assert (=> b!808165 m!750311))

(assert (=> b!808165 m!750309))

(declare-fun m!750313 () Bool)

(assert (=> b!808165 m!750313))

(declare-fun m!750315 () Bool)

(assert (=> start!69262 m!750315))

(declare-fun m!750317 () Bool)

(assert (=> start!69262 m!750317))

(declare-fun m!750319 () Bool)

(assert (=> b!808170 m!750319))

(declare-fun m!750321 () Bool)

(assert (=> b!808170 m!750321))

(declare-fun m!750323 () Bool)

(assert (=> b!808167 m!750323))

(declare-fun m!750325 () Bool)

(assert (=> b!808171 m!750325))

(declare-fun m!750327 () Bool)

(assert (=> b!808166 m!750327))

(declare-fun m!750329 () Bool)

(assert (=> b!808163 m!750329))

(declare-fun m!750331 () Bool)

(assert (=> b!808163 m!750331))

(declare-fun m!750333 () Bool)

(assert (=> b!808163 m!750333))

(declare-fun m!750335 () Bool)

(assert (=> b!808163 m!750335))

(declare-fun m!750337 () Bool)

(assert (=> b!808172 m!750337))

(declare-fun m!750339 () Bool)

(assert (=> b!808168 m!750339))

(declare-fun m!750341 () Bool)

(assert (=> b!808173 m!750341))

(assert (=> b!808169 m!750309))

(assert (=> b!808169 m!750309))

(declare-fun m!750343 () Bool)

(assert (=> b!808169 m!750343))

(check-sat (not b!808163) (not b!808173) (not b!808166) (not b!808169) (not b!808172) (not b!808168) (not b!808167) (not b!808171) (not b!808165) (not start!69262))
(check-sat)
