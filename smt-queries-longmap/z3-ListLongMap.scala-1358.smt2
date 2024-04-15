; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26708 () Bool)

(assert start!26708)

(declare-fun b!277121 () Bool)

(declare-datatypes ((Unit!8682 0))(
  ( (Unit!8683) )
))
(declare-fun e!176880 () Unit!8682)

(declare-fun Unit!8684 () Unit!8682)

(assert (=> b!277121 (= e!176880 Unit!8684)))

(declare-fun b!277123 () Bool)

(declare-fun res!141107 () Bool)

(declare-fun e!176883 () Bool)

(assert (=> b!277123 (=> (not res!141107) (not e!176883))))

(declare-datatypes ((array!13794 0))(
  ( (array!13795 (arr!6546 (Array (_ BitVec 32) (_ BitVec 64))) (size!6899 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13794)

(declare-datatypes ((List!4327 0))(
  ( (Nil!4324) (Cons!4323 (h!4990 (_ BitVec 64)) (t!9400 List!4327)) )
))
(declare-fun arrayNoDuplicates!0 (array!13794 (_ BitVec 32) List!4327) Bool)

(assert (=> b!277123 (= res!141107 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4324))))

(declare-fun b!277124 () Bool)

(declare-fun lt!137704 () Unit!8682)

(assert (=> b!277124 (= e!176880 lt!137704)))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13794 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8682)

(assert (=> b!277124 (= lt!137704 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13794 (_ BitVec 32)) Bool)

(assert (=> b!277124 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13795 (store (arr!6546 a!3325) i!1267 k0!2581) (size!6899 a!3325)) mask!3868)))

(declare-fun b!277125 () Bool)

(declare-fun e!176882 () Bool)

(assert (=> b!277125 (= e!176882 false)))

(declare-fun lt!137705 () Unit!8682)

(assert (=> b!277125 (= lt!137705 e!176880)))

(declare-fun c!45559 () Bool)

(assert (=> b!277125 (= c!45559 (bvslt startIndex!26 (bvsub (size!6899 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277126 () Bool)

(declare-fun res!141109 () Bool)

(assert (=> b!277126 (=> (not res!141109) (not e!176883))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277126 (= res!141109 (validKeyInArray!0 k0!2581))))

(declare-fun b!277127 () Bool)

(assert (=> b!277127 (= e!176883 e!176882)))

(declare-fun res!141110 () Bool)

(assert (=> b!277127 (=> (not res!141110) (not e!176882))))

(declare-datatypes ((SeekEntryResult!1703 0))(
  ( (MissingZero!1703 (index!8982 (_ BitVec 32))) (Found!1703 (index!8983 (_ BitVec 32))) (Intermediate!1703 (undefined!2515 Bool) (index!8984 (_ BitVec 32)) (x!27251 (_ BitVec 32))) (Undefined!1703) (MissingVacant!1703 (index!8985 (_ BitVec 32))) )
))
(declare-fun lt!137706 () SeekEntryResult!1703)

(assert (=> b!277127 (= res!141110 (or (= lt!137706 (MissingZero!1703 i!1267)) (= lt!137706 (MissingVacant!1703 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13794 (_ BitVec 32)) SeekEntryResult!1703)

(assert (=> b!277127 (= lt!137706 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!277128 () Bool)

(declare-fun res!141105 () Bool)

(assert (=> b!277128 (=> (not res!141105) (not e!176882))))

(assert (=> b!277128 (= res!141105 (= startIndex!26 i!1267))))

(declare-fun b!277122 () Bool)

(declare-fun res!141112 () Bool)

(assert (=> b!277122 (=> (not res!141112) (not e!176882))))

(assert (=> b!277122 (= res!141112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!141106 () Bool)

(assert (=> start!26708 (=> (not res!141106) (not e!176883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26708 (= res!141106 (validMask!0 mask!3868))))

(assert (=> start!26708 e!176883))

(declare-fun array_inv!4518 (array!13794) Bool)

(assert (=> start!26708 (array_inv!4518 a!3325)))

(assert (=> start!26708 true))

(declare-fun b!277129 () Bool)

(declare-fun res!141111 () Bool)

(assert (=> b!277129 (=> (not res!141111) (not e!176883))))

(assert (=> b!277129 (= res!141111 (and (= (size!6899 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6899 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6899 a!3325))))))

(declare-fun b!277130 () Bool)

(declare-fun res!141108 () Bool)

(assert (=> b!277130 (=> (not res!141108) (not e!176883))))

(declare-fun arrayContainsKey!0 (array!13794 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277130 (= res!141108 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26708 res!141106) b!277129))

(assert (= (and b!277129 res!141111) b!277126))

(assert (= (and b!277126 res!141109) b!277123))

(assert (= (and b!277123 res!141107) b!277130))

(assert (= (and b!277130 res!141108) b!277127))

(assert (= (and b!277127 res!141110) b!277122))

(assert (= (and b!277122 res!141112) b!277128))

(assert (= (and b!277128 res!141105) b!277125))

(assert (= (and b!277125 c!45559) b!277124))

(assert (= (and b!277125 (not c!45559)) b!277121))

(declare-fun m!291779 () Bool)

(assert (=> b!277126 m!291779))

(declare-fun m!291781 () Bool)

(assert (=> b!277124 m!291781))

(declare-fun m!291783 () Bool)

(assert (=> b!277124 m!291783))

(declare-fun m!291785 () Bool)

(assert (=> b!277124 m!291785))

(declare-fun m!291787 () Bool)

(assert (=> b!277130 m!291787))

(declare-fun m!291789 () Bool)

(assert (=> b!277127 m!291789))

(declare-fun m!291791 () Bool)

(assert (=> b!277123 m!291791))

(declare-fun m!291793 () Bool)

(assert (=> b!277122 m!291793))

(declare-fun m!291795 () Bool)

(assert (=> start!26708 m!291795))

(declare-fun m!291797 () Bool)

(assert (=> start!26708 m!291797))

(check-sat (not b!277122) (not b!277123) (not b!277126) (not b!277124) (not b!277130) (not b!277127) (not start!26708))
(check-sat)
