; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31982 () Bool)

(assert start!31982)

(declare-fun res!173808 () Bool)

(declare-fun e!198393 () Bool)

(assert (=> start!31982 (=> (not res!173808) (not e!198393))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31982 (= res!173808 (validMask!0 mask!3777))))

(assert (=> start!31982 e!198393))

(assert (=> start!31982 true))

(declare-datatypes ((array!16289 0))(
  ( (array!16290 (arr!7708 (Array (_ BitVec 32) (_ BitVec 64))) (size!8060 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16289)

(declare-fun array_inv!5671 (array!16289) Bool)

(assert (=> start!31982 (array_inv!5671 a!3305)))

(declare-fun b!319422 () Bool)

(declare-fun res!173805 () Bool)

(assert (=> b!319422 (=> (not res!173805) (not e!198393))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319422 (= res!173805 (validKeyInArray!0 k!2497))))

(declare-fun b!319421 () Bool)

(declare-fun res!173807 () Bool)

(assert (=> b!319421 (=> (not res!173807) (not e!198393))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319421 (= res!173807 (and (= (size!8060 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8060 a!3305))))))

(declare-fun b!319424 () Bool)

(assert (=> b!319424 (= e!198393 false)))

(declare-datatypes ((SeekEntryResult!2839 0))(
  ( (MissingZero!2839 (index!13532 (_ BitVec 32))) (Found!2839 (index!13533 (_ BitVec 32))) (Intermediate!2839 (undefined!3651 Bool) (index!13534 (_ BitVec 32)) (x!31809 (_ BitVec 32))) (Undefined!2839) (MissingVacant!2839 (index!13535 (_ BitVec 32))) )
))
(declare-fun lt!155796 () SeekEntryResult!2839)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16289 (_ BitVec 32)) SeekEntryResult!2839)

(assert (=> b!319424 (= lt!155796 (seekEntryOrOpen!0 k!2497 a!3305 mask!3777))))

(declare-fun b!319423 () Bool)

(declare-fun res!173806 () Bool)

(assert (=> b!319423 (=> (not res!173806) (not e!198393))))

(declare-fun arrayContainsKey!0 (array!16289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319423 (= res!173806 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!31982 res!173808) b!319421))

(assert (= (and b!319421 res!173807) b!319422))

(assert (= (and b!319422 res!173805) b!319423))

(assert (= (and b!319423 res!173806) b!319424))

(declare-fun m!328027 () Bool)

(assert (=> start!31982 m!328027))

(declare-fun m!328029 () Bool)

(assert (=> start!31982 m!328029))

(declare-fun m!328031 () Bool)

(assert (=> b!319422 m!328031))

(declare-fun m!328033 () Bool)

(assert (=> b!319424 m!328033))

(declare-fun m!328035 () Bool)

(assert (=> b!319423 m!328035))

(push 1)

(assert (not b!319424))

(assert (not b!319423))

(assert (not start!31982))

(assert (not b!319422))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

