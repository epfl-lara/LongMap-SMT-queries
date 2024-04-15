; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26222 () Bool)

(assert start!26222)

(declare-fun b!271070 () Bool)

(declare-fun res!135117 () Bool)

(declare-fun e!174405 () Bool)

(assert (=> b!271070 (=> (not res!135117) (not e!174405))))

(declare-datatypes ((List!4084 0))(
  ( (Nil!4081) (Cons!4080 (h!4747 (_ BitVec 64)) (t!9157 List!4084)) )
))
(declare-fun noDuplicate!136 (List!4084) Bool)

(assert (=> b!271070 (= res!135117 (noDuplicate!136 Nil!4081))))

(declare-fun b!271071 () Bool)

(declare-fun res!135123 () Bool)

(assert (=> b!271071 (=> (not res!135123) (not e!174405))))

(declare-datatypes ((array!13308 0))(
  ( (array!13309 (arr!6303 (Array (_ BitVec 32) (_ BitVec 64))) (size!6656 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13308)

(assert (=> b!271071 (= res!135123 (and (bvslt (size!6656 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6656 a!3325))))))

(declare-fun b!271072 () Bool)

(declare-fun res!135122 () Bool)

(assert (=> b!271072 (=> (not res!135122) (not e!174405))))

(declare-fun contains!1922 (List!4084 (_ BitVec 64)) Bool)

(assert (=> b!271072 (= res!135122 (not (contains!1922 Nil!4081 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271073 () Bool)

(declare-fun res!135120 () Bool)

(declare-fun e!174404 () Bool)

(assert (=> b!271073 (=> (not res!135120) (not e!174404))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271073 (= res!135120 (validKeyInArray!0 k0!2581))))

(declare-fun b!271074 () Bool)

(declare-fun res!135115 () Bool)

(assert (=> b!271074 (=> (not res!135115) (not e!174404))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!271074 (= res!135115 (and (= (size!6656 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6656 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6656 a!3325))))))

(declare-fun b!271075 () Bool)

(declare-fun res!135114 () Bool)

(assert (=> b!271075 (=> (not res!135114) (not e!174405))))

(assert (=> b!271075 (= res!135114 (validKeyInArray!0 (select (arr!6303 a!3325) startIndex!26)))))

(declare-fun b!271076 () Bool)

(declare-fun res!135113 () Bool)

(assert (=> b!271076 (=> (not res!135113) (not e!174405))))

(assert (=> b!271076 (= res!135113 (not (contains!1922 Nil!4081 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271077 () Bool)

(declare-fun res!135119 () Bool)

(assert (=> b!271077 (=> (not res!135119) (not e!174405))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13308 (_ BitVec 32)) Bool)

(assert (=> b!271077 (= res!135119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271078 () Bool)

(declare-fun res!135121 () Bool)

(assert (=> b!271078 (=> (not res!135121) (not e!174405))))

(assert (=> b!271078 (= res!135121 (not (= startIndex!26 i!1267)))))

(declare-fun b!271079 () Bool)

(declare-fun res!135112 () Bool)

(assert (=> b!271079 (=> (not res!135112) (not e!174404))))

(declare-fun arrayNoDuplicates!0 (array!13308 (_ BitVec 32) List!4084) Bool)

(assert (=> b!271079 (= res!135112 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4081))))

(declare-fun b!271080 () Bool)

(assert (=> b!271080 (= e!174405 false)))

(declare-fun lt!135587 () Bool)

(assert (=> b!271080 (= lt!135587 (contains!1922 Nil!4081 k0!2581))))

(declare-fun res!135124 () Bool)

(assert (=> start!26222 (=> (not res!135124) (not e!174404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26222 (= res!135124 (validMask!0 mask!3868))))

(assert (=> start!26222 e!174404))

(declare-fun array_inv!4275 (array!13308) Bool)

(assert (=> start!26222 (array_inv!4275 a!3325)))

(assert (=> start!26222 true))

(declare-fun b!271081 () Bool)

(assert (=> b!271081 (= e!174404 e!174405)))

(declare-fun res!135116 () Bool)

(assert (=> b!271081 (=> (not res!135116) (not e!174405))))

(declare-datatypes ((SeekEntryResult!1460 0))(
  ( (MissingZero!1460 (index!8010 (_ BitVec 32))) (Found!1460 (index!8011 (_ BitVec 32))) (Intermediate!1460 (undefined!2272 Bool) (index!8012 (_ BitVec 32)) (x!26360 (_ BitVec 32))) (Undefined!1460) (MissingVacant!1460 (index!8013 (_ BitVec 32))) )
))
(declare-fun lt!135588 () SeekEntryResult!1460)

(assert (=> b!271081 (= res!135116 (or (= lt!135588 (MissingZero!1460 i!1267)) (= lt!135588 (MissingVacant!1460 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13308 (_ BitVec 32)) SeekEntryResult!1460)

(assert (=> b!271081 (= lt!135588 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!271082 () Bool)

(declare-fun res!135118 () Bool)

(assert (=> b!271082 (=> (not res!135118) (not e!174404))))

(declare-fun arrayContainsKey!0 (array!13308 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271082 (= res!135118 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26222 res!135124) b!271074))

(assert (= (and b!271074 res!135115) b!271073))

(assert (= (and b!271073 res!135120) b!271079))

(assert (= (and b!271079 res!135112) b!271082))

(assert (= (and b!271082 res!135118) b!271081))

(assert (= (and b!271081 res!135116) b!271077))

(assert (= (and b!271077 res!135119) b!271078))

(assert (= (and b!271078 res!135121) b!271075))

(assert (= (and b!271075 res!135114) b!271071))

(assert (= (and b!271071 res!135123) b!271070))

(assert (= (and b!271070 res!135117) b!271076))

(assert (= (and b!271076 res!135113) b!271072))

(assert (= (and b!271072 res!135122) b!271080))

(declare-fun m!285983 () Bool)

(assert (=> b!271079 m!285983))

(declare-fun m!285985 () Bool)

(assert (=> start!26222 m!285985))

(declare-fun m!285987 () Bool)

(assert (=> start!26222 m!285987))

(declare-fun m!285989 () Bool)

(assert (=> b!271076 m!285989))

(declare-fun m!285991 () Bool)

(assert (=> b!271080 m!285991))

(declare-fun m!285993 () Bool)

(assert (=> b!271073 m!285993))

(declare-fun m!285995 () Bool)

(assert (=> b!271077 m!285995))

(declare-fun m!285997 () Bool)

(assert (=> b!271072 m!285997))

(declare-fun m!285999 () Bool)

(assert (=> b!271070 m!285999))

(declare-fun m!286001 () Bool)

(assert (=> b!271075 m!286001))

(assert (=> b!271075 m!286001))

(declare-fun m!286003 () Bool)

(assert (=> b!271075 m!286003))

(declare-fun m!286005 () Bool)

(assert (=> b!271081 m!286005))

(declare-fun m!286007 () Bool)

(assert (=> b!271082 m!286007))

(check-sat (not b!271076) (not b!271082) (not b!271075) (not b!271077) (not start!26222) (not b!271072) (not b!271080) (not b!271081) (not b!271079) (not b!271070) (not b!271073))
(check-sat)
