; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27242 () Bool)

(assert start!27242)

(declare-fun b!282093 () Bool)

(declare-fun res!145162 () Bool)

(declare-fun e!179160 () Bool)

(assert (=> b!282093 (=> (not res!145162) (not e!179160))))

(declare-datatypes ((array!14060 0))(
  ( (array!14061 (arr!6672 (Array (_ BitVec 32) (_ BitVec 64))) (size!7024 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14060)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14060 (_ BitVec 32)) Bool)

(assert (=> b!282093 (= res!145162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282094 () Bool)

(declare-fun res!145165 () Bool)

(declare-fun e!179161 () Bool)

(assert (=> b!282094 (=> (not res!145165) (not e!179161))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282094 (= res!145165 (and (= (size!7024 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7024 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7024 a!3325))))))

(declare-fun b!282095 () Bool)

(declare-fun e!179159 () Bool)

(assert (=> b!282095 (= e!179160 e!179159)))

(declare-fun res!145164 () Bool)

(assert (=> b!282095 (=> (not res!145164) (not e!179159))))

(assert (=> b!282095 (= res!145164 (not (= startIndex!26 i!1267)))))

(declare-fun lt!139355 () array!14060)

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!282095 (= lt!139355 (array!14061 (store (arr!6672 a!3325) i!1267 k0!2581) (size!7024 a!3325)))))

(declare-fun b!282096 () Bool)

(assert (=> b!282096 (= e!179159 (not true))))

(assert (=> b!282096 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8944 0))(
  ( (Unit!8945) )
))
(declare-fun lt!139357 () Unit!8944)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14060 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8944)

(assert (=> b!282096 (= lt!139357 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1830 0))(
  ( (MissingZero!1830 (index!9490 (_ BitVec 32))) (Found!1830 (index!9491 (_ BitVec 32))) (Intermediate!1830 (undefined!2642 Bool) (index!9492 (_ BitVec 32)) (x!27708 (_ BitVec 32))) (Undefined!1830) (MissingVacant!1830 (index!9493 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14060 (_ BitVec 32)) SeekEntryResult!1830)

(assert (=> b!282096 (= (seekEntryOrOpen!0 (select (arr!6672 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6672 a!3325) i!1267 k0!2581) startIndex!26) lt!139355 mask!3868))))

(declare-fun lt!139353 () Unit!8944)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14060 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8944)

(assert (=> b!282096 (= lt!139353 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4480 0))(
  ( (Nil!4477) (Cons!4476 (h!5146 (_ BitVec 64)) (t!9562 List!4480)) )
))
(declare-fun arrayNoDuplicates!0 (array!14060 (_ BitVec 32) List!4480) Bool)

(assert (=> b!282096 (arrayNoDuplicates!0 lt!139355 #b00000000000000000000000000000000 Nil!4477)))

(declare-fun lt!139354 () Unit!8944)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14060 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4480) Unit!8944)

(assert (=> b!282096 (= lt!139354 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4477))))

(declare-fun b!282097 () Bool)

(declare-fun res!145163 () Bool)

(assert (=> b!282097 (=> (not res!145163) (not e!179161))))

(declare-fun arrayContainsKey!0 (array!14060 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282097 (= res!145163 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!145170 () Bool)

(assert (=> start!27242 (=> (not res!145170) (not e!179161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27242 (= res!145170 (validMask!0 mask!3868))))

(assert (=> start!27242 e!179161))

(declare-fun array_inv!4635 (array!14060) Bool)

(assert (=> start!27242 (array_inv!4635 a!3325)))

(assert (=> start!27242 true))

(declare-fun b!282098 () Bool)

(assert (=> b!282098 (= e!179161 e!179160)))

(declare-fun res!145167 () Bool)

(assert (=> b!282098 (=> (not res!145167) (not e!179160))))

(declare-fun lt!139356 () SeekEntryResult!1830)

(assert (=> b!282098 (= res!145167 (or (= lt!139356 (MissingZero!1830 i!1267)) (= lt!139356 (MissingVacant!1830 i!1267))))))

(assert (=> b!282098 (= lt!139356 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282099 () Bool)

(declare-fun res!145169 () Bool)

(assert (=> b!282099 (=> (not res!145169) (not e!179161))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282099 (= res!145169 (validKeyInArray!0 k0!2581))))

(declare-fun b!282100 () Bool)

(declare-fun res!145168 () Bool)

(assert (=> b!282100 (=> (not res!145168) (not e!179159))))

(assert (=> b!282100 (= res!145168 (validKeyInArray!0 (select (arr!6672 a!3325) startIndex!26)))))

(declare-fun b!282101 () Bool)

(declare-fun res!145166 () Bool)

(assert (=> b!282101 (=> (not res!145166) (not e!179161))))

(assert (=> b!282101 (= res!145166 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4477))))

(assert (= (and start!27242 res!145170) b!282094))

(assert (= (and b!282094 res!145165) b!282099))

(assert (= (and b!282099 res!145169) b!282101))

(assert (= (and b!282101 res!145166) b!282097))

(assert (= (and b!282097 res!145163) b!282098))

(assert (= (and b!282098 res!145167) b!282093))

(assert (= (and b!282093 res!145162) b!282095))

(assert (= (and b!282095 res!145164) b!282100))

(assert (= (and b!282100 res!145168) b!282096))

(declare-fun m!296547 () Bool)

(assert (=> b!282095 m!296547))

(declare-fun m!296549 () Bool)

(assert (=> start!27242 m!296549))

(declare-fun m!296551 () Bool)

(assert (=> start!27242 m!296551))

(declare-fun m!296553 () Bool)

(assert (=> b!282099 m!296553))

(declare-fun m!296555 () Bool)

(assert (=> b!282101 m!296555))

(declare-fun m!296557 () Bool)

(assert (=> b!282098 m!296557))

(declare-fun m!296559 () Bool)

(assert (=> b!282097 m!296559))

(declare-fun m!296561 () Bool)

(assert (=> b!282100 m!296561))

(assert (=> b!282100 m!296561))

(declare-fun m!296563 () Bool)

(assert (=> b!282100 m!296563))

(declare-fun m!296565 () Bool)

(assert (=> b!282093 m!296565))

(declare-fun m!296567 () Bool)

(assert (=> b!282096 m!296567))

(declare-fun m!296569 () Bool)

(assert (=> b!282096 m!296569))

(declare-fun m!296571 () Bool)

(assert (=> b!282096 m!296571))

(assert (=> b!282096 m!296569))

(assert (=> b!282096 m!296547))

(declare-fun m!296573 () Bool)

(assert (=> b!282096 m!296573))

(assert (=> b!282096 m!296561))

(declare-fun m!296575 () Bool)

(assert (=> b!282096 m!296575))

(declare-fun m!296577 () Bool)

(assert (=> b!282096 m!296577))

(declare-fun m!296579 () Bool)

(assert (=> b!282096 m!296579))

(assert (=> b!282096 m!296561))

(declare-fun m!296581 () Bool)

(assert (=> b!282096 m!296581))

(check-sat (not start!27242) (not b!282093) (not b!282100) (not b!282098) (not b!282099) (not b!282101) (not b!282096) (not b!282097))
(check-sat)
