; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26122 () Bool)

(assert start!26122)

(declare-fun b!269579 () Bool)

(declare-datatypes ((Unit!8356 0))(
  ( (Unit!8357) )
))
(declare-fun e!173901 () Unit!8356)

(declare-fun lt!135241 () Unit!8356)

(assert (=> b!269579 (= e!173901 lt!135241)))

(declare-datatypes ((array!13219 0))(
  ( (array!13220 (arr!6259 (Array (_ BitVec 32) (_ BitVec 64))) (size!6611 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13219)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13219 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8356)

(assert (=> b!269579 (= lt!135241 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13219 (_ BitVec 32)) Bool)

(assert (=> b!269579 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13220 (store (arr!6259 a!3325) i!1267 k!2581) (size!6611 a!3325)) mask!3868)))

(declare-fun b!269580 () Bool)

(declare-fun res!133757 () Bool)

(declare-fun e!173903 () Bool)

(assert (=> b!269580 (=> (not res!133757) (not e!173903))))

(assert (=> b!269580 (= res!133757 (and (= (size!6611 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6611 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6611 a!3325))))))

(declare-fun b!269581 () Bool)

(declare-fun Unit!8358 () Unit!8356)

(assert (=> b!269581 (= e!173901 Unit!8358)))

(declare-fun b!269582 () Bool)

(declare-fun res!133754 () Bool)

(assert (=> b!269582 (=> (not res!133754) (not e!173903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269582 (= res!133754 (validKeyInArray!0 k!2581))))

(declare-fun b!269584 () Bool)

(declare-fun res!133751 () Bool)

(declare-fun e!173902 () Bool)

(assert (=> b!269584 (=> (not res!133751) (not e!173902))))

(assert (=> b!269584 (= res!133751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269585 () Bool)

(declare-fun res!133755 () Bool)

(assert (=> b!269585 (=> (not res!133755) (not e!173903))))

(declare-fun arrayContainsKey!0 (array!13219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269585 (= res!133755 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269586 () Bool)

(assert (=> b!269586 (= e!173902 false)))

(declare-fun lt!135240 () Unit!8356)

(assert (=> b!269586 (= lt!135240 e!173901)))

(declare-fun c!45465 () Bool)

(assert (=> b!269586 (= c!45465 (bvslt startIndex!26 (bvsub (size!6611 a!3325) #b00000000000000000000000000000001)))))

(declare-fun res!133756 () Bool)

(assert (=> start!26122 (=> (not res!133756) (not e!173903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26122 (= res!133756 (validMask!0 mask!3868))))

(assert (=> start!26122 e!173903))

(declare-fun array_inv!4222 (array!13219) Bool)

(assert (=> start!26122 (array_inv!4222 a!3325)))

(assert (=> start!26122 true))

(declare-fun b!269583 () Bool)

(declare-fun res!133753 () Bool)

(assert (=> b!269583 (=> (not res!133753) (not e!173902))))

(assert (=> b!269583 (= res!133753 (= startIndex!26 i!1267))))

(declare-fun b!269587 () Bool)

(declare-fun res!133758 () Bool)

(assert (=> b!269587 (=> (not res!133758) (not e!173903))))

(declare-datatypes ((List!4067 0))(
  ( (Nil!4064) (Cons!4063 (h!4730 (_ BitVec 64)) (t!9149 List!4067)) )
))
(declare-fun arrayNoDuplicates!0 (array!13219 (_ BitVec 32) List!4067) Bool)

(assert (=> b!269587 (= res!133758 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4064))))

(declare-fun b!269588 () Bool)

(assert (=> b!269588 (= e!173903 e!173902)))

(declare-fun res!133752 () Bool)

(assert (=> b!269588 (=> (not res!133752) (not e!173902))))

(declare-datatypes ((SeekEntryResult!1417 0))(
  ( (MissingZero!1417 (index!7838 (_ BitVec 32))) (Found!1417 (index!7839 (_ BitVec 32))) (Intermediate!1417 (undefined!2229 Bool) (index!7840 (_ BitVec 32)) (x!26182 (_ BitVec 32))) (Undefined!1417) (MissingVacant!1417 (index!7841 (_ BitVec 32))) )
))
(declare-fun lt!135239 () SeekEntryResult!1417)

(assert (=> b!269588 (= res!133752 (or (= lt!135239 (MissingZero!1417 i!1267)) (= lt!135239 (MissingVacant!1417 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13219 (_ BitVec 32)) SeekEntryResult!1417)

(assert (=> b!269588 (= lt!135239 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26122 res!133756) b!269580))

(assert (= (and b!269580 res!133757) b!269582))

(assert (= (and b!269582 res!133754) b!269587))

(assert (= (and b!269587 res!133758) b!269585))

(assert (= (and b!269585 res!133755) b!269588))

(assert (= (and b!269588 res!133752) b!269584))

(assert (= (and b!269584 res!133751) b!269583))

(assert (= (and b!269583 res!133753) b!269586))

(assert (= (and b!269586 c!45465) b!269579))

(assert (= (and b!269586 (not c!45465)) b!269581))

(declare-fun m!285391 () Bool)

(assert (=> b!269587 m!285391))

(declare-fun m!285393 () Bool)

(assert (=> b!269585 m!285393))

(declare-fun m!285395 () Bool)

(assert (=> b!269579 m!285395))

(declare-fun m!285397 () Bool)

(assert (=> b!269579 m!285397))

(declare-fun m!285399 () Bool)

(assert (=> b!269579 m!285399))

(declare-fun m!285401 () Bool)

(assert (=> start!26122 m!285401))

(declare-fun m!285403 () Bool)

(assert (=> start!26122 m!285403))

(declare-fun m!285405 () Bool)

(assert (=> b!269588 m!285405))

(declare-fun m!285407 () Bool)

(assert (=> b!269582 m!285407))

(declare-fun m!285409 () Bool)

(assert (=> b!269584 m!285409))

(push 1)

(assert (not b!269587))

(assert (not b!269585))

(assert (not b!269584))

(assert (not b!269582))

(assert (not b!269579))

(assert (not start!26122))

