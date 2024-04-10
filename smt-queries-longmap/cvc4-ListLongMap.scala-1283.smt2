; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26260 () Bool)

(assert start!26260)

(declare-fun b!271929 () Bool)

(declare-fun e!174684 () Bool)

(assert (=> b!271929 (= e!174684 (not true))))

(declare-datatypes ((array!13357 0))(
  ( (array!13358 (arr!6328 (Array (_ BitVec 32) (_ BitVec 64))) (size!6680 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13357)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun k!2581 () (_ BitVec 64))

(declare-datatypes ((List!4136 0))(
  ( (Nil!4133) (Cons!4132 (h!4799 (_ BitVec 64)) (t!9218 List!4136)) )
))
(declare-fun arrayNoDuplicates!0 (array!13357 (_ BitVec 32) List!4136) Bool)

(assert (=> b!271929 (arrayNoDuplicates!0 (array!13358 (store (arr!6328 a!3325) i!1267 k!2581) (size!6680 a!3325)) #b00000000000000000000000000000000 Nil!4133)))

(declare-datatypes ((Unit!8459 0))(
  ( (Unit!8460) )
))
(declare-fun lt!135889 () Unit!8459)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13357 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4136) Unit!8459)

(assert (=> b!271929 (= lt!135889 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4133))))

(declare-fun b!271930 () Bool)

(declare-fun res!135922 () Bool)

(declare-fun e!174686 () Bool)

(assert (=> b!271930 (=> (not res!135922) (not e!174686))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271930 (= res!135922 (validKeyInArray!0 k!2581))))

(declare-fun b!271931 () Bool)

(declare-fun res!135925 () Bool)

(assert (=> b!271931 (=> (not res!135925) (not e!174684))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!271931 (= res!135925 (not (= startIndex!26 i!1267)))))

(declare-fun b!271932 () Bool)

(declare-fun res!135924 () Bool)

(assert (=> b!271932 (=> (not res!135924) (not e!174686))))

(declare-fun arrayContainsKey!0 (array!13357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271932 (= res!135924 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271933 () Bool)

(declare-fun res!135920 () Bool)

(assert (=> b!271933 (=> (not res!135920) (not e!174684))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13357 (_ BitVec 32)) Bool)

(assert (=> b!271933 (= res!135920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271934 () Bool)

(assert (=> b!271934 (= e!174686 e!174684)))

(declare-fun res!135921 () Bool)

(assert (=> b!271934 (=> (not res!135921) (not e!174684))))

(declare-datatypes ((SeekEntryResult!1486 0))(
  ( (MissingZero!1486 (index!8114 (_ BitVec 32))) (Found!1486 (index!8115 (_ BitVec 32))) (Intermediate!1486 (undefined!2298 Bool) (index!8116 (_ BitVec 32)) (x!26435 (_ BitVec 32))) (Undefined!1486) (MissingVacant!1486 (index!8117 (_ BitVec 32))) )
))
(declare-fun lt!135888 () SeekEntryResult!1486)

(assert (=> b!271934 (= res!135921 (or (= lt!135888 (MissingZero!1486 i!1267)) (= lt!135888 (MissingVacant!1486 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13357 (_ BitVec 32)) SeekEntryResult!1486)

(assert (=> b!271934 (= lt!135888 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!271935 () Bool)

(declare-fun res!135927 () Bool)

(assert (=> b!271935 (=> (not res!135927) (not e!174686))))

(assert (=> b!271935 (= res!135927 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4133))))

(declare-fun b!271936 () Bool)

(declare-fun res!135926 () Bool)

(assert (=> b!271936 (=> (not res!135926) (not e!174686))))

(assert (=> b!271936 (= res!135926 (and (= (size!6680 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6680 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6680 a!3325))))))

(declare-fun res!135919 () Bool)

(assert (=> start!26260 (=> (not res!135919) (not e!174686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26260 (= res!135919 (validMask!0 mask!3868))))

(assert (=> start!26260 e!174686))

(declare-fun array_inv!4291 (array!13357) Bool)

(assert (=> start!26260 (array_inv!4291 a!3325)))

(assert (=> start!26260 true))

(declare-fun b!271937 () Bool)

(declare-fun res!135923 () Bool)

(assert (=> b!271937 (=> (not res!135923) (not e!174684))))

(assert (=> b!271937 (= res!135923 (validKeyInArray!0 (select (arr!6328 a!3325) startIndex!26)))))

(assert (= (and start!26260 res!135919) b!271936))

(assert (= (and b!271936 res!135926) b!271930))

(assert (= (and b!271930 res!135922) b!271935))

(assert (= (and b!271935 res!135927) b!271932))

(assert (= (and b!271932 res!135924) b!271934))

(assert (= (and b!271934 res!135921) b!271933))

(assert (= (and b!271933 res!135920) b!271931))

(assert (= (and b!271931 res!135925) b!271937))

(assert (= (and b!271937 res!135923) b!271929))

(declare-fun m!287085 () Bool)

(assert (=> b!271932 m!287085))

(declare-fun m!287087 () Bool)

(assert (=> b!271937 m!287087))

(assert (=> b!271937 m!287087))

(declare-fun m!287089 () Bool)

(assert (=> b!271937 m!287089))

(declare-fun m!287091 () Bool)

(assert (=> b!271934 m!287091))

(declare-fun m!287093 () Bool)

(assert (=> b!271933 m!287093))

(declare-fun m!287095 () Bool)

(assert (=> b!271935 m!287095))

(declare-fun m!287097 () Bool)

(assert (=> b!271929 m!287097))

(declare-fun m!287099 () Bool)

(assert (=> b!271929 m!287099))

(declare-fun m!287101 () Bool)

(assert (=> b!271929 m!287101))

(declare-fun m!287103 () Bool)

(assert (=> b!271930 m!287103))

(declare-fun m!287105 () Bool)

(assert (=> start!26260 m!287105))

(declare-fun m!287107 () Bool)

(assert (=> start!26260 m!287107))

(push 1)

(assert (not b!271934))

(assert (not b!271933))

