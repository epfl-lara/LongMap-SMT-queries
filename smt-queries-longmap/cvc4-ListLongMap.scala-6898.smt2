; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86754 () Bool)

(assert start!86754)

(declare-fun b!1005720 () Bool)

(declare-fun res!674810 () Bool)

(declare-fun e!566254 () Bool)

(assert (=> b!1005720 (=> (not res!674810) (not e!566254))))

(declare-datatypes ((array!63453 0))(
  ( (array!63454 (arr!30549 (Array (_ BitVec 32) (_ BitVec 64))) (size!31051 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63453)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9481 0))(
  ( (MissingZero!9481 (index!40295 (_ BitVec 32))) (Found!9481 (index!40296 (_ BitVec 32))) (Intermediate!9481 (undefined!10293 Bool) (index!40297 (_ BitVec 32)) (x!87697 (_ BitVec 32))) (Undefined!9481) (MissingVacant!9481 (index!40298 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63453 (_ BitVec 32)) SeekEntryResult!9481)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005720 (= res!674810 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30549 a!3219) j!170) mask!3464) (select (arr!30549 a!3219) j!170) a!3219 mask!3464) (Intermediate!9481 false resIndex!38 resX!38)))))

(declare-fun b!1005721 () Bool)

(assert (=> b!1005721 (= e!566254 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!444611 () SeekEntryResult!9481)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1005721 (= lt!444611 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30549 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005722 () Bool)

(declare-fun e!566253 () Bool)

(assert (=> b!1005722 (= e!566253 e!566254)))

(declare-fun res!674809 () Bool)

(assert (=> b!1005722 (=> (not res!674809) (not e!566254))))

(declare-fun lt!444610 () SeekEntryResult!9481)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005722 (= res!674809 (or (= lt!444610 (MissingVacant!9481 i!1194)) (= lt!444610 (MissingZero!9481 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63453 (_ BitVec 32)) SeekEntryResult!9481)

(assert (=> b!1005722 (= lt!444610 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1005723 () Bool)

(declare-fun res!674812 () Bool)

(assert (=> b!1005723 (=> (not res!674812) (not e!566253))))

(declare-fun arrayContainsKey!0 (array!63453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005723 (= res!674812 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005724 () Bool)

(declare-fun res!674815 () Bool)

(assert (=> b!1005724 (=> (not res!674815) (not e!566254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63453 (_ BitVec 32)) Bool)

(assert (=> b!1005724 (= res!674815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005725 () Bool)

(declare-fun res!674817 () Bool)

(assert (=> b!1005725 (=> (not res!674817) (not e!566254))))

(declare-datatypes ((List!21225 0))(
  ( (Nil!21222) (Cons!21221 (h!22404 (_ BitVec 64)) (t!30226 List!21225)) )
))
(declare-fun arrayNoDuplicates!0 (array!63453 (_ BitVec 32) List!21225) Bool)

(assert (=> b!1005725 (= res!674817 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21222))))

(declare-fun res!674808 () Bool)

(assert (=> start!86754 (=> (not res!674808) (not e!566253))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86754 (= res!674808 (validMask!0 mask!3464))))

(assert (=> start!86754 e!566253))

(declare-fun array_inv!23673 (array!63453) Bool)

(assert (=> start!86754 (array_inv!23673 a!3219)))

(assert (=> start!86754 true))

(declare-fun b!1005726 () Bool)

(declare-fun res!674811 () Bool)

(assert (=> b!1005726 (=> (not res!674811) (not e!566253))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005726 (= res!674811 (validKeyInArray!0 (select (arr!30549 a!3219) j!170)))))

(declare-fun b!1005727 () Bool)

(declare-fun res!674814 () Bool)

(assert (=> b!1005727 (=> (not res!674814) (not e!566253))))

(assert (=> b!1005727 (= res!674814 (and (= (size!31051 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31051 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31051 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005728 () Bool)

(declare-fun res!674816 () Bool)

(assert (=> b!1005728 (=> (not res!674816) (not e!566254))))

(assert (=> b!1005728 (= res!674816 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31051 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31051 a!3219))))))

(declare-fun b!1005729 () Bool)

(declare-fun res!674813 () Bool)

(assert (=> b!1005729 (=> (not res!674813) (not e!566253))))

(assert (=> b!1005729 (= res!674813 (validKeyInArray!0 k!2224))))

(assert (= (and start!86754 res!674808) b!1005727))

(assert (= (and b!1005727 res!674814) b!1005726))

(assert (= (and b!1005726 res!674811) b!1005729))

(assert (= (and b!1005729 res!674813) b!1005723))

(assert (= (and b!1005723 res!674812) b!1005722))

(assert (= (and b!1005722 res!674809) b!1005724))

(assert (= (and b!1005724 res!674815) b!1005725))

(assert (= (and b!1005725 res!674817) b!1005728))

(assert (= (and b!1005728 res!674816) b!1005720))

(assert (= (and b!1005720 res!674810) b!1005721))

(declare-fun m!930905 () Bool)

(assert (=> b!1005725 m!930905))

(declare-fun m!930907 () Bool)

(assert (=> b!1005729 m!930907))

(declare-fun m!930909 () Bool)

(assert (=> b!1005724 m!930909))

(declare-fun m!930911 () Bool)

(assert (=> b!1005721 m!930911))

(assert (=> b!1005721 m!930911))

(declare-fun m!930913 () Bool)

(assert (=> b!1005721 m!930913))

(declare-fun m!930915 () Bool)

(assert (=> b!1005722 m!930915))

(assert (=> b!1005726 m!930911))

(assert (=> b!1005726 m!930911))

(declare-fun m!930917 () Bool)

(assert (=> b!1005726 m!930917))

(declare-fun m!930919 () Bool)

(assert (=> start!86754 m!930919))

(declare-fun m!930921 () Bool)

(assert (=> start!86754 m!930921))

(declare-fun m!930923 () Bool)

(assert (=> b!1005723 m!930923))

(assert (=> b!1005720 m!930911))

(assert (=> b!1005720 m!930911))

(declare-fun m!930925 () Bool)

(assert (=> b!1005720 m!930925))

(assert (=> b!1005720 m!930925))

(assert (=> b!1005720 m!930911))

(declare-fun m!930927 () Bool)

(assert (=> b!1005720 m!930927))

(push 1)

(assert (not b!1005724))

(assert (not b!1005722))

(assert (not b!1005725))

(assert (not b!1005729))

(assert (not start!86754))

(assert (not b!1005723))

(assert (not b!1005720))

