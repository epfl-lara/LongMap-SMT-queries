; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26576 () Bool)

(assert start!26576)

(declare-fun b!275928 () Bool)

(declare-fun res!139923 () Bool)

(declare-fun e!176368 () Bool)

(assert (=> b!275928 (=> (not res!139923) (not e!176368))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275928 (= res!139923 (validKeyInArray!0 k0!2581))))

(declare-fun b!275929 () Bool)

(declare-fun res!139918 () Bool)

(assert (=> b!275929 (=> (not res!139918) (not e!176368))))

(declare-datatypes ((array!13673 0))(
  ( (array!13674 (arr!6486 (Array (_ BitVec 32) (_ BitVec 64))) (size!6838 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13673)

(declare-datatypes ((List!4294 0))(
  ( (Nil!4291) (Cons!4290 (h!4957 (_ BitVec 64)) (t!9376 List!4294)) )
))
(declare-fun arrayNoDuplicates!0 (array!13673 (_ BitVec 32) List!4294) Bool)

(assert (=> b!275929 (= res!139918 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4291))))

(declare-fun res!139921 () Bool)

(assert (=> start!26576 (=> (not res!139921) (not e!176368))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26576 (= res!139921 (validMask!0 mask!3868))))

(assert (=> start!26576 e!176368))

(declare-fun array_inv!4449 (array!13673) Bool)

(assert (=> start!26576 (array_inv!4449 a!3325)))

(assert (=> start!26576 true))

(declare-fun b!275930 () Bool)

(declare-fun e!176367 () Bool)

(assert (=> b!275930 (= e!176367 false)))

(declare-fun lt!137503 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13673 (_ BitVec 32)) Bool)

(assert (=> b!275930 (= lt!137503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275931 () Bool)

(declare-fun res!139922 () Bool)

(assert (=> b!275931 (=> (not res!139922) (not e!176368))))

(declare-fun arrayContainsKey!0 (array!13673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275931 (= res!139922 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275932 () Bool)

(declare-fun res!139919 () Bool)

(assert (=> b!275932 (=> (not res!139919) (not e!176368))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275932 (= res!139919 (and (= (size!6838 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6838 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6838 a!3325))))))

(declare-fun b!275933 () Bool)

(assert (=> b!275933 (= e!176368 e!176367)))

(declare-fun res!139920 () Bool)

(assert (=> b!275933 (=> (not res!139920) (not e!176367))))

(declare-datatypes ((SeekEntryResult!1644 0))(
  ( (MissingZero!1644 (index!8746 (_ BitVec 32))) (Found!1644 (index!8747 (_ BitVec 32))) (Intermediate!1644 (undefined!2456 Bool) (index!8748 (_ BitVec 32)) (x!27017 (_ BitVec 32))) (Undefined!1644) (MissingVacant!1644 (index!8749 (_ BitVec 32))) )
))
(declare-fun lt!137502 () SeekEntryResult!1644)

(assert (=> b!275933 (= res!139920 (or (= lt!137502 (MissingZero!1644 i!1267)) (= lt!137502 (MissingVacant!1644 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13673 (_ BitVec 32)) SeekEntryResult!1644)

(assert (=> b!275933 (= lt!137502 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26576 res!139921) b!275932))

(assert (= (and b!275932 res!139919) b!275928))

(assert (= (and b!275928 res!139923) b!275929))

(assert (= (and b!275929 res!139918) b!275931))

(assert (= (and b!275931 res!139922) b!275933))

(assert (= (and b!275933 res!139920) b!275930))

(declare-fun m!291395 () Bool)

(assert (=> b!275930 m!291395))

(declare-fun m!291397 () Bool)

(assert (=> b!275928 m!291397))

(declare-fun m!291399 () Bool)

(assert (=> b!275931 m!291399))

(declare-fun m!291401 () Bool)

(assert (=> start!26576 m!291401))

(declare-fun m!291403 () Bool)

(assert (=> start!26576 m!291403))

(declare-fun m!291405 () Bool)

(assert (=> b!275933 m!291405))

(declare-fun m!291407 () Bool)

(assert (=> b!275929 m!291407))

(check-sat (not b!275931) (not start!26576) (not b!275929) (not b!275928) (not b!275930) (not b!275933))
(check-sat)
