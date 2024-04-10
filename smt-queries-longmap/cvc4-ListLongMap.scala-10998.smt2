; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128824 () Bool)

(assert start!128824)

(declare-fun b!1509578 () Bool)

(declare-fun res!1029486 () Bool)

(declare-fun e!843141 () Bool)

(assert (=> b!1509578 (=> (not res!1029486) (not e!843141))))

(declare-datatypes ((SeekEntryResult!12748 0))(
  ( (MissingZero!12748 (index!53387 (_ BitVec 32))) (Found!12748 (index!53388 (_ BitVec 32))) (Intermediate!12748 (undefined!13560 Bool) (index!53389 (_ BitVec 32)) (x!135138 (_ BitVec 32))) (Undefined!12748) (MissingVacant!12748 (index!53390 (_ BitVec 32))) )
))
(declare-fun lt!654936 () SeekEntryResult!12748)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100680 0))(
  ( (array!100681 (arr!48577 (Array (_ BitVec 32) (_ BitVec 64))) (size!49127 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100680)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100680 (_ BitVec 32)) SeekEntryResult!12748)

(assert (=> b!1509578 (= res!1029486 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48577 a!2804) j!70) a!2804 mask!2512) lt!654936))))

(declare-fun res!1029488 () Bool)

(declare-fun e!843142 () Bool)

(assert (=> start!128824 (=> (not res!1029488) (not e!843142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128824 (= res!1029488 (validMask!0 mask!2512))))

(assert (=> start!128824 e!843142))

(assert (=> start!128824 true))

(declare-fun array_inv!37605 (array!100680) Bool)

(assert (=> start!128824 (array_inv!37605 a!2804)))

(declare-fun b!1509579 () Bool)

(declare-fun res!1029489 () Bool)

(assert (=> b!1509579 (=> (not res!1029489) (not e!843142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100680 (_ BitVec 32)) Bool)

(assert (=> b!1509579 (= res!1029489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509580 () Bool)

(declare-fun res!1029490 () Bool)

(assert (=> b!1509580 (=> (not res!1029490) (not e!843142))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1509580 (= res!1029490 (and (= (size!49127 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49127 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49127 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509581 () Bool)

(declare-fun res!1029485 () Bool)

(assert (=> b!1509581 (=> (not res!1029485) (not e!843142))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509581 (= res!1029485 (validKeyInArray!0 (select (arr!48577 a!2804) j!70)))))

(declare-fun b!1509582 () Bool)

(declare-fun res!1029482 () Bool)

(assert (=> b!1509582 (=> (not res!1029482) (not e!843141))))

(declare-fun lt!654935 () SeekEntryResult!12748)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509582 (= res!1029482 (= lt!654935 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48577 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48577 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100681 (store (arr!48577 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49127 a!2804)) mask!2512)))))

(declare-fun b!1509583 () Bool)

(declare-fun res!1029483 () Bool)

(assert (=> b!1509583 (=> (not res!1029483) (not e!843142))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1509583 (= res!1029483 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49127 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49127 a!2804))))))

(declare-fun b!1509584 () Bool)

(declare-fun res!1029487 () Bool)

(assert (=> b!1509584 (=> (not res!1029487) (not e!843142))))

(declare-datatypes ((List!35060 0))(
  ( (Nil!35057) (Cons!35056 (h!36468 (_ BitVec 64)) (t!49754 List!35060)) )
))
(declare-fun arrayNoDuplicates!0 (array!100680 (_ BitVec 32) List!35060) Bool)

(assert (=> b!1509584 (= res!1029487 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35057))))

(declare-fun b!1509585 () Bool)

(declare-fun res!1029484 () Bool)

(assert (=> b!1509585 (=> (not res!1029484) (not e!843142))))

(assert (=> b!1509585 (= res!1029484 (validKeyInArray!0 (select (arr!48577 a!2804) i!961)))))

(declare-fun b!1509586 () Bool)

(assert (=> b!1509586 (= e!843141 (not true))))

(assert (=> b!1509586 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-datatypes ((Unit!50364 0))(
  ( (Unit!50365) )
))
(declare-fun lt!654937 () Unit!50364)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100680 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50364)

(assert (=> b!1509586 (= lt!654937 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1509587 () Bool)

(assert (=> b!1509587 (= e!843142 e!843141)))

(declare-fun res!1029481 () Bool)

(assert (=> b!1509587 (=> (not res!1029481) (not e!843141))))

(assert (=> b!1509587 (= res!1029481 (= lt!654935 lt!654936))))

(assert (=> b!1509587 (= lt!654936 (Intermediate!12748 false resIndex!21 resX!21))))

(assert (=> b!1509587 (= lt!654935 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48577 a!2804) j!70) mask!2512) (select (arr!48577 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!128824 res!1029488) b!1509580))

(assert (= (and b!1509580 res!1029490) b!1509585))

(assert (= (and b!1509585 res!1029484) b!1509581))

(assert (= (and b!1509581 res!1029485) b!1509579))

(assert (= (and b!1509579 res!1029489) b!1509584))

(assert (= (and b!1509584 res!1029487) b!1509583))

(assert (= (and b!1509583 res!1029483) b!1509587))

(assert (= (and b!1509587 res!1029481) b!1509578))

(assert (= (and b!1509578 res!1029486) b!1509582))

(assert (= (and b!1509582 res!1029482) b!1509586))

(declare-fun m!1392075 () Bool)

(assert (=> b!1509578 m!1392075))

(assert (=> b!1509578 m!1392075))

(declare-fun m!1392077 () Bool)

(assert (=> b!1509578 m!1392077))

(declare-fun m!1392079 () Bool)

(assert (=> start!128824 m!1392079))

(declare-fun m!1392081 () Bool)

(assert (=> start!128824 m!1392081))

(declare-fun m!1392083 () Bool)

(assert (=> b!1509585 m!1392083))

(assert (=> b!1509585 m!1392083))

(declare-fun m!1392085 () Bool)

(assert (=> b!1509585 m!1392085))

(declare-fun m!1392087 () Bool)

(assert (=> b!1509579 m!1392087))

(assert (=> b!1509581 m!1392075))

(assert (=> b!1509581 m!1392075))

(declare-fun m!1392089 () Bool)

(assert (=> b!1509581 m!1392089))

(declare-fun m!1392091 () Bool)

(assert (=> b!1509586 m!1392091))

(declare-fun m!1392093 () Bool)

(assert (=> b!1509586 m!1392093))

(assert (=> b!1509587 m!1392075))

(assert (=> b!1509587 m!1392075))

(declare-fun m!1392095 () Bool)

(assert (=> b!1509587 m!1392095))

(assert (=> b!1509587 m!1392095))

(assert (=> b!1509587 m!1392075))

(declare-fun m!1392097 () Bool)

(assert (=> b!1509587 m!1392097))

(declare-fun m!1392099 () Bool)

(assert (=> b!1509582 m!1392099))

(declare-fun m!1392101 () Bool)

(assert (=> b!1509582 m!1392101))

(assert (=> b!1509582 m!1392101))

(declare-fun m!1392103 () Bool)

(assert (=> b!1509582 m!1392103))

(assert (=> b!1509582 m!1392103))

(assert (=> b!1509582 m!1392101))

(declare-fun m!1392105 () Bool)

(assert (=> b!1509582 m!1392105))

(declare-fun m!1392107 () Bool)

(assert (=> b!1509584 m!1392107))

(push 1)

(assert (not b!1509586))

(assert (not b!1509585))

(assert (not b!1509581))

(assert (not b!1509579))

