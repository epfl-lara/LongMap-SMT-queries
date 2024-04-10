; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27234 () Bool)

(assert start!27234)

(declare-fun b!281985 () Bool)

(declare-fun res!145055 () Bool)

(declare-fun e!179113 () Bool)

(assert (=> b!281985 (=> (not res!145055) (not e!179113))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281985 (= res!145055 (validKeyInArray!0 k!2581))))

(declare-fun b!281986 () Bool)

(declare-fun e!179114 () Bool)

(assert (=> b!281986 (= e!179114 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!14052 0))(
  ( (array!14053 (arr!6668 (Array (_ BitVec 32) (_ BitVec 64))) (size!7020 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14052)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14052 (_ BitVec 32)) Bool)

(assert (=> b!281986 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8936 0))(
  ( (Unit!8937) )
))
(declare-fun lt!139293 () Unit!8936)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14052 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8936)

(assert (=> b!281986 (= lt!139293 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!139295 () array!14052)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1826 0))(
  ( (MissingZero!1826 (index!9474 (_ BitVec 32))) (Found!1826 (index!9475 (_ BitVec 32))) (Intermediate!1826 (undefined!2638 Bool) (index!9476 (_ BitVec 32)) (x!27696 (_ BitVec 32))) (Undefined!1826) (MissingVacant!1826 (index!9477 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14052 (_ BitVec 32)) SeekEntryResult!1826)

(assert (=> b!281986 (= (seekEntryOrOpen!0 (select (arr!6668 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6668 a!3325) i!1267 k!2581) startIndex!26) lt!139295 mask!3868))))

(declare-fun lt!139296 () Unit!8936)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14052 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8936)

(assert (=> b!281986 (= lt!139296 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4476 0))(
  ( (Nil!4473) (Cons!4472 (h!5142 (_ BitVec 64)) (t!9558 List!4476)) )
))
(declare-fun arrayNoDuplicates!0 (array!14052 (_ BitVec 32) List!4476) Bool)

(assert (=> b!281986 (arrayNoDuplicates!0 lt!139295 #b00000000000000000000000000000000 Nil!4473)))

(declare-fun lt!139294 () Unit!8936)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14052 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4476) Unit!8936)

(assert (=> b!281986 (= lt!139294 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4473))))

(declare-fun b!281987 () Bool)

(declare-fun res!145062 () Bool)

(assert (=> b!281987 (=> (not res!145062) (not e!179113))))

(assert (=> b!281987 (= res!145062 (and (= (size!7020 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7020 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7020 a!3325))))))

(declare-fun b!281988 () Bool)

(declare-fun res!145060 () Bool)

(assert (=> b!281988 (=> (not res!145060) (not e!179114))))

(assert (=> b!281988 (= res!145060 (validKeyInArray!0 (select (arr!6668 a!3325) startIndex!26)))))

(declare-fun b!281989 () Bool)

(declare-fun e!179111 () Bool)

(assert (=> b!281989 (= e!179111 e!179114)))

(declare-fun res!145056 () Bool)

(assert (=> b!281989 (=> (not res!145056) (not e!179114))))

(assert (=> b!281989 (= res!145056 (not (= startIndex!26 i!1267)))))

(assert (=> b!281989 (= lt!139295 (array!14053 (store (arr!6668 a!3325) i!1267 k!2581) (size!7020 a!3325)))))

(declare-fun b!281990 () Bool)

(declare-fun res!145054 () Bool)

(assert (=> b!281990 (=> (not res!145054) (not e!179111))))

(assert (=> b!281990 (= res!145054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!145059 () Bool)

(assert (=> start!27234 (=> (not res!145059) (not e!179113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27234 (= res!145059 (validMask!0 mask!3868))))

(assert (=> start!27234 e!179113))

(declare-fun array_inv!4631 (array!14052) Bool)

(assert (=> start!27234 (array_inv!4631 a!3325)))

(assert (=> start!27234 true))

(declare-fun b!281991 () Bool)

(declare-fun res!145057 () Bool)

(assert (=> b!281991 (=> (not res!145057) (not e!179113))))

(assert (=> b!281991 (= res!145057 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4473))))

(declare-fun b!281992 () Bool)

(declare-fun res!145061 () Bool)

(assert (=> b!281992 (=> (not res!145061) (not e!179113))))

(declare-fun arrayContainsKey!0 (array!14052 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281992 (= res!145061 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281993 () Bool)

(assert (=> b!281993 (= e!179113 e!179111)))

(declare-fun res!145058 () Bool)

(assert (=> b!281993 (=> (not res!145058) (not e!179111))))

(declare-fun lt!139297 () SeekEntryResult!1826)

(assert (=> b!281993 (= res!145058 (or (= lt!139297 (MissingZero!1826 i!1267)) (= lt!139297 (MissingVacant!1826 i!1267))))))

(assert (=> b!281993 (= lt!139297 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!27234 res!145059) b!281987))

(assert (= (and b!281987 res!145062) b!281985))

(assert (= (and b!281985 res!145055) b!281991))

(assert (= (and b!281991 res!145057) b!281992))

(assert (= (and b!281992 res!145061) b!281993))

(assert (= (and b!281993 res!145058) b!281990))

(assert (= (and b!281990 res!145054) b!281989))

(assert (= (and b!281989 res!145056) b!281988))

(assert (= (and b!281988 res!145060) b!281986))

(declare-fun m!296403 () Bool)

(assert (=> start!27234 m!296403))

(declare-fun m!296405 () Bool)

(assert (=> start!27234 m!296405))

(declare-fun m!296407 () Bool)

(assert (=> b!281990 m!296407))

(declare-fun m!296409 () Bool)

(assert (=> b!281991 m!296409))

(declare-fun m!296411 () Bool)

(assert (=> b!281989 m!296411))

(declare-fun m!296413 () Bool)

(assert (=> b!281992 m!296413))

(declare-fun m!296415 () Bool)

(assert (=> b!281986 m!296415))

(declare-fun m!296417 () Bool)

(assert (=> b!281986 m!296417))

(assert (=> b!281986 m!296417))

(declare-fun m!296419 () Bool)

(assert (=> b!281986 m!296419))

(declare-fun m!296421 () Bool)

(assert (=> b!281986 m!296421))

(declare-fun m!296423 () Bool)

(assert (=> b!281986 m!296423))

(declare-fun m!296425 () Bool)

(assert (=> b!281986 m!296425))

(declare-fun m!296427 () Bool)

(assert (=> b!281986 m!296427))

(assert (=> b!281986 m!296423))

(declare-fun m!296429 () Bool)

(assert (=> b!281986 m!296429))

(assert (=> b!281986 m!296411))

(declare-fun m!296431 () Bool)

(assert (=> b!281986 m!296431))

(declare-fun m!296433 () Bool)

(assert (=> b!281993 m!296433))

(declare-fun m!296435 () Bool)

(assert (=> b!281985 m!296435))

(assert (=> b!281988 m!296423))

(assert (=> b!281988 m!296423))

(declare-fun m!296437 () Bool)

(assert (=> b!281988 m!296437))

(push 1)

