; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27548 () Bool)

(assert start!27548)

(declare-fun b!284481 () Bool)

(declare-fun res!147043 () Bool)

(declare-fun e!180426 () Bool)

(assert (=> b!284481 (=> (not res!147043) (not e!180426))))

(declare-datatypes ((array!14187 0))(
  ( (array!14188 (arr!6732 (Array (_ BitVec 32) (_ BitVec 64))) (size!7085 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14187)

(declare-datatypes ((List!4513 0))(
  ( (Nil!4510) (Cons!4509 (h!5182 (_ BitVec 64)) (t!9586 List!4513)) )
))
(declare-fun arrayNoDuplicates!0 (array!14187 (_ BitVec 32) List!4513) Bool)

(assert (=> b!284481 (= res!147043 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4510))))

(declare-fun b!284483 () Bool)

(declare-fun res!147046 () Bool)

(assert (=> b!284483 (=> (not res!147046) (not e!180426))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!284483 (= res!147046 (and (= (size!7085 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7085 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7085 a!3325))))))

(declare-fun b!284484 () Bool)

(declare-fun res!147041 () Bool)

(assert (=> b!284484 (=> (not res!147041) (not e!180426))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284484 (= res!147041 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284485 () Bool)

(declare-fun e!180424 () Bool)

(assert (=> b!284485 (= e!180424 false)))

(declare-fun lt!140384 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14187 (_ BitVec 32)) Bool)

(assert (=> b!284485 (= lt!140384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284486 () Bool)

(declare-fun res!147042 () Bool)

(assert (=> b!284486 (=> (not res!147042) (not e!180426))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284486 (= res!147042 (validKeyInArray!0 k0!2581))))

(declare-fun b!284482 () Bool)

(assert (=> b!284482 (= e!180426 e!180424)))

(declare-fun res!147045 () Bool)

(assert (=> b!284482 (=> (not res!147045) (not e!180424))))

(declare-datatypes ((SeekEntryResult!1889 0))(
  ( (MissingZero!1889 (index!9726 (_ BitVec 32))) (Found!1889 (index!9727 (_ BitVec 32))) (Intermediate!1889 (undefined!2701 Bool) (index!9728 (_ BitVec 32)) (x!27951 (_ BitVec 32))) (Undefined!1889) (MissingVacant!1889 (index!9729 (_ BitVec 32))) )
))
(declare-fun lt!140385 () SeekEntryResult!1889)

(assert (=> b!284482 (= res!147045 (or (= lt!140385 (MissingZero!1889 i!1267)) (= lt!140385 (MissingVacant!1889 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14187 (_ BitVec 32)) SeekEntryResult!1889)

(assert (=> b!284482 (= lt!140385 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!147044 () Bool)

(assert (=> start!27548 (=> (not res!147044) (not e!180426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27548 (= res!147044 (validMask!0 mask!3868))))

(assert (=> start!27548 e!180426))

(declare-fun array_inv!4704 (array!14187) Bool)

(assert (=> start!27548 (array_inv!4704 a!3325)))

(assert (=> start!27548 true))

(assert (= (and start!27548 res!147044) b!284483))

(assert (= (and b!284483 res!147046) b!284486))

(assert (= (and b!284486 res!147042) b!284481))

(assert (= (and b!284481 res!147043) b!284484))

(assert (= (and b!284484 res!147041) b!284482))

(assert (= (and b!284482 res!147045) b!284485))

(declare-fun m!299009 () Bool)

(assert (=> b!284481 m!299009))

(declare-fun m!299011 () Bool)

(assert (=> b!284482 m!299011))

(declare-fun m!299013 () Bool)

(assert (=> start!27548 m!299013))

(declare-fun m!299015 () Bool)

(assert (=> start!27548 m!299015))

(declare-fun m!299017 () Bool)

(assert (=> b!284484 m!299017))

(declare-fun m!299019 () Bool)

(assert (=> b!284486 m!299019))

(declare-fun m!299021 () Bool)

(assert (=> b!284485 m!299021))

(check-sat (not b!284484) (not start!27548) (not b!284481) (not b!284482) (not b!284486) (not b!284485))
(check-sat)
