; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27384 () Bool)

(assert start!27384)

(declare-fun b!283404 () Bool)

(declare-fun res!146324 () Bool)

(declare-fun e!179827 () Bool)

(assert (=> b!283404 (=> (not res!146324) (not e!179827))))

(declare-datatypes ((array!14139 0))(
  ( (array!14140 (arr!6710 (Array (_ BitVec 32) (_ BitVec 64))) (size!7062 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14139)

(declare-datatypes ((List!4518 0))(
  ( (Nil!4515) (Cons!4514 (h!5184 (_ BitVec 64)) (t!9600 List!4518)) )
))
(declare-fun arrayNoDuplicates!0 (array!14139 (_ BitVec 32) List!4518) Bool)

(assert (=> b!283404 (= res!146324 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4515))))

(declare-fun b!283405 () Bool)

(declare-fun res!146326 () Bool)

(assert (=> b!283405 (=> (not res!146326) (not e!179827))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!283405 (= res!146326 (validKeyInArray!0 k!2581))))

(declare-fun b!283406 () Bool)

(declare-fun res!146323 () Bool)

(declare-fun e!179828 () Bool)

(assert (=> b!283406 (=> (not res!146323) (not e!179828))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!283406 (= res!146323 (validKeyInArray!0 (select (arr!6710 a!3325) startIndex!26)))))

(declare-fun b!283407 () Bool)

(declare-fun res!146329 () Bool)

(assert (=> b!283407 (=> (not res!146329) (not e!179827))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!283407 (= res!146329 (and (= (size!7062 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7062 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7062 a!3325))))))

(declare-fun b!283408 () Bool)

(declare-fun res!146327 () Bool)

(declare-fun e!179825 () Bool)

(assert (=> b!283408 (=> (not res!146327) (not e!179825))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14139 (_ BitVec 32)) Bool)

(assert (=> b!283408 (= res!146327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!283409 () Bool)

(assert (=> b!283409 (= e!179827 e!179825)))

(declare-fun res!146328 () Bool)

(assert (=> b!283409 (=> (not res!146328) (not e!179825))))

(declare-datatypes ((SeekEntryResult!1868 0))(
  ( (MissingZero!1868 (index!9642 (_ BitVec 32))) (Found!1868 (index!9643 (_ BitVec 32))) (Intermediate!1868 (undefined!2680 Bool) (index!9644 (_ BitVec 32)) (x!27850 (_ BitVec 32))) (Undefined!1868) (MissingVacant!1868 (index!9645 (_ BitVec 32))) )
))
(declare-fun lt!140076 () SeekEntryResult!1868)

(assert (=> b!283409 (= res!146328 (or (= lt!140076 (MissingZero!1868 i!1267)) (= lt!140076 (MissingVacant!1868 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14139 (_ BitVec 32)) SeekEntryResult!1868)

(assert (=> b!283409 (= lt!140076 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!283410 () Bool)

(assert (=> b!283410 (= e!179828 (not true))))

(assert (=> b!283410 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!9020 0))(
  ( (Unit!9021) )
))
(declare-fun lt!140077 () Unit!9020)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14139 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9020)

(assert (=> b!283410 (= lt!140077 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!140079 () array!14139)

(assert (=> b!283410 (= (seekEntryOrOpen!0 (select (arr!6710 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6710 a!3325) i!1267 k!2581) startIndex!26) lt!140079 mask!3868))))

(declare-fun lt!140078 () Unit!9020)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14139 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9020)

(assert (=> b!283410 (= lt!140078 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!283410 (arrayNoDuplicates!0 lt!140079 #b00000000000000000000000000000000 Nil!4515)))

(declare-fun lt!140080 () Unit!9020)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14139 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4518) Unit!9020)

(assert (=> b!283410 (= lt!140080 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4515))))

(declare-fun res!146330 () Bool)

(assert (=> start!27384 (=> (not res!146330) (not e!179827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27384 (= res!146330 (validMask!0 mask!3868))))

(assert (=> start!27384 e!179827))

(declare-fun array_inv!4673 (array!14139) Bool)

(assert (=> start!27384 (array_inv!4673 a!3325)))

(assert (=> start!27384 true))

(declare-fun b!283411 () Bool)

(declare-fun res!146331 () Bool)

(assert (=> b!283411 (=> (not res!146331) (not e!179827))))

(declare-fun arrayContainsKey!0 (array!14139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!283411 (= res!146331 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!283412 () Bool)

(assert (=> b!283412 (= e!179825 e!179828)))

(declare-fun res!146325 () Bool)

(assert (=> b!283412 (=> (not res!146325) (not e!179828))))

(assert (=> b!283412 (= res!146325 (not (= startIndex!26 i!1267)))))

(assert (=> b!283412 (= lt!140079 (array!14140 (store (arr!6710 a!3325) i!1267 k!2581) (size!7062 a!3325)))))

(assert (= (and start!27384 res!146330) b!283407))

(assert (= (and b!283407 res!146329) b!283405))

(assert (= (and b!283405 res!146326) b!283404))

(assert (= (and b!283404 res!146324) b!283411))

(assert (= (and b!283411 res!146331) b!283409))

(assert (= (and b!283409 res!146328) b!283408))

(assert (= (and b!283408 res!146327) b!283412))

(assert (= (and b!283412 res!146325) b!283406))

(assert (= (and b!283406 res!146323) b!283410))

(declare-fun m!298281 () Bool)

(assert (=> b!283411 m!298281))

(declare-fun m!298283 () Bool)

(assert (=> b!283408 m!298283))

(declare-fun m!298285 () Bool)

(assert (=> b!283409 m!298285))

(declare-fun m!298287 () Bool)

(assert (=> start!27384 m!298287))

(declare-fun m!298289 () Bool)

(assert (=> start!27384 m!298289))

(declare-fun m!298291 () Bool)

(assert (=> b!283405 m!298291))

(declare-fun m!298293 () Bool)

(assert (=> b!283406 m!298293))

(assert (=> b!283406 m!298293))

(declare-fun m!298295 () Bool)

(assert (=> b!283406 m!298295))

(declare-fun m!298297 () Bool)

(assert (=> b!283404 m!298297))

(declare-fun m!298299 () Bool)

(assert (=> b!283410 m!298299))

(declare-fun m!298301 () Bool)

(assert (=> b!283410 m!298301))

(declare-fun m!298303 () Bool)

(assert (=> b!283410 m!298303))

(assert (=> b!283410 m!298301))

(declare-fun m!298305 () Bool)

(assert (=> b!283410 m!298305))

(declare-fun m!298307 () Bool)

(assert (=> b!283410 m!298307))

(declare-fun m!298309 () Bool)

(assert (=> b!283410 m!298309))

(assert (=> b!283410 m!298293))

(declare-fun m!298311 () Bool)

(assert (=> b!283410 m!298311))

(declare-fun m!298313 () Bool)

(assert (=> b!283410 m!298313))

(assert (=> b!283410 m!298293))

(declare-fun m!298315 () Bool)

(assert (=> b!283410 m!298315))

(assert (=> b!283412 m!298305))

(push 1)

