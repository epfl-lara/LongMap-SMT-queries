; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86766 () Bool)

(assert start!86766)

(declare-fun b!1005900 () Bool)

(declare-fun res!674989 () Bool)

(declare-fun e!566307 () Bool)

(assert (=> b!1005900 (=> (not res!674989) (not e!566307))))

(declare-datatypes ((array!63465 0))(
  ( (array!63466 (arr!30555 (Array (_ BitVec 32) (_ BitVec 64))) (size!31057 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63465)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63465 (_ BitVec 32)) Bool)

(assert (=> b!1005900 (= res!674989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005901 () Bool)

(declare-fun res!674997 () Bool)

(declare-fun e!566308 () Bool)

(assert (=> b!1005901 (=> (not res!674997) (not e!566308))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005901 (= res!674997 (validKeyInArray!0 k!2224))))

(declare-fun b!1005902 () Bool)

(declare-fun res!674992 () Bool)

(assert (=> b!1005902 (=> (not res!674992) (not e!566307))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1005902 (= res!674992 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31057 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31057 a!3219))))))

(declare-fun b!1005903 () Bool)

(assert (=> b!1005903 (= e!566307 false)))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9487 0))(
  ( (MissingZero!9487 (index!40319 (_ BitVec 32))) (Found!9487 (index!40320 (_ BitVec 32))) (Intermediate!9487 (undefined!10299 Bool) (index!40321 (_ BitVec 32)) (x!87719 (_ BitVec 32))) (Undefined!9487) (MissingVacant!9487 (index!40322 (_ BitVec 32))) )
))
(declare-fun lt!444646 () SeekEntryResult!9487)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63465 (_ BitVec 32)) SeekEntryResult!9487)

(assert (=> b!1005903 (= lt!444646 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30555 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005904 () Bool)

(declare-fun res!674994 () Bool)

(assert (=> b!1005904 (=> (not res!674994) (not e!566308))))

(assert (=> b!1005904 (= res!674994 (validKeyInArray!0 (select (arr!30555 a!3219) j!170)))))

(declare-fun b!1005905 () Bool)

(declare-fun res!674991 () Bool)

(assert (=> b!1005905 (=> (not res!674991) (not e!566308))))

(declare-fun arrayContainsKey!0 (array!63465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005905 (= res!674991 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005906 () Bool)

(declare-fun res!674988 () Bool)

(assert (=> b!1005906 (=> (not res!674988) (not e!566307))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005906 (= res!674988 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30555 a!3219) j!170) mask!3464) (select (arr!30555 a!3219) j!170) a!3219 mask!3464) (Intermediate!9487 false resIndex!38 resX!38)))))

(declare-fun b!1005907 () Bool)

(declare-fun res!674993 () Bool)

(assert (=> b!1005907 (=> (not res!674993) (not e!566307))))

(declare-datatypes ((List!21231 0))(
  ( (Nil!21228) (Cons!21227 (h!22410 (_ BitVec 64)) (t!30232 List!21231)) )
))
(declare-fun arrayNoDuplicates!0 (array!63465 (_ BitVec 32) List!21231) Bool)

(assert (=> b!1005907 (= res!674993 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21228))))

(declare-fun res!674996 () Bool)

(assert (=> start!86766 (=> (not res!674996) (not e!566308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86766 (= res!674996 (validMask!0 mask!3464))))

(assert (=> start!86766 e!566308))

(declare-fun array_inv!23679 (array!63465) Bool)

(assert (=> start!86766 (array_inv!23679 a!3219)))

(assert (=> start!86766 true))

(declare-fun b!1005908 () Bool)

(declare-fun res!674990 () Bool)

(assert (=> b!1005908 (=> (not res!674990) (not e!566308))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005908 (= res!674990 (and (= (size!31057 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31057 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31057 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005909 () Bool)

(assert (=> b!1005909 (= e!566308 e!566307)))

(declare-fun res!674995 () Bool)

(assert (=> b!1005909 (=> (not res!674995) (not e!566307))))

(declare-fun lt!444647 () SeekEntryResult!9487)

(assert (=> b!1005909 (= res!674995 (or (= lt!444647 (MissingVacant!9487 i!1194)) (= lt!444647 (MissingZero!9487 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63465 (_ BitVec 32)) SeekEntryResult!9487)

(assert (=> b!1005909 (= lt!444647 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!86766 res!674996) b!1005908))

(assert (= (and b!1005908 res!674990) b!1005904))

(assert (= (and b!1005904 res!674994) b!1005901))

(assert (= (and b!1005901 res!674997) b!1005905))

(assert (= (and b!1005905 res!674991) b!1005909))

(assert (= (and b!1005909 res!674995) b!1005900))

(assert (= (and b!1005900 res!674989) b!1005907))

(assert (= (and b!1005907 res!674993) b!1005902))

(assert (= (and b!1005902 res!674992) b!1005906))

(assert (= (and b!1005906 res!674988) b!1005903))

(declare-fun m!931049 () Bool)

(assert (=> b!1005903 m!931049))

(assert (=> b!1005903 m!931049))

(declare-fun m!931051 () Bool)

(assert (=> b!1005903 m!931051))

(declare-fun m!931053 () Bool)

(assert (=> b!1005907 m!931053))

(declare-fun m!931055 () Bool)

(assert (=> b!1005909 m!931055))

(declare-fun m!931057 () Bool)

(assert (=> b!1005905 m!931057))

(declare-fun m!931059 () Bool)

(assert (=> b!1005900 m!931059))

(declare-fun m!931061 () Bool)

(assert (=> b!1005901 m!931061))

(assert (=> b!1005904 m!931049))

(assert (=> b!1005904 m!931049))

(declare-fun m!931063 () Bool)

(assert (=> b!1005904 m!931063))

(declare-fun m!931065 () Bool)

(assert (=> start!86766 m!931065))

(declare-fun m!931067 () Bool)

(assert (=> start!86766 m!931067))

(assert (=> b!1005906 m!931049))

(assert (=> b!1005906 m!931049))

(declare-fun m!931069 () Bool)

(assert (=> b!1005906 m!931069))

(assert (=> b!1005906 m!931069))

(assert (=> b!1005906 m!931049))

(declare-fun m!931071 () Bool)

(assert (=> b!1005906 m!931071))

(push 1)

(assert (not b!1005909))

(assert (not start!86766))

(assert (not b!1005903))

(assert (not b!1005900))

(assert (not b!1005905))

(assert (not b!1005901))

(assert (not b!1005906))

