; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86754 () Bool)

(assert start!86754)

(declare-fun b!1005622 () Bool)

(declare-fun res!674834 () Bool)

(declare-fun e!566158 () Bool)

(assert (=> b!1005622 (=> (not res!674834) (not e!566158))))

(declare-datatypes ((array!63400 0))(
  ( (array!63401 (arr!30522 (Array (_ BitVec 32) (_ BitVec 64))) (size!31026 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63400)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005622 (= res!674834 (and (= (size!31026 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31026 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31026 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005624 () Bool)

(declare-fun res!674842 () Bool)

(declare-fun e!566159 () Bool)

(assert (=> b!1005624 (=> (not res!674842) (not e!566159))))

(declare-datatypes ((List!21264 0))(
  ( (Nil!21261) (Cons!21260 (h!22443 (_ BitVec 64)) (t!30256 List!21264)) )
))
(declare-fun arrayNoDuplicates!0 (array!63400 (_ BitVec 32) List!21264) Bool)

(assert (=> b!1005624 (= res!674842 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21261))))

(declare-fun b!1005625 () Bool)

(assert (=> b!1005625 (= e!566158 e!566159)))

(declare-fun res!674839 () Bool)

(assert (=> b!1005625 (=> (not res!674839) (not e!566159))))

(declare-datatypes ((SeekEntryResult!9479 0))(
  ( (MissingZero!9479 (index!40287 (_ BitVec 32))) (Found!9479 (index!40288 (_ BitVec 32))) (Intermediate!9479 (undefined!10291 Bool) (index!40289 (_ BitVec 32)) (x!87706 (_ BitVec 32))) (Undefined!9479) (MissingVacant!9479 (index!40290 (_ BitVec 32))) )
))
(declare-fun lt!444402 () SeekEntryResult!9479)

(assert (=> b!1005625 (= res!674839 (or (= lt!444402 (MissingVacant!9479 i!1194)) (= lt!444402 (MissingZero!9479 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63400 (_ BitVec 32)) SeekEntryResult!9479)

(assert (=> b!1005625 (= lt!444402 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1005626 () Bool)

(declare-fun res!674838 () Bool)

(assert (=> b!1005626 (=> (not res!674838) (not e!566158))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005626 (= res!674838 (validKeyInArray!0 (select (arr!30522 a!3219) j!170)))))

(declare-fun b!1005627 () Bool)

(declare-fun res!674837 () Bool)

(assert (=> b!1005627 (=> (not res!674837) (not e!566159))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1005627 (= res!674837 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31026 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31026 a!3219))))))

(declare-fun b!1005628 () Bool)

(declare-fun res!674841 () Bool)

(assert (=> b!1005628 (=> (not res!674841) (not e!566159))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63400 (_ BitVec 32)) SeekEntryResult!9479)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005628 (= res!674841 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30522 a!3219) j!170) mask!3464) (select (arr!30522 a!3219) j!170) a!3219 mask!3464) (Intermediate!9479 false resIndex!38 resX!38)))))

(declare-fun b!1005629 () Bool)

(declare-fun res!674840 () Bool)

(assert (=> b!1005629 (=> (not res!674840) (not e!566158))))

(declare-fun arrayContainsKey!0 (array!63400 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005629 (= res!674840 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005623 () Bool)

(declare-fun res!674835 () Bool)

(assert (=> b!1005623 (=> (not res!674835) (not e!566158))))

(assert (=> b!1005623 (= res!674835 (validKeyInArray!0 k0!2224))))

(declare-fun res!674843 () Bool)

(assert (=> start!86754 (=> (not res!674843) (not e!566158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86754 (= res!674843 (validMask!0 mask!3464))))

(assert (=> start!86754 e!566158))

(declare-fun array_inv!23665 (array!63400) Bool)

(assert (=> start!86754 (array_inv!23665 a!3219)))

(assert (=> start!86754 true))

(declare-fun b!1005630 () Bool)

(declare-fun res!674836 () Bool)

(assert (=> b!1005630 (=> (not res!674836) (not e!566159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63400 (_ BitVec 32)) Bool)

(assert (=> b!1005630 (= res!674836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005631 () Bool)

(assert (=> b!1005631 (= e!566159 false)))

(declare-fun lt!444403 () SeekEntryResult!9479)

(assert (=> b!1005631 (= lt!444403 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30522 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!86754 res!674843) b!1005622))

(assert (= (and b!1005622 res!674834) b!1005626))

(assert (= (and b!1005626 res!674838) b!1005623))

(assert (= (and b!1005623 res!674835) b!1005629))

(assert (= (and b!1005629 res!674840) b!1005625))

(assert (= (and b!1005625 res!674839) b!1005630))

(assert (= (and b!1005630 res!674836) b!1005624))

(assert (= (and b!1005624 res!674842) b!1005627))

(assert (= (and b!1005627 res!674837) b!1005628))

(assert (= (and b!1005628 res!674841) b!1005631))

(declare-fun m!930271 () Bool)

(assert (=> b!1005629 m!930271))

(declare-fun m!930273 () Bool)

(assert (=> start!86754 m!930273))

(declare-fun m!930275 () Bool)

(assert (=> start!86754 m!930275))

(declare-fun m!930277 () Bool)

(assert (=> b!1005630 m!930277))

(declare-fun m!930279 () Bool)

(assert (=> b!1005625 m!930279))

(declare-fun m!930281 () Bool)

(assert (=> b!1005628 m!930281))

(assert (=> b!1005628 m!930281))

(declare-fun m!930283 () Bool)

(assert (=> b!1005628 m!930283))

(assert (=> b!1005628 m!930283))

(assert (=> b!1005628 m!930281))

(declare-fun m!930285 () Bool)

(assert (=> b!1005628 m!930285))

(declare-fun m!930287 () Bool)

(assert (=> b!1005623 m!930287))

(assert (=> b!1005626 m!930281))

(assert (=> b!1005626 m!930281))

(declare-fun m!930289 () Bool)

(assert (=> b!1005626 m!930289))

(declare-fun m!930291 () Bool)

(assert (=> b!1005624 m!930291))

(assert (=> b!1005631 m!930281))

(assert (=> b!1005631 m!930281))

(declare-fun m!930293 () Bool)

(assert (=> b!1005631 m!930293))

(check-sat (not start!86754) (not b!1005625) (not b!1005631) (not b!1005628) (not b!1005629) (not b!1005626) (not b!1005624) (not b!1005623) (not b!1005630))
(check-sat)
