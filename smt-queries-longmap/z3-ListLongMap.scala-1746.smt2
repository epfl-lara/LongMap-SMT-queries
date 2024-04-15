; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31982 () Bool)

(assert start!31982)

(declare-fun res!173763 () Bool)

(declare-fun e!198259 () Bool)

(assert (=> start!31982 (=> (not res!173763) (not e!198259))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31982 (= res!173763 (validMask!0 mask!3777))))

(assert (=> start!31982 e!198259))

(assert (=> start!31982 true))

(declare-datatypes ((array!16293 0))(
  ( (array!16294 (arr!7710 (Array (_ BitVec 32) (_ BitVec 64))) (size!8063 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16293)

(declare-fun array_inv!5682 (array!16293) Bool)

(assert (=> start!31982 (array_inv!5682 a!3305)))

(declare-fun b!319232 () Bool)

(declare-fun res!173766 () Bool)

(assert (=> b!319232 (=> (not res!173766) (not e!198259))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2840 0))(
  ( (MissingZero!2840 (index!13536 (_ BitVec 32))) (Found!2840 (index!13537 (_ BitVec 32))) (Intermediate!2840 (undefined!3652 Bool) (index!13538 (_ BitVec 32)) (x!31829 (_ BitVec 32))) (Undefined!2840) (MissingVacant!2840 (index!13539 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16293 (_ BitVec 32)) SeekEntryResult!2840)

(assert (=> b!319232 (= res!173766 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2840 i!1250)))))

(declare-fun b!319233 () Bool)

(declare-fun res!173762 () Bool)

(assert (=> b!319233 (=> (not res!173762) (not e!198259))))

(declare-fun arrayContainsKey!0 (array!16293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319233 (= res!173762 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319234 () Bool)

(declare-fun res!173765 () Bool)

(assert (=> b!319234 (=> (not res!173765) (not e!198259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319234 (= res!173765 (validKeyInArray!0 k0!2497))))

(declare-fun b!319235 () Bool)

(declare-fun res!173764 () Bool)

(assert (=> b!319235 (=> (not res!173764) (not e!198259))))

(assert (=> b!319235 (= res!173764 (and (= (size!8063 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8063 a!3305))))))

(declare-fun b!319236 () Bool)

(assert (=> b!319236 (= e!198259 (bvsgt #b00000000000000000000000000000000 (size!8063 a!3305)))))

(assert (= (and start!31982 res!173763) b!319235))

(assert (= (and b!319235 res!173764) b!319234))

(assert (= (and b!319234 res!173765) b!319233))

(assert (= (and b!319233 res!173762) b!319232))

(assert (= (and b!319232 res!173766) b!319236))

(declare-fun m!327367 () Bool)

(assert (=> start!31982 m!327367))

(declare-fun m!327369 () Bool)

(assert (=> start!31982 m!327369))

(declare-fun m!327371 () Bool)

(assert (=> b!319232 m!327371))

(declare-fun m!327373 () Bool)

(assert (=> b!319233 m!327373))

(declare-fun m!327375 () Bool)

(assert (=> b!319234 m!327375))

(check-sat (not b!319234) (not b!319233) (not b!319232) (not start!31982))
(check-sat)
