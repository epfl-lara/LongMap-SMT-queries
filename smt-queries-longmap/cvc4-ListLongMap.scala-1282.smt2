; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26254 () Bool)

(assert start!26254)

(declare-fun b!271848 () Bool)

(declare-fun res!135842 () Bool)

(declare-fun e!174659 () Bool)

(assert (=> b!271848 (=> (not res!135842) (not e!174659))))

(declare-datatypes ((array!13351 0))(
  ( (array!13352 (arr!6325 (Array (_ BitVec 32) (_ BitVec 64))) (size!6677 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13351)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!271848 (= res!135842 (and (= (size!6677 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6677 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6677 a!3325))))))

(declare-fun b!271849 () Bool)

(declare-fun res!135844 () Bool)

(assert (=> b!271849 (=> (not res!135844) (not e!174659))))

(declare-datatypes ((List!4133 0))(
  ( (Nil!4130) (Cons!4129 (h!4796 (_ BitVec 64)) (t!9215 List!4133)) )
))
(declare-fun arrayNoDuplicates!0 (array!13351 (_ BitVec 32) List!4133) Bool)

(assert (=> b!271849 (= res!135844 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4130))))

(declare-fun res!135841 () Bool)

(assert (=> start!26254 (=> (not res!135841) (not e!174659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26254 (= res!135841 (validMask!0 mask!3868))))

(assert (=> start!26254 e!174659))

(declare-fun array_inv!4288 (array!13351) Bool)

(assert (=> start!26254 (array_inv!4288 a!3325)))

(assert (=> start!26254 true))

(declare-fun b!271850 () Bool)

(declare-fun e!174657 () Bool)

(assert (=> b!271850 (= e!174659 e!174657)))

(declare-fun res!135839 () Bool)

(assert (=> b!271850 (=> (not res!135839) (not e!174657))))

(declare-datatypes ((SeekEntryResult!1483 0))(
  ( (MissingZero!1483 (index!8102 (_ BitVec 32))) (Found!1483 (index!8103 (_ BitVec 32))) (Intermediate!1483 (undefined!2295 Bool) (index!8104 (_ BitVec 32)) (x!26424 (_ BitVec 32))) (Undefined!1483) (MissingVacant!1483 (index!8105 (_ BitVec 32))) )
))
(declare-fun lt!135871 () SeekEntryResult!1483)

(assert (=> b!271850 (= res!135839 (or (= lt!135871 (MissingZero!1483 i!1267)) (= lt!135871 (MissingVacant!1483 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13351 (_ BitVec 32)) SeekEntryResult!1483)

(assert (=> b!271850 (= lt!135871 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!271851 () Bool)

(declare-fun res!135846 () Bool)

(assert (=> b!271851 (=> (not res!135846) (not e!174657))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271851 (= res!135846 (validKeyInArray!0 (select (arr!6325 a!3325) startIndex!26)))))

(declare-fun b!271852 () Bool)

(declare-fun res!135840 () Bool)

(assert (=> b!271852 (=> (not res!135840) (not e!174657))))

(assert (=> b!271852 (= res!135840 (not (= startIndex!26 i!1267)))))

(declare-fun b!271853 () Bool)

(assert (=> b!271853 (= e!174657 (not true))))

(assert (=> b!271853 (arrayNoDuplicates!0 (array!13352 (store (arr!6325 a!3325) i!1267 k!2581) (size!6677 a!3325)) #b00000000000000000000000000000000 Nil!4130)))

(declare-datatypes ((Unit!8453 0))(
  ( (Unit!8454) )
))
(declare-fun lt!135870 () Unit!8453)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13351 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4133) Unit!8453)

(assert (=> b!271853 (= lt!135870 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4130))))

(declare-fun b!271854 () Bool)

(declare-fun res!135843 () Bool)

(assert (=> b!271854 (=> (not res!135843) (not e!174659))))

(declare-fun arrayContainsKey!0 (array!13351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271854 (= res!135843 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271855 () Bool)

(declare-fun res!135845 () Bool)

(assert (=> b!271855 (=> (not res!135845) (not e!174659))))

(assert (=> b!271855 (= res!135845 (validKeyInArray!0 k!2581))))

(declare-fun b!271856 () Bool)

(declare-fun res!135838 () Bool)

(assert (=> b!271856 (=> (not res!135838) (not e!174657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13351 (_ BitVec 32)) Bool)

(assert (=> b!271856 (= res!135838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26254 res!135841) b!271848))

(assert (= (and b!271848 res!135842) b!271855))

(assert (= (and b!271855 res!135845) b!271849))

(assert (= (and b!271849 res!135844) b!271854))

(assert (= (and b!271854 res!135843) b!271850))

(assert (= (and b!271850 res!135839) b!271856))

(assert (= (and b!271856 res!135838) b!271852))

(assert (= (and b!271852 res!135840) b!271851))

(assert (= (and b!271851 res!135846) b!271853))

(declare-fun m!287013 () Bool)

(assert (=> b!271850 m!287013))

(declare-fun m!287015 () Bool)

(assert (=> b!271854 m!287015))

(declare-fun m!287017 () Bool)

(assert (=> b!271855 m!287017))

(declare-fun m!287019 () Bool)

(assert (=> b!271849 m!287019))

(declare-fun m!287021 () Bool)

(assert (=> b!271856 m!287021))

(declare-fun m!287023 () Bool)

(assert (=> b!271851 m!287023))

(assert (=> b!271851 m!287023))

(declare-fun m!287025 () Bool)

(assert (=> b!271851 m!287025))

(declare-fun m!287027 () Bool)

(assert (=> b!271853 m!287027))

(declare-fun m!287029 () Bool)

(assert (=> b!271853 m!287029))

(declare-fun m!287031 () Bool)

(assert (=> b!271853 m!287031))

(declare-fun m!287033 () Bool)

(assert (=> start!26254 m!287033))

(declare-fun m!287035 () Bool)

(assert (=> start!26254 m!287035))

(push 1)

(assert (not b!271850))

(assert (not b!271856))

