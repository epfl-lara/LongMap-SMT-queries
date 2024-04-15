; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32130 () Bool)

(assert start!32130)

(declare-fun b!320080 () Bool)

(declare-fun res!174474 () Bool)

(declare-fun e!198614 () Bool)

(assert (=> b!320080 (=> (not res!174474) (not e!198614))))

(declare-datatypes ((array!16369 0))(
  ( (array!16370 (arr!7745 (Array (_ BitVec 32) (_ BitVec 64))) (size!8098 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16369)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16369 (_ BitVec 32)) Bool)

(assert (=> b!320080 (= res!174474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320082 () Bool)

(declare-fun res!174473 () Bool)

(assert (=> b!320082 (=> (not res!174473) (not e!198614))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2875 0))(
  ( (MissingZero!2875 (index!13676 (_ BitVec 32))) (Found!2875 (index!13677 (_ BitVec 32))) (Intermediate!2875 (undefined!3687 Bool) (index!13678 (_ BitVec 32)) (x!31955 (_ BitVec 32))) (Undefined!2875) (MissingVacant!2875 (index!13679 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16369 (_ BitVec 32)) SeekEntryResult!2875)

(assert (=> b!320082 (= res!174473 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2875 i!1250)))))

(declare-fun b!320083 () Bool)

(declare-fun res!174472 () Bool)

(assert (=> b!320083 (=> (not res!174472) (not e!198614))))

(declare-fun arrayContainsKey!0 (array!16369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320083 (= res!174472 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320084 () Bool)

(declare-fun res!174469 () Bool)

(assert (=> b!320084 (=> (not res!174469) (not e!198614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320084 (= res!174469 (validKeyInArray!0 k!2497))))

(declare-fun b!320085 () Bool)

(assert (=> b!320085 (= e!198614 false)))

(declare-fun lt!155777 () SeekEntryResult!2875)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16369 (_ BitVec 32)) SeekEntryResult!2875)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320085 (= lt!155777 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!320081 () Bool)

(declare-fun res!174471 () Bool)

(assert (=> b!320081 (=> (not res!174471) (not e!198614))))

(assert (=> b!320081 (= res!174471 (and (= (size!8098 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8098 a!3305))))))

(declare-fun res!174470 () Bool)

(assert (=> start!32130 (=> (not res!174470) (not e!198614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32130 (= res!174470 (validMask!0 mask!3777))))

(assert (=> start!32130 e!198614))

(assert (=> start!32130 true))

(declare-fun array_inv!5717 (array!16369) Bool)

(assert (=> start!32130 (array_inv!5717 a!3305)))

(assert (= (and start!32130 res!174470) b!320081))

(assert (= (and b!320081 res!174471) b!320084))

(assert (= (and b!320084 res!174469) b!320083))

(assert (= (and b!320083 res!174472) b!320082))

(assert (= (and b!320082 res!174473) b!320080))

(assert (= (and b!320080 res!174474) b!320085))

(declare-fun m!328017 () Bool)

(assert (=> start!32130 m!328017))

(declare-fun m!328019 () Bool)

(assert (=> start!32130 m!328019))

(declare-fun m!328021 () Bool)

(assert (=> b!320084 m!328021))

(declare-fun m!328023 () Bool)

(assert (=> b!320083 m!328023))

(declare-fun m!328025 () Bool)

(assert (=> b!320082 m!328025))

(declare-fun m!328027 () Bool)

(assert (=> b!320085 m!328027))

(assert (=> b!320085 m!328027))

(declare-fun m!328029 () Bool)

(assert (=> b!320085 m!328029))

(declare-fun m!328031 () Bool)

(assert (=> b!320080 m!328031))

(push 1)

(assert (not b!320084))

(assert (not b!320082))

(assert (not b!320083))

(assert (not b!320085))

(assert (not start!32130))

(assert (not b!320080))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

