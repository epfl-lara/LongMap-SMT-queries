; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26438 () Bool)

(assert start!26438)

(declare-fun res!138340 () Bool)

(declare-fun e!175666 () Bool)

(assert (=> start!26438 (=> (not res!138340) (not e!175666))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26438 (= res!138340 (validMask!0 mask!3868))))

(assert (=> start!26438 e!175666))

(declare-datatypes ((array!13535 0))(
  ( (array!13536 (arr!6417 (Array (_ BitVec 32) (_ BitVec 64))) (size!6769 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13535)

(declare-fun array_inv!4380 (array!13535) Bool)

(assert (=> start!26438 (array_inv!4380 a!3325)))

(assert (=> start!26438 true))

(declare-fun b!274346 () Bool)

(declare-fun res!138336 () Bool)

(assert (=> b!274346 (=> (not res!138336) (not e!175666))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274346 (= res!138336 (validKeyInArray!0 k0!2581))))

(declare-fun b!274347 () Bool)

(declare-fun res!138343 () Bool)

(assert (=> b!274347 (=> (not res!138343) (not e!175666))))

(declare-fun arrayContainsKey!0 (array!13535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274347 (= res!138343 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274348 () Bool)

(declare-fun res!138341 () Bool)

(declare-fun e!175669 () Bool)

(assert (=> b!274348 (=> (not res!138341) (not e!175669))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!274348 (= res!138341 (validKeyInArray!0 (select (arr!6417 a!3325) startIndex!26)))))

(declare-fun b!274349 () Bool)

(declare-fun e!175667 () Bool)

(assert (=> b!274349 (= e!175667 e!175669)))

(declare-fun res!138345 () Bool)

(assert (=> b!274349 (=> (not res!138345) (not e!175669))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!274349 (= res!138345 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136895 () array!13535)

(assert (=> b!274349 (= lt!136895 (array!13536 (store (arr!6417 a!3325) i!1267 k0!2581) (size!6769 a!3325)))))

(declare-fun b!274350 () Bool)

(declare-fun res!138337 () Bool)

(assert (=> b!274350 (=> (not res!138337) (not e!175666))))

(assert (=> b!274350 (= res!138337 (and (= (size!6769 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6769 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6769 a!3325))))))

(declare-fun b!274351 () Bool)

(declare-fun res!138339 () Bool)

(assert (=> b!274351 (=> (not res!138339) (not e!175666))))

(declare-datatypes ((List!4225 0))(
  ( (Nil!4222) (Cons!4221 (h!4888 (_ BitVec 64)) (t!9307 List!4225)) )
))
(declare-fun arrayNoDuplicates!0 (array!13535 (_ BitVec 32) List!4225) Bool)

(assert (=> b!274351 (= res!138339 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4222))))

(declare-fun b!274352 () Bool)

(declare-fun res!138344 () Bool)

(assert (=> b!274352 (=> (not res!138344) (not e!175667))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13535 (_ BitVec 32)) Bool)

(assert (=> b!274352 (= res!138344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274353 () Bool)

(declare-fun e!175670 () Bool)

(assert (=> b!274353 (= e!175670 true)))

(assert (=> b!274353 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!136895 mask!3868)))

(declare-datatypes ((Unit!8637 0))(
  ( (Unit!8638) )
))
(declare-fun lt!136892 () Unit!8637)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13535 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8637)

(assert (=> b!274353 (= lt!136892 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!274354 () Bool)

(assert (=> b!274354 (= e!175669 (not e!175670))))

(declare-fun res!138342 () Bool)

(assert (=> b!274354 (=> res!138342 e!175670)))

(assert (=> b!274354 (= res!138342 (or (bvsge startIndex!26 (bvsub (size!6769 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(assert (=> b!274354 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-fun lt!136896 () Unit!8637)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13535 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8637)

(assert (=> b!274354 (= lt!136896 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1575 0))(
  ( (MissingZero!1575 (index!8470 (_ BitVec 32))) (Found!1575 (index!8471 (_ BitVec 32))) (Intermediate!1575 (undefined!2387 Bool) (index!8472 (_ BitVec 32)) (x!26764 (_ BitVec 32))) (Undefined!1575) (MissingVacant!1575 (index!8473 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13535 (_ BitVec 32)) SeekEntryResult!1575)

(assert (=> b!274354 (= (seekEntryOrOpen!0 (select (arr!6417 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6417 a!3325) i!1267 k0!2581) startIndex!26) lt!136895 mask!3868))))

(declare-fun lt!136894 () Unit!8637)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13535 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8637)

(assert (=> b!274354 (= lt!136894 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!274354 (arrayNoDuplicates!0 lt!136895 #b00000000000000000000000000000000 Nil!4222)))

(declare-fun lt!136893 () Unit!8637)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13535 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4225) Unit!8637)

(assert (=> b!274354 (= lt!136893 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4222))))

(declare-fun b!274355 () Bool)

(assert (=> b!274355 (= e!175666 e!175667)))

(declare-fun res!138338 () Bool)

(assert (=> b!274355 (=> (not res!138338) (not e!175667))))

(declare-fun lt!136897 () SeekEntryResult!1575)

(assert (=> b!274355 (= res!138338 (or (= lt!136897 (MissingZero!1575 i!1267)) (= lt!136897 (MissingVacant!1575 i!1267))))))

(assert (=> b!274355 (= lt!136897 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26438 res!138340) b!274350))

(assert (= (and b!274350 res!138337) b!274346))

(assert (= (and b!274346 res!138336) b!274351))

(assert (= (and b!274351 res!138339) b!274347))

(assert (= (and b!274347 res!138343) b!274355))

(assert (= (and b!274355 res!138338) b!274352))

(assert (= (and b!274352 res!138344) b!274349))

(assert (= (and b!274349 res!138345) b!274348))

(assert (= (and b!274348 res!138341) b!274354))

(assert (= (and b!274354 (not res!138342)) b!274353))

(declare-fun m!289837 () Bool)

(assert (=> b!274349 m!289837))

(declare-fun m!289839 () Bool)

(assert (=> b!274354 m!289839))

(declare-fun m!289841 () Bool)

(assert (=> b!274354 m!289841))

(declare-fun m!289843 () Bool)

(assert (=> b!274354 m!289843))

(assert (=> b!274354 m!289837))

(assert (=> b!274354 m!289843))

(declare-fun m!289845 () Bool)

(assert (=> b!274354 m!289845))

(declare-fun m!289847 () Bool)

(assert (=> b!274354 m!289847))

(declare-fun m!289849 () Bool)

(assert (=> b!274354 m!289849))

(declare-fun m!289851 () Bool)

(assert (=> b!274354 m!289851))

(declare-fun m!289853 () Bool)

(assert (=> b!274354 m!289853))

(assert (=> b!274354 m!289849))

(declare-fun m!289855 () Bool)

(assert (=> b!274354 m!289855))

(declare-fun m!289857 () Bool)

(assert (=> b!274347 m!289857))

(declare-fun m!289859 () Bool)

(assert (=> b!274353 m!289859))

(declare-fun m!289861 () Bool)

(assert (=> b!274353 m!289861))

(declare-fun m!289863 () Bool)

(assert (=> b!274351 m!289863))

(declare-fun m!289865 () Bool)

(assert (=> b!274352 m!289865))

(declare-fun m!289867 () Bool)

(assert (=> b!274346 m!289867))

(assert (=> b!274348 m!289849))

(assert (=> b!274348 m!289849))

(declare-fun m!289869 () Bool)

(assert (=> b!274348 m!289869))

(declare-fun m!289871 () Bool)

(assert (=> start!26438 m!289871))

(declare-fun m!289873 () Bool)

(assert (=> start!26438 m!289873))

(declare-fun m!289875 () Bool)

(assert (=> b!274355 m!289875))

(check-sat (not start!26438) (not b!274353) (not b!274346) (not b!274347) (not b!274348) (not b!274354) (not b!274351) (not b!274355) (not b!274352))
(check-sat)
