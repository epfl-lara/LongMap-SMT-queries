; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31998 () Bool)

(assert start!31998)

(declare-fun res!173906 () Bool)

(declare-fun e!198442 () Bool)

(assert (=> start!31998 (=> (not res!173906) (not e!198442))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31998 (= res!173906 (validMask!0 mask!3777))))

(assert (=> start!31998 e!198442))

(assert (=> start!31998 true))

(declare-datatypes ((array!16305 0))(
  ( (array!16306 (arr!7716 (Array (_ BitVec 32) (_ BitVec 64))) (size!8068 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16305)

(declare-fun array_inv!5679 (array!16305) Bool)

(assert (=> start!31998 (array_inv!5679 a!3305)))

(declare-fun b!319522 () Bool)

(declare-fun res!173910 () Bool)

(assert (=> b!319522 (=> (not res!173910) (not e!198442))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319522 (= res!173910 (validKeyInArray!0 k0!2497))))

(declare-fun b!319523 () Bool)

(declare-fun res!173907 () Bool)

(assert (=> b!319523 (=> (not res!173907) (not e!198442))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319523 (= res!173907 (and (= (size!8068 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8068 a!3305))))))

(declare-fun b!319524 () Bool)

(declare-fun res!173908 () Bool)

(assert (=> b!319524 (=> (not res!173908) (not e!198442))))

(declare-datatypes ((SeekEntryResult!2847 0))(
  ( (MissingZero!2847 (index!13564 (_ BitVec 32))) (Found!2847 (index!13565 (_ BitVec 32))) (Intermediate!2847 (undefined!3659 Bool) (index!13566 (_ BitVec 32)) (x!31841 (_ BitVec 32))) (Undefined!2847) (MissingVacant!2847 (index!13567 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16305 (_ BitVec 32)) SeekEntryResult!2847)

(assert (=> b!319524 (= res!173908 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2847 i!1250)))))

(declare-fun b!319525 () Bool)

(assert (=> b!319525 (= e!198442 (bvsgt #b00000000000000000000000000000000 (size!8068 a!3305)))))

(declare-fun b!319526 () Bool)

(declare-fun res!173909 () Bool)

(assert (=> b!319526 (=> (not res!173909) (not e!198442))))

(declare-fun arrayContainsKey!0 (array!16305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319526 (= res!173909 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!31998 res!173906) b!319523))

(assert (= (and b!319523 res!173907) b!319522))

(assert (= (and b!319522 res!173910) b!319526))

(assert (= (and b!319526 res!173909) b!319524))

(assert (= (and b!319524 res!173908) b!319525))

(declare-fun m!328107 () Bool)

(assert (=> start!31998 m!328107))

(declare-fun m!328109 () Bool)

(assert (=> start!31998 m!328109))

(declare-fun m!328111 () Bool)

(assert (=> b!319522 m!328111))

(declare-fun m!328113 () Bool)

(assert (=> b!319524 m!328113))

(declare-fun m!328115 () Bool)

(assert (=> b!319526 m!328115))

(check-sat (not b!319526) (not start!31998) (not b!319522) (not b!319524))
(check-sat)
