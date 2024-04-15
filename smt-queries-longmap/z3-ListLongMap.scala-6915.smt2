; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86898 () Bool)

(assert start!86898)

(declare-fun b!1007583 () Bool)

(declare-fun res!676608 () Bool)

(declare-fun e!567009 () Bool)

(assert (=> b!1007583 (=> (not res!676608) (not e!567009))))

(declare-datatypes ((array!63493 0))(
  ( (array!63494 (arr!30567 (Array (_ BitVec 32) (_ BitVec 64))) (size!31071 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63493)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007583 (= res!676608 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007584 () Bool)

(declare-fun res!676603 () Bool)

(declare-fun e!567012 () Bool)

(assert (=> b!1007584 (=> (not res!676603) (not e!567012))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007584 (= res!676603 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31071 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31071 a!3219))))))

(declare-fun res!676601 () Bool)

(assert (=> start!86898 (=> (not res!676601) (not e!567009))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86898 (= res!676601 (validMask!0 mask!3464))))

(assert (=> start!86898 e!567009))

(declare-fun array_inv!23710 (array!63493) Bool)

(assert (=> start!86898 (array_inv!23710 a!3219)))

(assert (=> start!86898 true))

(declare-fun b!1007585 () Bool)

(declare-fun e!567013 () Bool)

(declare-fun e!567014 () Bool)

(assert (=> b!1007585 (= e!567013 e!567014)))

(declare-fun res!676602 () Bool)

(assert (=> b!1007585 (=> (not res!676602) (not e!567014))))

(declare-fun lt!445153 () array!63493)

(declare-datatypes ((SeekEntryResult!9524 0))(
  ( (MissingZero!9524 (index!40467 (_ BitVec 32))) (Found!9524 (index!40468 (_ BitVec 32))) (Intermediate!9524 (undefined!10336 Bool) (index!40469 (_ BitVec 32)) (x!87877 (_ BitVec 32))) (Undefined!9524) (MissingVacant!9524 (index!40470 (_ BitVec 32))) )
))
(declare-fun lt!445149 () SeekEntryResult!9524)

(declare-fun lt!445147 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63493 (_ BitVec 32)) SeekEntryResult!9524)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007585 (= res!676602 (not (= lt!445149 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445147 mask!3464) lt!445147 lt!445153 mask!3464))))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007585 (= lt!445147 (select (store (arr!30567 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1007585 (= lt!445153 (array!63494 (store (arr!30567 a!3219) i!1194 k0!2224) (size!31071 a!3219)))))

(declare-fun b!1007586 () Bool)

(assert (=> b!1007586 (= e!567009 e!567012)))

(declare-fun res!676606 () Bool)

(assert (=> b!1007586 (=> (not res!676606) (not e!567012))))

(declare-fun lt!445148 () SeekEntryResult!9524)

(assert (=> b!1007586 (= res!676606 (or (= lt!445148 (MissingVacant!9524 i!1194)) (= lt!445148 (MissingZero!9524 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63493 (_ BitVec 32)) SeekEntryResult!9524)

(assert (=> b!1007586 (= lt!445148 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1007587 () Bool)

(assert (=> b!1007587 (= e!567014 false)))

(declare-fun lt!445152 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007587 (= lt!445152 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1007588 () Bool)

(declare-fun res!676609 () Bool)

(assert (=> b!1007588 (=> (not res!676609) (not e!567009))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007588 (= res!676609 (validKeyInArray!0 (select (arr!30567 a!3219) j!170)))))

(declare-fun b!1007589 () Bool)

(declare-fun res!676610 () Bool)

(assert (=> b!1007589 (=> (not res!676610) (not e!567009))))

(assert (=> b!1007589 (= res!676610 (and (= (size!31071 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31071 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31071 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007590 () Bool)

(declare-fun res!676600 () Bool)

(assert (=> b!1007590 (=> (not res!676600) (not e!567012))))

(declare-datatypes ((List!21309 0))(
  ( (Nil!21306) (Cons!21305 (h!22491 (_ BitVec 64)) (t!30301 List!21309)) )
))
(declare-fun arrayNoDuplicates!0 (array!63493 (_ BitVec 32) List!21309) Bool)

(assert (=> b!1007590 (= res!676600 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21306))))

(declare-fun b!1007591 () Bool)

(declare-fun res!676604 () Bool)

(assert (=> b!1007591 (=> (not res!676604) (not e!567014))))

(assert (=> b!1007591 (= res!676604 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1007592 () Bool)

(declare-fun res!676607 () Bool)

(assert (=> b!1007592 (=> (not res!676607) (not e!567009))))

(assert (=> b!1007592 (= res!676607 (validKeyInArray!0 k0!2224))))

(declare-fun b!1007593 () Bool)

(declare-fun e!567011 () Bool)

(assert (=> b!1007593 (= e!567012 e!567011)))

(declare-fun res!676605 () Bool)

(assert (=> b!1007593 (=> (not res!676605) (not e!567011))))

(declare-fun lt!445151 () SeekEntryResult!9524)

(assert (=> b!1007593 (= res!676605 (= lt!445149 lt!445151))))

(assert (=> b!1007593 (= lt!445151 (Intermediate!9524 false resIndex!38 resX!38))))

(assert (=> b!1007593 (= lt!445149 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30567 a!3219) j!170) mask!3464) (select (arr!30567 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007594 () Bool)

(declare-fun res!676611 () Bool)

(assert (=> b!1007594 (=> (not res!676611) (not e!567012))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63493 (_ BitVec 32)) Bool)

(assert (=> b!1007594 (= res!676611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007595 () Bool)

(declare-fun res!676613 () Bool)

(assert (=> b!1007595 (=> (not res!676613) (not e!567014))))

(declare-fun lt!445150 () SeekEntryResult!9524)

(assert (=> b!1007595 (= res!676613 (not (= lt!445150 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445147 lt!445153 mask!3464))))))

(declare-fun b!1007596 () Bool)

(assert (=> b!1007596 (= e!567011 e!567013)))

(declare-fun res!676612 () Bool)

(assert (=> b!1007596 (=> (not res!676612) (not e!567013))))

(assert (=> b!1007596 (= res!676612 (= lt!445150 lt!445151))))

(assert (=> b!1007596 (= lt!445150 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30567 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!86898 res!676601) b!1007589))

(assert (= (and b!1007589 res!676610) b!1007588))

(assert (= (and b!1007588 res!676609) b!1007592))

(assert (= (and b!1007592 res!676607) b!1007583))

(assert (= (and b!1007583 res!676608) b!1007586))

(assert (= (and b!1007586 res!676606) b!1007594))

(assert (= (and b!1007594 res!676611) b!1007590))

(assert (= (and b!1007590 res!676600) b!1007584))

(assert (= (and b!1007584 res!676603) b!1007593))

(assert (= (and b!1007593 res!676605) b!1007596))

(assert (= (and b!1007596 res!676612) b!1007585))

(assert (= (and b!1007585 res!676602) b!1007595))

(assert (= (and b!1007595 res!676613) b!1007591))

(assert (= (and b!1007591 res!676604) b!1007587))

(declare-fun m!931909 () Bool)

(assert (=> b!1007590 m!931909))

(declare-fun m!931911 () Bool)

(assert (=> b!1007585 m!931911))

(assert (=> b!1007585 m!931911))

(declare-fun m!931913 () Bool)

(assert (=> b!1007585 m!931913))

(declare-fun m!931915 () Bool)

(assert (=> b!1007585 m!931915))

(declare-fun m!931917 () Bool)

(assert (=> b!1007585 m!931917))

(declare-fun m!931919 () Bool)

(assert (=> b!1007594 m!931919))

(declare-fun m!931921 () Bool)

(assert (=> b!1007595 m!931921))

(declare-fun m!931923 () Bool)

(assert (=> b!1007587 m!931923))

(declare-fun m!931925 () Bool)

(assert (=> b!1007593 m!931925))

(assert (=> b!1007593 m!931925))

(declare-fun m!931927 () Bool)

(assert (=> b!1007593 m!931927))

(assert (=> b!1007593 m!931927))

(assert (=> b!1007593 m!931925))

(declare-fun m!931929 () Bool)

(assert (=> b!1007593 m!931929))

(declare-fun m!931931 () Bool)

(assert (=> b!1007583 m!931931))

(assert (=> b!1007588 m!931925))

(assert (=> b!1007588 m!931925))

(declare-fun m!931933 () Bool)

(assert (=> b!1007588 m!931933))

(declare-fun m!931935 () Bool)

(assert (=> b!1007586 m!931935))

(assert (=> b!1007596 m!931925))

(assert (=> b!1007596 m!931925))

(declare-fun m!931937 () Bool)

(assert (=> b!1007596 m!931937))

(declare-fun m!931939 () Bool)

(assert (=> b!1007592 m!931939))

(declare-fun m!931941 () Bool)

(assert (=> start!86898 m!931941))

(declare-fun m!931943 () Bool)

(assert (=> start!86898 m!931943))

(check-sat (not b!1007586) (not b!1007588) (not start!86898) (not b!1007587) (not b!1007595) (not b!1007592) (not b!1007594) (not b!1007593) (not b!1007583) (not b!1007596) (not b!1007590) (not b!1007585))
(check-sat)
