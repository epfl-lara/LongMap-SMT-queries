; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26912 () Bool)

(assert start!26912)

(declare-fun b!278751 () Bool)

(declare-fun res!142149 () Bool)

(declare-fun e!177759 () Bool)

(assert (=> b!278751 (=> (not res!142149) (not e!177759))))

(declare-datatypes ((array!13866 0))(
  ( (array!13867 (arr!6579 (Array (_ BitVec 32) (_ BitVec 64))) (size!6932 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13866)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13866 (_ BitVec 32)) Bool)

(assert (=> b!278751 (= res!142149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!278752 () Bool)

(declare-fun e!177757 () Bool)

(assert (=> b!278752 (= e!177757 e!177759)))

(declare-fun res!142145 () Bool)

(assert (=> b!278752 (=> (not res!142145) (not e!177759))))

(declare-datatypes ((SeekEntryResult!1736 0))(
  ( (MissingZero!1736 (index!9114 (_ BitVec 32))) (Found!1736 (index!9115 (_ BitVec 32))) (Intermediate!1736 (undefined!2548 Bool) (index!9116 (_ BitVec 32)) (x!27381 (_ BitVec 32))) (Undefined!1736) (MissingVacant!1736 (index!9117 (_ BitVec 32))) )
))
(declare-fun lt!138330 () SeekEntryResult!1736)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!278752 (= res!142145 (or (= lt!138330 (MissingZero!1736 i!1267)) (= lt!138330 (MissingVacant!1736 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13866 (_ BitVec 32)) SeekEntryResult!1736)

(assert (=> b!278752 (= lt!138330 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!142147 () Bool)

(assert (=> start!26912 (=> (not res!142147) (not e!177757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26912 (= res!142147 (validMask!0 mask!3868))))

(assert (=> start!26912 e!177757))

(declare-fun array_inv!4551 (array!13866) Bool)

(assert (=> start!26912 (array_inv!4551 a!3325)))

(assert (=> start!26912 true))

(declare-fun b!278753 () Bool)

(declare-fun res!142143 () Bool)

(assert (=> b!278753 (=> (not res!142143) (not e!177759))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!278753 (= res!142143 (not (= startIndex!26 i!1267)))))

(declare-fun b!278754 () Bool)

(declare-fun res!142148 () Bool)

(assert (=> b!278754 (=> (not res!142148) (not e!177757))))

(assert (=> b!278754 (= res!142148 (and (= (size!6932 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6932 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6932 a!3325))))))

(declare-fun b!278755 () Bool)

(declare-fun res!142150 () Bool)

(assert (=> b!278755 (=> (not res!142150) (not e!177757))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!278755 (= res!142150 (validKeyInArray!0 k0!2581))))

(declare-fun b!278756 () Bool)

(assert (=> b!278756 (= e!177759 (and (bvslt (size!6932 a!3325) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!6932 a!3325))))))

(declare-fun b!278757 () Bool)

(declare-fun res!142146 () Bool)

(assert (=> b!278757 (=> (not res!142146) (not e!177759))))

(assert (=> b!278757 (= res!142146 (validKeyInArray!0 (select (arr!6579 a!3325) startIndex!26)))))

(declare-fun b!278758 () Bool)

(declare-fun res!142144 () Bool)

(assert (=> b!278758 (=> (not res!142144) (not e!177757))))

(declare-datatypes ((List!4360 0))(
  ( (Nil!4357) (Cons!4356 (h!5026 (_ BitVec 64)) (t!9433 List!4360)) )
))
(declare-fun arrayNoDuplicates!0 (array!13866 (_ BitVec 32) List!4360) Bool)

(assert (=> b!278758 (= res!142144 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4357))))

(declare-fun b!278759 () Bool)

(declare-fun res!142142 () Bool)

(assert (=> b!278759 (=> (not res!142142) (not e!177757))))

(declare-fun arrayContainsKey!0 (array!13866 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!278759 (= res!142142 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26912 res!142147) b!278754))

(assert (= (and b!278754 res!142148) b!278755))

(assert (= (and b!278755 res!142150) b!278758))

(assert (= (and b!278758 res!142144) b!278759))

(assert (= (and b!278759 res!142142) b!278752))

(assert (= (and b!278752 res!142145) b!278751))

(assert (= (and b!278751 res!142149) b!278753))

(assert (= (and b!278753 res!142143) b!278757))

(assert (= (and b!278757 res!142146) b!278756))

(declare-fun m!293237 () Bool)

(assert (=> b!278752 m!293237))

(declare-fun m!293239 () Bool)

(assert (=> b!278755 m!293239))

(declare-fun m!293241 () Bool)

(assert (=> b!278751 m!293241))

(declare-fun m!293243 () Bool)

(assert (=> b!278758 m!293243))

(declare-fun m!293245 () Bool)

(assert (=> b!278757 m!293245))

(assert (=> b!278757 m!293245))

(declare-fun m!293247 () Bool)

(assert (=> b!278757 m!293247))

(declare-fun m!293249 () Bool)

(assert (=> b!278759 m!293249))

(declare-fun m!293251 () Bool)

(assert (=> start!26912 m!293251))

(declare-fun m!293253 () Bool)

(assert (=> start!26912 m!293253))

(check-sat (not b!278759) (not b!278758) (not b!278757) (not start!26912) (not b!278755) (not b!278752) (not b!278751))
(check-sat)
