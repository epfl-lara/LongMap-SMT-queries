; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86220 () Bool)

(assert start!86220)

(declare-fun b!998241 () Bool)

(declare-fun res!668045 () Bool)

(declare-fun e!562955 () Bool)

(assert (=> b!998241 (=> (not res!668045) (not e!562955))))

(declare-datatypes ((array!63123 0))(
  ( (array!63124 (arr!30390 (Array (_ BitVec 32) (_ BitVec 64))) (size!30892 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63123)

(declare-datatypes ((List!21066 0))(
  ( (Nil!21063) (Cons!21062 (h!22233 (_ BitVec 64)) (t!30067 List!21066)) )
))
(declare-fun arrayNoDuplicates!0 (array!63123 (_ BitVec 32) List!21066) Bool)

(assert (=> b!998241 (= res!668045 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21063))))

(declare-fun b!998242 () Bool)

(declare-fun res!668043 () Bool)

(declare-fun e!562956 () Bool)

(assert (=> b!998242 (=> (not res!668043) (not e!562956))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998242 (= res!668043 (validKeyInArray!0 (select (arr!30390 a!3219) j!170)))))

(declare-fun b!998243 () Bool)

(declare-fun res!668037 () Bool)

(assert (=> b!998243 (=> (not res!668037) (not e!562956))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998243 (= res!668037 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998244 () Bool)

(assert (=> b!998244 (= e!562956 e!562955)))

(declare-fun res!668041 () Bool)

(assert (=> b!998244 (=> (not res!668041) (not e!562955))))

(declare-datatypes ((SeekEntryResult!9322 0))(
  ( (MissingZero!9322 (index!39659 (_ BitVec 32))) (Found!9322 (index!39660 (_ BitVec 32))) (Intermediate!9322 (undefined!10134 Bool) (index!39661 (_ BitVec 32)) (x!87090 (_ BitVec 32))) (Undefined!9322) (MissingVacant!9322 (index!39662 (_ BitVec 32))) )
))
(declare-fun lt!441665 () SeekEntryResult!9322)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998244 (= res!668041 (or (= lt!441665 (MissingVacant!9322 i!1194)) (= lt!441665 (MissingZero!9322 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63123 (_ BitVec 32)) SeekEntryResult!9322)

(assert (=> b!998244 (= lt!441665 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!998245 () Bool)

(declare-fun res!668046 () Bool)

(assert (=> b!998245 (=> (not res!668046) (not e!562956))))

(assert (=> b!998245 (= res!668046 (validKeyInArray!0 k!2224))))

(declare-fun b!998246 () Bool)

(assert (=> b!998246 (= e!562955 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!441664 () SeekEntryResult!9322)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63123 (_ BitVec 32)) SeekEntryResult!9322)

(assert (=> b!998246 (= lt!441664 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30390 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!668044 () Bool)

(assert (=> start!86220 (=> (not res!668044) (not e!562956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86220 (= res!668044 (validMask!0 mask!3464))))

(assert (=> start!86220 e!562956))

(declare-fun array_inv!23514 (array!63123) Bool)

(assert (=> start!86220 (array_inv!23514 a!3219)))

(assert (=> start!86220 true))

(declare-fun b!998247 () Bool)

(declare-fun res!668038 () Bool)

(assert (=> b!998247 (=> (not res!668038) (not e!562956))))

(assert (=> b!998247 (= res!668038 (and (= (size!30892 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30892 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30892 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998248 () Bool)

(declare-fun res!668039 () Bool)

(assert (=> b!998248 (=> (not res!668039) (not e!562955))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998248 (= res!668039 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30892 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30892 a!3219))))))

(declare-fun b!998249 () Bool)

(declare-fun res!668042 () Bool)

(assert (=> b!998249 (=> (not res!668042) (not e!562955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63123 (_ BitVec 32)) Bool)

(assert (=> b!998249 (= res!668042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!998250 () Bool)

(declare-fun res!668040 () Bool)

(assert (=> b!998250 (=> (not res!668040) (not e!562955))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998250 (= res!668040 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30390 a!3219) j!170) mask!3464) (select (arr!30390 a!3219) j!170) a!3219 mask!3464) (Intermediate!9322 false resIndex!38 resX!38)))))

(assert (= (and start!86220 res!668044) b!998247))

(assert (= (and b!998247 res!668038) b!998242))

(assert (= (and b!998242 res!668043) b!998245))

(assert (= (and b!998245 res!668046) b!998243))

(assert (= (and b!998243 res!668037) b!998244))

(assert (= (and b!998244 res!668041) b!998249))

(assert (= (and b!998249 res!668042) b!998241))

(assert (= (and b!998241 res!668045) b!998248))

(assert (= (and b!998248 res!668039) b!998250))

(assert (= (and b!998250 res!668040) b!998246))

(declare-fun m!924821 () Bool)

(assert (=> b!998241 m!924821))

(declare-fun m!924823 () Bool)

(assert (=> b!998245 m!924823))

(declare-fun m!924825 () Bool)

(assert (=> b!998243 m!924825))

(declare-fun m!924827 () Bool)

(assert (=> b!998250 m!924827))

(assert (=> b!998250 m!924827))

(declare-fun m!924829 () Bool)

(assert (=> b!998250 m!924829))

(assert (=> b!998250 m!924829))

(assert (=> b!998250 m!924827))

(declare-fun m!924831 () Bool)

(assert (=> b!998250 m!924831))

(declare-fun m!924833 () Bool)

(assert (=> start!86220 m!924833))

(declare-fun m!924835 () Bool)

(assert (=> start!86220 m!924835))

(declare-fun m!924837 () Bool)

(assert (=> b!998244 m!924837))

(declare-fun m!924839 () Bool)

(assert (=> b!998249 m!924839))

(assert (=> b!998242 m!924827))

(assert (=> b!998242 m!924827))

(declare-fun m!924841 () Bool)

(assert (=> b!998242 m!924841))

(assert (=> b!998246 m!924827))

(assert (=> b!998246 m!924827))

(declare-fun m!924843 () Bool)

(assert (=> b!998246 m!924843))

(push 1)

(assert (not b!998245))

(assert (not b!998242))

(assert (not b!998249))

(assert (not b!998241))

(assert (not b!998246))

(assert (not b!998243))

(assert (not start!86220))

(assert (not b!998244))

(assert (not b!998250))

(check-sat)

