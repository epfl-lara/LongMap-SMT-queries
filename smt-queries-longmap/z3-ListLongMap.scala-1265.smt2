; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26150 () Bool)

(assert start!26150)

(declare-fun b!269999 () Bool)

(declare-fun res!134090 () Bool)

(declare-fun e!174092 () Bool)

(assert (=> b!269999 (=> (not res!134090) (not e!174092))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269999 (= res!134090 (validKeyInArray!0 k0!2581))))

(declare-fun b!270000 () Bool)

(declare-datatypes ((Unit!8398 0))(
  ( (Unit!8399) )
))
(declare-fun e!174093 () Unit!8398)

(declare-fun Unit!8400 () Unit!8398)

(assert (=> b!270000 (= e!174093 Unit!8400)))

(declare-fun b!270001 () Bool)

(declare-fun e!174094 () Bool)

(assert (=> b!270001 (= e!174094 (not true))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-datatypes ((array!13247 0))(
  ( (array!13248 (arr!6273 (Array (_ BitVec 32) (_ BitVec 64))) (size!6625 (_ BitVec 32))) )
))
(declare-fun lt!135412 () array!13247)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1431 0))(
  ( (MissingZero!1431 (index!7894 (_ BitVec 32))) (Found!1431 (index!7895 (_ BitVec 32))) (Intermediate!1431 (undefined!2243 Bool) (index!7896 (_ BitVec 32)) (x!26236 (_ BitVec 32))) (Undefined!1431) (MissingVacant!1431 (index!7897 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13247 (_ BitVec 32)) SeekEntryResult!1431)

(assert (=> b!270001 (= (seekEntryOrOpen!0 k0!2581 lt!135412 mask!3868) (Found!1431 i!1267))))

(declare-fun a!3325 () array!13247)

(declare-fun lt!135415 () Unit!8398)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13247 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8398)

(assert (=> b!270001 (= lt!135415 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!135413 () Unit!8398)

(assert (=> b!270001 (= lt!135413 e!174093)))

(declare-fun c!45507 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!270001 (= c!45507 (bvslt startIndex!26 (bvsub (size!6625 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!270002 () Bool)

(declare-fun res!134094 () Bool)

(assert (=> b!270002 (=> (not res!134094) (not e!174092))))

(declare-fun arrayContainsKey!0 (array!13247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270002 (= res!134094 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270003 () Bool)

(declare-fun res!134088 () Bool)

(assert (=> b!270003 (=> (not res!134088) (not e!174092))))

(assert (=> b!270003 (= res!134088 (and (= (size!6625 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6625 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6625 a!3325))))))

(declare-fun b!270004 () Bool)

(declare-fun res!134091 () Bool)

(assert (=> b!270004 (=> (not res!134091) (not e!174092))))

(declare-datatypes ((List!4081 0))(
  ( (Nil!4078) (Cons!4077 (h!4744 (_ BitVec 64)) (t!9163 List!4081)) )
))
(declare-fun arrayNoDuplicates!0 (array!13247 (_ BitVec 32) List!4081) Bool)

(assert (=> b!270004 (= res!134091 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4078))))

(declare-fun res!134093 () Bool)

(assert (=> start!26150 (=> (not res!134093) (not e!174092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26150 (= res!134093 (validMask!0 mask!3868))))

(assert (=> start!26150 e!174092))

(declare-fun array_inv!4236 (array!13247) Bool)

(assert (=> start!26150 (array_inv!4236 a!3325)))

(assert (=> start!26150 true))

(declare-fun b!270005 () Bool)

(declare-fun e!174091 () Bool)

(assert (=> b!270005 (= e!174091 e!174094)))

(declare-fun res!134089 () Bool)

(assert (=> b!270005 (=> (not res!134089) (not e!174094))))

(assert (=> b!270005 (= res!134089 (= startIndex!26 i!1267))))

(assert (=> b!270005 (= lt!135412 (array!13248 (store (arr!6273 a!3325) i!1267 k0!2581) (size!6625 a!3325)))))

(declare-fun b!270006 () Bool)

(assert (=> b!270006 (= e!174092 e!174091)))

(declare-fun res!134092 () Bool)

(assert (=> b!270006 (=> (not res!134092) (not e!174091))))

(declare-fun lt!135411 () SeekEntryResult!1431)

(assert (=> b!270006 (= res!134092 (or (= lt!135411 (MissingZero!1431 i!1267)) (= lt!135411 (MissingVacant!1431 i!1267))))))

(assert (=> b!270006 (= lt!135411 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!270007 () Bool)

(declare-fun lt!135414 () Unit!8398)

(assert (=> b!270007 (= e!174093 lt!135414)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13247 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8398)

(assert (=> b!270007 (= lt!135414 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13247 (_ BitVec 32)) Bool)

(assert (=> b!270007 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135412 mask!3868)))

(declare-fun b!270008 () Bool)

(declare-fun res!134087 () Bool)

(assert (=> b!270008 (=> (not res!134087) (not e!174091))))

(assert (=> b!270008 (= res!134087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26150 res!134093) b!270003))

(assert (= (and b!270003 res!134088) b!269999))

(assert (= (and b!269999 res!134090) b!270004))

(assert (= (and b!270004 res!134091) b!270002))

(assert (= (and b!270002 res!134094) b!270006))

(assert (= (and b!270006 res!134092) b!270008))

(assert (= (and b!270008 res!134087) b!270005))

(assert (= (and b!270005 res!134089) b!270001))

(assert (= (and b!270001 c!45507) b!270007))

(assert (= (and b!270001 (not c!45507)) b!270000))

(declare-fun m!285699 () Bool)

(assert (=> b!269999 m!285699))

(declare-fun m!285701 () Bool)

(assert (=> b!270006 m!285701))

(declare-fun m!285703 () Bool)

(assert (=> start!26150 m!285703))

(declare-fun m!285705 () Bool)

(assert (=> start!26150 m!285705))

(declare-fun m!285707 () Bool)

(assert (=> b!270008 m!285707))

(declare-fun m!285709 () Bool)

(assert (=> b!270005 m!285709))

(declare-fun m!285711 () Bool)

(assert (=> b!270004 m!285711))

(declare-fun m!285713 () Bool)

(assert (=> b!270002 m!285713))

(declare-fun m!285715 () Bool)

(assert (=> b!270001 m!285715))

(declare-fun m!285717 () Bool)

(assert (=> b!270001 m!285717))

(declare-fun m!285719 () Bool)

(assert (=> b!270007 m!285719))

(declare-fun m!285721 () Bool)

(assert (=> b!270007 m!285721))

(check-sat (not b!270007) (not start!26150) (not b!270008) (not b!270004) (not b!270002) (not b!269999) (not b!270006) (not b!270001))
(check-sat)
