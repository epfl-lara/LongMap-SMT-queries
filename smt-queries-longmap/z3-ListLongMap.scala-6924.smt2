; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87038 () Bool)

(assert start!87038)

(declare-fun b!1009469 () Bool)

(declare-fun res!678064 () Bool)

(declare-fun e!567954 () Bool)

(assert (=> b!1009469 (=> (not res!678064) (not e!567954))))

(declare-datatypes ((array!63613 0))(
  ( (array!63614 (arr!30626 (Array (_ BitVec 32) (_ BitVec 64))) (size!31128 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63613)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63613 (_ BitVec 32)) Bool)

(assert (=> b!1009469 (= res!678064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1009470 () Bool)

(declare-fun res!678062 () Bool)

(declare-fun e!567950 () Bool)

(assert (=> b!1009470 (=> (not res!678062) (not e!567950))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1009470 (= res!678062 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1009471 () Bool)

(declare-fun res!678057 () Bool)

(declare-fun e!567952 () Bool)

(assert (=> b!1009471 (=> (not res!678057) (not e!567952))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1009471 (= res!678057 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1009472 () Bool)

(declare-fun res!678056 () Bool)

(assert (=> b!1009472 (=> (not res!678056) (not e!567952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1009472 (= res!678056 (validKeyInArray!0 k0!2224))))

(declare-fun b!1009473 () Bool)

(declare-fun res!678060 () Bool)

(assert (=> b!1009473 (=> (not res!678060) (not e!567954))))

(declare-datatypes ((List!21302 0))(
  ( (Nil!21299) (Cons!21298 (h!22487 (_ BitVec 64)) (t!30303 List!21302)) )
))
(declare-fun arrayNoDuplicates!0 (array!63613 (_ BitVec 32) List!21302) Bool)

(assert (=> b!1009473 (= res!678060 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21299))))

(declare-fun b!1009474 () Bool)

(declare-fun res!678063 () Bool)

(assert (=> b!1009474 (=> (not res!678063) (not e!567952))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1009474 (= res!678063 (and (= (size!31128 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31128 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31128 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1009475 () Bool)

(assert (=> b!1009475 (= e!567952 e!567954)))

(declare-fun res!678058 () Bool)

(assert (=> b!1009475 (=> (not res!678058) (not e!567954))))

(declare-datatypes ((SeekEntryResult!9558 0))(
  ( (MissingZero!9558 (index!40603 (_ BitVec 32))) (Found!9558 (index!40604 (_ BitVec 32))) (Intermediate!9558 (undefined!10370 Bool) (index!40605 (_ BitVec 32)) (x!88001 (_ BitVec 32))) (Undefined!9558) (MissingVacant!9558 (index!40606 (_ BitVec 32))) )
))
(declare-fun lt!446156 () SeekEntryResult!9558)

(assert (=> b!1009475 (= res!678058 (or (= lt!446156 (MissingVacant!9558 i!1194)) (= lt!446156 (MissingZero!9558 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63613 (_ BitVec 32)) SeekEntryResult!9558)

(assert (=> b!1009475 (= lt!446156 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1009476 () Bool)

(declare-fun res!678061 () Bool)

(assert (=> b!1009476 (=> (not res!678061) (not e!567950))))

(declare-fun lt!446159 () (_ BitVec 64))

(declare-fun lt!446158 () SeekEntryResult!9558)

(declare-fun lt!446157 () array!63613)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63613 (_ BitVec 32)) SeekEntryResult!9558)

(assert (=> b!1009476 (= res!678061 (not (= lt!446158 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446159 lt!446157 mask!3464))))))

(declare-fun res!678059 () Bool)

(assert (=> start!87038 (=> (not res!678059) (not e!567952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87038 (= res!678059 (validMask!0 mask!3464))))

(assert (=> start!87038 e!567952))

(declare-fun array_inv!23750 (array!63613) Bool)

(assert (=> start!87038 (array_inv!23750 a!3219)))

(assert (=> start!87038 true))

(declare-fun b!1009468 () Bool)

(declare-fun e!567951 () Bool)

(assert (=> b!1009468 (= e!567954 e!567951)))

(declare-fun res!678067 () Bool)

(assert (=> b!1009468 (=> (not res!678067) (not e!567951))))

(declare-fun lt!446155 () SeekEntryResult!9558)

(declare-fun lt!446160 () SeekEntryResult!9558)

(assert (=> b!1009468 (= res!678067 (= lt!446155 lt!446160))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1009468 (= lt!446160 (Intermediate!9558 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009468 (= lt!446155 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30626 a!3219) j!170) mask!3464) (select (arr!30626 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009477 () Bool)

(declare-fun e!567953 () Bool)

(assert (=> b!1009477 (= e!567951 e!567953)))

(declare-fun res!678065 () Bool)

(assert (=> b!1009477 (=> (not res!678065) (not e!567953))))

(assert (=> b!1009477 (= res!678065 (= lt!446158 lt!446160))))

(assert (=> b!1009477 (= lt!446158 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30626 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009478 () Bool)

(assert (=> b!1009478 (= e!567953 e!567950)))

(declare-fun res!678069 () Bool)

(assert (=> b!1009478 (=> (not res!678069) (not e!567950))))

(assert (=> b!1009478 (= res!678069 (not (= lt!446155 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446159 mask!3464) lt!446159 lt!446157 mask!3464))))))

(assert (=> b!1009478 (= lt!446159 (select (store (arr!30626 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1009478 (= lt!446157 (array!63614 (store (arr!30626 a!3219) i!1194 k0!2224) (size!31128 a!3219)))))

(declare-fun b!1009479 () Bool)

(assert (=> b!1009479 (= e!567950 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvslt (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000)))))

(declare-fun lt!446154 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009479 (= lt!446154 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1009480 () Bool)

(declare-fun res!678066 () Bool)

(assert (=> b!1009480 (=> (not res!678066) (not e!567952))))

(assert (=> b!1009480 (= res!678066 (validKeyInArray!0 (select (arr!30626 a!3219) j!170)))))

(declare-fun b!1009481 () Bool)

(declare-fun res!678068 () Bool)

(assert (=> b!1009481 (=> (not res!678068) (not e!567954))))

(assert (=> b!1009481 (= res!678068 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31128 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31128 a!3219))))))

(assert (= (and start!87038 res!678059) b!1009474))

(assert (= (and b!1009474 res!678063) b!1009480))

(assert (= (and b!1009480 res!678066) b!1009472))

(assert (= (and b!1009472 res!678056) b!1009471))

(assert (= (and b!1009471 res!678057) b!1009475))

(assert (= (and b!1009475 res!678058) b!1009469))

(assert (= (and b!1009469 res!678064) b!1009473))

(assert (= (and b!1009473 res!678060) b!1009481))

(assert (= (and b!1009481 res!678068) b!1009468))

(assert (= (and b!1009468 res!678067) b!1009477))

(assert (= (and b!1009477 res!678065) b!1009478))

(assert (= (and b!1009478 res!678069) b!1009476))

(assert (= (and b!1009476 res!678061) b!1009470))

(assert (= (and b!1009470 res!678062) b!1009479))

(declare-fun m!934017 () Bool)

(assert (=> b!1009478 m!934017))

(assert (=> b!1009478 m!934017))

(declare-fun m!934019 () Bool)

(assert (=> b!1009478 m!934019))

(declare-fun m!934021 () Bool)

(assert (=> b!1009478 m!934021))

(declare-fun m!934023 () Bool)

(assert (=> b!1009478 m!934023))

(declare-fun m!934025 () Bool)

(assert (=> b!1009472 m!934025))

(declare-fun m!934027 () Bool)

(assert (=> b!1009479 m!934027))

(declare-fun m!934029 () Bool)

(assert (=> b!1009475 m!934029))

(declare-fun m!934031 () Bool)

(assert (=> b!1009480 m!934031))

(assert (=> b!1009480 m!934031))

(declare-fun m!934033 () Bool)

(assert (=> b!1009480 m!934033))

(declare-fun m!934035 () Bool)

(assert (=> start!87038 m!934035))

(declare-fun m!934037 () Bool)

(assert (=> start!87038 m!934037))

(declare-fun m!934039 () Bool)

(assert (=> b!1009471 m!934039))

(assert (=> b!1009477 m!934031))

(assert (=> b!1009477 m!934031))

(declare-fun m!934041 () Bool)

(assert (=> b!1009477 m!934041))

(declare-fun m!934043 () Bool)

(assert (=> b!1009469 m!934043))

(declare-fun m!934045 () Bool)

(assert (=> b!1009476 m!934045))

(declare-fun m!934047 () Bool)

(assert (=> b!1009473 m!934047))

(assert (=> b!1009468 m!934031))

(assert (=> b!1009468 m!934031))

(declare-fun m!934049 () Bool)

(assert (=> b!1009468 m!934049))

(assert (=> b!1009468 m!934049))

(assert (=> b!1009468 m!934031))

(declare-fun m!934051 () Bool)

(assert (=> b!1009468 m!934051))

(check-sat (not b!1009476) (not b!1009478) (not b!1009472) (not b!1009477) (not start!87038) (not b!1009473) (not b!1009471) (not b!1009469) (not b!1009468) (not b!1009475) (not b!1009480) (not b!1009479))
(check-sat)
