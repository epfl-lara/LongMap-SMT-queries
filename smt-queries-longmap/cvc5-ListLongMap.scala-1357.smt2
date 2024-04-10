; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26700 () Bool)

(assert start!26700)

(declare-fun b!277178 () Bool)

(declare-fun res!141135 () Bool)

(declare-fun e!176947 () Bool)

(assert (=> b!277178 (=> (not res!141135) (not e!176947))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277178 (= res!141135 (validKeyInArray!0 k!2581))))

(declare-fun b!277179 () Bool)

(declare-fun res!141131 () Bool)

(assert (=> b!277179 (=> (not res!141131) (not e!176947))))

(declare-datatypes ((array!13797 0))(
  ( (array!13798 (arr!6548 (Array (_ BitVec 32) (_ BitVec 64))) (size!6900 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13797)

(declare-datatypes ((List!4356 0))(
  ( (Nil!4353) (Cons!4352 (h!5019 (_ BitVec 64)) (t!9438 List!4356)) )
))
(declare-fun arrayNoDuplicates!0 (array!13797 (_ BitVec 32) List!4356) Bool)

(assert (=> b!277179 (= res!141131 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4353))))

(declare-fun b!277180 () Bool)

(declare-fun res!141133 () Bool)

(assert (=> b!277180 (=> (not res!141133) (not e!176947))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!277180 (= res!141133 (and (= (size!6900 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6900 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6900 a!3325))))))

(declare-fun b!277181 () Bool)

(declare-fun e!176945 () Bool)

(assert (=> b!277181 (= e!176947 e!176945)))

(declare-fun res!141134 () Bool)

(assert (=> b!277181 (=> (not res!141134) (not e!176945))))

(declare-datatypes ((SeekEntryResult!1706 0))(
  ( (MissingZero!1706 (index!8994 (_ BitVec 32))) (Found!1706 (index!8995 (_ BitVec 32))) (Intermediate!1706 (undefined!2518 Bool) (index!8996 (_ BitVec 32)) (x!27247 (_ BitVec 32))) (Undefined!1706) (MissingVacant!1706 (index!8997 (_ BitVec 32))) )
))
(declare-fun lt!137859 () SeekEntryResult!1706)

(assert (=> b!277181 (= res!141134 (or (= lt!137859 (MissingZero!1706 i!1267)) (= lt!137859 (MissingVacant!1706 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13797 (_ BitVec 32)) SeekEntryResult!1706)

(assert (=> b!277181 (= lt!137859 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!277182 () Bool)

(declare-datatypes ((Unit!8719 0))(
  ( (Unit!8720) )
))
(declare-fun e!176946 () Unit!8719)

(declare-fun Unit!8721 () Unit!8719)

(assert (=> b!277182 (= e!176946 Unit!8721)))

(declare-fun b!277183 () Bool)

(declare-fun res!141128 () Bool)

(assert (=> b!277183 (=> (not res!141128) (not e!176945))))

(assert (=> b!277183 (= res!141128 (= startIndex!26 i!1267))))

(declare-fun b!277184 () Bool)

(assert (=> b!277184 (= e!176945 false)))

(declare-fun lt!137858 () Unit!8719)

(assert (=> b!277184 (= lt!137858 e!176946)))

(declare-fun c!45576 () Bool)

(assert (=> b!277184 (= c!45576 (bvslt startIndex!26 (bvsub (size!6900 a!3325) #b00000000000000000000000000000001)))))

(declare-fun res!141129 () Bool)

(assert (=> start!26700 (=> (not res!141129) (not e!176947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26700 (= res!141129 (validMask!0 mask!3868))))

(assert (=> start!26700 e!176947))

(declare-fun array_inv!4511 (array!13797) Bool)

(assert (=> start!26700 (array_inv!4511 a!3325)))

(assert (=> start!26700 true))

(declare-fun b!277185 () Bool)

(declare-fun lt!137860 () Unit!8719)

(assert (=> b!277185 (= e!176946 lt!137860)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13797 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8719)

(assert (=> b!277185 (= lt!137860 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13797 (_ BitVec 32)) Bool)

(assert (=> b!277185 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13798 (store (arr!6548 a!3325) i!1267 k!2581) (size!6900 a!3325)) mask!3868)))

(declare-fun b!277186 () Bool)

(declare-fun res!141132 () Bool)

(assert (=> b!277186 (=> (not res!141132) (not e!176947))))

(declare-fun arrayContainsKey!0 (array!13797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277186 (= res!141132 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277187 () Bool)

(declare-fun res!141130 () Bool)

(assert (=> b!277187 (=> (not res!141130) (not e!176945))))

(assert (=> b!277187 (= res!141130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26700 res!141129) b!277180))

(assert (= (and b!277180 res!141133) b!277178))

(assert (= (and b!277178 res!141135) b!277179))

(assert (= (and b!277179 res!141131) b!277186))

(assert (= (and b!277186 res!141132) b!277181))

(assert (= (and b!277181 res!141134) b!277187))

(assert (= (and b!277187 res!141130) b!277183))

(assert (= (and b!277183 res!141128) b!277184))

(assert (= (and b!277184 c!45576) b!277185))

(assert (= (and b!277184 (not c!45576)) b!277182))

(declare-fun m!292311 () Bool)

(assert (=> b!277178 m!292311))

(declare-fun m!292313 () Bool)

(assert (=> b!277186 m!292313))

(declare-fun m!292315 () Bool)

(assert (=> b!277179 m!292315))

(declare-fun m!292317 () Bool)

(assert (=> b!277185 m!292317))

(declare-fun m!292319 () Bool)

(assert (=> b!277185 m!292319))

(declare-fun m!292321 () Bool)

(assert (=> b!277185 m!292321))

(declare-fun m!292323 () Bool)

(assert (=> b!277181 m!292323))

(declare-fun m!292325 () Bool)

(assert (=> b!277187 m!292325))

(declare-fun m!292327 () Bool)

(assert (=> start!26700 m!292327))

(declare-fun m!292329 () Bool)

(assert (=> start!26700 m!292329))

(push 1)

(assert (not b!277179))

(assert (not b!277185))

(assert (not start!26700))

(assert (not b!277187))

(assert (not b!277181))

(assert (not b!277178))

(assert (not b!277186))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

