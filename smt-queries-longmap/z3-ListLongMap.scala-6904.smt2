; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86778 () Bool)

(assert start!86778)

(declare-fun b!1006002 () Bool)

(declare-fun res!675216 () Bool)

(declare-fun e!566287 () Bool)

(assert (=> b!1006002 (=> (not res!675216) (not e!566287))))

(declare-datatypes ((array!63424 0))(
  ( (array!63425 (arr!30534 (Array (_ BitVec 32) (_ BitVec 64))) (size!31038 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63424)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9491 0))(
  ( (MissingZero!9491 (index!40335 (_ BitVec 32))) (Found!9491 (index!40336 (_ BitVec 32))) (Intermediate!9491 (undefined!10303 Bool) (index!40337 (_ BitVec 32)) (x!87750 (_ BitVec 32))) (Undefined!9491) (MissingVacant!9491 (index!40338 (_ BitVec 32))) )
))
(declare-fun lt!444495 () SeekEntryResult!9491)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63424 (_ BitVec 32)) SeekEntryResult!9491)

(assert (=> b!1006002 (= res!675216 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30534 a!3219) j!170) a!3219 mask!3464) lt!444495))))

(declare-fun b!1006003 () Bool)

(declare-fun res!675214 () Bool)

(declare-fun e!566286 () Bool)

(assert (=> b!1006003 (=> (not res!675214) (not e!566286))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006003 (= res!675214 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31038 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31038 a!3219))))))

(declare-fun b!1006004 () Bool)

(declare-fun e!566288 () Bool)

(assert (=> b!1006004 (= e!566288 e!566286)))

(declare-fun res!675223 () Bool)

(assert (=> b!1006004 (=> (not res!675223) (not e!566286))))

(declare-fun lt!444494 () SeekEntryResult!9491)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006004 (= res!675223 (or (= lt!444494 (MissingVacant!9491 i!1194)) (= lt!444494 (MissingZero!9491 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63424 (_ BitVec 32)) SeekEntryResult!9491)

(assert (=> b!1006004 (= lt!444494 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1006005 () Bool)

(declare-fun res!675219 () Bool)

(assert (=> b!1006005 (=> (not res!675219) (not e!566286))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63424 (_ BitVec 32)) Bool)

(assert (=> b!1006005 (= res!675219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006006 () Bool)

(declare-fun res!675221 () Bool)

(assert (=> b!1006006 (=> (not res!675221) (not e!566288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006006 (= res!675221 (validKeyInArray!0 (select (arr!30534 a!3219) j!170)))))

(declare-fun b!1006007 () Bool)

(assert (=> b!1006007 (= e!566287 false)))

(declare-fun lt!444496 () SeekEntryResult!9491)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006007 (= lt!444496 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30534 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30534 a!3219) i!1194 k0!2224) j!170) (array!63425 (store (arr!30534 a!3219) i!1194 k0!2224) (size!31038 a!3219)) mask!3464))))

(declare-fun b!1006008 () Bool)

(declare-fun res!675217 () Bool)

(assert (=> b!1006008 (=> (not res!675217) (not e!566288))))

(assert (=> b!1006008 (= res!675217 (validKeyInArray!0 k0!2224))))

(declare-fun res!675220 () Bool)

(assert (=> start!86778 (=> (not res!675220) (not e!566288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86778 (= res!675220 (validMask!0 mask!3464))))

(assert (=> start!86778 e!566288))

(declare-fun array_inv!23677 (array!63424) Bool)

(assert (=> start!86778 (array_inv!23677 a!3219)))

(assert (=> start!86778 true))

(declare-fun b!1006009 () Bool)

(declare-fun res!675218 () Bool)

(assert (=> b!1006009 (=> (not res!675218) (not e!566288))))

(assert (=> b!1006009 (= res!675218 (and (= (size!31038 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31038 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31038 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006010 () Bool)

(assert (=> b!1006010 (= e!566286 e!566287)))

(declare-fun res!675224 () Bool)

(assert (=> b!1006010 (=> (not res!675224) (not e!566287))))

(assert (=> b!1006010 (= res!675224 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30534 a!3219) j!170) mask!3464) (select (arr!30534 a!3219) j!170) a!3219 mask!3464) lt!444495))))

(assert (=> b!1006010 (= lt!444495 (Intermediate!9491 false resIndex!38 resX!38))))

(declare-fun b!1006011 () Bool)

(declare-fun res!675215 () Bool)

(assert (=> b!1006011 (=> (not res!675215) (not e!566288))))

(declare-fun arrayContainsKey!0 (array!63424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006011 (= res!675215 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006012 () Bool)

(declare-fun res!675222 () Bool)

(assert (=> b!1006012 (=> (not res!675222) (not e!566286))))

(declare-datatypes ((List!21276 0))(
  ( (Nil!21273) (Cons!21272 (h!22455 (_ BitVec 64)) (t!30268 List!21276)) )
))
(declare-fun arrayNoDuplicates!0 (array!63424 (_ BitVec 32) List!21276) Bool)

(assert (=> b!1006012 (= res!675222 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21273))))

(assert (= (and start!86778 res!675220) b!1006009))

(assert (= (and b!1006009 res!675218) b!1006006))

(assert (= (and b!1006006 res!675221) b!1006008))

(assert (= (and b!1006008 res!675217) b!1006011))

(assert (= (and b!1006011 res!675215) b!1006004))

(assert (= (and b!1006004 res!675223) b!1006005))

(assert (= (and b!1006005 res!675219) b!1006012))

(assert (= (and b!1006012 res!675222) b!1006003))

(assert (= (and b!1006003 res!675214) b!1006010))

(assert (= (and b!1006010 res!675224) b!1006002))

(assert (= (and b!1006002 res!675216) b!1006007))

(declare-fun m!930595 () Bool)

(assert (=> b!1006006 m!930595))

(assert (=> b!1006006 m!930595))

(declare-fun m!930597 () Bool)

(assert (=> b!1006006 m!930597))

(declare-fun m!930599 () Bool)

(assert (=> b!1006004 m!930599))

(declare-fun m!930601 () Bool)

(assert (=> start!86778 m!930601))

(declare-fun m!930603 () Bool)

(assert (=> start!86778 m!930603))

(declare-fun m!930605 () Bool)

(assert (=> b!1006008 m!930605))

(assert (=> b!1006010 m!930595))

(assert (=> b!1006010 m!930595))

(declare-fun m!930607 () Bool)

(assert (=> b!1006010 m!930607))

(assert (=> b!1006010 m!930607))

(assert (=> b!1006010 m!930595))

(declare-fun m!930609 () Bool)

(assert (=> b!1006010 m!930609))

(declare-fun m!930611 () Bool)

(assert (=> b!1006007 m!930611))

(declare-fun m!930613 () Bool)

(assert (=> b!1006007 m!930613))

(assert (=> b!1006007 m!930613))

(declare-fun m!930615 () Bool)

(assert (=> b!1006007 m!930615))

(assert (=> b!1006007 m!930615))

(assert (=> b!1006007 m!930613))

(declare-fun m!930617 () Bool)

(assert (=> b!1006007 m!930617))

(declare-fun m!930619 () Bool)

(assert (=> b!1006011 m!930619))

(declare-fun m!930621 () Bool)

(assert (=> b!1006005 m!930621))

(assert (=> b!1006002 m!930595))

(assert (=> b!1006002 m!930595))

(declare-fun m!930623 () Bool)

(assert (=> b!1006002 m!930623))

(declare-fun m!930625 () Bool)

(assert (=> b!1006012 m!930625))

(check-sat (not start!86778) (not b!1006002) (not b!1006007) (not b!1006006) (not b!1006004) (not b!1006005) (not b!1006008) (not b!1006010) (not b!1006011) (not b!1006012))
(check-sat)
