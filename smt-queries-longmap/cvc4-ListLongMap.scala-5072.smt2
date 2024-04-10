; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68946 () Bool)

(assert start!68946)

(declare-fun b!804285 () Bool)

(declare-fun res!548810 () Bool)

(declare-fun e!445588 () Bool)

(assert (=> b!804285 (=> (not res!548810) (not e!445588))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804285 (= res!548810 (validKeyInArray!0 k!2044))))

(declare-fun b!804286 () Bool)

(declare-fun res!548809 () Bool)

(assert (=> b!804286 (=> (not res!548809) (not e!445588))))

(declare-datatypes ((array!43736 0))(
  ( (array!43737 (arr!20948 (Array (_ BitVec 32) (_ BitVec 64))) (size!21369 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43736)

(declare-fun arrayContainsKey!0 (array!43736 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804286 (= res!548809 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804287 () Bool)

(declare-fun e!445589 () Bool)

(assert (=> b!804287 (= e!445588 e!445589)))

(declare-fun res!548808 () Bool)

(assert (=> b!804287 (=> (not res!548808) (not e!445589))))

(declare-datatypes ((SeekEntryResult!8539 0))(
  ( (MissingZero!8539 (index!36524 (_ BitVec 32))) (Found!8539 (index!36525 (_ BitVec 32))) (Intermediate!8539 (undefined!9351 Bool) (index!36526 (_ BitVec 32)) (x!67353 (_ BitVec 32))) (Undefined!8539) (MissingVacant!8539 (index!36527 (_ BitVec 32))) )
))
(declare-fun lt!360110 () SeekEntryResult!8539)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804287 (= res!548808 (or (= lt!360110 (MissingZero!8539 i!1163)) (= lt!360110 (MissingVacant!8539 i!1163))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43736 (_ BitVec 32)) SeekEntryResult!8539)

(assert (=> b!804287 (= lt!360110 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!804288 () Bool)

(declare-fun res!548807 () Bool)

(assert (=> b!804288 (=> (not res!548807) (not e!445588))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!804288 (= res!548807 (and (= (size!21369 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21369 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21369 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!548806 () Bool)

(assert (=> start!68946 (=> (not res!548806) (not e!445588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68946 (= res!548806 (validMask!0 mask!3266))))

(assert (=> start!68946 e!445588))

(assert (=> start!68946 true))

(declare-fun array_inv!16744 (array!43736) Bool)

(assert (=> start!68946 (array_inv!16744 a!3170)))

(declare-fun b!804289 () Bool)

(assert (=> b!804289 (= e!445589 false)))

(declare-fun lt!360109 () Bool)

(declare-datatypes ((List!14911 0))(
  ( (Nil!14908) (Cons!14907 (h!16036 (_ BitVec 64)) (t!21226 List!14911)) )
))
(declare-fun arrayNoDuplicates!0 (array!43736 (_ BitVec 32) List!14911) Bool)

(assert (=> b!804289 (= lt!360109 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14908))))

(declare-fun b!804290 () Bool)

(declare-fun res!548804 () Bool)

(assert (=> b!804290 (=> (not res!548804) (not e!445588))))

(assert (=> b!804290 (= res!548804 (validKeyInArray!0 (select (arr!20948 a!3170) j!153)))))

(declare-fun b!804291 () Bool)

(declare-fun res!548805 () Bool)

(assert (=> b!804291 (=> (not res!548805) (not e!445589))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43736 (_ BitVec 32)) Bool)

(assert (=> b!804291 (= res!548805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68946 res!548806) b!804288))

(assert (= (and b!804288 res!548807) b!804290))

(assert (= (and b!804290 res!548804) b!804285))

(assert (= (and b!804285 res!548810) b!804286))

(assert (= (and b!804286 res!548809) b!804287))

(assert (= (and b!804287 res!548808) b!804291))

(assert (= (and b!804291 res!548805) b!804289))

(declare-fun m!746183 () Bool)

(assert (=> b!804289 m!746183))

(declare-fun m!746185 () Bool)

(assert (=> b!804286 m!746185))

(declare-fun m!746187 () Bool)

(assert (=> b!804290 m!746187))

(assert (=> b!804290 m!746187))

(declare-fun m!746189 () Bool)

(assert (=> b!804290 m!746189))

(declare-fun m!746191 () Bool)

(assert (=> b!804291 m!746191))

(declare-fun m!746193 () Bool)

(assert (=> b!804285 m!746193))

(declare-fun m!746195 () Bool)

(assert (=> b!804287 m!746195))

(declare-fun m!746197 () Bool)

(assert (=> start!68946 m!746197))

(declare-fun m!746199 () Bool)

(assert (=> start!68946 m!746199))

(push 1)

(assert (not b!804285))

(assert (not b!804289))

(assert (not b!804291))

(assert (not b!804286))

(assert (not b!804290))

(assert (not start!68946))

(assert (not b!804287))

(check-sat)

