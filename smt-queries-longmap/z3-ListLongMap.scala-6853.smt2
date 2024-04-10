; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86374 () Bool)

(assert start!86374)

(declare-fun b!999526 () Bool)

(declare-fun e!563574 () Bool)

(declare-fun e!563575 () Bool)

(assert (=> b!999526 (= e!563574 e!563575)))

(declare-fun res!669015 () Bool)

(assert (=> b!999526 (=> (not res!669015) (not e!563575))))

(declare-datatypes ((array!63175 0))(
  ( (array!63176 (arr!30413 (Array (_ BitVec 32) (_ BitVec 64))) (size!30915 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63175)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9345 0))(
  ( (MissingZero!9345 (index!39751 (_ BitVec 32))) (Found!9345 (index!39752 (_ BitVec 32))) (Intermediate!9345 (undefined!10157 Bool) (index!39753 (_ BitVec 32)) (x!87189 (_ BitVec 32))) (Undefined!9345) (MissingVacant!9345 (index!39754 (_ BitVec 32))) )
))
(declare-fun lt!442050 () SeekEntryResult!9345)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63175 (_ BitVec 32)) SeekEntryResult!9345)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999526 (= res!669015 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30413 a!3219) j!170) mask!3464) (select (arr!30413 a!3219) j!170) a!3219 mask!3464) lt!442050))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999526 (= lt!442050 (Intermediate!9345 false resIndex!38 resX!38))))

(declare-fun b!999527 () Bool)

(declare-fun res!669004 () Bool)

(declare-fun e!563572 () Bool)

(assert (=> b!999527 (=> (not res!669004) (not e!563572))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999527 (= res!669004 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999528 () Bool)

(declare-fun res!669009 () Bool)

(assert (=> b!999528 (=> (not res!669009) (not e!563575))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!999528 (= res!669009 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30413 a!3219) j!170) a!3219 mask!3464) lt!442050))))

(declare-fun b!999529 () Bool)

(declare-fun res!669014 () Bool)

(assert (=> b!999529 (=> (not res!669014) (not e!563572))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!999529 (= res!669014 (and (= (size!30915 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30915 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30915 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999530 () Bool)

(assert (=> b!999530 (= e!563572 e!563574)))

(declare-fun res!669010 () Bool)

(assert (=> b!999530 (=> (not res!669010) (not e!563574))))

(declare-fun lt!442051 () SeekEntryResult!9345)

(assert (=> b!999530 (= res!669010 (or (= lt!442051 (MissingVacant!9345 i!1194)) (= lt!442051 (MissingZero!9345 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63175 (_ BitVec 32)) SeekEntryResult!9345)

(assert (=> b!999530 (= lt!442051 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!999531 () Bool)

(declare-fun e!563573 () Bool)

(assert (=> b!999531 (= e!563575 e!563573)))

(declare-fun res!669013 () Bool)

(assert (=> b!999531 (=> (not res!669013) (not e!563573))))

(declare-fun lt!442052 () (_ BitVec 32))

(assert (=> b!999531 (= res!669013 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsge lt!442052 #b00000000000000000000000000000000) (bvslt lt!442052 (bvadd #b00000000000000000000000000000001 mask!3464))))))

(assert (=> b!999531 (= lt!442052 (toIndex!0 (select (store (arr!30413 a!3219) i!1194 k0!2224) j!170) mask!3464))))

(declare-fun b!999532 () Bool)

(declare-fun res!669007 () Bool)

(assert (=> b!999532 (=> (not res!669007) (not e!563572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999532 (= res!669007 (validKeyInArray!0 (select (arr!30413 a!3219) j!170)))))

(declare-fun b!999533 () Bool)

(declare-fun res!669006 () Bool)

(assert (=> b!999533 (=> (not res!669006) (not e!563574))))

(assert (=> b!999533 (= res!669006 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30915 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30915 a!3219))))))

(declare-fun res!669011 () Bool)

(assert (=> start!86374 (=> (not res!669011) (not e!563572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86374 (= res!669011 (validMask!0 mask!3464))))

(assert (=> start!86374 e!563572))

(declare-fun array_inv!23537 (array!63175) Bool)

(assert (=> start!86374 (array_inv!23537 a!3219)))

(assert (=> start!86374 true))

(declare-fun b!999534 () Bool)

(declare-fun res!669008 () Bool)

(assert (=> b!999534 (=> (not res!669008) (not e!563574))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63175 (_ BitVec 32)) Bool)

(assert (=> b!999534 (= res!669008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999535 () Bool)

(declare-fun res!669005 () Bool)

(assert (=> b!999535 (=> (not res!669005) (not e!563572))))

(assert (=> b!999535 (= res!669005 (validKeyInArray!0 k0!2224))))

(declare-fun b!999536 () Bool)

(assert (=> b!999536 (= e!563573 (not (validKeyInArray!0 (select (store (arr!30413 a!3219) i!1194 k0!2224) j!170))))))

(declare-fun b!999537 () Bool)

(declare-fun res!669012 () Bool)

(assert (=> b!999537 (=> (not res!669012) (not e!563574))))

(declare-datatypes ((List!21089 0))(
  ( (Nil!21086) (Cons!21085 (h!22262 (_ BitVec 64)) (t!30090 List!21089)) )
))
(declare-fun arrayNoDuplicates!0 (array!63175 (_ BitVec 32) List!21089) Bool)

(assert (=> b!999537 (= res!669012 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21086))))

(assert (= (and start!86374 res!669011) b!999529))

(assert (= (and b!999529 res!669014) b!999532))

(assert (= (and b!999532 res!669007) b!999535))

(assert (= (and b!999535 res!669005) b!999527))

(assert (= (and b!999527 res!669004) b!999530))

(assert (= (and b!999530 res!669010) b!999534))

(assert (= (and b!999534 res!669008) b!999537))

(assert (= (and b!999537 res!669012) b!999533))

(assert (= (and b!999533 res!669006) b!999526))

(assert (= (and b!999526 res!669015) b!999528))

(assert (= (and b!999528 res!669009) b!999531))

(assert (= (and b!999531 res!669013) b!999536))

(declare-fun m!925759 () Bool)

(assert (=> b!999532 m!925759))

(assert (=> b!999532 m!925759))

(declare-fun m!925761 () Bool)

(assert (=> b!999532 m!925761))

(declare-fun m!925763 () Bool)

(assert (=> start!86374 m!925763))

(declare-fun m!925765 () Bool)

(assert (=> start!86374 m!925765))

(declare-fun m!925767 () Bool)

(assert (=> b!999527 m!925767))

(declare-fun m!925769 () Bool)

(assert (=> b!999534 m!925769))

(assert (=> b!999528 m!925759))

(assert (=> b!999528 m!925759))

(declare-fun m!925771 () Bool)

(assert (=> b!999528 m!925771))

(assert (=> b!999526 m!925759))

(assert (=> b!999526 m!925759))

(declare-fun m!925773 () Bool)

(assert (=> b!999526 m!925773))

(assert (=> b!999526 m!925773))

(assert (=> b!999526 m!925759))

(declare-fun m!925775 () Bool)

(assert (=> b!999526 m!925775))

(declare-fun m!925777 () Bool)

(assert (=> b!999530 m!925777))

(declare-fun m!925779 () Bool)

(assert (=> b!999535 m!925779))

(declare-fun m!925781 () Bool)

(assert (=> b!999536 m!925781))

(declare-fun m!925783 () Bool)

(assert (=> b!999536 m!925783))

(assert (=> b!999536 m!925783))

(declare-fun m!925785 () Bool)

(assert (=> b!999536 m!925785))

(declare-fun m!925787 () Bool)

(assert (=> b!999537 m!925787))

(assert (=> b!999531 m!925781))

(assert (=> b!999531 m!925783))

(assert (=> b!999531 m!925783))

(declare-fun m!925789 () Bool)

(assert (=> b!999531 m!925789))

(check-sat (not b!999535) (not b!999526) (not b!999527) (not b!999530) (not start!86374) (not b!999536) (not b!999528) (not b!999537) (not b!999532) (not b!999534) (not b!999531))
(check-sat)
