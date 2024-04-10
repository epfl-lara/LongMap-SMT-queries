; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86464 () Bool)

(assert start!86464)

(declare-fun b!1001124 () Bool)

(declare-fun res!670611 () Bool)

(declare-fun e!564154 () Bool)

(assert (=> b!1001124 (=> (not res!670611) (not e!564154))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001124 (= res!670611 (validKeyInArray!0 k0!2224))))

(declare-fun b!1001125 () Bool)

(declare-fun res!670613 () Bool)

(declare-fun e!564153 () Bool)

(assert (=> b!1001125 (=> (not res!670613) (not e!564153))))

(declare-datatypes ((array!63265 0))(
  ( (array!63266 (arr!30458 (Array (_ BitVec 32) (_ BitVec 64))) (size!30960 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63265)

(declare-datatypes ((List!21134 0))(
  ( (Nil!21131) (Cons!21130 (h!22307 (_ BitVec 64)) (t!30135 List!21134)) )
))
(declare-fun arrayNoDuplicates!0 (array!63265 (_ BitVec 32) List!21134) Bool)

(assert (=> b!1001125 (= res!670613 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21131))))

(declare-fun b!1001126 () Bool)

(declare-fun e!564157 () Bool)

(assert (=> b!1001126 (= e!564153 e!564157)))

(declare-fun res!670607 () Bool)

(assert (=> b!1001126 (=> (not res!670607) (not e!564157))))

(declare-datatypes ((SeekEntryResult!9390 0))(
  ( (MissingZero!9390 (index!39931 (_ BitVec 32))) (Found!9390 (index!39932 (_ BitVec 32))) (Intermediate!9390 (undefined!10202 Bool) (index!39933 (_ BitVec 32)) (x!87354 (_ BitVec 32))) (Undefined!9390) (MissingVacant!9390 (index!39934 (_ BitVec 32))) )
))
(declare-fun lt!442525 () SeekEntryResult!9390)

(declare-fun lt!442524 () SeekEntryResult!9390)

(assert (=> b!1001126 (= res!670607 (= lt!442525 lt!442524))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001126 (= lt!442524 (Intermediate!9390 false resIndex!38 resX!38))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63265 (_ BitVec 32)) SeekEntryResult!9390)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001126 (= lt!442525 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30458 a!3219) j!170) mask!3464) (select (arr!30458 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001127 () Bool)

(declare-fun res!670608 () Bool)

(assert (=> b!1001127 (=> (not res!670608) (not e!564153))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1001127 (= res!670608 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30960 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30960 a!3219))))))

(declare-fun b!1001128 () Bool)

(declare-fun res!670605 () Bool)

(assert (=> b!1001128 (=> (not res!670605) (not e!564153))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63265 (_ BitVec 32)) Bool)

(assert (=> b!1001128 (= res!670605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001129 () Bool)

(declare-fun res!670603 () Bool)

(assert (=> b!1001129 (=> (not res!670603) (not e!564154))))

(assert (=> b!1001129 (= res!670603 (validKeyInArray!0 (select (arr!30458 a!3219) j!170)))))

(declare-fun b!1001130 () Bool)

(declare-fun res!670612 () Bool)

(assert (=> b!1001130 (=> (not res!670612) (not e!564154))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1001130 (= res!670612 (and (= (size!30960 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30960 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30960 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!670606 () Bool)

(assert (=> start!86464 (=> (not res!670606) (not e!564154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86464 (= res!670606 (validMask!0 mask!3464))))

(assert (=> start!86464 e!564154))

(declare-fun array_inv!23582 (array!63265) Bool)

(assert (=> start!86464 (array_inv!23582 a!3219)))

(assert (=> start!86464 true))

(declare-fun b!1001131 () Bool)

(assert (=> b!1001131 (= e!564154 e!564153)))

(declare-fun res!670610 () Bool)

(assert (=> b!1001131 (=> (not res!670610) (not e!564153))))

(declare-fun lt!442528 () SeekEntryResult!9390)

(assert (=> b!1001131 (= res!670610 (or (= lt!442528 (MissingVacant!9390 i!1194)) (= lt!442528 (MissingZero!9390 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63265 (_ BitVec 32)) SeekEntryResult!9390)

(assert (=> b!1001131 (= lt!442528 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun e!564152 () Bool)

(declare-fun b!1001132 () Bool)

(assert (=> b!1001132 (= e!564152 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194)) (bvsge mask!3464 #b00000000000000000000000000000000) (bvsge index!1507 (bvadd #b00000000000000000000000000000001 mask!3464))))))

(declare-fun b!1001133 () Bool)

(declare-fun res!670609 () Bool)

(assert (=> b!1001133 (=> (not res!670609) (not e!564154))))

(declare-fun arrayContainsKey!0 (array!63265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001133 (= res!670609 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001134 () Bool)

(declare-fun e!564155 () Bool)

(assert (=> b!1001134 (= e!564155 e!564152)))

(declare-fun res!670602 () Bool)

(assert (=> b!1001134 (=> (not res!670602) (not e!564152))))

(declare-fun lt!442527 () array!63265)

(declare-fun lt!442529 () (_ BitVec 64))

(assert (=> b!1001134 (= res!670602 (not (= lt!442525 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442529 mask!3464) lt!442529 lt!442527 mask!3464))))))

(assert (=> b!1001134 (= lt!442529 (select (store (arr!30458 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1001134 (= lt!442527 (array!63266 (store (arr!30458 a!3219) i!1194 k0!2224) (size!30960 a!3219)))))

(declare-fun b!1001135 () Bool)

(assert (=> b!1001135 (= e!564157 e!564155)))

(declare-fun res!670604 () Bool)

(assert (=> b!1001135 (=> (not res!670604) (not e!564155))))

(declare-fun lt!442526 () SeekEntryResult!9390)

(assert (=> b!1001135 (= res!670604 (= lt!442526 lt!442524))))

(assert (=> b!1001135 (= lt!442526 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30458 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001136 () Bool)

(declare-fun res!670614 () Bool)

(assert (=> b!1001136 (=> (not res!670614) (not e!564152))))

(assert (=> b!1001136 (= res!670614 (not (= lt!442526 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442529 lt!442527 mask!3464))))))

(assert (= (and start!86464 res!670606) b!1001130))

(assert (= (and b!1001130 res!670612) b!1001129))

(assert (= (and b!1001129 res!670603) b!1001124))

(assert (= (and b!1001124 res!670611) b!1001133))

(assert (= (and b!1001133 res!670609) b!1001131))

(assert (= (and b!1001131 res!670610) b!1001128))

(assert (= (and b!1001128 res!670605) b!1001125))

(assert (= (and b!1001125 res!670613) b!1001127))

(assert (= (and b!1001127 res!670608) b!1001126))

(assert (= (and b!1001126 res!670607) b!1001135))

(assert (= (and b!1001135 res!670604) b!1001134))

(assert (= (and b!1001134 res!670602) b!1001136))

(assert (= (and b!1001136 res!670614) b!1001132))

(declare-fun m!927219 () Bool)

(assert (=> b!1001133 m!927219))

(declare-fun m!927221 () Bool)

(assert (=> start!86464 m!927221))

(declare-fun m!927223 () Bool)

(assert (=> start!86464 m!927223))

(declare-fun m!927225 () Bool)

(assert (=> b!1001129 m!927225))

(assert (=> b!1001129 m!927225))

(declare-fun m!927227 () Bool)

(assert (=> b!1001129 m!927227))

(declare-fun m!927229 () Bool)

(assert (=> b!1001128 m!927229))

(declare-fun m!927231 () Bool)

(assert (=> b!1001136 m!927231))

(declare-fun m!927233 () Bool)

(assert (=> b!1001134 m!927233))

(assert (=> b!1001134 m!927233))

(declare-fun m!927235 () Bool)

(assert (=> b!1001134 m!927235))

(declare-fun m!927237 () Bool)

(assert (=> b!1001134 m!927237))

(declare-fun m!927239 () Bool)

(assert (=> b!1001134 m!927239))

(assert (=> b!1001135 m!927225))

(assert (=> b!1001135 m!927225))

(declare-fun m!927241 () Bool)

(assert (=> b!1001135 m!927241))

(declare-fun m!927243 () Bool)

(assert (=> b!1001125 m!927243))

(declare-fun m!927245 () Bool)

(assert (=> b!1001124 m!927245))

(assert (=> b!1001126 m!927225))

(assert (=> b!1001126 m!927225))

(declare-fun m!927247 () Bool)

(assert (=> b!1001126 m!927247))

(assert (=> b!1001126 m!927247))

(assert (=> b!1001126 m!927225))

(declare-fun m!927249 () Bool)

(assert (=> b!1001126 m!927249))

(declare-fun m!927251 () Bool)

(assert (=> b!1001131 m!927251))

(check-sat (not b!1001129) (not b!1001124) (not b!1001125) (not b!1001131) (not b!1001135) (not b!1001134) (not b!1001128) (not start!86464) (not b!1001133) (not b!1001126) (not b!1001136))
(check-sat)
