; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26660 () Bool)

(assert start!26660)

(declare-fun b!276564 () Bool)

(declare-fun res!140609 () Bool)

(declare-fun e!176637 () Bool)

(assert (=> b!276564 (=> (not res!140609) (not e!176637))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276564 (= res!140609 (validKeyInArray!0 k0!2581))))

(declare-fun b!276565 () Bool)

(declare-fun e!176635 () Bool)

(assert (=> b!276565 (= e!176637 e!176635)))

(declare-fun res!140608 () Bool)

(assert (=> b!276565 (=> (not res!140608) (not e!176635))))

(declare-datatypes ((SeekEntryResult!1679 0))(
  ( (MissingZero!1679 (index!8886 (_ BitVec 32))) (Found!1679 (index!8887 (_ BitVec 32))) (Intermediate!1679 (undefined!2491 Bool) (index!8888 (_ BitVec 32)) (x!27163 (_ BitVec 32))) (Undefined!1679) (MissingVacant!1679 (index!8889 (_ BitVec 32))) )
))
(declare-fun lt!137540 () SeekEntryResult!1679)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276565 (= res!140608 (or (= lt!137540 (MissingZero!1679 i!1267)) (= lt!137540 (MissingVacant!1679 i!1267))))))

(declare-datatypes ((array!13746 0))(
  ( (array!13747 (arr!6522 (Array (_ BitVec 32) (_ BitVec 64))) (size!6875 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13746)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13746 (_ BitVec 32)) SeekEntryResult!1679)

(assert (=> b!276565 (= lt!137540 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276566 () Bool)

(declare-fun res!140610 () Bool)

(assert (=> b!276566 (=> (not res!140610) (not e!176637))))

(declare-fun arrayContainsKey!0 (array!13746 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276566 (= res!140610 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276567 () Bool)

(assert (=> b!276567 (= e!176635 false)))

(declare-fun lt!137541 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13746 (_ BitVec 32)) Bool)

(assert (=> b!276567 (= lt!137541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!140611 () Bool)

(assert (=> start!26660 (=> (not res!140611) (not e!176637))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26660 (= res!140611 (validMask!0 mask!3868))))

(assert (=> start!26660 e!176637))

(declare-fun array_inv!4494 (array!13746) Bool)

(assert (=> start!26660 (array_inv!4494 a!3325)))

(assert (=> start!26660 true))

(declare-fun b!276568 () Bool)

(declare-fun res!140606 () Bool)

(assert (=> b!276568 (=> (not res!140606) (not e!176637))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276568 (= res!140606 (and (= (size!6875 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6875 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6875 a!3325))))))

(declare-fun b!276569 () Bool)

(declare-fun res!140607 () Bool)

(assert (=> b!276569 (=> (not res!140607) (not e!176637))))

(declare-datatypes ((List!4303 0))(
  ( (Nil!4300) (Cons!4299 (h!4966 (_ BitVec 64)) (t!9376 List!4303)) )
))
(declare-fun arrayNoDuplicates!0 (array!13746 (_ BitVec 32) List!4303) Bool)

(assert (=> b!276569 (= res!140607 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4300))))

(assert (= (and start!26660 res!140611) b!276568))

(assert (= (and b!276568 res!140606) b!276564))

(assert (= (and b!276564 res!140609) b!276569))

(assert (= (and b!276569 res!140607) b!276566))

(assert (= (and b!276566 res!140610) b!276565))

(assert (= (and b!276565 res!140608) b!276567))

(declare-fun m!291389 () Bool)

(assert (=> b!276569 m!291389))

(declare-fun m!291391 () Bool)

(assert (=> start!26660 m!291391))

(declare-fun m!291393 () Bool)

(assert (=> start!26660 m!291393))

(declare-fun m!291395 () Bool)

(assert (=> b!276564 m!291395))

(declare-fun m!291397 () Bool)

(assert (=> b!276567 m!291397))

(declare-fun m!291399 () Bool)

(assert (=> b!276566 m!291399))

(declare-fun m!291401 () Bool)

(assert (=> b!276565 m!291401))

(check-sat (not b!276564) (not b!276569) (not b!276567) (not b!276565) (not start!26660) (not b!276566))
(check-sat)
