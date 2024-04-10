; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128820 () Bool)

(assert start!128820)

(declare-fun b!1509518 () Bool)

(declare-fun res!1029423 () Bool)

(declare-fun e!843124 () Bool)

(assert (=> b!1509518 (=> (not res!1029423) (not e!843124))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100676 0))(
  ( (array!100677 (arr!48575 (Array (_ BitVec 32) (_ BitVec 64))) (size!49125 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100676)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1509518 (= res!1029423 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49125 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49125 a!2804))))))

(declare-fun b!1509519 () Bool)

(declare-fun res!1029430 () Bool)

(assert (=> b!1509519 (=> (not res!1029430) (not e!843124))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100676 (_ BitVec 32)) Bool)

(assert (=> b!1509519 (= res!1029430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509520 () Bool)

(declare-fun res!1029427 () Bool)

(assert (=> b!1509520 (=> (not res!1029427) (not e!843124))))

(declare-datatypes ((List!35058 0))(
  ( (Nil!35055) (Cons!35054 (h!36466 (_ BitVec 64)) (t!49752 List!35058)) )
))
(declare-fun arrayNoDuplicates!0 (array!100676 (_ BitVec 32) List!35058) Bool)

(assert (=> b!1509520 (= res!1029427 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35055))))

(declare-fun b!1509521 () Bool)

(declare-fun res!1029421 () Bool)

(declare-fun e!843122 () Bool)

(assert (=> b!1509521 (=> (not res!1029421) (not e!843122))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12746 0))(
  ( (MissingZero!12746 (index!53379 (_ BitVec 32))) (Found!12746 (index!53380 (_ BitVec 32))) (Intermediate!12746 (undefined!13558 Bool) (index!53381 (_ BitVec 32)) (x!135136 (_ BitVec 32))) (Undefined!12746) (MissingVacant!12746 (index!53382 (_ BitVec 32))) )
))
(declare-fun lt!654919 () SeekEntryResult!12746)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100676 (_ BitVec 32)) SeekEntryResult!12746)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509521 (= res!1029421 (= lt!654919 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48575 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48575 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100677 (store (arr!48575 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49125 a!2804)) mask!2512)))))

(declare-fun b!1509523 () Bool)

(assert (=> b!1509523 (= e!843124 e!843122)))

(declare-fun res!1029422 () Bool)

(assert (=> b!1509523 (=> (not res!1029422) (not e!843122))))

(declare-fun lt!654918 () SeekEntryResult!12746)

(assert (=> b!1509523 (= res!1029422 (= lt!654919 lt!654918))))

(assert (=> b!1509523 (= lt!654918 (Intermediate!12746 false resIndex!21 resX!21))))

(assert (=> b!1509523 (= lt!654919 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48575 a!2804) j!70) mask!2512) (select (arr!48575 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509524 () Bool)

(declare-fun res!1029429 () Bool)

(assert (=> b!1509524 (=> (not res!1029429) (not e!843122))))

(assert (=> b!1509524 (= res!1029429 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48575 a!2804) j!70) a!2804 mask!2512) lt!654918))))

(declare-fun b!1509525 () Bool)

(declare-fun res!1029426 () Bool)

(assert (=> b!1509525 (=> (not res!1029426) (not e!843124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509525 (= res!1029426 (validKeyInArray!0 (select (arr!48575 a!2804) j!70)))))

(declare-fun b!1509526 () Bool)

(declare-fun res!1029425 () Bool)

(assert (=> b!1509526 (=> (not res!1029425) (not e!843124))))

(assert (=> b!1509526 (= res!1029425 (validKeyInArray!0 (select (arr!48575 a!2804) i!961)))))

(declare-fun b!1509527 () Bool)

(declare-fun res!1029424 () Bool)

(assert (=> b!1509527 (=> (not res!1029424) (not e!843124))))

(assert (=> b!1509527 (= res!1029424 (and (= (size!49125 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49125 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49125 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1029428 () Bool)

(assert (=> start!128820 (=> (not res!1029428) (not e!843124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128820 (= res!1029428 (validMask!0 mask!2512))))

(assert (=> start!128820 e!843124))

(assert (=> start!128820 true))

(declare-fun array_inv!37603 (array!100676) Bool)

(assert (=> start!128820 (array_inv!37603 a!2804)))

(declare-fun b!1509522 () Bool)

(assert (=> b!1509522 (= e!843122 (not true))))

(assert (=> b!1509522 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-datatypes ((Unit!50360 0))(
  ( (Unit!50361) )
))
(declare-fun lt!654917 () Unit!50360)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100676 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50360)

(assert (=> b!1509522 (= lt!654917 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!128820 res!1029428) b!1509527))

(assert (= (and b!1509527 res!1029424) b!1509526))

(assert (= (and b!1509526 res!1029425) b!1509525))

(assert (= (and b!1509525 res!1029426) b!1509519))

(assert (= (and b!1509519 res!1029430) b!1509520))

(assert (= (and b!1509520 res!1029427) b!1509518))

(assert (= (and b!1509518 res!1029423) b!1509523))

(assert (= (and b!1509523 res!1029422) b!1509524))

(assert (= (and b!1509524 res!1029429) b!1509521))

(assert (= (and b!1509521 res!1029421) b!1509522))

(declare-fun m!1392007 () Bool)

(assert (=> b!1509524 m!1392007))

(assert (=> b!1509524 m!1392007))

(declare-fun m!1392009 () Bool)

(assert (=> b!1509524 m!1392009))

(declare-fun m!1392011 () Bool)

(assert (=> start!128820 m!1392011))

(declare-fun m!1392013 () Bool)

(assert (=> start!128820 m!1392013))

(assert (=> b!1509523 m!1392007))

(assert (=> b!1509523 m!1392007))

(declare-fun m!1392015 () Bool)

(assert (=> b!1509523 m!1392015))

(assert (=> b!1509523 m!1392015))

(assert (=> b!1509523 m!1392007))

(declare-fun m!1392017 () Bool)

(assert (=> b!1509523 m!1392017))

(declare-fun m!1392019 () Bool)

(assert (=> b!1509522 m!1392019))

(declare-fun m!1392021 () Bool)

(assert (=> b!1509522 m!1392021))

(assert (=> b!1509525 m!1392007))

(assert (=> b!1509525 m!1392007))

(declare-fun m!1392023 () Bool)

(assert (=> b!1509525 m!1392023))

(declare-fun m!1392025 () Bool)

(assert (=> b!1509526 m!1392025))

(assert (=> b!1509526 m!1392025))

(declare-fun m!1392027 () Bool)

(assert (=> b!1509526 m!1392027))

(declare-fun m!1392029 () Bool)

(assert (=> b!1509520 m!1392029))

(declare-fun m!1392031 () Bool)

(assert (=> b!1509519 m!1392031))

(declare-fun m!1392033 () Bool)

(assert (=> b!1509521 m!1392033))

(declare-fun m!1392035 () Bool)

(assert (=> b!1509521 m!1392035))

(assert (=> b!1509521 m!1392035))

(declare-fun m!1392037 () Bool)

(assert (=> b!1509521 m!1392037))

(assert (=> b!1509521 m!1392037))

(assert (=> b!1509521 m!1392035))

(declare-fun m!1392039 () Bool)

(assert (=> b!1509521 m!1392039))

(push 1)

