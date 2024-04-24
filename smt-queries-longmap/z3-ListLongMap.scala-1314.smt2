; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26442 () Bool)

(assert start!26442)

(declare-fun b!274453 () Bool)

(declare-fun e!175724 () Bool)

(assert (=> b!274453 (= e!175724 true)))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13538 0))(
  ( (array!13539 (arr!6418 (Array (_ BitVec 32) (_ BitVec 64))) (size!6770 (_ BitVec 32))) )
))
(declare-fun lt!136987 () array!13538)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13538 (_ BitVec 32)) Bool)

(assert (=> b!274453 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!136987 mask!3868)))

(declare-fun a!3325 () array!13538)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-datatypes ((Unit!8621 0))(
  ( (Unit!8622) )
))
(declare-fun lt!136992 () Unit!8621)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13538 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8621)

(assert (=> b!274453 (= lt!136992 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!274454 () Bool)

(declare-fun res!138426 () Bool)

(declare-fun e!175721 () Bool)

(assert (=> b!274454 (=> (not res!138426) (not e!175721))))

(declare-fun arrayContainsKey!0 (array!13538 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274454 (= res!138426 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274455 () Bool)

(declare-fun res!138422 () Bool)

(assert (=> b!274455 (=> (not res!138422) (not e!175721))))

(declare-datatypes ((List!4139 0))(
  ( (Nil!4136) (Cons!4135 (h!4802 (_ BitVec 64)) (t!9213 List!4139)) )
))
(declare-fun arrayNoDuplicates!0 (array!13538 (_ BitVec 32) List!4139) Bool)

(assert (=> b!274455 (= res!138422 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4136))))

(declare-fun b!274456 () Bool)

(declare-fun res!138425 () Bool)

(assert (=> b!274456 (=> (not res!138425) (not e!175721))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274456 (= res!138425 (validKeyInArray!0 k0!2581))))

(declare-fun b!274457 () Bool)

(declare-fun e!175723 () Bool)

(assert (=> b!274457 (= e!175721 e!175723)))

(declare-fun res!138418 () Bool)

(assert (=> b!274457 (=> (not res!138418) (not e!175723))))

(declare-datatypes ((SeekEntryResult!1541 0))(
  ( (MissingZero!1541 (index!8334 (_ BitVec 32))) (Found!1541 (index!8335 (_ BitVec 32))) (Intermediate!1541 (undefined!2353 Bool) (index!8336 (_ BitVec 32)) (x!26738 (_ BitVec 32))) (Undefined!1541) (MissingVacant!1541 (index!8337 (_ BitVec 32))) )
))
(declare-fun lt!136988 () SeekEntryResult!1541)

(assert (=> b!274457 (= res!138418 (or (= lt!136988 (MissingZero!1541 i!1267)) (= lt!136988 (MissingVacant!1541 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13538 (_ BitVec 32)) SeekEntryResult!1541)

(assert (=> b!274457 (= lt!136988 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!138417 () Bool)

(assert (=> start!26442 (=> (not res!138417) (not e!175721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26442 (= res!138417 (validMask!0 mask!3868))))

(assert (=> start!26442 e!175721))

(declare-fun array_inv!4368 (array!13538) Bool)

(assert (=> start!26442 (array_inv!4368 a!3325)))

(assert (=> start!26442 true))

(declare-fun b!274458 () Bool)

(declare-fun res!138424 () Bool)

(assert (=> b!274458 (=> (not res!138424) (not e!175721))))

(assert (=> b!274458 (= res!138424 (and (= (size!6770 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6770 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6770 a!3325))))))

(declare-fun b!274459 () Bool)

(declare-fun res!138421 () Bool)

(assert (=> b!274459 (=> (not res!138421) (not e!175723))))

(assert (=> b!274459 (= res!138421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274460 () Bool)

(declare-fun e!175722 () Bool)

(assert (=> b!274460 (= e!175723 e!175722)))

(declare-fun res!138423 () Bool)

(assert (=> b!274460 (=> (not res!138423) (not e!175722))))

(assert (=> b!274460 (= res!138423 (not (= startIndex!26 i!1267)))))

(assert (=> b!274460 (= lt!136987 (array!13539 (store (arr!6418 a!3325) i!1267 k0!2581) (size!6770 a!3325)))))

(declare-fun b!274461 () Bool)

(declare-fun res!138420 () Bool)

(assert (=> b!274461 (=> (not res!138420) (not e!175722))))

(assert (=> b!274461 (= res!138420 (validKeyInArray!0 (select (arr!6418 a!3325) startIndex!26)))))

(declare-fun b!274462 () Bool)

(assert (=> b!274462 (= e!175722 (not e!175724))))

(declare-fun res!138419 () Bool)

(assert (=> b!274462 (=> res!138419 e!175724)))

(assert (=> b!274462 (= res!138419 (or (bvsge startIndex!26 (bvsub (size!6770 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(assert (=> b!274462 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-fun lt!136991 () Unit!8621)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13538 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8621)

(assert (=> b!274462 (= lt!136991 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!274462 (= (seekEntryOrOpen!0 (select (arr!6418 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6418 a!3325) i!1267 k0!2581) startIndex!26) lt!136987 mask!3868))))

(declare-fun lt!136989 () Unit!8621)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13538 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8621)

(assert (=> b!274462 (= lt!136989 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!274462 (arrayNoDuplicates!0 lt!136987 #b00000000000000000000000000000000 Nil!4136)))

(declare-fun lt!136990 () Unit!8621)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13538 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4139) Unit!8621)

(assert (=> b!274462 (= lt!136990 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4136))))

(assert (= (and start!26442 res!138417) b!274458))

(assert (= (and b!274458 res!138424) b!274456))

(assert (= (and b!274456 res!138425) b!274455))

(assert (= (and b!274455 res!138422) b!274454))

(assert (= (and b!274454 res!138426) b!274457))

(assert (= (and b!274457 res!138418) b!274459))

(assert (= (and b!274459 res!138421) b!274460))

(assert (= (and b!274460 res!138423) b!274461))

(assert (= (and b!274461 res!138420) b!274462))

(assert (= (and b!274462 (not res!138419)) b!274453))

(declare-fun m!290123 () Bool)

(assert (=> b!274455 m!290123))

(declare-fun m!290125 () Bool)

(assert (=> b!274457 m!290125))

(declare-fun m!290127 () Bool)

(assert (=> b!274462 m!290127))

(declare-fun m!290129 () Bool)

(assert (=> b!274462 m!290129))

(declare-fun m!290131 () Bool)

(assert (=> b!274462 m!290131))

(declare-fun m!290133 () Bool)

(assert (=> b!274462 m!290133))

(declare-fun m!290135 () Bool)

(assert (=> b!274462 m!290135))

(declare-fun m!290137 () Bool)

(assert (=> b!274462 m!290137))

(declare-fun m!290139 () Bool)

(assert (=> b!274462 m!290139))

(declare-fun m!290141 () Bool)

(assert (=> b!274462 m!290141))

(assert (=> b!274462 m!290137))

(declare-fun m!290143 () Bool)

(assert (=> b!274462 m!290143))

(assert (=> b!274462 m!290129))

(declare-fun m!290145 () Bool)

(assert (=> b!274462 m!290145))

(declare-fun m!290147 () Bool)

(assert (=> b!274453 m!290147))

(declare-fun m!290149 () Bool)

(assert (=> b!274453 m!290149))

(assert (=> b!274460 m!290133))

(declare-fun m!290151 () Bool)

(assert (=> b!274456 m!290151))

(declare-fun m!290153 () Bool)

(assert (=> b!274459 m!290153))

(declare-fun m!290155 () Bool)

(assert (=> b!274454 m!290155))

(assert (=> b!274461 m!290137))

(assert (=> b!274461 m!290137))

(declare-fun m!290157 () Bool)

(assert (=> b!274461 m!290157))

(declare-fun m!290159 () Bool)

(assert (=> start!26442 m!290159))

(declare-fun m!290161 () Bool)

(assert (=> start!26442 m!290161))

(check-sat (not b!274457) (not start!26442) (not b!274456) (not b!274453) (not b!274459) (not b!274461) (not b!274455) (not b!274462) (not b!274454))
(check-sat)
