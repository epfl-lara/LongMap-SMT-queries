; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26264 () Bool)

(assert start!26264)

(declare-fun b!271983 () Bool)

(declare-fun e!174702 () Bool)

(declare-fun e!174704 () Bool)

(assert (=> b!271983 (= e!174702 e!174704)))

(declare-fun res!135980 () Bool)

(assert (=> b!271983 (=> (not res!135980) (not e!174704))))

(declare-datatypes ((SeekEntryResult!1488 0))(
  ( (MissingZero!1488 (index!8122 (_ BitVec 32))) (Found!1488 (index!8123 (_ BitVec 32))) (Intermediate!1488 (undefined!2300 Bool) (index!8124 (_ BitVec 32)) (x!26445 (_ BitVec 32))) (Undefined!1488) (MissingVacant!1488 (index!8125 (_ BitVec 32))) )
))
(declare-fun lt!135900 () SeekEntryResult!1488)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271983 (= res!135980 (or (= lt!135900 (MissingZero!1488 i!1267)) (= lt!135900 (MissingVacant!1488 i!1267))))))

(declare-datatypes ((array!13361 0))(
  ( (array!13362 (arr!6330 (Array (_ BitVec 32) (_ BitVec 64))) (size!6682 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13361)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13361 (_ BitVec 32)) SeekEntryResult!1488)

(assert (=> b!271983 (= lt!135900 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!135974 () Bool)

(assert (=> start!26264 (=> (not res!135974) (not e!174702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26264 (= res!135974 (validMask!0 mask!3868))))

(assert (=> start!26264 e!174702))

(declare-fun array_inv!4293 (array!13361) Bool)

(assert (=> start!26264 (array_inv!4293 a!3325)))

(assert (=> start!26264 true))

(declare-fun b!271984 () Bool)

(declare-fun res!135979 () Bool)

(assert (=> b!271984 (=> (not res!135979) (not e!174702))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!271984 (= res!135979 (and (= (size!6682 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6682 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6682 a!3325))))))

(declare-fun b!271985 () Bool)

(declare-fun res!135981 () Bool)

(assert (=> b!271985 (=> (not res!135981) (not e!174702))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271985 (= res!135981 (validKeyInArray!0 k0!2581))))

(declare-fun b!271986 () Bool)

(declare-fun res!135975 () Bool)

(assert (=> b!271986 (=> (not res!135975) (not e!174704))))

(assert (=> b!271986 (= res!135975 (not (= startIndex!26 i!1267)))))

(declare-fun b!271987 () Bool)

(declare-fun res!135976 () Bool)

(assert (=> b!271987 (=> (not res!135976) (not e!174702))))

(declare-fun arrayContainsKey!0 (array!13361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271987 (= res!135976 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271988 () Bool)

(declare-fun res!135973 () Bool)

(assert (=> b!271988 (=> (not res!135973) (not e!174702))))

(declare-datatypes ((List!4138 0))(
  ( (Nil!4135) (Cons!4134 (h!4801 (_ BitVec 64)) (t!9220 List!4138)) )
))
(declare-fun arrayNoDuplicates!0 (array!13361 (_ BitVec 32) List!4138) Bool)

(assert (=> b!271988 (= res!135973 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4135))))

(declare-fun b!271989 () Bool)

(declare-fun res!135978 () Bool)

(assert (=> b!271989 (=> (not res!135978) (not e!174704))))

(assert (=> b!271989 (= res!135978 (validKeyInArray!0 (select (arr!6330 a!3325) startIndex!26)))))

(declare-fun b!271990 () Bool)

(assert (=> b!271990 (= e!174704 (not true))))

(assert (=> b!271990 (arrayNoDuplicates!0 (array!13362 (store (arr!6330 a!3325) i!1267 k0!2581) (size!6682 a!3325)) #b00000000000000000000000000000000 Nil!4135)))

(declare-datatypes ((Unit!8463 0))(
  ( (Unit!8464) )
))
(declare-fun lt!135901 () Unit!8463)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13361 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4138) Unit!8463)

(assert (=> b!271990 (= lt!135901 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4135))))

(declare-fun b!271991 () Bool)

(declare-fun res!135977 () Bool)

(assert (=> b!271991 (=> (not res!135977) (not e!174704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13361 (_ BitVec 32)) Bool)

(assert (=> b!271991 (= res!135977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26264 res!135974) b!271984))

(assert (= (and b!271984 res!135979) b!271985))

(assert (= (and b!271985 res!135981) b!271988))

(assert (= (and b!271988 res!135973) b!271987))

(assert (= (and b!271987 res!135976) b!271983))

(assert (= (and b!271983 res!135980) b!271991))

(assert (= (and b!271991 res!135977) b!271986))

(assert (= (and b!271986 res!135975) b!271989))

(assert (= (and b!271989 res!135978) b!271990))

(declare-fun m!287133 () Bool)

(assert (=> b!271989 m!287133))

(assert (=> b!271989 m!287133))

(declare-fun m!287135 () Bool)

(assert (=> b!271989 m!287135))

(declare-fun m!287137 () Bool)

(assert (=> start!26264 m!287137))

(declare-fun m!287139 () Bool)

(assert (=> start!26264 m!287139))

(declare-fun m!287141 () Bool)

(assert (=> b!271983 m!287141))

(declare-fun m!287143 () Bool)

(assert (=> b!271987 m!287143))

(declare-fun m!287145 () Bool)

(assert (=> b!271985 m!287145))

(declare-fun m!287147 () Bool)

(assert (=> b!271991 m!287147))

(declare-fun m!287149 () Bool)

(assert (=> b!271990 m!287149))

(declare-fun m!287151 () Bool)

(assert (=> b!271990 m!287151))

(declare-fun m!287153 () Bool)

(assert (=> b!271990 m!287153))

(declare-fun m!287155 () Bool)

(assert (=> b!271988 m!287155))

(check-sat (not b!271989) (not b!271991) (not b!271985) (not b!271988) (not start!26264) (not b!271990) (not b!271987) (not b!271983))
(check-sat)
