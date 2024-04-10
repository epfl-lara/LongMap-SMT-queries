; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128500 () Bool)

(assert start!128500)

(declare-fun b!1506754 () Bool)

(declare-fun res!1027083 () Bool)

(declare-fun e!841992 () Bool)

(assert (=> b!1506754 (=> (not res!1027083) (not e!841992))))

(declare-datatypes ((array!100512 0))(
  ( (array!100513 (arr!48499 (Array (_ BitVec 32) (_ BitVec 64))) (size!49049 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100512)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100512 (_ BitVec 32)) Bool)

(assert (=> b!1506754 (= res!1027083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506755 () Bool)

(declare-fun res!1027078 () Bool)

(assert (=> b!1506755 (=> (not res!1027078) (not e!841992))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1506755 (= res!1027078 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49049 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49049 a!2804))))))

(declare-fun b!1506756 () Bool)

(declare-fun res!1027080 () Bool)

(assert (=> b!1506756 (=> (not res!1027080) (not e!841992))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1506756 (= res!1027080 (and (= (size!49049 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49049 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49049 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506757 () Bool)

(declare-fun res!1027084 () Bool)

(assert (=> b!1506757 (=> (not res!1027084) (not e!841992))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506757 (= res!1027084 (validKeyInArray!0 (select (arr!48499 a!2804) i!961)))))

(declare-fun res!1027081 () Bool)

(assert (=> start!128500 (=> (not res!1027081) (not e!841992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128500 (= res!1027081 (validMask!0 mask!2512))))

(assert (=> start!128500 e!841992))

(assert (=> start!128500 true))

(declare-fun array_inv!37527 (array!100512) Bool)

(assert (=> start!128500 (array_inv!37527 a!2804)))

(declare-fun b!1506758 () Bool)

(assert (=> b!1506758 (= e!841992 (and (bvsge mask!2512 #b00000000000000000000000000000000) (bvsge index!487 (bvadd #b00000000000000000000000000000001 mask!2512))))))

(declare-fun b!1506759 () Bool)

(declare-fun res!1027082 () Bool)

(assert (=> b!1506759 (=> (not res!1027082) (not e!841992))))

(declare-datatypes ((SeekEntryResult!12670 0))(
  ( (MissingZero!12670 (index!53075 (_ BitVec 32))) (Found!12670 (index!53076 (_ BitVec 32))) (Intermediate!12670 (undefined!13482 Bool) (index!53077 (_ BitVec 32)) (x!134828 (_ BitVec 32))) (Undefined!12670) (MissingVacant!12670 (index!53078 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100512 (_ BitVec 32)) SeekEntryResult!12670)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506759 (= res!1027082 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48499 a!2804) j!70) mask!2512) (select (arr!48499 a!2804) j!70) a!2804 mask!2512) (Intermediate!12670 false resIndex!21 resX!21)))))

(declare-fun b!1506760 () Bool)

(declare-fun res!1027079 () Bool)

(assert (=> b!1506760 (=> (not res!1027079) (not e!841992))))

(declare-datatypes ((List!34982 0))(
  ( (Nil!34979) (Cons!34978 (h!36378 (_ BitVec 64)) (t!49676 List!34982)) )
))
(declare-fun arrayNoDuplicates!0 (array!100512 (_ BitVec 32) List!34982) Bool)

(assert (=> b!1506760 (= res!1027079 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34979))))

(declare-fun b!1506761 () Bool)

(declare-fun res!1027077 () Bool)

(assert (=> b!1506761 (=> (not res!1027077) (not e!841992))))

(assert (=> b!1506761 (= res!1027077 (validKeyInArray!0 (select (arr!48499 a!2804) j!70)))))

(assert (= (and start!128500 res!1027081) b!1506756))

(assert (= (and b!1506756 res!1027080) b!1506757))

(assert (= (and b!1506757 res!1027084) b!1506761))

(assert (= (and b!1506761 res!1027077) b!1506754))

(assert (= (and b!1506754 res!1027083) b!1506760))

(assert (= (and b!1506760 res!1027079) b!1506755))

(assert (= (and b!1506755 res!1027078) b!1506759))

(assert (= (and b!1506759 res!1027082) b!1506758))

(declare-fun m!1389659 () Bool)

(assert (=> b!1506757 m!1389659))

(assert (=> b!1506757 m!1389659))

(declare-fun m!1389661 () Bool)

(assert (=> b!1506757 m!1389661))

(declare-fun m!1389663 () Bool)

(assert (=> b!1506760 m!1389663))

(declare-fun m!1389665 () Bool)

(assert (=> b!1506761 m!1389665))

(assert (=> b!1506761 m!1389665))

(declare-fun m!1389667 () Bool)

(assert (=> b!1506761 m!1389667))

(declare-fun m!1389669 () Bool)

(assert (=> b!1506754 m!1389669))

(assert (=> b!1506759 m!1389665))

(assert (=> b!1506759 m!1389665))

(declare-fun m!1389671 () Bool)

(assert (=> b!1506759 m!1389671))

(assert (=> b!1506759 m!1389671))

(assert (=> b!1506759 m!1389665))

(declare-fun m!1389673 () Bool)

(assert (=> b!1506759 m!1389673))

(declare-fun m!1389675 () Bool)

(assert (=> start!128500 m!1389675))

(declare-fun m!1389677 () Bool)

(assert (=> start!128500 m!1389677))

(push 1)

(assert (not b!1506757))

(assert (not start!128500))

(assert (not b!1506759))

(assert (not b!1506754))

(assert (not b!1506761))

(assert (not b!1506760))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

