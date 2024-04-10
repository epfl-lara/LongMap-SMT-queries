; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86778 () Bool)

(assert start!86778)

(declare-fun b!1006088 () Bool)

(declare-fun res!675183 () Bool)

(declare-fun e!566368 () Bool)

(assert (=> b!1006088 (=> (not res!675183) (not e!566368))))

(declare-datatypes ((array!63477 0))(
  ( (array!63478 (arr!30561 (Array (_ BitVec 32) (_ BitVec 64))) (size!31063 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63477)

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9493 0))(
  ( (MissingZero!9493 (index!40343 (_ BitVec 32))) (Found!9493 (index!40344 (_ BitVec 32))) (Intermediate!9493 (undefined!10305 Bool) (index!40345 (_ BitVec 32)) (x!87741 (_ BitVec 32))) (Undefined!9493) (MissingVacant!9493 (index!40346 (_ BitVec 32))) )
))
(declare-fun lt!444692 () SeekEntryResult!9493)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63477 (_ BitVec 32)) SeekEntryResult!9493)

(assert (=> b!1006088 (= res!675183 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30561 a!3219) j!170) a!3219 mask!3464) lt!444692))))

(declare-fun b!1006089 () Bool)

(declare-fun res!675186 () Bool)

(declare-fun e!566371 () Bool)

(assert (=> b!1006089 (=> (not res!675186) (not e!566371))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006089 (= res!675186 (validKeyInArray!0 k!2224))))

(declare-fun b!1006090 () Bool)

(declare-fun e!566370 () Bool)

(assert (=> b!1006090 (= e!566370 e!566368)))

(declare-fun res!675184 () Bool)

(assert (=> b!1006090 (=> (not res!675184) (not e!566368))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006090 (= res!675184 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30561 a!3219) j!170) mask!3464) (select (arr!30561 a!3219) j!170) a!3219 mask!3464) lt!444692))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006090 (= lt!444692 (Intermediate!9493 false resIndex!38 resX!38))))

(declare-fun b!1006091 () Bool)

(declare-fun res!675182 () Bool)

(assert (=> b!1006091 (=> (not res!675182) (not e!566371))))

(declare-fun arrayContainsKey!0 (array!63477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006091 (= res!675182 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006092 () Bool)

(declare-fun res!675179 () Bool)

(assert (=> b!1006092 (=> (not res!675179) (not e!566371))))

(assert (=> b!1006092 (= res!675179 (validKeyInArray!0 (select (arr!30561 a!3219) j!170)))))

(declare-fun b!1006093 () Bool)

(declare-fun res!675185 () Bool)

(assert (=> b!1006093 (=> (not res!675185) (not e!566370))))

(declare-datatypes ((List!21237 0))(
  ( (Nil!21234) (Cons!21233 (h!22416 (_ BitVec 64)) (t!30238 List!21237)) )
))
(declare-fun arrayNoDuplicates!0 (array!63477 (_ BitVec 32) List!21237) Bool)

(assert (=> b!1006093 (= res!675185 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21234))))

(declare-fun res!675181 () Bool)

(assert (=> start!86778 (=> (not res!675181) (not e!566371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86778 (= res!675181 (validMask!0 mask!3464))))

(assert (=> start!86778 e!566371))

(declare-fun array_inv!23685 (array!63477) Bool)

(assert (=> start!86778 (array_inv!23685 a!3219)))

(assert (=> start!86778 true))

(declare-fun b!1006094 () Bool)

(assert (=> b!1006094 (= e!566371 e!566370)))

(declare-fun res!675178 () Bool)

(assert (=> b!1006094 (=> (not res!675178) (not e!566370))))

(declare-fun lt!444690 () SeekEntryResult!9493)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006094 (= res!675178 (or (= lt!444690 (MissingVacant!9493 i!1194)) (= lt!444690 (MissingZero!9493 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63477 (_ BitVec 32)) SeekEntryResult!9493)

(assert (=> b!1006094 (= lt!444690 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1006095 () Bool)

(declare-fun res!675180 () Bool)

(assert (=> b!1006095 (=> (not res!675180) (not e!566370))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63477 (_ BitVec 32)) Bool)

(assert (=> b!1006095 (= res!675180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006096 () Bool)

(declare-fun res!675176 () Bool)

(assert (=> b!1006096 (=> (not res!675176) (not e!566371))))

(assert (=> b!1006096 (= res!675176 (and (= (size!31063 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31063 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31063 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006097 () Bool)

(declare-fun res!675177 () Bool)

(assert (=> b!1006097 (=> (not res!675177) (not e!566370))))

(assert (=> b!1006097 (= res!675177 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31063 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31063 a!3219))))))

(declare-fun b!1006098 () Bool)

(assert (=> b!1006098 (= e!566368 false)))

(declare-fun lt!444691 () (_ BitVec 32))

(assert (=> b!1006098 (= lt!444691 (toIndex!0 (select (store (arr!30561 a!3219) i!1194 k!2224) j!170) mask!3464))))

(assert (= (and start!86778 res!675181) b!1006096))

(assert (= (and b!1006096 res!675176) b!1006092))

(assert (= (and b!1006092 res!675179) b!1006089))

(assert (= (and b!1006089 res!675186) b!1006091))

(assert (= (and b!1006091 res!675182) b!1006094))

(assert (= (and b!1006094 res!675178) b!1006095))

(assert (= (and b!1006095 res!675180) b!1006093))

(assert (= (and b!1006093 res!675185) b!1006097))

(assert (= (and b!1006097 res!675177) b!1006090))

(assert (= (and b!1006090 res!675184) b!1006088))

(assert (= (and b!1006088 res!675183) b!1006098))

(declare-fun m!931205 () Bool)

(assert (=> b!1006095 m!931205))

(declare-fun m!931207 () Bool)

(assert (=> b!1006093 m!931207))

(declare-fun m!931209 () Bool)

(assert (=> b!1006090 m!931209))

(assert (=> b!1006090 m!931209))

(declare-fun m!931211 () Bool)

(assert (=> b!1006090 m!931211))

(assert (=> b!1006090 m!931211))

(assert (=> b!1006090 m!931209))

(declare-fun m!931213 () Bool)

(assert (=> b!1006090 m!931213))

(declare-fun m!931215 () Bool)

(assert (=> b!1006091 m!931215))

(assert (=> b!1006092 m!931209))

(assert (=> b!1006092 m!931209))

(declare-fun m!931217 () Bool)

(assert (=> b!1006092 m!931217))

(declare-fun m!931219 () Bool)

(assert (=> b!1006094 m!931219))

(declare-fun m!931221 () Bool)

(assert (=> b!1006098 m!931221))

(declare-fun m!931223 () Bool)

(assert (=> b!1006098 m!931223))

(assert (=> b!1006098 m!931223))

(declare-fun m!931225 () Bool)

(assert (=> b!1006098 m!931225))

(declare-fun m!931227 () Bool)

(assert (=> b!1006089 m!931227))

(assert (=> b!1006088 m!931209))

(assert (=> b!1006088 m!931209))

(declare-fun m!931229 () Bool)

(assert (=> b!1006088 m!931229))

(declare-fun m!931231 () Bool)

(assert (=> start!86778 m!931231))

(declare-fun m!931233 () Bool)

(assert (=> start!86778 m!931233))

(push 1)

(assert (not b!1006091))

(assert (not b!1006094))

(assert (not b!1006090))

(assert (not b!1006089))

