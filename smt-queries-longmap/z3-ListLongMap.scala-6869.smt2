; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86470 () Bool)

(assert start!86470)

(declare-fun b!1001241 () Bool)

(declare-fun e!564209 () Bool)

(declare-fun e!564211 () Bool)

(assert (=> b!1001241 (= e!564209 e!564211)))

(declare-fun res!670731 () Bool)

(assert (=> b!1001241 (=> (not res!670731) (not e!564211))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9393 0))(
  ( (MissingZero!9393 (index!39943 (_ BitVec 32))) (Found!9393 (index!39944 (_ BitVec 32))) (Intermediate!9393 (undefined!10205 Bool) (index!39945 (_ BitVec 32)) (x!87365 (_ BitVec 32))) (Undefined!9393) (MissingVacant!9393 (index!39946 (_ BitVec 32))) )
))
(declare-fun lt!442579 () SeekEntryResult!9393)

(declare-datatypes ((array!63271 0))(
  ( (array!63272 (arr!30461 (Array (_ BitVec 32) (_ BitVec 64))) (size!30963 (_ BitVec 32))) )
))
(declare-fun lt!442583 () array!63271)

(declare-fun lt!442578 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63271 (_ BitVec 32)) SeekEntryResult!9393)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001241 (= res!670731 (not (= lt!442579 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442578 mask!3464) lt!442578 lt!442583 mask!3464))))))

(declare-fun a!3219 () array!63271)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1001241 (= lt!442578 (select (store (arr!30461 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1001241 (= lt!442583 (array!63272 (store (arr!30461 a!3219) i!1194 k0!2224) (size!30963 a!3219)))))

(declare-fun b!1001242 () Bool)

(declare-fun res!670721 () Bool)

(declare-fun e!564208 () Bool)

(assert (=> b!1001242 (=> (not res!670721) (not e!564208))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001242 (= res!670721 (validKeyInArray!0 k0!2224))))

(declare-fun b!1001243 () Bool)

(declare-fun e!564207 () Bool)

(assert (=> b!1001243 (= e!564208 e!564207)))

(declare-fun res!670726 () Bool)

(assert (=> b!1001243 (=> (not res!670726) (not e!564207))))

(declare-fun lt!442582 () SeekEntryResult!9393)

(assert (=> b!1001243 (= res!670726 (or (= lt!442582 (MissingVacant!9393 i!1194)) (= lt!442582 (MissingZero!9393 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63271 (_ BitVec 32)) SeekEntryResult!9393)

(assert (=> b!1001243 (= lt!442582 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!670724 () Bool)

(assert (=> start!86470 (=> (not res!670724) (not e!564208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86470 (= res!670724 (validMask!0 mask!3464))))

(assert (=> start!86470 e!564208))

(declare-fun array_inv!23585 (array!63271) Bool)

(assert (=> start!86470 (array_inv!23585 a!3219)))

(assert (=> start!86470 true))

(declare-fun b!1001244 () Bool)

(declare-fun e!564206 () Bool)

(assert (=> b!1001244 (= e!564207 e!564206)))

(declare-fun res!670727 () Bool)

(assert (=> b!1001244 (=> (not res!670727) (not e!564206))))

(declare-fun lt!442580 () SeekEntryResult!9393)

(assert (=> b!1001244 (= res!670727 (= lt!442579 lt!442580))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001244 (= lt!442580 (Intermediate!9393 false resIndex!38 resX!38))))

(assert (=> b!1001244 (= lt!442579 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30461 a!3219) j!170) mask!3464) (select (arr!30461 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001245 () Bool)

(declare-fun res!670728 () Bool)

(assert (=> b!1001245 (=> (not res!670728) (not e!564208))))

(declare-fun arrayContainsKey!0 (array!63271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001245 (= res!670728 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001246 () Bool)

(declare-fun res!670722 () Bool)

(assert (=> b!1001246 (=> (not res!670722) (not e!564207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63271 (_ BitVec 32)) Bool)

(assert (=> b!1001246 (= res!670722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001247 () Bool)

(declare-fun res!670730 () Bool)

(assert (=> b!1001247 (=> (not res!670730) (not e!564207))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1001247 (= res!670730 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30963 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30963 a!3219))))))

(declare-fun b!1001248 () Bool)

(assert (=> b!1001248 (= e!564211 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194)) (bvsge mask!3464 #b00000000000000000000000000000000) (bvslt index!1507 (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsgt x!1245 #b01111111111111111111111111111110)))))

(declare-fun b!1001249 () Bool)

(declare-fun res!670725 () Bool)

(assert (=> b!1001249 (=> (not res!670725) (not e!564208))))

(assert (=> b!1001249 (= res!670725 (validKeyInArray!0 (select (arr!30461 a!3219) j!170)))))

(declare-fun b!1001250 () Bool)

(declare-fun res!670720 () Bool)

(assert (=> b!1001250 (=> (not res!670720) (not e!564211))))

(declare-fun lt!442581 () SeekEntryResult!9393)

(assert (=> b!1001250 (= res!670720 (not (= lt!442581 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442578 lt!442583 mask!3464))))))

(declare-fun b!1001251 () Bool)

(declare-fun res!670729 () Bool)

(assert (=> b!1001251 (=> (not res!670729) (not e!564207))))

(declare-datatypes ((List!21137 0))(
  ( (Nil!21134) (Cons!21133 (h!22310 (_ BitVec 64)) (t!30138 List!21137)) )
))
(declare-fun arrayNoDuplicates!0 (array!63271 (_ BitVec 32) List!21137) Bool)

(assert (=> b!1001251 (= res!670729 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21134))))

(declare-fun b!1001252 () Bool)

(assert (=> b!1001252 (= e!564206 e!564209)))

(declare-fun res!670719 () Bool)

(assert (=> b!1001252 (=> (not res!670719) (not e!564209))))

(assert (=> b!1001252 (= res!670719 (= lt!442581 lt!442580))))

(assert (=> b!1001252 (= lt!442581 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30461 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001253 () Bool)

(declare-fun res!670723 () Bool)

(assert (=> b!1001253 (=> (not res!670723) (not e!564208))))

(assert (=> b!1001253 (= res!670723 (and (= (size!30963 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30963 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30963 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86470 res!670724) b!1001253))

(assert (= (and b!1001253 res!670723) b!1001249))

(assert (= (and b!1001249 res!670725) b!1001242))

(assert (= (and b!1001242 res!670721) b!1001245))

(assert (= (and b!1001245 res!670728) b!1001243))

(assert (= (and b!1001243 res!670726) b!1001246))

(assert (= (and b!1001246 res!670722) b!1001251))

(assert (= (and b!1001251 res!670729) b!1001247))

(assert (= (and b!1001247 res!670730) b!1001244))

(assert (= (and b!1001244 res!670727) b!1001252))

(assert (= (and b!1001252 res!670719) b!1001241))

(assert (= (and b!1001241 res!670731) b!1001250))

(assert (= (and b!1001250 res!670720) b!1001248))

(declare-fun m!927321 () Bool)

(assert (=> b!1001244 m!927321))

(assert (=> b!1001244 m!927321))

(declare-fun m!927323 () Bool)

(assert (=> b!1001244 m!927323))

(assert (=> b!1001244 m!927323))

(assert (=> b!1001244 m!927321))

(declare-fun m!927325 () Bool)

(assert (=> b!1001244 m!927325))

(declare-fun m!927327 () Bool)

(assert (=> b!1001241 m!927327))

(assert (=> b!1001241 m!927327))

(declare-fun m!927329 () Bool)

(assert (=> b!1001241 m!927329))

(declare-fun m!927331 () Bool)

(assert (=> b!1001241 m!927331))

(declare-fun m!927333 () Bool)

(assert (=> b!1001241 m!927333))

(declare-fun m!927335 () Bool)

(assert (=> b!1001242 m!927335))

(declare-fun m!927337 () Bool)

(assert (=> b!1001243 m!927337))

(declare-fun m!927339 () Bool)

(assert (=> b!1001250 m!927339))

(declare-fun m!927341 () Bool)

(assert (=> start!86470 m!927341))

(declare-fun m!927343 () Bool)

(assert (=> start!86470 m!927343))

(declare-fun m!927345 () Bool)

(assert (=> b!1001245 m!927345))

(assert (=> b!1001249 m!927321))

(assert (=> b!1001249 m!927321))

(declare-fun m!927347 () Bool)

(assert (=> b!1001249 m!927347))

(assert (=> b!1001252 m!927321))

(assert (=> b!1001252 m!927321))

(declare-fun m!927349 () Bool)

(assert (=> b!1001252 m!927349))

(declare-fun m!927351 () Bool)

(assert (=> b!1001246 m!927351))

(declare-fun m!927353 () Bool)

(assert (=> b!1001251 m!927353))

(check-sat (not b!1001245) (not b!1001250) (not b!1001249) (not b!1001251) (not b!1001241) (not b!1001243) (not b!1001244) (not b!1001242) (not b!1001246) (not start!86470) (not b!1001252))
(check-sat)
