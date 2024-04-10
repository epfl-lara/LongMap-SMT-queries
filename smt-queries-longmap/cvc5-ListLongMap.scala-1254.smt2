; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26082 () Bool)

(assert start!26082)

(declare-fun b!269007 () Bool)

(declare-fun res!133287 () Bool)

(declare-fun e!173667 () Bool)

(assert (=> b!269007 (=> (not res!133287) (not e!173667))))

(declare-datatypes ((array!13179 0))(
  ( (array!13180 (arr!6239 (Array (_ BitVec 32) (_ BitVec 64))) (size!6591 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13179)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13179 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269007 (= res!133287 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269008 () Bool)

(declare-fun e!173669 () Bool)

(assert (=> b!269008 (= e!173667 e!173669)))

(declare-fun res!133290 () Bool)

(assert (=> b!269008 (=> (not res!133290) (not e!173669))))

(declare-datatypes ((SeekEntryResult!1397 0))(
  ( (MissingZero!1397 (index!7758 (_ BitVec 32))) (Found!1397 (index!7759 (_ BitVec 32))) (Intermediate!1397 (undefined!2209 Bool) (index!7760 (_ BitVec 32)) (x!26114 (_ BitVec 32))) (Undefined!1397) (MissingVacant!1397 (index!7761 (_ BitVec 32))) )
))
(declare-fun lt!135066 () SeekEntryResult!1397)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269008 (= res!133290 (or (= lt!135066 (MissingZero!1397 i!1267)) (= lt!135066 (MissingVacant!1397 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13179 (_ BitVec 32)) SeekEntryResult!1397)

(assert (=> b!269008 (= lt!135066 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!269009 () Bool)

(declare-fun res!133288 () Bool)

(assert (=> b!269009 (=> (not res!133288) (not e!173667))))

(declare-datatypes ((List!4047 0))(
  ( (Nil!4044) (Cons!4043 (h!4710 (_ BitVec 64)) (t!9129 List!4047)) )
))
(declare-fun arrayNoDuplicates!0 (array!13179 (_ BitVec 32) List!4047) Bool)

(assert (=> b!269009 (= res!133288 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4044))))

(declare-fun b!269010 () Bool)

(assert (=> b!269010 (= e!173669 false)))

(declare-fun lt!135067 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13179 (_ BitVec 32)) Bool)

(assert (=> b!269010 (= lt!135067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269011 () Bool)

(declare-fun res!133289 () Bool)

(assert (=> b!269011 (=> (not res!133289) (not e!173667))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269011 (= res!133289 (validKeyInArray!0 k!2581))))

(declare-fun res!133285 () Bool)

(assert (=> start!26082 (=> (not res!133285) (not e!173667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26082 (= res!133285 (validMask!0 mask!3868))))

(assert (=> start!26082 e!173667))

(declare-fun array_inv!4202 (array!13179) Bool)

(assert (=> start!26082 (array_inv!4202 a!3325)))

(assert (=> start!26082 true))

(declare-fun b!269012 () Bool)

(declare-fun res!133286 () Bool)

(assert (=> b!269012 (=> (not res!133286) (not e!173667))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!269012 (= res!133286 (and (= (size!6591 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6591 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6591 a!3325))))))

(assert (= (and start!26082 res!133285) b!269012))

(assert (= (and b!269012 res!133286) b!269011))

(assert (= (and b!269011 res!133289) b!269009))

(assert (= (and b!269009 res!133288) b!269007))

(assert (= (and b!269007 res!133287) b!269008))

(assert (= (and b!269008 res!133290) b!269010))

(declare-fun m!285009 () Bool)

(assert (=> b!269010 m!285009))

(declare-fun m!285011 () Bool)

(assert (=> b!269008 m!285011))

(declare-fun m!285013 () Bool)

(assert (=> b!269009 m!285013))

(declare-fun m!285015 () Bool)

(assert (=> b!269011 m!285015))

(declare-fun m!285017 () Bool)

(assert (=> start!26082 m!285017))

(declare-fun m!285019 () Bool)

(assert (=> start!26082 m!285019))

(declare-fun m!285021 () Bool)

(assert (=> b!269007 m!285021))

(push 1)

