; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31980 () Bool)

(assert start!31980)

(declare-fun b!319442 () Bool)

(declare-fun res!173877 () Bool)

(declare-fun e!198395 () Bool)

(assert (=> b!319442 (=> (not res!173877) (not e!198395))))

(declare-datatypes ((array!16300 0))(
  ( (array!16301 (arr!7713 (Array (_ BitVec 32) (_ BitVec 64))) (size!8065 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16300)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16300 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319442 (= res!173877 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!173874 () Bool)

(assert (=> start!31980 (=> (not res!173874) (not e!198395))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31980 (= res!173874 (validMask!0 mask!3777))))

(assert (=> start!31980 e!198395))

(assert (=> start!31980 true))

(declare-fun array_inv!5663 (array!16300) Bool)

(assert (=> start!31980 (array_inv!5663 a!3305)))

(declare-fun b!319440 () Bool)

(declare-fun res!173876 () Bool)

(assert (=> b!319440 (=> (not res!173876) (not e!198395))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319440 (= res!173876 (and (= (size!8065 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8065 a!3305))))))

(declare-fun b!319441 () Bool)

(declare-fun res!173875 () Bool)

(assert (=> b!319441 (=> (not res!173875) (not e!198395))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319441 (= res!173875 (validKeyInArray!0 k!2497))))

(declare-fun b!319443 () Bool)

(assert (=> b!319443 (= e!198395 false)))

(declare-datatypes ((SeekEntryResult!2809 0))(
  ( (MissingZero!2809 (index!13412 (_ BitVec 32))) (Found!2809 (index!13413 (_ BitVec 32))) (Intermediate!2809 (undefined!3621 Bool) (index!13414 (_ BitVec 32)) (x!31792 (_ BitVec 32))) (Undefined!2809) (MissingVacant!2809 (index!13415 (_ BitVec 32))) )
))
(declare-fun lt!155832 () SeekEntryResult!2809)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16300 (_ BitVec 32)) SeekEntryResult!2809)

(assert (=> b!319443 (= lt!155832 (seekEntryOrOpen!0 k!2497 a!3305 mask!3777))))

(assert (= (and start!31980 res!173874) b!319440))

(assert (= (and b!319440 res!173876) b!319441))

(assert (= (and b!319441 res!173875) b!319442))

(assert (= (and b!319442 res!173877) b!319443))

(declare-fun m!328263 () Bool)

(assert (=> b!319442 m!328263))

(declare-fun m!328265 () Bool)

(assert (=> start!31980 m!328265))

(declare-fun m!328267 () Bool)

(assert (=> start!31980 m!328267))

(declare-fun m!328269 () Bool)

(assert (=> b!319441 m!328269))

(declare-fun m!328271 () Bool)

(assert (=> b!319443 m!328271))

(push 1)

(assert (not b!319441))

(assert (not b!319442))

(assert (not start!31980))

(assert (not b!319443))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

