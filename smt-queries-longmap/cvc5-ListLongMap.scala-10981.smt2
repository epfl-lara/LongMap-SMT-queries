; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128634 () Bool)

(assert start!128634)

(declare-fun b!1507750 () Bool)

(declare-fun e!842425 () Bool)

(assert (=> b!1507750 (= e!842425 false)))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100568 0))(
  ( (array!100569 (arr!48524 (Array (_ BitVec 32) (_ BitVec 64))) (size!49074 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100568)

(declare-datatypes ((SeekEntryResult!12695 0))(
  ( (MissingZero!12695 (index!53175 (_ BitVec 32))) (Found!12695 (index!53176 (_ BitVec 32))) (Intermediate!12695 (undefined!13507 Bool) (index!53177 (_ BitVec 32)) (x!134937 (_ BitVec 32))) (Undefined!12695) (MissingVacant!12695 (index!53178 (_ BitVec 32))) )
))
(declare-fun lt!654481 () SeekEntryResult!12695)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100568 (_ BitVec 32)) SeekEntryResult!12695)

(assert (=> b!1507750 (= lt!654481 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48524 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1507751 () Bool)

(declare-fun res!1027867 () Bool)

(assert (=> b!1507751 (=> (not res!1027867) (not e!842425))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1507751 (= res!1027867 (and (= (size!49074 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49074 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49074 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507752 () Bool)

(declare-fun res!1027865 () Bool)

(assert (=> b!1507752 (=> (not res!1027865) (not e!842425))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1507752 (= res!1027865 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49074 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49074 a!2804))))))

(declare-fun b!1507753 () Bool)

(declare-fun res!1027870 () Bool)

(assert (=> b!1507753 (=> (not res!1027870) (not e!842425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100568 (_ BitVec 32)) Bool)

(assert (=> b!1507753 (= res!1027870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507754 () Bool)

(declare-fun res!1027866 () Bool)

(assert (=> b!1507754 (=> (not res!1027866) (not e!842425))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507754 (= res!1027866 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48524 a!2804) j!70) mask!2512) (select (arr!48524 a!2804) j!70) a!2804 mask!2512) (Intermediate!12695 false resIndex!21 resX!21)))))

(declare-fun b!1507755 () Bool)

(declare-fun res!1027863 () Bool)

(assert (=> b!1507755 (=> (not res!1027863) (not e!842425))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507755 (= res!1027863 (validKeyInArray!0 (select (arr!48524 a!2804) j!70)))))

(declare-fun res!1027864 () Bool)

(assert (=> start!128634 (=> (not res!1027864) (not e!842425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128634 (= res!1027864 (validMask!0 mask!2512))))

(assert (=> start!128634 e!842425))

(assert (=> start!128634 true))

(declare-fun array_inv!37552 (array!100568) Bool)

(assert (=> start!128634 (array_inv!37552 a!2804)))

(declare-fun b!1507756 () Bool)

(declare-fun res!1027869 () Bool)

(assert (=> b!1507756 (=> (not res!1027869) (not e!842425))))

(declare-datatypes ((List!35007 0))(
  ( (Nil!35004) (Cons!35003 (h!36409 (_ BitVec 64)) (t!49701 List!35007)) )
))
(declare-fun arrayNoDuplicates!0 (array!100568 (_ BitVec 32) List!35007) Bool)

(assert (=> b!1507756 (= res!1027869 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35004))))

(declare-fun b!1507757 () Bool)

(declare-fun res!1027868 () Bool)

(assert (=> b!1507757 (=> (not res!1027868) (not e!842425))))

(assert (=> b!1507757 (= res!1027868 (validKeyInArray!0 (select (arr!48524 a!2804) i!961)))))

(assert (= (and start!128634 res!1027864) b!1507751))

(assert (= (and b!1507751 res!1027867) b!1507757))

(assert (= (and b!1507757 res!1027868) b!1507755))

(assert (= (and b!1507755 res!1027863) b!1507753))

(assert (= (and b!1507753 res!1027870) b!1507756))

(assert (= (and b!1507756 res!1027869) b!1507752))

(assert (= (and b!1507752 res!1027865) b!1507754))

(assert (= (and b!1507754 res!1027866) b!1507750))

(declare-fun m!1390387 () Bool)

(assert (=> start!128634 m!1390387))

(declare-fun m!1390389 () Bool)

(assert (=> start!128634 m!1390389))

(declare-fun m!1390391 () Bool)

(assert (=> b!1507750 m!1390391))

(assert (=> b!1507750 m!1390391))

(declare-fun m!1390393 () Bool)

(assert (=> b!1507750 m!1390393))

(assert (=> b!1507755 m!1390391))

(assert (=> b!1507755 m!1390391))

(declare-fun m!1390395 () Bool)

(assert (=> b!1507755 m!1390395))

(assert (=> b!1507754 m!1390391))

(assert (=> b!1507754 m!1390391))

(declare-fun m!1390397 () Bool)

(assert (=> b!1507754 m!1390397))

(assert (=> b!1507754 m!1390397))

(assert (=> b!1507754 m!1390391))

(declare-fun m!1390399 () Bool)

(assert (=> b!1507754 m!1390399))

(declare-fun m!1390401 () Bool)

(assert (=> b!1507753 m!1390401))

(declare-fun m!1390403 () Bool)

(assert (=> b!1507756 m!1390403))

(declare-fun m!1390405 () Bool)

(assert (=> b!1507757 m!1390405))

(assert (=> b!1507757 m!1390405))

(declare-fun m!1390407 () Bool)

(assert (=> b!1507757 m!1390407))

(push 1)

(assert (not b!1507756))

(assert (not b!1507755))

(assert (not b!1507753))

(assert (not b!1507750))

(assert (not start!128634))

(assert (not b!1507754))

(assert (not b!1507757))

(check-sat)

