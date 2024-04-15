; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26714 () Bool)

(assert start!26714)

(declare-fun b!277211 () Bool)

(declare-fun e!176919 () Bool)

(declare-fun e!176916 () Bool)

(assert (=> b!277211 (= e!176919 e!176916)))

(declare-fun res!141183 () Bool)

(assert (=> b!277211 (=> (not res!141183) (not e!176916))))

(declare-datatypes ((SeekEntryResult!1706 0))(
  ( (MissingZero!1706 (index!8994 (_ BitVec 32))) (Found!1706 (index!8995 (_ BitVec 32))) (Intermediate!1706 (undefined!2518 Bool) (index!8996 (_ BitVec 32)) (x!27262 (_ BitVec 32))) (Undefined!1706) (MissingVacant!1706 (index!8997 (_ BitVec 32))) )
))
(declare-fun lt!137732 () SeekEntryResult!1706)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!277211 (= res!141183 (or (= lt!137732 (MissingZero!1706 i!1267)) (= lt!137732 (MissingVacant!1706 i!1267))))))

(declare-datatypes ((array!13800 0))(
  ( (array!13801 (arr!6549 (Array (_ BitVec 32) (_ BitVec 64))) (size!6902 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13800)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13800 (_ BitVec 32)) SeekEntryResult!1706)

(assert (=> b!277211 (= lt!137732 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!277212 () Bool)

(assert (=> b!277212 (= e!176916 false)))

(declare-datatypes ((Unit!8691 0))(
  ( (Unit!8692) )
))
(declare-fun lt!137733 () Unit!8691)

(declare-fun e!176918 () Unit!8691)

(assert (=> b!277212 (= lt!137733 e!176918)))

(declare-fun c!45568 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!277212 (= c!45568 (bvslt startIndex!26 (bvsub (size!6902 a!3325) #b00000000000000000000000000000001)))))

(declare-fun res!141177 () Bool)

(assert (=> start!26714 (=> (not res!141177) (not e!176919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26714 (= res!141177 (validMask!0 mask!3868))))

(assert (=> start!26714 e!176919))

(declare-fun array_inv!4521 (array!13800) Bool)

(assert (=> start!26714 (array_inv!4521 a!3325)))

(assert (=> start!26714 true))

(declare-fun b!277213 () Bool)

(declare-fun Unit!8693 () Unit!8691)

(assert (=> b!277213 (= e!176918 Unit!8693)))

(declare-fun b!277214 () Bool)

(declare-fun res!141180 () Bool)

(assert (=> b!277214 (=> (not res!141180) (not e!176919))))

(assert (=> b!277214 (= res!141180 (and (= (size!6902 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6902 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6902 a!3325))))))

(declare-fun b!277215 () Bool)

(declare-fun res!141184 () Bool)

(assert (=> b!277215 (=> (not res!141184) (not e!176919))))

(declare-datatypes ((List!4330 0))(
  ( (Nil!4327) (Cons!4326 (h!4993 (_ BitVec 64)) (t!9403 List!4330)) )
))
(declare-fun arrayNoDuplicates!0 (array!13800 (_ BitVec 32) List!4330) Bool)

(assert (=> b!277215 (= res!141184 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4327))))

(declare-fun b!277216 () Bool)

(declare-fun res!141182 () Bool)

(assert (=> b!277216 (=> (not res!141182) (not e!176916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13800 (_ BitVec 32)) Bool)

(assert (=> b!277216 (= res!141182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277217 () Bool)

(declare-fun res!141179 () Bool)

(assert (=> b!277217 (=> (not res!141179) (not e!176919))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277217 (= res!141179 (validKeyInArray!0 k0!2581))))

(declare-fun b!277218 () Bool)

(declare-fun res!141178 () Bool)

(assert (=> b!277218 (=> (not res!141178) (not e!176916))))

(assert (=> b!277218 (= res!141178 (= startIndex!26 i!1267))))

(declare-fun b!277219 () Bool)

(declare-fun lt!137731 () Unit!8691)

(assert (=> b!277219 (= e!176918 lt!137731)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13800 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8691)

(assert (=> b!277219 (= lt!137731 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!277219 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13801 (store (arr!6549 a!3325) i!1267 k0!2581) (size!6902 a!3325)) mask!3868)))

(declare-fun b!277220 () Bool)

(declare-fun res!141181 () Bool)

(assert (=> b!277220 (=> (not res!141181) (not e!176919))))

(declare-fun arrayContainsKey!0 (array!13800 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277220 (= res!141181 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26714 res!141177) b!277214))

(assert (= (and b!277214 res!141180) b!277217))

(assert (= (and b!277217 res!141179) b!277215))

(assert (= (and b!277215 res!141184) b!277220))

(assert (= (and b!277220 res!141181) b!277211))

(assert (= (and b!277211 res!141183) b!277216))

(assert (= (and b!277216 res!141182) b!277218))

(assert (= (and b!277218 res!141178) b!277212))

(assert (= (and b!277212 c!45568) b!277219))

(assert (= (and b!277212 (not c!45568)) b!277213))

(declare-fun m!291839 () Bool)

(assert (=> b!277219 m!291839))

(declare-fun m!291841 () Bool)

(assert (=> b!277219 m!291841))

(declare-fun m!291843 () Bool)

(assert (=> b!277219 m!291843))

(declare-fun m!291845 () Bool)

(assert (=> b!277211 m!291845))

(declare-fun m!291847 () Bool)

(assert (=> start!26714 m!291847))

(declare-fun m!291849 () Bool)

(assert (=> start!26714 m!291849))

(declare-fun m!291851 () Bool)

(assert (=> b!277220 m!291851))

(declare-fun m!291853 () Bool)

(assert (=> b!277217 m!291853))

(declare-fun m!291855 () Bool)

(assert (=> b!277215 m!291855))

(declare-fun m!291857 () Bool)

(assert (=> b!277216 m!291857))

(check-sat (not b!277217) (not b!277215) (not start!26714) (not b!277220) (not b!277216) (not b!277219) (not b!277211))
(check-sat)
