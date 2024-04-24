; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86986 () Bool)

(assert start!86986)

(declare-fun b!1006996 () Bool)

(declare-fun res!675330 () Bool)

(declare-fun e!567066 () Bool)

(assert (=> b!1006996 (=> (not res!675330) (not e!567066))))

(declare-datatypes ((array!63504 0))(
  ( (array!63505 (arr!30568 (Array (_ BitVec 32) (_ BitVec 64))) (size!31071 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63504)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006996 (= res!675330 (and (= (size!31071 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31071 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31071 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006997 () Bool)

(declare-fun res!675332 () Bool)

(declare-fun e!567064 () Bool)

(assert (=> b!1006997 (=> (not res!675332) (not e!567064))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006997 (= res!675332 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31071 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31071 a!3219))))))

(declare-fun b!1006998 () Bool)

(declare-fun res!675323 () Bool)

(assert (=> b!1006998 (=> (not res!675323) (not e!567064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63504 (_ BitVec 32)) Bool)

(assert (=> b!1006998 (= res!675323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006999 () Bool)

(declare-fun res!675328 () Bool)

(assert (=> b!1006999 (=> (not res!675328) (not e!567064))))

(declare-datatypes ((SeekEntryResult!9436 0))(
  ( (MissingZero!9436 (index!40115 (_ BitVec 32))) (Found!9436 (index!40116 (_ BitVec 32))) (Intermediate!9436 (undefined!10248 Bool) (index!40117 (_ BitVec 32)) (x!87680 (_ BitVec 32))) (Undefined!9436) (MissingVacant!9436 (index!40118 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63504 (_ BitVec 32)) SeekEntryResult!9436)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006999 (= res!675328 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30568 a!3219) j!170) mask!3464) (select (arr!30568 a!3219) j!170) a!3219 mask!3464) (Intermediate!9436 false resIndex!38 resX!38)))))

(declare-fun b!1007000 () Bool)

(declare-fun res!675329 () Bool)

(assert (=> b!1007000 (=> (not res!675329) (not e!567066))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63504 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007000 (= res!675329 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007002 () Bool)

(declare-fun res!675324 () Bool)

(assert (=> b!1007002 (=> (not res!675324) (not e!567064))))

(declare-datatypes ((List!21215 0))(
  ( (Nil!21212) (Cons!21211 (h!22403 (_ BitVec 64)) (t!30208 List!21215)) )
))
(declare-fun arrayNoDuplicates!0 (array!63504 (_ BitVec 32) List!21215) Bool)

(assert (=> b!1007002 (= res!675324 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21212))))

(declare-fun b!1007003 () Bool)

(assert (=> b!1007003 (= e!567064 false)))

(declare-fun lt!445097 () SeekEntryResult!9436)

(assert (=> b!1007003 (= lt!445097 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30568 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007004 () Bool)

(declare-fun res!675327 () Bool)

(assert (=> b!1007004 (=> (not res!675327) (not e!567066))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007004 (= res!675327 (validKeyInArray!0 k0!2224))))

(declare-fun b!1007005 () Bool)

(declare-fun res!675325 () Bool)

(assert (=> b!1007005 (=> (not res!675325) (not e!567066))))

(assert (=> b!1007005 (= res!675325 (validKeyInArray!0 (select (arr!30568 a!3219) j!170)))))

(declare-fun b!1007001 () Bool)

(assert (=> b!1007001 (= e!567066 e!567064)))

(declare-fun res!675331 () Bool)

(assert (=> b!1007001 (=> (not res!675331) (not e!567064))))

(declare-fun lt!445096 () SeekEntryResult!9436)

(assert (=> b!1007001 (= res!675331 (or (= lt!445096 (MissingVacant!9436 i!1194)) (= lt!445096 (MissingZero!9436 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63504 (_ BitVec 32)) SeekEntryResult!9436)

(assert (=> b!1007001 (= lt!445096 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!675326 () Bool)

(assert (=> start!86986 (=> (not res!675326) (not e!567066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86986 (= res!675326 (validMask!0 mask!3464))))

(assert (=> start!86986 e!567066))

(declare-fun array_inv!23704 (array!63504) Bool)

(assert (=> start!86986 (array_inv!23704 a!3219)))

(assert (=> start!86986 true))

(assert (= (and start!86986 res!675326) b!1006996))

(assert (= (and b!1006996 res!675330) b!1007005))

(assert (= (and b!1007005 res!675325) b!1007004))

(assert (= (and b!1007004 res!675327) b!1007000))

(assert (= (and b!1007000 res!675329) b!1007001))

(assert (= (and b!1007001 res!675331) b!1006998))

(assert (= (and b!1006998 res!675323) b!1007002))

(assert (= (and b!1007002 res!675324) b!1006997))

(assert (= (and b!1006997 res!675332) b!1006999))

(assert (= (and b!1006999 res!675328) b!1007003))

(declare-fun m!932453 () Bool)

(assert (=> b!1006999 m!932453))

(assert (=> b!1006999 m!932453))

(declare-fun m!932455 () Bool)

(assert (=> b!1006999 m!932455))

(assert (=> b!1006999 m!932455))

(assert (=> b!1006999 m!932453))

(declare-fun m!932457 () Bool)

(assert (=> b!1006999 m!932457))

(declare-fun m!932459 () Bool)

(assert (=> b!1006998 m!932459))

(declare-fun m!932461 () Bool)

(assert (=> b!1007001 m!932461))

(declare-fun m!932463 () Bool)

(assert (=> b!1007004 m!932463))

(assert (=> b!1007003 m!932453))

(assert (=> b!1007003 m!932453))

(declare-fun m!932465 () Bool)

(assert (=> b!1007003 m!932465))

(declare-fun m!932467 () Bool)

(assert (=> b!1007000 m!932467))

(declare-fun m!932469 () Bool)

(assert (=> start!86986 m!932469))

(declare-fun m!932471 () Bool)

(assert (=> start!86986 m!932471))

(declare-fun m!932473 () Bool)

(assert (=> b!1007002 m!932473))

(assert (=> b!1007005 m!932453))

(assert (=> b!1007005 m!932453))

(declare-fun m!932475 () Bool)

(assert (=> b!1007005 m!932475))

(check-sat (not b!1007000) (not b!1007003) (not b!1006998) (not b!1007004) (not start!86986) (not b!1007002) (not b!1006999) (not b!1007005) (not b!1007001))
(check-sat)
