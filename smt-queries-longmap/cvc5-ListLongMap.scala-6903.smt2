; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86780 () Bool)

(assert start!86780)

(declare-fun b!1006121 () Bool)

(declare-fun res!675214 () Bool)

(declare-fun e!566381 () Bool)

(assert (=> b!1006121 (=> (not res!675214) (not e!566381))))

(declare-datatypes ((array!63479 0))(
  ( (array!63480 (arr!30562 (Array (_ BitVec 32) (_ BitVec 64))) (size!31064 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63479)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006121 (= res!675214 (validKeyInArray!0 (select (arr!30562 a!3219) j!170)))))

(declare-fun b!1006122 () Bool)

(declare-fun res!675213 () Bool)

(declare-fun e!566383 () Bool)

(assert (=> b!1006122 (=> (not res!675213) (not e!566383))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9494 0))(
  ( (MissingZero!9494 (index!40347 (_ BitVec 32))) (Found!9494 (index!40348 (_ BitVec 32))) (Intermediate!9494 (undefined!10306 Bool) (index!40349 (_ BitVec 32)) (x!87750 (_ BitVec 32))) (Undefined!9494) (MissingVacant!9494 (index!40350 (_ BitVec 32))) )
))
(declare-fun lt!444699 () SeekEntryResult!9494)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63479 (_ BitVec 32)) SeekEntryResult!9494)

(assert (=> b!1006122 (= res!675213 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30562 a!3219) j!170) a!3219 mask!3464) lt!444699))))

(declare-fun b!1006123 () Bool)

(declare-fun res!675212 () Bool)

(declare-fun e!566380 () Bool)

(assert (=> b!1006123 (=> (not res!675212) (not e!566380))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006123 (= res!675212 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31064 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31064 a!3219))))))

(declare-fun b!1006124 () Bool)

(declare-fun res!675215 () Bool)

(assert (=> b!1006124 (=> (not res!675215) (not e!566380))))

(declare-datatypes ((List!21238 0))(
  ( (Nil!21235) (Cons!21234 (h!22417 (_ BitVec 64)) (t!30239 List!21238)) )
))
(declare-fun arrayNoDuplicates!0 (array!63479 (_ BitVec 32) List!21238) Bool)

(assert (=> b!1006124 (= res!675215 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21235))))

(declare-fun b!1006125 () Bool)

(declare-fun res!675217 () Bool)

(assert (=> b!1006125 (=> (not res!675217) (not e!566381))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006125 (= res!675217 (and (= (size!31064 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31064 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31064 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006126 () Bool)

(assert (=> b!1006126 (= e!566380 e!566383)))

(declare-fun res!675210 () Bool)

(assert (=> b!1006126 (=> (not res!675210) (not e!566383))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006126 (= res!675210 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30562 a!3219) j!170) mask!3464) (select (arr!30562 a!3219) j!170) a!3219 mask!3464) lt!444699))))

(assert (=> b!1006126 (= lt!444699 (Intermediate!9494 false resIndex!38 resX!38))))

(declare-fun res!675209 () Bool)

(assert (=> start!86780 (=> (not res!675209) (not e!566381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86780 (= res!675209 (validMask!0 mask!3464))))

(assert (=> start!86780 e!566381))

(declare-fun array_inv!23686 (array!63479) Bool)

(assert (=> start!86780 (array_inv!23686 a!3219)))

(assert (=> start!86780 true))

(declare-fun b!1006127 () Bool)

(assert (=> b!1006127 (= e!566381 e!566380)))

(declare-fun res!675218 () Bool)

(assert (=> b!1006127 (=> (not res!675218) (not e!566380))))

(declare-fun lt!444700 () SeekEntryResult!9494)

(assert (=> b!1006127 (= res!675218 (or (= lt!444700 (MissingVacant!9494 i!1194)) (= lt!444700 (MissingZero!9494 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63479 (_ BitVec 32)) SeekEntryResult!9494)

(assert (=> b!1006127 (= lt!444700 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1006128 () Bool)

(declare-fun res!675219 () Bool)

(assert (=> b!1006128 (=> (not res!675219) (not e!566381))))

(assert (=> b!1006128 (= res!675219 (validKeyInArray!0 k!2224))))

(declare-fun b!1006129 () Bool)

(declare-fun res!675211 () Bool)

(assert (=> b!1006129 (=> (not res!675211) (not e!566381))))

(declare-fun arrayContainsKey!0 (array!63479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006129 (= res!675211 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006130 () Bool)

(declare-fun res!675216 () Bool)

(assert (=> b!1006130 (=> (not res!675216) (not e!566380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63479 (_ BitVec 32)) Bool)

(assert (=> b!1006130 (= res!675216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006131 () Bool)

(assert (=> b!1006131 (= e!566383 false)))

(declare-fun lt!444701 () (_ BitVec 32))

(assert (=> b!1006131 (= lt!444701 (toIndex!0 (select (store (arr!30562 a!3219) i!1194 k!2224) j!170) mask!3464))))

(assert (= (and start!86780 res!675209) b!1006125))

(assert (= (and b!1006125 res!675217) b!1006121))

(assert (= (and b!1006121 res!675214) b!1006128))

(assert (= (and b!1006128 res!675219) b!1006129))

(assert (= (and b!1006129 res!675211) b!1006127))

(assert (= (and b!1006127 res!675218) b!1006130))

(assert (= (and b!1006130 res!675216) b!1006124))

(assert (= (and b!1006124 res!675215) b!1006123))

(assert (= (and b!1006123 res!675212) b!1006126))

(assert (= (and b!1006126 res!675210) b!1006122))

(assert (= (and b!1006122 res!675213) b!1006131))

(declare-fun m!931235 () Bool)

(assert (=> b!1006131 m!931235))

(declare-fun m!931237 () Bool)

(assert (=> b!1006131 m!931237))

(assert (=> b!1006131 m!931237))

(declare-fun m!931239 () Bool)

(assert (=> b!1006131 m!931239))

(declare-fun m!931241 () Bool)

(assert (=> b!1006129 m!931241))

(declare-fun m!931243 () Bool)

(assert (=> b!1006122 m!931243))

(assert (=> b!1006122 m!931243))

(declare-fun m!931245 () Bool)

(assert (=> b!1006122 m!931245))

(declare-fun m!931247 () Bool)

(assert (=> b!1006124 m!931247))

(declare-fun m!931249 () Bool)

(assert (=> b!1006127 m!931249))

(declare-fun m!931251 () Bool)

(assert (=> b!1006130 m!931251))

(declare-fun m!931253 () Bool)

(assert (=> start!86780 m!931253))

(declare-fun m!931255 () Bool)

(assert (=> start!86780 m!931255))

(assert (=> b!1006126 m!931243))

(assert (=> b!1006126 m!931243))

(declare-fun m!931257 () Bool)

(assert (=> b!1006126 m!931257))

(assert (=> b!1006126 m!931257))

(assert (=> b!1006126 m!931243))

(declare-fun m!931259 () Bool)

(assert (=> b!1006126 m!931259))

(assert (=> b!1006121 m!931243))

(assert (=> b!1006121 m!931243))

(declare-fun m!931261 () Bool)

(assert (=> b!1006121 m!931261))

(declare-fun m!931263 () Bool)

(assert (=> b!1006128 m!931263))

(push 1)

