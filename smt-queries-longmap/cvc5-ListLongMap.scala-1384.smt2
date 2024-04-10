; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27156 () Bool)

(assert start!27156)

(declare-fun b!280932 () Bool)

(declare-fun res!144002 () Bool)

(declare-fun e!178705 () Bool)

(assert (=> b!280932 (=> (not res!144002) (not e!178705))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280932 (= res!144002 (not (= startIndex!26 i!1267)))))

(declare-fun b!280933 () Bool)

(declare-fun res!144008 () Bool)

(declare-fun e!178704 () Bool)

(assert (=> b!280933 (=> (not res!144008) (not e!178704))))

(declare-datatypes ((array!13974 0))(
  ( (array!13975 (arr!6629 (Array (_ BitVec 32) (_ BitVec 64))) (size!6981 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13974)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13974 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280933 (= res!144008 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280934 () Bool)

(assert (=> b!280934 (= e!178704 e!178705)))

(declare-fun res!144004 () Bool)

(assert (=> b!280934 (=> (not res!144004) (not e!178705))))

(declare-datatypes ((SeekEntryResult!1787 0))(
  ( (MissingZero!1787 (index!9318 (_ BitVec 32))) (Found!1787 (index!9319 (_ BitVec 32))) (Intermediate!1787 (undefined!2599 Bool) (index!9320 (_ BitVec 32)) (x!27553 (_ BitVec 32))) (Undefined!1787) (MissingVacant!1787 (index!9321 (_ BitVec 32))) )
))
(declare-fun lt!138937 () SeekEntryResult!1787)

(assert (=> b!280934 (= res!144004 (or (= lt!138937 (MissingZero!1787 i!1267)) (= lt!138937 (MissingVacant!1787 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13974 (_ BitVec 32)) SeekEntryResult!1787)

(assert (=> b!280934 (= lt!138937 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!280935 () Bool)

(declare-fun res!144007 () Bool)

(assert (=> b!280935 (=> (not res!144007) (not e!178705))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280935 (= res!144007 (validKeyInArray!0 (select (arr!6629 a!3325) startIndex!26)))))

(declare-fun b!280936 () Bool)

(declare-fun res!144009 () Bool)

(assert (=> b!280936 (=> (not res!144009) (not e!178704))))

(assert (=> b!280936 (= res!144009 (and (= (size!6981 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6981 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6981 a!3325))))))

(declare-fun b!280937 () Bool)

(assert (=> b!280937 (= e!178705 (not (not (= i!1267 startIndex!26))))))

(declare-datatypes ((List!4437 0))(
  ( (Nil!4434) (Cons!4433 (h!5103 (_ BitVec 64)) (t!9519 List!4437)) )
))
(declare-fun arrayNoDuplicates!0 (array!13974 (_ BitVec 32) List!4437) Bool)

(assert (=> b!280937 (arrayNoDuplicates!0 (array!13975 (store (arr!6629 a!3325) i!1267 k!2581) (size!6981 a!3325)) #b00000000000000000000000000000000 Nil!4434)))

(declare-datatypes ((Unit!8858 0))(
  ( (Unit!8859) )
))
(declare-fun lt!138936 () Unit!8858)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13974 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4437) Unit!8858)

(assert (=> b!280937 (= lt!138936 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4434))))

(declare-fun b!280938 () Bool)

(declare-fun res!144001 () Bool)

(assert (=> b!280938 (=> (not res!144001) (not e!178704))))

(assert (=> b!280938 (= res!144001 (validKeyInArray!0 k!2581))))

(declare-fun b!280939 () Bool)

(declare-fun res!144006 () Bool)

(assert (=> b!280939 (=> (not res!144006) (not e!178705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13974 (_ BitVec 32)) Bool)

(assert (=> b!280939 (= res!144006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!144003 () Bool)

(assert (=> start!27156 (=> (not res!144003) (not e!178704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27156 (= res!144003 (validMask!0 mask!3868))))

(assert (=> start!27156 e!178704))

(declare-fun array_inv!4592 (array!13974) Bool)

(assert (=> start!27156 (array_inv!4592 a!3325)))

(assert (=> start!27156 true))

(declare-fun b!280940 () Bool)

(declare-fun res!144005 () Bool)

(assert (=> b!280940 (=> (not res!144005) (not e!178704))))

(assert (=> b!280940 (= res!144005 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4434))))

(assert (= (and start!27156 res!144003) b!280936))

(assert (= (and b!280936 res!144009) b!280938))

(assert (= (and b!280938 res!144001) b!280940))

(assert (= (and b!280940 res!144005) b!280933))

(assert (= (and b!280933 res!144008) b!280934))

(assert (= (and b!280934 res!144004) b!280939))

(assert (= (and b!280939 res!144006) b!280932))

(assert (= (and b!280932 res!144002) b!280935))

(assert (= (and b!280935 res!144007) b!280937))

(declare-fun m!295311 () Bool)

(assert (=> b!280934 m!295311))

(declare-fun m!295313 () Bool)

(assert (=> b!280938 m!295313))

(declare-fun m!295315 () Bool)

(assert (=> b!280937 m!295315))

(declare-fun m!295317 () Bool)

(assert (=> b!280937 m!295317))

(declare-fun m!295319 () Bool)

(assert (=> b!280937 m!295319))

(declare-fun m!295321 () Bool)

(assert (=> b!280935 m!295321))

(assert (=> b!280935 m!295321))

(declare-fun m!295323 () Bool)

(assert (=> b!280935 m!295323))

(declare-fun m!295325 () Bool)

(assert (=> start!27156 m!295325))

(declare-fun m!295327 () Bool)

(assert (=> start!27156 m!295327))

(declare-fun m!295329 () Bool)

(assert (=> b!280940 m!295329))

(declare-fun m!295331 () Bool)

(assert (=> b!280933 m!295331))

(declare-fun m!295333 () Bool)

(assert (=> b!280939 m!295333))

(push 1)

