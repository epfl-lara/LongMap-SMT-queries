; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26154 () Bool)

(assert start!26154)

(declare-fun res!134160 () Bool)

(declare-fun e!174146 () Bool)

(assert (=> start!26154 (=> (not res!134160) (not e!174146))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26154 (= res!134160 (validMask!0 mask!3868))))

(assert (=> start!26154 e!174146))

(declare-datatypes ((array!13250 0))(
  ( (array!13251 (arr!6274 (Array (_ BitVec 32) (_ BitVec 64))) (size!6626 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13250)

(declare-fun array_inv!4224 (array!13250) Bool)

(assert (=> start!26154 (array_inv!4224 a!3325)))

(assert (=> start!26154 true))

(declare-fun b!270106 () Bool)

(declare-fun e!174149 () Bool)

(assert (=> b!270106 (= e!174149 (not true))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!135503 () array!13250)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1397 0))(
  ( (MissingZero!1397 (index!7758 (_ BitVec 32))) (Found!1397 (index!7759 (_ BitVec 32))) (Intermediate!1397 (undefined!2209 Bool) (index!7760 (_ BitVec 32)) (x!26210 (_ BitVec 32))) (Undefined!1397) (MissingVacant!1397 (index!7761 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13250 (_ BitVec 32)) SeekEntryResult!1397)

(assert (=> b!270106 (= (seekEntryOrOpen!0 k0!2581 lt!135503 mask!3868) (Found!1397 i!1267))))

(declare-datatypes ((Unit!8384 0))(
  ( (Unit!8385) )
))
(declare-fun lt!135502 () Unit!8384)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13250 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8384)

(assert (=> b!270106 (= lt!135502 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!135501 () Unit!8384)

(declare-fun e!174148 () Unit!8384)

(assert (=> b!270106 (= lt!135501 e!174148)))

(declare-fun c!45526 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!270106 (= c!45526 (bvslt startIndex!26 (bvsub (size!6626 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!270107 () Bool)

(declare-fun res!134156 () Bool)

(assert (=> b!270107 (=> (not res!134156) (not e!174146))))

(declare-datatypes ((List!3995 0))(
  ( (Nil!3992) (Cons!3991 (h!4658 (_ BitVec 64)) (t!9069 List!3995)) )
))
(declare-fun arrayNoDuplicates!0 (array!13250 (_ BitVec 32) List!3995) Bool)

(assert (=> b!270107 (= res!134156 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3992))))

(declare-fun b!270108 () Bool)

(declare-fun res!134157 () Bool)

(assert (=> b!270108 (=> (not res!134157) (not e!174146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270108 (= res!134157 (validKeyInArray!0 k0!2581))))

(declare-fun b!270109 () Bool)

(declare-fun res!134159 () Bool)

(assert (=> b!270109 (=> (not res!134159) (not e!174146))))

(declare-fun arrayContainsKey!0 (array!13250 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270109 (= res!134159 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270110 () Bool)

(declare-fun res!134162 () Bool)

(assert (=> b!270110 (=> (not res!134162) (not e!174146))))

(assert (=> b!270110 (= res!134162 (and (= (size!6626 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6626 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6626 a!3325))))))

(declare-fun b!270111 () Bool)

(declare-fun e!174147 () Bool)

(assert (=> b!270111 (= e!174146 e!174147)))

(declare-fun res!134158 () Bool)

(assert (=> b!270111 (=> (not res!134158) (not e!174147))))

(declare-fun lt!135500 () SeekEntryResult!1397)

(assert (=> b!270111 (= res!134158 (or (= lt!135500 (MissingZero!1397 i!1267)) (= lt!135500 (MissingVacant!1397 i!1267))))))

(assert (=> b!270111 (= lt!135500 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!270112 () Bool)

(assert (=> b!270112 (= e!174147 e!174149)))

(declare-fun res!134161 () Bool)

(assert (=> b!270112 (=> (not res!134161) (not e!174149))))

(assert (=> b!270112 (= res!134161 (= startIndex!26 i!1267))))

(assert (=> b!270112 (= lt!135503 (array!13251 (store (arr!6274 a!3325) i!1267 k0!2581) (size!6626 a!3325)))))

(declare-fun b!270113 () Bool)

(declare-fun res!134163 () Bool)

(assert (=> b!270113 (=> (not res!134163) (not e!174147))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13250 (_ BitVec 32)) Bool)

(assert (=> b!270113 (= res!134163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270114 () Bool)

(declare-fun Unit!8386 () Unit!8384)

(assert (=> b!270114 (= e!174148 Unit!8386)))

(declare-fun b!270115 () Bool)

(declare-fun lt!135504 () Unit!8384)

(assert (=> b!270115 (= e!174148 lt!135504)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13250 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8384)

(assert (=> b!270115 (= lt!135504 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!270115 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135503 mask!3868)))

(assert (= (and start!26154 res!134160) b!270110))

(assert (= (and b!270110 res!134162) b!270108))

(assert (= (and b!270108 res!134157) b!270107))

(assert (= (and b!270107 res!134156) b!270109))

(assert (= (and b!270109 res!134159) b!270111))

(assert (= (and b!270111 res!134158) b!270113))

(assert (= (and b!270113 res!134163) b!270112))

(assert (= (and b!270112 res!134161) b!270106))

(assert (= (and b!270106 c!45526) b!270115))

(assert (= (and b!270106 (not c!45526)) b!270114))

(declare-fun m!285953 () Bool)

(assert (=> b!270115 m!285953))

(declare-fun m!285955 () Bool)

(assert (=> b!270115 m!285955))

(declare-fun m!285957 () Bool)

(assert (=> start!26154 m!285957))

(declare-fun m!285959 () Bool)

(assert (=> start!26154 m!285959))

(declare-fun m!285961 () Bool)

(assert (=> b!270113 m!285961))

(declare-fun m!285963 () Bool)

(assert (=> b!270112 m!285963))

(declare-fun m!285965 () Bool)

(assert (=> b!270111 m!285965))

(declare-fun m!285967 () Bool)

(assert (=> b!270108 m!285967))

(declare-fun m!285969 () Bool)

(assert (=> b!270106 m!285969))

(declare-fun m!285971 () Bool)

(assert (=> b!270106 m!285971))

(declare-fun m!285973 () Bool)

(assert (=> b!270109 m!285973))

(declare-fun m!285975 () Bool)

(assert (=> b!270107 m!285975))

(check-sat (not b!270107) (not b!270106) (not b!270111) (not b!270108) (not b!270109) (not b!270115) (not b!270113) (not start!26154))
(check-sat)
