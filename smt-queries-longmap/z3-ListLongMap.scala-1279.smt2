; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26234 () Bool)

(assert start!26234)

(declare-fun b!271490 () Bool)

(declare-fun res!135488 () Bool)

(declare-fun e!174569 () Bool)

(assert (=> b!271490 (=> (not res!135488) (not e!174569))))

(declare-datatypes ((List!4123 0))(
  ( (Nil!4120) (Cons!4119 (h!4786 (_ BitVec 64)) (t!9205 List!4123)) )
))
(declare-fun noDuplicate!141 (List!4123) Bool)

(assert (=> b!271490 (= res!135488 (noDuplicate!141 Nil!4120))))

(declare-fun b!271491 () Bool)

(declare-fun res!135486 () Bool)

(assert (=> b!271491 (=> (not res!135486) (not e!174569))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271491 (= res!135486 (not (= startIndex!26 i!1267)))))

(declare-fun res!135480 () Bool)

(declare-fun e!174567 () Bool)

(assert (=> start!26234 (=> (not res!135480) (not e!174567))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26234 (= res!135480 (validMask!0 mask!3868))))

(assert (=> start!26234 e!174567))

(declare-datatypes ((array!13331 0))(
  ( (array!13332 (arr!6315 (Array (_ BitVec 32) (_ BitVec 64))) (size!6667 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13331)

(declare-fun array_inv!4278 (array!13331) Bool)

(assert (=> start!26234 (array_inv!4278 a!3325)))

(assert (=> start!26234 true))

(declare-fun b!271492 () Bool)

(assert (=> b!271492 (= e!174569 false)))

(declare-fun lt!135810 () Bool)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun contains!1953 (List!4123 (_ BitVec 64)) Bool)

(assert (=> b!271492 (= lt!135810 (contains!1953 Nil!4120 k0!2581))))

(declare-fun b!271493 () Bool)

(declare-fun res!135484 () Bool)

(assert (=> b!271493 (=> (not res!135484) (not e!174569))))

(assert (=> b!271493 (= res!135484 (and (bvslt (size!6667 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6667 a!3325))))))

(declare-fun b!271494 () Bool)

(declare-fun res!135491 () Bool)

(assert (=> b!271494 (=> (not res!135491) (not e!174569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13331 (_ BitVec 32)) Bool)

(assert (=> b!271494 (= res!135491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271495 () Bool)

(declare-fun res!135485 () Bool)

(assert (=> b!271495 (=> (not res!135485) (not e!174567))))

(declare-fun arrayContainsKey!0 (array!13331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271495 (= res!135485 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271496 () Bool)

(declare-fun res!135481 () Bool)

(assert (=> b!271496 (=> (not res!135481) (not e!174567))))

(declare-fun arrayNoDuplicates!0 (array!13331 (_ BitVec 32) List!4123) Bool)

(assert (=> b!271496 (= res!135481 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4120))))

(declare-fun b!271497 () Bool)

(declare-fun res!135490 () Bool)

(assert (=> b!271497 (=> (not res!135490) (not e!174567))))

(assert (=> b!271497 (= res!135490 (and (= (size!6667 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6667 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6667 a!3325))))))

(declare-fun b!271498 () Bool)

(declare-fun res!135492 () Bool)

(assert (=> b!271498 (=> (not res!135492) (not e!174569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271498 (= res!135492 (validKeyInArray!0 (select (arr!6315 a!3325) startIndex!26)))))

(declare-fun b!271499 () Bool)

(declare-fun res!135483 () Bool)

(assert (=> b!271499 (=> (not res!135483) (not e!174567))))

(assert (=> b!271499 (= res!135483 (validKeyInArray!0 k0!2581))))

(declare-fun b!271500 () Bool)

(assert (=> b!271500 (= e!174567 e!174569)))

(declare-fun res!135482 () Bool)

(assert (=> b!271500 (=> (not res!135482) (not e!174569))))

(declare-datatypes ((SeekEntryResult!1473 0))(
  ( (MissingZero!1473 (index!8062 (_ BitVec 32))) (Found!1473 (index!8063 (_ BitVec 32))) (Intermediate!1473 (undefined!2285 Bool) (index!8064 (_ BitVec 32)) (x!26390 (_ BitVec 32))) (Undefined!1473) (MissingVacant!1473 (index!8065 (_ BitVec 32))) )
))
(declare-fun lt!135811 () SeekEntryResult!1473)

(assert (=> b!271500 (= res!135482 (or (= lt!135811 (MissingZero!1473 i!1267)) (= lt!135811 (MissingVacant!1473 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13331 (_ BitVec 32)) SeekEntryResult!1473)

(assert (=> b!271500 (= lt!135811 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!271501 () Bool)

(declare-fun res!135487 () Bool)

(assert (=> b!271501 (=> (not res!135487) (not e!174569))))

(assert (=> b!271501 (= res!135487 (not (contains!1953 Nil!4120 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271502 () Bool)

(declare-fun res!135489 () Bool)

(assert (=> b!271502 (=> (not res!135489) (not e!174569))))

(assert (=> b!271502 (= res!135489 (not (contains!1953 Nil!4120 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!26234 res!135480) b!271497))

(assert (= (and b!271497 res!135490) b!271499))

(assert (= (and b!271499 res!135483) b!271496))

(assert (= (and b!271496 res!135481) b!271495))

(assert (= (and b!271495 res!135485) b!271500))

(assert (= (and b!271500 res!135482) b!271494))

(assert (= (and b!271494 res!135491) b!271491))

(assert (= (and b!271491 res!135486) b!271498))

(assert (= (and b!271498 res!135492) b!271493))

(assert (= (and b!271493 res!135484) b!271490))

(assert (= (and b!271490 res!135488) b!271502))

(assert (= (and b!271502 res!135489) b!271501))

(assert (= (and b!271501 res!135487) b!271492))

(declare-fun m!286757 () Bool)

(assert (=> b!271495 m!286757))

(declare-fun m!286759 () Bool)

(assert (=> b!271494 m!286759))

(declare-fun m!286761 () Bool)

(assert (=> b!271492 m!286761))

(declare-fun m!286763 () Bool)

(assert (=> start!26234 m!286763))

(declare-fun m!286765 () Bool)

(assert (=> start!26234 m!286765))

(declare-fun m!286767 () Bool)

(assert (=> b!271490 m!286767))

(declare-fun m!286769 () Bool)

(assert (=> b!271498 m!286769))

(assert (=> b!271498 m!286769))

(declare-fun m!286771 () Bool)

(assert (=> b!271498 m!286771))

(declare-fun m!286773 () Bool)

(assert (=> b!271496 m!286773))

(declare-fun m!286775 () Bool)

(assert (=> b!271500 m!286775))

(declare-fun m!286777 () Bool)

(assert (=> b!271499 m!286777))

(declare-fun m!286779 () Bool)

(assert (=> b!271501 m!286779))

(declare-fun m!286781 () Bool)

(assert (=> b!271502 m!286781))

(check-sat (not b!271499) (not b!271495) (not b!271490) (not b!271498) (not b!271494) (not b!271501) (not b!271500) (not b!271492) (not start!26234) (not b!271502) (not b!271496))
(check-sat)
