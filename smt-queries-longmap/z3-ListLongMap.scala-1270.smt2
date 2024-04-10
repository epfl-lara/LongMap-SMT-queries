; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26180 () Bool)

(assert start!26180)

(declare-fun b!270449 () Bool)

(declare-fun res!134451 () Bool)

(declare-fun e!174320 () Bool)

(assert (=> b!270449 (=> (not res!134451) (not e!174320))))

(declare-datatypes ((array!13277 0))(
  ( (array!13278 (arr!6288 (Array (_ BitVec 32) (_ BitVec 64))) (size!6640 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13277)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!270449 (= res!134451 (and (= (size!6640 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6640 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6640 a!3325))))))

(declare-fun b!270450 () Bool)

(declare-fun e!174316 () Bool)

(assert (=> b!270450 (= e!174320 e!174316)))

(declare-fun res!134449 () Bool)

(assert (=> b!270450 (=> (not res!134449) (not e!174316))))

(declare-datatypes ((SeekEntryResult!1446 0))(
  ( (MissingZero!1446 (index!7954 (_ BitVec 32))) (Found!1446 (index!7955 (_ BitVec 32))) (Intermediate!1446 (undefined!2258 Bool) (index!7956 (_ BitVec 32)) (x!26291 (_ BitVec 32))) (Undefined!1446) (MissingVacant!1446 (index!7957 (_ BitVec 32))) )
))
(declare-fun lt!135636 () SeekEntryResult!1446)

(assert (=> b!270450 (= res!134449 (or (= lt!135636 (MissingZero!1446 i!1267)) (= lt!135636 (MissingVacant!1446 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13277 (_ BitVec 32)) SeekEntryResult!1446)

(assert (=> b!270450 (= lt!135636 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!270451 () Bool)

(declare-fun res!134448 () Bool)

(assert (=> b!270451 (=> (not res!134448) (not e!174320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270451 (= res!134448 (validKeyInArray!0 k0!2581))))

(declare-fun b!270452 () Bool)

(declare-fun e!174318 () Bool)

(assert (=> b!270452 (= e!174318 (not (bvsle startIndex!26 (size!6640 a!3325))))))

(declare-fun lt!135639 () array!13277)

(assert (=> b!270452 (= (seekEntryOrOpen!0 k0!2581 lt!135639 mask!3868) (Found!1446 i!1267))))

(declare-datatypes ((Unit!8443 0))(
  ( (Unit!8444) )
))
(declare-fun lt!135637 () Unit!8443)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13277 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8443)

(assert (=> b!270452 (= lt!135637 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!135638 () Unit!8443)

(declare-fun e!174319 () Unit!8443)

(assert (=> b!270452 (= lt!135638 e!174319)))

(declare-fun c!45552 () Bool)

(assert (=> b!270452 (= c!45552 (bvslt startIndex!26 (bvsub (size!6640 a!3325) #b00000000000000000000000000000001)))))

(declare-fun res!134453 () Bool)

(assert (=> start!26180 (=> (not res!134453) (not e!174320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26180 (= res!134453 (validMask!0 mask!3868))))

(assert (=> start!26180 e!174320))

(declare-fun array_inv!4251 (array!13277) Bool)

(assert (=> start!26180 (array_inv!4251 a!3325)))

(assert (=> start!26180 true))

(declare-fun b!270453 () Bool)

(declare-fun res!134454 () Bool)

(assert (=> b!270453 (=> (not res!134454) (not e!174320))))

(declare-fun arrayContainsKey!0 (array!13277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270453 (= res!134454 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270454 () Bool)

(declare-fun Unit!8445 () Unit!8443)

(assert (=> b!270454 (= e!174319 Unit!8445)))

(declare-fun b!270455 () Bool)

(assert (=> b!270455 (= e!174316 e!174318)))

(declare-fun res!134450 () Bool)

(assert (=> b!270455 (=> (not res!134450) (not e!174318))))

(assert (=> b!270455 (= res!134450 (= startIndex!26 i!1267))))

(assert (=> b!270455 (= lt!135639 (array!13278 (store (arr!6288 a!3325) i!1267 k0!2581) (size!6640 a!3325)))))

(declare-fun b!270456 () Bool)

(declare-fun lt!135640 () Unit!8443)

(assert (=> b!270456 (= e!174319 lt!135640)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13277 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8443)

(assert (=> b!270456 (= lt!135640 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13277 (_ BitVec 32)) Bool)

(assert (=> b!270456 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135639 mask!3868)))

(declare-fun b!270457 () Bool)

(declare-fun res!134452 () Bool)

(assert (=> b!270457 (=> (not res!134452) (not e!174316))))

(assert (=> b!270457 (= res!134452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270458 () Bool)

(declare-fun res!134447 () Bool)

(assert (=> b!270458 (=> (not res!134447) (not e!174320))))

(declare-datatypes ((List!4096 0))(
  ( (Nil!4093) (Cons!4092 (h!4759 (_ BitVec 64)) (t!9178 List!4096)) )
))
(declare-fun arrayNoDuplicates!0 (array!13277 (_ BitVec 32) List!4096) Bool)

(assert (=> b!270458 (= res!134447 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4093))))

(assert (= (and start!26180 res!134453) b!270449))

(assert (= (and b!270449 res!134451) b!270451))

(assert (= (and b!270451 res!134448) b!270458))

(assert (= (and b!270458 res!134447) b!270453))

(assert (= (and b!270453 res!134454) b!270450))

(assert (= (and b!270450 res!134449) b!270457))

(assert (= (and b!270457 res!134452) b!270455))

(assert (= (and b!270455 res!134450) b!270452))

(assert (= (and b!270452 c!45552) b!270456))

(assert (= (and b!270452 (not c!45552)) b!270454))

(declare-fun m!286059 () Bool)

(assert (=> b!270453 m!286059))

(declare-fun m!286061 () Bool)

(assert (=> b!270457 m!286061))

(declare-fun m!286063 () Bool)

(assert (=> b!270458 m!286063))

(declare-fun m!286065 () Bool)

(assert (=> start!26180 m!286065))

(declare-fun m!286067 () Bool)

(assert (=> start!26180 m!286067))

(declare-fun m!286069 () Bool)

(assert (=> b!270452 m!286069))

(declare-fun m!286071 () Bool)

(assert (=> b!270452 m!286071))

(declare-fun m!286073 () Bool)

(assert (=> b!270450 m!286073))

(declare-fun m!286075 () Bool)

(assert (=> b!270456 m!286075))

(declare-fun m!286077 () Bool)

(assert (=> b!270456 m!286077))

(declare-fun m!286079 () Bool)

(assert (=> b!270455 m!286079))

(declare-fun m!286081 () Bool)

(assert (=> b!270451 m!286081))

(check-sat (not b!270456) (not b!270450) (not b!270451) (not b!270457) (not b!270458) (not start!26180) (not b!270452) (not b!270453))
(check-sat)
