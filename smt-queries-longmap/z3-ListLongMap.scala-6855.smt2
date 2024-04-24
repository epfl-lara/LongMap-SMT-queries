; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86560 () Bool)

(assert start!86560)

(declare-fun b!1000628 () Bool)

(declare-fun res!669550 () Bool)

(declare-fun e!564241 () Bool)

(assert (=> b!1000628 (=> (not res!669550) (not e!564241))))

(declare-datatypes ((array!63231 0))(
  ( (array!63232 (arr!30436 (Array (_ BitVec 32) (_ BitVec 64))) (size!30939 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63231)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9304 0))(
  ( (MissingZero!9304 (index!39587 (_ BitVec 32))) (Found!9304 (index!39588 (_ BitVec 32))) (Intermediate!9304 (undefined!10116 Bool) (index!39589 (_ BitVec 32)) (x!87178 (_ BitVec 32))) (Undefined!9304) (MissingVacant!9304 (index!39590 (_ BitVec 32))) )
))
(declare-fun lt!442462 () SeekEntryResult!9304)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63231 (_ BitVec 32)) SeekEntryResult!9304)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000628 (= res!669550 (not (= lt!442462 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30436 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30436 a!3219) i!1194 k0!2224) j!170) (array!63232 (store (arr!30436 a!3219) i!1194 k0!2224) (size!30939 a!3219)) mask!3464))))))

(declare-fun b!1000630 () Bool)

(declare-fun res!669551 () Bool)

(assert (=> b!1000630 (=> (not res!669551) (not e!564241))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!442461 () SeekEntryResult!9304)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1000630 (= res!669551 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30436 a!3219) j!170) a!3219 mask!3464) lt!442461))))

(declare-fun b!1000631 () Bool)

(declare-fun e!564243 () Bool)

(assert (=> b!1000631 (= e!564243 e!564241)))

(declare-fun res!669542 () Bool)

(assert (=> b!1000631 (=> (not res!669542) (not e!564241))))

(assert (=> b!1000631 (= res!669542 (= lt!442462 lt!442461))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000631 (= lt!442461 (Intermediate!9304 false resIndex!38 resX!38))))

(assert (=> b!1000631 (= lt!442462 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30436 a!3219) j!170) mask!3464) (select (arr!30436 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000632 () Bool)

(declare-fun res!669546 () Bool)

(declare-fun e!564242 () Bool)

(assert (=> b!1000632 (=> (not res!669546) (not e!564242))))

(declare-fun arrayContainsKey!0 (array!63231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000632 (= res!669546 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000633 () Bool)

(declare-fun res!669540 () Bool)

(assert (=> b!1000633 (=> (not res!669540) (not e!564242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000633 (= res!669540 (validKeyInArray!0 (select (arr!30436 a!3219) j!170)))))

(declare-fun b!1000634 () Bool)

(declare-fun res!669545 () Bool)

(assert (=> b!1000634 (=> (not res!669545) (not e!564243))))

(assert (=> b!1000634 (= res!669545 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30939 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30939 a!3219))))))

(declare-fun b!1000635 () Bool)

(declare-fun res!669547 () Bool)

(assert (=> b!1000635 (=> (not res!669547) (not e!564242))))

(assert (=> b!1000635 (= res!669547 (and (= (size!30939 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30939 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30939 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000636 () Bool)

(declare-fun res!669549 () Bool)

(assert (=> b!1000636 (=> (not res!669549) (not e!564242))))

(assert (=> b!1000636 (= res!669549 (validKeyInArray!0 k0!2224))))

(declare-fun b!1000629 () Bool)

(declare-fun res!669541 () Bool)

(assert (=> b!1000629 (=> (not res!669541) (not e!564243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63231 (_ BitVec 32)) Bool)

(assert (=> b!1000629 (= res!669541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!669548 () Bool)

(assert (=> start!86560 (=> (not res!669548) (not e!564242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86560 (= res!669548 (validMask!0 mask!3464))))

(assert (=> start!86560 e!564242))

(declare-fun array_inv!23572 (array!63231) Bool)

(assert (=> start!86560 (array_inv!23572 a!3219)))

(assert (=> start!86560 true))

(declare-fun b!1000637 () Bool)

(assert (=> b!1000637 (= e!564242 e!564243)))

(declare-fun res!669544 () Bool)

(assert (=> b!1000637 (=> (not res!669544) (not e!564243))))

(declare-fun lt!442463 () SeekEntryResult!9304)

(assert (=> b!1000637 (= res!669544 (or (= lt!442463 (MissingVacant!9304 i!1194)) (= lt!442463 (MissingZero!9304 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63231 (_ BitVec 32)) SeekEntryResult!9304)

(assert (=> b!1000637 (= lt!442463 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1000638 () Bool)

(declare-fun res!669543 () Bool)

(assert (=> b!1000638 (=> (not res!669543) (not e!564243))))

(declare-datatypes ((List!21083 0))(
  ( (Nil!21080) (Cons!21079 (h!22262 (_ BitVec 64)) (t!30076 List!21083)) )
))
(declare-fun arrayNoDuplicates!0 (array!63231 (_ BitVec 32) List!21083) Bool)

(assert (=> b!1000638 (= res!669543 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21080))))

(declare-fun b!1000639 () Bool)

(assert (=> b!1000639 (= e!564241 (bvslt mask!3464 #b00000000000000000000000000000000))))

(assert (= (and start!86560 res!669548) b!1000635))

(assert (= (and b!1000635 res!669547) b!1000633))

(assert (= (and b!1000633 res!669540) b!1000636))

(assert (= (and b!1000636 res!669549) b!1000632))

(assert (= (and b!1000632 res!669546) b!1000637))

(assert (= (and b!1000637 res!669544) b!1000629))

(assert (= (and b!1000629 res!669541) b!1000638))

(assert (= (and b!1000638 res!669543) b!1000634))

(assert (= (and b!1000634 res!669545) b!1000631))

(assert (= (and b!1000631 res!669542) b!1000630))

(assert (= (and b!1000630 res!669551) b!1000628))

(assert (= (and b!1000628 res!669550) b!1000639))

(declare-fun m!927257 () Bool)

(assert (=> b!1000631 m!927257))

(assert (=> b!1000631 m!927257))

(declare-fun m!927259 () Bool)

(assert (=> b!1000631 m!927259))

(assert (=> b!1000631 m!927259))

(assert (=> b!1000631 m!927257))

(declare-fun m!927261 () Bool)

(assert (=> b!1000631 m!927261))

(declare-fun m!927263 () Bool)

(assert (=> b!1000637 m!927263))

(declare-fun m!927265 () Bool)

(assert (=> b!1000638 m!927265))

(declare-fun m!927267 () Bool)

(assert (=> b!1000628 m!927267))

(declare-fun m!927269 () Bool)

(assert (=> b!1000628 m!927269))

(assert (=> b!1000628 m!927269))

(declare-fun m!927271 () Bool)

(assert (=> b!1000628 m!927271))

(assert (=> b!1000628 m!927271))

(assert (=> b!1000628 m!927269))

(declare-fun m!927273 () Bool)

(assert (=> b!1000628 m!927273))

(assert (=> b!1000633 m!927257))

(assert (=> b!1000633 m!927257))

(declare-fun m!927275 () Bool)

(assert (=> b!1000633 m!927275))

(declare-fun m!927277 () Bool)

(assert (=> b!1000629 m!927277))

(declare-fun m!927279 () Bool)

(assert (=> b!1000632 m!927279))

(declare-fun m!927281 () Bool)

(assert (=> b!1000636 m!927281))

(declare-fun m!927283 () Bool)

(assert (=> start!86560 m!927283))

(declare-fun m!927285 () Bool)

(assert (=> start!86560 m!927285))

(assert (=> b!1000630 m!927257))

(assert (=> b!1000630 m!927257))

(declare-fun m!927287 () Bool)

(assert (=> b!1000630 m!927287))

(check-sat (not b!1000631) (not b!1000628) (not start!86560) (not b!1000637) (not b!1000632) (not b!1000636) (not b!1000633) (not b!1000638) (not b!1000630) (not b!1000629))
(check-sat)
