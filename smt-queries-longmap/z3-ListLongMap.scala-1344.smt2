; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26624 () Bool)

(assert start!26624)

(declare-fun b!276396 () Bool)

(declare-fun res!140390 () Bool)

(declare-fun e!176584 () Bool)

(assert (=> b!276396 (=> (not res!140390) (not e!176584))))

(declare-datatypes ((array!13721 0))(
  ( (array!13722 (arr!6510 (Array (_ BitVec 32) (_ BitVec 64))) (size!6862 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13721)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!276396 (= res!140390 (and (= (size!6862 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6862 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6862 a!3325))))))

(declare-fun b!276397 () Bool)

(declare-fun res!140389 () Bool)

(assert (=> b!276397 (=> (not res!140389) (not e!176584))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276397 (= res!140389 (validKeyInArray!0 k0!2581))))

(declare-fun b!276398 () Bool)

(declare-fun e!176583 () Bool)

(assert (=> b!276398 (= e!176583 false)))

(declare-fun lt!137628 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13721 (_ BitVec 32)) Bool)

(assert (=> b!276398 (= lt!137628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276399 () Bool)

(declare-fun res!140388 () Bool)

(assert (=> b!276399 (=> (not res!140388) (not e!176584))))

(declare-fun arrayContainsKey!0 (array!13721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276399 (= res!140388 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276400 () Bool)

(declare-fun res!140391 () Bool)

(assert (=> b!276400 (=> (not res!140391) (not e!176584))))

(declare-datatypes ((List!4318 0))(
  ( (Nil!4315) (Cons!4314 (h!4981 (_ BitVec 64)) (t!9400 List!4318)) )
))
(declare-fun arrayNoDuplicates!0 (array!13721 (_ BitVec 32) List!4318) Bool)

(assert (=> b!276400 (= res!140391 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4315))))

(declare-fun res!140386 () Bool)

(assert (=> start!26624 (=> (not res!140386) (not e!176584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26624 (= res!140386 (validMask!0 mask!3868))))

(assert (=> start!26624 e!176584))

(declare-fun array_inv!4473 (array!13721) Bool)

(assert (=> start!26624 (array_inv!4473 a!3325)))

(assert (=> start!26624 true))

(declare-fun b!276401 () Bool)

(assert (=> b!276401 (= e!176584 e!176583)))

(declare-fun res!140387 () Bool)

(assert (=> b!276401 (=> (not res!140387) (not e!176583))))

(declare-datatypes ((SeekEntryResult!1668 0))(
  ( (MissingZero!1668 (index!8842 (_ BitVec 32))) (Found!1668 (index!8843 (_ BitVec 32))) (Intermediate!1668 (undefined!2480 Bool) (index!8844 (_ BitVec 32)) (x!27105 (_ BitVec 32))) (Undefined!1668) (MissingVacant!1668 (index!8845 (_ BitVec 32))) )
))
(declare-fun lt!137629 () SeekEntryResult!1668)

(assert (=> b!276401 (= res!140387 (or (= lt!137629 (MissingZero!1668 i!1267)) (= lt!137629 (MissingVacant!1668 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13721 (_ BitVec 32)) SeekEntryResult!1668)

(assert (=> b!276401 (= lt!137629 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26624 res!140386) b!276396))

(assert (= (and b!276396 res!140390) b!276397))

(assert (= (and b!276397 res!140389) b!276400))

(assert (= (and b!276400 res!140391) b!276399))

(assert (= (and b!276399 res!140388) b!276401))

(assert (= (and b!276401 res!140387) b!276398))

(declare-fun m!291743 () Bool)

(assert (=> b!276400 m!291743))

(declare-fun m!291745 () Bool)

(assert (=> start!26624 m!291745))

(declare-fun m!291747 () Bool)

(assert (=> start!26624 m!291747))

(declare-fun m!291749 () Bool)

(assert (=> b!276397 m!291749))

(declare-fun m!291751 () Bool)

(assert (=> b!276399 m!291751))

(declare-fun m!291753 () Bool)

(assert (=> b!276398 m!291753))

(declare-fun m!291755 () Bool)

(assert (=> b!276401 m!291755))

(check-sat (not b!276398) (not b!276397) (not b!276400) (not b!276401) (not start!26624) (not b!276399))
(check-sat)
