; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31988 () Bool)

(assert start!31988)

(declare-fun b!319279 () Bool)

(declare-fun e!198277 () Bool)

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!319279 (= e!198277 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-fun b!319280 () Bool)

(declare-fun res!173810 () Bool)

(assert (=> b!319280 (=> (not res!173810) (not e!198277))))

(declare-datatypes ((array!16299 0))(
  ( (array!16300 (arr!7713 (Array (_ BitVec 32) (_ BitVec 64))) (size!8066 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16299)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2843 0))(
  ( (MissingZero!2843 (index!13548 (_ BitVec 32))) (Found!2843 (index!13549 (_ BitVec 32))) (Intermediate!2843 (undefined!3655 Bool) (index!13550 (_ BitVec 32)) (x!31840 (_ BitVec 32))) (Undefined!2843) (MissingVacant!2843 (index!13551 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16299 (_ BitVec 32)) SeekEntryResult!2843)

(assert (=> b!319280 (= res!173810 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2843 i!1250)))))

(declare-fun b!319281 () Bool)

(declare-fun res!173809 () Bool)

(assert (=> b!319281 (=> (not res!173809) (not e!198277))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319281 (= res!173809 (validKeyInArray!0 k0!2497))))

(declare-fun b!319282 () Bool)

(declare-fun res!173812 () Bool)

(assert (=> b!319282 (=> (not res!173812) (not e!198277))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16299 (_ BitVec 32)) Bool)

(assert (=> b!319282 (= res!173812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!319283 () Bool)

(declare-fun res!173813 () Bool)

(assert (=> b!319283 (=> (not res!173813) (not e!198277))))

(declare-fun arrayContainsKey!0 (array!16299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319283 (= res!173813 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun res!173814 () Bool)

(assert (=> start!31988 (=> (not res!173814) (not e!198277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31988 (= res!173814 (validMask!0 mask!3777))))

(assert (=> start!31988 e!198277))

(assert (=> start!31988 true))

(declare-fun array_inv!5685 (array!16299) Bool)

(assert (=> start!31988 (array_inv!5685 a!3305)))

(declare-fun b!319284 () Bool)

(declare-fun res!173811 () Bool)

(assert (=> b!319284 (=> (not res!173811) (not e!198277))))

(assert (=> b!319284 (= res!173811 (and (= (size!8066 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8066 a!3305))))))

(assert (= (and start!31988 res!173814) b!319284))

(assert (= (and b!319284 res!173811) b!319281))

(assert (= (and b!319281 res!173809) b!319283))

(assert (= (and b!319283 res!173813) b!319280))

(assert (= (and b!319280 res!173810) b!319282))

(assert (= (and b!319282 res!173812) b!319279))

(declare-fun m!327397 () Bool)

(assert (=> b!319281 m!327397))

(declare-fun m!327399 () Bool)

(assert (=> b!319280 m!327399))

(declare-fun m!327401 () Bool)

(assert (=> b!319282 m!327401))

(declare-fun m!327403 () Bool)

(assert (=> b!319283 m!327403))

(declare-fun m!327405 () Bool)

(assert (=> start!31988 m!327405))

(declare-fun m!327407 () Bool)

(assert (=> start!31988 m!327407))

(check-sat (not start!31988) (not b!319283) (not b!319280) (not b!319281) (not b!319282))
(check-sat)
