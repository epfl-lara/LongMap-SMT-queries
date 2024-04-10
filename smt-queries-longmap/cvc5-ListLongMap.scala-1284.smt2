; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26262 () Bool)

(assert start!26262)

(declare-fun b!271956 () Bool)

(declare-fun e!174694 () Bool)

(declare-fun e!174693 () Bool)

(assert (=> b!271956 (= e!174694 e!174693)))

(declare-fun res!135950 () Bool)

(assert (=> b!271956 (=> (not res!135950) (not e!174693))))

(declare-datatypes ((SeekEntryResult!1487 0))(
  ( (MissingZero!1487 (index!8118 (_ BitVec 32))) (Found!1487 (index!8119 (_ BitVec 32))) (Intermediate!1487 (undefined!2299 Bool) (index!8120 (_ BitVec 32)) (x!26444 (_ BitVec 32))) (Undefined!1487) (MissingVacant!1487 (index!8121 (_ BitVec 32))) )
))
(declare-fun lt!135895 () SeekEntryResult!1487)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271956 (= res!135950 (or (= lt!135895 (MissingZero!1487 i!1267)) (= lt!135895 (MissingVacant!1487 i!1267))))))

(declare-datatypes ((array!13359 0))(
  ( (array!13360 (arr!6329 (Array (_ BitVec 32) (_ BitVec 64))) (size!6681 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13359)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13359 (_ BitVec 32)) SeekEntryResult!1487)

(assert (=> b!271956 (= lt!135895 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!271957 () Bool)

(assert (=> b!271957 (= e!174693 (not true))))

(declare-datatypes ((List!4137 0))(
  ( (Nil!4134) (Cons!4133 (h!4800 (_ BitVec 64)) (t!9219 List!4137)) )
))
(declare-fun arrayNoDuplicates!0 (array!13359 (_ BitVec 32) List!4137) Bool)

(assert (=> b!271957 (arrayNoDuplicates!0 (array!13360 (store (arr!6329 a!3325) i!1267 k!2581) (size!6681 a!3325)) #b00000000000000000000000000000000 Nil!4134)))

(declare-datatypes ((Unit!8461 0))(
  ( (Unit!8462) )
))
(declare-fun lt!135894 () Unit!8461)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13359 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4137) Unit!8461)

(assert (=> b!271957 (= lt!135894 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4134))))

(declare-fun b!271958 () Bool)

(declare-fun res!135951 () Bool)

(assert (=> b!271958 (=> (not res!135951) (not e!174694))))

(assert (=> b!271958 (= res!135951 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4134))))

(declare-fun b!271959 () Bool)

(declare-fun res!135947 () Bool)

(assert (=> b!271959 (=> (not res!135947) (not e!174694))))

(declare-fun arrayContainsKey!0 (array!13359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271959 (= res!135947 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271960 () Bool)

(declare-fun res!135952 () Bool)

(assert (=> b!271960 (=> (not res!135952) (not e!174693))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13359 (_ BitVec 32)) Bool)

(assert (=> b!271960 (= res!135952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271961 () Bool)

(declare-fun res!135949 () Bool)

(assert (=> b!271961 (=> (not res!135949) (not e!174693))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271961 (= res!135949 (validKeyInArray!0 (select (arr!6329 a!3325) startIndex!26)))))

(declare-fun b!271962 () Bool)

(declare-fun res!135946 () Bool)

(assert (=> b!271962 (=> (not res!135946) (not e!174694))))

(assert (=> b!271962 (= res!135946 (and (= (size!6681 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6681 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6681 a!3325))))))

(declare-fun res!135954 () Bool)

(assert (=> start!26262 (=> (not res!135954) (not e!174694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26262 (= res!135954 (validMask!0 mask!3868))))

(assert (=> start!26262 e!174694))

(declare-fun array_inv!4292 (array!13359) Bool)

(assert (=> start!26262 (array_inv!4292 a!3325)))

(assert (=> start!26262 true))

(declare-fun b!271963 () Bool)

(declare-fun res!135953 () Bool)

(assert (=> b!271963 (=> (not res!135953) (not e!174694))))

(assert (=> b!271963 (= res!135953 (validKeyInArray!0 k!2581))))

(declare-fun b!271964 () Bool)

(declare-fun res!135948 () Bool)

(assert (=> b!271964 (=> (not res!135948) (not e!174693))))

(assert (=> b!271964 (= res!135948 (not (= startIndex!26 i!1267)))))

(assert (= (and start!26262 res!135954) b!271962))

(assert (= (and b!271962 res!135946) b!271963))

(assert (= (and b!271963 res!135953) b!271958))

(assert (= (and b!271958 res!135951) b!271959))

(assert (= (and b!271959 res!135947) b!271956))

(assert (= (and b!271956 res!135950) b!271960))

(assert (= (and b!271960 res!135952) b!271964))

(assert (= (and b!271964 res!135948) b!271961))

(assert (= (and b!271961 res!135949) b!271957))

(declare-fun m!287109 () Bool)

(assert (=> b!271959 m!287109))

(declare-fun m!287111 () Bool)

(assert (=> b!271961 m!287111))

(assert (=> b!271961 m!287111))

(declare-fun m!287113 () Bool)

(assert (=> b!271961 m!287113))

(declare-fun m!287115 () Bool)

(assert (=> b!271957 m!287115))

(declare-fun m!287117 () Bool)

(assert (=> b!271957 m!287117))

(declare-fun m!287119 () Bool)

(assert (=> b!271957 m!287119))

(declare-fun m!287121 () Bool)

(assert (=> b!271956 m!287121))

(declare-fun m!287123 () Bool)

(assert (=> b!271963 m!287123))

(declare-fun m!287125 () Bool)

(assert (=> start!26262 m!287125))

(declare-fun m!287127 () Bool)

(assert (=> start!26262 m!287127))

(declare-fun m!287129 () Bool)

(assert (=> b!271958 m!287129))

(declare-fun m!287131 () Bool)

(assert (=> b!271960 m!287131))

(push 1)

