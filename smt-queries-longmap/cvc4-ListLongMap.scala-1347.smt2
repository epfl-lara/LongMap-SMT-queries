; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26644 () Bool)

(assert start!26644)

(declare-fun b!276585 () Bool)

(declare-fun e!176674 () Bool)

(declare-fun e!176673 () Bool)

(assert (=> b!276585 (= e!176674 e!176673)))

(declare-fun res!140579 () Bool)

(assert (=> b!276585 (=> (not res!140579) (not e!176673))))

(declare-datatypes ((SeekEntryResult!1678 0))(
  ( (MissingZero!1678 (index!8882 (_ BitVec 32))) (Found!1678 (index!8883 (_ BitVec 32))) (Intermediate!1678 (undefined!2490 Bool) (index!8884 (_ BitVec 32)) (x!27139 (_ BitVec 32))) (Undefined!1678) (MissingVacant!1678 (index!8885 (_ BitVec 32))) )
))
(declare-fun lt!137680 () SeekEntryResult!1678)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276585 (= res!140579 (or (= lt!137680 (MissingZero!1678 i!1267)) (= lt!137680 (MissingVacant!1678 i!1267))))))

(declare-datatypes ((array!13741 0))(
  ( (array!13742 (arr!6520 (Array (_ BitVec 32) (_ BitVec 64))) (size!6872 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13741)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13741 (_ BitVec 32)) SeekEntryResult!1678)

(assert (=> b!276585 (= lt!137680 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!276586 () Bool)

(declare-fun res!140577 () Bool)

(assert (=> b!276586 (=> (not res!140577) (not e!176674))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276586 (= res!140577 (and (= (size!6872 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6872 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6872 a!3325))))))

(declare-fun b!276587 () Bool)

(declare-fun res!140580 () Bool)

(assert (=> b!276587 (=> (not res!140580) (not e!176674))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276587 (= res!140580 (validKeyInArray!0 k!2581))))

(declare-fun res!140578 () Bool)

(assert (=> start!26644 (=> (not res!140578) (not e!176674))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26644 (= res!140578 (validMask!0 mask!3868))))

(assert (=> start!26644 e!176674))

(declare-fun array_inv!4483 (array!13741) Bool)

(assert (=> start!26644 (array_inv!4483 a!3325)))

(assert (=> start!26644 true))

(declare-fun b!276588 () Bool)

(declare-fun res!140576 () Bool)

(assert (=> b!276588 (=> (not res!140576) (not e!176674))))

(declare-datatypes ((List!4328 0))(
  ( (Nil!4325) (Cons!4324 (h!4991 (_ BitVec 64)) (t!9410 List!4328)) )
))
(declare-fun arrayNoDuplicates!0 (array!13741 (_ BitVec 32) List!4328) Bool)

(assert (=> b!276588 (= res!140576 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4325))))

(declare-fun b!276589 () Bool)

(declare-fun res!140575 () Bool)

(assert (=> b!276589 (=> (not res!140575) (not e!176674))))

(declare-fun arrayContainsKey!0 (array!13741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276589 (= res!140575 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276590 () Bool)

(assert (=> b!276590 (= e!176673 false)))

(declare-fun lt!137679 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13741 (_ BitVec 32)) Bool)

(assert (=> b!276590 (= lt!137679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26644 res!140578) b!276586))

(assert (= (and b!276586 res!140577) b!276587))

(assert (= (and b!276587 res!140580) b!276588))

(assert (= (and b!276588 res!140576) b!276589))

(assert (= (and b!276589 res!140575) b!276585))

(assert (= (and b!276585 res!140579) b!276590))

(declare-fun m!291883 () Bool)

(assert (=> b!276590 m!291883))

(declare-fun m!291885 () Bool)

(assert (=> start!26644 m!291885))

(declare-fun m!291887 () Bool)

(assert (=> start!26644 m!291887))

(declare-fun m!291889 () Bool)

(assert (=> b!276585 m!291889))

(declare-fun m!291891 () Bool)

(assert (=> b!276589 m!291891))

(declare-fun m!291893 () Bool)

(assert (=> b!276587 m!291893))

(declare-fun m!291895 () Bool)

(assert (=> b!276588 m!291895))

(push 1)

(assert (not b!276590))

(assert (not b!276588))

(assert (not b!276585))

(assert (not start!26644))

(assert (not b!276589))

(assert (not b!276587))

