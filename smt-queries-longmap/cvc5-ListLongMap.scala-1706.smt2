; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31370 () Bool)

(assert start!31370)

(declare-fun b!314392 () Bool)

(declare-fun res!170148 () Bool)

(declare-fun e!195834 () Bool)

(assert (=> b!314392 (=> (not res!170148) (not e!195834))))

(declare-datatypes ((array!16041 0))(
  ( (array!16042 (arr!7595 (Array (_ BitVec 32) (_ BitVec 64))) (size!7947 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16041)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!314392 (= res!170148 (and (= (size!7947 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7947 a!3293))))))

(declare-fun b!314393 () Bool)

(declare-fun res!170144 () Bool)

(assert (=> b!314393 (=> (not res!170144) (not e!195834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16041 (_ BitVec 32)) Bool)

(assert (=> b!314393 (= res!170144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!170142 () Bool)

(assert (=> start!31370 (=> (not res!170142) (not e!195834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31370 (= res!170142 (validMask!0 mask!3709))))

(assert (=> start!31370 e!195834))

(declare-fun array_inv!5558 (array!16041) Bool)

(assert (=> start!31370 (array_inv!5558 a!3293)))

(assert (=> start!31370 true))

(declare-fun b!314394 () Bool)

(declare-fun res!170141 () Bool)

(assert (=> b!314394 (=> (not res!170141) (not e!195834))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2735 0))(
  ( (MissingZero!2735 (index!13116 (_ BitVec 32))) (Found!2735 (index!13117 (_ BitVec 32))) (Intermediate!2735 (undefined!3547 Bool) (index!13118 (_ BitVec 32)) (x!31349 (_ BitVec 32))) (Undefined!2735) (MissingVacant!2735 (index!13119 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16041 (_ BitVec 32)) SeekEntryResult!2735)

(assert (=> b!314394 (= res!170141 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2735 i!1240)))))

(declare-fun b!314395 () Bool)

(declare-fun res!170143 () Bool)

(assert (=> b!314395 (=> (not res!170143) (not e!195834))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16041 (_ BitVec 32)) SeekEntryResult!2735)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314395 (= res!170143 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2735 false resIndex!52 resX!52)))))

(declare-fun b!314396 () Bool)

(declare-fun res!170145 () Bool)

(assert (=> b!314396 (=> (not res!170145) (not e!195834))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!314396 (= res!170145 (and (= (select (arr!7595 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7947 a!3293))))))

(declare-fun b!314397 () Bool)

(assert (=> b!314397 (= e!195834 false)))

(declare-fun lt!153900 () SeekEntryResult!2735)

(assert (=> b!314397 (= lt!153900 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!314398 () Bool)

(declare-fun res!170147 () Bool)

(assert (=> b!314398 (=> (not res!170147) (not e!195834))))

(declare-fun arrayContainsKey!0 (array!16041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314398 (= res!170147 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!314399 () Bool)

(declare-fun res!170146 () Bool)

(assert (=> b!314399 (=> (not res!170146) (not e!195834))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314399 (= res!170146 (validKeyInArray!0 k!2441))))

(assert (= (and start!31370 res!170142) b!314392))

(assert (= (and b!314392 res!170148) b!314399))

(assert (= (and b!314399 res!170146) b!314398))

(assert (= (and b!314398 res!170147) b!314394))

(assert (= (and b!314394 res!170141) b!314393))

(assert (= (and b!314393 res!170144) b!314395))

(assert (= (and b!314395 res!170143) b!314396))

(assert (= (and b!314396 res!170145) b!314397))

(declare-fun m!323957 () Bool)

(assert (=> b!314399 m!323957))

(declare-fun m!323959 () Bool)

(assert (=> b!314397 m!323959))

(declare-fun m!323961 () Bool)

(assert (=> b!314398 m!323961))

(declare-fun m!323963 () Bool)

(assert (=> b!314394 m!323963))

(declare-fun m!323965 () Bool)

(assert (=> start!31370 m!323965))

(declare-fun m!323967 () Bool)

(assert (=> start!31370 m!323967))

(declare-fun m!323969 () Bool)

(assert (=> b!314393 m!323969))

(declare-fun m!323971 () Bool)

(assert (=> b!314396 m!323971))

(declare-fun m!323973 () Bool)

(assert (=> b!314395 m!323973))

(assert (=> b!314395 m!323973))

(declare-fun m!323975 () Bool)

(assert (=> b!314395 m!323975))

(push 1)

(assert (not b!314398))

(assert (not b!314395))

(assert (not b!314394))

(assert (not b!314393))

(assert (not b!314399))

(assert (not b!314397))

(assert (not start!31370))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

