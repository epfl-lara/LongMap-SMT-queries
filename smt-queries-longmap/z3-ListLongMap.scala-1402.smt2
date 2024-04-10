; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27266 () Bool)

(assert start!27266)

(declare-fun b!282418 () Bool)

(declare-fun res!145491 () Bool)

(declare-fun e!179306 () Bool)

(assert (=> b!282418 (=> (not res!145491) (not e!179306))))

(declare-datatypes ((array!14084 0))(
  ( (array!14085 (arr!6684 (Array (_ BitVec 32) (_ BitVec 64))) (size!7036 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14084)

(declare-datatypes ((List!4492 0))(
  ( (Nil!4489) (Cons!4488 (h!5158 (_ BitVec 64)) (t!9574 List!4492)) )
))
(declare-fun arrayNoDuplicates!0 (array!14084 (_ BitVec 32) List!4492) Bool)

(assert (=> b!282418 (= res!145491 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4489))))

(declare-fun b!282419 () Bool)

(declare-fun e!179305 () Bool)

(assert (=> b!282419 (= e!179305 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14084 (_ BitVec 32)) Bool)

(assert (=> b!282419 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8968 0))(
  ( (Unit!8969) )
))
(declare-fun lt!139537 () Unit!8968)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14084 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8968)

(assert (=> b!282419 (= lt!139537 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!139535 () array!14084)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1842 0))(
  ( (MissingZero!1842 (index!9538 (_ BitVec 32))) (Found!1842 (index!9539 (_ BitVec 32))) (Intermediate!1842 (undefined!2654 Bool) (index!9540 (_ BitVec 32)) (x!27752 (_ BitVec 32))) (Undefined!1842) (MissingVacant!1842 (index!9541 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14084 (_ BitVec 32)) SeekEntryResult!1842)

(assert (=> b!282419 (= (seekEntryOrOpen!0 (select (arr!6684 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6684 a!3325) i!1267 k0!2581) startIndex!26) lt!139535 mask!3868))))

(declare-fun lt!139534 () Unit!8968)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14084 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8968)

(assert (=> b!282419 (= lt!139534 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!282419 (arrayNoDuplicates!0 lt!139535 #b00000000000000000000000000000000 Nil!4489)))

(declare-fun lt!139536 () Unit!8968)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14084 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4492) Unit!8968)

(assert (=> b!282419 (= lt!139536 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4489))))

(declare-fun b!282420 () Bool)

(declare-fun res!145493 () Bool)

(assert (=> b!282420 (=> (not res!145493) (not e!179306))))

(declare-fun arrayContainsKey!0 (array!14084 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282420 (= res!145493 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282421 () Bool)

(declare-fun e!179303 () Bool)

(assert (=> b!282421 (= e!179306 e!179303)))

(declare-fun res!145494 () Bool)

(assert (=> b!282421 (=> (not res!145494) (not e!179303))))

(declare-fun lt!139533 () SeekEntryResult!1842)

(assert (=> b!282421 (= res!145494 (or (= lt!139533 (MissingZero!1842 i!1267)) (= lt!139533 (MissingVacant!1842 i!1267))))))

(assert (=> b!282421 (= lt!139533 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282422 () Bool)

(declare-fun res!145489 () Bool)

(assert (=> b!282422 (=> (not res!145489) (not e!179306))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282422 (= res!145489 (validKeyInArray!0 k0!2581))))

(declare-fun b!282423 () Bool)

(declare-fun res!145490 () Bool)

(assert (=> b!282423 (=> (not res!145490) (not e!179303))))

(assert (=> b!282423 (= res!145490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282424 () Bool)

(declare-fun res!145492 () Bool)

(assert (=> b!282424 (=> (not res!145492) (not e!179306))))

(assert (=> b!282424 (= res!145492 (and (= (size!7036 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7036 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7036 a!3325))))))

(declare-fun b!282425 () Bool)

(assert (=> b!282425 (= e!179303 e!179305)))

(declare-fun res!145487 () Bool)

(assert (=> b!282425 (=> (not res!145487) (not e!179305))))

(assert (=> b!282425 (= res!145487 (not (= startIndex!26 i!1267)))))

(assert (=> b!282425 (= lt!139535 (array!14085 (store (arr!6684 a!3325) i!1267 k0!2581) (size!7036 a!3325)))))

(declare-fun res!145488 () Bool)

(assert (=> start!27266 (=> (not res!145488) (not e!179306))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27266 (= res!145488 (validMask!0 mask!3868))))

(assert (=> start!27266 e!179306))

(declare-fun array_inv!4647 (array!14084) Bool)

(assert (=> start!27266 (array_inv!4647 a!3325)))

(assert (=> start!27266 true))

(declare-fun b!282417 () Bool)

(declare-fun res!145486 () Bool)

(assert (=> b!282417 (=> (not res!145486) (not e!179305))))

(assert (=> b!282417 (= res!145486 (validKeyInArray!0 (select (arr!6684 a!3325) startIndex!26)))))

(assert (= (and start!27266 res!145488) b!282424))

(assert (= (and b!282424 res!145492) b!282422))

(assert (= (and b!282422 res!145489) b!282418))

(assert (= (and b!282418 res!145491) b!282420))

(assert (= (and b!282420 res!145493) b!282421))

(assert (= (and b!282421 res!145494) b!282423))

(assert (= (and b!282423 res!145490) b!282425))

(assert (= (and b!282425 res!145487) b!282417))

(assert (= (and b!282417 res!145486) b!282419))

(declare-fun m!296979 () Bool)

(assert (=> b!282420 m!296979))

(declare-fun m!296981 () Bool)

(assert (=> b!282418 m!296981))

(declare-fun m!296983 () Bool)

(assert (=> b!282417 m!296983))

(assert (=> b!282417 m!296983))

(declare-fun m!296985 () Bool)

(assert (=> b!282417 m!296985))

(declare-fun m!296987 () Bool)

(assert (=> b!282419 m!296987))

(declare-fun m!296989 () Bool)

(assert (=> b!282419 m!296989))

(declare-fun m!296991 () Bool)

(assert (=> b!282419 m!296991))

(assert (=> b!282419 m!296983))

(declare-fun m!296993 () Bool)

(assert (=> b!282419 m!296993))

(declare-fun m!296995 () Bool)

(assert (=> b!282419 m!296995))

(declare-fun m!296997 () Bool)

(assert (=> b!282419 m!296997))

(assert (=> b!282419 m!296983))

(declare-fun m!296999 () Bool)

(assert (=> b!282419 m!296999))

(assert (=> b!282419 m!296989))

(declare-fun m!297001 () Bool)

(assert (=> b!282419 m!297001))

(declare-fun m!297003 () Bool)

(assert (=> b!282419 m!297003))

(assert (=> b!282425 m!297003))

(declare-fun m!297005 () Bool)

(assert (=> start!27266 m!297005))

(declare-fun m!297007 () Bool)

(assert (=> start!27266 m!297007))

(declare-fun m!297009 () Bool)

(assert (=> b!282422 m!297009))

(declare-fun m!297011 () Bool)

(assert (=> b!282423 m!297011))

(declare-fun m!297013 () Bool)

(assert (=> b!282421 m!297013))

(check-sat (not b!282422) (not b!282420) (not b!282423) (not start!27266) (not b!282417) (not b!282419) (not b!282418) (not b!282421))
(check-sat)
