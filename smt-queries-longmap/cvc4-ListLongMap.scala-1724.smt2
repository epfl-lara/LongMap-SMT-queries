; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31800 () Bool)

(assert start!31800)

(declare-fun b!317642 () Bool)

(declare-fun res!172227 () Bool)

(declare-fun e!197469 () Bool)

(assert (=> b!317642 (=> (not res!172227) (not e!197469))))

(declare-datatypes ((array!16171 0))(
  ( (array!16172 (arr!7651 (Array (_ BitVec 32) (_ BitVec 64))) (size!8003 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16171)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2791 0))(
  ( (MissingZero!2791 (index!13340 (_ BitVec 32))) (Found!2791 (index!13341 (_ BitVec 32))) (Intermediate!2791 (undefined!3603 Bool) (index!13342 (_ BitVec 32)) (x!31600 (_ BitVec 32))) (Undefined!2791) (MissingVacant!2791 (index!13343 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16171 (_ BitVec 32)) SeekEntryResult!2791)

(assert (=> b!317642 (= res!172227 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2791 i!1240)))))

(declare-fun b!317644 () Bool)

(declare-fun res!172229 () Bool)

(assert (=> b!317644 (=> (not res!172229) (not e!197469))))

(declare-fun arrayContainsKey!0 (array!16171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317644 (= res!172229 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317645 () Bool)

(declare-fun e!197470 () Bool)

(assert (=> b!317645 (= e!197470 (not true))))

(declare-fun e!197466 () Bool)

(assert (=> b!317645 e!197466))

(declare-fun res!172225 () Bool)

(assert (=> b!317645 (=> (not res!172225) (not e!197466))))

(declare-fun lt!155031 () (_ BitVec 32))

(declare-fun lt!155034 () SeekEntryResult!2791)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16171 (_ BitVec 32)) SeekEntryResult!2791)

(assert (=> b!317645 (= res!172225 (= lt!155034 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155031 k!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317645 (= lt!155031 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!317646 () Bool)

(declare-fun res!172224 () Bool)

(assert (=> b!317646 (=> (not res!172224) (not e!197469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16171 (_ BitVec 32)) Bool)

(assert (=> b!317646 (= res!172224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317647 () Bool)

(declare-fun e!197467 () Bool)

(assert (=> b!317647 (= e!197467 e!197470)))

(declare-fun res!172226 () Bool)

(assert (=> b!317647 (=> (not res!172226) (not e!197470))))

(declare-fun lt!155033 () SeekEntryResult!2791)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!317647 (= res!172226 (and (= lt!155034 lt!155033) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7651 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!317647 (= lt!155034 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!317648 () Bool)

(declare-fun lt!155032 () array!16171)

(assert (=> b!317648 (= e!197466 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155032 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155031 k!2441 lt!155032 mask!3709)))))

(assert (=> b!317648 (= lt!155032 (array!16172 (store (arr!7651 a!3293) i!1240 k!2441) (size!8003 a!3293)))))

(declare-fun b!317649 () Bool)

(assert (=> b!317649 (= e!197469 e!197467)))

(declare-fun res!172230 () Bool)

(assert (=> b!317649 (=> (not res!172230) (not e!197467))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317649 (= res!172230 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155033))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!317649 (= lt!155033 (Intermediate!2791 false resIndex!52 resX!52))))

(declare-fun res!172223 () Bool)

(assert (=> start!31800 (=> (not res!172223) (not e!197469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31800 (= res!172223 (validMask!0 mask!3709))))

(assert (=> start!31800 e!197469))

(declare-fun array_inv!5614 (array!16171) Bool)

(assert (=> start!31800 (array_inv!5614 a!3293)))

(assert (=> start!31800 true))

(declare-fun b!317643 () Bool)

(declare-fun res!172221 () Bool)

(assert (=> b!317643 (=> (not res!172221) (not e!197467))))

(assert (=> b!317643 (= res!172221 (and (= (select (arr!7651 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8003 a!3293))))))

(declare-fun b!317650 () Bool)

(declare-fun res!172222 () Bool)

(assert (=> b!317650 (=> (not res!172222) (not e!197469))))

(assert (=> b!317650 (= res!172222 (and (= (size!8003 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8003 a!3293))))))

(declare-fun b!317651 () Bool)

(declare-fun res!172228 () Bool)

(assert (=> b!317651 (=> (not res!172228) (not e!197469))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317651 (= res!172228 (validKeyInArray!0 k!2441))))

(assert (= (and start!31800 res!172223) b!317650))

(assert (= (and b!317650 res!172222) b!317651))

(assert (= (and b!317651 res!172228) b!317644))

(assert (= (and b!317644 res!172229) b!317642))

(assert (= (and b!317642 res!172227) b!317646))

(assert (= (and b!317646 res!172224) b!317649))

(assert (= (and b!317649 res!172230) b!317643))

(assert (= (and b!317643 res!172221) b!317647))

(assert (= (and b!317647 res!172226) b!317645))

(assert (= (and b!317645 res!172225) b!317648))

(declare-fun m!326289 () Bool)

(assert (=> b!317646 m!326289))

(declare-fun m!326291 () Bool)

(assert (=> b!317651 m!326291))

(declare-fun m!326293 () Bool)

(assert (=> b!317644 m!326293))

(declare-fun m!326295 () Bool)

(assert (=> b!317645 m!326295))

(declare-fun m!326297 () Bool)

(assert (=> b!317645 m!326297))

(declare-fun m!326299 () Bool)

(assert (=> b!317649 m!326299))

(assert (=> b!317649 m!326299))

(declare-fun m!326301 () Bool)

(assert (=> b!317649 m!326301))

(declare-fun m!326303 () Bool)

(assert (=> b!317642 m!326303))

(declare-fun m!326305 () Bool)

(assert (=> b!317648 m!326305))

(declare-fun m!326307 () Bool)

(assert (=> b!317648 m!326307))

(declare-fun m!326309 () Bool)

(assert (=> b!317648 m!326309))

(declare-fun m!326311 () Bool)

(assert (=> b!317643 m!326311))

(declare-fun m!326313 () Bool)

(assert (=> start!31800 m!326313))

(declare-fun m!326315 () Bool)

(assert (=> start!31800 m!326315))

(declare-fun m!326317 () Bool)

(assert (=> b!317647 m!326317))

(declare-fun m!326319 () Bool)

(assert (=> b!317647 m!326319))

(push 1)

(assert (not b!317646))

(assert (not b!317648))

(assert (not start!31800))

(assert (not b!317647))

(assert (not b!317644))

(assert (not b!317651))

(assert (not b!317649))

(assert (not b!317645))

