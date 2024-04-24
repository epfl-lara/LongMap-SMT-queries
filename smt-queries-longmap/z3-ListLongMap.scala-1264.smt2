; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26142 () Bool)

(assert start!26142)

(declare-fun b!269927 () Bool)

(declare-fun e!174058 () Bool)

(declare-fun e!174055 () Bool)

(assert (=> b!269927 (= e!174058 e!174055)))

(declare-fun res!134012 () Bool)

(assert (=> b!269927 (=> (not res!134012) (not e!174055))))

(declare-datatypes ((SeekEntryResult!1391 0))(
  ( (MissingZero!1391 (index!7734 (_ BitVec 32))) (Found!1391 (index!7735 (_ BitVec 32))) (Intermediate!1391 (undefined!2203 Bool) (index!7736 (_ BitVec 32)) (x!26188 (_ BitVec 32))) (Undefined!1391) (MissingVacant!1391 (index!7737 (_ BitVec 32))) )
))
(declare-fun lt!135414 () SeekEntryResult!1391)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269927 (= res!134012 (or (= lt!135414 (MissingZero!1391 i!1267)) (= lt!135414 (MissingVacant!1391 i!1267))))))

(declare-datatypes ((array!13238 0))(
  ( (array!13239 (arr!6268 (Array (_ BitVec 32) (_ BitVec 64))) (size!6620 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13238)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13238 (_ BitVec 32)) SeekEntryResult!1391)

(assert (=> b!269927 (= lt!135414 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!269928 () Bool)

(declare-fun e!174056 () Bool)

(assert (=> b!269928 (= e!174055 e!174056)))

(declare-fun res!134014 () Bool)

(assert (=> b!269928 (=> (not res!134014) (not e!174056))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!269928 (= res!134014 (= startIndex!26 i!1267))))

(declare-fun lt!135413 () array!13238)

(assert (=> b!269928 (= lt!135413 (array!13239 (store (arr!6268 a!3325) i!1267 k0!2581) (size!6620 a!3325)))))

(declare-fun b!269929 () Bool)

(assert (=> b!269929 (= e!174056 (not (bvsge mask!3868 #b00000000000000000000000000000000)))))

(assert (=> b!269929 (= (seekEntryOrOpen!0 k0!2581 lt!135413 mask!3868) (Found!1391 i!1267))))

(declare-datatypes ((Unit!8366 0))(
  ( (Unit!8367) )
))
(declare-fun lt!135412 () Unit!8366)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13238 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8366)

(assert (=> b!269929 (= lt!135412 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!135411 () Unit!8366)

(declare-fun e!174059 () Unit!8366)

(assert (=> b!269929 (= lt!135411 e!174059)))

(declare-fun c!45508 () Bool)

(assert (=> b!269929 (= c!45508 (bvslt startIndex!26 (bvsub (size!6620 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269930 () Bool)

(declare-fun res!134018 () Bool)

(assert (=> b!269930 (=> (not res!134018) (not e!174058))))

(declare-datatypes ((List!3989 0))(
  ( (Nil!3986) (Cons!3985 (h!4652 (_ BitVec 64)) (t!9063 List!3989)) )
))
(declare-fun arrayNoDuplicates!0 (array!13238 (_ BitVec 32) List!3989) Bool)

(assert (=> b!269930 (= res!134018 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3986))))

(declare-fun b!269931 () Bool)

(declare-fun res!134017 () Bool)

(assert (=> b!269931 (=> (not res!134017) (not e!174058))))

(assert (=> b!269931 (= res!134017 (and (= (size!6620 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6620 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6620 a!3325))))))

(declare-fun b!269932 () Bool)

(declare-fun res!134019 () Bool)

(assert (=> b!269932 (=> (not res!134019) (not e!174058))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269932 (= res!134019 (validKeyInArray!0 k0!2581))))

(declare-fun b!269933 () Bool)

(declare-fun res!134013 () Bool)

(assert (=> b!269933 (=> (not res!134013) (not e!174055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13238 (_ BitVec 32)) Bool)

(assert (=> b!269933 (= res!134013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269934 () Bool)

(declare-fun res!134016 () Bool)

(assert (=> b!269934 (=> (not res!134016) (not e!174058))))

(declare-fun arrayContainsKey!0 (array!13238 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269934 (= res!134016 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269935 () Bool)

(declare-fun lt!135410 () Unit!8366)

(assert (=> b!269935 (= e!174059 lt!135410)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13238 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8366)

(assert (=> b!269935 (= lt!135410 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!269935 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135413 mask!3868)))

(declare-fun res!134015 () Bool)

(assert (=> start!26142 (=> (not res!134015) (not e!174058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26142 (= res!134015 (validMask!0 mask!3868))))

(assert (=> start!26142 e!174058))

(declare-fun array_inv!4218 (array!13238) Bool)

(assert (=> start!26142 (array_inv!4218 a!3325)))

(assert (=> start!26142 true))

(declare-fun b!269926 () Bool)

(declare-fun Unit!8368 () Unit!8366)

(assert (=> b!269926 (= e!174059 Unit!8368)))

(assert (= (and start!26142 res!134015) b!269931))

(assert (= (and b!269931 res!134017) b!269932))

(assert (= (and b!269932 res!134019) b!269930))

(assert (= (and b!269930 res!134018) b!269934))

(assert (= (and b!269934 res!134016) b!269927))

(assert (= (and b!269927 res!134012) b!269933))

(assert (= (and b!269933 res!134013) b!269928))

(assert (= (and b!269928 res!134014) b!269929))

(assert (= (and b!269929 c!45508) b!269935))

(assert (= (and b!269929 (not c!45508)) b!269926))

(declare-fun m!285809 () Bool)

(assert (=> b!269928 m!285809))

(declare-fun m!285811 () Bool)

(assert (=> b!269927 m!285811))

(declare-fun m!285813 () Bool)

(assert (=> b!269935 m!285813))

(declare-fun m!285815 () Bool)

(assert (=> b!269935 m!285815))

(declare-fun m!285817 () Bool)

(assert (=> b!269932 m!285817))

(declare-fun m!285819 () Bool)

(assert (=> b!269930 m!285819))

(declare-fun m!285821 () Bool)

(assert (=> b!269934 m!285821))

(declare-fun m!285823 () Bool)

(assert (=> b!269933 m!285823))

(declare-fun m!285825 () Bool)

(assert (=> b!269929 m!285825))

(declare-fun m!285827 () Bool)

(assert (=> b!269929 m!285827))

(declare-fun m!285829 () Bool)

(assert (=> start!26142 m!285829))

(declare-fun m!285831 () Bool)

(assert (=> start!26142 m!285831))

(check-sat (not b!269932) (not b!269930) (not b!269927) (not b!269933) (not start!26142) (not b!269929) (not b!269935) (not b!269934))
(check-sat)
