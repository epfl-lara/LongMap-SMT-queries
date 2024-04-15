; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32040 () Bool)

(assert start!32040)

(declare-fun b!319531 () Bool)

(declare-fun res!173990 () Bool)

(declare-fun e!198398 () Bool)

(assert (=> b!319531 (=> (not res!173990) (not e!198398))))

(declare-datatypes ((array!16318 0))(
  ( (array!16319 (arr!7721 (Array (_ BitVec 32) (_ BitVec 64))) (size!8074 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16318)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2851 0))(
  ( (MissingZero!2851 (index!13580 (_ BitVec 32))) (Found!2851 (index!13581 (_ BitVec 32))) (Intermediate!2851 (undefined!3663 Bool) (index!13582 (_ BitVec 32)) (x!31864 (_ BitVec 32))) (Undefined!2851) (MissingVacant!2851 (index!13583 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16318 (_ BitVec 32)) SeekEntryResult!2851)

(assert (=> b!319531 (= res!173990 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2851 i!1250)))))

(declare-fun b!319532 () Bool)

(assert (=> b!319532 (= e!198398 false)))

(declare-fun lt!155642 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319532 (= lt!155642 (toIndex!0 k!2497 mask!3777))))

(declare-fun res!173991 () Bool)

(assert (=> start!32040 (=> (not res!173991) (not e!198398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32040 (= res!173991 (validMask!0 mask!3777))))

(assert (=> start!32040 e!198398))

(assert (=> start!32040 true))

(declare-fun array_inv!5693 (array!16318) Bool)

(assert (=> start!32040 (array_inv!5693 a!3305)))

(declare-fun b!319533 () Bool)

(declare-fun res!173993 () Bool)

(assert (=> b!319533 (=> (not res!173993) (not e!198398))))

(declare-fun arrayContainsKey!0 (array!16318 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319533 (= res!173993 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319534 () Bool)

(declare-fun res!173994 () Bool)

(assert (=> b!319534 (=> (not res!173994) (not e!198398))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319534 (= res!173994 (validKeyInArray!0 k!2497))))

(declare-fun b!319535 () Bool)

(declare-fun res!173989 () Bool)

(assert (=> b!319535 (=> (not res!173989) (not e!198398))))

(assert (=> b!319535 (= res!173989 (and (= (size!8074 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8074 a!3305))))))

(declare-fun b!319536 () Bool)

(declare-fun res!173992 () Bool)

(assert (=> b!319536 (=> (not res!173992) (not e!198398))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16318 (_ BitVec 32)) Bool)

(assert (=> b!319536 (= res!173992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32040 res!173991) b!319535))

(assert (= (and b!319535 res!173989) b!319534))

(assert (= (and b!319534 res!173994) b!319533))

(assert (= (and b!319533 res!173993) b!319531))

(assert (= (and b!319531 res!173990) b!319536))

(assert (= (and b!319536 res!173992) b!319532))

(declare-fun m!327581 () Bool)

(assert (=> b!319532 m!327581))

(declare-fun m!327583 () Bool)

(assert (=> b!319536 m!327583))

(declare-fun m!327585 () Bool)

(assert (=> b!319534 m!327585))

(declare-fun m!327587 () Bool)

(assert (=> b!319531 m!327587))

(declare-fun m!327589 () Bool)

(assert (=> start!32040 m!327589))

(declare-fun m!327591 () Bool)

(assert (=> start!32040 m!327591))

(declare-fun m!327593 () Bool)

(assert (=> b!319533 m!327593))

(push 1)

(assert (not b!319534))

(assert (not b!319533))

(assert (not start!32040))

(assert (not b!319531))

(assert (not b!319532))

(assert (not b!319536))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

