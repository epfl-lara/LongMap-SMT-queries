; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26538 () Bool)

(assert start!26538)

(declare-fun b!275442 () Bool)

(declare-fun res!139433 () Bool)

(declare-fun e!176198 () Bool)

(assert (=> b!275442 (=> (not res!139433) (not e!176198))))

(declare-datatypes ((array!13635 0))(
  ( (array!13636 (arr!6467 (Array (_ BitVec 32) (_ BitVec 64))) (size!6819 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13635)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13635 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275442 (= res!139433 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275443 () Bool)

(declare-fun e!176196 () Bool)

(assert (=> b!275443 (= e!176196 false)))

(declare-fun lt!137389 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13635 (_ BitVec 32)) Bool)

(assert (=> b!275443 (= lt!137389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275444 () Bool)

(declare-fun res!139434 () Bool)

(assert (=> b!275444 (=> (not res!139434) (not e!176198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275444 (= res!139434 (validKeyInArray!0 k!2581))))

(declare-fun b!275445 () Bool)

(assert (=> b!275445 (= e!176198 e!176196)))

(declare-fun res!139435 () Bool)

(assert (=> b!275445 (=> (not res!139435) (not e!176196))))

(declare-datatypes ((SeekEntryResult!1625 0))(
  ( (MissingZero!1625 (index!8670 (_ BitVec 32))) (Found!1625 (index!8671 (_ BitVec 32))) (Intermediate!1625 (undefined!2437 Bool) (index!8672 (_ BitVec 32)) (x!26950 (_ BitVec 32))) (Undefined!1625) (MissingVacant!1625 (index!8673 (_ BitVec 32))) )
))
(declare-fun lt!137388 () SeekEntryResult!1625)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275445 (= res!139435 (or (= lt!137388 (MissingZero!1625 i!1267)) (= lt!137388 (MissingVacant!1625 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13635 (_ BitVec 32)) SeekEntryResult!1625)

(assert (=> b!275445 (= lt!137388 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!139437 () Bool)

(assert (=> start!26538 (=> (not res!139437) (not e!176198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26538 (= res!139437 (validMask!0 mask!3868))))

(assert (=> start!26538 e!176198))

(declare-fun array_inv!4430 (array!13635) Bool)

(assert (=> start!26538 (array_inv!4430 a!3325)))

(assert (=> start!26538 true))

(declare-fun b!275446 () Bool)

(declare-fun res!139436 () Bool)

(assert (=> b!275446 (=> (not res!139436) (not e!176198))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275446 (= res!139436 (and (= (size!6819 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6819 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6819 a!3325))))))

(declare-fun b!275447 () Bool)

(declare-fun res!139432 () Bool)

(assert (=> b!275447 (=> (not res!139432) (not e!176198))))

(declare-datatypes ((List!4275 0))(
  ( (Nil!4272) (Cons!4271 (h!4938 (_ BitVec 64)) (t!9357 List!4275)) )
))
(declare-fun arrayNoDuplicates!0 (array!13635 (_ BitVec 32) List!4275) Bool)

(assert (=> b!275447 (= res!139432 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4272))))

(assert (= (and start!26538 res!139437) b!275446))

(assert (= (and b!275446 res!139436) b!275444))

(assert (= (and b!275444 res!139434) b!275447))

(assert (= (and b!275447 res!139432) b!275442))

(assert (= (and b!275442 res!139433) b!275445))

(assert (= (and b!275445 res!139435) b!275443))

(declare-fun m!291009 () Bool)

(assert (=> b!275442 m!291009))

(declare-fun m!291011 () Bool)

(assert (=> start!26538 m!291011))

(declare-fun m!291013 () Bool)

(assert (=> start!26538 m!291013))

(declare-fun m!291015 () Bool)

(assert (=> b!275443 m!291015))

(declare-fun m!291017 () Bool)

(assert (=> b!275444 m!291017))

(declare-fun m!291019 () Bool)

(assert (=> b!275447 m!291019))

(declare-fun m!291021 () Bool)

(assert (=> b!275445 m!291021))

(push 1)

(assert (not b!275444))

(assert (not b!275443))

(assert (not b!275442))

(assert (not start!26538))

(assert (not b!275445))

(assert (not b!275447))

(check-sat)

