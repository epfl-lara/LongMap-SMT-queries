; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86734 () Bool)

(assert start!86734)

(declare-fun b!1005433 () Bool)

(declare-fun e!566163 () Bool)

(declare-fun e!566162 () Bool)

(assert (=> b!1005433 (= e!566163 e!566162)))

(declare-fun res!674528 () Bool)

(assert (=> b!1005433 (=> (not res!674528) (not e!566162))))

(declare-datatypes ((SeekEntryResult!9471 0))(
  ( (MissingZero!9471 (index!40255 (_ BitVec 32))) (Found!9471 (index!40256 (_ BitVec 32))) (Intermediate!9471 (undefined!10283 Bool) (index!40257 (_ BitVec 32)) (x!87663 (_ BitVec 32))) (Undefined!9471) (MissingVacant!9471 (index!40258 (_ BitVec 32))) )
))
(declare-fun lt!444551 () SeekEntryResult!9471)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005433 (= res!674528 (or (= lt!444551 (MissingVacant!9471 i!1194)) (= lt!444551 (MissingZero!9471 i!1194))))))

(declare-datatypes ((array!63433 0))(
  ( (array!63434 (arr!30539 (Array (_ BitVec 32) (_ BitVec 64))) (size!31041 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63433)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63433 (_ BitVec 32)) SeekEntryResult!9471)

(assert (=> b!1005433 (= lt!444551 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1005434 () Bool)

(declare-fun res!674523 () Bool)

(assert (=> b!1005434 (=> (not res!674523) (not e!566163))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1005434 (= res!674523 (and (= (size!31041 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31041 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31041 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005435 () Bool)

(declare-fun res!674529 () Bool)

(assert (=> b!1005435 (=> (not res!674529) (not e!566162))))

(declare-datatypes ((List!21215 0))(
  ( (Nil!21212) (Cons!21211 (h!22394 (_ BitVec 64)) (t!30216 List!21215)) )
))
(declare-fun arrayNoDuplicates!0 (array!63433 (_ BitVec 32) List!21215) Bool)

(assert (=> b!1005435 (= res!674529 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21212))))

(declare-fun b!1005436 () Bool)

(declare-fun res!674527 () Bool)

(assert (=> b!1005436 (=> (not res!674527) (not e!566163))))

(declare-fun arrayContainsKey!0 (array!63433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005436 (= res!674527 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005437 () Bool)

(declare-fun res!674522 () Bool)

(assert (=> b!1005437 (=> (not res!674522) (not e!566163))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005437 (= res!674522 (validKeyInArray!0 k0!2224))))

(declare-fun b!1005438 () Bool)

(declare-fun res!674526 () Bool)

(assert (=> b!1005438 (=> (not res!674526) (not e!566162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63433 (_ BitVec 32)) Bool)

(assert (=> b!1005438 (= res!674526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!674524 () Bool)

(assert (=> start!86734 (=> (not res!674524) (not e!566163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86734 (= res!674524 (validMask!0 mask!3464))))

(assert (=> start!86734 e!566163))

(declare-fun array_inv!23663 (array!63433) Bool)

(assert (=> start!86734 (array_inv!23663 a!3219)))

(assert (=> start!86734 true))

(declare-fun b!1005439 () Bool)

(assert (=> b!1005439 (= e!566162 false)))

(declare-fun lt!444550 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005439 (= lt!444550 (toIndex!0 (select (arr!30539 a!3219) j!170) mask!3464))))

(declare-fun b!1005440 () Bool)

(declare-fun res!674525 () Bool)

(assert (=> b!1005440 (=> (not res!674525) (not e!566163))))

(assert (=> b!1005440 (= res!674525 (validKeyInArray!0 (select (arr!30539 a!3219) j!170)))))

(declare-fun b!1005441 () Bool)

(declare-fun res!674521 () Bool)

(assert (=> b!1005441 (=> (not res!674521) (not e!566162))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1005441 (= res!674521 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31041 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31041 a!3219))))))

(assert (= (and start!86734 res!674524) b!1005434))

(assert (= (and b!1005434 res!674523) b!1005440))

(assert (= (and b!1005440 res!674525) b!1005437))

(assert (= (and b!1005437 res!674522) b!1005436))

(assert (= (and b!1005436 res!674527) b!1005433))

(assert (= (and b!1005433 res!674528) b!1005438))

(assert (= (and b!1005438 res!674526) b!1005435))

(assert (= (and b!1005435 res!674529) b!1005441))

(assert (= (and b!1005441 res!674521) b!1005439))

(declare-fun m!930679 () Bool)

(assert (=> b!1005433 m!930679))

(declare-fun m!930681 () Bool)

(assert (=> b!1005436 m!930681))

(declare-fun m!930683 () Bool)

(assert (=> b!1005438 m!930683))

(declare-fun m!930685 () Bool)

(assert (=> start!86734 m!930685))

(declare-fun m!930687 () Bool)

(assert (=> start!86734 m!930687))

(declare-fun m!930689 () Bool)

(assert (=> b!1005435 m!930689))

(declare-fun m!930691 () Bool)

(assert (=> b!1005437 m!930691))

(declare-fun m!930693 () Bool)

(assert (=> b!1005439 m!930693))

(assert (=> b!1005439 m!930693))

(declare-fun m!930695 () Bool)

(assert (=> b!1005439 m!930695))

(assert (=> b!1005440 m!930693))

(assert (=> b!1005440 m!930693))

(declare-fun m!930697 () Bool)

(assert (=> b!1005440 m!930697))

(check-sat (not start!86734) (not b!1005440) (not b!1005436) (not b!1005433) (not b!1005438) (not b!1005435) (not b!1005437) (not b!1005439))
(check-sat)
