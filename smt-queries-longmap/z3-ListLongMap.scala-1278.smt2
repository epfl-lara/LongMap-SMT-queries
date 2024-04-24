; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26226 () Bool)

(assert start!26226)

(declare-fun b!271381 () Bool)

(declare-fun res!135348 () Bool)

(declare-fun e!174556 () Bool)

(assert (=> b!271381 (=> (not res!135348) (not e!174556))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271381 (= res!135348 (validKeyInArray!0 k0!2581))))

(declare-fun res!135346 () Bool)

(assert (=> start!26226 (=> (not res!135346) (not e!174556))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26226 (= res!135346 (validMask!0 mask!3868))))

(assert (=> start!26226 e!174556))

(declare-datatypes ((array!13322 0))(
  ( (array!13323 (arr!6310 (Array (_ BitVec 32) (_ BitVec 64))) (size!6662 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13322)

(declare-fun array_inv!4260 (array!13322) Bool)

(assert (=> start!26226 (array_inv!4260 a!3325)))

(assert (=> start!26226 true))

(declare-fun b!271382 () Bool)

(declare-fun res!135355 () Bool)

(declare-fun e!174557 () Bool)

(assert (=> b!271382 (=> (not res!135355) (not e!174557))))

(assert (=> b!271382 (= res!135355 (and (bvslt (size!6662 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6662 a!3325))))))

(declare-fun b!271383 () Bool)

(declare-fun res!135350 () Bool)

(assert (=> b!271383 (=> (not res!135350) (not e!174557))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!271383 (= res!135350 (validKeyInArray!0 (select (arr!6310 a!3325) startIndex!26)))))

(declare-fun b!271384 () Bool)

(declare-fun res!135353 () Bool)

(assert (=> b!271384 (=> (not res!135353) (not e!174556))))

(declare-fun arrayContainsKey!0 (array!13322 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271384 (= res!135353 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271385 () Bool)

(declare-fun res!135349 () Bool)

(assert (=> b!271385 (=> (not res!135349) (not e!174557))))

(declare-datatypes ((List!4031 0))(
  ( (Nil!4028) (Cons!4027 (h!4694 (_ BitVec 64)) (t!9105 List!4031)) )
))
(declare-fun contains!1924 (List!4031 (_ BitVec 64)) Bool)

(assert (=> b!271385 (= res!135349 (not (contains!1924 Nil!4028 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271386 () Bool)

(assert (=> b!271386 (= e!174556 e!174557)))

(declare-fun res!135345 () Bool)

(assert (=> b!271386 (=> (not res!135345) (not e!174557))))

(declare-datatypes ((SeekEntryResult!1433 0))(
  ( (MissingZero!1433 (index!7902 (_ BitVec 32))) (Found!1433 (index!7903 (_ BitVec 32))) (Intermediate!1433 (undefined!2245 Bool) (index!7904 (_ BitVec 32)) (x!26342 (_ BitVec 32))) (Undefined!1433) (MissingVacant!1433 (index!7905 (_ BitVec 32))) )
))
(declare-fun lt!135846 () SeekEntryResult!1433)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271386 (= res!135345 (or (= lt!135846 (MissingZero!1433 i!1267)) (= lt!135846 (MissingVacant!1433 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13322 (_ BitVec 32)) SeekEntryResult!1433)

(assert (=> b!271386 (= lt!135846 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!271387 () Bool)

(declare-fun res!135351 () Bool)

(assert (=> b!271387 (=> (not res!135351) (not e!174556))))

(declare-fun arrayNoDuplicates!0 (array!13322 (_ BitVec 32) List!4031) Bool)

(assert (=> b!271387 (= res!135351 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4028))))

(declare-fun b!271388 () Bool)

(declare-fun res!135354 () Bool)

(assert (=> b!271388 (=> (not res!135354) (not e!174557))))

(assert (=> b!271388 (= res!135354 (not (= startIndex!26 i!1267)))))

(declare-fun b!271389 () Bool)

(declare-fun res!135352 () Bool)

(assert (=> b!271389 (=> (not res!135352) (not e!174556))))

(assert (=> b!271389 (= res!135352 (and (= (size!6662 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6662 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6662 a!3325))))))

(declare-fun b!271390 () Bool)

(declare-fun res!135357 () Bool)

(assert (=> b!271390 (=> (not res!135357) (not e!174557))))

(assert (=> b!271390 (= res!135357 (not (contains!1924 Nil!4028 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271391 () Bool)

(declare-fun res!135356 () Bool)

(assert (=> b!271391 (=> (not res!135356) (not e!174557))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13322 (_ BitVec 32)) Bool)

(assert (=> b!271391 (= res!135356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271392 () Bool)

(assert (=> b!271392 (= e!174557 false)))

(declare-fun lt!135845 () Bool)

(assert (=> b!271392 (= lt!135845 (contains!1924 Nil!4028 k0!2581))))

(declare-fun b!271393 () Bool)

(declare-fun res!135347 () Bool)

(assert (=> b!271393 (=> (not res!135347) (not e!174557))))

(declare-fun noDuplicate!140 (List!4031) Bool)

(assert (=> b!271393 (= res!135347 (noDuplicate!140 Nil!4028))))

(assert (= (and start!26226 res!135346) b!271389))

(assert (= (and b!271389 res!135352) b!271381))

(assert (= (and b!271381 res!135348) b!271387))

(assert (= (and b!271387 res!135351) b!271384))

(assert (= (and b!271384 res!135353) b!271386))

(assert (= (and b!271386 res!135345) b!271391))

(assert (= (and b!271391 res!135356) b!271388))

(assert (= (and b!271388 res!135354) b!271383))

(assert (= (and b!271383 res!135350) b!271382))

(assert (= (and b!271382 res!135355) b!271393))

(assert (= (and b!271393 res!135347) b!271385))

(assert (= (and b!271385 res!135349) b!271390))

(assert (= (and b!271390 res!135357) b!271392))

(declare-fun m!286859 () Bool)

(assert (=> b!271393 m!286859))

(declare-fun m!286861 () Bool)

(assert (=> b!271385 m!286861))

(declare-fun m!286863 () Bool)

(assert (=> b!271392 m!286863))

(declare-fun m!286865 () Bool)

(assert (=> b!271384 m!286865))

(declare-fun m!286867 () Bool)

(assert (=> b!271386 m!286867))

(declare-fun m!286869 () Bool)

(assert (=> b!271391 m!286869))

(declare-fun m!286871 () Bool)

(assert (=> b!271387 m!286871))

(declare-fun m!286873 () Bool)

(assert (=> start!26226 m!286873))

(declare-fun m!286875 () Bool)

(assert (=> start!26226 m!286875))

(declare-fun m!286877 () Bool)

(assert (=> b!271381 m!286877))

(declare-fun m!286879 () Bool)

(assert (=> b!271390 m!286879))

(declare-fun m!286881 () Bool)

(assert (=> b!271383 m!286881))

(assert (=> b!271383 m!286881))

(declare-fun m!286883 () Bool)

(assert (=> b!271383 m!286883))

(check-sat (not b!271393) (not b!271383) (not b!271384) (not b!271385) (not start!26226) (not b!271392) (not b!271390) (not b!271386) (not b!271381) (not b!271391) (not b!271387))
(check-sat)
