; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27532 () Bool)

(assert start!27532)

(declare-fun b!284499 () Bool)

(declare-fun res!147014 () Bool)

(declare-fun e!180464 () Bool)

(assert (=> b!284499 (=> (not res!147014) (not e!180464))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284499 (= res!147014 (not (= startIndex!26 i!1267)))))

(declare-fun b!284500 () Bool)

(declare-fun res!147009 () Bool)

(declare-fun e!180463 () Bool)

(assert (=> b!284500 (=> (not res!147009) (not e!180463))))

(declare-datatypes ((array!14182 0))(
  ( (array!14183 (arr!6730 (Array (_ BitVec 32) (_ BitVec 64))) (size!7082 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14182)

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!284500 (= res!147009 (and (= (size!7082 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7082 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7082 a!3325))))))

(declare-fun b!284501 () Bool)

(declare-fun res!147010 () Bool)

(assert (=> b!284501 (=> (not res!147010) (not e!180463))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14182 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284501 (= res!147010 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284502 () Bool)

(declare-fun res!147015 () Bool)

(assert (=> b!284502 (=> (not res!147015) (not e!180463))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284502 (= res!147015 (validKeyInArray!0 k!2581))))

(declare-fun b!284503 () Bool)

(declare-fun res!147007 () Bool)

(assert (=> b!284503 (=> (not res!147007) (not e!180464))))

(assert (=> b!284503 (= res!147007 (not (validKeyInArray!0 (select (arr!6730 a!3325) startIndex!26))))))

(declare-fun b!284504 () Bool)

(declare-fun res!147008 () Bool)

(assert (=> b!284504 (=> (not res!147008) (not e!180463))))

(declare-datatypes ((List!4538 0))(
  ( (Nil!4535) (Cons!4534 (h!5207 (_ BitVec 64)) (t!9620 List!4538)) )
))
(declare-fun arrayNoDuplicates!0 (array!14182 (_ BitVec 32) List!4538) Bool)

(assert (=> b!284504 (= res!147008 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4535))))

(declare-fun b!284505 () Bool)

(declare-fun res!147012 () Bool)

(assert (=> b!284505 (=> (not res!147012) (not e!180464))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14182 (_ BitVec 32)) Bool)

(assert (=> b!284505 (= res!147012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284506 () Bool)

(assert (=> b!284506 (= e!180463 e!180464)))

(declare-fun res!147011 () Bool)

(assert (=> b!284506 (=> (not res!147011) (not e!180464))))

(declare-datatypes ((SeekEntryResult!1888 0))(
  ( (MissingZero!1888 (index!9722 (_ BitVec 32))) (Found!1888 (index!9723 (_ BitVec 32))) (Intermediate!1888 (undefined!2700 Bool) (index!9724 (_ BitVec 32)) (x!27927 (_ BitVec 32))) (Undefined!1888) (MissingVacant!1888 (index!9725 (_ BitVec 32))) )
))
(declare-fun lt!140524 () SeekEntryResult!1888)

(assert (=> b!284506 (= res!147011 (or (= lt!140524 (MissingZero!1888 i!1267)) (= lt!140524 (MissingVacant!1888 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14182 (_ BitVec 32)) SeekEntryResult!1888)

(assert (=> b!284506 (= lt!140524 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!284507 () Bool)

(assert (=> b!284507 (= e!180464 (and (bvslt startIndex!26 (bvsub (size!7082 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun res!147013 () Bool)

(assert (=> start!27532 (=> (not res!147013) (not e!180463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27532 (= res!147013 (validMask!0 mask!3868))))

(assert (=> start!27532 e!180463))

(declare-fun array_inv!4693 (array!14182) Bool)

(assert (=> start!27532 (array_inv!4693 a!3325)))

(assert (=> start!27532 true))

(assert (= (and start!27532 res!147013) b!284500))

(assert (= (and b!284500 res!147009) b!284502))

(assert (= (and b!284502 res!147015) b!284504))

(assert (= (and b!284504 res!147008) b!284501))

(assert (= (and b!284501 res!147010) b!284506))

(assert (= (and b!284506 res!147011) b!284505))

(assert (= (and b!284505 res!147012) b!284499))

(assert (= (and b!284499 res!147014) b!284503))

(assert (= (and b!284503 res!147007) b!284507))

(declare-fun m!299499 () Bool)

(assert (=> b!284503 m!299499))

(assert (=> b!284503 m!299499))

(declare-fun m!299501 () Bool)

(assert (=> b!284503 m!299501))

(declare-fun m!299503 () Bool)

(assert (=> start!27532 m!299503))

(declare-fun m!299505 () Bool)

(assert (=> start!27532 m!299505))

(declare-fun m!299507 () Bool)

(assert (=> b!284501 m!299507))

(declare-fun m!299509 () Bool)

(assert (=> b!284505 m!299509))

(declare-fun m!299511 () Bool)

(assert (=> b!284502 m!299511))

(declare-fun m!299513 () Bool)

(assert (=> b!284504 m!299513))

(declare-fun m!299515 () Bool)

(assert (=> b!284506 m!299515))

(push 1)

(assert (not b!284506))

(assert (not start!27532))

(assert (not b!284504))

(assert (not b!284502))

(assert (not b!284505))

(assert (not b!284501))

(assert (not b!284503))

(check-sat)

