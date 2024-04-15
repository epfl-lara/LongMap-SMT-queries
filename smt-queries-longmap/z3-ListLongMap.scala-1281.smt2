; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26246 () Bool)

(assert start!26246)

(declare-fun b!271538 () Bool)

(declare-fun res!135585 () Bool)

(declare-fun e!174512 () Bool)

(assert (=> b!271538 (=> (not res!135585) (not e!174512))))

(declare-datatypes ((array!13332 0))(
  ( (array!13333 (arr!6315 (Array (_ BitVec 32) (_ BitVec 64))) (size!6668 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13332)

(assert (=> b!271538 (= res!135585 (and (bvslt (size!6668 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6668 a!3325))))))

(declare-fun b!271539 () Bool)

(declare-fun res!135586 () Bool)

(assert (=> b!271539 (=> (not res!135586) (not e!174512))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271539 (= res!135586 (not (= startIndex!26 i!1267)))))

(declare-fun b!271540 () Bool)

(assert (=> b!271540 (= e!174512 false)))

(declare-fun lt!135660 () Bool)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-datatypes ((List!4096 0))(
  ( (Nil!4093) (Cons!4092 (h!4759 (_ BitVec 64)) (t!9169 List!4096)) )
))
(declare-fun contains!1934 (List!4096 (_ BitVec 64)) Bool)

(assert (=> b!271540 (= lt!135660 (contains!1934 Nil!4093 k0!2581))))

(declare-fun b!271542 () Bool)

(declare-fun res!135590 () Bool)

(declare-fun e!174513 () Bool)

(assert (=> b!271542 (=> (not res!135590) (not e!174513))))

(declare-fun arrayContainsKey!0 (array!13332 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271542 (= res!135590 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271543 () Bool)

(declare-fun res!135582 () Bool)

(assert (=> b!271543 (=> (not res!135582) (not e!174513))))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!271543 (= res!135582 (and (= (size!6668 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6668 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6668 a!3325))))))

(declare-fun b!271544 () Bool)

(declare-fun res!135584 () Bool)

(assert (=> b!271544 (=> (not res!135584) (not e!174513))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271544 (= res!135584 (validKeyInArray!0 k0!2581))))

(declare-fun b!271545 () Bool)

(declare-fun res!135580 () Bool)

(assert (=> b!271545 (=> (not res!135580) (not e!174512))))

(assert (=> b!271545 (= res!135580 (not (contains!1934 Nil!4093 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271546 () Bool)

(declare-fun res!135583 () Bool)

(assert (=> b!271546 (=> (not res!135583) (not e!174512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13332 (_ BitVec 32)) Bool)

(assert (=> b!271546 (= res!135583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271547 () Bool)

(declare-fun res!135588 () Bool)

(assert (=> b!271547 (=> (not res!135588) (not e!174512))))

(assert (=> b!271547 (= res!135588 (validKeyInArray!0 (select (arr!6315 a!3325) startIndex!26)))))

(declare-fun b!271548 () Bool)

(declare-fun res!135589 () Bool)

(assert (=> b!271548 (=> (not res!135589) (not e!174512))))

(assert (=> b!271548 (= res!135589 (not (contains!1934 Nil!4093 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!135587 () Bool)

(assert (=> start!26246 (=> (not res!135587) (not e!174513))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26246 (= res!135587 (validMask!0 mask!3868))))

(assert (=> start!26246 e!174513))

(declare-fun array_inv!4287 (array!13332) Bool)

(assert (=> start!26246 (array_inv!4287 a!3325)))

(assert (=> start!26246 true))

(declare-fun b!271541 () Bool)

(declare-fun res!135591 () Bool)

(assert (=> b!271541 (=> (not res!135591) (not e!174513))))

(declare-fun arrayNoDuplicates!0 (array!13332 (_ BitVec 32) List!4096) Bool)

(assert (=> b!271541 (= res!135591 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4093))))

(declare-fun b!271549 () Bool)

(declare-fun res!135592 () Bool)

(assert (=> b!271549 (=> (not res!135592) (not e!174512))))

(declare-fun noDuplicate!148 (List!4096) Bool)

(assert (=> b!271549 (= res!135592 (noDuplicate!148 Nil!4093))))

(declare-fun b!271550 () Bool)

(assert (=> b!271550 (= e!174513 e!174512)))

(declare-fun res!135581 () Bool)

(assert (=> b!271550 (=> (not res!135581) (not e!174512))))

(declare-datatypes ((SeekEntryResult!1472 0))(
  ( (MissingZero!1472 (index!8058 (_ BitVec 32))) (Found!1472 (index!8059 (_ BitVec 32))) (Intermediate!1472 (undefined!2284 Bool) (index!8060 (_ BitVec 32)) (x!26404 (_ BitVec 32))) (Undefined!1472) (MissingVacant!1472 (index!8061 (_ BitVec 32))) )
))
(declare-fun lt!135659 () SeekEntryResult!1472)

(assert (=> b!271550 (= res!135581 (or (= lt!135659 (MissingZero!1472 i!1267)) (= lt!135659 (MissingVacant!1472 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13332 (_ BitVec 32)) SeekEntryResult!1472)

(assert (=> b!271550 (= lt!135659 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26246 res!135587) b!271543))

(assert (= (and b!271543 res!135582) b!271544))

(assert (= (and b!271544 res!135584) b!271541))

(assert (= (and b!271541 res!135591) b!271542))

(assert (= (and b!271542 res!135590) b!271550))

(assert (= (and b!271550 res!135581) b!271546))

(assert (= (and b!271546 res!135583) b!271539))

(assert (= (and b!271539 res!135586) b!271547))

(assert (= (and b!271547 res!135588) b!271538))

(assert (= (and b!271538 res!135585) b!271549))

(assert (= (and b!271549 res!135592) b!271548))

(assert (= (and b!271548 res!135589) b!271545))

(assert (= (and b!271545 res!135580) b!271540))

(declare-fun m!286295 () Bool)

(assert (=> b!271548 m!286295))

(declare-fun m!286297 () Bool)

(assert (=> b!271540 m!286297))

(declare-fun m!286299 () Bool)

(assert (=> b!271541 m!286299))

(declare-fun m!286301 () Bool)

(assert (=> start!26246 m!286301))

(declare-fun m!286303 () Bool)

(assert (=> start!26246 m!286303))

(declare-fun m!286305 () Bool)

(assert (=> b!271546 m!286305))

(declare-fun m!286307 () Bool)

(assert (=> b!271550 m!286307))

(declare-fun m!286309 () Bool)

(assert (=> b!271544 m!286309))

(declare-fun m!286311 () Bool)

(assert (=> b!271542 m!286311))

(declare-fun m!286313 () Bool)

(assert (=> b!271547 m!286313))

(assert (=> b!271547 m!286313))

(declare-fun m!286315 () Bool)

(assert (=> b!271547 m!286315))

(declare-fun m!286317 () Bool)

(assert (=> b!271545 m!286317))

(declare-fun m!286319 () Bool)

(assert (=> b!271549 m!286319))

(check-sat (not start!26246) (not b!271542) (not b!271541) (not b!271549) (not b!271546) (not b!271545) (not b!271544) (not b!271540) (not b!271547) (not b!271550) (not b!271548))
(check-sat)
