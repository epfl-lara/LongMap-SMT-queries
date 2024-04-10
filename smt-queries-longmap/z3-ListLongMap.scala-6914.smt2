; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86902 () Bool)

(assert start!86902)

(declare-fun b!1007717 () Bool)

(declare-fun e!567106 () Bool)

(declare-fun e!567104 () Bool)

(assert (=> b!1007717 (= e!567106 e!567104)))

(declare-fun res!676615 () Bool)

(assert (=> b!1007717 (=> (not res!676615) (not e!567104))))

(declare-datatypes ((SeekEntryResult!9528 0))(
  ( (MissingZero!9528 (index!40483 (_ BitVec 32))) (Found!9528 (index!40484 (_ BitVec 32))) (Intermediate!9528 (undefined!10340 Bool) (index!40485 (_ BitVec 32)) (x!87878 (_ BitVec 32))) (Undefined!9528) (MissingVacant!9528 (index!40486 (_ BitVec 32))) )
))
(declare-fun lt!445343 () SeekEntryResult!9528)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007717 (= res!676615 (or (= lt!445343 (MissingVacant!9528 i!1194)) (= lt!445343 (MissingZero!9528 i!1194))))))

(declare-datatypes ((array!63550 0))(
  ( (array!63551 (arr!30596 (Array (_ BitVec 32) (_ BitVec 64))) (size!31098 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63550)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63550 (_ BitVec 32)) SeekEntryResult!9528)

(assert (=> b!1007717 (= lt!445343 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1007718 () Bool)

(declare-fun e!567105 () Bool)

(assert (=> b!1007718 (= e!567104 e!567105)))

(declare-fun res!676619 () Bool)

(assert (=> b!1007718 (=> (not res!676619) (not e!567105))))

(declare-fun lt!445337 () SeekEntryResult!9528)

(declare-fun lt!445341 () SeekEntryResult!9528)

(assert (=> b!1007718 (= res!676619 (= lt!445337 lt!445341))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007718 (= lt!445341 (Intermediate!9528 false resIndex!38 resX!38))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63550 (_ BitVec 32)) SeekEntryResult!9528)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007718 (= lt!445337 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30596 a!3219) j!170) mask!3464) (select (arr!30596 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007719 () Bool)

(declare-fun res!676622 () Bool)

(assert (=> b!1007719 (=> (not res!676622) (not e!567104))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1007719 (= res!676622 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31098 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31098 a!3219))))))

(declare-fun b!1007720 () Bool)

(declare-fun res!676616 () Bool)

(declare-fun e!567109 () Bool)

(assert (=> b!1007720 (=> (not res!676616) (not e!567109))))

(assert (=> b!1007720 (= res!676616 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1007721 () Bool)

(declare-fun res!676614 () Bool)

(assert (=> b!1007721 (=> (not res!676614) (not e!567106))))

(declare-fun arrayContainsKey!0 (array!63550 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007721 (= res!676614 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun res!676623 () Bool)

(assert (=> start!86902 (=> (not res!676623) (not e!567106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86902 (= res!676623 (validMask!0 mask!3464))))

(assert (=> start!86902 e!567106))

(declare-fun array_inv!23720 (array!63550) Bool)

(assert (=> start!86902 (array_inv!23720 a!3219)))

(assert (=> start!86902 true))

(declare-fun b!1007722 () Bool)

(declare-fun res!676617 () Bool)

(assert (=> b!1007722 (=> (not res!676617) (not e!567104))))

(declare-datatypes ((List!21272 0))(
  ( (Nil!21269) (Cons!21268 (h!22454 (_ BitVec 64)) (t!30273 List!21272)) )
))
(declare-fun arrayNoDuplicates!0 (array!63550 (_ BitVec 32) List!21272) Bool)

(assert (=> b!1007722 (= res!676617 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21269))))

(declare-fun b!1007723 () Bool)

(declare-fun res!676611 () Bool)

(assert (=> b!1007723 (=> (not res!676611) (not e!567106))))

(assert (=> b!1007723 (= res!676611 (and (= (size!31098 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31098 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31098 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007724 () Bool)

(declare-fun res!676610 () Bool)

(assert (=> b!1007724 (=> (not res!676610) (not e!567104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63550 (_ BitVec 32)) Bool)

(assert (=> b!1007724 (= res!676610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007725 () Bool)

(declare-fun e!567107 () Bool)

(assert (=> b!1007725 (= e!567105 e!567107)))

(declare-fun res!676613 () Bool)

(assert (=> b!1007725 (=> (not res!676613) (not e!567107))))

(declare-fun lt!445338 () SeekEntryResult!9528)

(assert (=> b!1007725 (= res!676613 (= lt!445338 lt!445341))))

(assert (=> b!1007725 (= lt!445338 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30596 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007726 () Bool)

(declare-fun res!676620 () Bool)

(assert (=> b!1007726 (=> (not res!676620) (not e!567106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007726 (= res!676620 (validKeyInArray!0 (select (arr!30596 a!3219) j!170)))))

(declare-fun b!1007727 () Bool)

(assert (=> b!1007727 (= e!567109 false)))

(declare-fun lt!445342 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007727 (= lt!445342 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1007728 () Bool)

(declare-fun res!676621 () Bool)

(assert (=> b!1007728 (=> (not res!676621) (not e!567109))))

(declare-fun lt!445339 () (_ BitVec 64))

(declare-fun lt!445340 () array!63550)

(assert (=> b!1007728 (= res!676621 (not (= lt!445338 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445339 lt!445340 mask!3464))))))

(declare-fun b!1007729 () Bool)

(declare-fun res!676612 () Bool)

(assert (=> b!1007729 (=> (not res!676612) (not e!567106))))

(assert (=> b!1007729 (= res!676612 (validKeyInArray!0 k0!2224))))

(declare-fun b!1007730 () Bool)

(assert (=> b!1007730 (= e!567107 e!567109)))

(declare-fun res!676618 () Bool)

(assert (=> b!1007730 (=> (not res!676618) (not e!567109))))

(assert (=> b!1007730 (= res!676618 (not (= lt!445337 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445339 mask!3464) lt!445339 lt!445340 mask!3464))))))

(assert (=> b!1007730 (= lt!445339 (select (store (arr!30596 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1007730 (= lt!445340 (array!63551 (store (arr!30596 a!3219) i!1194 k0!2224) (size!31098 a!3219)))))

(assert (= (and start!86902 res!676623) b!1007723))

(assert (= (and b!1007723 res!676611) b!1007726))

(assert (= (and b!1007726 res!676620) b!1007729))

(assert (= (and b!1007729 res!676612) b!1007721))

(assert (= (and b!1007721 res!676614) b!1007717))

(assert (= (and b!1007717 res!676615) b!1007724))

(assert (= (and b!1007724 res!676610) b!1007722))

(assert (= (and b!1007722 res!676617) b!1007719))

(assert (= (and b!1007719 res!676622) b!1007718))

(assert (= (and b!1007718 res!676619) b!1007725))

(assert (= (and b!1007725 res!676613) b!1007730))

(assert (= (and b!1007730 res!676618) b!1007728))

(assert (= (and b!1007728 res!676621) b!1007720))

(assert (= (and b!1007720 res!676616) b!1007727))

(declare-fun m!932567 () Bool)

(assert (=> b!1007730 m!932567))

(assert (=> b!1007730 m!932567))

(declare-fun m!932569 () Bool)

(assert (=> b!1007730 m!932569))

(declare-fun m!932571 () Bool)

(assert (=> b!1007730 m!932571))

(declare-fun m!932573 () Bool)

(assert (=> b!1007730 m!932573))

(declare-fun m!932575 () Bool)

(assert (=> b!1007718 m!932575))

(assert (=> b!1007718 m!932575))

(declare-fun m!932577 () Bool)

(assert (=> b!1007718 m!932577))

(assert (=> b!1007718 m!932577))

(assert (=> b!1007718 m!932575))

(declare-fun m!932579 () Bool)

(assert (=> b!1007718 m!932579))

(declare-fun m!932581 () Bool)

(assert (=> b!1007722 m!932581))

(assert (=> b!1007725 m!932575))

(assert (=> b!1007725 m!932575))

(declare-fun m!932583 () Bool)

(assert (=> b!1007725 m!932583))

(declare-fun m!932585 () Bool)

(assert (=> b!1007729 m!932585))

(declare-fun m!932587 () Bool)

(assert (=> b!1007721 m!932587))

(declare-fun m!932589 () Bool)

(assert (=> start!86902 m!932589))

(declare-fun m!932591 () Bool)

(assert (=> start!86902 m!932591))

(declare-fun m!932593 () Bool)

(assert (=> b!1007727 m!932593))

(declare-fun m!932595 () Bool)

(assert (=> b!1007717 m!932595))

(declare-fun m!932597 () Bool)

(assert (=> b!1007724 m!932597))

(assert (=> b!1007726 m!932575))

(assert (=> b!1007726 m!932575))

(declare-fun m!932599 () Bool)

(assert (=> b!1007726 m!932599))

(declare-fun m!932601 () Bool)

(assert (=> b!1007728 m!932601))

(check-sat (not b!1007724) (not b!1007729) (not b!1007730) (not b!1007726) (not start!86902) (not b!1007721) (not b!1007727) (not b!1007717) (not b!1007722) (not b!1007718) (not b!1007728) (not b!1007725))
(check-sat)
