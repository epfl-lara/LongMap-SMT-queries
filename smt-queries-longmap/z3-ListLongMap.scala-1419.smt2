; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27542 () Bool)

(assert start!27542)

(declare-fun b!284427 () Bool)

(declare-fun res!146988 () Bool)

(declare-fun e!180399 () Bool)

(assert (=> b!284427 (=> (not res!146988) (not e!180399))))

(declare-datatypes ((array!14181 0))(
  ( (array!14182 (arr!6729 (Array (_ BitVec 32) (_ BitVec 64))) (size!7082 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14181)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!284427 (= res!146988 (and (= (size!7082 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7082 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7082 a!3325))))))

(declare-fun b!284428 () Bool)

(declare-fun e!180398 () Bool)

(assert (=> b!284428 (= e!180399 e!180398)))

(declare-fun res!146991 () Bool)

(assert (=> b!284428 (=> (not res!146991) (not e!180398))))

(declare-datatypes ((SeekEntryResult!1886 0))(
  ( (MissingZero!1886 (index!9714 (_ BitVec 32))) (Found!1886 (index!9715 (_ BitVec 32))) (Intermediate!1886 (undefined!2698 Bool) (index!9716 (_ BitVec 32)) (x!27940 (_ BitVec 32))) (Undefined!1886) (MissingVacant!1886 (index!9717 (_ BitVec 32))) )
))
(declare-fun lt!140367 () SeekEntryResult!1886)

(assert (=> b!284428 (= res!146991 (or (= lt!140367 (MissingZero!1886 i!1267)) (= lt!140367 (MissingVacant!1886 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14181 (_ BitVec 32)) SeekEntryResult!1886)

(assert (=> b!284428 (= lt!140367 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284429 () Bool)

(declare-fun res!146990 () Bool)

(assert (=> b!284429 (=> (not res!146990) (not e!180399))))

(declare-fun arrayContainsKey!0 (array!14181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284429 (= res!146990 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284430 () Bool)

(declare-fun res!146987 () Bool)

(assert (=> b!284430 (=> (not res!146987) (not e!180399))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284430 (= res!146987 (validKeyInArray!0 k0!2581))))

(declare-fun b!284431 () Bool)

(declare-fun res!146989 () Bool)

(assert (=> b!284431 (=> (not res!146989) (not e!180399))))

(declare-datatypes ((List!4510 0))(
  ( (Nil!4507) (Cons!4506 (h!5179 (_ BitVec 64)) (t!9583 List!4510)) )
))
(declare-fun arrayNoDuplicates!0 (array!14181 (_ BitVec 32) List!4510) Bool)

(assert (=> b!284431 (= res!146989 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4507))))

(declare-fun b!284432 () Bool)

(assert (=> b!284432 (= e!180398 false)))

(declare-fun lt!140366 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14181 (_ BitVec 32)) Bool)

(assert (=> b!284432 (= lt!140366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!146992 () Bool)

(assert (=> start!27542 (=> (not res!146992) (not e!180399))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27542 (= res!146992 (validMask!0 mask!3868))))

(assert (=> start!27542 e!180399))

(declare-fun array_inv!4701 (array!14181) Bool)

(assert (=> start!27542 (array_inv!4701 a!3325)))

(assert (=> start!27542 true))

(assert (= (and start!27542 res!146992) b!284427))

(assert (= (and b!284427 res!146988) b!284430))

(assert (= (and b!284430 res!146987) b!284431))

(assert (= (and b!284431 res!146989) b!284429))

(assert (= (and b!284429 res!146990) b!284428))

(assert (= (and b!284428 res!146991) b!284432))

(declare-fun m!298967 () Bool)

(assert (=> b!284429 m!298967))

(declare-fun m!298969 () Bool)

(assert (=> b!284428 m!298969))

(declare-fun m!298971 () Bool)

(assert (=> b!284432 m!298971))

(declare-fun m!298973 () Bool)

(assert (=> b!284430 m!298973))

(declare-fun m!298975 () Bool)

(assert (=> start!27542 m!298975))

(declare-fun m!298977 () Bool)

(assert (=> start!27542 m!298977))

(declare-fun m!298979 () Bool)

(assert (=> b!284431 m!298979))

(check-sat (not b!284428) (not b!284429) (not b!284432) (not start!27542) (not b!284431) (not b!284430))
(check-sat)
