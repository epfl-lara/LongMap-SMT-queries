; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86566 () Bool)

(assert start!86566)

(declare-fun b!1000734 () Bool)

(declare-fun res!669648 () Bool)

(declare-fun e!564279 () Bool)

(assert (=> b!1000734 (=> (not res!669648) (not e!564279))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000734 (= res!669648 (validKeyInArray!0 k0!2224))))

(declare-fun res!669647 () Bool)

(assert (=> start!86566 (=> (not res!669647) (not e!564279))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86566 (= res!669647 (validMask!0 mask!3464))))

(assert (=> start!86566 e!564279))

(declare-datatypes ((array!63237 0))(
  ( (array!63238 (arr!30439 (Array (_ BitVec 32) (_ BitVec 64))) (size!30942 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63237)

(declare-fun array_inv!23575 (array!63237) Bool)

(assert (=> start!86566 (array_inv!23575 a!3219)))

(assert (=> start!86566 true))

(declare-fun b!1000735 () Bool)

(declare-fun e!564278 () Bool)

(declare-fun e!564277 () Bool)

(assert (=> b!1000735 (= e!564278 e!564277)))

(declare-fun res!669646 () Bool)

(assert (=> b!1000735 (=> (not res!669646) (not e!564277))))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9307 0))(
  ( (MissingZero!9307 (index!39599 (_ BitVec 32))) (Found!9307 (index!39600 (_ BitVec 32))) (Intermediate!9307 (undefined!10119 Bool) (index!39601 (_ BitVec 32)) (x!87189 (_ BitVec 32))) (Undefined!9307) (MissingVacant!9307 (index!39602 (_ BitVec 32))) )
))
(declare-fun lt!442490 () SeekEntryResult!9307)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63237 (_ BitVec 32)) SeekEntryResult!9307)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000735 (= res!669646 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30439 a!3219) j!170) mask!3464) (select (arr!30439 a!3219) j!170) a!3219 mask!3464) lt!442490))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000735 (= lt!442490 (Intermediate!9307 false resIndex!38 resX!38))))

(declare-fun b!1000736 () Bool)

(declare-fun res!669655 () Bool)

(assert (=> b!1000736 (=> (not res!669655) (not e!564278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63237 (_ BitVec 32)) Bool)

(assert (=> b!1000736 (= res!669655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000737 () Bool)

(assert (=> b!1000737 (= e!564279 e!564278)))

(declare-fun res!669656 () Bool)

(assert (=> b!1000737 (=> (not res!669656) (not e!564278))))

(declare-fun lt!442489 () SeekEntryResult!9307)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1000737 (= res!669656 (or (= lt!442489 (MissingVacant!9307 i!1194)) (= lt!442489 (MissingZero!9307 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63237 (_ BitVec 32)) SeekEntryResult!9307)

(assert (=> b!1000737 (= lt!442489 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1000738 () Bool)

(declare-fun res!669654 () Bool)

(assert (=> b!1000738 (=> (not res!669654) (not e!564278))))

(declare-datatypes ((List!21086 0))(
  ( (Nil!21083) (Cons!21082 (h!22265 (_ BitVec 64)) (t!30079 List!21086)) )
))
(declare-fun arrayNoDuplicates!0 (array!63237 (_ BitVec 32) List!21086) Bool)

(assert (=> b!1000738 (= res!669654 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21083))))

(declare-fun b!1000739 () Bool)

(declare-fun res!669649 () Bool)

(assert (=> b!1000739 (=> (not res!669649) (not e!564278))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1000739 (= res!669649 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30942 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30942 a!3219))))))

(declare-fun b!1000740 () Bool)

(declare-fun res!669653 () Bool)

(assert (=> b!1000740 (=> (not res!669653) (not e!564279))))

(assert (=> b!1000740 (= res!669653 (and (= (size!30942 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30942 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30942 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000741 () Bool)

(declare-fun res!669650 () Bool)

(assert (=> b!1000741 (=> (not res!669650) (not e!564279))))

(assert (=> b!1000741 (= res!669650 (validKeyInArray!0 (select (arr!30439 a!3219) j!170)))))

(declare-fun b!1000742 () Bool)

(declare-fun res!669651 () Bool)

(assert (=> b!1000742 (=> (not res!669651) (not e!564279))))

(declare-fun arrayContainsKey!0 (array!63237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000742 (= res!669651 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000743 () Bool)

(assert (=> b!1000743 (= e!564277 false)))

(declare-fun lt!442488 () SeekEntryResult!9307)

(assert (=> b!1000743 (= lt!442488 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30439 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30439 a!3219) i!1194 k0!2224) j!170) (array!63238 (store (arr!30439 a!3219) i!1194 k0!2224) (size!30942 a!3219)) mask!3464))))

(declare-fun b!1000744 () Bool)

(declare-fun res!669652 () Bool)

(assert (=> b!1000744 (=> (not res!669652) (not e!564277))))

(assert (=> b!1000744 (= res!669652 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30439 a!3219) j!170) a!3219 mask!3464) lt!442490))))

(assert (= (and start!86566 res!669647) b!1000740))

(assert (= (and b!1000740 res!669653) b!1000741))

(assert (= (and b!1000741 res!669650) b!1000734))

(assert (= (and b!1000734 res!669648) b!1000742))

(assert (= (and b!1000742 res!669651) b!1000737))

(assert (= (and b!1000737 res!669656) b!1000736))

(assert (= (and b!1000736 res!669655) b!1000738))

(assert (= (and b!1000738 res!669654) b!1000739))

(assert (= (and b!1000739 res!669649) b!1000735))

(assert (= (and b!1000735 res!669646) b!1000744))

(assert (= (and b!1000744 res!669652) b!1000743))

(declare-fun m!927353 () Bool)

(assert (=> b!1000744 m!927353))

(assert (=> b!1000744 m!927353))

(declare-fun m!927355 () Bool)

(assert (=> b!1000744 m!927355))

(declare-fun m!927357 () Bool)

(assert (=> b!1000736 m!927357))

(assert (=> b!1000735 m!927353))

(assert (=> b!1000735 m!927353))

(declare-fun m!927359 () Bool)

(assert (=> b!1000735 m!927359))

(assert (=> b!1000735 m!927359))

(assert (=> b!1000735 m!927353))

(declare-fun m!927361 () Bool)

(assert (=> b!1000735 m!927361))

(declare-fun m!927363 () Bool)

(assert (=> b!1000743 m!927363))

(declare-fun m!927365 () Bool)

(assert (=> b!1000743 m!927365))

(assert (=> b!1000743 m!927365))

(declare-fun m!927367 () Bool)

(assert (=> b!1000743 m!927367))

(assert (=> b!1000743 m!927367))

(assert (=> b!1000743 m!927365))

(declare-fun m!927369 () Bool)

(assert (=> b!1000743 m!927369))

(declare-fun m!927371 () Bool)

(assert (=> b!1000742 m!927371))

(declare-fun m!927373 () Bool)

(assert (=> b!1000734 m!927373))

(declare-fun m!927375 () Bool)

(assert (=> start!86566 m!927375))

(declare-fun m!927377 () Bool)

(assert (=> start!86566 m!927377))

(declare-fun m!927379 () Bool)

(assert (=> b!1000738 m!927379))

(declare-fun m!927381 () Bool)

(assert (=> b!1000737 m!927381))

(assert (=> b!1000741 m!927353))

(assert (=> b!1000741 m!927353))

(declare-fun m!927383 () Bool)

(assert (=> b!1000741 m!927383))

(check-sat (not b!1000738) (not b!1000734) (not b!1000742) (not b!1000736) (not b!1000735) (not b!1000744) (not b!1000741) (not start!86566) (not b!1000737) (not b!1000743))
(check-sat)
