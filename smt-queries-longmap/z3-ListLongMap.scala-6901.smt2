; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86760 () Bool)

(assert start!86760)

(declare-fun b!1005712 () Bool)

(declare-fun res!674927 () Bool)

(declare-fun e!566185 () Bool)

(assert (=> b!1005712 (=> (not res!674927) (not e!566185))))

(declare-datatypes ((array!63406 0))(
  ( (array!63407 (arr!30525 (Array (_ BitVec 32) (_ BitVec 64))) (size!31029 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63406)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1005712 (= res!674927 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31029 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31029 a!3219))))))

(declare-fun b!1005713 () Bool)

(declare-fun res!674932 () Bool)

(assert (=> b!1005713 (=> (not res!674932) (not e!566185))))

(declare-datatypes ((List!21267 0))(
  ( (Nil!21264) (Cons!21263 (h!22446 (_ BitVec 64)) (t!30259 List!21267)) )
))
(declare-fun arrayNoDuplicates!0 (array!63406 (_ BitVec 32) List!21267) Bool)

(assert (=> b!1005713 (= res!674932 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21264))))

(declare-fun b!1005714 () Bool)

(declare-fun res!674931 () Bool)

(declare-fun e!566184 () Bool)

(assert (=> b!1005714 (=> (not res!674931) (not e!566184))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005714 (= res!674931 (validKeyInArray!0 (select (arr!30525 a!3219) j!170)))))

(declare-fun b!1005715 () Bool)

(declare-fun res!674929 () Bool)

(assert (=> b!1005715 (=> (not res!674929) (not e!566185))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9482 0))(
  ( (MissingZero!9482 (index!40299 (_ BitVec 32))) (Found!9482 (index!40300 (_ BitVec 32))) (Intermediate!9482 (undefined!10294 Bool) (index!40301 (_ BitVec 32)) (x!87717 (_ BitVec 32))) (Undefined!9482) (MissingVacant!9482 (index!40302 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63406 (_ BitVec 32)) SeekEntryResult!9482)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005715 (= res!674929 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30525 a!3219) j!170) mask!3464) (select (arr!30525 a!3219) j!170) a!3219 mask!3464) (Intermediate!9482 false resIndex!38 resX!38)))))

(declare-fun res!674928 () Bool)

(assert (=> start!86760 (=> (not res!674928) (not e!566184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86760 (= res!674928 (validMask!0 mask!3464))))

(assert (=> start!86760 e!566184))

(declare-fun array_inv!23668 (array!63406) Bool)

(assert (=> start!86760 (array_inv!23668 a!3219)))

(assert (=> start!86760 true))

(declare-fun b!1005716 () Bool)

(assert (=> b!1005716 (= e!566185 false)))

(declare-fun lt!444420 () SeekEntryResult!9482)

(assert (=> b!1005716 (= lt!444420 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30525 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005717 () Bool)

(assert (=> b!1005717 (= e!566184 e!566185)))

(declare-fun res!674926 () Bool)

(assert (=> b!1005717 (=> (not res!674926) (not e!566185))))

(declare-fun lt!444421 () SeekEntryResult!9482)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005717 (= res!674926 (or (= lt!444421 (MissingVacant!9482 i!1194)) (= lt!444421 (MissingZero!9482 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63406 (_ BitVec 32)) SeekEntryResult!9482)

(assert (=> b!1005717 (= lt!444421 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1005718 () Bool)

(declare-fun res!674924 () Bool)

(assert (=> b!1005718 (=> (not res!674924) (not e!566184))))

(assert (=> b!1005718 (= res!674924 (and (= (size!31029 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31029 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31029 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005719 () Bool)

(declare-fun res!674933 () Bool)

(assert (=> b!1005719 (=> (not res!674933) (not e!566185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63406 (_ BitVec 32)) Bool)

(assert (=> b!1005719 (= res!674933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005720 () Bool)

(declare-fun res!674925 () Bool)

(assert (=> b!1005720 (=> (not res!674925) (not e!566184))))

(declare-fun arrayContainsKey!0 (array!63406 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005720 (= res!674925 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005721 () Bool)

(declare-fun res!674930 () Bool)

(assert (=> b!1005721 (=> (not res!674930) (not e!566184))))

(assert (=> b!1005721 (= res!674930 (validKeyInArray!0 k0!2224))))

(assert (= (and start!86760 res!674928) b!1005718))

(assert (= (and b!1005718 res!674924) b!1005714))

(assert (= (and b!1005714 res!674931) b!1005721))

(assert (= (and b!1005721 res!674930) b!1005720))

(assert (= (and b!1005720 res!674925) b!1005717))

(assert (= (and b!1005717 res!674926) b!1005719))

(assert (= (and b!1005719 res!674933) b!1005713))

(assert (= (and b!1005713 res!674932) b!1005712))

(assert (= (and b!1005712 res!674927) b!1005715))

(assert (= (and b!1005715 res!674929) b!1005716))

(declare-fun m!930343 () Bool)

(assert (=> b!1005720 m!930343))

(declare-fun m!930345 () Bool)

(assert (=> b!1005714 m!930345))

(assert (=> b!1005714 m!930345))

(declare-fun m!930347 () Bool)

(assert (=> b!1005714 m!930347))

(declare-fun m!930349 () Bool)

(assert (=> b!1005713 m!930349))

(declare-fun m!930351 () Bool)

(assert (=> b!1005717 m!930351))

(assert (=> b!1005715 m!930345))

(assert (=> b!1005715 m!930345))

(declare-fun m!930353 () Bool)

(assert (=> b!1005715 m!930353))

(assert (=> b!1005715 m!930353))

(assert (=> b!1005715 m!930345))

(declare-fun m!930355 () Bool)

(assert (=> b!1005715 m!930355))

(declare-fun m!930357 () Bool)

(assert (=> b!1005719 m!930357))

(declare-fun m!930359 () Bool)

(assert (=> b!1005721 m!930359))

(declare-fun m!930361 () Bool)

(assert (=> start!86760 m!930361))

(declare-fun m!930363 () Bool)

(assert (=> start!86760 m!930363))

(assert (=> b!1005716 m!930345))

(assert (=> b!1005716 m!930345))

(declare-fun m!930365 () Bool)

(assert (=> b!1005716 m!930365))

(check-sat (not b!1005713) (not b!1005721) (not b!1005715) (not b!1005716) (not b!1005714) (not start!86760) (not b!1005717) (not b!1005720) (not b!1005719))
(check-sat)
