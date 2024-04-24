; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86398 () Bool)

(assert start!86398)

(declare-fun b!999204 () Bool)

(declare-fun e!563572 () Bool)

(declare-fun mask!3464 () (_ BitVec 32))

(assert (=> b!999204 (= e!563572 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun b!999205 () Bool)

(declare-fun res!668441 () Bool)

(declare-fun e!563574 () Bool)

(assert (=> b!999205 (=> (not res!668441) (not e!563574))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999205 (= res!668441 (validKeyInArray!0 k0!2224))))

(declare-fun res!668438 () Bool)

(assert (=> start!86398 (=> (not res!668438) (not e!563574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86398 (= res!668438 (validMask!0 mask!3464))))

(assert (=> start!86398 e!563574))

(declare-datatypes ((array!63171 0))(
  ( (array!63172 (arr!30409 (Array (_ BitVec 32) (_ BitVec 64))) (size!30912 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63171)

(declare-fun array_inv!23545 (array!63171) Bool)

(assert (=> start!86398 (array_inv!23545 a!3219)))

(assert (=> start!86398 true))

(declare-fun b!999206 () Bool)

(declare-fun res!668437 () Bool)

(declare-fun e!563573 () Bool)

(assert (=> b!999206 (=> (not res!668437) (not e!563573))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999206 (= res!668437 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30912 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30912 a!3219))))))

(declare-fun b!999207 () Bool)

(declare-fun res!668443 () Bool)

(assert (=> b!999207 (=> (not res!668443) (not e!563573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63171 (_ BitVec 32)) Bool)

(assert (=> b!999207 (= res!668443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999208 () Bool)

(declare-fun res!668442 () Bool)

(assert (=> b!999208 (=> (not res!668442) (not e!563572))))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9277 0))(
  ( (MissingZero!9277 (index!39479 (_ BitVec 32))) (Found!9277 (index!39480 (_ BitVec 32))) (Intermediate!9277 (undefined!10089 Bool) (index!39481 (_ BitVec 32)) (x!87067 (_ BitVec 32))) (Undefined!9277) (MissingVacant!9277 (index!39482 (_ BitVec 32))) )
))
(declare-fun lt!442036 () SeekEntryResult!9277)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63171 (_ BitVec 32)) SeekEntryResult!9277)

(assert (=> b!999208 (= res!668442 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30409 a!3219) j!170) a!3219 mask!3464) lt!442036))))

(declare-fun b!999209 () Bool)

(declare-fun res!668435 () Bool)

(assert (=> b!999209 (=> (not res!668435) (not e!563574))))

(assert (=> b!999209 (= res!668435 (validKeyInArray!0 (select (arr!30409 a!3219) j!170)))))

(declare-fun b!999210 () Bool)

(assert (=> b!999210 (= e!563574 e!563573)))

(declare-fun res!668440 () Bool)

(assert (=> b!999210 (=> (not res!668440) (not e!563573))))

(declare-fun lt!442037 () SeekEntryResult!9277)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!999210 (= res!668440 (or (= lt!442037 (MissingVacant!9277 i!1194)) (= lt!442037 (MissingZero!9277 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63171 (_ BitVec 32)) SeekEntryResult!9277)

(assert (=> b!999210 (= lt!442037 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!999211 () Bool)

(declare-fun res!668444 () Bool)

(assert (=> b!999211 (=> (not res!668444) (not e!563574))))

(declare-fun arrayContainsKey!0 (array!63171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999211 (= res!668444 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999212 () Bool)

(declare-fun res!668436 () Bool)

(assert (=> b!999212 (=> (not res!668436) (not e!563574))))

(assert (=> b!999212 (= res!668436 (and (= (size!30912 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30912 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30912 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999213 () Bool)

(declare-fun res!668439 () Bool)

(assert (=> b!999213 (=> (not res!668439) (not e!563573))))

(declare-datatypes ((List!21056 0))(
  ( (Nil!21053) (Cons!21052 (h!22229 (_ BitVec 64)) (t!30049 List!21056)) )
))
(declare-fun arrayNoDuplicates!0 (array!63171 (_ BitVec 32) List!21056) Bool)

(assert (=> b!999213 (= res!668439 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21053))))

(declare-fun b!999214 () Bool)

(assert (=> b!999214 (= e!563573 e!563572)))

(declare-fun res!668434 () Bool)

(assert (=> b!999214 (=> (not res!668434) (not e!563572))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999214 (= res!668434 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30409 a!3219) j!170) mask!3464) (select (arr!30409 a!3219) j!170) a!3219 mask!3464) lt!442036))))

(assert (=> b!999214 (= lt!442036 (Intermediate!9277 false resIndex!38 resX!38))))

(assert (= (and start!86398 res!668438) b!999212))

(assert (= (and b!999212 res!668436) b!999209))

(assert (= (and b!999209 res!668435) b!999205))

(assert (= (and b!999205 res!668441) b!999211))

(assert (= (and b!999211 res!668444) b!999210))

(assert (= (and b!999210 res!668440) b!999207))

(assert (= (and b!999207 res!668443) b!999213))

(assert (= (and b!999213 res!668439) b!999206))

(assert (= (and b!999206 res!668437) b!999214))

(assert (= (and b!999214 res!668434) b!999208))

(assert (= (and b!999208 res!668442) b!999204))

(declare-fun m!926183 () Bool)

(assert (=> b!999205 m!926183))

(declare-fun m!926185 () Bool)

(assert (=> start!86398 m!926185))

(declare-fun m!926187 () Bool)

(assert (=> start!86398 m!926187))

(declare-fun m!926189 () Bool)

(assert (=> b!999208 m!926189))

(assert (=> b!999208 m!926189))

(declare-fun m!926191 () Bool)

(assert (=> b!999208 m!926191))

(assert (=> b!999214 m!926189))

(assert (=> b!999214 m!926189))

(declare-fun m!926193 () Bool)

(assert (=> b!999214 m!926193))

(assert (=> b!999214 m!926193))

(assert (=> b!999214 m!926189))

(declare-fun m!926195 () Bool)

(assert (=> b!999214 m!926195))

(declare-fun m!926197 () Bool)

(assert (=> b!999210 m!926197))

(assert (=> b!999209 m!926189))

(assert (=> b!999209 m!926189))

(declare-fun m!926199 () Bool)

(assert (=> b!999209 m!926199))

(declare-fun m!926201 () Bool)

(assert (=> b!999207 m!926201))

(declare-fun m!926203 () Bool)

(assert (=> b!999211 m!926203))

(declare-fun m!926205 () Bool)

(assert (=> b!999213 m!926205))

(check-sat (not b!999209) (not b!999214) (not start!86398) (not b!999208) (not b!999207) (not b!999205) (not b!999210) (not b!999211) (not b!999213))
(check-sat)
