; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26148 () Bool)

(assert start!26148)

(declare-fun b!270016 () Bool)

(declare-fun e!174101 () Bool)

(declare-fun e!174103 () Bool)

(assert (=> b!270016 (= e!174101 e!174103)))

(declare-fun res!134084 () Bool)

(assert (=> b!270016 (=> (not res!134084) (not e!174103))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270016 (= res!134084 (= startIndex!26 i!1267))))

(declare-datatypes ((array!13244 0))(
  ( (array!13245 (arr!6271 (Array (_ BitVec 32) (_ BitVec 64))) (size!6623 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13244)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!135457 () array!13244)

(assert (=> b!270016 (= lt!135457 (array!13245 (store (arr!6271 a!3325) i!1267 k0!2581) (size!6623 a!3325)))))

(declare-fun b!270017 () Bool)

(declare-fun res!134085 () Bool)

(declare-fun e!174102 () Bool)

(assert (=> b!270017 (=> (not res!134085) (not e!174102))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270017 (= res!134085 (validKeyInArray!0 k0!2581))))

(declare-fun b!270018 () Bool)

(declare-fun res!134090 () Bool)

(assert (=> b!270018 (=> (not res!134090) (not e!174102))))

(declare-fun arrayContainsKey!0 (array!13244 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270018 (= res!134090 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270019 () Bool)

(declare-fun res!134086 () Bool)

(assert (=> b!270019 (=> (not res!134086) (not e!174102))))

(declare-datatypes ((List!3992 0))(
  ( (Nil!3989) (Cons!3988 (h!4655 (_ BitVec 64)) (t!9066 List!3992)) )
))
(declare-fun arrayNoDuplicates!0 (array!13244 (_ BitVec 32) List!3992) Bool)

(assert (=> b!270019 (= res!134086 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3989))))

(declare-fun b!270020 () Bool)

(assert (=> b!270020 (= e!174102 e!174101)))

(declare-fun res!134088 () Bool)

(assert (=> b!270020 (=> (not res!134088) (not e!174101))))

(declare-datatypes ((SeekEntryResult!1394 0))(
  ( (MissingZero!1394 (index!7746 (_ BitVec 32))) (Found!1394 (index!7747 (_ BitVec 32))) (Intermediate!1394 (undefined!2206 Bool) (index!7748 (_ BitVec 32)) (x!26199 (_ BitVec 32))) (Undefined!1394) (MissingVacant!1394 (index!7749 (_ BitVec 32))) )
))
(declare-fun lt!135456 () SeekEntryResult!1394)

(assert (=> b!270020 (= res!134088 (or (= lt!135456 (MissingZero!1394 i!1267)) (= lt!135456 (MissingVacant!1394 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13244 (_ BitVec 32)) SeekEntryResult!1394)

(assert (=> b!270020 (= lt!135456 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!270021 () Bool)

(assert (=> b!270021 (= e!174103 (not true))))

(assert (=> b!270021 (= (seekEntryOrOpen!0 k0!2581 lt!135457 mask!3868) (Found!1394 i!1267))))

(declare-datatypes ((Unit!8375 0))(
  ( (Unit!8376) )
))
(declare-fun lt!135459 () Unit!8375)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13244 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8375)

(assert (=> b!270021 (= lt!135459 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!135458 () Unit!8375)

(declare-fun e!174104 () Unit!8375)

(assert (=> b!270021 (= lt!135458 e!174104)))

(declare-fun c!45517 () Bool)

(assert (=> b!270021 (= c!45517 (bvslt startIndex!26 (bvsub (size!6623 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!270022 () Bool)

(declare-fun res!134091 () Bool)

(assert (=> b!270022 (=> (not res!134091) (not e!174101))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13244 (_ BitVec 32)) Bool)

(assert (=> b!270022 (= res!134091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270023 () Bool)

(declare-fun Unit!8377 () Unit!8375)

(assert (=> b!270023 (= e!174104 Unit!8377)))

(declare-fun b!270024 () Bool)

(declare-fun lt!135455 () Unit!8375)

(assert (=> b!270024 (= e!174104 lt!135455)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13244 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8375)

(assert (=> b!270024 (= lt!135455 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!270024 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135457 mask!3868)))

(declare-fun res!134089 () Bool)

(assert (=> start!26148 (=> (not res!134089) (not e!174102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26148 (= res!134089 (validMask!0 mask!3868))))

(assert (=> start!26148 e!174102))

(declare-fun array_inv!4221 (array!13244) Bool)

(assert (=> start!26148 (array_inv!4221 a!3325)))

(assert (=> start!26148 true))

(declare-fun b!270025 () Bool)

(declare-fun res!134087 () Bool)

(assert (=> b!270025 (=> (not res!134087) (not e!174102))))

(assert (=> b!270025 (= res!134087 (and (= (size!6623 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6623 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6623 a!3325))))))

(assert (= (and start!26148 res!134089) b!270025))

(assert (= (and b!270025 res!134087) b!270017))

(assert (= (and b!270017 res!134085) b!270019))

(assert (= (and b!270019 res!134086) b!270018))

(assert (= (and b!270018 res!134090) b!270020))

(assert (= (and b!270020 res!134088) b!270022))

(assert (= (and b!270022 res!134091) b!270016))

(assert (= (and b!270016 res!134084) b!270021))

(assert (= (and b!270021 c!45517) b!270024))

(assert (= (and b!270021 (not c!45517)) b!270023))

(declare-fun m!285881 () Bool)

(assert (=> b!270016 m!285881))

(declare-fun m!285883 () Bool)

(assert (=> b!270020 m!285883))

(declare-fun m!285885 () Bool)

(assert (=> b!270021 m!285885))

(declare-fun m!285887 () Bool)

(assert (=> b!270021 m!285887))

(declare-fun m!285889 () Bool)

(assert (=> b!270022 m!285889))

(declare-fun m!285891 () Bool)

(assert (=> b!270024 m!285891))

(declare-fun m!285893 () Bool)

(assert (=> b!270024 m!285893))

(declare-fun m!285895 () Bool)

(assert (=> b!270017 m!285895))

(declare-fun m!285897 () Bool)

(assert (=> b!270018 m!285897))

(declare-fun m!285899 () Bool)

(assert (=> start!26148 m!285899))

(declare-fun m!285901 () Bool)

(assert (=> start!26148 m!285901))

(declare-fun m!285903 () Bool)

(assert (=> b!270019 m!285903))

(check-sat (not b!270021) (not b!270024) (not b!270018) (not b!270022) (not b!270017) (not start!26148) (not b!270019) (not b!270020))
(check-sat)
