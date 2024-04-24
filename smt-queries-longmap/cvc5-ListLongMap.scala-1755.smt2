; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32118 () Bool)

(assert start!32118)

(declare-fun b!320185 () Bool)

(declare-fun res!174478 () Bool)

(declare-fun e!198719 () Bool)

(assert (=> b!320185 (=> (not res!174478) (not e!198719))))

(declare-datatypes ((array!16366 0))(
  ( (array!16367 (arr!7743 (Array (_ BitVec 32) (_ BitVec 64))) (size!8095 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16366)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2839 0))(
  ( (MissingZero!2839 (index!13532 (_ BitVec 32))) (Found!2839 (index!13533 (_ BitVec 32))) (Intermediate!2839 (undefined!3651 Bool) (index!13534 (_ BitVec 32)) (x!31905 (_ BitVec 32))) (Undefined!2839) (MissingVacant!2839 (index!13535 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16366 (_ BitVec 32)) SeekEntryResult!2839)

(assert (=> b!320185 (= res!174478 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2839 i!1250)))))

(declare-fun b!320186 () Bool)

(declare-fun res!174480 () Bool)

(assert (=> b!320186 (=> (not res!174480) (not e!198719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16366 (_ BitVec 32)) Bool)

(assert (=> b!320186 (= res!174480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320187 () Bool)

(assert (=> b!320187 (= e!198719 false)))

(declare-fun lt!156021 () SeekEntryResult!2839)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16366 (_ BitVec 32)) SeekEntryResult!2839)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320187 (= lt!156021 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!320188 () Bool)

(declare-fun res!174481 () Bool)

(assert (=> b!320188 (=> (not res!174481) (not e!198719))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320188 (= res!174481 (validKeyInArray!0 k!2497))))

(declare-fun res!174483 () Bool)

(assert (=> start!32118 (=> (not res!174483) (not e!198719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32118 (= res!174483 (validMask!0 mask!3777))))

(assert (=> start!32118 e!198719))

(assert (=> start!32118 true))

(declare-fun array_inv!5693 (array!16366) Bool)

(assert (=> start!32118 (array_inv!5693 a!3305)))

(declare-fun b!320189 () Bool)

(declare-fun res!174479 () Bool)

(assert (=> b!320189 (=> (not res!174479) (not e!198719))))

(declare-fun arrayContainsKey!0 (array!16366 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320189 (= res!174479 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320190 () Bool)

(declare-fun res!174482 () Bool)

(assert (=> b!320190 (=> (not res!174482) (not e!198719))))

(assert (=> b!320190 (= res!174482 (and (= (size!8095 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8095 a!3305))))))

(assert (= (and start!32118 res!174483) b!320190))

(assert (= (and b!320190 res!174482) b!320188))

(assert (= (and b!320188 res!174481) b!320189))

(assert (= (and b!320189 res!174479) b!320185))

(assert (= (and b!320185 res!174478) b!320186))

(assert (= (and b!320186 res!174480) b!320187))

(declare-fun m!328821 () Bool)

(assert (=> start!32118 m!328821))

(declare-fun m!328823 () Bool)

(assert (=> start!32118 m!328823))

(declare-fun m!328825 () Bool)

(assert (=> b!320187 m!328825))

(assert (=> b!320187 m!328825))

(declare-fun m!328827 () Bool)

(assert (=> b!320187 m!328827))

(declare-fun m!328829 () Bool)

(assert (=> b!320186 m!328829))

(declare-fun m!328831 () Bool)

(assert (=> b!320189 m!328831))

(declare-fun m!328833 () Bool)

(assert (=> b!320188 m!328833))

(declare-fun m!328835 () Bool)

(assert (=> b!320185 m!328835))

(push 1)

(assert (not start!32118))

(assert (not b!320185))

(assert (not b!320186))

(assert (not b!320189))

(assert (not b!320187))

(assert (not b!320188))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

