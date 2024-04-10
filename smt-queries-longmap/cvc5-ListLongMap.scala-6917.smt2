; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86918 () Bool)

(assert start!86918)

(declare-fun b!1008053 () Bool)

(declare-fun e!567251 () Bool)

(declare-fun e!567249 () Bool)

(assert (=> b!1008053 (= e!567251 e!567249)))

(declare-fun res!676951 () Bool)

(assert (=> b!1008053 (=> (not res!676951) (not e!567249))))

(declare-datatypes ((SeekEntryResult!9536 0))(
  ( (MissingZero!9536 (index!40515 (_ BitVec 32))) (Found!9536 (index!40516 (_ BitVec 32))) (Intermediate!9536 (undefined!10348 Bool) (index!40517 (_ BitVec 32)) (x!87910 (_ BitVec 32))) (Undefined!9536) (MissingVacant!9536 (index!40518 (_ BitVec 32))) )
))
(declare-fun lt!445511 () SeekEntryResult!9536)

(declare-fun lt!445508 () SeekEntryResult!9536)

(assert (=> b!1008053 (= res!676951 (= lt!445511 lt!445508))))

(declare-datatypes ((array!63566 0))(
  ( (array!63567 (arr!30604 (Array (_ BitVec 32) (_ BitVec 64))) (size!31106 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63566)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63566 (_ BitVec 32)) SeekEntryResult!9536)

(assert (=> b!1008053 (= lt!445511 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30604 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008054 () Bool)

(declare-fun e!567253 () Bool)

(assert (=> b!1008054 (= e!567253 false)))

(declare-fun lt!445506 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008054 (= lt!445506 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1008055 () Bool)

(declare-fun res!676957 () Bool)

(declare-fun e!567248 () Bool)

(assert (=> b!1008055 (=> (not res!676957) (not e!567248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63566 (_ BitVec 32)) Bool)

(assert (=> b!1008055 (= res!676957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008056 () Bool)

(declare-fun res!676954 () Bool)

(assert (=> b!1008056 (=> (not res!676954) (not e!567253))))

(declare-fun lt!445510 () (_ BitVec 64))

(declare-fun lt!445505 () array!63566)

(assert (=> b!1008056 (= res!676954 (not (= lt!445511 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445510 lt!445505 mask!3464))))))

(declare-fun b!1008057 () Bool)

(assert (=> b!1008057 (= e!567249 e!567253)))

(declare-fun res!676947 () Bool)

(assert (=> b!1008057 (=> (not res!676947) (not e!567253))))

(declare-fun lt!445507 () SeekEntryResult!9536)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008057 (= res!676947 (not (= lt!445507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445510 mask!3464) lt!445510 lt!445505 mask!3464))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1008057 (= lt!445510 (select (store (arr!30604 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1008057 (= lt!445505 (array!63567 (store (arr!30604 a!3219) i!1194 k!2224) (size!31106 a!3219)))))

(declare-fun b!1008058 () Bool)

(declare-fun res!676958 () Bool)

(assert (=> b!1008058 (=> (not res!676958) (not e!567253))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1008058 (= res!676958 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008059 () Bool)

(declare-fun res!676946 () Bool)

(declare-fun e!567250 () Bool)

(assert (=> b!1008059 (=> (not res!676946) (not e!567250))))

(assert (=> b!1008059 (= res!676946 (and (= (size!31106 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31106 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31106 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008061 () Bool)

(assert (=> b!1008061 (= e!567250 e!567248)))

(declare-fun res!676956 () Bool)

(assert (=> b!1008061 (=> (not res!676956) (not e!567248))))

(declare-fun lt!445509 () SeekEntryResult!9536)

(assert (=> b!1008061 (= res!676956 (or (= lt!445509 (MissingVacant!9536 i!1194)) (= lt!445509 (MissingZero!9536 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63566 (_ BitVec 32)) SeekEntryResult!9536)

(assert (=> b!1008061 (= lt!445509 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1008062 () Bool)

(declare-fun res!676959 () Bool)

(assert (=> b!1008062 (=> (not res!676959) (not e!567248))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008062 (= res!676959 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31106 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31106 a!3219))))))

(declare-fun b!1008063 () Bool)

(assert (=> b!1008063 (= e!567248 e!567251)))

(declare-fun res!676948 () Bool)

(assert (=> b!1008063 (=> (not res!676948) (not e!567251))))

(assert (=> b!1008063 (= res!676948 (= lt!445507 lt!445508))))

(assert (=> b!1008063 (= lt!445508 (Intermediate!9536 false resIndex!38 resX!38))))

(assert (=> b!1008063 (= lt!445507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30604 a!3219) j!170) mask!3464) (select (arr!30604 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008064 () Bool)

(declare-fun res!676950 () Bool)

(assert (=> b!1008064 (=> (not res!676950) (not e!567250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008064 (= res!676950 (validKeyInArray!0 k!2224))))

(declare-fun b!1008065 () Bool)

(declare-fun res!676949 () Bool)

(assert (=> b!1008065 (=> (not res!676949) (not e!567250))))

(assert (=> b!1008065 (= res!676949 (validKeyInArray!0 (select (arr!30604 a!3219) j!170)))))

(declare-fun b!1008066 () Bool)

(declare-fun res!676952 () Bool)

(assert (=> b!1008066 (=> (not res!676952) (not e!567248))))

(declare-datatypes ((List!21280 0))(
  ( (Nil!21277) (Cons!21276 (h!22462 (_ BitVec 64)) (t!30281 List!21280)) )
))
(declare-fun arrayNoDuplicates!0 (array!63566 (_ BitVec 32) List!21280) Bool)

(assert (=> b!1008066 (= res!676952 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21277))))

(declare-fun b!1008060 () Bool)

(declare-fun res!676955 () Bool)

(assert (=> b!1008060 (=> (not res!676955) (not e!567250))))

(declare-fun arrayContainsKey!0 (array!63566 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008060 (= res!676955 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun res!676953 () Bool)

(assert (=> start!86918 (=> (not res!676953) (not e!567250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86918 (= res!676953 (validMask!0 mask!3464))))

(assert (=> start!86918 e!567250))

(declare-fun array_inv!23728 (array!63566) Bool)

(assert (=> start!86918 (array_inv!23728 a!3219)))

(assert (=> start!86918 true))

(assert (= (and start!86918 res!676953) b!1008059))

(assert (= (and b!1008059 res!676946) b!1008065))

(assert (= (and b!1008065 res!676949) b!1008064))

(assert (= (and b!1008064 res!676950) b!1008060))

(assert (= (and b!1008060 res!676955) b!1008061))

(assert (= (and b!1008061 res!676956) b!1008055))

(assert (= (and b!1008055 res!676957) b!1008066))

(assert (= (and b!1008066 res!676952) b!1008062))

(assert (= (and b!1008062 res!676959) b!1008063))

(assert (= (and b!1008063 res!676948) b!1008053))

(assert (= (and b!1008053 res!676951) b!1008057))

(assert (= (and b!1008057 res!676947) b!1008056))

(assert (= (and b!1008056 res!676954) b!1008058))

(assert (= (and b!1008058 res!676958) b!1008054))

(declare-fun m!932855 () Bool)

(assert (=> b!1008055 m!932855))

(declare-fun m!932857 () Bool)

(assert (=> b!1008064 m!932857))

(declare-fun m!932859 () Bool)

(assert (=> start!86918 m!932859))

(declare-fun m!932861 () Bool)

(assert (=> start!86918 m!932861))

(declare-fun m!932863 () Bool)

(assert (=> b!1008060 m!932863))

(declare-fun m!932865 () Bool)

(assert (=> b!1008056 m!932865))

(declare-fun m!932867 () Bool)

(assert (=> b!1008065 m!932867))

(assert (=> b!1008065 m!932867))

(declare-fun m!932869 () Bool)

(assert (=> b!1008065 m!932869))

(assert (=> b!1008053 m!932867))

(assert (=> b!1008053 m!932867))

(declare-fun m!932871 () Bool)

(assert (=> b!1008053 m!932871))

(declare-fun m!932873 () Bool)

(assert (=> b!1008054 m!932873))

(declare-fun m!932875 () Bool)

(assert (=> b!1008061 m!932875))

(declare-fun m!932877 () Bool)

(assert (=> b!1008057 m!932877))

(assert (=> b!1008057 m!932877))

(declare-fun m!932879 () Bool)

(assert (=> b!1008057 m!932879))

(declare-fun m!932881 () Bool)

(assert (=> b!1008057 m!932881))

(declare-fun m!932883 () Bool)

(assert (=> b!1008057 m!932883))

(assert (=> b!1008063 m!932867))

(assert (=> b!1008063 m!932867))

(declare-fun m!932885 () Bool)

(assert (=> b!1008063 m!932885))

(assert (=> b!1008063 m!932885))

(assert (=> b!1008063 m!932867))

(declare-fun m!932887 () Bool)

(assert (=> b!1008063 m!932887))

(declare-fun m!932889 () Bool)

(assert (=> b!1008066 m!932889))

(push 1)

