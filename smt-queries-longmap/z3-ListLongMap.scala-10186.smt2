; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120044 () Bool)

(assert start!120044)

(declare-fun res!936475 () Bool)

(declare-fun e!791194 () Bool)

(assert (=> start!120044 (=> (not res!936475) (not e!791194))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120044 (= res!936475 (validMask!0 mask!2840))))

(assert (=> start!120044 e!791194))

(assert (=> start!120044 true))

(declare-datatypes ((array!95573 0))(
  ( (array!95574 (arr!46140 (Array (_ BitVec 32) (_ BitVec 64))) (size!46690 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95573)

(declare-fun array_inv!35168 (array!95573) Bool)

(assert (=> start!120044 (array_inv!35168 a!2901)))

(declare-fun b!1397554 () Bool)

(declare-fun e!791195 () Bool)

(assert (=> b!1397554 (= e!791195 true)))

(declare-fun lt!614295 () array!95573)

(declare-fun lt!614297 () (_ BitVec 64))

(declare-fun lt!614293 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10457 0))(
  ( (MissingZero!10457 (index!44199 (_ BitVec 32))) (Found!10457 (index!44200 (_ BitVec 32))) (Intermediate!10457 (undefined!11269 Bool) (index!44201 (_ BitVec 32)) (x!125855 (_ BitVec 32))) (Undefined!10457) (MissingVacant!10457 (index!44202 (_ BitVec 32))) )
))
(declare-fun lt!614294 () SeekEntryResult!10457)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95573 (_ BitVec 32)) SeekEntryResult!10457)

(assert (=> b!1397554 (= lt!614294 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614293 lt!614297 lt!614295 mask!2840))))

(declare-fun b!1397555 () Bool)

(declare-fun res!936469 () Bool)

(assert (=> b!1397555 (=> (not res!936469) (not e!791194))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397555 (= res!936469 (validKeyInArray!0 (select (arr!46140 a!2901) j!112)))))

(declare-fun b!1397556 () Bool)

(declare-fun res!936468 () Bool)

(assert (=> b!1397556 (=> (not res!936468) (not e!791194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95573 (_ BitVec 32)) Bool)

(assert (=> b!1397556 (= res!936468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397557 () Bool)

(declare-fun e!791197 () Bool)

(assert (=> b!1397557 (= e!791197 e!791195)))

(declare-fun res!936471 () Bool)

(assert (=> b!1397557 (=> res!936471 e!791195)))

(declare-fun lt!614296 () SeekEntryResult!10457)

(declare-fun lt!614292 () SeekEntryResult!10457)

(get-info :version)

(assert (=> b!1397557 (= res!936471 (or (= lt!614296 lt!614292) (not ((_ is Intermediate!10457) lt!614292)) (bvslt (x!125855 lt!614296) #b00000000000000000000000000000000) (bvsgt (x!125855 lt!614296) #b01111111111111111111111111111110) (bvslt lt!614293 #b00000000000000000000000000000000) (bvsge lt!614293 (size!46690 a!2901)) (bvslt (index!44201 lt!614296) #b00000000000000000000000000000000) (bvsge (index!44201 lt!614296) (size!46690 a!2901)) (not (= lt!614296 (Intermediate!10457 false (index!44201 lt!614296) (x!125855 lt!614296)))) (not (= lt!614292 (Intermediate!10457 (undefined!11269 lt!614292) (index!44201 lt!614292) (x!125855 lt!614292))))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397557 (= lt!614292 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614297 mask!2840) lt!614297 lt!614295 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1397557 (= lt!614297 (select (store (arr!46140 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397557 (= lt!614295 (array!95574 (store (arr!46140 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46690 a!2901)))))

(declare-fun b!1397558 () Bool)

(declare-fun e!791198 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95573 (_ BitVec 32)) SeekEntryResult!10457)

(assert (=> b!1397558 (= e!791198 (= (seekEntryOrOpen!0 (select (arr!46140 a!2901) j!112) a!2901 mask!2840) (Found!10457 j!112)))))

(declare-fun b!1397559 () Bool)

(declare-fun res!936467 () Bool)

(assert (=> b!1397559 (=> (not res!936467) (not e!791194))))

(assert (=> b!1397559 (= res!936467 (and (= (size!46690 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46690 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46690 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397560 () Bool)

(declare-fun res!936474 () Bool)

(assert (=> b!1397560 (=> (not res!936474) (not e!791194))))

(assert (=> b!1397560 (= res!936474 (validKeyInArray!0 (select (arr!46140 a!2901) i!1037)))))

(declare-fun b!1397561 () Bool)

(declare-fun res!936472 () Bool)

(assert (=> b!1397561 (=> (not res!936472) (not e!791194))))

(declare-datatypes ((List!32659 0))(
  ( (Nil!32656) (Cons!32655 (h!33897 (_ BitVec 64)) (t!47353 List!32659)) )
))
(declare-fun arrayNoDuplicates!0 (array!95573 (_ BitVec 32) List!32659) Bool)

(assert (=> b!1397561 (= res!936472 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32656))))

(declare-fun b!1397562 () Bool)

(assert (=> b!1397562 (= e!791194 (not e!791197))))

(declare-fun res!936473 () Bool)

(assert (=> b!1397562 (=> res!936473 e!791197)))

(assert (=> b!1397562 (= res!936473 (or (not ((_ is Intermediate!10457) lt!614296)) (undefined!11269 lt!614296)))))

(assert (=> b!1397562 e!791198))

(declare-fun res!936470 () Bool)

(assert (=> b!1397562 (=> (not res!936470) (not e!791198))))

(assert (=> b!1397562 (= res!936470 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46918 0))(
  ( (Unit!46919) )
))
(declare-fun lt!614298 () Unit!46918)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95573 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46918)

(assert (=> b!1397562 (= lt!614298 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397562 (= lt!614296 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614293 (select (arr!46140 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1397562 (= lt!614293 (toIndex!0 (select (arr!46140 a!2901) j!112) mask!2840))))

(assert (= (and start!120044 res!936475) b!1397559))

(assert (= (and b!1397559 res!936467) b!1397560))

(assert (= (and b!1397560 res!936474) b!1397555))

(assert (= (and b!1397555 res!936469) b!1397556))

(assert (= (and b!1397556 res!936468) b!1397561))

(assert (= (and b!1397561 res!936472) b!1397562))

(assert (= (and b!1397562 res!936470) b!1397558))

(assert (= (and b!1397562 (not res!936473)) b!1397557))

(assert (= (and b!1397557 (not res!936471)) b!1397554))

(declare-fun m!1284363 () Bool)

(assert (=> b!1397558 m!1284363))

(assert (=> b!1397558 m!1284363))

(declare-fun m!1284365 () Bool)

(assert (=> b!1397558 m!1284365))

(declare-fun m!1284367 () Bool)

(assert (=> start!120044 m!1284367))

(declare-fun m!1284369 () Bool)

(assert (=> start!120044 m!1284369))

(declare-fun m!1284371 () Bool)

(assert (=> b!1397554 m!1284371))

(declare-fun m!1284373 () Bool)

(assert (=> b!1397557 m!1284373))

(assert (=> b!1397557 m!1284373))

(declare-fun m!1284375 () Bool)

(assert (=> b!1397557 m!1284375))

(declare-fun m!1284377 () Bool)

(assert (=> b!1397557 m!1284377))

(declare-fun m!1284379 () Bool)

(assert (=> b!1397557 m!1284379))

(assert (=> b!1397555 m!1284363))

(assert (=> b!1397555 m!1284363))

(declare-fun m!1284381 () Bool)

(assert (=> b!1397555 m!1284381))

(declare-fun m!1284383 () Bool)

(assert (=> b!1397560 m!1284383))

(assert (=> b!1397560 m!1284383))

(declare-fun m!1284385 () Bool)

(assert (=> b!1397560 m!1284385))

(assert (=> b!1397562 m!1284363))

(declare-fun m!1284387 () Bool)

(assert (=> b!1397562 m!1284387))

(declare-fun m!1284389 () Bool)

(assert (=> b!1397562 m!1284389))

(assert (=> b!1397562 m!1284363))

(declare-fun m!1284391 () Bool)

(assert (=> b!1397562 m!1284391))

(assert (=> b!1397562 m!1284363))

(declare-fun m!1284393 () Bool)

(assert (=> b!1397562 m!1284393))

(declare-fun m!1284395 () Bool)

(assert (=> b!1397561 m!1284395))

(declare-fun m!1284397 () Bool)

(assert (=> b!1397556 m!1284397))

(check-sat (not b!1397555) (not b!1397560) (not start!120044) (not b!1397556) (not b!1397562) (not b!1397557) (not b!1397558) (not b!1397554) (not b!1397561))
(check-sat)
