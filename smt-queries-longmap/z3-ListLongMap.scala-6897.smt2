; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86746 () Bool)

(assert start!86746)

(declare-fun b!1005600 () Bool)

(declare-fun res!674688 () Bool)

(declare-fun e!566218 () Bool)

(assert (=> b!1005600 (=> (not res!674688) (not e!566218))))

(declare-datatypes ((array!63445 0))(
  ( (array!63446 (arr!30545 (Array (_ BitVec 32) (_ BitVec 64))) (size!31047 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63445)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9477 0))(
  ( (MissingZero!9477 (index!40279 (_ BitVec 32))) (Found!9477 (index!40280 (_ BitVec 32))) (Intermediate!9477 (undefined!10289 Bool) (index!40281 (_ BitVec 32)) (x!87685 (_ BitVec 32))) (Undefined!9477) (MissingVacant!9477 (index!40282 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63445 (_ BitVec 32)) SeekEntryResult!9477)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005600 (= res!674688 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30545 a!3219) j!170) mask!3464) (select (arr!30545 a!3219) j!170) a!3219 mask!3464) (Intermediate!9477 false resIndex!38 resX!38)))))

(declare-fun b!1005601 () Bool)

(declare-fun res!674692 () Bool)

(declare-fun e!566216 () Bool)

(assert (=> b!1005601 (=> (not res!674692) (not e!566216))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63445 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005601 (= res!674692 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005602 () Bool)

(declare-fun res!674695 () Bool)

(assert (=> b!1005602 (=> (not res!674695) (not e!566218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63445 (_ BitVec 32)) Bool)

(assert (=> b!1005602 (= res!674695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!674689 () Bool)

(assert (=> start!86746 (=> (not res!674689) (not e!566216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86746 (= res!674689 (validMask!0 mask!3464))))

(assert (=> start!86746 e!566216))

(declare-fun array_inv!23669 (array!63445) Bool)

(assert (=> start!86746 (array_inv!23669 a!3219)))

(assert (=> start!86746 true))

(declare-fun b!1005603 () Bool)

(declare-fun res!674691 () Bool)

(assert (=> b!1005603 (=> (not res!674691) (not e!566216))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005603 (= res!674691 (and (= (size!31047 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31047 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31047 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005604 () Bool)

(assert (=> b!1005604 (= e!566216 e!566218)))

(declare-fun res!674690 () Bool)

(assert (=> b!1005604 (=> (not res!674690) (not e!566218))))

(declare-fun lt!444587 () SeekEntryResult!9477)

(assert (=> b!1005604 (= res!674690 (or (= lt!444587 (MissingVacant!9477 i!1194)) (= lt!444587 (MissingZero!9477 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63445 (_ BitVec 32)) SeekEntryResult!9477)

(assert (=> b!1005604 (= lt!444587 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1005605 () Bool)

(declare-fun res!674697 () Bool)

(assert (=> b!1005605 (=> (not res!674697) (not e!566218))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1005605 (= res!674697 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31047 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31047 a!3219))))))

(declare-fun b!1005606 () Bool)

(declare-fun res!674693 () Bool)

(assert (=> b!1005606 (=> (not res!674693) (not e!566216))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005606 (= res!674693 (validKeyInArray!0 k0!2224))))

(declare-fun b!1005607 () Bool)

(declare-fun res!674694 () Bool)

(assert (=> b!1005607 (=> (not res!674694) (not e!566216))))

(assert (=> b!1005607 (= res!674694 (validKeyInArray!0 (select (arr!30545 a!3219) j!170)))))

(declare-fun b!1005608 () Bool)

(assert (=> b!1005608 (= e!566218 false)))

(declare-fun lt!444586 () SeekEntryResult!9477)

(assert (=> b!1005608 (= lt!444586 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30545 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005609 () Bool)

(declare-fun res!674696 () Bool)

(assert (=> b!1005609 (=> (not res!674696) (not e!566218))))

(declare-datatypes ((List!21221 0))(
  ( (Nil!21218) (Cons!21217 (h!22400 (_ BitVec 64)) (t!30222 List!21221)) )
))
(declare-fun arrayNoDuplicates!0 (array!63445 (_ BitVec 32) List!21221) Bool)

(assert (=> b!1005609 (= res!674696 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21218))))

(assert (= (and start!86746 res!674689) b!1005603))

(assert (= (and b!1005603 res!674691) b!1005607))

(assert (= (and b!1005607 res!674694) b!1005606))

(assert (= (and b!1005606 res!674693) b!1005601))

(assert (= (and b!1005601 res!674692) b!1005604))

(assert (= (and b!1005604 res!674690) b!1005602))

(assert (= (and b!1005602 res!674695) b!1005609))

(assert (= (and b!1005609 res!674696) b!1005605))

(assert (= (and b!1005605 res!674697) b!1005600))

(assert (= (and b!1005600 res!674688) b!1005608))

(declare-fun m!930809 () Bool)

(assert (=> b!1005607 m!930809))

(assert (=> b!1005607 m!930809))

(declare-fun m!930811 () Bool)

(assert (=> b!1005607 m!930811))

(declare-fun m!930813 () Bool)

(assert (=> b!1005609 m!930813))

(declare-fun m!930815 () Bool)

(assert (=> b!1005602 m!930815))

(assert (=> b!1005600 m!930809))

(assert (=> b!1005600 m!930809))

(declare-fun m!930817 () Bool)

(assert (=> b!1005600 m!930817))

(assert (=> b!1005600 m!930817))

(assert (=> b!1005600 m!930809))

(declare-fun m!930819 () Bool)

(assert (=> b!1005600 m!930819))

(declare-fun m!930821 () Bool)

(assert (=> b!1005606 m!930821))

(declare-fun m!930823 () Bool)

(assert (=> b!1005604 m!930823))

(assert (=> b!1005608 m!930809))

(assert (=> b!1005608 m!930809))

(declare-fun m!930825 () Bool)

(assert (=> b!1005608 m!930825))

(declare-fun m!930827 () Bool)

(assert (=> start!86746 m!930827))

(declare-fun m!930829 () Bool)

(assert (=> start!86746 m!930829))

(declare-fun m!930831 () Bool)

(assert (=> b!1005601 m!930831))

(check-sat (not b!1005604) (not b!1005609) (not b!1005606) (not b!1005608) (not b!1005602) (not start!86746) (not b!1005607) (not b!1005601) (not b!1005600))
(check-sat)
