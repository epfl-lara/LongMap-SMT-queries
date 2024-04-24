; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27156 () Bool)

(assert start!27156)

(declare-fun b!280979 () Bool)

(declare-fun res!144026 () Bool)

(declare-fun e!178729 () Bool)

(assert (=> b!280979 (=> (not res!144026) (not e!178729))))

(declare-datatypes ((array!13973 0))(
  ( (array!13974 (arr!6628 (Array (_ BitVec 32) (_ BitVec 64))) (size!6980 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13973)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280979 (= res!144026 (validKeyInArray!0 (select (arr!6628 a!3325) startIndex!26)))))

(declare-fun b!280980 () Bool)

(declare-fun e!178728 () Bool)

(assert (=> b!280980 (= e!178728 e!178729)))

(declare-fun res!144022 () Bool)

(assert (=> b!280980 (=> (not res!144022) (not e!178729))))

(declare-datatypes ((SeekEntryResult!1751 0))(
  ( (MissingZero!1751 (index!9174 (_ BitVec 32))) (Found!1751 (index!9175 (_ BitVec 32))) (Intermediate!1751 (undefined!2563 Bool) (index!9176 (_ BitVec 32)) (x!27517 (_ BitVec 32))) (Undefined!1751) (MissingVacant!1751 (index!9177 (_ BitVec 32))) )
))
(declare-fun lt!138996 () SeekEntryResult!1751)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280980 (= res!144022 (or (= lt!138996 (MissingZero!1751 i!1267)) (= lt!138996 (MissingVacant!1751 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13973 (_ BitVec 32)) SeekEntryResult!1751)

(assert (=> b!280980 (= lt!138996 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!144029 () Bool)

(assert (=> start!27156 (=> (not res!144029) (not e!178728))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27156 (= res!144029 (validMask!0 mask!3868))))

(assert (=> start!27156 e!178728))

(declare-fun array_inv!4578 (array!13973) Bool)

(assert (=> start!27156 (array_inv!4578 a!3325)))

(assert (=> start!27156 true))

(declare-fun b!280981 () Bool)

(declare-fun res!144030 () Bool)

(assert (=> b!280981 (=> (not res!144030) (not e!178729))))

(assert (=> b!280981 (= res!144030 (not (= startIndex!26 i!1267)))))

(declare-fun b!280982 () Bool)

(declare-fun res!144028 () Bool)

(assert (=> b!280982 (=> (not res!144028) (not e!178728))))

(assert (=> b!280982 (= res!144028 (and (= (size!6980 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6980 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6980 a!3325))))))

(declare-fun b!280983 () Bool)

(declare-fun res!144023 () Bool)

(assert (=> b!280983 (=> (not res!144023) (not e!178728))))

(declare-datatypes ((List!4349 0))(
  ( (Nil!4346) (Cons!4345 (h!5015 (_ BitVec 64)) (t!9423 List!4349)) )
))
(declare-fun arrayNoDuplicates!0 (array!13973 (_ BitVec 32) List!4349) Bool)

(assert (=> b!280983 (= res!144023 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4346))))

(declare-fun b!280984 () Bool)

(declare-fun res!144025 () Bool)

(assert (=> b!280984 (=> (not res!144025) (not e!178728))))

(declare-fun arrayContainsKey!0 (array!13973 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280984 (= res!144025 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280985 () Bool)

(assert (=> b!280985 (= e!178729 (not (not (= i!1267 startIndex!26))))))

(assert (=> b!280985 (arrayNoDuplicates!0 (array!13974 (store (arr!6628 a!3325) i!1267 k0!2581) (size!6980 a!3325)) #b00000000000000000000000000000000 Nil!4346)))

(declare-datatypes ((Unit!8832 0))(
  ( (Unit!8833) )
))
(declare-fun lt!138995 () Unit!8832)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13973 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4349) Unit!8832)

(assert (=> b!280985 (= lt!138995 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4346))))

(declare-fun b!280986 () Bool)

(declare-fun res!144024 () Bool)

(assert (=> b!280986 (=> (not res!144024) (not e!178728))))

(assert (=> b!280986 (= res!144024 (validKeyInArray!0 k0!2581))))

(declare-fun b!280987 () Bool)

(declare-fun res!144027 () Bool)

(assert (=> b!280987 (=> (not res!144027) (not e!178729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13973 (_ BitVec 32)) Bool)

(assert (=> b!280987 (= res!144027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27156 res!144029) b!280982))

(assert (= (and b!280982 res!144028) b!280986))

(assert (= (and b!280986 res!144024) b!280983))

(assert (= (and b!280983 res!144023) b!280984))

(assert (= (and b!280984 res!144025) b!280980))

(assert (= (and b!280980 res!144022) b!280987))

(assert (= (and b!280987 res!144027) b!280981))

(assert (= (and b!280981 res!144030) b!280979))

(assert (= (and b!280979 res!144026) b!280985))

(declare-fun m!295517 () Bool)

(assert (=> b!280987 m!295517))

(declare-fun m!295519 () Bool)

(assert (=> b!280979 m!295519))

(assert (=> b!280979 m!295519))

(declare-fun m!295521 () Bool)

(assert (=> b!280979 m!295521))

(declare-fun m!295523 () Bool)

(assert (=> b!280980 m!295523))

(declare-fun m!295525 () Bool)

(assert (=> b!280984 m!295525))

(declare-fun m!295527 () Bool)

(assert (=> b!280985 m!295527))

(declare-fun m!295529 () Bool)

(assert (=> b!280985 m!295529))

(declare-fun m!295531 () Bool)

(assert (=> b!280985 m!295531))

(declare-fun m!295533 () Bool)

(assert (=> start!27156 m!295533))

(declare-fun m!295535 () Bool)

(assert (=> start!27156 m!295535))

(declare-fun m!295537 () Bool)

(assert (=> b!280986 m!295537))

(declare-fun m!295539 () Bool)

(assert (=> b!280983 m!295539))

(check-sat (not b!280980) (not b!280979) (not b!280986) (not b!280983) (not start!27156) (not b!280984) (not b!280985) (not b!280987))
(check-sat)
