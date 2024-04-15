; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31968 () Bool)

(assert start!31968)

(declare-fun b!319146 () Bool)

(declare-fun res!173679 () Bool)

(declare-fun e!198218 () Bool)

(assert (=> b!319146 (=> (not res!173679) (not e!198218))))

(declare-datatypes ((array!16279 0))(
  ( (array!16280 (arr!7703 (Array (_ BitVec 32) (_ BitVec 64))) (size!8056 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16279)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319146 (= res!173679 (and (= (size!8056 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8056 a!3305))))))

(declare-fun b!319147 () Bool)

(declare-fun res!173678 () Bool)

(assert (=> b!319147 (=> (not res!173678) (not e!198218))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319147 (= res!173678 (validKeyInArray!0 k!2497))))

(declare-fun b!319149 () Bool)

(assert (=> b!319149 (= e!198218 false)))

(declare-datatypes ((SeekEntryResult!2833 0))(
  ( (MissingZero!2833 (index!13508 (_ BitVec 32))) (Found!2833 (index!13509 (_ BitVec 32))) (Intermediate!2833 (undefined!3645 Bool) (index!13510 (_ BitVec 32)) (x!31798 (_ BitVec 32))) (Undefined!2833) (MissingVacant!2833 (index!13511 (_ BitVec 32))) )
))
(declare-fun lt!155561 () SeekEntryResult!2833)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16279 (_ BitVec 32)) SeekEntryResult!2833)

(assert (=> b!319149 (= lt!155561 (seekEntryOrOpen!0 k!2497 a!3305 mask!3777))))

(declare-fun b!319148 () Bool)

(declare-fun res!173677 () Bool)

(assert (=> b!319148 (=> (not res!173677) (not e!198218))))

(declare-fun arrayContainsKey!0 (array!16279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319148 (= res!173677 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!173676 () Bool)

(assert (=> start!31968 (=> (not res!173676) (not e!198218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31968 (= res!173676 (validMask!0 mask!3777))))

(assert (=> start!31968 e!198218))

(assert (=> start!31968 true))

(declare-fun array_inv!5675 (array!16279) Bool)

(assert (=> start!31968 (array_inv!5675 a!3305)))

(assert (= (and start!31968 res!173676) b!319146))

(assert (= (and b!319146 res!173679) b!319147))

(assert (= (and b!319147 res!173678) b!319148))

(assert (= (and b!319148 res!173677) b!319149))

(declare-fun m!327297 () Bool)

(assert (=> b!319147 m!327297))

(declare-fun m!327299 () Bool)

(assert (=> b!319149 m!327299))

(declare-fun m!327301 () Bool)

(assert (=> b!319148 m!327301))

(declare-fun m!327303 () Bool)

(assert (=> start!31968 m!327303))

(declare-fun m!327305 () Bool)

(assert (=> start!31968 m!327305))

(push 1)

(assert (not b!319147))

(assert (not b!319149))

(assert (not b!319148))

(assert (not start!31968))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

