; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26694 () Bool)

(assert start!26694)

(declare-fun b!277088 () Bool)

(declare-fun e!176911 () Bool)

(declare-fun e!176912 () Bool)

(assert (=> b!277088 (= e!176911 e!176912)))

(declare-fun res!141058 () Bool)

(assert (=> b!277088 (=> (not res!141058) (not e!176912))))

(declare-datatypes ((SeekEntryResult!1703 0))(
  ( (MissingZero!1703 (index!8982 (_ BitVec 32))) (Found!1703 (index!8983 (_ BitVec 32))) (Intermediate!1703 (undefined!2515 Bool) (index!8984 (_ BitVec 32)) (x!27236 (_ BitVec 32))) (Undefined!1703) (MissingVacant!1703 (index!8985 (_ BitVec 32))) )
))
(declare-fun lt!137831 () SeekEntryResult!1703)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!277088 (= res!141058 (or (= lt!137831 (MissingZero!1703 i!1267)) (= lt!137831 (MissingVacant!1703 i!1267))))))

(declare-datatypes ((array!13791 0))(
  ( (array!13792 (arr!6545 (Array (_ BitVec 32) (_ BitVec 64))) (size!6897 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13791)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13791 (_ BitVec 32)) SeekEntryResult!1703)

(assert (=> b!277088 (= lt!137831 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!141063 () Bool)

(assert (=> start!26694 (=> (not res!141063) (not e!176911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26694 (= res!141063 (validMask!0 mask!3868))))

(assert (=> start!26694 e!176911))

(declare-fun array_inv!4508 (array!13791) Bool)

(assert (=> start!26694 (array_inv!4508 a!3325)))

(assert (=> start!26694 true))

(declare-fun b!277089 () Bool)

(declare-fun res!141062 () Bool)

(assert (=> b!277089 (=> (not res!141062) (not e!176911))))

(declare-datatypes ((List!4353 0))(
  ( (Nil!4350) (Cons!4349 (h!5016 (_ BitVec 64)) (t!9435 List!4353)) )
))
(declare-fun arrayNoDuplicates!0 (array!13791 (_ BitVec 32) List!4353) Bool)

(assert (=> b!277089 (= res!141062 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4350))))

(declare-fun b!277090 () Bool)

(declare-datatypes ((Unit!8710 0))(
  ( (Unit!8711) )
))
(declare-fun e!176909 () Unit!8710)

(declare-fun lt!137833 () Unit!8710)

(assert (=> b!277090 (= e!176909 lt!137833)))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13791 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8710)

(assert (=> b!277090 (= lt!137833 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13791 (_ BitVec 32)) Bool)

(assert (=> b!277090 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13792 (store (arr!6545 a!3325) i!1267 k!2581) (size!6897 a!3325)) mask!3868)))

(declare-fun b!277091 () Bool)

(declare-fun res!141060 () Bool)

(assert (=> b!277091 (=> (not res!141060) (not e!176911))))

(declare-fun arrayContainsKey!0 (array!13791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277091 (= res!141060 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277092 () Bool)

(declare-fun Unit!8712 () Unit!8710)

(assert (=> b!277092 (= e!176909 Unit!8712)))

(declare-fun b!277093 () Bool)

(declare-fun res!141061 () Bool)

(assert (=> b!277093 (=> (not res!141061) (not e!176912))))

(assert (=> b!277093 (= res!141061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277094 () Bool)

(assert (=> b!277094 (= e!176912 false)))

(declare-fun lt!137832 () Unit!8710)

(assert (=> b!277094 (= lt!137832 e!176909)))

(declare-fun c!45567 () Bool)

(assert (=> b!277094 (= c!45567 (bvslt startIndex!26 (bvsub (size!6897 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277095 () Bool)

(declare-fun res!141056 () Bool)

(assert (=> b!277095 (=> (not res!141056) (not e!176911))))

(assert (=> b!277095 (= res!141056 (and (= (size!6897 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6897 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6897 a!3325))))))

(declare-fun b!277096 () Bool)

(declare-fun res!141057 () Bool)

(assert (=> b!277096 (=> (not res!141057) (not e!176912))))

(assert (=> b!277096 (= res!141057 (= startIndex!26 i!1267))))

(declare-fun b!277097 () Bool)

(declare-fun res!141059 () Bool)

(assert (=> b!277097 (=> (not res!141059) (not e!176911))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277097 (= res!141059 (validKeyInArray!0 k!2581))))

(assert (= (and start!26694 res!141063) b!277095))

(assert (= (and b!277095 res!141056) b!277097))

(assert (= (and b!277097 res!141059) b!277089))

(assert (= (and b!277089 res!141062) b!277091))

(assert (= (and b!277091 res!141060) b!277088))

(assert (= (and b!277088 res!141058) b!277093))

(assert (= (and b!277093 res!141061) b!277096))

(assert (= (and b!277096 res!141057) b!277094))

(assert (= (and b!277094 c!45567) b!277090))

(assert (= (and b!277094 (not c!45567)) b!277092))

(declare-fun m!292251 () Bool)

(assert (=> b!277097 m!292251))

(declare-fun m!292253 () Bool)

(assert (=> b!277093 m!292253))

(declare-fun m!292255 () Bool)

(assert (=> b!277090 m!292255))

(declare-fun m!292257 () Bool)

(assert (=> b!277090 m!292257))

(declare-fun m!292259 () Bool)

(assert (=> b!277090 m!292259))

(declare-fun m!292261 () Bool)

(assert (=> b!277091 m!292261))

(declare-fun m!292263 () Bool)

(assert (=> start!26694 m!292263))

(declare-fun m!292265 () Bool)

(assert (=> start!26694 m!292265))

(declare-fun m!292267 () Bool)

(assert (=> b!277088 m!292267))

(declare-fun m!292269 () Bool)

(assert (=> b!277089 m!292269))

(push 1)

