; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31980 () Bool)

(assert start!31980)

(declare-fun res!173794 () Bool)

(declare-fun e!198388 () Bool)

(assert (=> start!31980 (=> (not res!173794) (not e!198388))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31980 (= res!173794 (validMask!0 mask!3777))))

(assert (=> start!31980 e!198388))

(assert (=> start!31980 true))

(declare-datatypes ((array!16287 0))(
  ( (array!16288 (arr!7707 (Array (_ BitVec 32) (_ BitVec 64))) (size!8059 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16287)

(declare-fun array_inv!5670 (array!16287) Bool)

(assert (=> start!31980 (array_inv!5670 a!3305)))

(declare-fun b!319409 () Bool)

(declare-fun res!173796 () Bool)

(assert (=> b!319409 (=> (not res!173796) (not e!198388))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319409 (= res!173796 (and (= (size!8059 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8059 a!3305))))))

(declare-fun b!319412 () Bool)

(assert (=> b!319412 (= e!198388 false)))

(declare-datatypes ((SeekEntryResult!2838 0))(
  ( (MissingZero!2838 (index!13528 (_ BitVec 32))) (Found!2838 (index!13529 (_ BitVec 32))) (Intermediate!2838 (undefined!3650 Bool) (index!13530 (_ BitVec 32)) (x!31808 (_ BitVec 32))) (Undefined!2838) (MissingVacant!2838 (index!13531 (_ BitVec 32))) )
))
(declare-fun lt!155793 () SeekEntryResult!2838)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16287 (_ BitVec 32)) SeekEntryResult!2838)

(assert (=> b!319412 (= lt!155793 (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777))))

(declare-fun b!319410 () Bool)

(declare-fun res!173795 () Bool)

(assert (=> b!319410 (=> (not res!173795) (not e!198388))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319410 (= res!173795 (validKeyInArray!0 k0!2497))))

(declare-fun b!319411 () Bool)

(declare-fun res!173793 () Bool)

(assert (=> b!319411 (=> (not res!173793) (not e!198388))))

(declare-fun arrayContainsKey!0 (array!16287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319411 (= res!173793 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!31980 res!173794) b!319409))

(assert (= (and b!319409 res!173796) b!319410))

(assert (= (and b!319410 res!173795) b!319411))

(assert (= (and b!319411 res!173793) b!319412))

(declare-fun m!328017 () Bool)

(assert (=> start!31980 m!328017))

(declare-fun m!328019 () Bool)

(assert (=> start!31980 m!328019))

(declare-fun m!328021 () Bool)

(assert (=> b!319412 m!328021))

(declare-fun m!328023 () Bool)

(assert (=> b!319410 m!328023))

(declare-fun m!328025 () Bool)

(assert (=> b!319411 m!328025))

(check-sat (not b!319411) (not start!31980) (not b!319412) (not b!319410))
