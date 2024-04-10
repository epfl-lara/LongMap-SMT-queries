; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26166 () Bool)

(assert start!26166)

(declare-fun b!270239 () Bool)

(declare-fun res!134283 () Bool)

(declare-fun e!174213 () Bool)

(assert (=> b!270239 (=> (not res!134283) (not e!174213))))

(declare-datatypes ((array!13263 0))(
  ( (array!13264 (arr!6281 (Array (_ BitVec 32) (_ BitVec 64))) (size!6633 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13263)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!270239 (= res!134283 (and (= (size!6633 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6633 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6633 a!3325))))))

(declare-fun b!270240 () Bool)

(declare-datatypes ((Unit!8422 0))(
  ( (Unit!8423) )
))
(declare-fun e!174212 () Unit!8422)

(declare-fun Unit!8424 () Unit!8422)

(assert (=> b!270240 (= e!174212 Unit!8424)))

(declare-fun b!270241 () Bool)

(declare-fun e!174214 () Bool)

(assert (=> b!270241 (= e!174213 e!174214)))

(declare-fun res!134285 () Bool)

(assert (=> b!270241 (=> (not res!134285) (not e!174214))))

(declare-datatypes ((SeekEntryResult!1439 0))(
  ( (MissingZero!1439 (index!7926 (_ BitVec 32))) (Found!1439 (index!7927 (_ BitVec 32))) (Intermediate!1439 (undefined!2251 Bool) (index!7928 (_ BitVec 32)) (x!26268 (_ BitVec 32))) (Undefined!1439) (MissingVacant!1439 (index!7929 (_ BitVec 32))) )
))
(declare-fun lt!135533 () SeekEntryResult!1439)

(assert (=> b!270241 (= res!134285 (or (= lt!135533 (MissingZero!1439 i!1267)) (= lt!135533 (MissingVacant!1439 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13263 (_ BitVec 32)) SeekEntryResult!1439)

(assert (=> b!270241 (= lt!135533 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!270242 () Bool)

(declare-fun e!174211 () Bool)

(assert (=> b!270242 (= e!174214 e!174211)))

(declare-fun res!134281 () Bool)

(assert (=> b!270242 (=> (not res!134281) (not e!174211))))

(assert (=> b!270242 (= res!134281 (= startIndex!26 i!1267))))

(declare-fun lt!135531 () array!13263)

(assert (=> b!270242 (= lt!135531 (array!13264 (store (arr!6281 a!3325) i!1267 k!2581) (size!6633 a!3325)))))

(declare-fun b!270243 () Bool)

(declare-fun res!134280 () Bool)

(assert (=> b!270243 (=> (not res!134280) (not e!174214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13263 (_ BitVec 32)) Bool)

(assert (=> b!270243 (= res!134280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270244 () Bool)

(declare-fun lt!135535 () Unit!8422)

(assert (=> b!270244 (= e!174212 lt!135535)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13263 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8422)

(assert (=> b!270244 (= lt!135535 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!270244 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135531 mask!3868)))

(declare-fun b!270245 () Bool)

(assert (=> b!270245 (= e!174211 (not true))))

(assert (=> b!270245 (= (seekEntryOrOpen!0 k!2581 lt!135531 mask!3868) (Found!1439 i!1267))))

(declare-fun lt!135534 () Unit!8422)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13263 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8422)

(assert (=> b!270245 (= lt!135534 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k!2581 mask!3868))))

(declare-fun lt!135532 () Unit!8422)

(assert (=> b!270245 (= lt!135532 e!174212)))

(declare-fun c!45531 () Bool)

(assert (=> b!270245 (= c!45531 (bvslt startIndex!26 (bvsub (size!6633 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!270247 () Bool)

(declare-fun res!134286 () Bool)

(assert (=> b!270247 (=> (not res!134286) (not e!174213))))

(declare-fun arrayContainsKey!0 (array!13263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270247 (= res!134286 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270248 () Bool)

(declare-fun res!134282 () Bool)

(assert (=> b!270248 (=> (not res!134282) (not e!174213))))

(declare-datatypes ((List!4089 0))(
  ( (Nil!4086) (Cons!4085 (h!4752 (_ BitVec 64)) (t!9171 List!4089)) )
))
(declare-fun arrayNoDuplicates!0 (array!13263 (_ BitVec 32) List!4089) Bool)

(assert (=> b!270248 (= res!134282 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4086))))

(declare-fun b!270246 () Bool)

(declare-fun res!134284 () Bool)

(assert (=> b!270246 (=> (not res!134284) (not e!174213))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270246 (= res!134284 (validKeyInArray!0 k!2581))))

(declare-fun res!134279 () Bool)

(assert (=> start!26166 (=> (not res!134279) (not e!174213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26166 (= res!134279 (validMask!0 mask!3868))))

(assert (=> start!26166 e!174213))

(declare-fun array_inv!4244 (array!13263) Bool)

(assert (=> start!26166 (array_inv!4244 a!3325)))

(assert (=> start!26166 true))

(assert (= (and start!26166 res!134279) b!270239))

(assert (= (and b!270239 res!134283) b!270246))

(assert (= (and b!270246 res!134284) b!270248))

(assert (= (and b!270248 res!134282) b!270247))

(assert (= (and b!270247 res!134286) b!270241))

(assert (= (and b!270241 res!134285) b!270243))

(assert (= (and b!270243 res!134280) b!270242))

(assert (= (and b!270242 res!134281) b!270245))

(assert (= (and b!270245 c!45531) b!270244))

(assert (= (and b!270245 (not c!45531)) b!270240))

(declare-fun m!285891 () Bool)

(assert (=> b!270244 m!285891))

(declare-fun m!285893 () Bool)

(assert (=> b!270244 m!285893))

(declare-fun m!285895 () Bool)

(assert (=> b!270242 m!285895))

(declare-fun m!285897 () Bool)

(assert (=> b!270247 m!285897))

(declare-fun m!285899 () Bool)

(assert (=> start!26166 m!285899))

(declare-fun m!285901 () Bool)

(assert (=> start!26166 m!285901))

(declare-fun m!285903 () Bool)

(assert (=> b!270243 m!285903))

(declare-fun m!285905 () Bool)

(assert (=> b!270246 m!285905))

(declare-fun m!285907 () Bool)

(assert (=> b!270241 m!285907))

(declare-fun m!285909 () Bool)

(assert (=> b!270248 m!285909))

(declare-fun m!285911 () Bool)

(assert (=> b!270245 m!285911))

(declare-fun m!285913 () Bool)

(assert (=> b!270245 m!285913))

(push 1)

