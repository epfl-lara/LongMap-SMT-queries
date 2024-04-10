; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68966 () Bool)

(assert start!68966)

(declare-fun b!804495 () Bool)

(declare-fun e!445679 () Bool)

(declare-fun e!445677 () Bool)

(assert (=> b!804495 (= e!445679 e!445677)))

(declare-fun res!549020 () Bool)

(assert (=> b!804495 (=> (not res!549020) (not e!445677))))

(declare-datatypes ((SeekEntryResult!8549 0))(
  ( (MissingZero!8549 (index!36564 (_ BitVec 32))) (Found!8549 (index!36565 (_ BitVec 32))) (Intermediate!8549 (undefined!9361 Bool) (index!36566 (_ BitVec 32)) (x!67395 (_ BitVec 32))) (Undefined!8549) (MissingVacant!8549 (index!36567 (_ BitVec 32))) )
))
(declare-fun lt!360169 () SeekEntryResult!8549)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804495 (= res!549020 (or (= lt!360169 (MissingZero!8549 i!1163)) (= lt!360169 (MissingVacant!8549 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43756 0))(
  ( (array!43757 (arr!20958 (Array (_ BitVec 32) (_ BitVec 64))) (size!21379 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43756)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43756 (_ BitVec 32)) SeekEntryResult!8549)

(assert (=> b!804495 (= lt!360169 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!804496 () Bool)

(declare-fun res!549017 () Bool)

(assert (=> b!804496 (=> (not res!549017) (not e!445679))))

(declare-fun arrayContainsKey!0 (array!43756 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804496 (= res!549017 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!549014 () Bool)

(assert (=> start!68966 (=> (not res!549014) (not e!445679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68966 (= res!549014 (validMask!0 mask!3266))))

(assert (=> start!68966 e!445679))

(assert (=> start!68966 true))

(declare-fun array_inv!16754 (array!43756) Bool)

(assert (=> start!68966 (array_inv!16754 a!3170)))

(declare-fun b!804497 () Bool)

(assert (=> b!804497 (= e!445677 false)))

(declare-fun lt!360170 () Bool)

(declare-datatypes ((List!14921 0))(
  ( (Nil!14918) (Cons!14917 (h!16046 (_ BitVec 64)) (t!21236 List!14921)) )
))
(declare-fun arrayNoDuplicates!0 (array!43756 (_ BitVec 32) List!14921) Bool)

(assert (=> b!804497 (= lt!360170 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14918))))

(declare-fun b!804498 () Bool)

(declare-fun res!549018 () Bool)

(assert (=> b!804498 (=> (not res!549018) (not e!445679))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!804498 (= res!549018 (and (= (size!21379 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21379 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21379 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804499 () Bool)

(declare-fun res!549016 () Bool)

(assert (=> b!804499 (=> (not res!549016) (not e!445679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804499 (= res!549016 (validKeyInArray!0 k!2044))))

(declare-fun b!804500 () Bool)

(declare-fun res!549019 () Bool)

(assert (=> b!804500 (=> (not res!549019) (not e!445677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43756 (_ BitVec 32)) Bool)

(assert (=> b!804500 (= res!549019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804501 () Bool)

(declare-fun res!549015 () Bool)

(assert (=> b!804501 (=> (not res!549015) (not e!445679))))

(assert (=> b!804501 (= res!549015 (validKeyInArray!0 (select (arr!20958 a!3170) j!153)))))

(assert (= (and start!68966 res!549014) b!804498))

(assert (= (and b!804498 res!549018) b!804501))

(assert (= (and b!804501 res!549015) b!804499))

(assert (= (and b!804499 res!549016) b!804496))

(assert (= (and b!804496 res!549017) b!804495))

(assert (= (and b!804495 res!549020) b!804500))

(assert (= (and b!804500 res!549019) b!804497))

(declare-fun m!746363 () Bool)

(assert (=> b!804497 m!746363))

(declare-fun m!746365 () Bool)

(assert (=> b!804496 m!746365))

(declare-fun m!746367 () Bool)

(assert (=> b!804500 m!746367))

(declare-fun m!746369 () Bool)

(assert (=> b!804495 m!746369))

(declare-fun m!746371 () Bool)

(assert (=> start!68966 m!746371))

(declare-fun m!746373 () Bool)

(assert (=> start!68966 m!746373))

(declare-fun m!746375 () Bool)

(assert (=> b!804501 m!746375))

(assert (=> b!804501 m!746375))

(declare-fun m!746377 () Bool)

(assert (=> b!804501 m!746377))

(declare-fun m!746379 () Bool)

(assert (=> b!804499 m!746379))

(push 1)

