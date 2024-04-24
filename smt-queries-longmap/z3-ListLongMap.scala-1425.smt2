; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27576 () Bool)

(assert start!27576)

(declare-fun b!284951 () Bool)

(declare-fun e!180684 () Bool)

(declare-fun e!180685 () Bool)

(assert (=> b!284951 (= e!180684 e!180685)))

(declare-fun res!147440 () Bool)

(assert (=> b!284951 (=> (not res!147440) (not e!180685))))

(declare-datatypes ((SeekEntryResult!1874 0))(
  ( (MissingZero!1874 (index!9666 (_ BitVec 32))) (Found!1874 (index!9667 (_ BitVec 32))) (Intermediate!1874 (undefined!2686 Bool) (index!9668 (_ BitVec 32)) (x!27977 (_ BitVec 32))) (Undefined!1874) (MissingVacant!1874 (index!9669 (_ BitVec 32))) )
))
(declare-fun lt!140712 () SeekEntryResult!1874)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284951 (= res!147440 (or (= lt!140712 (MissingZero!1874 i!1267)) (= lt!140712 (MissingVacant!1874 i!1267))))))

(declare-datatypes ((array!14225 0))(
  ( (array!14226 (arr!6751 (Array (_ BitVec 32) (_ BitVec 64))) (size!7103 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14225)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14225 (_ BitVec 32)) SeekEntryResult!1874)

(assert (=> b!284951 (= lt!140712 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284952 () Bool)

(declare-fun res!147437 () Bool)

(assert (=> b!284952 (=> (not res!147437) (not e!180685))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284952 (= res!147437 (not (= startIndex!26 i!1267)))))

(declare-fun b!284953 () Bool)

(declare-fun res!147436 () Bool)

(assert (=> b!284953 (=> (not res!147436) (not e!180684))))

(declare-fun arrayContainsKey!0 (array!14225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284953 (= res!147436 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!147435 () Bool)

(assert (=> start!27576 (=> (not res!147435) (not e!180684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27576 (= res!147435 (validMask!0 mask!3868))))

(assert (=> start!27576 e!180684))

(declare-fun array_inv!4701 (array!14225) Bool)

(assert (=> start!27576 (array_inv!4701 a!3325)))

(assert (=> start!27576 true))

(declare-fun b!284954 () Bool)

(declare-fun res!147441 () Bool)

(assert (=> b!284954 (=> (not res!147441) (not e!180685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14225 (_ BitVec 32)) Bool)

(assert (=> b!284954 (= res!147441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284955 () Bool)

(declare-fun res!147438 () Bool)

(assert (=> b!284955 (=> (not res!147438) (not e!180685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284955 (= res!147438 (not (validKeyInArray!0 (select (arr!6751 a!3325) startIndex!26))))))

(declare-fun b!284956 () Bool)

(assert (=> b!284956 (= e!180685 (and (bvslt startIndex!26 (bvsub (size!7103 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000) (bvsge (bvsub (size!7103 a!3325) (bvadd #b00000000000000000000000000000001 startIndex!26)) (bvsub (size!7103 a!3325) startIndex!26))))))

(declare-fun b!284957 () Bool)

(declare-fun res!147439 () Bool)

(assert (=> b!284957 (=> (not res!147439) (not e!180684))))

(declare-datatypes ((List!4472 0))(
  ( (Nil!4469) (Cons!4468 (h!5141 (_ BitVec 64)) (t!9546 List!4472)) )
))
(declare-fun arrayNoDuplicates!0 (array!14225 (_ BitVec 32) List!4472) Bool)

(assert (=> b!284957 (= res!147439 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4469))))

(declare-fun b!284958 () Bool)

(declare-fun res!147434 () Bool)

(assert (=> b!284958 (=> (not res!147434) (not e!180684))))

(assert (=> b!284958 (= res!147434 (validKeyInArray!0 k0!2581))))

(declare-fun b!284959 () Bool)

(declare-fun res!147433 () Bool)

(assert (=> b!284959 (=> (not res!147433) (not e!180684))))

(assert (=> b!284959 (= res!147433 (and (= (size!7103 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7103 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7103 a!3325))))))

(assert (= (and start!27576 res!147435) b!284959))

(assert (= (and b!284959 res!147433) b!284958))

(assert (= (and b!284958 res!147434) b!284957))

(assert (= (and b!284957 res!147439) b!284953))

(assert (= (and b!284953 res!147436) b!284951))

(assert (= (and b!284951 res!147440) b!284954))

(assert (= (and b!284954 res!147441) b!284952))

(assert (= (and b!284952 res!147437) b!284955))

(assert (= (and b!284955 res!147438) b!284956))

(declare-fun m!300017 () Bool)

(assert (=> b!284957 m!300017))

(declare-fun m!300019 () Bool)

(assert (=> b!284958 m!300019))

(declare-fun m!300021 () Bool)

(assert (=> b!284953 m!300021))

(declare-fun m!300023 () Bool)

(assert (=> start!27576 m!300023))

(declare-fun m!300025 () Bool)

(assert (=> start!27576 m!300025))

(declare-fun m!300027 () Bool)

(assert (=> b!284954 m!300027))

(declare-fun m!300029 () Bool)

(assert (=> b!284955 m!300029))

(assert (=> b!284955 m!300029))

(declare-fun m!300031 () Bool)

(assert (=> b!284955 m!300031))

(declare-fun m!300033 () Bool)

(assert (=> b!284951 m!300033))

(check-sat (not b!284957) (not b!284953) (not b!284954) (not b!284955) (not start!27576) (not b!284958) (not b!284951))
(check-sat)
