; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86744 () Bool)

(assert start!86744)

(declare-fun b!1005570 () Bool)

(declare-fun res!674661 () Bool)

(declare-fun e!566207 () Bool)

(assert (=> b!1005570 (=> (not res!674661) (not e!566207))))

(declare-datatypes ((array!63443 0))(
  ( (array!63444 (arr!30544 (Array (_ BitVec 32) (_ BitVec 64))) (size!31046 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63443)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9476 0))(
  ( (MissingZero!9476 (index!40275 (_ BitVec 32))) (Found!9476 (index!40276 (_ BitVec 32))) (Intermediate!9476 (undefined!10288 Bool) (index!40277 (_ BitVec 32)) (x!87684 (_ BitVec 32))) (Undefined!9476) (MissingVacant!9476 (index!40278 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63443 (_ BitVec 32)) SeekEntryResult!9476)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005570 (= res!674661 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30544 a!3219) j!170) mask!3464) (select (arr!30544 a!3219) j!170) a!3219 mask!3464) (Intermediate!9476 false resIndex!38 resX!38)))))

(declare-fun b!1005571 () Bool)

(assert (=> b!1005571 (= e!566207 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!444581 () SeekEntryResult!9476)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1005571 (= lt!444581 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30544 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005572 () Bool)

(declare-fun res!674663 () Bool)

(assert (=> b!1005572 (=> (not res!674663) (not e!566207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63443 (_ BitVec 32)) Bool)

(assert (=> b!1005572 (= res!674663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005573 () Bool)

(declare-fun res!674667 () Bool)

(assert (=> b!1005573 (=> (not res!674667) (not e!566207))))

(assert (=> b!1005573 (= res!674667 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31046 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31046 a!3219))))))

(declare-fun b!1005574 () Bool)

(declare-fun res!674660 () Bool)

(declare-fun e!566209 () Bool)

(assert (=> b!1005574 (=> (not res!674660) (not e!566209))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005574 (= res!674660 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005576 () Bool)

(assert (=> b!1005576 (= e!566209 e!566207)))

(declare-fun res!674664 () Bool)

(assert (=> b!1005576 (=> (not res!674664) (not e!566207))))

(declare-fun lt!444580 () SeekEntryResult!9476)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005576 (= res!674664 (or (= lt!444580 (MissingVacant!9476 i!1194)) (= lt!444580 (MissingZero!9476 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63443 (_ BitVec 32)) SeekEntryResult!9476)

(assert (=> b!1005576 (= lt!444580 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1005577 () Bool)

(declare-fun res!674662 () Bool)

(assert (=> b!1005577 (=> (not res!674662) (not e!566209))))

(assert (=> b!1005577 (= res!674662 (and (= (size!31046 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31046 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31046 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005578 () Bool)

(declare-fun res!674658 () Bool)

(assert (=> b!1005578 (=> (not res!674658) (not e!566209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005578 (= res!674658 (validKeyInArray!0 k!2224))))

(declare-fun b!1005579 () Bool)

(declare-fun res!674665 () Bool)

(assert (=> b!1005579 (=> (not res!674665) (not e!566207))))

(declare-datatypes ((List!21220 0))(
  ( (Nil!21217) (Cons!21216 (h!22399 (_ BitVec 64)) (t!30221 List!21220)) )
))
(declare-fun arrayNoDuplicates!0 (array!63443 (_ BitVec 32) List!21220) Bool)

(assert (=> b!1005579 (= res!674665 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21217))))

(declare-fun res!674666 () Bool)

(assert (=> start!86744 (=> (not res!674666) (not e!566209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86744 (= res!674666 (validMask!0 mask!3464))))

(assert (=> start!86744 e!566209))

(declare-fun array_inv!23668 (array!63443) Bool)

(assert (=> start!86744 (array_inv!23668 a!3219)))

(assert (=> start!86744 true))

(declare-fun b!1005575 () Bool)

(declare-fun res!674659 () Bool)

(assert (=> b!1005575 (=> (not res!674659) (not e!566209))))

(assert (=> b!1005575 (= res!674659 (validKeyInArray!0 (select (arr!30544 a!3219) j!170)))))

(assert (= (and start!86744 res!674666) b!1005577))

(assert (= (and b!1005577 res!674662) b!1005575))

(assert (= (and b!1005575 res!674659) b!1005578))

(assert (= (and b!1005578 res!674658) b!1005574))

(assert (= (and b!1005574 res!674660) b!1005576))

(assert (= (and b!1005576 res!674664) b!1005572))

(assert (= (and b!1005572 res!674663) b!1005579))

(assert (= (and b!1005579 res!674665) b!1005573))

(assert (= (and b!1005573 res!674667) b!1005570))

(assert (= (and b!1005570 res!674661) b!1005571))

(declare-fun m!930785 () Bool)

(assert (=> b!1005572 m!930785))

(declare-fun m!930787 () Bool)

(assert (=> b!1005574 m!930787))

(declare-fun m!930789 () Bool)

(assert (=> b!1005578 m!930789))

(declare-fun m!930791 () Bool)

(assert (=> b!1005575 m!930791))

(assert (=> b!1005575 m!930791))

(declare-fun m!930793 () Bool)

(assert (=> b!1005575 m!930793))

(declare-fun m!930795 () Bool)

(assert (=> b!1005579 m!930795))

(declare-fun m!930797 () Bool)

(assert (=> b!1005576 m!930797))

(assert (=> b!1005570 m!930791))

(assert (=> b!1005570 m!930791))

(declare-fun m!930799 () Bool)

(assert (=> b!1005570 m!930799))

(assert (=> b!1005570 m!930799))

(assert (=> b!1005570 m!930791))

(declare-fun m!930801 () Bool)

(assert (=> b!1005570 m!930801))

(declare-fun m!930803 () Bool)

(assert (=> start!86744 m!930803))

(declare-fun m!930805 () Bool)

(assert (=> start!86744 m!930805))

(assert (=> b!1005571 m!930791))

(assert (=> b!1005571 m!930791))

(declare-fun m!930807 () Bool)

(assert (=> b!1005571 m!930807))

(push 1)

