; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26628 () Bool)

(assert start!26628)

(declare-fun b!276432 () Bool)

(declare-fun e!176601 () Bool)

(assert (=> b!276432 (= e!176601 false)))

(declare-fun lt!137641 () Bool)

(declare-datatypes ((array!13725 0))(
  ( (array!13726 (arr!6512 (Array (_ BitVec 32) (_ BitVec 64))) (size!6864 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13725)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13725 (_ BitVec 32)) Bool)

(assert (=> b!276432 (= lt!137641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276433 () Bool)

(declare-fun res!140424 () Bool)

(declare-fun e!176603 () Bool)

(assert (=> b!276433 (=> (not res!140424) (not e!176603))))

(declare-datatypes ((List!4320 0))(
  ( (Nil!4317) (Cons!4316 (h!4983 (_ BitVec 64)) (t!9402 List!4320)) )
))
(declare-fun arrayNoDuplicates!0 (array!13725 (_ BitVec 32) List!4320) Bool)

(assert (=> b!276433 (= res!140424 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4317))))

(declare-fun b!276434 () Bool)

(declare-fun res!140426 () Bool)

(assert (=> b!276434 (=> (not res!140426) (not e!176603))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276434 (= res!140426 (validKeyInArray!0 k!2581))))

(declare-fun b!276435 () Bool)

(declare-fun res!140427 () Bool)

(assert (=> b!276435 (=> (not res!140427) (not e!176603))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276435 (= res!140427 (and (= (size!6864 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6864 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6864 a!3325))))))

(declare-fun b!276436 () Bool)

(declare-fun res!140422 () Bool)

(assert (=> b!276436 (=> (not res!140422) (not e!176603))))

(declare-fun arrayContainsKey!0 (array!13725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276436 (= res!140422 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276437 () Bool)

(assert (=> b!276437 (= e!176603 e!176601)))

(declare-fun res!140425 () Bool)

(assert (=> b!276437 (=> (not res!140425) (not e!176601))))

(declare-datatypes ((SeekEntryResult!1670 0))(
  ( (MissingZero!1670 (index!8850 (_ BitVec 32))) (Found!1670 (index!8851 (_ BitVec 32))) (Intermediate!1670 (undefined!2482 Bool) (index!8852 (_ BitVec 32)) (x!27115 (_ BitVec 32))) (Undefined!1670) (MissingVacant!1670 (index!8853 (_ BitVec 32))) )
))
(declare-fun lt!137640 () SeekEntryResult!1670)

(assert (=> b!276437 (= res!140425 (or (= lt!137640 (MissingZero!1670 i!1267)) (= lt!137640 (MissingVacant!1670 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13725 (_ BitVec 32)) SeekEntryResult!1670)

(assert (=> b!276437 (= lt!137640 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!140423 () Bool)

(assert (=> start!26628 (=> (not res!140423) (not e!176603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26628 (= res!140423 (validMask!0 mask!3868))))

(assert (=> start!26628 e!176603))

(declare-fun array_inv!4475 (array!13725) Bool)

(assert (=> start!26628 (array_inv!4475 a!3325)))

(assert (=> start!26628 true))

(assert (= (and start!26628 res!140423) b!276435))

(assert (= (and b!276435 res!140427) b!276434))

(assert (= (and b!276434 res!140426) b!276433))

(assert (= (and b!276433 res!140424) b!276436))

(assert (= (and b!276436 res!140422) b!276437))

(assert (= (and b!276437 res!140425) b!276432))

(declare-fun m!291771 () Bool)

(assert (=> b!276436 m!291771))

(declare-fun m!291773 () Bool)

(assert (=> b!276437 m!291773))

(declare-fun m!291775 () Bool)

(assert (=> b!276433 m!291775))

(declare-fun m!291777 () Bool)

(assert (=> b!276432 m!291777))

(declare-fun m!291779 () Bool)

(assert (=> b!276434 m!291779))

(declare-fun m!291781 () Bool)

(assert (=> start!26628 m!291781))

(declare-fun m!291783 () Bool)

(assert (=> start!26628 m!291783))

(push 1)

(assert (not start!26628))

(assert (not b!276433))

(assert (not b!276434))

(assert (not b!276436))

(assert (not b!276432))

