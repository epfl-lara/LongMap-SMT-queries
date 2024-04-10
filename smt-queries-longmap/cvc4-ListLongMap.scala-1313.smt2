; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26440 () Bool)

(assert start!26440)

(declare-fun b!274376 () Bool)

(declare-fun e!175681 () Bool)

(assert (=> b!274376 (= e!175681 true)))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13537 0))(
  ( (array!13538 (arr!6418 (Array (_ BitVec 32) (_ BitVec 64))) (size!6770 (_ BitVec 32))) )
))
(declare-fun lt!136914 () array!13537)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13537 (_ BitVec 32)) Bool)

(assert (=> b!274376 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!136914 mask!3868)))

(declare-datatypes ((Unit!8639 0))(
  ( (Unit!8640) )
))
(declare-fun lt!136915 () Unit!8639)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun a!3325 () array!13537)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13537 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8639)

(assert (=> b!274376 (= lt!136915 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!274377 () Bool)

(declare-fun res!138375 () Bool)

(declare-fun e!175682 () Bool)

(assert (=> b!274377 (=> (not res!138375) (not e!175682))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274377 (= res!138375 (validKeyInArray!0 (select (arr!6418 a!3325) startIndex!26)))))

(declare-fun b!274378 () Bool)

(declare-fun res!138369 () Bool)

(declare-fun e!175684 () Bool)

(assert (=> b!274378 (=> (not res!138369) (not e!175684))))

(declare-datatypes ((List!4226 0))(
  ( (Nil!4223) (Cons!4222 (h!4889 (_ BitVec 64)) (t!9308 List!4226)) )
))
(declare-fun arrayNoDuplicates!0 (array!13537 (_ BitVec 32) List!4226) Bool)

(assert (=> b!274378 (= res!138369 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4223))))

(declare-fun b!274379 () Bool)

(declare-fun res!138368 () Bool)

(assert (=> b!274379 (=> (not res!138368) (not e!175684))))

(declare-fun arrayContainsKey!0 (array!13537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274379 (= res!138368 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!138374 () Bool)

(assert (=> start!26440 (=> (not res!138374) (not e!175684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26440 (= res!138374 (validMask!0 mask!3868))))

(assert (=> start!26440 e!175684))

(declare-fun array_inv!4381 (array!13537) Bool)

(assert (=> start!26440 (array_inv!4381 a!3325)))

(assert (=> start!26440 true))

(declare-fun b!274380 () Bool)

(declare-fun e!175683 () Bool)

(assert (=> b!274380 (= e!175683 e!175682)))

(declare-fun res!138373 () Bool)

(assert (=> b!274380 (=> (not res!138373) (not e!175682))))

(assert (=> b!274380 (= res!138373 (not (= startIndex!26 i!1267)))))

(assert (=> b!274380 (= lt!136914 (array!13538 (store (arr!6418 a!3325) i!1267 k!2581) (size!6770 a!3325)))))

(declare-fun b!274381 () Bool)

(assert (=> b!274381 (= e!175684 e!175683)))

(declare-fun res!138371 () Bool)

(assert (=> b!274381 (=> (not res!138371) (not e!175683))))

(declare-datatypes ((SeekEntryResult!1576 0))(
  ( (MissingZero!1576 (index!8474 (_ BitVec 32))) (Found!1576 (index!8475 (_ BitVec 32))) (Intermediate!1576 (undefined!2388 Bool) (index!8476 (_ BitVec 32)) (x!26765 (_ BitVec 32))) (Undefined!1576) (MissingVacant!1576 (index!8477 (_ BitVec 32))) )
))
(declare-fun lt!136910 () SeekEntryResult!1576)

(assert (=> b!274381 (= res!138371 (or (= lt!136910 (MissingZero!1576 i!1267)) (= lt!136910 (MissingVacant!1576 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13537 (_ BitVec 32)) SeekEntryResult!1576)

(assert (=> b!274381 (= lt!136910 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!274382 () Bool)

(assert (=> b!274382 (= e!175682 (not e!175681))))

(declare-fun res!138366 () Bool)

(assert (=> b!274382 (=> res!138366 e!175681)))

(assert (=> b!274382 (= res!138366 (or (bvsge startIndex!26 (bvsub (size!6770 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(assert (=> b!274382 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-fun lt!136912 () Unit!8639)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13537 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8639)

(assert (=> b!274382 (= lt!136912 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!274382 (= (seekEntryOrOpen!0 (select (arr!6418 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6418 a!3325) i!1267 k!2581) startIndex!26) lt!136914 mask!3868))))

(declare-fun lt!136911 () Unit!8639)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13537 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8639)

(assert (=> b!274382 (= lt!136911 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!274382 (arrayNoDuplicates!0 lt!136914 #b00000000000000000000000000000000 Nil!4223)))

(declare-fun lt!136913 () Unit!8639)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13537 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4226) Unit!8639)

(assert (=> b!274382 (= lt!136913 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4223))))

(declare-fun b!274383 () Bool)

(declare-fun res!138372 () Bool)

(assert (=> b!274383 (=> (not res!138372) (not e!175683))))

(assert (=> b!274383 (= res!138372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274384 () Bool)

(declare-fun res!138367 () Bool)

(assert (=> b!274384 (=> (not res!138367) (not e!175684))))

(assert (=> b!274384 (= res!138367 (and (= (size!6770 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6770 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6770 a!3325))))))

(declare-fun b!274385 () Bool)

(declare-fun res!138370 () Bool)

(assert (=> b!274385 (=> (not res!138370) (not e!175684))))

(assert (=> b!274385 (= res!138370 (validKeyInArray!0 k!2581))))

(assert (= (and start!26440 res!138374) b!274384))

(assert (= (and b!274384 res!138367) b!274385))

(assert (= (and b!274385 res!138370) b!274378))

(assert (= (and b!274378 res!138369) b!274379))

(assert (= (and b!274379 res!138368) b!274381))

(assert (= (and b!274381 res!138371) b!274383))

(assert (= (and b!274383 res!138372) b!274380))

(assert (= (and b!274380 res!138373) b!274377))

(assert (= (and b!274377 res!138375) b!274382))

(assert (= (and b!274382 (not res!138366)) b!274376))

(declare-fun m!289877 () Bool)

(assert (=> b!274381 m!289877))

(declare-fun m!289879 () Bool)

(assert (=> b!274378 m!289879))

(declare-fun m!289881 () Bool)

(assert (=> b!274383 m!289881))

(declare-fun m!289883 () Bool)

(assert (=> b!274380 m!289883))

(declare-fun m!289885 () Bool)

(assert (=> b!274379 m!289885))

(declare-fun m!289887 () Bool)

(assert (=> b!274382 m!289887))

(declare-fun m!289889 () Bool)

(assert (=> b!274382 m!289889))

(declare-fun m!289891 () Bool)

(assert (=> b!274382 m!289891))

(declare-fun m!289893 () Bool)

(assert (=> b!274382 m!289893))

(assert (=> b!274382 m!289891))

(assert (=> b!274382 m!289883))

(declare-fun m!289895 () Bool)

(assert (=> b!274382 m!289895))

(declare-fun m!289897 () Bool)

(assert (=> b!274382 m!289897))

(declare-fun m!289899 () Bool)

(assert (=> b!274382 m!289899))

(declare-fun m!289901 () Bool)

(assert (=> b!274382 m!289901))

(assert (=> b!274382 m!289897))

(declare-fun m!289903 () Bool)

(assert (=> b!274382 m!289903))

(declare-fun m!289905 () Bool)

(assert (=> start!26440 m!289905))

(declare-fun m!289907 () Bool)

(assert (=> start!26440 m!289907))

(assert (=> b!274377 m!289897))

(assert (=> b!274377 m!289897))

(declare-fun m!289909 () Bool)

(assert (=> b!274377 m!289909))

(declare-fun m!289911 () Bool)

(assert (=> b!274376 m!289911))

(declare-fun m!289913 () Bool)

(assert (=> b!274376 m!289913))

(declare-fun m!289915 () Bool)

(assert (=> b!274385 m!289915))

(push 1)

(assert (not b!274377))

(assert (not b!274382))

