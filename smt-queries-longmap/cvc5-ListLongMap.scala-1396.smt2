; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27228 () Bool)

(assert start!27228)

(declare-fun b!281905 () Bool)

(declare-fun e!179076 () Bool)

(assert (=> b!281905 (= e!179076 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!14046 0))(
  ( (array!14047 (arr!6665 (Array (_ BitVec 32) (_ BitVec 64))) (size!7017 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14046)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14046 (_ BitVec 32)) Bool)

(assert (=> b!281905 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8930 0))(
  ( (Unit!8931) )
))
(declare-fun lt!139250 () Unit!8930)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14046 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8930)

(assert (=> b!281905 (= lt!139250 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!139252 () array!14046)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1823 0))(
  ( (MissingZero!1823 (index!9462 (_ BitVec 32))) (Found!1823 (index!9463 (_ BitVec 32))) (Intermediate!1823 (undefined!2635 Bool) (index!9464 (_ BitVec 32)) (x!27685 (_ BitVec 32))) (Undefined!1823) (MissingVacant!1823 (index!9465 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14046 (_ BitVec 32)) SeekEntryResult!1823)

(assert (=> b!281905 (= (seekEntryOrOpen!0 (select (arr!6665 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6665 a!3325) i!1267 k!2581) startIndex!26) lt!139252 mask!3868))))

(declare-fun lt!139249 () Unit!8930)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14046 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8930)

(assert (=> b!281905 (= lt!139249 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4473 0))(
  ( (Nil!4470) (Cons!4469 (h!5139 (_ BitVec 64)) (t!9555 List!4473)) )
))
(declare-fun arrayNoDuplicates!0 (array!14046 (_ BitVec 32) List!4473) Bool)

(assert (=> b!281905 (arrayNoDuplicates!0 lt!139252 #b00000000000000000000000000000000 Nil!4470)))

(declare-fun lt!139248 () Unit!8930)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14046 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4473) Unit!8930)

(assert (=> b!281905 (= lt!139248 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4470))))

(declare-fun b!281906 () Bool)

(declare-fun e!179078 () Bool)

(assert (=> b!281906 (= e!179078 e!179076)))

(declare-fun res!144979 () Bool)

(assert (=> b!281906 (=> (not res!144979) (not e!179076))))

(assert (=> b!281906 (= res!144979 (not (= startIndex!26 i!1267)))))

(assert (=> b!281906 (= lt!139252 (array!14047 (store (arr!6665 a!3325) i!1267 k!2581) (size!7017 a!3325)))))

(declare-fun b!281907 () Bool)

(declare-fun res!144978 () Bool)

(declare-fun e!179077 () Bool)

(assert (=> b!281907 (=> (not res!144978) (not e!179077))))

(declare-fun arrayContainsKey!0 (array!14046 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281907 (= res!144978 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281908 () Bool)

(declare-fun res!144974 () Bool)

(assert (=> b!281908 (=> (not res!144974) (not e!179077))))

(assert (=> b!281908 (= res!144974 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4470))))

(declare-fun b!281909 () Bool)

(assert (=> b!281909 (= e!179077 e!179078)))

(declare-fun res!144977 () Bool)

(assert (=> b!281909 (=> (not res!144977) (not e!179078))))

(declare-fun lt!139251 () SeekEntryResult!1823)

(assert (=> b!281909 (= res!144977 (or (= lt!139251 (MissingZero!1823 i!1267)) (= lt!139251 (MissingVacant!1823 i!1267))))))

(assert (=> b!281909 (= lt!139251 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!281910 () Bool)

(declare-fun res!144973 () Bool)

(assert (=> b!281910 (=> (not res!144973) (not e!179077))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281910 (= res!144973 (validKeyInArray!0 k!2581))))

(declare-fun b!281904 () Bool)

(declare-fun res!144976 () Bool)

(assert (=> b!281904 (=> (not res!144976) (not e!179077))))

(assert (=> b!281904 (= res!144976 (and (= (size!7017 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7017 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7017 a!3325))))))

(declare-fun res!144981 () Bool)

(assert (=> start!27228 (=> (not res!144981) (not e!179077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27228 (= res!144981 (validMask!0 mask!3868))))

(assert (=> start!27228 e!179077))

(declare-fun array_inv!4628 (array!14046) Bool)

(assert (=> start!27228 (array_inv!4628 a!3325)))

(assert (=> start!27228 true))

(declare-fun b!281911 () Bool)

(declare-fun res!144980 () Bool)

(assert (=> b!281911 (=> (not res!144980) (not e!179078))))

(assert (=> b!281911 (= res!144980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281912 () Bool)

(declare-fun res!144975 () Bool)

(assert (=> b!281912 (=> (not res!144975) (not e!179076))))

(assert (=> b!281912 (= res!144975 (validKeyInArray!0 (select (arr!6665 a!3325) startIndex!26)))))

(assert (= (and start!27228 res!144981) b!281904))

(assert (= (and b!281904 res!144976) b!281910))

(assert (= (and b!281910 res!144973) b!281908))

(assert (= (and b!281908 res!144974) b!281907))

(assert (= (and b!281907 res!144978) b!281909))

(assert (= (and b!281909 res!144977) b!281911))

(assert (= (and b!281911 res!144980) b!281906))

(assert (= (and b!281906 res!144979) b!281912))

(assert (= (and b!281912 res!144975) b!281905))

(declare-fun m!296295 () Bool)

(assert (=> start!27228 m!296295))

(declare-fun m!296297 () Bool)

(assert (=> start!27228 m!296297))

(declare-fun m!296299 () Bool)

(assert (=> b!281905 m!296299))

(declare-fun m!296301 () Bool)

(assert (=> b!281905 m!296301))

(declare-fun m!296303 () Bool)

(assert (=> b!281905 m!296303))

(declare-fun m!296305 () Bool)

(assert (=> b!281905 m!296305))

(declare-fun m!296307 () Bool)

(assert (=> b!281905 m!296307))

(declare-fun m!296309 () Bool)

(assert (=> b!281905 m!296309))

(declare-fun m!296311 () Bool)

(assert (=> b!281905 m!296311))

(assert (=> b!281905 m!296301))

(declare-fun m!296313 () Bool)

(assert (=> b!281905 m!296313))

(declare-fun m!296315 () Bool)

(assert (=> b!281905 m!296315))

(declare-fun m!296317 () Bool)

(assert (=> b!281905 m!296317))

(assert (=> b!281905 m!296309))

(declare-fun m!296319 () Bool)

(assert (=> b!281911 m!296319))

(declare-fun m!296321 () Bool)

(assert (=> b!281908 m!296321))

(declare-fun m!296323 () Bool)

(assert (=> b!281910 m!296323))

(assert (=> b!281912 m!296309))

(assert (=> b!281912 m!296309))

(declare-fun m!296325 () Bool)

(assert (=> b!281912 m!296325))

(declare-fun m!296327 () Bool)

(assert (=> b!281909 m!296327))

(assert (=> b!281906 m!296303))

(declare-fun m!296329 () Bool)

(assert (=> b!281907 m!296329))

(push 1)

