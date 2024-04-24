; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27252 () Bool)

(assert start!27252)

(declare-fun res!145326 () Bool)

(declare-fun e!179244 () Bool)

(assert (=> start!27252 (=> (not res!145326) (not e!179244))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27252 (= res!145326 (validMask!0 mask!3868))))

(assert (=> start!27252 e!179244))

(declare-datatypes ((array!14069 0))(
  ( (array!14070 (arr!6676 (Array (_ BitVec 32) (_ BitVec 64))) (size!7028 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14069)

(declare-fun array_inv!4626 (array!14069) Bool)

(assert (=> start!27252 (array_inv!4626 a!3325)))

(assert (=> start!27252 true))

(declare-fun b!282275 () Bool)

(declare-fun res!145322 () Bool)

(assert (=> b!282275 (=> (not res!145322) (not e!179244))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14069 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282275 (= res!145322 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282276 () Bool)

(declare-fun e!179246 () Bool)

(assert (=> b!282276 (= e!179244 e!179246)))

(declare-fun res!145324 () Bool)

(assert (=> b!282276 (=> (not res!145324) (not e!179246))))

(declare-datatypes ((SeekEntryResult!1799 0))(
  ( (MissingZero!1799 (index!9366 (_ BitVec 32))) (Found!1799 (index!9367 (_ BitVec 32))) (Intermediate!1799 (undefined!2611 Bool) (index!9368 (_ BitVec 32)) (x!27693 (_ BitVec 32))) (Undefined!1799) (MissingVacant!1799 (index!9369 (_ BitVec 32))) )
))
(declare-fun lt!139491 () SeekEntryResult!1799)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282276 (= res!145324 (or (= lt!139491 (MissingZero!1799 i!1267)) (= lt!139491 (MissingVacant!1799 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14069 (_ BitVec 32)) SeekEntryResult!1799)

(assert (=> b!282276 (= lt!139491 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282277 () Bool)

(declare-fun e!179245 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!282277 (= e!179245 (not (or (bvsge startIndex!26 (bvsub (size!7028 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14069 (_ BitVec 32)) Bool)

(assert (=> b!282277 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8928 0))(
  ( (Unit!8929) )
))
(declare-fun lt!139489 () Unit!8928)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14069 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8928)

(assert (=> b!282277 (= lt!139489 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!139490 () array!14069)

(assert (=> b!282277 (= (seekEntryOrOpen!0 (select (arr!6676 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6676 a!3325) i!1267 k0!2581) startIndex!26) lt!139490 mask!3868))))

(declare-fun lt!139488 () Unit!8928)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14069 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8928)

(assert (=> b!282277 (= lt!139488 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4397 0))(
  ( (Nil!4394) (Cons!4393 (h!5063 (_ BitVec 64)) (t!9471 List!4397)) )
))
(declare-fun arrayNoDuplicates!0 (array!14069 (_ BitVec 32) List!4397) Bool)

(assert (=> b!282277 (arrayNoDuplicates!0 lt!139490 #b00000000000000000000000000000000 Nil!4394)))

(declare-fun lt!139487 () Unit!8928)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14069 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4397) Unit!8928)

(assert (=> b!282277 (= lt!139487 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4394))))

(declare-fun b!282278 () Bool)

(assert (=> b!282278 (= e!179246 e!179245)))

(declare-fun res!145320 () Bool)

(assert (=> b!282278 (=> (not res!145320) (not e!179245))))

(assert (=> b!282278 (= res!145320 (not (= startIndex!26 i!1267)))))

(assert (=> b!282278 (= lt!139490 (array!14070 (store (arr!6676 a!3325) i!1267 k0!2581) (size!7028 a!3325)))))

(declare-fun b!282279 () Bool)

(declare-fun res!145321 () Bool)

(assert (=> b!282279 (=> (not res!145321) (not e!179244))))

(assert (=> b!282279 (= res!145321 (and (= (size!7028 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7028 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7028 a!3325))))))

(declare-fun b!282280 () Bool)

(declare-fun res!145323 () Bool)

(assert (=> b!282280 (=> (not res!145323) (not e!179244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282280 (= res!145323 (validKeyInArray!0 k0!2581))))

(declare-fun b!282281 () Bool)

(declare-fun res!145319 () Bool)

(assert (=> b!282281 (=> (not res!145319) (not e!179245))))

(assert (=> b!282281 (= res!145319 (validKeyInArray!0 (select (arr!6676 a!3325) startIndex!26)))))

(declare-fun b!282282 () Bool)

(declare-fun res!145318 () Bool)

(assert (=> b!282282 (=> (not res!145318) (not e!179244))))

(assert (=> b!282282 (= res!145318 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4394))))

(declare-fun b!282283 () Bool)

(declare-fun res!145325 () Bool)

(assert (=> b!282283 (=> (not res!145325) (not e!179246))))

(assert (=> b!282283 (= res!145325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27252 res!145326) b!282279))

(assert (= (and b!282279 res!145321) b!282280))

(assert (= (and b!282280 res!145323) b!282282))

(assert (= (and b!282282 res!145318) b!282275))

(assert (= (and b!282275 res!145322) b!282276))

(assert (= (and b!282276 res!145324) b!282283))

(assert (= (and b!282283 res!145325) b!282278))

(assert (= (and b!282278 res!145320) b!282281))

(assert (= (and b!282281 res!145319) b!282277))

(declare-fun m!296933 () Bool)

(assert (=> b!282281 m!296933))

(assert (=> b!282281 m!296933))

(declare-fun m!296935 () Bool)

(assert (=> b!282281 m!296935))

(declare-fun m!296937 () Bool)

(assert (=> start!27252 m!296937))

(declare-fun m!296939 () Bool)

(assert (=> start!27252 m!296939))

(declare-fun m!296941 () Bool)

(assert (=> b!282283 m!296941))

(declare-fun m!296943 () Bool)

(assert (=> b!282275 m!296943))

(declare-fun m!296945 () Bool)

(assert (=> b!282280 m!296945))

(declare-fun m!296947 () Bool)

(assert (=> b!282276 m!296947))

(declare-fun m!296949 () Bool)

(assert (=> b!282282 m!296949))

(declare-fun m!296951 () Bool)

(assert (=> b!282277 m!296951))

(declare-fun m!296953 () Bool)

(assert (=> b!282277 m!296953))

(declare-fun m!296955 () Bool)

(assert (=> b!282277 m!296955))

(assert (=> b!282277 m!296953))

(declare-fun m!296957 () Bool)

(assert (=> b!282277 m!296957))

(declare-fun m!296959 () Bool)

(assert (=> b!282277 m!296959))

(declare-fun m!296961 () Bool)

(assert (=> b!282277 m!296961))

(declare-fun m!296963 () Bool)

(assert (=> b!282277 m!296963))

(assert (=> b!282277 m!296933))

(declare-fun m!296965 () Bool)

(assert (=> b!282277 m!296965))

(assert (=> b!282277 m!296933))

(declare-fun m!296967 () Bool)

(assert (=> b!282277 m!296967))

(assert (=> b!282278 m!296957))

(check-sat (not b!282280) (not b!282281) (not b!282276) (not b!282282) (not b!282275) (not b!282283) (not b!282277) (not start!27252))
(check-sat)
