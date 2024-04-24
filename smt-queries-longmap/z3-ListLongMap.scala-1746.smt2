; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31982 () Bool)

(assert start!31982)

(declare-fun b!319454 () Bool)

(declare-fun res!173892 () Bool)

(declare-fun e!198401 () Bool)

(assert (=> b!319454 (=> (not res!173892) (not e!198401))))

(declare-datatypes ((array!16302 0))(
  ( (array!16303 (arr!7714 (Array (_ BitVec 32) (_ BitVec 64))) (size!8066 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16302)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2810 0))(
  ( (MissingZero!2810 (index!13416 (_ BitVec 32))) (Found!2810 (index!13417 (_ BitVec 32))) (Intermediate!2810 (undefined!3622 Bool) (index!13418 (_ BitVec 32)) (x!31801 (_ BitVec 32))) (Undefined!2810) (MissingVacant!2810 (index!13419 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16302 (_ BitVec 32)) SeekEntryResult!2810)

(assert (=> b!319454 (= res!173892 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2810 i!1250)))))

(declare-fun res!173888 () Bool)

(assert (=> start!31982 (=> (not res!173888) (not e!198401))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31982 (= res!173888 (validMask!0 mask!3777))))

(assert (=> start!31982 e!198401))

(assert (=> start!31982 true))

(declare-fun array_inv!5664 (array!16302) Bool)

(assert (=> start!31982 (array_inv!5664 a!3305)))

(declare-fun b!319455 () Bool)

(declare-fun res!173891 () Bool)

(assert (=> b!319455 (=> (not res!173891) (not e!198401))))

(assert (=> b!319455 (= res!173891 (and (= (size!8066 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8066 a!3305))))))

(declare-fun b!319456 () Bool)

(assert (=> b!319456 (= e!198401 (bvsgt #b00000000000000000000000000000000 (size!8066 a!3305)))))

(declare-fun b!319457 () Bool)

(declare-fun res!173890 () Bool)

(assert (=> b!319457 (=> (not res!173890) (not e!198401))))

(declare-fun arrayContainsKey!0 (array!16302 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319457 (= res!173890 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319458 () Bool)

(declare-fun res!173889 () Bool)

(assert (=> b!319458 (=> (not res!173889) (not e!198401))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319458 (= res!173889 (validKeyInArray!0 k0!2497))))

(assert (= (and start!31982 res!173888) b!319455))

(assert (= (and b!319455 res!173891) b!319458))

(assert (= (and b!319458 res!173889) b!319457))

(assert (= (and b!319457 res!173890) b!319454))

(assert (= (and b!319454 res!173892) b!319456))

(declare-fun m!328273 () Bool)

(assert (=> b!319454 m!328273))

(declare-fun m!328275 () Bool)

(assert (=> start!31982 m!328275))

(declare-fun m!328277 () Bool)

(assert (=> start!31982 m!328277))

(declare-fun m!328279 () Bool)

(assert (=> b!319457 m!328279))

(declare-fun m!328281 () Bool)

(assert (=> b!319458 m!328281))

(check-sat (not b!319454) (not start!31982) (not b!319457) (not b!319458))
(check-sat)
