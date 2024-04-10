; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68974 () Bool)

(assert start!68974)

(declare-fun b!804579 () Bool)

(declare-fun res!549103 () Bool)

(declare-fun e!445715 () Bool)

(assert (=> b!804579 (=> (not res!549103) (not e!445715))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804579 (= res!549103 (validKeyInArray!0 k0!2044))))

(declare-fun b!804580 () Bool)

(declare-fun e!445714 () Bool)

(assert (=> b!804580 (= e!445714 false)))

(declare-fun lt!360194 () Bool)

(declare-datatypes ((array!43764 0))(
  ( (array!43765 (arr!20962 (Array (_ BitVec 32) (_ BitVec 64))) (size!21383 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43764)

(declare-datatypes ((List!14925 0))(
  ( (Nil!14922) (Cons!14921 (h!16050 (_ BitVec 64)) (t!21240 List!14925)) )
))
(declare-fun arrayNoDuplicates!0 (array!43764 (_ BitVec 32) List!14925) Bool)

(assert (=> b!804580 (= lt!360194 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14922))))

(declare-fun b!804581 () Bool)

(declare-fun res!549104 () Bool)

(assert (=> b!804581 (=> (not res!549104) (not e!445715))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!804581 (= res!549104 (and (= (size!21383 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21383 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21383 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804582 () Bool)

(assert (=> b!804582 (= e!445715 e!445714)))

(declare-fun res!549099 () Bool)

(assert (=> b!804582 (=> (not res!549099) (not e!445714))))

(declare-datatypes ((SeekEntryResult!8553 0))(
  ( (MissingZero!8553 (index!36580 (_ BitVec 32))) (Found!8553 (index!36581 (_ BitVec 32))) (Intermediate!8553 (undefined!9365 Bool) (index!36582 (_ BitVec 32)) (x!67407 (_ BitVec 32))) (Undefined!8553) (MissingVacant!8553 (index!36583 (_ BitVec 32))) )
))
(declare-fun lt!360193 () SeekEntryResult!8553)

(assert (=> b!804582 (= res!549099 (or (= lt!360193 (MissingZero!8553 i!1163)) (= lt!360193 (MissingVacant!8553 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43764 (_ BitVec 32)) SeekEntryResult!8553)

(assert (=> b!804582 (= lt!360193 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!804583 () Bool)

(declare-fun res!549101 () Bool)

(assert (=> b!804583 (=> (not res!549101) (not e!445715))))

(declare-fun arrayContainsKey!0 (array!43764 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804583 (= res!549101 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804585 () Bool)

(declare-fun res!549100 () Bool)

(assert (=> b!804585 (=> (not res!549100) (not e!445715))))

(assert (=> b!804585 (= res!549100 (validKeyInArray!0 (select (arr!20962 a!3170) j!153)))))

(declare-fun res!549098 () Bool)

(assert (=> start!68974 (=> (not res!549098) (not e!445715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68974 (= res!549098 (validMask!0 mask!3266))))

(assert (=> start!68974 e!445715))

(assert (=> start!68974 true))

(declare-fun array_inv!16758 (array!43764) Bool)

(assert (=> start!68974 (array_inv!16758 a!3170)))

(declare-fun b!804584 () Bool)

(declare-fun res!549102 () Bool)

(assert (=> b!804584 (=> (not res!549102) (not e!445714))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43764 (_ BitVec 32)) Bool)

(assert (=> b!804584 (= res!549102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68974 res!549098) b!804581))

(assert (= (and b!804581 res!549104) b!804585))

(assert (= (and b!804585 res!549100) b!804579))

(assert (= (and b!804579 res!549103) b!804583))

(assert (= (and b!804583 res!549101) b!804582))

(assert (= (and b!804582 res!549099) b!804584))

(assert (= (and b!804584 res!549102) b!804580))

(declare-fun m!746435 () Bool)

(assert (=> b!804579 m!746435))

(declare-fun m!746437 () Bool)

(assert (=> b!804580 m!746437))

(declare-fun m!746439 () Bool)

(assert (=> b!804583 m!746439))

(declare-fun m!746441 () Bool)

(assert (=> b!804582 m!746441))

(declare-fun m!746443 () Bool)

(assert (=> b!804585 m!746443))

(assert (=> b!804585 m!746443))

(declare-fun m!746445 () Bool)

(assert (=> b!804585 m!746445))

(declare-fun m!746447 () Bool)

(assert (=> start!68974 m!746447))

(declare-fun m!746449 () Bool)

(assert (=> start!68974 m!746449))

(declare-fun m!746451 () Bool)

(assert (=> b!804584 m!746451))

(check-sat (not b!804582) (not b!804585) (not b!804579) (not start!68974) (not b!804584) (not b!804583) (not b!804580))
(check-sat)
