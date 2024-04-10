; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129236 () Bool)

(assert start!129236)

(declare-fun b!1517357 () Bool)

(declare-fun e!846577 () Bool)

(declare-fun e!846580 () Bool)

(assert (=> b!1517357 (= e!846577 (not e!846580))))

(declare-fun res!1037270 () Bool)

(assert (=> b!1517357 (=> res!1037270 e!846580)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!101092 0))(
  ( (array!101093 (arr!48783 (Array (_ BitVec 32) (_ BitVec 64))) (size!49333 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101092)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1517357 (= res!1037270 (or (not (= (select (arr!48783 a!2804) j!70) (select (store (arr!48783 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846575 () Bool)

(assert (=> b!1517357 e!846575))

(declare-fun res!1037272 () Bool)

(assert (=> b!1517357 (=> (not res!1037272) (not e!846575))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101092 (_ BitVec 32)) Bool)

(assert (=> b!1517357 (= res!1037272 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50776 0))(
  ( (Unit!50777) )
))
(declare-fun lt!657753 () Unit!50776)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101092 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50776)

(assert (=> b!1517357 (= lt!657753 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517358 () Bool)

(declare-fun res!1037261 () Bool)

(declare-fun e!846579 () Bool)

(assert (=> b!1517358 (=> (not res!1037261) (not e!846579))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517358 (= res!1037261 (validKeyInArray!0 (select (arr!48783 a!2804) i!961)))))

(declare-fun res!1037265 () Bool)

(assert (=> start!129236 (=> (not res!1037265) (not e!846579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129236 (= res!1037265 (validMask!0 mask!2512))))

(assert (=> start!129236 e!846579))

(assert (=> start!129236 true))

(declare-fun array_inv!37811 (array!101092) Bool)

(assert (=> start!129236 (array_inv!37811 a!2804)))

(declare-fun b!1517359 () Bool)

(declare-fun res!1037267 () Bool)

(assert (=> b!1517359 (=> (not res!1037267) (not e!846577))))

(declare-datatypes ((SeekEntryResult!12954 0))(
  ( (MissingZero!12954 (index!54211 (_ BitVec 32))) (Found!12954 (index!54212 (_ BitVec 32))) (Intermediate!12954 (undefined!13766 Bool) (index!54213 (_ BitVec 32)) (x!135896 (_ BitVec 32))) (Undefined!12954) (MissingVacant!12954 (index!54214 (_ BitVec 32))) )
))
(declare-fun lt!657755 () SeekEntryResult!12954)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101092 (_ BitVec 32)) SeekEntryResult!12954)

(assert (=> b!1517359 (= res!1037267 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48783 a!2804) j!70) a!2804 mask!2512) lt!657755))))

(declare-fun b!1517360 () Bool)

(assert (=> b!1517360 (= e!846579 e!846577)))

(declare-fun res!1037264 () Bool)

(assert (=> b!1517360 (=> (not res!1037264) (not e!846577))))

(declare-fun lt!657754 () SeekEntryResult!12954)

(assert (=> b!1517360 (= res!1037264 (= lt!657754 lt!657755))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1517360 (= lt!657755 (Intermediate!12954 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517360 (= lt!657754 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48783 a!2804) j!70) mask!2512) (select (arr!48783 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517361 () Bool)

(declare-fun e!846576 () Bool)

(assert (=> b!1517361 (= e!846576 true)))

(declare-fun lt!657756 () (_ BitVec 32))

(declare-fun lt!657757 () SeekEntryResult!12954)

(assert (=> b!1517361 (= lt!657757 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657756 (select (arr!48783 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517362 () Bool)

(declare-fun res!1037269 () Bool)

(assert (=> b!1517362 (=> (not res!1037269) (not e!846579))))

(assert (=> b!1517362 (= res!1037269 (and (= (size!49333 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49333 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49333 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517363 () Bool)

(declare-fun res!1037271 () Bool)

(assert (=> b!1517363 (=> (not res!1037271) (not e!846579))))

(assert (=> b!1517363 (= res!1037271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517364 () Bool)

(assert (=> b!1517364 (= e!846580 e!846576)))

(declare-fun res!1037268 () Bool)

(assert (=> b!1517364 (=> res!1037268 e!846576)))

(assert (=> b!1517364 (= res!1037268 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657756 #b00000000000000000000000000000000) (bvsge lt!657756 (size!49333 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517364 (= lt!657756 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517365 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101092 (_ BitVec 32)) SeekEntryResult!12954)

(assert (=> b!1517365 (= e!846575 (= (seekEntry!0 (select (arr!48783 a!2804) j!70) a!2804 mask!2512) (Found!12954 j!70)))))

(declare-fun b!1517366 () Bool)

(declare-fun res!1037260 () Bool)

(assert (=> b!1517366 (=> (not res!1037260) (not e!846579))))

(declare-datatypes ((List!35266 0))(
  ( (Nil!35263) (Cons!35262 (h!36674 (_ BitVec 64)) (t!49960 List!35266)) )
))
(declare-fun arrayNoDuplicates!0 (array!101092 (_ BitVec 32) List!35266) Bool)

(assert (=> b!1517366 (= res!1037260 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35263))))

(declare-fun b!1517367 () Bool)

(declare-fun res!1037262 () Bool)

(assert (=> b!1517367 (=> (not res!1037262) (not e!846579))))

(assert (=> b!1517367 (= res!1037262 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49333 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49333 a!2804))))))

(declare-fun b!1517368 () Bool)

(declare-fun res!1037266 () Bool)

(assert (=> b!1517368 (=> (not res!1037266) (not e!846579))))

(assert (=> b!1517368 (= res!1037266 (validKeyInArray!0 (select (arr!48783 a!2804) j!70)))))

(declare-fun b!1517369 () Bool)

(declare-fun res!1037263 () Bool)

(assert (=> b!1517369 (=> (not res!1037263) (not e!846577))))

(assert (=> b!1517369 (= res!1037263 (= lt!657754 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48783 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48783 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101093 (store (arr!48783 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49333 a!2804)) mask!2512)))))

(assert (= (and start!129236 res!1037265) b!1517362))

(assert (= (and b!1517362 res!1037269) b!1517358))

(assert (= (and b!1517358 res!1037261) b!1517368))

(assert (= (and b!1517368 res!1037266) b!1517363))

(assert (= (and b!1517363 res!1037271) b!1517366))

(assert (= (and b!1517366 res!1037260) b!1517367))

(assert (= (and b!1517367 res!1037262) b!1517360))

(assert (= (and b!1517360 res!1037264) b!1517359))

(assert (= (and b!1517359 res!1037267) b!1517369))

(assert (= (and b!1517369 res!1037263) b!1517357))

(assert (= (and b!1517357 res!1037272) b!1517365))

(assert (= (and b!1517357 (not res!1037270)) b!1517364))

(assert (= (and b!1517364 (not res!1037268)) b!1517361))

(declare-fun m!1400645 () Bool)

(assert (=> b!1517361 m!1400645))

(assert (=> b!1517361 m!1400645))

(declare-fun m!1400647 () Bool)

(assert (=> b!1517361 m!1400647))

(declare-fun m!1400649 () Bool)

(assert (=> b!1517364 m!1400649))

(declare-fun m!1400651 () Bool)

(assert (=> b!1517369 m!1400651))

(declare-fun m!1400653 () Bool)

(assert (=> b!1517369 m!1400653))

(assert (=> b!1517369 m!1400653))

(declare-fun m!1400655 () Bool)

(assert (=> b!1517369 m!1400655))

(assert (=> b!1517369 m!1400655))

(assert (=> b!1517369 m!1400653))

(declare-fun m!1400657 () Bool)

(assert (=> b!1517369 m!1400657))

(declare-fun m!1400659 () Bool)

(assert (=> b!1517363 m!1400659))

(assert (=> b!1517357 m!1400645))

(declare-fun m!1400661 () Bool)

(assert (=> b!1517357 m!1400661))

(assert (=> b!1517357 m!1400651))

(assert (=> b!1517357 m!1400653))

(declare-fun m!1400663 () Bool)

(assert (=> b!1517357 m!1400663))

(declare-fun m!1400665 () Bool)

(assert (=> b!1517366 m!1400665))

(declare-fun m!1400667 () Bool)

(assert (=> b!1517358 m!1400667))

(assert (=> b!1517358 m!1400667))

(declare-fun m!1400669 () Bool)

(assert (=> b!1517358 m!1400669))

(assert (=> b!1517368 m!1400645))

(assert (=> b!1517368 m!1400645))

(declare-fun m!1400671 () Bool)

(assert (=> b!1517368 m!1400671))

(assert (=> b!1517365 m!1400645))

(assert (=> b!1517365 m!1400645))

(declare-fun m!1400673 () Bool)

(assert (=> b!1517365 m!1400673))

(declare-fun m!1400675 () Bool)

(assert (=> start!129236 m!1400675))

(declare-fun m!1400677 () Bool)

(assert (=> start!129236 m!1400677))

(assert (=> b!1517360 m!1400645))

(assert (=> b!1517360 m!1400645))

(declare-fun m!1400679 () Bool)

(assert (=> b!1517360 m!1400679))

(assert (=> b!1517360 m!1400679))

(assert (=> b!1517360 m!1400645))

(declare-fun m!1400681 () Bool)

(assert (=> b!1517360 m!1400681))

(assert (=> b!1517359 m!1400645))

(assert (=> b!1517359 m!1400645))

(declare-fun m!1400683 () Bool)

(assert (=> b!1517359 m!1400683))

(check-sat (not start!129236) (not b!1517364) (not b!1517357) (not b!1517358) (not b!1517365) (not b!1517361) (not b!1517369) (not b!1517363) (not b!1517366) (not b!1517360) (not b!1517368) (not b!1517359))
(check-sat)
