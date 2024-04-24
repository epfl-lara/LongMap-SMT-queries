; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26184 () Bool)

(assert start!26184)

(declare-fun b!270562 () Bool)

(declare-fun e!174368 () Bool)

(declare-fun e!174366 () Bool)

(assert (=> b!270562 (= e!174368 e!174366)))

(declare-fun res!134526 () Bool)

(assert (=> b!270562 (=> (not res!134526) (not e!174366))))

(declare-datatypes ((SeekEntryResult!1412 0))(
  ( (MissingZero!1412 (index!7818 (_ BitVec 32))) (Found!1412 (index!7819 (_ BitVec 32))) (Intermediate!1412 (undefined!2224 Bool) (index!7820 (_ BitVec 32)) (x!26265 (_ BitVec 32))) (Undefined!1412) (MissingVacant!1412 (index!7821 (_ BitVec 32))) )
))
(declare-fun lt!135719 () SeekEntryResult!1412)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270562 (= res!134526 (or (= lt!135719 (MissingZero!1412 i!1267)) (= lt!135719 (MissingVacant!1412 i!1267))))))

(declare-datatypes ((array!13280 0))(
  ( (array!13281 (arr!6289 (Array (_ BitVec 32) (_ BitVec 64))) (size!6641 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13280)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13280 (_ BitVec 32)) SeekEntryResult!1412)

(assert (=> b!270562 (= lt!135719 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!270563 () Bool)

(declare-fun res!134533 () Bool)

(assert (=> b!270563 (=> (not res!134533) (not e!174366))))

(declare-datatypes ((List!4010 0))(
  ( (Nil!4007) (Cons!4006 (h!4673 (_ BitVec 64)) (t!9084 List!4010)) )
))
(declare-fun noDuplicate!119 (List!4010) Bool)

(assert (=> b!270563 (= res!134533 (noDuplicate!119 Nil!4007))))

(declare-fun b!270564 () Bool)

(declare-fun res!134531 () Bool)

(assert (=> b!270564 (=> (not res!134531) (not e!174368))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270564 (= res!134531 (validKeyInArray!0 k0!2581))))

(declare-fun b!270565 () Bool)

(declare-fun res!134535 () Bool)

(assert (=> b!270565 (=> (not res!134535) (not e!174368))))

(declare-fun arrayNoDuplicates!0 (array!13280 (_ BitVec 32) List!4010) Bool)

(assert (=> b!270565 (= res!134535 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4007))))

(declare-fun res!134530 () Bool)

(assert (=> start!26184 (=> (not res!134530) (not e!174368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26184 (= res!134530 (validMask!0 mask!3868))))

(assert (=> start!26184 e!174368))

(declare-fun array_inv!4239 (array!13280) Bool)

(assert (=> start!26184 (array_inv!4239 a!3325)))

(assert (=> start!26184 true))

(declare-fun b!270566 () Bool)

(declare-fun res!134536 () Bool)

(assert (=> b!270566 (=> (not res!134536) (not e!174366))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13280 (_ BitVec 32)) Bool)

(assert (=> b!270566 (= res!134536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270567 () Bool)

(declare-fun res!134534 () Bool)

(assert (=> b!270567 (=> (not res!134534) (not e!174368))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!270567 (= res!134534 (and (= (size!6641 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6641 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6641 a!3325))))))

(declare-fun b!270568 () Bool)

(declare-fun res!134528 () Bool)

(assert (=> b!270568 (=> (not res!134528) (not e!174366))))

(assert (=> b!270568 (= res!134528 (validKeyInArray!0 (select (arr!6289 a!3325) startIndex!26)))))

(declare-fun b!270569 () Bool)

(declare-fun res!134538 () Bool)

(assert (=> b!270569 (=> (not res!134538) (not e!174366))))

(assert (=> b!270569 (= res!134538 (and (bvslt (size!6641 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6641 a!3325))))))

(declare-fun b!270570 () Bool)

(declare-fun res!134532 () Bool)

(assert (=> b!270570 (=> (not res!134532) (not e!174366))))

(declare-fun contains!1903 (List!4010 (_ BitVec 64)) Bool)

(assert (=> b!270570 (= res!134532 (not (contains!1903 Nil!4007 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270571 () Bool)

(declare-fun res!134527 () Bool)

(assert (=> b!270571 (=> (not res!134527) (not e!174366))))

(assert (=> b!270571 (= res!134527 (not (contains!1903 Nil!4007 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270572 () Bool)

(assert (=> b!270572 (= e!174366 false)))

(declare-fun lt!135720 () Bool)

(assert (=> b!270572 (= lt!135720 (contains!1903 Nil!4007 k0!2581))))

(declare-fun b!270573 () Bool)

(declare-fun res!134529 () Bool)

(assert (=> b!270573 (=> (not res!134529) (not e!174366))))

(assert (=> b!270573 (= res!134529 (not (= startIndex!26 i!1267)))))

(declare-fun b!270574 () Bool)

(declare-fun res!134537 () Bool)

(assert (=> b!270574 (=> (not res!134537) (not e!174368))))

(declare-fun arrayContainsKey!0 (array!13280 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270574 (= res!134537 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26184 res!134530) b!270567))

(assert (= (and b!270567 res!134534) b!270564))

(assert (= (and b!270564 res!134531) b!270565))

(assert (= (and b!270565 res!134535) b!270574))

(assert (= (and b!270574 res!134537) b!270562))

(assert (= (and b!270562 res!134526) b!270566))

(assert (= (and b!270566 res!134536) b!270573))

(assert (= (and b!270573 res!134529) b!270568))

(assert (= (and b!270568 res!134528) b!270569))

(assert (= (and b!270569 res!134538) b!270563))

(assert (= (and b!270563 res!134533) b!270571))

(assert (= (and b!270571 res!134527) b!270570))

(assert (= (and b!270570 res!134532) b!270572))

(declare-fun m!286313 () Bool)

(assert (=> b!270563 m!286313))

(declare-fun m!286315 () Bool)

(assert (=> b!270574 m!286315))

(declare-fun m!286317 () Bool)

(assert (=> b!270568 m!286317))

(assert (=> b!270568 m!286317))

(declare-fun m!286319 () Bool)

(assert (=> b!270568 m!286319))

(declare-fun m!286321 () Bool)

(assert (=> b!270572 m!286321))

(declare-fun m!286323 () Bool)

(assert (=> b!270566 m!286323))

(declare-fun m!286325 () Bool)

(assert (=> b!270570 m!286325))

(declare-fun m!286327 () Bool)

(assert (=> b!270562 m!286327))

(declare-fun m!286329 () Bool)

(assert (=> start!26184 m!286329))

(declare-fun m!286331 () Bool)

(assert (=> start!26184 m!286331))

(declare-fun m!286333 () Bool)

(assert (=> b!270565 m!286333))

(declare-fun m!286335 () Bool)

(assert (=> b!270564 m!286335))

(declare-fun m!286337 () Bool)

(assert (=> b!270571 m!286337))

(check-sat (not b!270568) (not b!270571) (not b!270562) (not b!270574) (not b!270566) (not start!26184) (not b!270564) (not b!270563) (not b!270565) (not b!270570) (not b!270572))
(check-sat)
