; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26700 () Bool)

(assert start!26700)

(declare-fun b!277225 () Bool)

(declare-fun res!141151 () Bool)

(declare-fun e!176972 () Bool)

(assert (=> b!277225 (=> (not res!141151) (not e!176972))))

(declare-datatypes ((array!13796 0))(
  ( (array!13797 (arr!6547 (Array (_ BitVec 32) (_ BitVec 64))) (size!6899 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13796)

(declare-datatypes ((List!4268 0))(
  ( (Nil!4265) (Cons!4264 (h!4931 (_ BitVec 64)) (t!9342 List!4268)) )
))
(declare-fun arrayNoDuplicates!0 (array!13796 (_ BitVec 32) List!4268) Bool)

(assert (=> b!277225 (= res!141151 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4265))))

(declare-fun b!277226 () Bool)

(declare-datatypes ((Unit!8699 0))(
  ( (Unit!8700) )
))
(declare-fun e!176969 () Unit!8699)

(declare-fun Unit!8701 () Unit!8699)

(assert (=> b!277226 (= e!176969 Unit!8701)))

(declare-fun b!277227 () Bool)

(declare-fun res!141155 () Bool)

(assert (=> b!277227 (=> (not res!141155) (not e!176972))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!277227 (= res!141155 (and (= (size!6899 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6899 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6899 a!3325))))))

(declare-fun b!277228 () Bool)

(declare-fun e!176970 () Bool)

(assert (=> b!277228 (= e!176972 e!176970)))

(declare-fun res!141156 () Bool)

(assert (=> b!277228 (=> (not res!141156) (not e!176970))))

(declare-datatypes ((SeekEntryResult!1670 0))(
  ( (MissingZero!1670 (index!8850 (_ BitVec 32))) (Found!1670 (index!8851 (_ BitVec 32))) (Intermediate!1670 (undefined!2482 Bool) (index!8852 (_ BitVec 32)) (x!27211 (_ BitVec 32))) (Undefined!1670) (MissingVacant!1670 (index!8853 (_ BitVec 32))) )
))
(declare-fun lt!137919 () SeekEntryResult!1670)

(assert (=> b!277228 (= res!141156 (or (= lt!137919 (MissingZero!1670 i!1267)) (= lt!137919 (MissingVacant!1670 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13796 (_ BitVec 32)) SeekEntryResult!1670)

(assert (=> b!277228 (= lt!137919 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!277229 () Bool)

(declare-fun res!141153 () Bool)

(assert (=> b!277229 (=> (not res!141153) (not e!176972))))

(declare-fun arrayContainsKey!0 (array!13796 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277229 (= res!141153 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277230 () Bool)

(assert (=> b!277230 (= e!176970 false)))

(declare-fun lt!137917 () Unit!8699)

(assert (=> b!277230 (= lt!137917 e!176969)))

(declare-fun c!45589 () Bool)

(assert (=> b!277230 (= c!45589 (bvslt startIndex!26 (bvsub (size!6899 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277231 () Bool)

(declare-fun lt!137918 () Unit!8699)

(assert (=> b!277231 (= e!176969 lt!137918)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13796 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8699)

(assert (=> b!277231 (= lt!137918 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13796 (_ BitVec 32)) Bool)

(assert (=> b!277231 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13797 (store (arr!6547 a!3325) i!1267 k0!2581) (size!6899 a!3325)) mask!3868)))

(declare-fun res!141149 () Bool)

(assert (=> start!26700 (=> (not res!141149) (not e!176972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26700 (= res!141149 (validMask!0 mask!3868))))

(assert (=> start!26700 e!176972))

(declare-fun array_inv!4497 (array!13796) Bool)

(assert (=> start!26700 (array_inv!4497 a!3325)))

(assert (=> start!26700 true))

(declare-fun b!277232 () Bool)

(declare-fun res!141150 () Bool)

(assert (=> b!277232 (=> (not res!141150) (not e!176972))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277232 (= res!141150 (validKeyInArray!0 k0!2581))))

(declare-fun b!277233 () Bool)

(declare-fun res!141154 () Bool)

(assert (=> b!277233 (=> (not res!141154) (not e!176970))))

(assert (=> b!277233 (= res!141154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277234 () Bool)

(declare-fun res!141152 () Bool)

(assert (=> b!277234 (=> (not res!141152) (not e!176970))))

(assert (=> b!277234 (= res!141152 (= startIndex!26 i!1267))))

(assert (= (and start!26700 res!141149) b!277227))

(assert (= (and b!277227 res!141155) b!277232))

(assert (= (and b!277232 res!141150) b!277225))

(assert (= (and b!277225 res!141151) b!277229))

(assert (= (and b!277229 res!141153) b!277228))

(assert (= (and b!277228 res!141156) b!277233))

(assert (= (and b!277233 res!141154) b!277234))

(assert (= (and b!277234 res!141152) b!277230))

(assert (= (and b!277230 c!45589) b!277231))

(assert (= (and b!277230 (not c!45589)) b!277226))

(declare-fun m!292517 () Bool)

(assert (=> b!277229 m!292517))

(declare-fun m!292519 () Bool)

(assert (=> b!277231 m!292519))

(declare-fun m!292521 () Bool)

(assert (=> b!277231 m!292521))

(declare-fun m!292523 () Bool)

(assert (=> b!277231 m!292523))

(declare-fun m!292525 () Bool)

(assert (=> b!277233 m!292525))

(declare-fun m!292527 () Bool)

(assert (=> b!277228 m!292527))

(declare-fun m!292529 () Bool)

(assert (=> b!277232 m!292529))

(declare-fun m!292531 () Bool)

(assert (=> b!277225 m!292531))

(declare-fun m!292533 () Bool)

(assert (=> start!26700 m!292533))

(declare-fun m!292535 () Bool)

(assert (=> start!26700 m!292535))

(check-sat (not b!277232) (not b!277229) (not start!26700) (not b!277231) (not b!277225) (not b!277233) (not b!277228))
(check-sat)
