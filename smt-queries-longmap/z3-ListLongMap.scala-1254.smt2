; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26082 () Bool)

(assert start!26082)

(declare-fun b!269054 () Bool)

(declare-fun res!133310 () Bool)

(declare-fun e!173691 () Bool)

(assert (=> b!269054 (=> (not res!133310) (not e!173691))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269054 (= res!133310 (validKeyInArray!0 k0!2581))))

(declare-fun b!269056 () Bool)

(declare-fun e!173693 () Bool)

(assert (=> b!269056 (= e!173693 false)))

(declare-fun lt!135125 () Bool)

(declare-datatypes ((array!13178 0))(
  ( (array!13179 (arr!6238 (Array (_ BitVec 32) (_ BitVec 64))) (size!6590 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13178)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13178 (_ BitVec 32)) Bool)

(assert (=> b!269056 (= lt!135125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269057 () Bool)

(assert (=> b!269057 (= e!173691 e!173693)))

(declare-fun res!133307 () Bool)

(assert (=> b!269057 (=> (not res!133307) (not e!173693))))

(declare-datatypes ((SeekEntryResult!1361 0))(
  ( (MissingZero!1361 (index!7614 (_ BitVec 32))) (Found!1361 (index!7615 (_ BitVec 32))) (Intermediate!1361 (undefined!2173 Bool) (index!7616 (_ BitVec 32)) (x!26078 (_ BitVec 32))) (Undefined!1361) (MissingVacant!1361 (index!7617 (_ BitVec 32))) )
))
(declare-fun lt!135126 () SeekEntryResult!1361)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269057 (= res!133307 (or (= lt!135126 (MissingZero!1361 i!1267)) (= lt!135126 (MissingVacant!1361 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13178 (_ BitVec 32)) SeekEntryResult!1361)

(assert (=> b!269057 (= lt!135126 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!269055 () Bool)

(declare-fun res!133308 () Bool)

(assert (=> b!269055 (=> (not res!133308) (not e!173691))))

(declare-datatypes ((List!3959 0))(
  ( (Nil!3956) (Cons!3955 (h!4622 (_ BitVec 64)) (t!9033 List!3959)) )
))
(declare-fun arrayNoDuplicates!0 (array!13178 (_ BitVec 32) List!3959) Bool)

(assert (=> b!269055 (= res!133308 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3956))))

(declare-fun res!133306 () Bool)

(assert (=> start!26082 (=> (not res!133306) (not e!173691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26082 (= res!133306 (validMask!0 mask!3868))))

(assert (=> start!26082 e!173691))

(declare-fun array_inv!4188 (array!13178) Bool)

(assert (=> start!26082 (array_inv!4188 a!3325)))

(assert (=> start!26082 true))

(declare-fun b!269058 () Bool)

(declare-fun res!133309 () Bool)

(assert (=> b!269058 (=> (not res!133309) (not e!173691))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!269058 (= res!133309 (and (= (size!6590 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6590 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6590 a!3325))))))

(declare-fun b!269059 () Bool)

(declare-fun res!133311 () Bool)

(assert (=> b!269059 (=> (not res!133311) (not e!173691))))

(declare-fun arrayContainsKey!0 (array!13178 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269059 (= res!133311 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26082 res!133306) b!269058))

(assert (= (and b!269058 res!133309) b!269054))

(assert (= (and b!269054 res!133310) b!269055))

(assert (= (and b!269055 res!133308) b!269059))

(assert (= (and b!269059 res!133311) b!269057))

(assert (= (and b!269057 res!133307) b!269056))

(declare-fun m!285215 () Bool)

(assert (=> b!269054 m!285215))

(declare-fun m!285217 () Bool)

(assert (=> b!269059 m!285217))

(declare-fun m!285219 () Bool)

(assert (=> b!269056 m!285219))

(declare-fun m!285221 () Bool)

(assert (=> b!269055 m!285221))

(declare-fun m!285223 () Bool)

(assert (=> b!269057 m!285223))

(declare-fun m!285225 () Bool)

(assert (=> start!26082 m!285225))

(declare-fun m!285227 () Bool)

(assert (=> start!26082 m!285227))

(check-sat (not b!269054) (not b!269059) (not b!269055) (not b!269056) (not b!269057) (not start!26082))
(check-sat)
