; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26226 () Bool)

(assert start!26226)

(declare-fun b!271334 () Bool)

(declare-fun res!135334 () Bool)

(declare-fun e!174531 () Bool)

(assert (=> b!271334 (=> (not res!135334) (not e!174531))))

(declare-datatypes ((array!13323 0))(
  ( (array!13324 (arr!6311 (Array (_ BitVec 32) (_ BitVec 64))) (size!6663 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13323)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271334 (= res!135334 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271335 () Bool)

(declare-fun res!135335 () Bool)

(declare-fun e!174532 () Bool)

(assert (=> b!271335 (=> (not res!135335) (not e!174532))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13323 (_ BitVec 32)) Bool)

(assert (=> b!271335 (= res!135335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271336 () Bool)

(assert (=> b!271336 (= e!174532 false)))

(declare-fun lt!135786 () Bool)

(declare-datatypes ((List!4119 0))(
  ( (Nil!4116) (Cons!4115 (h!4782 (_ BitVec 64)) (t!9201 List!4119)) )
))
(declare-fun contains!1949 (List!4119 (_ BitVec 64)) Bool)

(assert (=> b!271336 (= lt!135786 (contains!1949 Nil!4116 k!2581))))

(declare-fun b!271337 () Bool)

(declare-fun res!135330 () Bool)

(assert (=> b!271337 (=> (not res!135330) (not e!174531))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271337 (= res!135330 (validKeyInArray!0 k!2581))))

(declare-fun b!271338 () Bool)

(declare-fun res!135327 () Bool)

(assert (=> b!271338 (=> (not res!135327) (not e!174532))))

(assert (=> b!271338 (= res!135327 (not (contains!1949 Nil!4116 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271339 () Bool)

(declare-fun res!135325 () Bool)

(assert (=> b!271339 (=> (not res!135325) (not e!174532))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271339 (= res!135325 (not (= startIndex!26 i!1267)))))

(declare-fun b!271340 () Bool)

(declare-fun res!135326 () Bool)

(assert (=> b!271340 (=> (not res!135326) (not e!174531))))

(declare-fun arrayNoDuplicates!0 (array!13323 (_ BitVec 32) List!4119) Bool)

(assert (=> b!271340 (= res!135326 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4116))))

(declare-fun b!271341 () Bool)

(declare-fun res!135324 () Bool)

(assert (=> b!271341 (=> (not res!135324) (not e!174531))))

(assert (=> b!271341 (= res!135324 (and (= (size!6663 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6663 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6663 a!3325))))))

(declare-fun res!135331 () Bool)

(assert (=> start!26226 (=> (not res!135331) (not e!174531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26226 (= res!135331 (validMask!0 mask!3868))))

(assert (=> start!26226 e!174531))

(declare-fun array_inv!4274 (array!13323) Bool)

(assert (=> start!26226 (array_inv!4274 a!3325)))

(assert (=> start!26226 true))

(declare-fun b!271342 () Bool)

(declare-fun res!135333 () Bool)

(assert (=> b!271342 (=> (not res!135333) (not e!174532))))

(assert (=> b!271342 (= res!135333 (not (contains!1949 Nil!4116 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271343 () Bool)

(assert (=> b!271343 (= e!174531 e!174532)))

(declare-fun res!135329 () Bool)

(assert (=> b!271343 (=> (not res!135329) (not e!174532))))

(declare-datatypes ((SeekEntryResult!1469 0))(
  ( (MissingZero!1469 (index!8046 (_ BitVec 32))) (Found!1469 (index!8047 (_ BitVec 32))) (Intermediate!1469 (undefined!2281 Bool) (index!8048 (_ BitVec 32)) (x!26378 (_ BitVec 32))) (Undefined!1469) (MissingVacant!1469 (index!8049 (_ BitVec 32))) )
))
(declare-fun lt!135787 () SeekEntryResult!1469)

(assert (=> b!271343 (= res!135329 (or (= lt!135787 (MissingZero!1469 i!1267)) (= lt!135787 (MissingVacant!1469 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13323 (_ BitVec 32)) SeekEntryResult!1469)

(assert (=> b!271343 (= lt!135787 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!271344 () Bool)

(declare-fun res!135336 () Bool)

(assert (=> b!271344 (=> (not res!135336) (not e!174532))))

(assert (=> b!271344 (= res!135336 (validKeyInArray!0 (select (arr!6311 a!3325) startIndex!26)))))

(declare-fun b!271345 () Bool)

(declare-fun res!135332 () Bool)

(assert (=> b!271345 (=> (not res!135332) (not e!174532))))

(assert (=> b!271345 (= res!135332 (and (bvslt (size!6663 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6663 a!3325))))))

(declare-fun b!271346 () Bool)

(declare-fun res!135328 () Bool)

(assert (=> b!271346 (=> (not res!135328) (not e!174532))))

(declare-fun noDuplicate!137 (List!4119) Bool)

(assert (=> b!271346 (= res!135328 (noDuplicate!137 Nil!4116))))

(assert (= (and start!26226 res!135331) b!271341))

(assert (= (and b!271341 res!135324) b!271337))

(assert (= (and b!271337 res!135330) b!271340))

(assert (= (and b!271340 res!135326) b!271334))

(assert (= (and b!271334 res!135334) b!271343))

(assert (= (and b!271343 res!135329) b!271335))

(assert (= (and b!271335 res!135335) b!271339))

(assert (= (and b!271339 res!135325) b!271344))

(assert (= (and b!271344 res!135336) b!271345))

(assert (= (and b!271345 res!135332) b!271346))

(assert (= (and b!271346 res!135328) b!271342))

(assert (= (and b!271342 res!135333) b!271338))

(assert (= (and b!271338 res!135327) b!271336))

(declare-fun m!286653 () Bool)

(assert (=> b!271337 m!286653))

(declare-fun m!286655 () Bool)

(assert (=> b!271346 m!286655))

(declare-fun m!286657 () Bool)

(assert (=> b!271340 m!286657))

(declare-fun m!286659 () Bool)

(assert (=> start!26226 m!286659))

(declare-fun m!286661 () Bool)

(assert (=> start!26226 m!286661))

(declare-fun m!286663 () Bool)

(assert (=> b!271336 m!286663))

(declare-fun m!286665 () Bool)

(assert (=> b!271334 m!286665))

(declare-fun m!286667 () Bool)

(assert (=> b!271344 m!286667))

(assert (=> b!271344 m!286667))

(declare-fun m!286669 () Bool)

(assert (=> b!271344 m!286669))

(declare-fun m!286671 () Bool)

(assert (=> b!271338 m!286671))

(declare-fun m!286673 () Bool)

(assert (=> b!271342 m!286673))

(declare-fun m!286675 () Bool)

(assert (=> b!271343 m!286675))

(declare-fun m!286677 () Bool)

(assert (=> b!271335 m!286677))

(push 1)

