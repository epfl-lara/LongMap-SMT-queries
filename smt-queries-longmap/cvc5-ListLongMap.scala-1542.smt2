; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29182 () Bool)

(assert start!29182)

(declare-fun b!296134 () Bool)

(declare-fun res!155948 () Bool)

(declare-fun e!187171 () Bool)

(assert (=> b!296134 (=> (not res!155948) (not e!187171))))

(declare-datatypes ((array!14985 0))(
  ( (array!14986 (arr!7103 (Array (_ BitVec 32) (_ BitVec 64))) (size!7455 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14985)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14985 (_ BitVec 32)) Bool)

(assert (=> b!296134 (= res!155948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296135 () Bool)

(declare-fun res!155943 () Bool)

(declare-fun e!187170 () Bool)

(assert (=> b!296135 (=> (not res!155943) (not e!187170))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296135 (= res!155943 (validKeyInArray!0 k!2524))))

(declare-fun b!296136 () Bool)

(assert (=> b!296136 (= e!187170 e!187171)))

(declare-fun res!155947 () Bool)

(assert (=> b!296136 (=> (not res!155947) (not e!187171))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2252 0))(
  ( (MissingZero!2252 (index!11178 (_ BitVec 32))) (Found!2252 (index!11179 (_ BitVec 32))) (Intermediate!2252 (undefined!3064 Bool) (index!11180 (_ BitVec 32)) (x!29392 (_ BitVec 32))) (Undefined!2252) (MissingVacant!2252 (index!11181 (_ BitVec 32))) )
))
(declare-fun lt!146991 () SeekEntryResult!2252)

(declare-fun lt!146988 () Bool)

(assert (=> b!296136 (= res!155947 (or lt!146988 (= lt!146991 (MissingVacant!2252 i!1256))))))

(assert (=> b!296136 (= lt!146988 (= lt!146991 (MissingZero!2252 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14985 (_ BitVec 32)) SeekEntryResult!2252)

(assert (=> b!296136 (= lt!146991 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!296137 () Bool)

(declare-fun e!187167 () Bool)

(declare-fun e!187168 () Bool)

(assert (=> b!296137 (= e!187167 e!187168)))

(declare-fun res!155945 () Bool)

(assert (=> b!296137 (=> (not res!155945) (not e!187168))))

(declare-fun lt!146987 () SeekEntryResult!2252)

(declare-fun lt!146986 () Bool)

(assert (=> b!296137 (= res!155945 (and (or lt!146986 (not (undefined!3064 lt!146987))) (or lt!146986 (not (= (select (arr!7103 a!3312) (index!11180 lt!146987)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146986 (not (= (select (arr!7103 a!3312) (index!11180 lt!146987)) k!2524))) (not lt!146986)))))

(assert (=> b!296137 (= lt!146986 (not (is-Intermediate!2252 lt!146987)))))

(declare-fun b!296138 () Bool)

(declare-fun res!155946 () Bool)

(assert (=> b!296138 (=> (not res!155946) (not e!187170))))

(assert (=> b!296138 (= res!155946 (and (= (size!7455 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7455 a!3312))))))

(declare-fun b!296139 () Bool)

(declare-fun res!155942 () Bool)

(assert (=> b!296139 (=> (not res!155942) (not e!187170))))

(declare-fun arrayContainsKey!0 (array!14985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296139 (= res!155942 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!155944 () Bool)

(assert (=> start!29182 (=> (not res!155944) (not e!187170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29182 (= res!155944 (validMask!0 mask!3809))))

(assert (=> start!29182 e!187170))

(assert (=> start!29182 true))

(declare-fun array_inv!5066 (array!14985) Bool)

(assert (=> start!29182 (array_inv!5066 a!3312)))

(declare-fun b!296140 () Bool)

(assert (=> b!296140 (= e!187171 e!187167)))

(declare-fun res!155949 () Bool)

(assert (=> b!296140 (=> (not res!155949) (not e!187167))))

(assert (=> b!296140 (= res!155949 lt!146988)))

(declare-fun lt!146989 () (_ BitVec 32))

(declare-fun lt!146990 () SeekEntryResult!2252)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14985 (_ BitVec 32)) SeekEntryResult!2252)

(assert (=> b!296140 (= lt!146990 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146989 k!2524 (array!14986 (store (arr!7103 a!3312) i!1256 k!2524) (size!7455 a!3312)) mask!3809))))

(assert (=> b!296140 (= lt!146987 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146989 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296140 (= lt!146989 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!296141 () Bool)

(assert (=> b!296141 (= e!187168 (not true))))

(assert (=> b!296141 (and (= (select (arr!7103 a!3312) (index!11180 lt!146987)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11180 lt!146987) i!1256))))

(assert (= (and start!29182 res!155944) b!296138))

(assert (= (and b!296138 res!155946) b!296135))

(assert (= (and b!296135 res!155943) b!296139))

(assert (= (and b!296139 res!155942) b!296136))

(assert (= (and b!296136 res!155947) b!296134))

(assert (= (and b!296134 res!155948) b!296140))

(assert (= (and b!296140 res!155949) b!296137))

(assert (= (and b!296137 res!155945) b!296141))

(declare-fun m!309183 () Bool)

(assert (=> b!296137 m!309183))

(declare-fun m!309185 () Bool)

(assert (=> start!29182 m!309185))

(declare-fun m!309187 () Bool)

(assert (=> start!29182 m!309187))

(declare-fun m!309189 () Bool)

(assert (=> b!296136 m!309189))

(declare-fun m!309191 () Bool)

(assert (=> b!296139 m!309191))

(declare-fun m!309193 () Bool)

(assert (=> b!296140 m!309193))

(declare-fun m!309195 () Bool)

(assert (=> b!296140 m!309195))

(declare-fun m!309197 () Bool)

(assert (=> b!296140 m!309197))

(declare-fun m!309199 () Bool)

(assert (=> b!296140 m!309199))

(assert (=> b!296141 m!309183))

(declare-fun m!309201 () Bool)

(assert (=> b!296135 m!309201))

(declare-fun m!309203 () Bool)

(assert (=> b!296134 m!309203))

(push 1)

