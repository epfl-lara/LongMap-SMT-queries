; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26688 () Bool)

(assert start!26688)

(declare-fun b!277045 () Bool)

(declare-fun res!141005 () Bool)

(declare-fun e!176900 () Bool)

(assert (=> b!277045 (=> (not res!141005) (not e!176900))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277045 (= res!141005 (validKeyInArray!0 k0!2581))))

(declare-fun b!277046 () Bool)

(declare-fun res!141008 () Bool)

(assert (=> b!277046 (=> (not res!141008) (not e!176900))))

(declare-datatypes ((array!13784 0))(
  ( (array!13785 (arr!6541 (Array (_ BitVec 32) (_ BitVec 64))) (size!6893 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13784)

(declare-fun arrayContainsKey!0 (array!13784 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277046 (= res!141008 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277047 () Bool)

(declare-datatypes ((Unit!8681 0))(
  ( (Unit!8682) )
))
(declare-fun e!176897 () Unit!8681)

(declare-fun Unit!8683 () Unit!8681)

(assert (=> b!277047 (= e!176897 Unit!8683)))

(declare-fun b!277048 () Bool)

(declare-fun e!176899 () Bool)

(assert (=> b!277048 (= e!176900 e!176899)))

(declare-fun res!141006 () Bool)

(assert (=> b!277048 (=> (not res!141006) (not e!176899))))

(declare-datatypes ((SeekEntryResult!1664 0))(
  ( (MissingZero!1664 (index!8826 (_ BitVec 32))) (Found!1664 (index!8827 (_ BitVec 32))) (Intermediate!1664 (undefined!2476 Bool) (index!8828 (_ BitVec 32)) (x!27189 (_ BitVec 32))) (Undefined!1664) (MissingVacant!1664 (index!8829 (_ BitVec 32))) )
))
(declare-fun lt!137863 () SeekEntryResult!1664)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!277048 (= res!141006 (or (= lt!137863 (MissingZero!1664 i!1267)) (= lt!137863 (MissingVacant!1664 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13784 (_ BitVec 32)) SeekEntryResult!1664)

(assert (=> b!277048 (= lt!137863 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!277049 () Bool)

(assert (=> b!277049 (= e!176899 false)))

(declare-fun lt!137865 () Unit!8681)

(assert (=> b!277049 (= lt!137865 e!176897)))

(declare-fun c!45571 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!277049 (= c!45571 (bvslt startIndex!26 (bvsub (size!6893 a!3325) #b00000000000000000000000000000001)))))

(declare-fun res!141012 () Bool)

(assert (=> start!26688 (=> (not res!141012) (not e!176900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26688 (= res!141012 (validMask!0 mask!3868))))

(assert (=> start!26688 e!176900))

(declare-fun array_inv!4491 (array!13784) Bool)

(assert (=> start!26688 (array_inv!4491 a!3325)))

(assert (=> start!26688 true))

(declare-fun b!277050 () Bool)

(declare-fun res!141007 () Bool)

(assert (=> b!277050 (=> (not res!141007) (not e!176899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13784 (_ BitVec 32)) Bool)

(assert (=> b!277050 (= res!141007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277051 () Bool)

(declare-fun res!141009 () Bool)

(assert (=> b!277051 (=> (not res!141009) (not e!176900))))

(declare-datatypes ((List!4262 0))(
  ( (Nil!4259) (Cons!4258 (h!4925 (_ BitVec 64)) (t!9336 List!4262)) )
))
(declare-fun arrayNoDuplicates!0 (array!13784 (_ BitVec 32) List!4262) Bool)

(assert (=> b!277051 (= res!141009 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4259))))

(declare-fun b!277052 () Bool)

(declare-fun lt!137864 () Unit!8681)

(assert (=> b!277052 (= e!176897 lt!137864)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13784 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8681)

(assert (=> b!277052 (= lt!137864 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!277052 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13785 (store (arr!6541 a!3325) i!1267 k0!2581) (size!6893 a!3325)) mask!3868)))

(declare-fun b!277053 () Bool)

(declare-fun res!141011 () Bool)

(assert (=> b!277053 (=> (not res!141011) (not e!176900))))

(assert (=> b!277053 (= res!141011 (and (= (size!6893 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6893 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6893 a!3325))))))

(declare-fun b!277054 () Bool)

(declare-fun res!141010 () Bool)

(assert (=> b!277054 (=> (not res!141010) (not e!176899))))

(assert (=> b!277054 (= res!141010 (= startIndex!26 i!1267))))

(assert (= (and start!26688 res!141012) b!277053))

(assert (= (and b!277053 res!141011) b!277045))

(assert (= (and b!277045 res!141005) b!277051))

(assert (= (and b!277051 res!141009) b!277046))

(assert (= (and b!277046 res!141008) b!277048))

(assert (= (and b!277048 res!141006) b!277050))

(assert (= (and b!277050 res!141007) b!277054))

(assert (= (and b!277054 res!141010) b!277049))

(assert (= (and b!277049 c!45571) b!277052))

(assert (= (and b!277049 (not c!45571)) b!277047))

(declare-fun m!292397 () Bool)

(assert (=> b!277045 m!292397))

(declare-fun m!292399 () Bool)

(assert (=> b!277051 m!292399))

(declare-fun m!292401 () Bool)

(assert (=> b!277046 m!292401))

(declare-fun m!292403 () Bool)

(assert (=> b!277050 m!292403))

(declare-fun m!292405 () Bool)

(assert (=> b!277048 m!292405))

(declare-fun m!292407 () Bool)

(assert (=> start!26688 m!292407))

(declare-fun m!292409 () Bool)

(assert (=> start!26688 m!292409))

(declare-fun m!292411 () Bool)

(assert (=> b!277052 m!292411))

(declare-fun m!292413 () Bool)

(assert (=> b!277052 m!292413))

(declare-fun m!292415 () Bool)

(assert (=> b!277052 m!292415))

(check-sat (not b!277051) (not start!26688) (not b!277045) (not b!277046) (not b!277050) (not b!277048) (not b!277052))
(check-sat)
