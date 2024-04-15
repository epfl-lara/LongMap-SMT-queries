; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26096 () Bool)

(assert start!26096)

(declare-fun b!269012 () Bool)

(declare-fun res!133322 () Bool)

(declare-fun e!173634 () Bool)

(assert (=> b!269012 (=> (not res!133322) (not e!173634))))

(declare-datatypes ((array!13182 0))(
  ( (array!13183 (arr!6240 (Array (_ BitVec 32) (_ BitVec 64))) (size!6593 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13182)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!269012 (= res!133322 (and (= (size!6593 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6593 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6593 a!3325))))))

(declare-fun b!269013 () Bool)

(declare-fun res!133324 () Bool)

(declare-fun e!173633 () Bool)

(assert (=> b!269013 (=> (not res!133324) (not e!173633))))

(assert (=> b!269013 (= res!133324 (= startIndex!26 i!1267))))

(declare-fun b!269014 () Bool)

(assert (=> b!269014 (= e!173634 e!173633)))

(declare-fun res!133320 () Bool)

(assert (=> b!269014 (=> (not res!133320) (not e!173633))))

(declare-datatypes ((SeekEntryResult!1397 0))(
  ( (MissingZero!1397 (index!7758 (_ BitVec 32))) (Found!1397 (index!7759 (_ BitVec 32))) (Intermediate!1397 (undefined!2209 Bool) (index!7760 (_ BitVec 32)) (x!26129 (_ BitVec 32))) (Undefined!1397) (MissingVacant!1397 (index!7761 (_ BitVec 32))) )
))
(declare-fun lt!134934 () SeekEntryResult!1397)

(assert (=> b!269014 (= res!133320 (or (= lt!134934 (MissingZero!1397 i!1267)) (= lt!134934 (MissingVacant!1397 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13182 (_ BitVec 32)) SeekEntryResult!1397)

(assert (=> b!269014 (= lt!134934 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!269015 () Bool)

(declare-datatypes ((Unit!8268 0))(
  ( (Unit!8269) )
))
(declare-fun e!173631 () Unit!8268)

(declare-fun lt!134933 () Unit!8268)

(assert (=> b!269015 (= e!173631 lt!134933)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13182 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8268)

(assert (=> b!269015 (= lt!134933 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13182 (_ BitVec 32)) Bool)

(assert (=> b!269015 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13183 (store (arr!6240 a!3325) i!1267 k0!2581) (size!6593 a!3325)) mask!3868)))

(declare-fun res!133323 () Bool)

(assert (=> start!26096 (=> (not res!133323) (not e!173634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26096 (= res!133323 (validMask!0 mask!3868))))

(assert (=> start!26096 e!173634))

(declare-fun array_inv!4212 (array!13182) Bool)

(assert (=> start!26096 (array_inv!4212 a!3325)))

(assert (=> start!26096 true))

(declare-fun b!269016 () Bool)

(declare-fun res!133326 () Bool)

(assert (=> b!269016 (=> (not res!133326) (not e!173634))))

(declare-fun arrayContainsKey!0 (array!13182 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269016 (= res!133326 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269017 () Bool)

(declare-fun Unit!8270 () Unit!8268)

(assert (=> b!269017 (= e!173631 Unit!8270)))

(declare-fun b!269018 () Bool)

(declare-fun res!133321 () Bool)

(assert (=> b!269018 (=> (not res!133321) (not e!173634))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269018 (= res!133321 (validKeyInArray!0 k0!2581))))

(declare-fun b!269019 () Bool)

(declare-fun res!133325 () Bool)

(assert (=> b!269019 (=> (not res!133325) (not e!173633))))

(assert (=> b!269019 (= res!133325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269020 () Bool)

(assert (=> b!269020 (= e!173633 false)))

(declare-fun lt!134932 () Unit!8268)

(assert (=> b!269020 (= lt!134932 e!173631)))

(declare-fun c!45397 () Bool)

(assert (=> b!269020 (= c!45397 (bvslt startIndex!26 (bvsub (size!6593 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269021 () Bool)

(declare-fun res!133327 () Bool)

(assert (=> b!269021 (=> (not res!133327) (not e!173634))))

(declare-datatypes ((List!4021 0))(
  ( (Nil!4018) (Cons!4017 (h!4684 (_ BitVec 64)) (t!9094 List!4021)) )
))
(declare-fun arrayNoDuplicates!0 (array!13182 (_ BitVec 32) List!4021) Bool)

(assert (=> b!269021 (= res!133327 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4018))))

(assert (= (and start!26096 res!133323) b!269012))

(assert (= (and b!269012 res!133322) b!269018))

(assert (= (and b!269018 res!133321) b!269021))

(assert (= (and b!269021 res!133327) b!269016))

(assert (= (and b!269016 res!133326) b!269014))

(assert (= (and b!269014 res!133320) b!269019))

(assert (= (and b!269019 res!133325) b!269013))

(assert (= (and b!269013 res!133324) b!269020))

(assert (= (and b!269020 c!45397) b!269015))

(assert (= (and b!269020 (not c!45397)) b!269017))

(declare-fun m!284519 () Bool)

(assert (=> start!26096 m!284519))

(declare-fun m!284521 () Bool)

(assert (=> start!26096 m!284521))

(declare-fun m!284523 () Bool)

(assert (=> b!269021 m!284523))

(declare-fun m!284525 () Bool)

(assert (=> b!269014 m!284525))

(declare-fun m!284527 () Bool)

(assert (=> b!269019 m!284527))

(declare-fun m!284529 () Bool)

(assert (=> b!269016 m!284529))

(declare-fun m!284531 () Bool)

(assert (=> b!269015 m!284531))

(declare-fun m!284533 () Bool)

(assert (=> b!269015 m!284533))

(declare-fun m!284535 () Bool)

(assert (=> b!269015 m!284535))

(declare-fun m!284537 () Bool)

(assert (=> b!269018 m!284537))

(check-sat (not b!269014) (not b!269021) (not b!269018) (not start!26096) (not b!269019) (not b!269016) (not b!269015))
(check-sat)
