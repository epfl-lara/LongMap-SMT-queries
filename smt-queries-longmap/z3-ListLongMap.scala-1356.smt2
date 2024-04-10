; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26696 () Bool)

(assert start!26696)

(declare-fun b!277118 () Bool)

(declare-fun res!141083 () Bool)

(declare-fun e!176923 () Bool)

(assert (=> b!277118 (=> (not res!141083) (not e!176923))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!277118 (= res!141083 (= startIndex!26 i!1267))))

(declare-fun b!277119 () Bool)

(assert (=> b!277119 (= e!176923 false)))

(declare-datatypes ((Unit!8713 0))(
  ( (Unit!8714) )
))
(declare-fun lt!137842 () Unit!8713)

(declare-fun e!176924 () Unit!8713)

(assert (=> b!277119 (= lt!137842 e!176924)))

(declare-fun c!45570 () Bool)

(declare-datatypes ((array!13793 0))(
  ( (array!13794 (arr!6546 (Array (_ BitVec 32) (_ BitVec 64))) (size!6898 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13793)

(assert (=> b!277119 (= c!45570 (bvslt startIndex!26 (bvsub (size!6898 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277120 () Bool)

(declare-fun res!141086 () Bool)

(declare-fun e!176921 () Bool)

(assert (=> b!277120 (=> (not res!141086) (not e!176921))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277120 (= res!141086 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277121 () Bool)

(assert (=> b!277121 (= e!176921 e!176923)))

(declare-fun res!141084 () Bool)

(assert (=> b!277121 (=> (not res!141084) (not e!176923))))

(declare-datatypes ((SeekEntryResult!1704 0))(
  ( (MissingZero!1704 (index!8986 (_ BitVec 32))) (Found!1704 (index!8987 (_ BitVec 32))) (Intermediate!1704 (undefined!2516 Bool) (index!8988 (_ BitVec 32)) (x!27237 (_ BitVec 32))) (Undefined!1704) (MissingVacant!1704 (index!8989 (_ BitVec 32))) )
))
(declare-fun lt!137840 () SeekEntryResult!1704)

(assert (=> b!277121 (= res!141084 (or (= lt!137840 (MissingZero!1704 i!1267)) (= lt!137840 (MissingVacant!1704 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13793 (_ BitVec 32)) SeekEntryResult!1704)

(assert (=> b!277121 (= lt!137840 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!277122 () Bool)

(declare-fun lt!137841 () Unit!8713)

(assert (=> b!277122 (= e!176924 lt!137841)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13793 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8713)

(assert (=> b!277122 (= lt!137841 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13793 (_ BitVec 32)) Bool)

(assert (=> b!277122 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13794 (store (arr!6546 a!3325) i!1267 k0!2581) (size!6898 a!3325)) mask!3868)))

(declare-fun b!277123 () Bool)

(declare-fun res!141087 () Bool)

(assert (=> b!277123 (=> (not res!141087) (not e!176921))))

(declare-datatypes ((List!4354 0))(
  ( (Nil!4351) (Cons!4350 (h!5017 (_ BitVec 64)) (t!9436 List!4354)) )
))
(declare-fun arrayNoDuplicates!0 (array!13793 (_ BitVec 32) List!4354) Bool)

(assert (=> b!277123 (= res!141087 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4351))))

(declare-fun b!277124 () Bool)

(declare-fun res!141082 () Bool)

(assert (=> b!277124 (=> (not res!141082) (not e!176921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277124 (= res!141082 (validKeyInArray!0 k0!2581))))

(declare-fun b!277125 () Bool)

(declare-fun Unit!8715 () Unit!8713)

(assert (=> b!277125 (= e!176924 Unit!8715)))

(declare-fun b!277126 () Bool)

(declare-fun res!141080 () Bool)

(assert (=> b!277126 (=> (not res!141080) (not e!176923))))

(assert (=> b!277126 (= res!141080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277127 () Bool)

(declare-fun res!141081 () Bool)

(assert (=> b!277127 (=> (not res!141081) (not e!176921))))

(assert (=> b!277127 (= res!141081 (and (= (size!6898 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6898 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6898 a!3325))))))

(declare-fun res!141085 () Bool)

(assert (=> start!26696 (=> (not res!141085) (not e!176921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26696 (= res!141085 (validMask!0 mask!3868))))

(assert (=> start!26696 e!176921))

(declare-fun array_inv!4509 (array!13793) Bool)

(assert (=> start!26696 (array_inv!4509 a!3325)))

(assert (=> start!26696 true))

(assert (= (and start!26696 res!141085) b!277127))

(assert (= (and b!277127 res!141081) b!277124))

(assert (= (and b!277124 res!141082) b!277123))

(assert (= (and b!277123 res!141087) b!277120))

(assert (= (and b!277120 res!141086) b!277121))

(assert (= (and b!277121 res!141084) b!277126))

(assert (= (and b!277126 res!141080) b!277118))

(assert (= (and b!277118 res!141083) b!277119))

(assert (= (and b!277119 c!45570) b!277122))

(assert (= (and b!277119 (not c!45570)) b!277125))

(declare-fun m!292271 () Bool)

(assert (=> b!277121 m!292271))

(declare-fun m!292273 () Bool)

(assert (=> b!277124 m!292273))

(declare-fun m!292275 () Bool)

(assert (=> start!26696 m!292275))

(declare-fun m!292277 () Bool)

(assert (=> start!26696 m!292277))

(declare-fun m!292279 () Bool)

(assert (=> b!277126 m!292279))

(declare-fun m!292281 () Bool)

(assert (=> b!277123 m!292281))

(declare-fun m!292283 () Bool)

(assert (=> b!277122 m!292283))

(declare-fun m!292285 () Bool)

(assert (=> b!277122 m!292285))

(declare-fun m!292287 () Bool)

(assert (=> b!277122 m!292287))

(declare-fun m!292289 () Bool)

(assert (=> b!277120 m!292289))

(check-sat (not b!277121) (not b!277123) (not b!277126) (not start!26696) (not b!277124) (not b!277122) (not b!277120))
(check-sat)
