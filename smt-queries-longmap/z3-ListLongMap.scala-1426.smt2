; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27582 () Bool)

(assert start!27582)

(declare-fun b!285034 () Bool)

(declare-fun res!147520 () Bool)

(declare-fun e!180711 () Bool)

(assert (=> b!285034 (=> (not res!147520) (not e!180711))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285034 (= res!147520 (validKeyInArray!0 k0!2581))))

(declare-fun res!147525 () Bool)

(assert (=> start!27582 (=> (not res!147525) (not e!180711))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27582 (= res!147525 (validMask!0 mask!3868))))

(assert (=> start!27582 e!180711))

(declare-datatypes ((array!14231 0))(
  ( (array!14232 (arr!6754 (Array (_ BitVec 32) (_ BitVec 64))) (size!7106 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14231)

(declare-fun array_inv!4704 (array!14231) Bool)

(assert (=> start!27582 (array_inv!4704 a!3325)))

(assert (=> start!27582 true))

(declare-fun b!285035 () Bool)

(declare-fun res!147523 () Bool)

(assert (=> b!285035 (=> (not res!147523) (not e!180711))))

(declare-datatypes ((List!4475 0))(
  ( (Nil!4472) (Cons!4471 (h!5144 (_ BitVec 64)) (t!9549 List!4475)) )
))
(declare-fun arrayNoDuplicates!0 (array!14231 (_ BitVec 32) List!4475) Bool)

(assert (=> b!285035 (= res!147523 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4472))))

(declare-fun b!285036 () Bool)

(declare-fun e!180713 () Bool)

(assert (=> b!285036 (= e!180713 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14231 (_ BitVec 32)) Bool)

(assert (=> b!285036 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!14232 (store (arr!6754 a!3325) i!1267 k0!2581) (size!7106 a!3325)) mask!3868)))

(declare-datatypes ((Unit!9006 0))(
  ( (Unit!9007) )
))
(declare-fun lt!140724 () Unit!9006)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!14231 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9006)

(assert (=> b!285036 (= lt!140724 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!285037 () Bool)

(declare-fun res!147521 () Bool)

(assert (=> b!285037 (=> (not res!147521) (not e!180713))))

(assert (=> b!285037 (= res!147521 (and (bvslt startIndex!26 (bvsub (size!7106 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!285038 () Bool)

(declare-fun res!147522 () Bool)

(assert (=> b!285038 (=> (not res!147522) (not e!180713))))

(assert (=> b!285038 (= res!147522 (not (validKeyInArray!0 (select (arr!6754 a!3325) startIndex!26))))))

(declare-fun b!285039 () Bool)

(declare-fun res!147524 () Bool)

(assert (=> b!285039 (=> (not res!147524) (not e!180713))))

(assert (=> b!285039 (= res!147524 (not (= startIndex!26 i!1267)))))

(declare-fun b!285040 () Bool)

(declare-fun res!147517 () Bool)

(assert (=> b!285040 (=> (not res!147517) (not e!180713))))

(assert (=> b!285040 (= res!147517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!285041 () Bool)

(declare-fun res!147518 () Bool)

(assert (=> b!285041 (=> (not res!147518) (not e!180711))))

(assert (=> b!285041 (= res!147518 (and (= (size!7106 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7106 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7106 a!3325))))))

(declare-fun b!285042 () Bool)

(assert (=> b!285042 (= e!180711 e!180713)))

(declare-fun res!147516 () Bool)

(assert (=> b!285042 (=> (not res!147516) (not e!180713))))

(declare-datatypes ((SeekEntryResult!1877 0))(
  ( (MissingZero!1877 (index!9678 (_ BitVec 32))) (Found!1877 (index!9679 (_ BitVec 32))) (Intermediate!1877 (undefined!2689 Bool) (index!9680 (_ BitVec 32)) (x!27988 (_ BitVec 32))) (Undefined!1877) (MissingVacant!1877 (index!9681 (_ BitVec 32))) )
))
(declare-fun lt!140723 () SeekEntryResult!1877)

(assert (=> b!285042 (= res!147516 (or (= lt!140723 (MissingZero!1877 i!1267)) (= lt!140723 (MissingVacant!1877 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14231 (_ BitVec 32)) SeekEntryResult!1877)

(assert (=> b!285042 (= lt!140723 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!285043 () Bool)

(declare-fun res!147519 () Bool)

(assert (=> b!285043 (=> (not res!147519) (not e!180711))))

(declare-fun arrayContainsKey!0 (array!14231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!285043 (= res!147519 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!27582 res!147525) b!285041))

(assert (= (and b!285041 res!147518) b!285034))

(assert (= (and b!285034 res!147520) b!285035))

(assert (= (and b!285035 res!147523) b!285043))

(assert (= (and b!285043 res!147519) b!285042))

(assert (= (and b!285042 res!147516) b!285040))

(assert (= (and b!285040 res!147517) b!285039))

(assert (= (and b!285039 res!147524) b!285038))

(assert (= (and b!285038 res!147522) b!285037))

(assert (= (and b!285037 res!147521) b!285036))

(declare-fun m!300071 () Bool)

(assert (=> b!285036 m!300071))

(declare-fun m!300073 () Bool)

(assert (=> b!285036 m!300073))

(declare-fun m!300075 () Bool)

(assert (=> b!285036 m!300075))

(declare-fun m!300077 () Bool)

(assert (=> b!285035 m!300077))

(declare-fun m!300079 () Bool)

(assert (=> b!285043 m!300079))

(declare-fun m!300081 () Bool)

(assert (=> b!285038 m!300081))

(assert (=> b!285038 m!300081))

(declare-fun m!300083 () Bool)

(assert (=> b!285038 m!300083))

(declare-fun m!300085 () Bool)

(assert (=> b!285034 m!300085))

(declare-fun m!300087 () Bool)

(assert (=> start!27582 m!300087))

(declare-fun m!300089 () Bool)

(assert (=> start!27582 m!300089))

(declare-fun m!300091 () Bool)

(assert (=> b!285040 m!300091))

(declare-fun m!300093 () Bool)

(assert (=> b!285042 m!300093))

(check-sat (not start!27582) (not b!285035) (not b!285036) (not b!285043) (not b!285042) (not b!285038) (not b!285034) (not b!285040))
(check-sat)
