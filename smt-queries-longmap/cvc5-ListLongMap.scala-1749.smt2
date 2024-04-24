; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32040 () Bool)

(assert start!32040)

(declare-fun b!319754 () Bool)

(declare-fun res!174116 () Bool)

(declare-fun e!198540 () Bool)

(assert (=> b!319754 (=> (not res!174116) (not e!198540))))

(declare-datatypes ((array!16327 0))(
  ( (array!16328 (arr!7725 (Array (_ BitVec 32) (_ BitVec 64))) (size!8077 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16327)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2821 0))(
  ( (MissingZero!2821 (index!13460 (_ BitVec 32))) (Found!2821 (index!13461 (_ BitVec 32))) (Intermediate!2821 (undefined!3633 Bool) (index!13462 (_ BitVec 32)) (x!31836 (_ BitVec 32))) (Undefined!2821) (MissingVacant!2821 (index!13463 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16327 (_ BitVec 32)) SeekEntryResult!2821)

(assert (=> b!319754 (= res!174116 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2821 i!1250)))))

(declare-fun b!319755 () Bool)

(assert (=> b!319755 (= e!198540 false)))

(declare-fun lt!155895 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319755 (= lt!155895 (toIndex!0 k!2497 mask!3777))))

(declare-fun b!319756 () Bool)

(declare-fun res!174117 () Bool)

(assert (=> b!319756 (=> (not res!174117) (not e!198540))))

(declare-fun arrayContainsKey!0 (array!16327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319756 (= res!174117 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319753 () Bool)

(declare-fun res!174119 () Bool)

(assert (=> b!319753 (=> (not res!174119) (not e!198540))))

(assert (=> b!319753 (= res!174119 (and (= (size!8077 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8077 a!3305))))))

(declare-fun res!174120 () Bool)

(assert (=> start!32040 (=> (not res!174120) (not e!198540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32040 (= res!174120 (validMask!0 mask!3777))))

(assert (=> start!32040 e!198540))

(assert (=> start!32040 true))

(declare-fun array_inv!5675 (array!16327) Bool)

(assert (=> start!32040 (array_inv!5675 a!3305)))

(declare-fun b!319757 () Bool)

(declare-fun res!174118 () Bool)

(assert (=> b!319757 (=> (not res!174118) (not e!198540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16327 (_ BitVec 32)) Bool)

(assert (=> b!319757 (= res!174118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!319758 () Bool)

(declare-fun res!174115 () Bool)

(assert (=> b!319758 (=> (not res!174115) (not e!198540))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319758 (= res!174115 (validKeyInArray!0 k!2497))))

(assert (= (and start!32040 res!174120) b!319753))

(assert (= (and b!319753 res!174119) b!319758))

(assert (= (and b!319758 res!174115) b!319756))

(assert (= (and b!319756 res!174117) b!319754))

(assert (= (and b!319754 res!174116) b!319757))

(assert (= (and b!319757 res!174118) b!319755))

(declare-fun m!328487 () Bool)

(assert (=> b!319758 m!328487))

(declare-fun m!328489 () Bool)

(assert (=> b!319757 m!328489))

(declare-fun m!328491 () Bool)

(assert (=> b!319755 m!328491))

(declare-fun m!328493 () Bool)

(assert (=> b!319756 m!328493))

(declare-fun m!328495 () Bool)

(assert (=> start!32040 m!328495))

(declare-fun m!328497 () Bool)

(assert (=> start!32040 m!328497))

(declare-fun m!328499 () Bool)

(assert (=> b!319754 m!328499))

(push 1)

(assert (not b!319756))

(assert (not b!319757))

(assert (not b!319754))

(assert (not start!32040))

(assert (not b!319755))

(assert (not b!319758))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

