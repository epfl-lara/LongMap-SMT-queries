; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26566 () Bool)

(assert start!26566)

(declare-fun b!275798 () Bool)

(declare-fun res!139794 () Bool)

(declare-fun e!176322 () Bool)

(assert (=> b!275798 (=> (not res!139794) (not e!176322))))

(declare-datatypes ((array!13663 0))(
  ( (array!13664 (arr!6481 (Array (_ BitVec 32) (_ BitVec 64))) (size!6833 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13663)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275798 (= res!139794 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275799 () Bool)

(declare-fun res!139797 () Bool)

(declare-fun e!176323 () Bool)

(assert (=> b!275799 (=> (not res!139797) (not e!176323))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275799 (= res!139797 (and (bvslt startIndex!26 (bvsub (size!6833 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!275801 () Bool)

(declare-fun res!139788 () Bool)

(assert (=> b!275801 (=> (not res!139788) (not e!176323))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275801 (= res!139788 (not (validKeyInArray!0 (select (arr!6481 a!3325) startIndex!26))))))

(declare-fun b!275802 () Bool)

(declare-fun res!139796 () Bool)

(assert (=> b!275802 (=> (not res!139796) (not e!176322))))

(assert (=> b!275802 (= res!139796 (validKeyInArray!0 k!2581))))

(declare-fun b!275803 () Bool)

(assert (=> b!275803 (= e!176322 e!176323)))

(declare-fun res!139792 () Bool)

(assert (=> b!275803 (=> (not res!139792) (not e!176323))))

(declare-datatypes ((SeekEntryResult!1639 0))(
  ( (MissingZero!1639 (index!8726 (_ BitVec 32))) (Found!1639 (index!8727 (_ BitVec 32))) (Intermediate!1639 (undefined!2451 Bool) (index!8728 (_ BitVec 32)) (x!26996 (_ BitVec 32))) (Undefined!1639) (MissingVacant!1639 (index!8729 (_ BitVec 32))) )
))
(declare-fun lt!137473 () SeekEntryResult!1639)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275803 (= res!139792 (or (= lt!137473 (MissingZero!1639 i!1267)) (= lt!137473 (MissingVacant!1639 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13663 (_ BitVec 32)) SeekEntryResult!1639)

(assert (=> b!275803 (= lt!137473 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!275804 () Bool)

(assert (=> b!275804 (= e!176323 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13663 (_ BitVec 32)) Bool)

(assert (=> b!275804 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13664 (store (arr!6481 a!3325) i!1267 k!2581) (size!6833 a!3325)) mask!3868)))

(declare-datatypes ((Unit!8693 0))(
  ( (Unit!8694) )
))
(declare-fun lt!137472 () Unit!8693)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13663 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8693)

(assert (=> b!275804 (= lt!137472 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!275805 () Bool)

(declare-fun res!139793 () Bool)

(assert (=> b!275805 (=> (not res!139793) (not e!176323))))

(assert (=> b!275805 (= res!139793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!139789 () Bool)

(assert (=> start!26566 (=> (not res!139789) (not e!176322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26566 (= res!139789 (validMask!0 mask!3868))))

(assert (=> start!26566 e!176322))

(declare-fun array_inv!4444 (array!13663) Bool)

(assert (=> start!26566 (array_inv!4444 a!3325)))

(assert (=> start!26566 true))

(declare-fun b!275800 () Bool)

(declare-fun res!139791 () Bool)

(assert (=> b!275800 (=> (not res!139791) (not e!176322))))

(assert (=> b!275800 (= res!139791 (and (= (size!6833 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6833 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6833 a!3325))))))

(declare-fun b!275806 () Bool)

(declare-fun res!139790 () Bool)

(assert (=> b!275806 (=> (not res!139790) (not e!176323))))

(assert (=> b!275806 (= res!139790 (not (= startIndex!26 i!1267)))))

(declare-fun b!275807 () Bool)

(declare-fun res!139795 () Bool)

(assert (=> b!275807 (=> (not res!139795) (not e!176322))))

(declare-datatypes ((List!4289 0))(
  ( (Nil!4286) (Cons!4285 (h!4952 (_ BitVec 64)) (t!9371 List!4289)) )
))
(declare-fun arrayNoDuplicates!0 (array!13663 (_ BitVec 32) List!4289) Bool)

(assert (=> b!275807 (= res!139795 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4286))))

(assert (= (and start!26566 res!139789) b!275800))

(assert (= (and b!275800 res!139791) b!275802))

(assert (= (and b!275802 res!139796) b!275807))

(assert (= (and b!275807 res!139795) b!275798))

(assert (= (and b!275798 res!139794) b!275803))

(assert (= (and b!275803 res!139792) b!275805))

(assert (= (and b!275805 res!139793) b!275806))

(assert (= (and b!275806 res!139790) b!275801))

(assert (= (and b!275801 res!139788) b!275799))

(assert (= (and b!275799 res!139797) b!275804))

(declare-fun m!291285 () Bool)

(assert (=> b!275802 m!291285))

(declare-fun m!291287 () Bool)

(assert (=> start!26566 m!291287))

(declare-fun m!291289 () Bool)

(assert (=> start!26566 m!291289))

(declare-fun m!291291 () Bool)

(assert (=> b!275804 m!291291))

(declare-fun m!291293 () Bool)

(assert (=> b!275804 m!291293))

(declare-fun m!291295 () Bool)

(assert (=> b!275804 m!291295))

(declare-fun m!291297 () Bool)

(assert (=> b!275805 m!291297))

(declare-fun m!291299 () Bool)

(assert (=> b!275803 m!291299))

(declare-fun m!291301 () Bool)

(assert (=> b!275798 m!291301))

(declare-fun m!291303 () Bool)

(assert (=> b!275801 m!291303))

(assert (=> b!275801 m!291303))

(declare-fun m!291305 () Bool)

(assert (=> b!275801 m!291305))

(declare-fun m!291307 () Bool)

(assert (=> b!275807 m!291307))

(push 1)

(assert (not b!275807))

(assert (not b!275801))

(assert (not b!275798))

(assert (not start!26566))

(assert (not b!275805))

(assert (not b!275804))

