; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86532 () Bool)

(assert start!86532)

(declare-fun b!1002691 () Bool)

(declare-fun e!564806 () Bool)

(declare-fun e!564807 () Bool)

(assert (=> b!1002691 (= e!564806 e!564807)))

(declare-fun res!672296 () Bool)

(assert (=> b!1002691 (=> (not res!672296) (not e!564807))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((array!63280 0))(
  ( (array!63281 (arr!30465 (Array (_ BitVec 32) (_ BitVec 64))) (size!30969 (_ BitVec 32))) )
))
(declare-fun lt!443179 () array!63280)

(declare-fun lt!443178 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9422 0))(
  ( (MissingZero!9422 (index!40059 (_ BitVec 32))) (Found!9422 (index!40060 (_ BitVec 32))) (Intermediate!9422 (undefined!10234 Bool) (index!40061 (_ BitVec 32)) (x!87485 (_ BitVec 32))) (Undefined!9422) (MissingVacant!9422 (index!40062 (_ BitVec 32))) )
))
(declare-fun lt!443182 () SeekEntryResult!9422)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63280 (_ BitVec 32)) SeekEntryResult!9422)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002691 (= res!672296 (not (= lt!443182 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443178 mask!3464) lt!443178 lt!443179 mask!3464))))))

(declare-fun a!3219 () array!63280)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1002691 (= lt!443178 (select (store (arr!30465 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1002691 (= lt!443179 (array!63281 (store (arr!30465 a!3219) i!1194 k0!2224) (size!30969 a!3219)))))

(declare-fun b!1002692 () Bool)

(declare-fun res!672297 () Bool)

(declare-fun e!564812 () Bool)

(assert (=> b!1002692 (=> (not res!672297) (not e!564812))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002692 (= res!672297 (validKeyInArray!0 k0!2224))))

(declare-fun b!1002693 () Bool)

(declare-fun res!672307 () Bool)

(assert (=> b!1002693 (=> (not res!672307) (not e!564807))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!443184 () SeekEntryResult!9422)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1002693 (= res!672307 (not (= lt!443184 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443178 lt!443179 mask!3464))))))

(declare-fun b!1002694 () Bool)

(declare-fun res!672304 () Bool)

(assert (=> b!1002694 (=> (not res!672304) (not e!564807))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1002694 (= res!672304 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun res!672298 () Bool)

(assert (=> start!86532 (=> (not res!672298) (not e!564812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86532 (= res!672298 (validMask!0 mask!3464))))

(assert (=> start!86532 e!564812))

(declare-fun array_inv!23608 (array!63280) Bool)

(assert (=> start!86532 (array_inv!23608 a!3219)))

(assert (=> start!86532 true))

(declare-fun b!1002695 () Bool)

(declare-fun res!672301 () Bool)

(declare-fun e!564808 () Bool)

(assert (=> b!1002695 (=> (not res!672301) (not e!564808))))

(declare-datatypes ((List!21207 0))(
  ( (Nil!21204) (Cons!21203 (h!22380 (_ BitVec 64)) (t!30199 List!21207)) )
))
(declare-fun arrayNoDuplicates!0 (array!63280 (_ BitVec 32) List!21207) Bool)

(assert (=> b!1002695 (= res!672301 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21204))))

(declare-fun b!1002696 () Bool)

(declare-fun res!672308 () Bool)

(assert (=> b!1002696 (=> (not res!672308) (not e!564812))))

(declare-fun arrayContainsKey!0 (array!63280 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002696 (= res!672308 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002697 () Bool)

(declare-fun e!564810 () Bool)

(assert (=> b!1002697 (= e!564808 e!564810)))

(declare-fun res!672306 () Bool)

(assert (=> b!1002697 (=> (not res!672306) (not e!564810))))

(declare-fun lt!443185 () SeekEntryResult!9422)

(assert (=> b!1002697 (= res!672306 (= lt!443182 lt!443185))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002697 (= lt!443185 (Intermediate!9422 false resIndex!38 resX!38))))

(assert (=> b!1002697 (= lt!443182 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30465 a!3219) j!170) mask!3464) (select (arr!30465 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002698 () Bool)

(declare-fun res!672295 () Bool)

(assert (=> b!1002698 (=> (not res!672295) (not e!564812))))

(assert (=> b!1002698 (= res!672295 (and (= (size!30969 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30969 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30969 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1002699 () Bool)

(declare-fun res!672300 () Bool)

(assert (=> b!1002699 (=> (not res!672300) (not e!564812))))

(assert (=> b!1002699 (= res!672300 (validKeyInArray!0 (select (arr!30465 a!3219) j!170)))))

(declare-fun b!1002700 () Bool)

(declare-fun e!564811 () Bool)

(assert (=> b!1002700 (= e!564811 false)))

(declare-fun lt!443180 () (_ BitVec 32))

(declare-fun lt!443181 () SeekEntryResult!9422)

(assert (=> b!1002700 (= lt!443181 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443180 lt!443178 lt!443179 mask!3464))))

(declare-fun b!1002701 () Bool)

(declare-fun res!672303 () Bool)

(assert (=> b!1002701 (=> (not res!672303) (not e!564808))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63280 (_ BitVec 32)) Bool)

(assert (=> b!1002701 (= res!672303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1002702 () Bool)

(declare-fun res!672294 () Bool)

(assert (=> b!1002702 (=> (not res!672294) (not e!564811))))

(assert (=> b!1002702 (= res!672294 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443180 (select (arr!30465 a!3219) j!170) a!3219 mask!3464) lt!443185))))

(declare-fun b!1002703 () Bool)

(declare-fun res!672299 () Bool)

(assert (=> b!1002703 (=> (not res!672299) (not e!564808))))

(assert (=> b!1002703 (= res!672299 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30969 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30969 a!3219))))))

(declare-fun b!1002704 () Bool)

(assert (=> b!1002704 (= e!564810 e!564806)))

(declare-fun res!672305 () Bool)

(assert (=> b!1002704 (=> (not res!672305) (not e!564806))))

(assert (=> b!1002704 (= res!672305 (= lt!443184 lt!443185))))

(assert (=> b!1002704 (= lt!443184 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30465 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002705 () Bool)

(assert (=> b!1002705 (= e!564807 e!564811)))

(declare-fun res!672293 () Bool)

(assert (=> b!1002705 (=> (not res!672293) (not e!564811))))

(assert (=> b!1002705 (= res!672293 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443180 #b00000000000000000000000000000000) (bvslt lt!443180 (size!30969 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002705 (= lt!443180 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1002706 () Bool)

(assert (=> b!1002706 (= e!564812 e!564808)))

(declare-fun res!672302 () Bool)

(assert (=> b!1002706 (=> (not res!672302) (not e!564808))))

(declare-fun lt!443183 () SeekEntryResult!9422)

(assert (=> b!1002706 (= res!672302 (or (= lt!443183 (MissingVacant!9422 i!1194)) (= lt!443183 (MissingZero!9422 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63280 (_ BitVec 32)) SeekEntryResult!9422)

(assert (=> b!1002706 (= lt!443183 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!86532 res!672298) b!1002698))

(assert (= (and b!1002698 res!672295) b!1002699))

(assert (= (and b!1002699 res!672300) b!1002692))

(assert (= (and b!1002692 res!672297) b!1002696))

(assert (= (and b!1002696 res!672308) b!1002706))

(assert (= (and b!1002706 res!672302) b!1002701))

(assert (= (and b!1002701 res!672303) b!1002695))

(assert (= (and b!1002695 res!672301) b!1002703))

(assert (= (and b!1002703 res!672299) b!1002697))

(assert (= (and b!1002697 res!672306) b!1002704))

(assert (= (and b!1002704 res!672305) b!1002691))

(assert (= (and b!1002691 res!672296) b!1002693))

(assert (= (and b!1002693 res!672307) b!1002694))

(assert (= (and b!1002694 res!672304) b!1002705))

(assert (= (and b!1002705 res!672293) b!1002702))

(assert (= (and b!1002702 res!672294) b!1002700))

(declare-fun m!927979 () Bool)

(assert (=> b!1002706 m!927979))

(declare-fun m!927981 () Bool)

(assert (=> b!1002702 m!927981))

(assert (=> b!1002702 m!927981))

(declare-fun m!927983 () Bool)

(assert (=> b!1002702 m!927983))

(declare-fun m!927985 () Bool)

(assert (=> b!1002695 m!927985))

(declare-fun m!927987 () Bool)

(assert (=> start!86532 m!927987))

(declare-fun m!927989 () Bool)

(assert (=> start!86532 m!927989))

(declare-fun m!927991 () Bool)

(assert (=> b!1002693 m!927991))

(assert (=> b!1002704 m!927981))

(assert (=> b!1002704 m!927981))

(declare-fun m!927993 () Bool)

(assert (=> b!1002704 m!927993))

(declare-fun m!927995 () Bool)

(assert (=> b!1002692 m!927995))

(declare-fun m!927997 () Bool)

(assert (=> b!1002696 m!927997))

(assert (=> b!1002699 m!927981))

(assert (=> b!1002699 m!927981))

(declare-fun m!927999 () Bool)

(assert (=> b!1002699 m!927999))

(declare-fun m!928001 () Bool)

(assert (=> b!1002705 m!928001))

(declare-fun m!928003 () Bool)

(assert (=> b!1002691 m!928003))

(assert (=> b!1002691 m!928003))

(declare-fun m!928005 () Bool)

(assert (=> b!1002691 m!928005))

(declare-fun m!928007 () Bool)

(assert (=> b!1002691 m!928007))

(declare-fun m!928009 () Bool)

(assert (=> b!1002691 m!928009))

(declare-fun m!928011 () Bool)

(assert (=> b!1002700 m!928011))

(declare-fun m!928013 () Bool)

(assert (=> b!1002701 m!928013))

(assert (=> b!1002697 m!927981))

(assert (=> b!1002697 m!927981))

(declare-fun m!928015 () Bool)

(assert (=> b!1002697 m!928015))

(assert (=> b!1002697 m!928015))

(assert (=> b!1002697 m!927981))

(declare-fun m!928017 () Bool)

(assert (=> b!1002697 m!928017))

(check-sat (not b!1002702) (not b!1002691) (not b!1002700) (not b!1002704) (not b!1002706) (not b!1002699) (not b!1002701) (not b!1002696) (not b!1002692) (not b!1002695) (not b!1002693) (not b!1002705) (not b!1002697) (not start!86532))
(check-sat)
