; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26124 () Bool)

(assert start!26124)

(declare-fun res!133777 () Bool)

(declare-fun e!173913 () Bool)

(assert (=> start!26124 (=> (not res!133777) (not e!173913))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26124 (= res!133777 (validMask!0 mask!3868))))

(assert (=> start!26124 e!173913))

(declare-datatypes ((array!13221 0))(
  ( (array!13222 (arr!6260 (Array (_ BitVec 32) (_ BitVec 64))) (size!6612 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13221)

(declare-fun array_inv!4223 (array!13221) Bool)

(assert (=> start!26124 (array_inv!4223 a!3325)))

(assert (=> start!26124 true))

(declare-fun b!269609 () Bool)

(declare-fun res!133776 () Bool)

(declare-fun e!173912 () Bool)

(assert (=> b!269609 (=> (not res!133776) (not e!173912))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269609 (= res!133776 (= startIndex!26 i!1267))))

(declare-fun b!269610 () Bool)

(assert (=> b!269610 (= e!173912 false)))

(declare-datatypes ((Unit!8359 0))(
  ( (Unit!8360) )
))
(declare-fun lt!135248 () Unit!8359)

(declare-fun e!173915 () Unit!8359)

(assert (=> b!269610 (= lt!135248 e!173915)))

(declare-fun c!45468 () Bool)

(assert (=> b!269610 (= c!45468 (bvslt startIndex!26 (bvsub (size!6612 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269611 () Bool)

(declare-fun Unit!8361 () Unit!8359)

(assert (=> b!269611 (= e!173915 Unit!8361)))

(declare-fun b!269612 () Bool)

(declare-fun res!133782 () Bool)

(assert (=> b!269612 (=> (not res!133782) (not e!173913))))

(declare-datatypes ((List!4068 0))(
  ( (Nil!4065) (Cons!4064 (h!4731 (_ BitVec 64)) (t!9150 List!4068)) )
))
(declare-fun arrayNoDuplicates!0 (array!13221 (_ BitVec 32) List!4068) Bool)

(assert (=> b!269612 (= res!133782 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4065))))

(declare-fun b!269613 () Bool)

(declare-fun res!133778 () Bool)

(assert (=> b!269613 (=> (not res!133778) (not e!173912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13221 (_ BitVec 32)) Bool)

(assert (=> b!269613 (= res!133778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269614 () Bool)

(declare-fun res!133775 () Bool)

(assert (=> b!269614 (=> (not res!133775) (not e!173913))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269614 (= res!133775 (validKeyInArray!0 k!2581))))

(declare-fun b!269615 () Bool)

(declare-fun lt!135250 () Unit!8359)

(assert (=> b!269615 (= e!173915 lt!135250)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13221 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8359)

(assert (=> b!269615 (= lt!135250 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!269615 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13222 (store (arr!6260 a!3325) i!1267 k!2581) (size!6612 a!3325)) mask!3868)))

(declare-fun b!269616 () Bool)

(declare-fun res!133781 () Bool)

(assert (=> b!269616 (=> (not res!133781) (not e!173913))))

(assert (=> b!269616 (= res!133781 (and (= (size!6612 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6612 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6612 a!3325))))))

(declare-fun b!269617 () Bool)

(declare-fun res!133779 () Bool)

(assert (=> b!269617 (=> (not res!133779) (not e!173913))))

(declare-fun arrayContainsKey!0 (array!13221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269617 (= res!133779 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269618 () Bool)

(assert (=> b!269618 (= e!173913 e!173912)))

(declare-fun res!133780 () Bool)

(assert (=> b!269618 (=> (not res!133780) (not e!173912))))

(declare-datatypes ((SeekEntryResult!1418 0))(
  ( (MissingZero!1418 (index!7842 (_ BitVec 32))) (Found!1418 (index!7843 (_ BitVec 32))) (Intermediate!1418 (undefined!2230 Bool) (index!7844 (_ BitVec 32)) (x!26191 (_ BitVec 32))) (Undefined!1418) (MissingVacant!1418 (index!7845 (_ BitVec 32))) )
))
(declare-fun lt!135249 () SeekEntryResult!1418)

(assert (=> b!269618 (= res!133780 (or (= lt!135249 (MissingZero!1418 i!1267)) (= lt!135249 (MissingVacant!1418 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13221 (_ BitVec 32)) SeekEntryResult!1418)

(assert (=> b!269618 (= lt!135249 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26124 res!133777) b!269616))

(assert (= (and b!269616 res!133781) b!269614))

(assert (= (and b!269614 res!133775) b!269612))

(assert (= (and b!269612 res!133782) b!269617))

(assert (= (and b!269617 res!133779) b!269618))

(assert (= (and b!269618 res!133780) b!269613))

(assert (= (and b!269613 res!133778) b!269609))

(assert (= (and b!269609 res!133776) b!269610))

(assert (= (and b!269610 c!45468) b!269615))

(assert (= (and b!269610 (not c!45468)) b!269611))

(declare-fun m!285411 () Bool)

(assert (=> b!269618 m!285411))

(declare-fun m!285413 () Bool)

(assert (=> b!269617 m!285413))

(declare-fun m!285415 () Bool)

(assert (=> start!26124 m!285415))

(declare-fun m!285417 () Bool)

(assert (=> start!26124 m!285417))

(declare-fun m!285419 () Bool)

(assert (=> b!269613 m!285419))

(declare-fun m!285421 () Bool)

(assert (=> b!269612 m!285421))

(declare-fun m!285423 () Bool)

(assert (=> b!269614 m!285423))

(declare-fun m!285425 () Bool)

(assert (=> b!269615 m!285425))

(declare-fun m!285427 () Bool)

(assert (=> b!269615 m!285427))

(declare-fun m!285429 () Bool)

(assert (=> b!269615 m!285429))

(push 1)

