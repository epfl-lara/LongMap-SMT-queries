; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26228 () Bool)

(assert start!26228)

(declare-fun b!271373 () Bool)

(declare-fun res!135369 () Bool)

(declare-fun e!174540 () Bool)

(assert (=> b!271373 (=> (not res!135369) (not e!174540))))

(declare-datatypes ((array!13325 0))(
  ( (array!13326 (arr!6312 (Array (_ BitVec 32) (_ BitVec 64))) (size!6664 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13325)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271373 (= res!135369 (and (= (size!6664 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6664 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6664 a!3325))))))

(declare-fun b!271374 () Bool)

(declare-fun res!135365 () Bool)

(declare-fun e!174541 () Bool)

(assert (=> b!271374 (=> (not res!135365) (not e!174541))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271374 (= res!135365 (validKeyInArray!0 (select (arr!6312 a!3325) startIndex!26)))))

(declare-fun b!271375 () Bool)

(declare-fun res!135373 () Bool)

(assert (=> b!271375 (=> (not res!135373) (not e!174541))))

(declare-datatypes ((List!4120 0))(
  ( (Nil!4117) (Cons!4116 (h!4783 (_ BitVec 64)) (t!9202 List!4120)) )
))
(declare-fun noDuplicate!138 (List!4120) Bool)

(assert (=> b!271375 (= res!135373 (noDuplicate!138 Nil!4117))))

(declare-fun b!271376 () Bool)

(declare-fun res!135368 () Bool)

(assert (=> b!271376 (=> (not res!135368) (not e!174540))))

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!271376 (= res!135368 (validKeyInArray!0 k0!2581))))

(declare-fun b!271377 () Bool)

(assert (=> b!271377 (= e!174540 e!174541)))

(declare-fun res!135366 () Bool)

(assert (=> b!271377 (=> (not res!135366) (not e!174541))))

(declare-datatypes ((SeekEntryResult!1470 0))(
  ( (MissingZero!1470 (index!8050 (_ BitVec 32))) (Found!1470 (index!8051 (_ BitVec 32))) (Intermediate!1470 (undefined!2282 Bool) (index!8052 (_ BitVec 32)) (x!26379 (_ BitVec 32))) (Undefined!1470) (MissingVacant!1470 (index!8053 (_ BitVec 32))) )
))
(declare-fun lt!135793 () SeekEntryResult!1470)

(assert (=> b!271377 (= res!135366 (or (= lt!135793 (MissingZero!1470 i!1267)) (= lt!135793 (MissingVacant!1470 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13325 (_ BitVec 32)) SeekEntryResult!1470)

(assert (=> b!271377 (= lt!135793 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!271378 () Bool)

(assert (=> b!271378 (= e!174541 false)))

(declare-fun lt!135792 () Bool)

(declare-fun contains!1950 (List!4120 (_ BitVec 64)) Bool)

(assert (=> b!271378 (= lt!135792 (contains!1950 Nil!4117 k0!2581))))

(declare-fun b!271379 () Bool)

(declare-fun res!135370 () Bool)

(assert (=> b!271379 (=> (not res!135370) (not e!174541))))

(assert (=> b!271379 (= res!135370 (not (= startIndex!26 i!1267)))))

(declare-fun b!271380 () Bool)

(declare-fun res!135364 () Bool)

(assert (=> b!271380 (=> (not res!135364) (not e!174541))))

(assert (=> b!271380 (= res!135364 (not (contains!1950 Nil!4117 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271381 () Bool)

(declare-fun res!135372 () Bool)

(assert (=> b!271381 (=> (not res!135372) (not e!174541))))

(assert (=> b!271381 (= res!135372 (and (bvslt (size!6664 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6664 a!3325))))))

(declare-fun b!271382 () Bool)

(declare-fun res!135367 () Bool)

(assert (=> b!271382 (=> (not res!135367) (not e!174540))))

(declare-fun arrayContainsKey!0 (array!13325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271382 (= res!135367 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271383 () Bool)

(declare-fun res!135371 () Bool)

(assert (=> b!271383 (=> (not res!135371) (not e!174541))))

(assert (=> b!271383 (= res!135371 (not (contains!1950 Nil!4117 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271384 () Bool)

(declare-fun res!135374 () Bool)

(assert (=> b!271384 (=> (not res!135374) (not e!174540))))

(declare-fun arrayNoDuplicates!0 (array!13325 (_ BitVec 32) List!4120) Bool)

(assert (=> b!271384 (= res!135374 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4117))))

(declare-fun res!135363 () Bool)

(assert (=> start!26228 (=> (not res!135363) (not e!174540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26228 (= res!135363 (validMask!0 mask!3868))))

(assert (=> start!26228 e!174540))

(declare-fun array_inv!4275 (array!13325) Bool)

(assert (=> start!26228 (array_inv!4275 a!3325)))

(assert (=> start!26228 true))

(declare-fun b!271385 () Bool)

(declare-fun res!135375 () Bool)

(assert (=> b!271385 (=> (not res!135375) (not e!174541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13325 (_ BitVec 32)) Bool)

(assert (=> b!271385 (= res!135375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26228 res!135363) b!271373))

(assert (= (and b!271373 res!135369) b!271376))

(assert (= (and b!271376 res!135368) b!271384))

(assert (= (and b!271384 res!135374) b!271382))

(assert (= (and b!271382 res!135367) b!271377))

(assert (= (and b!271377 res!135366) b!271385))

(assert (= (and b!271385 res!135375) b!271379))

(assert (= (and b!271379 res!135370) b!271374))

(assert (= (and b!271374 res!135365) b!271381))

(assert (= (and b!271381 res!135372) b!271375))

(assert (= (and b!271375 res!135373) b!271380))

(assert (= (and b!271380 res!135364) b!271383))

(assert (= (and b!271383 res!135371) b!271378))

(declare-fun m!286679 () Bool)

(assert (=> b!271380 m!286679))

(declare-fun m!286681 () Bool)

(assert (=> b!271378 m!286681))

(declare-fun m!286683 () Bool)

(assert (=> b!271375 m!286683))

(declare-fun m!286685 () Bool)

(assert (=> b!271385 m!286685))

(declare-fun m!286687 () Bool)

(assert (=> b!271377 m!286687))

(declare-fun m!286689 () Bool)

(assert (=> b!271376 m!286689))

(declare-fun m!286691 () Bool)

(assert (=> b!271374 m!286691))

(assert (=> b!271374 m!286691))

(declare-fun m!286693 () Bool)

(assert (=> b!271374 m!286693))

(declare-fun m!286695 () Bool)

(assert (=> b!271382 m!286695))

(declare-fun m!286697 () Bool)

(assert (=> start!26228 m!286697))

(declare-fun m!286699 () Bool)

(assert (=> start!26228 m!286699))

(declare-fun m!286701 () Bool)

(assert (=> b!271384 m!286701))

(declare-fun m!286703 () Bool)

(assert (=> b!271383 m!286703))

(check-sat (not b!271384) (not b!271375) (not b!271380) (not b!271385) (not b!271378) (not b!271377) (not b!271376) (not b!271382) (not b!271374) (not b!271383) (not start!26228))
(check-sat)
