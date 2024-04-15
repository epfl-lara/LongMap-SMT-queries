; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26162 () Bool)

(assert start!26162)

(declare-fun b!270002 () Bool)

(declare-fun res!134115 () Bool)

(declare-fun e!174065 () Bool)

(assert (=> b!270002 (=> (not res!134115) (not e!174065))))

(declare-datatypes ((array!13248 0))(
  ( (array!13249 (arr!6273 (Array (_ BitVec 32) (_ BitVec 64))) (size!6626 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13248)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!270002 (= res!134115 (and (= (size!6626 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6626 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6626 a!3325))))))

(declare-fun b!270003 () Bool)

(declare-fun e!174068 () Bool)

(assert (=> b!270003 (= e!174065 e!174068)))

(declare-fun res!134114 () Bool)

(assert (=> b!270003 (=> (not res!134114) (not e!174068))))

(declare-datatypes ((SeekEntryResult!1430 0))(
  ( (MissingZero!1430 (index!7890 (_ BitVec 32))) (Found!1430 (index!7891 (_ BitVec 32))) (Intermediate!1430 (undefined!2242 Bool) (index!7892 (_ BitVec 32)) (x!26250 (_ BitVec 32))) (Undefined!1430) (MissingVacant!1430 (index!7893 (_ BitVec 32))) )
))
(declare-fun lt!135307 () SeekEntryResult!1430)

(assert (=> b!270003 (= res!134114 (or (= lt!135307 (MissingZero!1430 i!1267)) (= lt!135307 (MissingVacant!1430 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13248 (_ BitVec 32)) SeekEntryResult!1430)

(assert (=> b!270003 (= lt!135307 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!270004 () Bool)

(declare-fun res!134119 () Bool)

(assert (=> b!270004 (=> (not res!134119) (not e!174068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13248 (_ BitVec 32)) Bool)

(assert (=> b!270004 (= res!134119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!134112 () Bool)

(assert (=> start!26162 (=> (not res!134112) (not e!174065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26162 (= res!134112 (validMask!0 mask!3868))))

(assert (=> start!26162 e!174065))

(declare-fun array_inv!4245 (array!13248) Bool)

(assert (=> start!26162 (array_inv!4245 a!3325)))

(assert (=> start!26162 true))

(declare-fun b!270005 () Bool)

(declare-datatypes ((Unit!8367 0))(
  ( (Unit!8368) )
))
(declare-fun e!174067 () Unit!8367)

(declare-fun Unit!8369 () Unit!8367)

(assert (=> b!270005 (= e!174067 Unit!8369)))

(declare-fun b!270006 () Bool)

(declare-fun e!174069 () Bool)

(assert (=> b!270006 (= e!174069 (not true))))

(declare-fun lt!135308 () array!13248)

(assert (=> b!270006 (= (seekEntryOrOpen!0 k0!2581 lt!135308 mask!3868) (Found!1430 i!1267))))

(declare-fun lt!135305 () Unit!8367)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13248 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8367)

(assert (=> b!270006 (= lt!135305 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!135306 () Unit!8367)

(assert (=> b!270006 (= lt!135306 e!174067)))

(declare-fun c!45496 () Bool)

(assert (=> b!270006 (= c!45496 (bvslt startIndex!26 (bvsub (size!6626 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!270007 () Bool)

(declare-fun res!134113 () Bool)

(assert (=> b!270007 (=> (not res!134113) (not e!174065))))

(declare-datatypes ((List!4054 0))(
  ( (Nil!4051) (Cons!4050 (h!4717 (_ BitVec 64)) (t!9127 List!4054)) )
))
(declare-fun arrayNoDuplicates!0 (array!13248 (_ BitVec 32) List!4054) Bool)

(assert (=> b!270007 (= res!134113 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4051))))

(declare-fun b!270008 () Bool)

(declare-fun lt!135309 () Unit!8367)

(assert (=> b!270008 (= e!174067 lt!135309)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13248 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8367)

(assert (=> b!270008 (= lt!135309 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!270008 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135308 mask!3868)))

(declare-fun b!270009 () Bool)

(declare-fun res!134117 () Bool)

(assert (=> b!270009 (=> (not res!134117) (not e!174065))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270009 (= res!134117 (validKeyInArray!0 k0!2581))))

(declare-fun b!270010 () Bool)

(assert (=> b!270010 (= e!174068 e!174069)))

(declare-fun res!134118 () Bool)

(assert (=> b!270010 (=> (not res!134118) (not e!174069))))

(assert (=> b!270010 (= res!134118 (= startIndex!26 i!1267))))

(assert (=> b!270010 (= lt!135308 (array!13249 (store (arr!6273 a!3325) i!1267 k0!2581) (size!6626 a!3325)))))

(declare-fun b!270011 () Bool)

(declare-fun res!134116 () Bool)

(assert (=> b!270011 (=> (not res!134116) (not e!174065))))

(declare-fun arrayContainsKey!0 (array!13248 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270011 (= res!134116 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26162 res!134112) b!270002))

(assert (= (and b!270002 res!134115) b!270009))

(assert (= (and b!270009 res!134117) b!270007))

(assert (= (and b!270007 res!134113) b!270011))

(assert (= (and b!270011 res!134116) b!270003))

(assert (= (and b!270003 res!134114) b!270004))

(assert (= (and b!270004 res!134119) b!270010))

(assert (= (and b!270010 res!134118) b!270006))

(assert (= (and b!270006 c!45496) b!270008))

(assert (= (and b!270006 (not c!45496)) b!270005))

(declare-fun m!285227 () Bool)

(assert (=> start!26162 m!285227))

(declare-fun m!285229 () Bool)

(assert (=> start!26162 m!285229))

(declare-fun m!285231 () Bool)

(assert (=> b!270008 m!285231))

(declare-fun m!285233 () Bool)

(assert (=> b!270008 m!285233))

(declare-fun m!285235 () Bool)

(assert (=> b!270009 m!285235))

(declare-fun m!285237 () Bool)

(assert (=> b!270006 m!285237))

(declare-fun m!285239 () Bool)

(assert (=> b!270006 m!285239))

(declare-fun m!285241 () Bool)

(assert (=> b!270010 m!285241))

(declare-fun m!285243 () Bool)

(assert (=> b!270003 m!285243))

(declare-fun m!285245 () Bool)

(assert (=> b!270007 m!285245))

(declare-fun m!285247 () Bool)

(assert (=> b!270011 m!285247))

(declare-fun m!285249 () Bool)

(assert (=> b!270004 m!285249))

(check-sat (not start!26162) (not b!270004) (not b!270011) (not b!270007) (not b!270003) (not b!270008) (not b!270006) (not b!270009))
(check-sat)
