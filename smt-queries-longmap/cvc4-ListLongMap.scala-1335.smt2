; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26572 () Bool)

(assert start!26572)

(declare-fun b!275888 () Bool)

(declare-fun res!139884 () Bool)

(declare-fun e!176349 () Bool)

(assert (=> b!275888 (=> (not res!139884) (not e!176349))))

(declare-datatypes ((array!13669 0))(
  ( (array!13670 (arr!6484 (Array (_ BitVec 32) (_ BitVec 64))) (size!6836 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13669)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275888 (= res!139884 (not (validKeyInArray!0 (select (arr!6484 a!3325) startIndex!26))))))

(declare-fun res!139878 () Bool)

(declare-fun e!176351 () Bool)

(assert (=> start!26572 (=> (not res!139878) (not e!176351))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26572 (= res!139878 (validMask!0 mask!3868))))

(assert (=> start!26572 e!176351))

(declare-fun array_inv!4447 (array!13669) Bool)

(assert (=> start!26572 (array_inv!4447 a!3325)))

(assert (=> start!26572 true))

(declare-fun b!275889 () Bool)

(declare-fun res!139887 () Bool)

(assert (=> b!275889 (=> (not res!139887) (not e!176349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13669 (_ BitVec 32)) Bool)

(assert (=> b!275889 (= res!139887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275890 () Bool)

(assert (=> b!275890 (= e!176351 e!176349)))

(declare-fun res!139879 () Bool)

(assert (=> b!275890 (=> (not res!139879) (not e!176349))))

(declare-datatypes ((SeekEntryResult!1642 0))(
  ( (MissingZero!1642 (index!8738 (_ BitVec 32))) (Found!1642 (index!8739 (_ BitVec 32))) (Intermediate!1642 (undefined!2454 Bool) (index!8740 (_ BitVec 32)) (x!27007 (_ BitVec 32))) (Undefined!1642) (MissingVacant!1642 (index!8741 (_ BitVec 32))) )
))
(declare-fun lt!137491 () SeekEntryResult!1642)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275890 (= res!139879 (or (= lt!137491 (MissingZero!1642 i!1267)) (= lt!137491 (MissingVacant!1642 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13669 (_ BitVec 32)) SeekEntryResult!1642)

(assert (=> b!275890 (= lt!137491 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!275891 () Bool)

(declare-fun res!139883 () Bool)

(assert (=> b!275891 (=> (not res!139883) (not e!176349))))

(assert (=> b!275891 (= res!139883 (not (= startIndex!26 i!1267)))))

(declare-fun b!275892 () Bool)

(declare-fun res!139880 () Bool)

(assert (=> b!275892 (=> (not res!139880) (not e!176351))))

(declare-fun arrayContainsKey!0 (array!13669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275892 (= res!139880 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275893 () Bool)

(declare-fun res!139881 () Bool)

(assert (=> b!275893 (=> (not res!139881) (not e!176351))))

(assert (=> b!275893 (= res!139881 (and (= (size!6836 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6836 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6836 a!3325))))))

(declare-fun b!275894 () Bool)

(declare-fun res!139882 () Bool)

(assert (=> b!275894 (=> (not res!139882) (not e!176351))))

(declare-datatypes ((List!4292 0))(
  ( (Nil!4289) (Cons!4288 (h!4955 (_ BitVec 64)) (t!9374 List!4292)) )
))
(declare-fun arrayNoDuplicates!0 (array!13669 (_ BitVec 32) List!4292) Bool)

(assert (=> b!275894 (= res!139882 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4289))))

(declare-fun b!275895 () Bool)

(assert (=> b!275895 (= e!176349 (not (bvsle startIndex!26 (size!6836 a!3325))))))

(assert (=> b!275895 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13670 (store (arr!6484 a!3325) i!1267 k!2581) (size!6836 a!3325)) mask!3868)))

(declare-datatypes ((Unit!8699 0))(
  ( (Unit!8700) )
))
(declare-fun lt!137490 () Unit!8699)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13669 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8699)

(assert (=> b!275895 (= lt!137490 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!275896 () Bool)

(declare-fun res!139885 () Bool)

(assert (=> b!275896 (=> (not res!139885) (not e!176351))))

(assert (=> b!275896 (= res!139885 (validKeyInArray!0 k!2581))))

(declare-fun b!275897 () Bool)

(declare-fun res!139886 () Bool)

(assert (=> b!275897 (=> (not res!139886) (not e!176349))))

(assert (=> b!275897 (= res!139886 (and (bvslt startIndex!26 (bvsub (size!6836 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(assert (= (and start!26572 res!139878) b!275893))

(assert (= (and b!275893 res!139881) b!275896))

(assert (= (and b!275896 res!139885) b!275894))

(assert (= (and b!275894 res!139882) b!275892))

(assert (= (and b!275892 res!139880) b!275890))

(assert (= (and b!275890 res!139879) b!275889))

(assert (= (and b!275889 res!139887) b!275891))

(assert (= (and b!275891 res!139883) b!275888))

(assert (= (and b!275888 res!139884) b!275897))

(assert (= (and b!275897 res!139886) b!275895))

(declare-fun m!291357 () Bool)

(assert (=> b!275894 m!291357))

(declare-fun m!291359 () Bool)

(assert (=> b!275895 m!291359))

(declare-fun m!291361 () Bool)

(assert (=> b!275895 m!291361))

(declare-fun m!291363 () Bool)

(assert (=> b!275895 m!291363))

(declare-fun m!291365 () Bool)

(assert (=> b!275892 m!291365))

(declare-fun m!291367 () Bool)

(assert (=> b!275888 m!291367))

(assert (=> b!275888 m!291367))

(declare-fun m!291369 () Bool)

(assert (=> b!275888 m!291369))

(declare-fun m!291371 () Bool)

(assert (=> b!275889 m!291371))

(declare-fun m!291373 () Bool)

(assert (=> b!275896 m!291373))

(declare-fun m!291375 () Bool)

(assert (=> start!26572 m!291375))

(declare-fun m!291377 () Bool)

(assert (=> start!26572 m!291377))

(declare-fun m!291379 () Bool)

(assert (=> b!275890 m!291379))

(push 1)

(assert (not b!275892))

(assert (not b!275895))

(assert (not b!275888))

(assert (not b!275894))

(assert (not b!275890))

(assert (not start!26572))

(assert (not b!275889))

(assert (not b!275896))

(check-sat)

(pop 1)

(push 1)

(check-sat)

