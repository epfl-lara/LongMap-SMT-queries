; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26690 () Bool)

(assert start!26690)

(declare-fun b!277028 () Bool)

(declare-datatypes ((Unit!8704 0))(
  ( (Unit!8705) )
))
(declare-fun e!176888 () Unit!8704)

(declare-fun lt!137815 () Unit!8704)

(assert (=> b!277028 (= e!176888 lt!137815)))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((array!13787 0))(
  ( (array!13788 (arr!6543 (Array (_ BitVec 32) (_ BitVec 64))) (size!6895 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13787)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13787 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8704)

(assert (=> b!277028 (= lt!137815 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13787 (_ BitVec 32)) Bool)

(assert (=> b!277028 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13788 (store (arr!6543 a!3325) i!1267 k0!2581) (size!6895 a!3325)) mask!3868)))

(declare-fun b!277029 () Bool)

(declare-fun res!141012 () Bool)

(declare-fun e!176885 () Bool)

(assert (=> b!277029 (=> (not res!141012) (not e!176885))))

(assert (=> b!277029 (= res!141012 (and (= (size!6895 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6895 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6895 a!3325))))))

(declare-fun b!277030 () Bool)

(declare-fun res!141010 () Bool)

(assert (=> b!277030 (=> (not res!141010) (not e!176885))))

(declare-datatypes ((List!4351 0))(
  ( (Nil!4348) (Cons!4347 (h!5014 (_ BitVec 64)) (t!9433 List!4351)) )
))
(declare-fun arrayNoDuplicates!0 (array!13787 (_ BitVec 32) List!4351) Bool)

(assert (=> b!277030 (= res!141010 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4348))))

(declare-fun res!141008 () Bool)

(assert (=> start!26690 (=> (not res!141008) (not e!176885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26690 (= res!141008 (validMask!0 mask!3868))))

(assert (=> start!26690 e!176885))

(declare-fun array_inv!4506 (array!13787) Bool)

(assert (=> start!26690 (array_inv!4506 a!3325)))

(assert (=> start!26690 true))

(declare-fun b!277031 () Bool)

(declare-fun res!141014 () Bool)

(declare-fun e!176887 () Bool)

(assert (=> b!277031 (=> (not res!141014) (not e!176887))))

(assert (=> b!277031 (= res!141014 (= startIndex!26 i!1267))))

(declare-fun b!277032 () Bool)

(declare-fun res!141011 () Bool)

(assert (=> b!277032 (=> (not res!141011) (not e!176885))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277032 (= res!141011 (validKeyInArray!0 k0!2581))))

(declare-fun b!277033 () Bool)

(declare-fun res!141015 () Bool)

(assert (=> b!277033 (=> (not res!141015) (not e!176887))))

(assert (=> b!277033 (= res!141015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277034 () Bool)

(assert (=> b!277034 (= e!176887 false)))

(declare-fun lt!137814 () Unit!8704)

(assert (=> b!277034 (= lt!137814 e!176888)))

(declare-fun c!45561 () Bool)

(assert (=> b!277034 (= c!45561 (bvslt startIndex!26 (bvsub (size!6895 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277035 () Bool)

(declare-fun Unit!8706 () Unit!8704)

(assert (=> b!277035 (= e!176888 Unit!8706)))

(declare-fun b!277036 () Bool)

(declare-fun res!141009 () Bool)

(assert (=> b!277036 (=> (not res!141009) (not e!176885))))

(declare-fun arrayContainsKey!0 (array!13787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277036 (= res!141009 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277037 () Bool)

(assert (=> b!277037 (= e!176885 e!176887)))

(declare-fun res!141013 () Bool)

(assert (=> b!277037 (=> (not res!141013) (not e!176887))))

(declare-datatypes ((SeekEntryResult!1701 0))(
  ( (MissingZero!1701 (index!8974 (_ BitVec 32))) (Found!1701 (index!8975 (_ BitVec 32))) (Intermediate!1701 (undefined!2513 Bool) (index!8976 (_ BitVec 32)) (x!27226 (_ BitVec 32))) (Undefined!1701) (MissingVacant!1701 (index!8977 (_ BitVec 32))) )
))
(declare-fun lt!137813 () SeekEntryResult!1701)

(assert (=> b!277037 (= res!141013 (or (= lt!137813 (MissingZero!1701 i!1267)) (= lt!137813 (MissingVacant!1701 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13787 (_ BitVec 32)) SeekEntryResult!1701)

(assert (=> b!277037 (= lt!137813 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26690 res!141008) b!277029))

(assert (= (and b!277029 res!141012) b!277032))

(assert (= (and b!277032 res!141011) b!277030))

(assert (= (and b!277030 res!141010) b!277036))

(assert (= (and b!277036 res!141009) b!277037))

(assert (= (and b!277037 res!141013) b!277033))

(assert (= (and b!277033 res!141015) b!277031))

(assert (= (and b!277031 res!141014) b!277034))

(assert (= (and b!277034 c!45561) b!277028))

(assert (= (and b!277034 (not c!45561)) b!277035))

(declare-fun m!292211 () Bool)

(assert (=> start!26690 m!292211))

(declare-fun m!292213 () Bool)

(assert (=> start!26690 m!292213))

(declare-fun m!292215 () Bool)

(assert (=> b!277032 m!292215))

(declare-fun m!292217 () Bool)

(assert (=> b!277037 m!292217))

(declare-fun m!292219 () Bool)

(assert (=> b!277036 m!292219))

(declare-fun m!292221 () Bool)

(assert (=> b!277028 m!292221))

(declare-fun m!292223 () Bool)

(assert (=> b!277028 m!292223))

(declare-fun m!292225 () Bool)

(assert (=> b!277028 m!292225))

(declare-fun m!292227 () Bool)

(assert (=> b!277033 m!292227))

(declare-fun m!292229 () Bool)

(assert (=> b!277030 m!292229))

(check-sat (not start!26690) (not b!277028) (not b!277033) (not b!277030) (not b!277037) (not b!277032) (not b!277036))
(check-sat)
