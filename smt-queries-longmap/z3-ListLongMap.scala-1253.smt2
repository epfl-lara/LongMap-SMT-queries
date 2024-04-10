; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26078 () Bool)

(assert start!26078)

(declare-fun res!133251 () Bool)

(declare-fun e!173651 () Bool)

(assert (=> start!26078 (=> (not res!133251) (not e!173651))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26078 (= res!133251 (validMask!0 mask!3868))))

(assert (=> start!26078 e!173651))

(declare-datatypes ((array!13175 0))(
  ( (array!13176 (arr!6237 (Array (_ BitVec 32) (_ BitVec 64))) (size!6589 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13175)

(declare-fun array_inv!4200 (array!13175) Bool)

(assert (=> start!26078 (array_inv!4200 a!3325)))

(assert (=> start!26078 true))

(declare-fun b!268971 () Bool)

(declare-fun res!133249 () Bool)

(assert (=> b!268971 (=> (not res!133249) (not e!173651))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268971 (= res!133249 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268972 () Bool)

(declare-fun res!133252 () Bool)

(assert (=> b!268972 (=> (not res!133252) (not e!173651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268972 (= res!133252 (validKeyInArray!0 k0!2581))))

(declare-fun b!268973 () Bool)

(declare-fun res!133250 () Bool)

(assert (=> b!268973 (=> (not res!133250) (not e!173651))))

(declare-datatypes ((List!4045 0))(
  ( (Nil!4042) (Cons!4041 (h!4708 (_ BitVec 64)) (t!9127 List!4045)) )
))
(declare-fun arrayNoDuplicates!0 (array!13175 (_ BitVec 32) List!4045) Bool)

(assert (=> b!268973 (= res!133250 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4042))))

(declare-fun b!268974 () Bool)

(declare-fun e!173649 () Bool)

(assert (=> b!268974 (= e!173649 false)))

(declare-fun lt!135055 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13175 (_ BitVec 32)) Bool)

(assert (=> b!268974 (= lt!135055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268975 () Bool)

(assert (=> b!268975 (= e!173651 e!173649)))

(declare-fun res!133254 () Bool)

(assert (=> b!268975 (=> (not res!133254) (not e!173649))))

(declare-datatypes ((SeekEntryResult!1395 0))(
  ( (MissingZero!1395 (index!7750 (_ BitVec 32))) (Found!1395 (index!7751 (_ BitVec 32))) (Intermediate!1395 (undefined!2207 Bool) (index!7752 (_ BitVec 32)) (x!26104 (_ BitVec 32))) (Undefined!1395) (MissingVacant!1395 (index!7753 (_ BitVec 32))) )
))
(declare-fun lt!135054 () SeekEntryResult!1395)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268975 (= res!133254 (or (= lt!135054 (MissingZero!1395 i!1267)) (= lt!135054 (MissingVacant!1395 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13175 (_ BitVec 32)) SeekEntryResult!1395)

(assert (=> b!268975 (= lt!135054 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268976 () Bool)

(declare-fun res!133253 () Bool)

(assert (=> b!268976 (=> (not res!133253) (not e!173651))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268976 (= res!133253 (and (= (size!6589 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6589 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6589 a!3325))))))

(assert (= (and start!26078 res!133251) b!268976))

(assert (= (and b!268976 res!133253) b!268972))

(assert (= (and b!268972 res!133252) b!268973))

(assert (= (and b!268973 res!133250) b!268971))

(assert (= (and b!268971 res!133249) b!268975))

(assert (= (and b!268975 res!133254) b!268974))

(declare-fun m!284981 () Bool)

(assert (=> b!268975 m!284981))

(declare-fun m!284983 () Bool)

(assert (=> b!268974 m!284983))

(declare-fun m!284985 () Bool)

(assert (=> b!268971 m!284985))

(declare-fun m!284987 () Bool)

(assert (=> b!268973 m!284987))

(declare-fun m!284989 () Bool)

(assert (=> b!268972 m!284989))

(declare-fun m!284991 () Bool)

(assert (=> start!26078 m!284991))

(declare-fun m!284993 () Bool)

(assert (=> start!26078 m!284993))

(check-sat (not b!268973) (not start!26078) (not b!268972) (not b!268975) (not b!268971) (not b!268974))
(check-sat)
