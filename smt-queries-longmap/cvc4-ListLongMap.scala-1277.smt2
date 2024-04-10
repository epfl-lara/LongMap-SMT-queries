; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26224 () Bool)

(assert start!26224)

(declare-fun b!271296 () Bool)

(declare-fun res!135295 () Bool)

(declare-fun e!174524 () Bool)

(assert (=> b!271296 (=> (not res!135295) (not e!174524))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271296 (= res!135295 (not (= startIndex!26 i!1267)))))

(declare-fun b!271297 () Bool)

(declare-fun res!135288 () Bool)

(assert (=> b!271297 (=> (not res!135288) (not e!174524))))

(declare-datatypes ((array!13321 0))(
  ( (array!13322 (arr!6310 (Array (_ BitVec 32) (_ BitVec 64))) (size!6662 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13321)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271297 (= res!135288 (validKeyInArray!0 (select (arr!6310 a!3325) startIndex!26)))))

(declare-fun b!271298 () Bool)

(declare-fun res!135297 () Bool)

(declare-fun e!174522 () Bool)

(assert (=> b!271298 (=> (not res!135297) (not e!174522))))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!271298 (= res!135297 (and (= (size!6662 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6662 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6662 a!3325))))))

(declare-fun b!271299 () Bool)

(declare-fun res!135289 () Bool)

(assert (=> b!271299 (=> (not res!135289) (not e!174524))))

(declare-datatypes ((List!4118 0))(
  ( (Nil!4115) (Cons!4114 (h!4781 (_ BitVec 64)) (t!9200 List!4118)) )
))
(declare-fun noDuplicate!136 (List!4118) Bool)

(assert (=> b!271299 (= res!135289 (noDuplicate!136 Nil!4115))))

(declare-fun b!271300 () Bool)

(declare-fun res!135286 () Bool)

(assert (=> b!271300 (=> (not res!135286) (not e!174524))))

(declare-fun contains!1948 (List!4118 (_ BitVec 64)) Bool)

(assert (=> b!271300 (= res!135286 (not (contains!1948 Nil!4115 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271301 () Bool)

(assert (=> b!271301 (= e!174522 e!174524)))

(declare-fun res!135291 () Bool)

(assert (=> b!271301 (=> (not res!135291) (not e!174524))))

(declare-datatypes ((SeekEntryResult!1468 0))(
  ( (MissingZero!1468 (index!8042 (_ BitVec 32))) (Found!1468 (index!8043 (_ BitVec 32))) (Intermediate!1468 (undefined!2280 Bool) (index!8044 (_ BitVec 32)) (x!26369 (_ BitVec 32))) (Undefined!1468) (MissingVacant!1468 (index!8045 (_ BitVec 32))) )
))
(declare-fun lt!135781 () SeekEntryResult!1468)

(assert (=> b!271301 (= res!135291 (or (= lt!135781 (MissingZero!1468 i!1267)) (= lt!135781 (MissingVacant!1468 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13321 (_ BitVec 32)) SeekEntryResult!1468)

(assert (=> b!271301 (= lt!135781 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!271302 () Bool)

(declare-fun res!135293 () Bool)

(assert (=> b!271302 (=> (not res!135293) (not e!174522))))

(assert (=> b!271302 (= res!135293 (validKeyInArray!0 k!2581))))

(declare-fun b!271303 () Bool)

(declare-fun res!135287 () Bool)

(assert (=> b!271303 (=> (not res!135287) (not e!174524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13321 (_ BitVec 32)) Bool)

(assert (=> b!271303 (= res!135287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271304 () Bool)

(declare-fun res!135285 () Bool)

(assert (=> b!271304 (=> (not res!135285) (not e!174522))))

(declare-fun arrayContainsKey!0 (array!13321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271304 (= res!135285 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271305 () Bool)

(declare-fun res!135294 () Bool)

(assert (=> b!271305 (=> (not res!135294) (not e!174524))))

(assert (=> b!271305 (= res!135294 (and (bvslt (size!6662 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6662 a!3325))))))

(declare-fun b!271295 () Bool)

(assert (=> b!271295 (= e!174524 false)))

(declare-fun lt!135780 () Bool)

(assert (=> b!271295 (= lt!135780 (contains!1948 Nil!4115 k!2581))))

(declare-fun res!135290 () Bool)

(assert (=> start!26224 (=> (not res!135290) (not e!174522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26224 (= res!135290 (validMask!0 mask!3868))))

(assert (=> start!26224 e!174522))

(declare-fun array_inv!4273 (array!13321) Bool)

(assert (=> start!26224 (array_inv!4273 a!3325)))

(assert (=> start!26224 true))

(declare-fun b!271306 () Bool)

(declare-fun res!135292 () Bool)

(assert (=> b!271306 (=> (not res!135292) (not e!174522))))

(declare-fun arrayNoDuplicates!0 (array!13321 (_ BitVec 32) List!4118) Bool)

(assert (=> b!271306 (= res!135292 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4115))))

(declare-fun b!271307 () Bool)

(declare-fun res!135296 () Bool)

(assert (=> b!271307 (=> (not res!135296) (not e!174524))))

(assert (=> b!271307 (= res!135296 (not (contains!1948 Nil!4115 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!26224 res!135290) b!271298))

(assert (= (and b!271298 res!135297) b!271302))

(assert (= (and b!271302 res!135293) b!271306))

(assert (= (and b!271306 res!135292) b!271304))

(assert (= (and b!271304 res!135285) b!271301))

(assert (= (and b!271301 res!135291) b!271303))

(assert (= (and b!271303 res!135287) b!271296))

(assert (= (and b!271296 res!135295) b!271297))

(assert (= (and b!271297 res!135288) b!271305))

(assert (= (and b!271305 res!135294) b!271299))

(assert (= (and b!271299 res!135289) b!271307))

(assert (= (and b!271307 res!135296) b!271300))

(assert (= (and b!271300 res!135286) b!271295))

(declare-fun m!286627 () Bool)

(assert (=> b!271302 m!286627))

(declare-fun m!286629 () Bool)

(assert (=> b!271300 m!286629))

(declare-fun m!286631 () Bool)

(assert (=> start!26224 m!286631))

(declare-fun m!286633 () Bool)

(assert (=> start!26224 m!286633))

(declare-fun m!286635 () Bool)

(assert (=> b!271304 m!286635))

(declare-fun m!286637 () Bool)

(assert (=> b!271303 m!286637))

(declare-fun m!286639 () Bool)

(assert (=> b!271301 m!286639))

(declare-fun m!286641 () Bool)

(assert (=> b!271299 m!286641))

(declare-fun m!286643 () Bool)

(assert (=> b!271295 m!286643))

(declare-fun m!286645 () Bool)

(assert (=> b!271306 m!286645))

(declare-fun m!286647 () Bool)

(assert (=> b!271297 m!286647))

(assert (=> b!271297 m!286647))

(declare-fun m!286649 () Bool)

(assert (=> b!271297 m!286649))

(declare-fun m!286651 () Bool)

(assert (=> b!271307 m!286651))

(push 1)

(assert (not b!271307))

