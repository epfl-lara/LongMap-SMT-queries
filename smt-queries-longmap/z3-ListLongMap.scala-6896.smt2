; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86968 () Bool)

(assert start!86968)

(declare-fun b!1006733 () Bool)

(declare-fun res!675066 () Bool)

(declare-fun e!566985 () Bool)

(assert (=> b!1006733 (=> (not res!675066) (not e!566985))))

(declare-datatypes ((array!63486 0))(
  ( (array!63487 (arr!30559 (Array (_ BitVec 32) (_ BitVec 64))) (size!31062 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63486)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006733 (= res!675066 (and (= (size!31062 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31062 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31062 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006734 () Bool)

(declare-fun res!675062 () Bool)

(assert (=> b!1006734 (=> (not res!675062) (not e!566985))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006734 (= res!675062 (validKeyInArray!0 k0!2224))))

(declare-fun b!1006735 () Bool)

(declare-fun res!675068 () Bool)

(declare-fun e!566984 () Bool)

(assert (=> b!1006735 (=> (not res!675068) (not e!566984))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1006735 (= res!675068 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31062 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31062 a!3219))))))

(declare-fun b!1006736 () Bool)

(declare-fun res!675067 () Bool)

(assert (=> b!1006736 (=> (not res!675067) (not e!566984))))

(declare-datatypes ((List!21206 0))(
  ( (Nil!21203) (Cons!21202 (h!22394 (_ BitVec 64)) (t!30199 List!21206)) )
))
(declare-fun arrayNoDuplicates!0 (array!63486 (_ BitVec 32) List!21206) Bool)

(assert (=> b!1006736 (= res!675067 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21203))))

(declare-fun b!1006737 () Bool)

(declare-fun res!675065 () Bool)

(assert (=> b!1006737 (=> (not res!675065) (not e!566985))))

(assert (=> b!1006737 (= res!675065 (validKeyInArray!0 (select (arr!30559 a!3219) j!170)))))

(declare-fun b!1006738 () Bool)

(declare-fun res!675063 () Bool)

(assert (=> b!1006738 (=> (not res!675063) (not e!566985))))

(declare-fun arrayContainsKey!0 (array!63486 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006738 (= res!675063 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006740 () Bool)

(assert (=> b!1006740 (= e!566984 false)))

(declare-datatypes ((SeekEntryResult!9427 0))(
  ( (MissingZero!9427 (index!40079 (_ BitVec 32))) (Found!9427 (index!40080 (_ BitVec 32))) (Intermediate!9427 (undefined!10239 Bool) (index!40081 (_ BitVec 32)) (x!87647 (_ BitVec 32))) (Undefined!9427) (MissingVacant!9427 (index!40082 (_ BitVec 32))) )
))
(declare-fun lt!445042 () SeekEntryResult!9427)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63486 (_ BitVec 32)) SeekEntryResult!9427)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006740 (= lt!445042 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30559 a!3219) j!170) mask!3464) (select (arr!30559 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006741 () Bool)

(assert (=> b!1006741 (= e!566985 e!566984)))

(declare-fun res!675061 () Bool)

(assert (=> b!1006741 (=> (not res!675061) (not e!566984))))

(declare-fun lt!445043 () SeekEntryResult!9427)

(assert (=> b!1006741 (= res!675061 (or (= lt!445043 (MissingVacant!9427 i!1194)) (= lt!445043 (MissingZero!9427 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63486 (_ BitVec 32)) SeekEntryResult!9427)

(assert (=> b!1006741 (= lt!445043 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1006739 () Bool)

(declare-fun res!675064 () Bool)

(assert (=> b!1006739 (=> (not res!675064) (not e!566984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63486 (_ BitVec 32)) Bool)

(assert (=> b!1006739 (= res!675064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!675060 () Bool)

(assert (=> start!86968 (=> (not res!675060) (not e!566985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86968 (= res!675060 (validMask!0 mask!3464))))

(assert (=> start!86968 e!566985))

(declare-fun array_inv!23695 (array!63486) Bool)

(assert (=> start!86968 (array_inv!23695 a!3219)))

(assert (=> start!86968 true))

(assert (= (and start!86968 res!675060) b!1006733))

(assert (= (and b!1006733 res!675066) b!1006737))

(assert (= (and b!1006737 res!675065) b!1006734))

(assert (= (and b!1006734 res!675062) b!1006738))

(assert (= (and b!1006738 res!675063) b!1006741))

(assert (= (and b!1006741 res!675061) b!1006739))

(assert (= (and b!1006739 res!675064) b!1006736))

(assert (= (and b!1006736 res!675067) b!1006735))

(assert (= (and b!1006735 res!675068) b!1006740))

(declare-fun m!932243 () Bool)

(assert (=> b!1006741 m!932243))

(declare-fun m!932245 () Bool)

(assert (=> start!86968 m!932245))

(declare-fun m!932247 () Bool)

(assert (=> start!86968 m!932247))

(declare-fun m!932249 () Bool)

(assert (=> b!1006738 m!932249))

(declare-fun m!932251 () Bool)

(assert (=> b!1006740 m!932251))

(assert (=> b!1006740 m!932251))

(declare-fun m!932253 () Bool)

(assert (=> b!1006740 m!932253))

(assert (=> b!1006740 m!932253))

(assert (=> b!1006740 m!932251))

(declare-fun m!932255 () Bool)

(assert (=> b!1006740 m!932255))

(declare-fun m!932257 () Bool)

(assert (=> b!1006739 m!932257))

(assert (=> b!1006737 m!932251))

(assert (=> b!1006737 m!932251))

(declare-fun m!932259 () Bool)

(assert (=> b!1006737 m!932259))

(declare-fun m!932261 () Bool)

(assert (=> b!1006734 m!932261))

(declare-fun m!932263 () Bool)

(assert (=> b!1006736 m!932263))

(check-sat (not b!1006740) (not b!1006737) (not b!1006736) (not b!1006739) (not b!1006738) (not start!86968) (not b!1006741) (not b!1006734))
(check-sat)
