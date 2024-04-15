; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87042 () Bool)

(assert start!87042)

(declare-fun b!1009422 () Bool)

(declare-fun res!678084 () Bool)

(declare-fun e!567909 () Bool)

(assert (=> b!1009422 (=> (not res!678084) (not e!567909))))

(declare-datatypes ((array!63556 0))(
  ( (array!63557 (arr!30597 (Array (_ BitVec 32) (_ BitVec 64))) (size!31101 (_ BitVec 32))) )
))
(declare-fun lt!445996 () array!63556)

(declare-fun lt!445999 () (_ BitVec 64))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9554 0))(
  ( (MissingZero!9554 (index!40587 (_ BitVec 32))) (Found!9554 (index!40588 (_ BitVec 32))) (Intermediate!9554 (undefined!10366 Bool) (index!40589 (_ BitVec 32)) (x!88002 (_ BitVec 32))) (Undefined!9554) (MissingVacant!9554 (index!40590 (_ BitVec 32))) )
))
(declare-fun lt!446001 () SeekEntryResult!9554)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63556 (_ BitVec 32)) SeekEntryResult!9554)

(assert (=> b!1009422 (= res!678084 (not (= lt!446001 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445999 lt!445996 mask!3464))))))

(declare-fun res!678088 () Bool)

(declare-fun e!567911 () Bool)

(assert (=> start!87042 (=> (not res!678088) (not e!567911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87042 (= res!678088 (validMask!0 mask!3464))))

(assert (=> start!87042 e!567911))

(declare-fun a!3219 () array!63556)

(declare-fun array_inv!23740 (array!63556) Bool)

(assert (=> start!87042 (array_inv!23740 a!3219)))

(assert (=> start!87042 true))

(declare-fun b!1009423 () Bool)

(declare-fun e!567912 () Bool)

(assert (=> b!1009423 (= e!567912 e!567909)))

(declare-fun res!678091 () Bool)

(assert (=> b!1009423 (=> (not res!678091) (not e!567909))))

(declare-fun lt!445997 () SeekEntryResult!9554)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009423 (= res!678091 (not (= lt!445997 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445999 mask!3464) lt!445999 lt!445996 mask!3464))))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1009423 (= lt!445999 (select (store (arr!30597 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1009423 (= lt!445996 (array!63557 (store (arr!30597 a!3219) i!1194 k0!2224) (size!31101 a!3219)))))

(declare-fun b!1009424 () Bool)

(declare-fun res!678087 () Bool)

(declare-fun e!567913 () Bool)

(assert (=> b!1009424 (=> (not res!678087) (not e!567913))))

(declare-datatypes ((List!21339 0))(
  ( (Nil!21336) (Cons!21335 (h!22524 (_ BitVec 64)) (t!30331 List!21339)) )
))
(declare-fun arrayNoDuplicates!0 (array!63556 (_ BitVec 32) List!21339) Bool)

(assert (=> b!1009424 (= res!678087 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21336))))

(declare-fun b!1009425 () Bool)

(declare-fun res!678082 () Bool)

(assert (=> b!1009425 (=> (not res!678082) (not e!567911))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1009425 (= res!678082 (validKeyInArray!0 k0!2224))))

(declare-fun b!1009426 () Bool)

(declare-fun res!678090 () Bool)

(assert (=> b!1009426 (=> (not res!678090) (not e!567913))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1009426 (= res!678090 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31101 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31101 a!3219))))))

(declare-fun b!1009427 () Bool)

(declare-fun e!567910 () Bool)

(assert (=> b!1009427 (= e!567910 e!567912)))

(declare-fun res!678086 () Bool)

(assert (=> b!1009427 (=> (not res!678086) (not e!567912))))

(declare-fun lt!445998 () SeekEntryResult!9554)

(assert (=> b!1009427 (= res!678086 (= lt!446001 lt!445998))))

(assert (=> b!1009427 (= lt!446001 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30597 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009428 () Bool)

(declare-fun res!678079 () Bool)

(assert (=> b!1009428 (=> (not res!678079) (not e!567911))))

(assert (=> b!1009428 (= res!678079 (and (= (size!31101 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31101 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31101 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1009429 () Bool)

(assert (=> b!1009429 (= e!567911 e!567913)))

(declare-fun res!678080 () Bool)

(assert (=> b!1009429 (=> (not res!678080) (not e!567913))))

(declare-fun lt!446000 () SeekEntryResult!9554)

(assert (=> b!1009429 (= res!678080 (or (= lt!446000 (MissingVacant!9554 i!1194)) (= lt!446000 (MissingZero!9554 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63556 (_ BitVec 32)) SeekEntryResult!9554)

(assert (=> b!1009429 (= lt!446000 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1009430 () Bool)

(assert (=> b!1009430 (= e!567909 false)))

(declare-fun lt!446002 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009430 (= lt!446002 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1009431 () Bool)

(declare-fun res!678083 () Bool)

(assert (=> b!1009431 (=> (not res!678083) (not e!567911))))

(assert (=> b!1009431 (= res!678083 (validKeyInArray!0 (select (arr!30597 a!3219) j!170)))))

(declare-fun b!1009432 () Bool)

(assert (=> b!1009432 (= e!567913 e!567910)))

(declare-fun res!678092 () Bool)

(assert (=> b!1009432 (=> (not res!678092) (not e!567910))))

(assert (=> b!1009432 (= res!678092 (= lt!445997 lt!445998))))

(assert (=> b!1009432 (= lt!445998 (Intermediate!9554 false resIndex!38 resX!38))))

(assert (=> b!1009432 (= lt!445997 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30597 a!3219) j!170) mask!3464) (select (arr!30597 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009433 () Bool)

(declare-fun res!678089 () Bool)

(assert (=> b!1009433 (=> (not res!678089) (not e!567913))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63556 (_ BitVec 32)) Bool)

(assert (=> b!1009433 (= res!678089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1009434 () Bool)

(declare-fun res!678085 () Bool)

(assert (=> b!1009434 (=> (not res!678085) (not e!567911))))

(declare-fun arrayContainsKey!0 (array!63556 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1009434 (= res!678085 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1009435 () Bool)

(declare-fun res!678081 () Bool)

(assert (=> b!1009435 (=> (not res!678081) (not e!567909))))

(assert (=> b!1009435 (= res!678081 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(assert (= (and start!87042 res!678088) b!1009428))

(assert (= (and b!1009428 res!678079) b!1009431))

(assert (= (and b!1009431 res!678083) b!1009425))

(assert (= (and b!1009425 res!678082) b!1009434))

(assert (= (and b!1009434 res!678085) b!1009429))

(assert (= (and b!1009429 res!678080) b!1009433))

(assert (= (and b!1009433 res!678089) b!1009424))

(assert (= (and b!1009424 res!678087) b!1009426))

(assert (= (and b!1009426 res!678090) b!1009432))

(assert (= (and b!1009432 res!678092) b!1009427))

(assert (= (and b!1009427 res!678086) b!1009423))

(assert (= (and b!1009423 res!678091) b!1009422))

(assert (= (and b!1009422 res!678084) b!1009435))

(assert (= (and b!1009435 res!678081) b!1009430))

(declare-fun m!933451 () Bool)

(assert (=> b!1009430 m!933451))

(declare-fun m!933453 () Bool)

(assert (=> b!1009425 m!933453))

(declare-fun m!933455 () Bool)

(assert (=> b!1009427 m!933455))

(assert (=> b!1009427 m!933455))

(declare-fun m!933457 () Bool)

(assert (=> b!1009427 m!933457))

(assert (=> b!1009432 m!933455))

(assert (=> b!1009432 m!933455))

(declare-fun m!933459 () Bool)

(assert (=> b!1009432 m!933459))

(assert (=> b!1009432 m!933459))

(assert (=> b!1009432 m!933455))

(declare-fun m!933461 () Bool)

(assert (=> b!1009432 m!933461))

(assert (=> b!1009431 m!933455))

(assert (=> b!1009431 m!933455))

(declare-fun m!933463 () Bool)

(assert (=> b!1009431 m!933463))

(declare-fun m!933465 () Bool)

(assert (=> b!1009422 m!933465))

(declare-fun m!933467 () Bool)

(assert (=> b!1009429 m!933467))

(declare-fun m!933469 () Bool)

(assert (=> b!1009423 m!933469))

(assert (=> b!1009423 m!933469))

(declare-fun m!933471 () Bool)

(assert (=> b!1009423 m!933471))

(declare-fun m!933473 () Bool)

(assert (=> b!1009423 m!933473))

(declare-fun m!933475 () Bool)

(assert (=> b!1009423 m!933475))

(declare-fun m!933477 () Bool)

(assert (=> b!1009433 m!933477))

(declare-fun m!933479 () Bool)

(assert (=> b!1009434 m!933479))

(declare-fun m!933481 () Bool)

(assert (=> b!1009424 m!933481))

(declare-fun m!933483 () Bool)

(assert (=> start!87042 m!933483))

(declare-fun m!933485 () Bool)

(assert (=> start!87042 m!933485))

(check-sat (not b!1009432) (not b!1009434) (not b!1009424) (not b!1009423) (not b!1009433) (not b!1009427) (not b!1009425) (not b!1009430) (not start!87042) (not b!1009429) (not b!1009431) (not b!1009422))
(check-sat)
