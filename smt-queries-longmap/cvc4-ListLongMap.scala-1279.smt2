; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26236 () Bool)

(assert start!26236)

(declare-fun b!271529 () Bool)

(declare-fun res!135527 () Bool)

(declare-fun e!174576 () Bool)

(assert (=> b!271529 (=> (not res!135527) (not e!174576))))

(declare-datatypes ((array!13333 0))(
  ( (array!13334 (arr!6316 (Array (_ BitVec 32) (_ BitVec 64))) (size!6668 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13333)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!271529 (= res!135527 (and (= (size!6668 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6668 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6668 a!3325))))))

(declare-fun b!271530 () Bool)

(declare-fun res!135524 () Bool)

(assert (=> b!271530 (=> (not res!135524) (not e!174576))))

(declare-datatypes ((List!4124 0))(
  ( (Nil!4121) (Cons!4120 (h!4787 (_ BitVec 64)) (t!9206 List!4124)) )
))
(declare-fun arrayNoDuplicates!0 (array!13333 (_ BitVec 32) List!4124) Bool)

(assert (=> b!271530 (= res!135524 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4121))))

(declare-fun b!271531 () Bool)

(declare-fun res!135521 () Bool)

(declare-fun e!174577 () Bool)

(assert (=> b!271531 (=> (not res!135521) (not e!174577))))

(assert (=> b!271531 (= res!135521 (not (= startIndex!26 i!1267)))))

(declare-fun b!271532 () Bool)

(declare-fun res!135526 () Bool)

(assert (=> b!271532 (=> (not res!135526) (not e!174577))))

(assert (=> b!271532 (= res!135526 (and (bvslt (size!6668 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6668 a!3325))))))

(declare-fun b!271533 () Bool)

(declare-fun res!135531 () Bool)

(assert (=> b!271533 (=> (not res!135531) (not e!174577))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13333 (_ BitVec 32)) Bool)

(assert (=> b!271533 (= res!135531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271534 () Bool)

(declare-fun res!135530 () Bool)

(assert (=> b!271534 (=> (not res!135530) (not e!174577))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271534 (= res!135530 (validKeyInArray!0 (select (arr!6316 a!3325) startIndex!26)))))

(declare-fun res!135523 () Bool)

(assert (=> start!26236 (=> (not res!135523) (not e!174576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26236 (= res!135523 (validMask!0 mask!3868))))

(assert (=> start!26236 e!174576))

(declare-fun array_inv!4279 (array!13333) Bool)

(assert (=> start!26236 (array_inv!4279 a!3325)))

(assert (=> start!26236 true))

(declare-fun b!271535 () Bool)

(declare-fun res!135525 () Bool)

(assert (=> b!271535 (=> (not res!135525) (not e!174577))))

(declare-fun contains!1954 (List!4124 (_ BitVec 64)) Bool)

(assert (=> b!271535 (= res!135525 (not (contains!1954 Nil!4121 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271536 () Bool)

(declare-fun res!135519 () Bool)

(assert (=> b!271536 (=> (not res!135519) (not e!174576))))

(declare-fun k!2581 () (_ BitVec 64))

(assert (=> b!271536 (= res!135519 (validKeyInArray!0 k!2581))))

(declare-fun b!271537 () Bool)

(declare-fun res!135522 () Bool)

(assert (=> b!271537 (=> (not res!135522) (not e!174576))))

(declare-fun arrayContainsKey!0 (array!13333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271537 (= res!135522 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271538 () Bool)

(declare-fun res!135520 () Bool)

(assert (=> b!271538 (=> (not res!135520) (not e!174577))))

(declare-fun noDuplicate!142 (List!4124) Bool)

(assert (=> b!271538 (= res!135520 (noDuplicate!142 Nil!4121))))

(declare-fun b!271539 () Bool)

(assert (=> b!271539 (= e!174577 false)))

(declare-fun lt!135817 () Bool)

(assert (=> b!271539 (= lt!135817 (contains!1954 Nil!4121 k!2581))))

(declare-fun b!271540 () Bool)

(assert (=> b!271540 (= e!174576 e!174577)))

(declare-fun res!135528 () Bool)

(assert (=> b!271540 (=> (not res!135528) (not e!174577))))

(declare-datatypes ((SeekEntryResult!1474 0))(
  ( (MissingZero!1474 (index!8066 (_ BitVec 32))) (Found!1474 (index!8067 (_ BitVec 32))) (Intermediate!1474 (undefined!2286 Bool) (index!8068 (_ BitVec 32)) (x!26391 (_ BitVec 32))) (Undefined!1474) (MissingVacant!1474 (index!8069 (_ BitVec 32))) )
))
(declare-fun lt!135816 () SeekEntryResult!1474)

(assert (=> b!271540 (= res!135528 (or (= lt!135816 (MissingZero!1474 i!1267)) (= lt!135816 (MissingVacant!1474 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13333 (_ BitVec 32)) SeekEntryResult!1474)

(assert (=> b!271540 (= lt!135816 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!271541 () Bool)

(declare-fun res!135529 () Bool)

(assert (=> b!271541 (=> (not res!135529) (not e!174577))))

(assert (=> b!271541 (= res!135529 (not (contains!1954 Nil!4121 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!26236 res!135523) b!271529))

(assert (= (and b!271529 res!135527) b!271536))

(assert (= (and b!271536 res!135519) b!271530))

(assert (= (and b!271530 res!135524) b!271537))

(assert (= (and b!271537 res!135522) b!271540))

(assert (= (and b!271540 res!135528) b!271533))

(assert (= (and b!271533 res!135531) b!271531))

(assert (= (and b!271531 res!135521) b!271534))

(assert (= (and b!271534 res!135530) b!271532))

(assert (= (and b!271532 res!135526) b!271538))

(assert (= (and b!271538 res!135520) b!271535))

(assert (= (and b!271535 res!135525) b!271541))

(assert (= (and b!271541 res!135529) b!271539))

(declare-fun m!286783 () Bool)

(assert (=> b!271534 m!286783))

(assert (=> b!271534 m!286783))

(declare-fun m!286785 () Bool)

(assert (=> b!271534 m!286785))

(declare-fun m!286787 () Bool)

(assert (=> b!271541 m!286787))

(declare-fun m!286789 () Bool)

(assert (=> b!271535 m!286789))

(declare-fun m!286791 () Bool)

(assert (=> b!271537 m!286791))

(declare-fun m!286793 () Bool)

(assert (=> b!271536 m!286793))

(declare-fun m!286795 () Bool)

(assert (=> b!271533 m!286795))

(declare-fun m!286797 () Bool)

(assert (=> start!26236 m!286797))

(declare-fun m!286799 () Bool)

(assert (=> start!26236 m!286799))

(declare-fun m!286801 () Bool)

(assert (=> b!271538 m!286801))

(declare-fun m!286803 () Bool)

(assert (=> b!271539 m!286803))

(declare-fun m!286805 () Bool)

(assert (=> b!271540 m!286805))

(declare-fun m!286807 () Bool)

(assert (=> b!271530 m!286807))

(push 1)

