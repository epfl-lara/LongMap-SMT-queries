; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86740 () Bool)

(assert start!86740)

(declare-fun b!1005514 () Bool)

(declare-fun res!674606 () Bool)

(declare-fun e!566190 () Bool)

(assert (=> b!1005514 (=> (not res!674606) (not e!566190))))

(declare-datatypes ((array!63439 0))(
  ( (array!63440 (arr!30542 (Array (_ BitVec 32) (_ BitVec 64))) (size!31044 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63439)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005514 (= res!674606 (validKeyInArray!0 (select (arr!30542 a!3219) j!170)))))

(declare-fun b!1005515 () Bool)

(declare-fun res!674607 () Bool)

(assert (=> b!1005515 (=> (not res!674607) (not e!566190))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1005515 (= res!674607 (validKeyInArray!0 k0!2224))))

(declare-fun b!1005516 () Bool)

(declare-fun res!674610 () Bool)

(assert (=> b!1005516 (=> (not res!674610) (not e!566190))))

(declare-fun arrayContainsKey!0 (array!63439 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005516 (= res!674610 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005517 () Bool)

(declare-fun res!674609 () Bool)

(assert (=> b!1005517 (=> (not res!674609) (not e!566190))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005517 (= res!674609 (and (= (size!31044 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31044 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31044 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005519 () Bool)

(declare-fun e!566191 () Bool)

(assert (=> b!1005519 (= e!566190 e!566191)))

(declare-fun res!674603 () Bool)

(assert (=> b!1005519 (=> (not res!674603) (not e!566191))))

(declare-datatypes ((SeekEntryResult!9474 0))(
  ( (MissingZero!9474 (index!40267 (_ BitVec 32))) (Found!9474 (index!40268 (_ BitVec 32))) (Intermediate!9474 (undefined!10286 Bool) (index!40269 (_ BitVec 32)) (x!87674 (_ BitVec 32))) (Undefined!9474) (MissingVacant!9474 (index!40270 (_ BitVec 32))) )
))
(declare-fun lt!444569 () SeekEntryResult!9474)

(assert (=> b!1005519 (= res!674603 (or (= lt!444569 (MissingVacant!9474 i!1194)) (= lt!444569 (MissingZero!9474 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63439 (_ BitVec 32)) SeekEntryResult!9474)

(assert (=> b!1005519 (= lt!444569 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1005520 () Bool)

(declare-fun res!674602 () Bool)

(assert (=> b!1005520 (=> (not res!674602) (not e!566191))))

(declare-datatypes ((List!21218 0))(
  ( (Nil!21215) (Cons!21214 (h!22397 (_ BitVec 64)) (t!30219 List!21218)) )
))
(declare-fun arrayNoDuplicates!0 (array!63439 (_ BitVec 32) List!21218) Bool)

(assert (=> b!1005520 (= res!674602 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21215))))

(declare-fun b!1005518 () Bool)

(declare-fun res!674604 () Bool)

(assert (=> b!1005518 (=> (not res!674604) (not e!566191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63439 (_ BitVec 32)) Bool)

(assert (=> b!1005518 (= res!674604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!674608 () Bool)

(assert (=> start!86740 (=> (not res!674608) (not e!566190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86740 (= res!674608 (validMask!0 mask!3464))))

(assert (=> start!86740 e!566190))

(declare-fun array_inv!23666 (array!63439) Bool)

(assert (=> start!86740 (array_inv!23666 a!3219)))

(assert (=> start!86740 true))

(declare-fun b!1005521 () Bool)

(declare-fun res!674605 () Bool)

(assert (=> b!1005521 (=> (not res!674605) (not e!566191))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1005521 (= res!674605 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31044 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31044 a!3219))))))

(declare-fun b!1005522 () Bool)

(assert (=> b!1005522 (= e!566191 false)))

(declare-fun lt!444568 () SeekEntryResult!9474)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63439 (_ BitVec 32)) SeekEntryResult!9474)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005522 (= lt!444568 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30542 a!3219) j!170) mask!3464) (select (arr!30542 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!86740 res!674608) b!1005517))

(assert (= (and b!1005517 res!674609) b!1005514))

(assert (= (and b!1005514 res!674606) b!1005515))

(assert (= (and b!1005515 res!674607) b!1005516))

(assert (= (and b!1005516 res!674610) b!1005519))

(assert (= (and b!1005519 res!674603) b!1005518))

(assert (= (and b!1005518 res!674604) b!1005520))

(assert (= (and b!1005520 res!674602) b!1005521))

(assert (= (and b!1005521 res!674605) b!1005522))

(declare-fun m!930741 () Bool)

(assert (=> b!1005522 m!930741))

(assert (=> b!1005522 m!930741))

(declare-fun m!930743 () Bool)

(assert (=> b!1005522 m!930743))

(assert (=> b!1005522 m!930743))

(assert (=> b!1005522 m!930741))

(declare-fun m!930745 () Bool)

(assert (=> b!1005522 m!930745))

(declare-fun m!930747 () Bool)

(assert (=> b!1005515 m!930747))

(declare-fun m!930749 () Bool)

(assert (=> start!86740 m!930749))

(declare-fun m!930751 () Bool)

(assert (=> start!86740 m!930751))

(declare-fun m!930753 () Bool)

(assert (=> b!1005518 m!930753))

(declare-fun m!930755 () Bool)

(assert (=> b!1005519 m!930755))

(declare-fun m!930757 () Bool)

(assert (=> b!1005516 m!930757))

(assert (=> b!1005514 m!930741))

(assert (=> b!1005514 m!930741))

(declare-fun m!930759 () Bool)

(assert (=> b!1005514 m!930759))

(declare-fun m!930761 () Bool)

(assert (=> b!1005520 m!930761))

(check-sat (not b!1005514) (not b!1005520) (not b!1005518) (not b!1005522) (not b!1005519) (not start!86740) (not b!1005515) (not b!1005516))
(check-sat)
