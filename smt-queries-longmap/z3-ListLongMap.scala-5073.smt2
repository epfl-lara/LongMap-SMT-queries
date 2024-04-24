; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69116 () Bool)

(assert start!69116)

(declare-fun res!549170 () Bool)

(declare-fun e!446169 () Bool)

(assert (=> start!69116 (=> (not res!549170) (not e!446169))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69116 (= res!549170 (validMask!0 mask!3266))))

(assert (=> start!69116 e!446169))

(assert (=> start!69116 true))

(declare-datatypes ((array!43738 0))(
  ( (array!43739 (arr!20944 (Array (_ BitVec 32) (_ BitVec 64))) (size!21364 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43738)

(declare-fun array_inv!16803 (array!43738) Bool)

(assert (=> start!69116 (array_inv!16803 a!3170)))

(declare-fun b!805194 () Bool)

(declare-fun res!549168 () Bool)

(assert (=> b!805194 (=> (not res!549168) (not e!446169))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805194 (= res!549168 (validKeyInArray!0 (select (arr!20944 a!3170) j!153)))))

(declare-fun b!805195 () Bool)

(declare-fun res!549167 () Bool)

(assert (=> b!805195 (=> (not res!549167) (not e!446169))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!805195 (= res!549167 (and (= (size!21364 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21364 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21364 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805196 () Bool)

(declare-fun res!549166 () Bool)

(assert (=> b!805196 (=> (not res!549166) (not e!446169))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!805196 (= res!549166 (validKeyInArray!0 k0!2044))))

(declare-fun b!805197 () Bool)

(declare-fun res!549169 () Bool)

(assert (=> b!805197 (=> (not res!549169) (not e!446169))))

(declare-fun arrayContainsKey!0 (array!43738 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805197 (= res!549169 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805198 () Bool)

(declare-fun e!446170 () Bool)

(assert (=> b!805198 (= e!446169 e!446170)))

(declare-fun res!549171 () Bool)

(assert (=> b!805198 (=> (not res!549171) (not e!446170))))

(declare-datatypes ((SeekEntryResult!8491 0))(
  ( (MissingZero!8491 (index!36332 (_ BitVec 32))) (Found!8491 (index!36333 (_ BitVec 32))) (Intermediate!8491 (undefined!9303 Bool) (index!36334 (_ BitVec 32)) (x!67327 (_ BitVec 32))) (Undefined!8491) (MissingVacant!8491 (index!36335 (_ BitVec 32))) )
))
(declare-fun lt!360473 () SeekEntryResult!8491)

(assert (=> b!805198 (= res!549171 (or (= lt!360473 (MissingZero!8491 i!1163)) (= lt!360473 (MissingVacant!8491 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43738 (_ BitVec 32)) SeekEntryResult!8491)

(assert (=> b!805198 (= lt!360473 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!805199 () Bool)

(declare-fun res!549165 () Bool)

(assert (=> b!805199 (=> (not res!549165) (not e!446170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43738 (_ BitVec 32)) Bool)

(assert (=> b!805199 (= res!549165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805200 () Bool)

(assert (=> b!805200 (= e!446170 false)))

(declare-fun lt!360472 () Bool)

(declare-datatypes ((List!14814 0))(
  ( (Nil!14811) (Cons!14810 (h!15945 (_ BitVec 64)) (t!21121 List!14814)) )
))
(declare-fun arrayNoDuplicates!0 (array!43738 (_ BitVec 32) List!14814) Bool)

(assert (=> b!805200 (= lt!360472 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14811))))

(assert (= (and start!69116 res!549170) b!805195))

(assert (= (and b!805195 res!549167) b!805194))

(assert (= (and b!805194 res!549168) b!805196))

(assert (= (and b!805196 res!549166) b!805197))

(assert (= (and b!805197 res!549169) b!805198))

(assert (= (and b!805198 res!549171) b!805199))

(assert (= (and b!805199 res!549165) b!805200))

(declare-fun m!747457 () Bool)

(assert (=> b!805199 m!747457))

(declare-fun m!747459 () Bool)

(assert (=> b!805200 m!747459))

(declare-fun m!747461 () Bool)

(assert (=> b!805194 m!747461))

(assert (=> b!805194 m!747461))

(declare-fun m!747463 () Bool)

(assert (=> b!805194 m!747463))

(declare-fun m!747465 () Bool)

(assert (=> b!805196 m!747465))

(declare-fun m!747467 () Bool)

(assert (=> b!805198 m!747467))

(declare-fun m!747469 () Bool)

(assert (=> start!69116 m!747469))

(declare-fun m!747471 () Bool)

(assert (=> start!69116 m!747471))

(declare-fun m!747473 () Bool)

(assert (=> b!805197 m!747473))

(check-sat (not b!805194) (not start!69116) (not b!805198) (not b!805200) (not b!805196) (not b!805197) (not b!805199))
(check-sat)
