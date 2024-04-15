; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86748 () Bool)

(assert start!86748)

(declare-fun b!1005532 () Bool)

(declare-fun e!566130 () Bool)

(assert (=> b!1005532 (= e!566130 false)))

(declare-datatypes ((array!63394 0))(
  ( (array!63395 (arr!30519 (Array (_ BitVec 32) (_ BitVec 64))) (size!31023 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63394)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9476 0))(
  ( (MissingZero!9476 (index!40275 (_ BitVec 32))) (Found!9476 (index!40276 (_ BitVec 32))) (Intermediate!9476 (undefined!10288 Bool) (index!40277 (_ BitVec 32)) (x!87695 (_ BitVec 32))) (Undefined!9476) (MissingVacant!9476 (index!40278 (_ BitVec 32))) )
))
(declare-fun lt!444385 () SeekEntryResult!9476)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63394 (_ BitVec 32)) SeekEntryResult!9476)

(assert (=> b!1005532 (= lt!444385 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30519 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005533 () Bool)

(declare-fun res!674745 () Bool)

(assert (=> b!1005533 (=> (not res!674745) (not e!566130))))

(declare-datatypes ((List!21261 0))(
  ( (Nil!21258) (Cons!21257 (h!22440 (_ BitVec 64)) (t!30253 List!21261)) )
))
(declare-fun arrayNoDuplicates!0 (array!63394 (_ BitVec 32) List!21261) Bool)

(assert (=> b!1005533 (= res!674745 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21258))))

(declare-fun b!1005534 () Bool)

(declare-fun res!674750 () Bool)

(declare-fun e!566132 () Bool)

(assert (=> b!1005534 (=> (not res!674750) (not e!566132))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63394 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005534 (= res!674750 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005535 () Bool)

(declare-fun res!674753 () Bool)

(assert (=> b!1005535 (=> (not res!674753) (not e!566132))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005535 (= res!674753 (validKeyInArray!0 (select (arr!30519 a!3219) j!170)))))

(declare-fun b!1005536 () Bool)

(declare-fun res!674751 () Bool)

(assert (=> b!1005536 (=> (not res!674751) (not e!566132))))

(assert (=> b!1005536 (= res!674751 (validKeyInArray!0 k0!2224))))

(declare-fun res!674746 () Bool)

(assert (=> start!86748 (=> (not res!674746) (not e!566132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86748 (= res!674746 (validMask!0 mask!3464))))

(assert (=> start!86748 e!566132))

(declare-fun array_inv!23662 (array!63394) Bool)

(assert (=> start!86748 (array_inv!23662 a!3219)))

(assert (=> start!86748 true))

(declare-fun b!1005537 () Bool)

(declare-fun res!674748 () Bool)

(assert (=> b!1005537 (=> (not res!674748) (not e!566130))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005537 (= res!674748 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30519 a!3219) j!170) mask!3464) (select (arr!30519 a!3219) j!170) a!3219 mask!3464) (Intermediate!9476 false resIndex!38 resX!38)))))

(declare-fun b!1005538 () Bool)

(declare-fun res!674752 () Bool)

(assert (=> b!1005538 (=> (not res!674752) (not e!566130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63394 (_ BitVec 32)) Bool)

(assert (=> b!1005538 (= res!674752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005539 () Bool)

(declare-fun res!674744 () Bool)

(assert (=> b!1005539 (=> (not res!674744) (not e!566132))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005539 (= res!674744 (and (= (size!31023 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31023 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31023 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005540 () Bool)

(assert (=> b!1005540 (= e!566132 e!566130)))

(declare-fun res!674749 () Bool)

(assert (=> b!1005540 (=> (not res!674749) (not e!566130))))

(declare-fun lt!444384 () SeekEntryResult!9476)

(assert (=> b!1005540 (= res!674749 (or (= lt!444384 (MissingVacant!9476 i!1194)) (= lt!444384 (MissingZero!9476 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63394 (_ BitVec 32)) SeekEntryResult!9476)

(assert (=> b!1005540 (= lt!444384 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1005541 () Bool)

(declare-fun res!674747 () Bool)

(assert (=> b!1005541 (=> (not res!674747) (not e!566130))))

(assert (=> b!1005541 (= res!674747 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31023 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31023 a!3219))))))

(assert (= (and start!86748 res!674746) b!1005539))

(assert (= (and b!1005539 res!674744) b!1005535))

(assert (= (and b!1005535 res!674753) b!1005536))

(assert (= (and b!1005536 res!674751) b!1005534))

(assert (= (and b!1005534 res!674750) b!1005540))

(assert (= (and b!1005540 res!674749) b!1005538))

(assert (= (and b!1005538 res!674752) b!1005533))

(assert (= (and b!1005533 res!674745) b!1005541))

(assert (= (and b!1005541 res!674747) b!1005537))

(assert (= (and b!1005537 res!674748) b!1005532))

(declare-fun m!930199 () Bool)

(assert (=> b!1005537 m!930199))

(assert (=> b!1005537 m!930199))

(declare-fun m!930201 () Bool)

(assert (=> b!1005537 m!930201))

(assert (=> b!1005537 m!930201))

(assert (=> b!1005537 m!930199))

(declare-fun m!930203 () Bool)

(assert (=> b!1005537 m!930203))

(declare-fun m!930205 () Bool)

(assert (=> b!1005538 m!930205))

(declare-fun m!930207 () Bool)

(assert (=> b!1005533 m!930207))

(declare-fun m!930209 () Bool)

(assert (=> b!1005534 m!930209))

(declare-fun m!930211 () Bool)

(assert (=> b!1005536 m!930211))

(assert (=> b!1005535 m!930199))

(assert (=> b!1005535 m!930199))

(declare-fun m!930213 () Bool)

(assert (=> b!1005535 m!930213))

(assert (=> b!1005532 m!930199))

(assert (=> b!1005532 m!930199))

(declare-fun m!930215 () Bool)

(assert (=> b!1005532 m!930215))

(declare-fun m!930217 () Bool)

(assert (=> b!1005540 m!930217))

(declare-fun m!930219 () Bool)

(assert (=> start!86748 m!930219))

(declare-fun m!930221 () Bool)

(assert (=> start!86748 m!930221))

(check-sat (not b!1005537) (not b!1005538) (not b!1005532) (not b!1005534) (not b!1005533) (not start!86748) (not b!1005540) (not b!1005536) (not b!1005535))
(check-sat)
