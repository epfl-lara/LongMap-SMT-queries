; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128454 () Bool)

(assert start!128454)

(declare-fun b!1506478 () Bool)

(declare-fun res!1027011 () Bool)

(declare-fun e!841797 () Bool)

(assert (=> b!1506478 (=> (not res!1027011) (not e!841797))))

(declare-datatypes ((array!100466 0))(
  ( (array!100467 (arr!48477 (Array (_ BitVec 32) (_ BitVec 64))) (size!49029 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100466)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100466 (_ BitVec 32)) Bool)

(assert (=> b!1506478 (= res!1027011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506479 () Bool)

(declare-fun res!1027013 () Bool)

(assert (=> b!1506479 (=> (not res!1027013) (not e!841797))))

(declare-datatypes ((List!35038 0))(
  ( (Nil!35035) (Cons!35034 (h!36435 (_ BitVec 64)) (t!49724 List!35038)) )
))
(declare-fun arrayNoDuplicates!0 (array!100466 (_ BitVec 32) List!35038) Bool)

(assert (=> b!1506479 (= res!1027013 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35035))))

(declare-fun b!1506480 () Bool)

(declare-fun res!1027007 () Bool)

(assert (=> b!1506480 (=> (not res!1027007) (not e!841797))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506480 (= res!1027007 (validKeyInArray!0 (select (arr!48477 a!2804) i!961)))))

(declare-fun b!1506481 () Bool)

(declare-fun res!1027009 () Bool)

(assert (=> b!1506481 (=> (not res!1027009) (not e!841797))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1506481 (= res!1027009 (and (= (size!49029 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49029 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49029 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506482 () Bool)

(declare-fun res!1027008 () Bool)

(assert (=> b!1506482 (=> (not res!1027008) (not e!841797))))

(assert (=> b!1506482 (= res!1027008 (validKeyInArray!0 (select (arr!48477 a!2804) j!70)))))

(declare-fun b!1506483 () Bool)

(declare-fun res!1027010 () Bool)

(assert (=> b!1506483 (=> (not res!1027010) (not e!841797))))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1506483 (= res!1027010 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49029 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49029 a!2804))))))

(declare-fun b!1506484 () Bool)

(assert (=> b!1506484 (= e!841797 false)))

(declare-datatypes ((SeekEntryResult!12671 0))(
  ( (MissingZero!12671 (index!53079 (_ BitVec 32))) (Found!12671 (index!53080 (_ BitVec 32))) (Intermediate!12671 (undefined!13483 Bool) (index!53081 (_ BitVec 32)) (x!134831 (_ BitVec 32))) (Undefined!12671) (MissingVacant!12671 (index!53082 (_ BitVec 32))) )
))
(declare-fun lt!653973 () SeekEntryResult!12671)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100466 (_ BitVec 32)) SeekEntryResult!12671)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506484 (= lt!653973 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48477 a!2804) j!70) mask!2512) (select (arr!48477 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1027012 () Bool)

(assert (=> start!128454 (=> (not res!1027012) (not e!841797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128454 (= res!1027012 (validMask!0 mask!2512))))

(assert (=> start!128454 e!841797))

(assert (=> start!128454 true))

(declare-fun array_inv!37710 (array!100466) Bool)

(assert (=> start!128454 (array_inv!37710 a!2804)))

(assert (= (and start!128454 res!1027012) b!1506481))

(assert (= (and b!1506481 res!1027009) b!1506480))

(assert (= (and b!1506480 res!1027007) b!1506482))

(assert (= (and b!1506482 res!1027008) b!1506478))

(assert (= (and b!1506478 res!1027011) b!1506479))

(assert (= (and b!1506479 res!1027013) b!1506483))

(assert (= (and b!1506483 res!1027010) b!1506484))

(declare-fun m!1388811 () Bool)

(assert (=> b!1506482 m!1388811))

(assert (=> b!1506482 m!1388811))

(declare-fun m!1388813 () Bool)

(assert (=> b!1506482 m!1388813))

(declare-fun m!1388815 () Bool)

(assert (=> start!128454 m!1388815))

(declare-fun m!1388817 () Bool)

(assert (=> start!128454 m!1388817))

(assert (=> b!1506484 m!1388811))

(assert (=> b!1506484 m!1388811))

(declare-fun m!1388819 () Bool)

(assert (=> b!1506484 m!1388819))

(assert (=> b!1506484 m!1388819))

(assert (=> b!1506484 m!1388811))

(declare-fun m!1388821 () Bool)

(assert (=> b!1506484 m!1388821))

(declare-fun m!1388823 () Bool)

(assert (=> b!1506479 m!1388823))

(declare-fun m!1388825 () Bool)

(assert (=> b!1506480 m!1388825))

(assert (=> b!1506480 m!1388825))

(declare-fun m!1388827 () Bool)

(assert (=> b!1506480 m!1388827))

(declare-fun m!1388829 () Bool)

(assert (=> b!1506478 m!1388829))

(push 1)

(assert (not b!1506482))

(assert (not b!1506478))

(assert (not b!1506484))

(assert (not b!1506479))

(assert (not b!1506480))

(assert (not start!128454))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

