; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48232 () Bool)

(assert start!48232)

(declare-fun b!530954 () Bool)

(declare-fun res!326664 () Bool)

(declare-fun e!309269 () Bool)

(assert (=> b!530954 (=> (not res!326664) (not e!309269))))

(declare-datatypes ((array!33657 0))(
  ( (array!33658 (arr!16175 (Array (_ BitVec 32) (_ BitVec 64))) (size!16539 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33657)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33657 (_ BitVec 32)) Bool)

(assert (=> b!530954 (= res!326664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!326661 () Bool)

(declare-fun e!309270 () Bool)

(assert (=> start!48232 (=> (not res!326661) (not e!309270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48232 (= res!326661 (validMask!0 mask!3216))))

(assert (=> start!48232 e!309270))

(assert (=> start!48232 true))

(declare-fun array_inv!11971 (array!33657) Bool)

(assert (=> start!48232 (array_inv!11971 a!3154)))

(declare-fun b!530955 () Bool)

(declare-fun res!326665 () Bool)

(assert (=> b!530955 (=> (not res!326665) (not e!309270))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530955 (= res!326665 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530956 () Bool)

(declare-fun res!326660 () Bool)

(assert (=> b!530956 (=> (not res!326660) (not e!309270))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530956 (= res!326660 (validKeyInArray!0 k!1998))))

(declare-fun b!530957 () Bool)

(declare-fun res!326666 () Bool)

(assert (=> b!530957 (=> (not res!326666) (not e!309270))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!530957 (= res!326666 (validKeyInArray!0 (select (arr!16175 a!3154) j!147)))))

(declare-fun b!530958 () Bool)

(assert (=> b!530958 (= e!309270 e!309269)))

(declare-fun res!326663 () Bool)

(assert (=> b!530958 (=> (not res!326663) (not e!309269))))

(declare-datatypes ((SeekEntryResult!4633 0))(
  ( (MissingZero!4633 (index!20756 (_ BitVec 32))) (Found!4633 (index!20757 (_ BitVec 32))) (Intermediate!4633 (undefined!5445 Bool) (index!20758 (_ BitVec 32)) (x!49735 (_ BitVec 32))) (Undefined!4633) (MissingVacant!4633 (index!20759 (_ BitVec 32))) )
))
(declare-fun lt!244828 () SeekEntryResult!4633)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530958 (= res!326663 (or (= lt!244828 (MissingZero!4633 i!1153)) (= lt!244828 (MissingVacant!4633 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33657 (_ BitVec 32)) SeekEntryResult!4633)

(assert (=> b!530958 (= lt!244828 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!530959 () Bool)

(assert (=> b!530959 (= e!309269 (bvsgt #b00000000000000000000000000000000 (size!16539 a!3154)))))

(declare-fun b!530960 () Bool)

(declare-fun res!326662 () Bool)

(assert (=> b!530960 (=> (not res!326662) (not e!309270))))

(assert (=> b!530960 (= res!326662 (and (= (size!16539 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16539 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16539 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48232 res!326661) b!530960))

(assert (= (and b!530960 res!326662) b!530957))

(assert (= (and b!530957 res!326666) b!530956))

(assert (= (and b!530956 res!326660) b!530955))

(assert (= (and b!530955 res!326665) b!530958))

(assert (= (and b!530958 res!326663) b!530954))

(assert (= (and b!530954 res!326664) b!530959))

(declare-fun m!511481 () Bool)

(assert (=> b!530954 m!511481))

(declare-fun m!511483 () Bool)

(assert (=> b!530956 m!511483))

(declare-fun m!511485 () Bool)

(assert (=> b!530957 m!511485))

(assert (=> b!530957 m!511485))

(declare-fun m!511487 () Bool)

(assert (=> b!530957 m!511487))

(declare-fun m!511489 () Bool)

(assert (=> b!530958 m!511489))

(declare-fun m!511491 () Bool)

(assert (=> start!48232 m!511491))

(declare-fun m!511493 () Bool)

(assert (=> start!48232 m!511493))

(declare-fun m!511495 () Bool)

(assert (=> b!530955 m!511495))

(push 1)

(assert (not b!530958))

(assert (not b!530956))

(assert (not b!530955))

(assert (not start!48232))

(assert (not b!530954))

(assert (not b!530957))

(check-sat)

(pop 1)

