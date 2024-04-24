; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128786 () Bool)

(assert start!128786)

(declare-fun b!1508403 () Bool)

(declare-fun res!1027549 () Bool)

(declare-fun e!843080 () Bool)

(assert (=> b!1508403 (=> (not res!1027549) (not e!843080))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100612 0))(
  ( (array!100613 (arr!48544 (Array (_ BitVec 32) (_ BitVec 64))) (size!49095 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100612)

(assert (=> b!1508403 (= res!1027549 (and (= (size!49095 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49095 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49095 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508404 () Bool)

(declare-fun res!1027552 () Bool)

(assert (=> b!1508404 (=> (not res!1027552) (not e!843080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508404 (= res!1027552 (validKeyInArray!0 (select (arr!48544 a!2804) j!70)))))

(declare-fun b!1508405 () Bool)

(declare-fun res!1027553 () Bool)

(assert (=> b!1508405 (=> (not res!1027553) (not e!843080))))

(assert (=> b!1508405 (= res!1027553 (validKeyInArray!0 (select (arr!48544 a!2804) i!961)))))

(declare-fun b!1508406 () Bool)

(declare-fun res!1027556 () Bool)

(assert (=> b!1508406 (=> (not res!1027556) (not e!843080))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1508406 (= res!1027556 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49095 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49095 a!2804))))))

(declare-fun b!1508407 () Bool)

(declare-fun res!1027550 () Bool)

(assert (=> b!1508407 (=> (not res!1027550) (not e!843080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100612 (_ BitVec 32)) Bool)

(assert (=> b!1508407 (= res!1027550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508408 () Bool)

(assert (=> b!1508408 (= e!843080 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun b!1508409 () Bool)

(declare-fun res!1027554 () Bool)

(assert (=> b!1508409 (=> (not res!1027554) (not e!843080))))

(declare-datatypes ((SeekEntryResult!12608 0))(
  ( (MissingZero!12608 (index!52827 (_ BitVec 32))) (Found!12608 (index!52828 (_ BitVec 32))) (Intermediate!12608 (undefined!13420 Bool) (index!52829 (_ BitVec 32)) (x!134787 (_ BitVec 32))) (Undefined!12608) (MissingVacant!12608 (index!52830 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100612 (_ BitVec 32)) SeekEntryResult!12608)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508409 (= res!1027554 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48544 a!2804) j!70) mask!2512) (select (arr!48544 a!2804) j!70) a!2804 mask!2512) (Intermediate!12608 false resIndex!21 resX!21)))))

(declare-fun res!1027555 () Bool)

(assert (=> start!128786 (=> (not res!1027555) (not e!843080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128786 (= res!1027555 (validMask!0 mask!2512))))

(assert (=> start!128786 e!843080))

(assert (=> start!128786 true))

(declare-fun array_inv!37825 (array!100612) Bool)

(assert (=> start!128786 (array_inv!37825 a!2804)))

(declare-fun b!1508410 () Bool)

(declare-fun res!1027551 () Bool)

(assert (=> b!1508410 (=> (not res!1027551) (not e!843080))))

(declare-datatypes ((List!35014 0))(
  ( (Nil!35011) (Cons!35010 (h!36425 (_ BitVec 64)) (t!49700 List!35014)) )
))
(declare-fun arrayNoDuplicates!0 (array!100612 (_ BitVec 32) List!35014) Bool)

(assert (=> b!1508410 (= res!1027551 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35011))))

(assert (= (and start!128786 res!1027555) b!1508403))

(assert (= (and b!1508403 res!1027549) b!1508405))

(assert (= (and b!1508405 res!1027553) b!1508404))

(assert (= (and b!1508404 res!1027552) b!1508407))

(assert (= (and b!1508407 res!1027550) b!1508410))

(assert (= (and b!1508410 res!1027551) b!1508406))

(assert (= (and b!1508406 res!1027556) b!1508409))

(assert (= (and b!1508409 res!1027554) b!1508408))

(declare-fun m!1391295 () Bool)

(assert (=> b!1508409 m!1391295))

(assert (=> b!1508409 m!1391295))

(declare-fun m!1391297 () Bool)

(assert (=> b!1508409 m!1391297))

(assert (=> b!1508409 m!1391297))

(assert (=> b!1508409 m!1391295))

(declare-fun m!1391299 () Bool)

(assert (=> b!1508409 m!1391299))

(declare-fun m!1391301 () Bool)

(assert (=> b!1508410 m!1391301))

(declare-fun m!1391303 () Bool)

(assert (=> b!1508405 m!1391303))

(assert (=> b!1508405 m!1391303))

(declare-fun m!1391305 () Bool)

(assert (=> b!1508405 m!1391305))

(declare-fun m!1391307 () Bool)

(assert (=> b!1508407 m!1391307))

(assert (=> b!1508404 m!1391295))

(assert (=> b!1508404 m!1391295))

(declare-fun m!1391309 () Bool)

(assert (=> b!1508404 m!1391309))

(declare-fun m!1391311 () Bool)

(assert (=> start!128786 m!1391311))

(declare-fun m!1391313 () Bool)

(assert (=> start!128786 m!1391313))

(check-sat (not b!1508405) (not b!1508404) (not b!1508410) (not b!1508407) (not b!1508409) (not start!128786))
(check-sat)
