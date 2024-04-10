; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86446 () Bool)

(assert start!86446)

(declare-fun b!1000782 () Bool)

(declare-fun res!670264 () Bool)

(declare-fun e!564007 () Bool)

(assert (=> b!1000782 (=> (not res!670264) (not e!564007))))

(declare-datatypes ((array!63247 0))(
  ( (array!63248 (arr!30449 (Array (_ BitVec 32) (_ BitVec 64))) (size!30951 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63247)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9381 0))(
  ( (MissingZero!9381 (index!39895 (_ BitVec 32))) (Found!9381 (index!39896 (_ BitVec 32))) (Intermediate!9381 (undefined!10193 Bool) (index!39897 (_ BitVec 32)) (x!87321 (_ BitVec 32))) (Undefined!9381) (MissingVacant!9381 (index!39898 (_ BitVec 32))) )
))
(declare-fun lt!442374 () SeekEntryResult!9381)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63247 (_ BitVec 32)) SeekEntryResult!9381)

(assert (=> b!1000782 (= res!670264 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30449 a!3219) j!170) a!3219 mask!3464) lt!442374))))

(declare-fun b!1000783 () Bool)

(declare-fun res!670270 () Bool)

(declare-fun e!564010 () Bool)

(assert (=> b!1000783 (=> (not res!670270) (not e!564010))))

(declare-datatypes ((List!21125 0))(
  ( (Nil!21122) (Cons!21121 (h!22298 (_ BitVec 64)) (t!30126 List!21125)) )
))
(declare-fun arrayNoDuplicates!0 (array!63247 (_ BitVec 32) List!21125) Bool)

(assert (=> b!1000783 (= res!670270 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21122))))

(declare-fun b!1000784 () Bool)

(declare-fun res!670267 () Bool)

(assert (=> b!1000784 (=> (not res!670267) (not e!564007))))

(assert (=> b!1000784 (= res!670267 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvslt index!1507 (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsle x!1245 #b01111111111111111111111111111110)))))

(declare-fun b!1000785 () Bool)

(declare-fun res!670265 () Bool)

(assert (=> b!1000785 (=> (not res!670265) (not e!564010))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000785 (= res!670265 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30951 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30951 a!3219))))))

(declare-fun b!1000786 () Bool)

(declare-fun res!670272 () Bool)

(assert (=> b!1000786 (=> (not res!670272) (not e!564010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63247 (_ BitVec 32)) Bool)

(assert (=> b!1000786 (= res!670272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000787 () Bool)

(declare-fun res!670262 () Bool)

(declare-fun e!564009 () Bool)

(assert (=> b!1000787 (=> (not res!670262) (not e!564009))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000787 (= res!670262 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000788 () Bool)

(declare-fun res!670269 () Bool)

(assert (=> b!1000788 (=> (not res!670269) (not e!564007))))

(declare-fun lt!442376 () SeekEntryResult!9381)

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000788 (= res!670269 (not (= lt!442376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30449 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30449 a!3219) i!1194 k0!2224) j!170) (array!63248 (store (arr!30449 a!3219) i!1194 k0!2224) (size!30951 a!3219)) mask!3464))))))

(declare-fun res!670271 () Bool)

(assert (=> start!86446 (=> (not res!670271) (not e!564009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86446 (= res!670271 (validMask!0 mask!3464))))

(assert (=> start!86446 e!564009))

(declare-fun array_inv!23573 (array!63247) Bool)

(assert (=> start!86446 (array_inv!23573 a!3219)))

(assert (=> start!86446 true))

(declare-fun b!1000789 () Bool)

(assert (=> b!1000789 (= e!564010 e!564007)))

(declare-fun res!670266 () Bool)

(assert (=> b!1000789 (=> (not res!670266) (not e!564007))))

(assert (=> b!1000789 (= res!670266 (= lt!442376 lt!442374))))

(assert (=> b!1000789 (= lt!442374 (Intermediate!9381 false resIndex!38 resX!38))))

(assert (=> b!1000789 (= lt!442376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30449 a!3219) j!170) mask!3464) (select (arr!30449 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000790 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000790 (= e!564007 (not (validKeyInArray!0 (select (store (arr!30449 a!3219) i!1194 k0!2224) j!170))))))

(declare-fun b!1000791 () Bool)

(declare-fun res!670268 () Bool)

(assert (=> b!1000791 (=> (not res!670268) (not e!564009))))

(assert (=> b!1000791 (= res!670268 (and (= (size!30951 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30951 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30951 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000792 () Bool)

(assert (=> b!1000792 (= e!564009 e!564010)))

(declare-fun res!670261 () Bool)

(assert (=> b!1000792 (=> (not res!670261) (not e!564010))))

(declare-fun lt!442375 () SeekEntryResult!9381)

(assert (=> b!1000792 (= res!670261 (or (= lt!442375 (MissingVacant!9381 i!1194)) (= lt!442375 (MissingZero!9381 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63247 (_ BitVec 32)) SeekEntryResult!9381)

(assert (=> b!1000792 (= lt!442375 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1000793 () Bool)

(declare-fun res!670260 () Bool)

(assert (=> b!1000793 (=> (not res!670260) (not e!564009))))

(assert (=> b!1000793 (= res!670260 (validKeyInArray!0 k0!2224))))

(declare-fun b!1000794 () Bool)

(declare-fun res!670263 () Bool)

(assert (=> b!1000794 (=> (not res!670263) (not e!564009))))

(assert (=> b!1000794 (= res!670263 (validKeyInArray!0 (select (arr!30449 a!3219) j!170)))))

(assert (= (and start!86446 res!670271) b!1000791))

(assert (= (and b!1000791 res!670268) b!1000794))

(assert (= (and b!1000794 res!670263) b!1000793))

(assert (= (and b!1000793 res!670260) b!1000787))

(assert (= (and b!1000787 res!670262) b!1000792))

(assert (= (and b!1000792 res!670261) b!1000786))

(assert (= (and b!1000786 res!670272) b!1000783))

(assert (= (and b!1000783 res!670270) b!1000785))

(assert (= (and b!1000785 res!670265) b!1000789))

(assert (= (and b!1000789 res!670266) b!1000782))

(assert (= (and b!1000782 res!670264) b!1000788))

(assert (= (and b!1000788 res!670269) b!1000784))

(assert (= (and b!1000784 res!670267) b!1000790))

(declare-fun m!926913 () Bool)

(assert (=> b!1000792 m!926913))

(declare-fun m!926915 () Bool)

(assert (=> b!1000788 m!926915))

(declare-fun m!926917 () Bool)

(assert (=> b!1000788 m!926917))

(assert (=> b!1000788 m!926917))

(declare-fun m!926919 () Bool)

(assert (=> b!1000788 m!926919))

(assert (=> b!1000788 m!926919))

(assert (=> b!1000788 m!926917))

(declare-fun m!926921 () Bool)

(assert (=> b!1000788 m!926921))

(declare-fun m!926923 () Bool)

(assert (=> b!1000789 m!926923))

(assert (=> b!1000789 m!926923))

(declare-fun m!926925 () Bool)

(assert (=> b!1000789 m!926925))

(assert (=> b!1000789 m!926925))

(assert (=> b!1000789 m!926923))

(declare-fun m!926927 () Bool)

(assert (=> b!1000789 m!926927))

(declare-fun m!926929 () Bool)

(assert (=> b!1000793 m!926929))

(declare-fun m!926931 () Bool)

(assert (=> b!1000786 m!926931))

(assert (=> b!1000794 m!926923))

(assert (=> b!1000794 m!926923))

(declare-fun m!926933 () Bool)

(assert (=> b!1000794 m!926933))

(assert (=> b!1000782 m!926923))

(assert (=> b!1000782 m!926923))

(declare-fun m!926935 () Bool)

(assert (=> b!1000782 m!926935))

(declare-fun m!926937 () Bool)

(assert (=> b!1000783 m!926937))

(declare-fun m!926939 () Bool)

(assert (=> start!86446 m!926939))

(declare-fun m!926941 () Bool)

(assert (=> start!86446 m!926941))

(assert (=> b!1000790 m!926915))

(assert (=> b!1000790 m!926917))

(assert (=> b!1000790 m!926917))

(declare-fun m!926943 () Bool)

(assert (=> b!1000790 m!926943))

(declare-fun m!926945 () Bool)

(assert (=> b!1000787 m!926945))

(check-sat (not b!1000782) (not b!1000787) (not b!1000793) (not b!1000794) (not b!1000790) (not b!1000788) (not b!1000786) (not b!1000792) (not b!1000783) (not b!1000789) (not start!86446))
(check-sat)
