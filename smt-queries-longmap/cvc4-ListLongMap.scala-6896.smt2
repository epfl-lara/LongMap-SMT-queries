; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86742 () Bool)

(assert start!86742)

(declare-fun b!1005541 () Bool)

(declare-fun res!674634 () Bool)

(declare-fun e!566198 () Bool)

(assert (=> b!1005541 (=> (not res!674634) (not e!566198))))

(declare-datatypes ((array!63441 0))(
  ( (array!63442 (arr!30543 (Array (_ BitVec 32) (_ BitVec 64))) (size!31045 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63441)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005541 (= res!674634 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005543 () Bool)

(declare-fun e!566199 () Bool)

(assert (=> b!1005543 (= e!566199 false)))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9475 0))(
  ( (MissingZero!9475 (index!40271 (_ BitVec 32))) (Found!9475 (index!40272 (_ BitVec 32))) (Intermediate!9475 (undefined!10287 Bool) (index!40273 (_ BitVec 32)) (x!87675 (_ BitVec 32))) (Undefined!9475) (MissingVacant!9475 (index!40274 (_ BitVec 32))) )
))
(declare-fun lt!444574 () SeekEntryResult!9475)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63441 (_ BitVec 32)) SeekEntryResult!9475)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005543 (= lt!444574 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30543 a!3219) j!170) mask!3464) (select (arr!30543 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005544 () Bool)

(declare-fun res!674635 () Bool)

(assert (=> b!1005544 (=> (not res!674635) (not e!566199))))

(declare-datatypes ((List!21219 0))(
  ( (Nil!21216) (Cons!21215 (h!22398 (_ BitVec 64)) (t!30220 List!21219)) )
))
(declare-fun arrayNoDuplicates!0 (array!63441 (_ BitVec 32) List!21219) Bool)

(assert (=> b!1005544 (= res!674635 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21216))))

(declare-fun b!1005545 () Bool)

(declare-fun res!674629 () Bool)

(assert (=> b!1005545 (=> (not res!674629) (not e!566198))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005545 (= res!674629 (and (= (size!31045 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31045 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31045 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005546 () Bool)

(assert (=> b!1005546 (= e!566198 e!566199)))

(declare-fun res!674630 () Bool)

(assert (=> b!1005546 (=> (not res!674630) (not e!566199))))

(declare-fun lt!444575 () SeekEntryResult!9475)

(assert (=> b!1005546 (= res!674630 (or (= lt!444575 (MissingVacant!9475 i!1194)) (= lt!444575 (MissingZero!9475 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63441 (_ BitVec 32)) SeekEntryResult!9475)

(assert (=> b!1005546 (= lt!444575 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1005547 () Bool)

(declare-fun res!674632 () Bool)

(assert (=> b!1005547 (=> (not res!674632) (not e!566199))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63441 (_ BitVec 32)) Bool)

(assert (=> b!1005547 (= res!674632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005548 () Bool)

(declare-fun res!674637 () Bool)

(assert (=> b!1005548 (=> (not res!674637) (not e!566198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005548 (= res!674637 (validKeyInArray!0 k!2224))))

(declare-fun b!1005549 () Bool)

(declare-fun res!674633 () Bool)

(assert (=> b!1005549 (=> (not res!674633) (not e!566199))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1005549 (= res!674633 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31045 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31045 a!3219))))))

(declare-fun b!1005542 () Bool)

(declare-fun res!674636 () Bool)

(assert (=> b!1005542 (=> (not res!674636) (not e!566198))))

(assert (=> b!1005542 (= res!674636 (validKeyInArray!0 (select (arr!30543 a!3219) j!170)))))

(declare-fun res!674631 () Bool)

(assert (=> start!86742 (=> (not res!674631) (not e!566198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86742 (= res!674631 (validMask!0 mask!3464))))

(assert (=> start!86742 e!566198))

(declare-fun array_inv!23667 (array!63441) Bool)

(assert (=> start!86742 (array_inv!23667 a!3219)))

(assert (=> start!86742 true))

(assert (= (and start!86742 res!674631) b!1005545))

(assert (= (and b!1005545 res!674629) b!1005542))

(assert (= (and b!1005542 res!674636) b!1005548))

(assert (= (and b!1005548 res!674637) b!1005541))

(assert (= (and b!1005541 res!674634) b!1005546))

(assert (= (and b!1005546 res!674630) b!1005547))

(assert (= (and b!1005547 res!674632) b!1005544))

(assert (= (and b!1005544 res!674635) b!1005549))

(assert (= (and b!1005549 res!674633) b!1005543))

(declare-fun m!930763 () Bool)

(assert (=> b!1005547 m!930763))

(declare-fun m!930765 () Bool)

(assert (=> b!1005544 m!930765))

(declare-fun m!930767 () Bool)

(assert (=> b!1005541 m!930767))

(declare-fun m!930769 () Bool)

(assert (=> b!1005543 m!930769))

(assert (=> b!1005543 m!930769))

(declare-fun m!930771 () Bool)

(assert (=> b!1005543 m!930771))

(assert (=> b!1005543 m!930771))

(assert (=> b!1005543 m!930769))

(declare-fun m!930773 () Bool)

(assert (=> b!1005543 m!930773))

(assert (=> b!1005542 m!930769))

(assert (=> b!1005542 m!930769))

(declare-fun m!930775 () Bool)

(assert (=> b!1005542 m!930775))

(declare-fun m!930777 () Bool)

(assert (=> b!1005548 m!930777))

(declare-fun m!930779 () Bool)

(assert (=> start!86742 m!930779))

(declare-fun m!930781 () Bool)

(assert (=> start!86742 m!930781))

(declare-fun m!930783 () Bool)

(assert (=> b!1005546 m!930783))

(push 1)

(assert (not start!86742))

(assert (not b!1005543))

(assert (not b!1005546))

(assert (not b!1005547))

(assert (not b!1005544))

(assert (not b!1005542))

(assert (not b!1005541))

(assert (not b!1005548))

