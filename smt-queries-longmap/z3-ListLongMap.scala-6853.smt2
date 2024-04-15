; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86364 () Bool)

(assert start!86364)

(declare-fun res!668883 () Bool)

(declare-fun e!563427 () Bool)

(assert (=> start!86364 (=> (not res!668883) (not e!563427))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86364 (= res!668883 (validMask!0 mask!3464))))

(assert (=> start!86364 e!563427))

(declare-datatypes ((array!63112 0))(
  ( (array!63113 (arr!30381 (Array (_ BitVec 32) (_ BitVec 64))) (size!30885 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63112)

(declare-fun array_inv!23524 (array!63112) Bool)

(assert (=> start!86364 (array_inv!23524 a!3219)))

(assert (=> start!86364 true))

(declare-fun b!999272 () Bool)

(declare-fun res!668878 () Bool)

(assert (=> b!999272 (=> (not res!668878) (not e!563427))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999272 (= res!668878 (validKeyInArray!0 (select (arr!30381 a!3219) j!170)))))

(declare-fun b!999273 () Bool)

(declare-fun res!668880 () Bool)

(declare-fun e!563428 () Bool)

(assert (=> b!999273 (=> (not res!668880) (not e!563428))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63112 (_ BitVec 32)) Bool)

(assert (=> b!999273 (= res!668880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999274 () Bool)

(declare-fun res!668881 () Bool)

(assert (=> b!999274 (=> (not res!668881) (not e!563427))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!999274 (= res!668881 (and (= (size!30885 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30885 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30885 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999275 () Bool)

(declare-fun e!563429 () Bool)

(assert (=> b!999275 (= e!563428 e!563429)))

(declare-fun res!668884 () Bool)

(assert (=> b!999275 (=> (not res!668884) (not e!563429))))

(declare-datatypes ((SeekEntryResult!9338 0))(
  ( (MissingZero!9338 (index!39723 (_ BitVec 32))) (Found!9338 (index!39724 (_ BitVec 32))) (Intermediate!9338 (undefined!10150 Bool) (index!39725 (_ BitVec 32)) (x!87177 (_ BitVec 32))) (Undefined!9338) (MissingVacant!9338 (index!39726 (_ BitVec 32))) )
))
(declare-fun lt!441809 () SeekEntryResult!9338)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63112 (_ BitVec 32)) SeekEntryResult!9338)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999275 (= res!668884 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30381 a!3219) j!170) mask!3464) (select (arr!30381 a!3219) j!170) a!3219 mask!3464) lt!441809))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999275 (= lt!441809 (Intermediate!9338 false resIndex!38 resX!38))))

(declare-fun b!999276 () Bool)

(declare-fun res!668876 () Bool)

(assert (=> b!999276 (=> (not res!668876) (not e!563427))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63112 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999276 (= res!668876 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999277 () Bool)

(declare-fun e!563425 () Bool)

(assert (=> b!999277 (= e!563429 e!563425)))

(declare-fun res!668882 () Bool)

(assert (=> b!999277 (=> (not res!668882) (not e!563425))))

(declare-fun lt!441811 () (_ BitVec 32))

(assert (=> b!999277 (= res!668882 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsge lt!441811 #b00000000000000000000000000000000) (bvslt lt!441811 (bvadd #b00000000000000000000000000000001 mask!3464))))))

(assert (=> b!999277 (= lt!441811 (toIndex!0 (select (store (arr!30381 a!3219) i!1194 k0!2224) j!170) mask!3464))))

(declare-fun b!999278 () Bool)

(declare-fun res!668875 () Bool)

(assert (=> b!999278 (=> (not res!668875) (not e!563427))))

(assert (=> b!999278 (= res!668875 (validKeyInArray!0 k0!2224))))

(declare-fun b!999279 () Bool)

(declare-fun res!668885 () Bool)

(assert (=> b!999279 (=> (not res!668885) (not e!563428))))

(declare-datatypes ((List!21123 0))(
  ( (Nil!21120) (Cons!21119 (h!22296 (_ BitVec 64)) (t!30115 List!21123)) )
))
(declare-fun arrayNoDuplicates!0 (array!63112 (_ BitVec 32) List!21123) Bool)

(assert (=> b!999279 (= res!668885 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21120))))

(declare-fun b!999280 () Bool)

(assert (=> b!999280 (= e!563427 e!563428)))

(declare-fun res!668877 () Bool)

(assert (=> b!999280 (=> (not res!668877) (not e!563428))))

(declare-fun lt!441810 () SeekEntryResult!9338)

(assert (=> b!999280 (= res!668877 (or (= lt!441810 (MissingVacant!9338 i!1194)) (= lt!441810 (MissingZero!9338 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63112 (_ BitVec 32)) SeekEntryResult!9338)

(assert (=> b!999280 (= lt!441810 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!999281 () Bool)

(assert (=> b!999281 (= e!563425 (not (validKeyInArray!0 (select (store (arr!30381 a!3219) i!1194 k0!2224) j!170))))))

(declare-fun b!999282 () Bool)

(declare-fun res!668874 () Bool)

(assert (=> b!999282 (=> (not res!668874) (not e!563428))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!999282 (= res!668874 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30885 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30885 a!3219))))))

(declare-fun b!999283 () Bool)

(declare-fun res!668879 () Bool)

(assert (=> b!999283 (=> (not res!668879) (not e!563429))))

(assert (=> b!999283 (= res!668879 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30381 a!3219) j!170) a!3219 mask!3464) lt!441809))))

(assert (= (and start!86364 res!668883) b!999274))

(assert (= (and b!999274 res!668881) b!999272))

(assert (= (and b!999272 res!668878) b!999278))

(assert (= (and b!999278 res!668875) b!999276))

(assert (= (and b!999276 res!668876) b!999280))

(assert (= (and b!999280 res!668877) b!999273))

(assert (= (and b!999273 res!668880) b!999279))

(assert (= (and b!999279 res!668885) b!999282))

(assert (= (and b!999282 res!668874) b!999275))

(assert (= (and b!999275 res!668884) b!999283))

(assert (= (and b!999283 res!668879) b!999277))

(assert (= (and b!999277 res!668882) b!999281))

(declare-fun m!924997 () Bool)

(assert (=> b!999278 m!924997))

(declare-fun m!924999 () Bool)

(assert (=> b!999275 m!924999))

(assert (=> b!999275 m!924999))

(declare-fun m!925001 () Bool)

(assert (=> b!999275 m!925001))

(assert (=> b!999275 m!925001))

(assert (=> b!999275 m!924999))

(declare-fun m!925003 () Bool)

(assert (=> b!999275 m!925003))

(declare-fun m!925005 () Bool)

(assert (=> start!86364 m!925005))

(declare-fun m!925007 () Bool)

(assert (=> start!86364 m!925007))

(declare-fun m!925009 () Bool)

(assert (=> b!999281 m!925009))

(declare-fun m!925011 () Bool)

(assert (=> b!999281 m!925011))

(assert (=> b!999281 m!925011))

(declare-fun m!925013 () Bool)

(assert (=> b!999281 m!925013))

(declare-fun m!925015 () Bool)

(assert (=> b!999280 m!925015))

(declare-fun m!925017 () Bool)

(assert (=> b!999273 m!925017))

(assert (=> b!999272 m!924999))

(assert (=> b!999272 m!924999))

(declare-fun m!925019 () Bool)

(assert (=> b!999272 m!925019))

(declare-fun m!925021 () Bool)

(assert (=> b!999276 m!925021))

(assert (=> b!999277 m!925009))

(assert (=> b!999277 m!925011))

(assert (=> b!999277 m!925011))

(declare-fun m!925023 () Bool)

(assert (=> b!999277 m!925023))

(assert (=> b!999283 m!924999))

(assert (=> b!999283 m!924999))

(declare-fun m!925025 () Bool)

(assert (=> b!999283 m!925025))

(declare-fun m!925027 () Bool)

(assert (=> b!999279 m!925027))

(check-sat (not b!999278) (not b!999276) (not b!999272) (not start!86364) (not b!999280) (not b!999281) (not b!999275) (not b!999279) (not b!999283) (not b!999273) (not b!999277))
(check-sat)
