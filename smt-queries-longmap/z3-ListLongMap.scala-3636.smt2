; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50194 () Bool)

(assert start!50194)

(declare-fun b!549381 () Bool)

(declare-fun res!342530 () Bool)

(declare-fun e!317318 () Bool)

(assert (=> b!549381 (=> (not res!342530) (not e!317318))))

(declare-datatypes ((array!34647 0))(
  ( (array!34648 (arr!16639 (Array (_ BitVec 32) (_ BitVec 64))) (size!17003 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34647)

(declare-datatypes ((List!10719 0))(
  ( (Nil!10716) (Cons!10715 (h!11688 (_ BitVec 64)) (t!16947 List!10719)) )
))
(declare-fun arrayNoDuplicates!0 (array!34647 (_ BitVec 32) List!10719) Bool)

(assert (=> b!549381 (= res!342530 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10716))))

(declare-fun b!549382 () Bool)

(declare-fun res!342529 () Bool)

(declare-fun e!317317 () Bool)

(assert (=> b!549382 (=> (not res!342529) (not e!317317))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549382 (= res!342529 (validKeyInArray!0 (select (arr!16639 a!3118) j!142)))))

(declare-fun e!317316 () Bool)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun b!549383 () Bool)

(assert (=> b!549383 (= e!317316 (not (validKeyInArray!0 (select (store (arr!16639 a!3118) i!1132 k0!1914) j!142))))))

(declare-fun b!549384 () Bool)

(assert (=> b!549384 (= e!317318 e!317316)))

(declare-fun res!342525 () Bool)

(assert (=> b!549384 (=> (not res!342525) (not e!317316))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!250107 () (_ BitVec 32))

(assert (=> b!549384 (= res!342525 (and (bvsge mask!3119 #b00000000000000000000000000000000) (bvsge lt!250107 #b00000000000000000000000000000000) (bvslt lt!250107 (bvadd #b00000000000000000000000000000001 mask!3119))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549384 (= lt!250107 (toIndex!0 (select (store (arr!16639 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(declare-fun b!549385 () Bool)

(declare-fun res!342528 () Bool)

(assert (=> b!549385 (=> (not res!342528) (not e!317317))))

(declare-fun arrayContainsKey!0 (array!34647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549385 (= res!342528 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549386 () Bool)

(assert (=> b!549386 (= e!317317 e!317318)))

(declare-fun res!342531 () Bool)

(assert (=> b!549386 (=> (not res!342531) (not e!317318))))

(declare-datatypes ((SeekEntryResult!5088 0))(
  ( (MissingZero!5088 (index!22579 (_ BitVec 32))) (Found!5088 (index!22580 (_ BitVec 32))) (Intermediate!5088 (undefined!5900 Bool) (index!22581 (_ BitVec 32)) (x!51514 (_ BitVec 32))) (Undefined!5088) (MissingVacant!5088 (index!22582 (_ BitVec 32))) )
))
(declare-fun lt!250108 () SeekEntryResult!5088)

(assert (=> b!549386 (= res!342531 (or (= lt!250108 (MissingZero!5088 i!1132)) (= lt!250108 (MissingVacant!5088 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34647 (_ BitVec 32)) SeekEntryResult!5088)

(assert (=> b!549386 (= lt!250108 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549387 () Bool)

(declare-fun res!342532 () Bool)

(assert (=> b!549387 (=> (not res!342532) (not e!317318))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34647 (_ BitVec 32)) Bool)

(assert (=> b!549387 (= res!342532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549388 () Bool)

(declare-fun res!342527 () Bool)

(assert (=> b!549388 (=> (not res!342527) (not e!317317))))

(assert (=> b!549388 (= res!342527 (validKeyInArray!0 k0!1914))))

(declare-fun res!342533 () Bool)

(assert (=> start!50194 (=> (not res!342533) (not e!317317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50194 (= res!342533 (validMask!0 mask!3119))))

(assert (=> start!50194 e!317317))

(assert (=> start!50194 true))

(declare-fun array_inv!12435 (array!34647) Bool)

(assert (=> start!50194 (array_inv!12435 a!3118)))

(declare-fun b!549389 () Bool)

(declare-fun res!342526 () Bool)

(assert (=> b!549389 (=> (not res!342526) (not e!317317))))

(assert (=> b!549389 (= res!342526 (and (= (size!17003 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17003 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17003 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50194 res!342533) b!549389))

(assert (= (and b!549389 res!342526) b!549382))

(assert (= (and b!549382 res!342529) b!549388))

(assert (= (and b!549388 res!342527) b!549385))

(assert (= (and b!549385 res!342528) b!549386))

(assert (= (and b!549386 res!342531) b!549387))

(assert (= (and b!549387 res!342532) b!549381))

(assert (= (and b!549381 res!342530) b!549384))

(assert (= (and b!549384 res!342525) b!549383))

(declare-fun m!526229 () Bool)

(assert (=> b!549386 m!526229))

(declare-fun m!526231 () Bool)

(assert (=> b!549387 m!526231))

(declare-fun m!526233 () Bool)

(assert (=> b!549384 m!526233))

(declare-fun m!526235 () Bool)

(assert (=> b!549384 m!526235))

(assert (=> b!549384 m!526235))

(declare-fun m!526237 () Bool)

(assert (=> b!549384 m!526237))

(assert (=> b!549383 m!526233))

(assert (=> b!549383 m!526235))

(assert (=> b!549383 m!526235))

(declare-fun m!526239 () Bool)

(assert (=> b!549383 m!526239))

(declare-fun m!526241 () Bool)

(assert (=> b!549388 m!526241))

(declare-fun m!526243 () Bool)

(assert (=> b!549381 m!526243))

(declare-fun m!526245 () Bool)

(assert (=> b!549385 m!526245))

(declare-fun m!526247 () Bool)

(assert (=> b!549382 m!526247))

(assert (=> b!549382 m!526247))

(declare-fun m!526249 () Bool)

(assert (=> b!549382 m!526249))

(declare-fun m!526251 () Bool)

(assert (=> start!50194 m!526251))

(declare-fun m!526253 () Bool)

(assert (=> start!50194 m!526253))

(check-sat (not b!549386) (not b!549384) (not b!549383) (not b!549381) (not start!50194) (not b!549388) (not b!549387) (not b!549382) (not b!549385))
(check-sat)
