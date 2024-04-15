; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26444 () Bool)

(assert start!26444)

(declare-fun b!274259 () Bool)

(declare-fun e!175598 () Bool)

(assert (=> b!274259 (= e!175598 true)))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13530 0))(
  ( (array!13531 (arr!6414 (Array (_ BitVec 32) (_ BitVec 64))) (size!6767 (_ BitVec 32))) )
))
(declare-fun lt!136748 () array!13530)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13530 (_ BitVec 32)) Bool)

(assert (=> b!274259 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!136748 mask!3868)))

(declare-datatypes ((Unit!8595 0))(
  ( (Unit!8596) )
))
(declare-fun lt!136751 () Unit!8595)

(declare-fun a!3325 () array!13530)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13530 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8595)

(assert (=> b!274259 (= lt!136751 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!274260 () Bool)

(declare-fun e!175595 () Bool)

(declare-fun e!175596 () Bool)

(assert (=> b!274260 (= e!175595 e!175596)))

(declare-fun res!138302 () Bool)

(assert (=> b!274260 (=> (not res!138302) (not e!175596))))

(assert (=> b!274260 (= res!138302 (not (= startIndex!26 i!1267)))))

(assert (=> b!274260 (= lt!136748 (array!13531 (store (arr!6414 a!3325) i!1267 k0!2581) (size!6767 a!3325)))))

(declare-fun b!274261 () Bool)

(declare-fun res!138308 () Bool)

(declare-fun e!175597 () Bool)

(assert (=> b!274261 (=> (not res!138308) (not e!175597))))

(assert (=> b!274261 (= res!138308 (and (= (size!6767 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6767 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6767 a!3325))))))

(declare-fun b!274262 () Bool)

(declare-fun res!138301 () Bool)

(assert (=> b!274262 (=> (not res!138301) (not e!175595))))

(assert (=> b!274262 (= res!138301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274263 () Bool)

(declare-fun res!138307 () Bool)

(assert (=> b!274263 (=> (not res!138307) (not e!175596))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274263 (= res!138307 (validKeyInArray!0 (select (arr!6414 a!3325) startIndex!26)))))

(declare-fun res!138304 () Bool)

(assert (=> start!26444 (=> (not res!138304) (not e!175597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26444 (= res!138304 (validMask!0 mask!3868))))

(assert (=> start!26444 e!175597))

(declare-fun array_inv!4386 (array!13530) Bool)

(assert (=> start!26444 (array_inv!4386 a!3325)))

(assert (=> start!26444 true))

(declare-fun b!274264 () Bool)

(declare-fun res!138303 () Bool)

(assert (=> b!274264 (=> (not res!138303) (not e!175597))))

(assert (=> b!274264 (= res!138303 (validKeyInArray!0 k0!2581))))

(declare-fun b!274265 () Bool)

(assert (=> b!274265 (= e!175596 (not e!175598))))

(declare-fun res!138309 () Bool)

(assert (=> b!274265 (=> res!138309 e!175598)))

(assert (=> b!274265 (= res!138309 (or (bvsge startIndex!26 (bvsub (size!6767 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(assert (=> b!274265 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-fun lt!136747 () Unit!8595)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13530 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8595)

(assert (=> b!274265 (= lt!136747 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1571 0))(
  ( (MissingZero!1571 (index!8454 (_ BitVec 32))) (Found!1571 (index!8455 (_ BitVec 32))) (Intermediate!1571 (undefined!2383 Bool) (index!8456 (_ BitVec 32)) (x!26767 (_ BitVec 32))) (Undefined!1571) (MissingVacant!1571 (index!8457 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13530 (_ BitVec 32)) SeekEntryResult!1571)

(assert (=> b!274265 (= (seekEntryOrOpen!0 (select (arr!6414 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6414 a!3325) i!1267 k0!2581) startIndex!26) lt!136748 mask!3868))))

(declare-fun lt!136749 () Unit!8595)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13530 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8595)

(assert (=> b!274265 (= lt!136749 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4195 0))(
  ( (Nil!4192) (Cons!4191 (h!4858 (_ BitVec 64)) (t!9268 List!4195)) )
))
(declare-fun arrayNoDuplicates!0 (array!13530 (_ BitVec 32) List!4195) Bool)

(assert (=> b!274265 (arrayNoDuplicates!0 lt!136748 #b00000000000000000000000000000000 Nil!4192)))

(declare-fun lt!136750 () Unit!8595)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13530 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4195) Unit!8595)

(assert (=> b!274265 (= lt!136750 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4192))))

(declare-fun b!274266 () Bool)

(assert (=> b!274266 (= e!175597 e!175595)))

(declare-fun res!138305 () Bool)

(assert (=> b!274266 (=> (not res!138305) (not e!175595))))

(declare-fun lt!136752 () SeekEntryResult!1571)

(assert (=> b!274266 (= res!138305 (or (= lt!136752 (MissingZero!1571 i!1267)) (= lt!136752 (MissingVacant!1571 i!1267))))))

(assert (=> b!274266 (= lt!136752 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!274267 () Bool)

(declare-fun res!138310 () Bool)

(assert (=> b!274267 (=> (not res!138310) (not e!175597))))

(assert (=> b!274267 (= res!138310 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4192))))

(declare-fun b!274268 () Bool)

(declare-fun res!138306 () Bool)

(assert (=> b!274268 (=> (not res!138306) (not e!175597))))

(declare-fun arrayContainsKey!0 (array!13530 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274268 (= res!138306 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26444 res!138304) b!274261))

(assert (= (and b!274261 res!138308) b!274264))

(assert (= (and b!274264 res!138303) b!274267))

(assert (= (and b!274267 res!138310) b!274268))

(assert (= (and b!274268 res!138306) b!274266))

(assert (= (and b!274266 res!138305) b!274262))

(assert (= (and b!274262 res!138301) b!274260))

(assert (= (and b!274260 res!138302) b!274263))

(assert (= (and b!274263 res!138307) b!274265))

(assert (= (and b!274265 (not res!138309)) b!274259))

(declare-fun m!289325 () Bool)

(assert (=> b!274259 m!289325))

(declare-fun m!289327 () Bool)

(assert (=> b!274259 m!289327))

(declare-fun m!289329 () Bool)

(assert (=> b!274267 m!289329))

(declare-fun m!289331 () Bool)

(assert (=> b!274265 m!289331))

(declare-fun m!289333 () Bool)

(assert (=> b!274265 m!289333))

(declare-fun m!289335 () Bool)

(assert (=> b!274265 m!289335))

(declare-fun m!289337 () Bool)

(assert (=> b!274265 m!289337))

(declare-fun m!289339 () Bool)

(assert (=> b!274265 m!289339))

(declare-fun m!289341 () Bool)

(assert (=> b!274265 m!289341))

(declare-fun m!289343 () Bool)

(assert (=> b!274265 m!289343))

(declare-fun m!289345 () Bool)

(assert (=> b!274265 m!289345))

(declare-fun m!289347 () Bool)

(assert (=> b!274265 m!289347))

(assert (=> b!274265 m!289341))

(assert (=> b!274265 m!289333))

(declare-fun m!289349 () Bool)

(assert (=> b!274265 m!289349))

(declare-fun m!289351 () Bool)

(assert (=> b!274266 m!289351))

(declare-fun m!289353 () Bool)

(assert (=> start!26444 m!289353))

(declare-fun m!289355 () Bool)

(assert (=> start!26444 m!289355))

(declare-fun m!289357 () Bool)

(assert (=> b!274268 m!289357))

(assert (=> b!274263 m!289341))

(assert (=> b!274263 m!289341))

(declare-fun m!289359 () Bool)

(assert (=> b!274263 m!289359))

(assert (=> b!274260 m!289335))

(declare-fun m!289361 () Bool)

(assert (=> b!274264 m!289361))

(declare-fun m!289363 () Bool)

(assert (=> b!274262 m!289363))

(check-sat (not start!26444) (not b!274268) (not b!274267) (not b!274265) (not b!274266) (not b!274264) (not b!274259) (not b!274262) (not b!274263))
(check-sat)
