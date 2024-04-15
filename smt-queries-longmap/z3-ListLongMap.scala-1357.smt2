; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26702 () Bool)

(assert start!26702)

(declare-fun b!277031 () Bool)

(declare-fun e!176844 () Bool)

(assert (=> b!277031 (= e!176844 false)))

(declare-datatypes ((Unit!8673 0))(
  ( (Unit!8674) )
))
(declare-fun lt!137679 () Unit!8673)

(declare-fun e!176846 () Unit!8673)

(assert (=> b!277031 (= lt!137679 e!176846)))

(declare-fun c!45550 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13788 0))(
  ( (array!13789 (arr!6543 (Array (_ BitVec 32) (_ BitVec 64))) (size!6896 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13788)

(assert (=> b!277031 (= c!45550 (bvslt startIndex!26 (bvsub (size!6896 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277032 () Bool)

(declare-fun res!141036 () Bool)

(declare-fun e!176847 () Bool)

(assert (=> b!277032 (=> (not res!141036) (not e!176847))))

(declare-datatypes ((List!4324 0))(
  ( (Nil!4321) (Cons!4320 (h!4987 (_ BitVec 64)) (t!9397 List!4324)) )
))
(declare-fun arrayNoDuplicates!0 (array!13788 (_ BitVec 32) List!4324) Bool)

(assert (=> b!277032 (= res!141036 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4321))))

(declare-fun b!277033 () Bool)

(declare-fun Unit!8675 () Unit!8673)

(assert (=> b!277033 (= e!176846 Unit!8675)))

(declare-fun b!277034 () Bool)

(declare-fun res!141039 () Bool)

(assert (=> b!277034 (=> (not res!141039) (not e!176844))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13788 (_ BitVec 32)) Bool)

(assert (=> b!277034 (= res!141039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277035 () Bool)

(declare-fun lt!137677 () Unit!8673)

(assert (=> b!277035 (= e!176846 lt!137677)))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13788 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8673)

(assert (=> b!277035 (= lt!137677 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!277035 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13789 (store (arr!6543 a!3325) i!1267 k0!2581) (size!6896 a!3325)) mask!3868)))

(declare-fun b!277037 () Bool)

(declare-fun res!141037 () Bool)

(assert (=> b!277037 (=> (not res!141037) (not e!176847))))

(assert (=> b!277037 (= res!141037 (and (= (size!6896 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6896 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6896 a!3325))))))

(declare-fun b!277038 () Bool)

(declare-fun res!141038 () Bool)

(assert (=> b!277038 (=> (not res!141038) (not e!176847))))

(declare-fun arrayContainsKey!0 (array!13788 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277038 (= res!141038 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277039 () Bool)

(declare-fun res!141033 () Bool)

(assert (=> b!277039 (=> (not res!141033) (not e!176844))))

(assert (=> b!277039 (= res!141033 (= startIndex!26 i!1267))))

(declare-fun b!277040 () Bool)

(assert (=> b!277040 (= e!176847 e!176844)))

(declare-fun res!141040 () Bool)

(assert (=> b!277040 (=> (not res!141040) (not e!176844))))

(declare-datatypes ((SeekEntryResult!1700 0))(
  ( (MissingZero!1700 (index!8970 (_ BitVec 32))) (Found!1700 (index!8971 (_ BitVec 32))) (Intermediate!1700 (undefined!2512 Bool) (index!8972 (_ BitVec 32)) (x!27240 (_ BitVec 32))) (Undefined!1700) (MissingVacant!1700 (index!8973 (_ BitVec 32))) )
))
(declare-fun lt!137678 () SeekEntryResult!1700)

(assert (=> b!277040 (= res!141040 (or (= lt!137678 (MissingZero!1700 i!1267)) (= lt!137678 (MissingVacant!1700 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13788 (_ BitVec 32)) SeekEntryResult!1700)

(assert (=> b!277040 (= lt!137678 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!277036 () Bool)

(declare-fun res!141034 () Bool)

(assert (=> b!277036 (=> (not res!141034) (not e!176847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277036 (= res!141034 (validKeyInArray!0 k0!2581))))

(declare-fun res!141035 () Bool)

(assert (=> start!26702 (=> (not res!141035) (not e!176847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26702 (= res!141035 (validMask!0 mask!3868))))

(assert (=> start!26702 e!176847))

(declare-fun array_inv!4515 (array!13788) Bool)

(assert (=> start!26702 (array_inv!4515 a!3325)))

(assert (=> start!26702 true))

(assert (= (and start!26702 res!141035) b!277037))

(assert (= (and b!277037 res!141037) b!277036))

(assert (= (and b!277036 res!141034) b!277032))

(assert (= (and b!277032 res!141036) b!277038))

(assert (= (and b!277038 res!141038) b!277040))

(assert (= (and b!277040 res!141040) b!277034))

(assert (= (and b!277034 res!141039) b!277039))

(assert (= (and b!277039 res!141033) b!277031))

(assert (= (and b!277031 c!45550) b!277035))

(assert (= (and b!277031 (not c!45550)) b!277033))

(declare-fun m!291719 () Bool)

(assert (=> start!26702 m!291719))

(declare-fun m!291721 () Bool)

(assert (=> start!26702 m!291721))

(declare-fun m!291723 () Bool)

(assert (=> b!277034 m!291723))

(declare-fun m!291725 () Bool)

(assert (=> b!277035 m!291725))

(declare-fun m!291727 () Bool)

(assert (=> b!277035 m!291727))

(declare-fun m!291729 () Bool)

(assert (=> b!277035 m!291729))

(declare-fun m!291731 () Bool)

(assert (=> b!277032 m!291731))

(declare-fun m!291733 () Bool)

(assert (=> b!277040 m!291733))

(declare-fun m!291735 () Bool)

(assert (=> b!277036 m!291735))

(declare-fun m!291737 () Bool)

(assert (=> b!277038 m!291737))

(check-sat (not b!277038) (not b!277034) (not b!277035) (not start!26702) (not b!277036) (not b!277040) (not b!277032))
(check-sat)
