; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129974 () Bool)

(assert start!129974)

(declare-fun b!1523672 () Bool)

(declare-fun res!1041476 () Bool)

(declare-fun e!849904 () Bool)

(assert (=> b!1523672 (=> (not res!1041476) (not e!849904))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101398 0))(
  ( (array!101399 (arr!48925 (Array (_ BitVec 32) (_ BitVec 64))) (size!49476 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101398)

(declare-datatypes ((SeekEntryResult!12983 0))(
  ( (MissingZero!12983 (index!54327 (_ BitVec 32))) (Found!12983 (index!54328 (_ BitVec 32))) (Intermediate!12983 (undefined!13795 Bool) (index!54329 (_ BitVec 32)) (x!136232 (_ BitVec 32))) (Undefined!12983) (MissingVacant!12983 (index!54330 (_ BitVec 32))) )
))
(declare-fun lt!660195 () SeekEntryResult!12983)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101398 (_ BitVec 32)) SeekEntryResult!12983)

(assert (=> b!1523672 (= res!1041476 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48925 a!2804) j!70) a!2804 mask!2512) lt!660195))))

(declare-fun b!1523673 () Bool)

(declare-fun res!1041468 () Bool)

(declare-fun e!849905 () Bool)

(assert (=> b!1523673 (=> (not res!1041468) (not e!849905))))

(declare-datatypes ((List!35395 0))(
  ( (Nil!35392) (Cons!35391 (h!36830 (_ BitVec 64)) (t!50081 List!35395)) )
))
(declare-fun arrayNoDuplicates!0 (array!101398 (_ BitVec 32) List!35395) Bool)

(assert (=> b!1523673 (= res!1041468 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35392))))

(declare-fun b!1523674 () Bool)

(declare-fun res!1041472 () Bool)

(assert (=> b!1523674 (=> (not res!1041472) (not e!849905))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523674 (= res!1041472 (validKeyInArray!0 (select (arr!48925 a!2804) i!961)))))

(declare-fun b!1523675 () Bool)

(declare-fun res!1041470 () Bool)

(assert (=> b!1523675 (=> (not res!1041470) (not e!849905))))

(assert (=> b!1523675 (= res!1041470 (validKeyInArray!0 (select (arr!48925 a!2804) j!70)))))

(declare-fun b!1523676 () Bool)

(declare-fun res!1041469 () Bool)

(assert (=> b!1523676 (=> (not res!1041469) (not e!849905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101398 (_ BitVec 32)) Bool)

(assert (=> b!1523676 (= res!1041469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1041473 () Bool)

(assert (=> start!129974 (=> (not res!1041473) (not e!849905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129974 (= res!1041473 (validMask!0 mask!2512))))

(assert (=> start!129974 e!849905))

(assert (=> start!129974 true))

(declare-fun array_inv!38206 (array!101398) Bool)

(assert (=> start!129974 (array_inv!38206 a!2804)))

(declare-fun b!1523677 () Bool)

(assert (=> b!1523677 (= e!849905 e!849904)))

(declare-fun res!1041475 () Bool)

(assert (=> b!1523677 (=> (not res!1041475) (not e!849904))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523677 (= res!1041475 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48925 a!2804) j!70) mask!2512) (select (arr!48925 a!2804) j!70) a!2804 mask!2512) lt!660195))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1523677 (= lt!660195 (Intermediate!12983 false resIndex!21 resX!21))))

(declare-fun b!1523678 () Bool)

(assert (=> b!1523678 (= e!849904 false)))

(declare-fun lt!660196 () (_ BitVec 32))

(assert (=> b!1523678 (= lt!660196 (toIndex!0 (select (store (arr!48925 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1523679 () Bool)

(declare-fun res!1041471 () Bool)

(assert (=> b!1523679 (=> (not res!1041471) (not e!849905))))

(assert (=> b!1523679 (= res!1041471 (and (= (size!49476 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49476 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49476 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1523680 () Bool)

(declare-fun res!1041474 () Bool)

(assert (=> b!1523680 (=> (not res!1041474) (not e!849905))))

(assert (=> b!1523680 (= res!1041474 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49476 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49476 a!2804))))))

(assert (= (and start!129974 res!1041473) b!1523679))

(assert (= (and b!1523679 res!1041471) b!1523674))

(assert (= (and b!1523674 res!1041472) b!1523675))

(assert (= (and b!1523675 res!1041470) b!1523676))

(assert (= (and b!1523676 res!1041469) b!1523673))

(assert (= (and b!1523673 res!1041468) b!1523680))

(assert (= (and b!1523680 res!1041474) b!1523677))

(assert (= (and b!1523677 res!1041475) b!1523672))

(assert (= (and b!1523672 res!1041476) b!1523678))

(declare-fun m!1406619 () Bool)

(assert (=> b!1523675 m!1406619))

(assert (=> b!1523675 m!1406619))

(declare-fun m!1406621 () Bool)

(assert (=> b!1523675 m!1406621))

(declare-fun m!1406623 () Bool)

(assert (=> b!1523678 m!1406623))

(declare-fun m!1406625 () Bool)

(assert (=> b!1523678 m!1406625))

(assert (=> b!1523678 m!1406625))

(declare-fun m!1406627 () Bool)

(assert (=> b!1523678 m!1406627))

(declare-fun m!1406629 () Bool)

(assert (=> start!129974 m!1406629))

(declare-fun m!1406631 () Bool)

(assert (=> start!129974 m!1406631))

(declare-fun m!1406633 () Bool)

(assert (=> b!1523676 m!1406633))

(assert (=> b!1523677 m!1406619))

(assert (=> b!1523677 m!1406619))

(declare-fun m!1406635 () Bool)

(assert (=> b!1523677 m!1406635))

(assert (=> b!1523677 m!1406635))

(assert (=> b!1523677 m!1406619))

(declare-fun m!1406637 () Bool)

(assert (=> b!1523677 m!1406637))

(declare-fun m!1406639 () Bool)

(assert (=> b!1523674 m!1406639))

(assert (=> b!1523674 m!1406639))

(declare-fun m!1406641 () Bool)

(assert (=> b!1523674 m!1406641))

(declare-fun m!1406643 () Bool)

(assert (=> b!1523673 m!1406643))

(assert (=> b!1523672 m!1406619))

(assert (=> b!1523672 m!1406619))

(declare-fun m!1406645 () Bool)

(assert (=> b!1523672 m!1406645))

(check-sat (not b!1523678) (not b!1523674) (not b!1523672) (not start!129974) (not b!1523677) (not b!1523676) (not b!1523675) (not b!1523673))
(check-sat)
