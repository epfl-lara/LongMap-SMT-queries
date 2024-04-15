; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86382 () Bool)

(assert start!86382)

(declare-fun b!999585 () Bool)

(declare-fun res!669192 () Bool)

(declare-fun e!563543 () Bool)

(assert (=> b!999585 (=> (not res!669192) (not e!563543))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999585 (= res!669192 (validKeyInArray!0 k0!2224))))

(declare-fun b!999586 () Bool)

(declare-fun res!669191 () Bool)

(assert (=> b!999586 (=> (not res!669191) (not e!563543))))

(declare-datatypes ((array!63130 0))(
  ( (array!63131 (arr!30390 (Array (_ BitVec 32) (_ BitVec 64))) (size!30894 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63130)

(declare-fun arrayContainsKey!0 (array!63130 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999586 (= res!669191 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun res!669195 () Bool)

(assert (=> start!86382 (=> (not res!669195) (not e!563543))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86382 (= res!669195 (validMask!0 mask!3464))))

(assert (=> start!86382 e!563543))

(declare-fun array_inv!23533 (array!63130) Bool)

(assert (=> start!86382 (array_inv!23533 a!3219)))

(assert (=> start!86382 true))

(declare-fun b!999587 () Bool)

(declare-fun res!669189 () Bool)

(declare-fun e!563540 () Bool)

(assert (=> b!999587 (=> (not res!669189) (not e!563540))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!999587 (= res!669189 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30894 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30894 a!3219))))))

(declare-fun b!999588 () Bool)

(assert (=> b!999588 (= e!563543 e!563540)))

(declare-fun res!669190 () Bool)

(assert (=> b!999588 (=> (not res!669190) (not e!563540))))

(declare-datatypes ((SeekEntryResult!9347 0))(
  ( (MissingZero!9347 (index!39759 (_ BitVec 32))) (Found!9347 (index!39760 (_ BitVec 32))) (Intermediate!9347 (undefined!10159 Bool) (index!39761 (_ BitVec 32)) (x!87210 (_ BitVec 32))) (Undefined!9347) (MissingVacant!9347 (index!39762 (_ BitVec 32))) )
))
(declare-fun lt!441890 () SeekEntryResult!9347)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!999588 (= res!669190 (or (= lt!441890 (MissingVacant!9347 i!1194)) (= lt!441890 (MissingZero!9347 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63130 (_ BitVec 32)) SeekEntryResult!9347)

(assert (=> b!999588 (= lt!441890 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!999589 () Bool)

(declare-fun res!669188 () Bool)

(declare-fun e!563542 () Bool)

(assert (=> b!999589 (=> (not res!669188) (not e!563542))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!441891 () SeekEntryResult!9347)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63130 (_ BitVec 32)) SeekEntryResult!9347)

(assert (=> b!999589 (= res!669188 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30390 a!3219) j!170) a!3219 mask!3464) lt!441891))))

(declare-fun b!999590 () Bool)

(declare-fun res!669193 () Bool)

(assert (=> b!999590 (=> (not res!669193) (not e!563543))))

(assert (=> b!999590 (= res!669193 (validKeyInArray!0 (select (arr!30390 a!3219) j!170)))))

(declare-fun b!999591 () Bool)

(declare-fun res!669194 () Bool)

(assert (=> b!999591 (=> (not res!669194) (not e!563540))))

(declare-datatypes ((List!21132 0))(
  ( (Nil!21129) (Cons!21128 (h!22305 (_ BitVec 64)) (t!30124 List!21132)) )
))
(declare-fun arrayNoDuplicates!0 (array!63130 (_ BitVec 32) List!21132) Bool)

(assert (=> b!999591 (= res!669194 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21129))))

(declare-fun b!999592 () Bool)

(assert (=> b!999592 (= e!563540 e!563542)))

(declare-fun res!669187 () Bool)

(assert (=> b!999592 (=> (not res!669187) (not e!563542))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999592 (= res!669187 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30390 a!3219) j!170) mask!3464) (select (arr!30390 a!3219) j!170) a!3219 mask!3464) lt!441891))))

(assert (=> b!999592 (= lt!441891 (Intermediate!9347 false resIndex!38 resX!38))))

(declare-fun b!999593 () Bool)

(declare-fun res!669196 () Bool)

(assert (=> b!999593 (=> (not res!669196) (not e!563540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63130 (_ BitVec 32)) Bool)

(assert (=> b!999593 (= res!669196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999594 () Bool)

(assert (=> b!999594 (= e!563542 false)))

(declare-fun lt!441892 () SeekEntryResult!9347)

(assert (=> b!999594 (= lt!441892 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30390 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30390 a!3219) i!1194 k0!2224) j!170) (array!63131 (store (arr!30390 a!3219) i!1194 k0!2224) (size!30894 a!3219)) mask!3464))))

(declare-fun b!999595 () Bool)

(declare-fun res!669197 () Bool)

(assert (=> b!999595 (=> (not res!669197) (not e!563543))))

(assert (=> b!999595 (= res!669197 (and (= (size!30894 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30894 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30894 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86382 res!669195) b!999595))

(assert (= (and b!999595 res!669197) b!999590))

(assert (= (and b!999590 res!669193) b!999585))

(assert (= (and b!999585 res!669192) b!999586))

(assert (= (and b!999586 res!669191) b!999588))

(assert (= (and b!999588 res!669190) b!999593))

(assert (= (and b!999593 res!669196) b!999591))

(assert (= (and b!999591 res!669194) b!999587))

(assert (= (and b!999587 res!669189) b!999592))

(assert (= (and b!999592 res!669187) b!999589))

(assert (= (and b!999589 res!669188) b!999594))

(declare-fun m!925285 () Bool)

(assert (=> b!999589 m!925285))

(assert (=> b!999589 m!925285))

(declare-fun m!925287 () Bool)

(assert (=> b!999589 m!925287))

(declare-fun m!925289 () Bool)

(assert (=> b!999585 m!925289))

(declare-fun m!925291 () Bool)

(assert (=> b!999586 m!925291))

(assert (=> b!999592 m!925285))

(assert (=> b!999592 m!925285))

(declare-fun m!925293 () Bool)

(assert (=> b!999592 m!925293))

(assert (=> b!999592 m!925293))

(assert (=> b!999592 m!925285))

(declare-fun m!925295 () Bool)

(assert (=> b!999592 m!925295))

(assert (=> b!999590 m!925285))

(assert (=> b!999590 m!925285))

(declare-fun m!925297 () Bool)

(assert (=> b!999590 m!925297))

(declare-fun m!925299 () Bool)

(assert (=> start!86382 m!925299))

(declare-fun m!925301 () Bool)

(assert (=> start!86382 m!925301))

(declare-fun m!925303 () Bool)

(assert (=> b!999591 m!925303))

(declare-fun m!925305 () Bool)

(assert (=> b!999593 m!925305))

(declare-fun m!925307 () Bool)

(assert (=> b!999588 m!925307))

(declare-fun m!925309 () Bool)

(assert (=> b!999594 m!925309))

(declare-fun m!925311 () Bool)

(assert (=> b!999594 m!925311))

(assert (=> b!999594 m!925311))

(declare-fun m!925313 () Bool)

(assert (=> b!999594 m!925313))

(assert (=> b!999594 m!925313))

(assert (=> b!999594 m!925311))

(declare-fun m!925315 () Bool)

(assert (=> b!999594 m!925315))

(check-sat (not b!999585) (not b!999589) (not b!999594) (not b!999592) (not b!999593) (not b!999588) (not start!86382) (not b!999591) (not b!999590) (not b!999586))
(check-sat)
