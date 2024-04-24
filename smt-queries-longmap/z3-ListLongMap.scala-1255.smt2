; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26088 () Bool)

(assert start!26088)

(declare-fun b!269116 () Bool)

(declare-fun res!133369 () Bool)

(declare-fun e!173720 () Bool)

(assert (=> b!269116 (=> (not res!133369) (not e!173720))))

(declare-datatypes ((array!13184 0))(
  ( (array!13185 (arr!6241 (Array (_ BitVec 32) (_ BitVec 64))) (size!6593 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13184)

(declare-datatypes ((List!3962 0))(
  ( (Nil!3959) (Cons!3958 (h!4625 (_ BitVec 64)) (t!9036 List!3962)) )
))
(declare-fun arrayNoDuplicates!0 (array!13184 (_ BitVec 32) List!3962) Bool)

(assert (=> b!269116 (= res!133369 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3959))))

(declare-fun b!269117 () Bool)

(declare-fun res!133364 () Bool)

(declare-fun e!173723 () Bool)

(assert (=> b!269117 (=> (not res!133364) (not e!173723))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13184 (_ BitVec 32)) Bool)

(assert (=> b!269117 (= res!133364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269118 () Bool)

(declare-fun res!133371 () Bool)

(assert (=> b!269118 (=> (not res!133371) (not e!173723))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269118 (= res!133371 (= startIndex!26 i!1267))))

(declare-fun b!269119 () Bool)

(declare-datatypes ((Unit!8285 0))(
  ( (Unit!8286) )
))
(declare-fun e!173722 () Unit!8285)

(declare-fun Unit!8287 () Unit!8285)

(assert (=> b!269119 (= e!173722 Unit!8287)))

(declare-fun b!269120 () Bool)

(declare-fun lt!135147 () Unit!8285)

(assert (=> b!269120 (= e!173722 lt!135147)))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13184 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8285)

(assert (=> b!269120 (= lt!135147 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!269120 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13185 (store (arr!6241 a!3325) i!1267 k0!2581) (size!6593 a!3325)) mask!3868)))

(declare-fun b!269121 () Bool)

(assert (=> b!269121 (= e!173720 e!173723)))

(declare-fun res!133366 () Bool)

(assert (=> b!269121 (=> (not res!133366) (not e!173723))))

(declare-datatypes ((SeekEntryResult!1364 0))(
  ( (MissingZero!1364 (index!7626 (_ BitVec 32))) (Found!1364 (index!7627 (_ BitVec 32))) (Intermediate!1364 (undefined!2176 Bool) (index!7628 (_ BitVec 32)) (x!26089 (_ BitVec 32))) (Undefined!1364) (MissingVacant!1364 (index!7629 (_ BitVec 32))) )
))
(declare-fun lt!135146 () SeekEntryResult!1364)

(assert (=> b!269121 (= res!133366 (or (= lt!135146 (MissingZero!1364 i!1267)) (= lt!135146 (MissingVacant!1364 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13184 (_ BitVec 32)) SeekEntryResult!1364)

(assert (=> b!269121 (= lt!135146 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!269122 () Bool)

(declare-fun res!133365 () Bool)

(assert (=> b!269122 (=> (not res!133365) (not e!173720))))

(assert (=> b!269122 (= res!133365 (and (= (size!6593 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6593 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6593 a!3325))))))

(declare-fun b!269124 () Bool)

(declare-fun res!133367 () Bool)

(assert (=> b!269124 (=> (not res!133367) (not e!173720))))

(declare-fun arrayContainsKey!0 (array!13184 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269124 (= res!133367 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269125 () Bool)

(assert (=> b!269125 (= e!173723 false)))

(declare-fun lt!135145 () Unit!8285)

(assert (=> b!269125 (= lt!135145 e!173722)))

(declare-fun c!45427 () Bool)

(assert (=> b!269125 (= c!45427 (bvslt startIndex!26 (bvsub (size!6593 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269123 () Bool)

(declare-fun res!133370 () Bool)

(assert (=> b!269123 (=> (not res!133370) (not e!173720))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269123 (= res!133370 (validKeyInArray!0 k0!2581))))

(declare-fun res!133368 () Bool)

(assert (=> start!26088 (=> (not res!133368) (not e!173720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26088 (= res!133368 (validMask!0 mask!3868))))

(assert (=> start!26088 e!173720))

(declare-fun array_inv!4191 (array!13184) Bool)

(assert (=> start!26088 (array_inv!4191 a!3325)))

(assert (=> start!26088 true))

(assert (= (and start!26088 res!133368) b!269122))

(assert (= (and b!269122 res!133365) b!269123))

(assert (= (and b!269123 res!133370) b!269116))

(assert (= (and b!269116 res!133369) b!269124))

(assert (= (and b!269124 res!133367) b!269121))

(assert (= (and b!269121 res!133366) b!269117))

(assert (= (and b!269117 res!133364) b!269118))

(assert (= (and b!269118 res!133371) b!269125))

(assert (= (and b!269125 c!45427) b!269120))

(assert (= (and b!269125 (not c!45427)) b!269119))

(declare-fun m!285257 () Bool)

(assert (=> b!269124 m!285257))

(declare-fun m!285259 () Bool)

(assert (=> b!269121 m!285259))

(declare-fun m!285261 () Bool)

(assert (=> b!269116 m!285261))

(declare-fun m!285263 () Bool)

(assert (=> b!269123 m!285263))

(declare-fun m!285265 () Bool)

(assert (=> start!26088 m!285265))

(declare-fun m!285267 () Bool)

(assert (=> start!26088 m!285267))

(declare-fun m!285269 () Bool)

(assert (=> b!269120 m!285269))

(declare-fun m!285271 () Bool)

(assert (=> b!269120 m!285271))

(declare-fun m!285273 () Bool)

(assert (=> b!269120 m!285273))

(declare-fun m!285275 () Bool)

(assert (=> b!269117 m!285275))

(check-sat (not b!269117) (not start!26088) (not b!269123) (not b!269121) (not b!269120) (not b!269116) (not b!269124))
(check-sat)
