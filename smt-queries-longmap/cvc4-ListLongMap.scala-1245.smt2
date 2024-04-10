; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26032 () Bool)

(assert start!26032)

(declare-fun b!268557 () Bool)

(declare-fun e!173444 () Bool)

(declare-fun e!173442 () Bool)

(assert (=> b!268557 (= e!173444 e!173442)))

(declare-fun res!132839 () Bool)

(assert (=> b!268557 (=> (not res!132839) (not e!173442))))

(declare-datatypes ((SeekEntryResult!1372 0))(
  ( (MissingZero!1372 (index!7658 (_ BitVec 32))) (Found!1372 (index!7659 (_ BitVec 32))) (Intermediate!1372 (undefined!2184 Bool) (index!7660 (_ BitVec 32)) (x!26017 (_ BitVec 32))) (Undefined!1372) (MissingVacant!1372 (index!7661 (_ BitVec 32))) )
))
(declare-fun lt!134916 () SeekEntryResult!1372)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268557 (= res!132839 (or (= lt!134916 (MissingZero!1372 i!1267)) (= lt!134916 (MissingVacant!1372 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-datatypes ((array!13129 0))(
  ( (array!13130 (arr!6214 (Array (_ BitVec 32) (_ BitVec 64))) (size!6566 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13129)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13129 (_ BitVec 32)) SeekEntryResult!1372)

(assert (=> b!268557 (= lt!134916 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268558 () Bool)

(declare-fun res!132840 () Bool)

(assert (=> b!268558 (=> (not res!132840) (not e!173444))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268558 (= res!132840 (and (= (size!6566 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6566 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6566 a!3325))))))

(declare-fun b!268559 () Bool)

(declare-fun res!132837 () Bool)

(assert (=> b!268559 (=> (not res!132837) (not e!173444))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268559 (= res!132837 (validKeyInArray!0 k!2581))))

(declare-fun b!268560 () Bool)

(declare-fun res!132835 () Bool)

(assert (=> b!268560 (=> (not res!132835) (not e!173444))))

(declare-datatypes ((List!4022 0))(
  ( (Nil!4019) (Cons!4018 (h!4685 (_ BitVec 64)) (t!9104 List!4022)) )
))
(declare-fun arrayNoDuplicates!0 (array!13129 (_ BitVec 32) List!4022) Bool)

(assert (=> b!268560 (= res!132835 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4019))))

(declare-fun res!132838 () Bool)

(assert (=> start!26032 (=> (not res!132838) (not e!173444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26032 (= res!132838 (validMask!0 mask!3868))))

(assert (=> start!26032 e!173444))

(declare-fun array_inv!4177 (array!13129) Bool)

(assert (=> start!26032 (array_inv!4177 a!3325)))

(assert (=> start!26032 true))

(declare-fun b!268561 () Bool)

(declare-fun res!132836 () Bool)

(assert (=> b!268561 (=> (not res!132836) (not e!173444))))

(declare-fun arrayContainsKey!0 (array!13129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268561 (= res!132836 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268562 () Bool)

(assert (=> b!268562 (= e!173442 false)))

(declare-fun lt!134917 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13129 (_ BitVec 32)) Bool)

(assert (=> b!268562 (= lt!134917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26032 res!132838) b!268558))

(assert (= (and b!268558 res!132840) b!268559))

(assert (= (and b!268559 res!132837) b!268560))

(assert (= (and b!268560 res!132835) b!268561))

(assert (= (and b!268561 res!132836) b!268557))

(assert (= (and b!268557 res!132839) b!268562))

(declare-fun m!284659 () Bool)

(assert (=> b!268559 m!284659))

(declare-fun m!284661 () Bool)

(assert (=> b!268557 m!284661))

(declare-fun m!284663 () Bool)

(assert (=> b!268560 m!284663))

(declare-fun m!284665 () Bool)

(assert (=> b!268561 m!284665))

(declare-fun m!284667 () Bool)

(assert (=> b!268562 m!284667))

(declare-fun m!284669 () Bool)

(assert (=> start!26032 m!284669))

(declare-fun m!284671 () Bool)

(assert (=> start!26032 m!284671))

(push 1)

(assert (not b!268560))

(assert (not start!26032))

(assert (not b!268562))

(assert (not b!268557))

(assert (not b!268561))

(assert (not b!268559))

(check-sat)

